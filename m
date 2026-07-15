Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E018C44511
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:47:49 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12385.1784134063351398319
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:47:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=moLDFSUV;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-451fd21113cso2134208fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134062; x=1784738862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SU1qe1JkusScSXM4S28nNRpp91kZihUrs1kQlMebpI=;
        b=moLDFSUVWSGlbrvGQ5Ve7rC4nuLvNMsAZ8gO6thEG3eYIvNDAViHlfA/c0aVhvG3JR
         fsqIDZ0DestjSnr1uSO3Nb9R91ASqseP3p3UIqYzi6Y4GOJIV+KgjcZNclmQBaeDwrz+
         QRsB3VQHiv9/NSH21iywzuB75Q0+z/jXm6awUpRPXIvYyuu9Kjk5WdQuM+3YLBf+OyrO
         Z+eFzGZaYtwzaPXOBTKRNgQ+hnyrYJqFejx12HL4PgGLEmVXIYw37VuXS7BlmwrJtQBS
         vxLT5HgbsZ4e3SCgNyaQ+ADlVIJtHaApMTNEA5BMCt/YHABaxeBrbIHIgedUGZeKXDRi
         +k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134062; x=1784738862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SU1qe1JkusScSXM4S28nNRpp91kZihUrs1kQlMebpI=;
        b=qYZXoHxx++ibNAAXmGk899Wx/hLsLU5TIJ1AM8yawoKyE9hatxZMPP5lUxRfDC3i8g
         GLmGxyQPvhRVwSQmoioSFEOFhsziROOdRlzRbfzyi5VKleBPG4FXacGoZyXdmEaND3cL
         Lslc6BOovoJtxto8L8gXt75f0VtJVfcPjRxmJgST7JB5MD5/ouo6D8MNKcxgwwWPSI/L
         hXMT+Bu5kWgBXIPyUUtk/pKDtfZ/mPhumQDR/cWfhFEp6jNxdm41l1OeCnpLwngH0803
         XKz6SrjuMFrZs4qZBYF7WZR3jhTI1yt2Nouyk616j+vNNc2GeJUQE5bEeUlLddjcTw55
         9mSQ==
X-Gm-Message-State: AOJu0YyOYAM1+SrQACw/338/qoPowugT/BEcgIQt9/nY3eQ+pHlHxxmz
	hR6EyaZw3yPq00Kf35ugQ7LschlZYURKFPVTV5sCgSHXYNvz2mCqlcM3ITHeNg==
X-Gm-Gg: AfdE7cl3A8EmmO9N09PRa0XF//R9qRo9QRVPeee0dyQmWUqjhH7AG2T8VgHvkbidRMU
	RRqHYyw0K+3owBBj4Q3fm+X1MuZh9ZCqfOsHlryQU5tJRcZZ2zK20/Qp6iU41hCfS+TKTO1iVQc
	+F/pfGqcgmsUvTeP3sJqvZJAT08VUPoJIfn2zVhqqFMK5/PFNXEnHo29uA4+eO3YbjwDxOFir9G
	q4sUOntsSQAsjL4CJl4Cev22Y9sGcsz6ZRv6VIYFwbwkn9GlMlqVvLTUeXb5rXuz465w+8TkjUe
	ZkYd4HrU6+KKxEoCRNUAPl6cBTVrUtSsVUceP8d302vfQEk0AkYgLCz5A4y5LpTdVEIWV8yt8xi
	XmwUVKZtFxcKzAWHAAE77D59a2eX0P6ufJB5NWvabzUCDnBYSSAeXixq9BbNpVyDZUJ5AyKv2ny
	oKq1mq+erl
X-Received: by 2002:a05:6871:7aa:b0:424:801:49fe with SMTP id 586e51a60fabf-4565589c405mr88905fac.8.1784134062495;
        Wed, 15 Jul 2026 09:47:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:47:42 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 01/25] scripts/pull-spdx-licenses.py: Add exceptions
Date: Wed, 15 Jul 2026 10:44:57 -0600
Message-ID: <20260715164739.364323-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240994

Adds exceptions to the script that updates the SPDX license files

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/pull-spdx-licenses.py | 124 ++++++++++++++++++++++++----------
 1 file changed, 87 insertions(+), 37 deletions(-)

diff --git a/scripts/pull-spdx-licenses.py b/scripts/pull-spdx-licenses.py
index 597a62133f..7d1715ff24 100755
--- a/scripts/pull-spdx-licenses.py
+++ b/scripts/pull-spdx-licenses.py
@@ -13,6 +13,88 @@ from pathlib import Path
 TOP_DIR = Path(__file__).parent.parent
 
 
+def update_licenses(dest, version, overwrite, deprecated):
+    print(f"Pulling SPDX license list version {version}")
+    req = urllib.request.Request(
+        f"https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/licenses.json"
+    )
+    with urllib.request.urlopen(req) as response:
+        spdx_licenses = json.load(response)
+
+    with (TOP_DIR / "meta" / "files" / "spdx-licenses.json").open("w") as f:
+        json.dump(spdx_licenses, f, sort_keys=True, indent=2)
+
+    total_count = len(spdx_licenses["licenses"])
+    updated = 0
+    for idx, lic in enumerate(spdx_licenses["licenses"]):
+        lic_id = lic["licenseId"]
+
+        print(f"[{idx + 1} of {total_count}] ", end="")
+
+        dest_license_file = dest / lic_id
+        if dest_license_file.is_file() and not overwrite:
+            print(f"Skipping {lic_id} since it already exists")
+            continue
+
+        print(f"Fetching {lic_id}... ", end="", flush=True)
+
+        req = urllib.request.Request(lic["detailsUrl"])
+        with urllib.request.urlopen(req) as response:
+            lic_data = json.load(response)
+
+        if lic_data["isDeprecatedLicenseId"] and not deprecated:
+            print("Skipping (deprecated)")
+            continue
+
+        with dest_license_file.open("w") as f:
+            f.write(lic_data["licenseText"])
+        updated += 1
+        print("done")
+
+    return updated
+
+
+def update_exceptions(dest, version, overwrite, deprecated):
+    print(f"Pulling SPDX license exceptions list version {version}")
+    req = urllib.request.Request(
+        f"https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/exceptions.json"
+    )
+    with urllib.request.urlopen(req) as response:
+        spdx_exceptions = json.load(response)
+
+    with (TOP_DIR / "meta" / "files" / "spdx-exceptions.json").open("w") as f:
+        json.dump(spdx_exceptions, f, sort_keys=True, indent=2)
+
+    total_count = len(spdx_exceptions["exceptions"])
+    updated = 0
+    for idx, lic in enumerate(spdx_exceptions["exceptions"]):
+        lic_id = lic["licenseExceptionId"]
+
+        print(f"[{idx + 1} of {total_count}] ", end="")
+
+        dest_license_file = dest / lic_id
+        if dest_license_file.is_file() and not overwrite:
+            print(f"Skipping {lic_id} since it already exists")
+            continue
+
+        print(f"Fetching {lic_id}... ", end="", flush=True)
+
+        req = urllib.request.Request(lic["detailsUrl"])
+        with urllib.request.urlopen(req) as response:
+            lic_data = json.load(response)
+
+        if lic_data["isDeprecatedLicenseId"] and not deprecated:
+            print("Skipping (deprecated)")
+            continue
+
+        with dest_license_file.open("w") as f:
+            f.write(lic_data["licenseExceptionText"])
+        updated += 1
+        print("done")
+
+    return updated
+
+
 def main():
     parser = argparse.ArgumentParser(
         description="Update SPDX License files from upstream"
@@ -55,44 +137,12 @@ def main():
             data = json.load(response)
             version = data["tag_name"]
 
-    print(f"Pulling SPDX license list version {version}")
-    req = urllib.request.Request(
-        f"https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/licenses.json"
+    license_count = update_licenses(args.dest, version, args.overwrite, args.deprecated)
+    exception_count = update_exceptions(
+        args.dest, version, args.overwrite, args.deprecated
     )
-    with urllib.request.urlopen(req) as response:
-        spdx_licenses = json.load(response)
-
-    with (TOP_DIR / "meta" / "files" / "spdx-licenses.json").open("w") as f:
-        json.dump(spdx_licenses, f, sort_keys=True, indent=2)
-
-    total_count = len(spdx_licenses["licenses"])
-    updated = 0
-    for idx, lic in enumerate(spdx_licenses["licenses"]):
-        lic_id = lic["licenseId"]
-
-        print(f"[{idx + 1} of {total_count}] ", end="")
-
-        dest_license_file = args.dest / lic_id
-        if dest_license_file.is_file() and not args.overwrite:
-            print(f"Skipping {lic_id} since it already exists")
-            continue
-
-        print(f"Fetching {lic_id}... ", end="", flush=True)
-
-        req = urllib.request.Request(lic["detailsUrl"])
-        with urllib.request.urlopen(req) as response:
-            lic_data = json.load(response)
-
-        if lic_data["isDeprecatedLicenseId"] and not args.deprecated:
-            print("Skipping (deprecated)")
-            continue
-
-        with dest_license_file.open("w") as f:
-            f.write(lic_data["licenseText"])
-        updated += 1
-        print("done")
-
-    print(f"Updated {updated} licenses")
+    print(f"Updated {license_count} licenses")
+    print(f"Updated {exception_count} exceptions")
 
     return 0
 
-- 
2.54.0


