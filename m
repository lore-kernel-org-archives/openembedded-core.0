Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25503C4450F
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1650.1784055849940238000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mvRZhPEX;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-44aeefa1c00so2032431fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055849; x=1784660649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SU1qe1JkusScSXM4S28nNRpp91kZihUrs1kQlMebpI=;
        b=mvRZhPEXyN1UnYbvibZVHgaspJsH1RYfwnx+gJhT2/YVnvp+i3ZgLG08tjRF+zXzGc
         gnzuym3AkZuAJsYjdGI8TnyB0wWJlN18jBUBM3vXlLNxeovg/dcMN1nDUoJL7e6twKeD
         LRLBJTAqmQo4rOmDzYoOwl25BzyihLWc8Pxn1pYZF3YauLV6jneHoTr/w4YVHamu0esa
         LyollEHujGpWrkO2y1o34xgii48/1RK4BwTw9be51fyQ8UxH5garOXK73aJRKyVTKFr9
         kaubbVxWpkfCAU82dyhraOKrH5pbMom+AY96KHLsE0hXugnQ+mIEYic/5fgKvJHCDsZ9
         XILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055849; x=1784660649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2SU1qe1JkusScSXM4S28nNRpp91kZihUrs1kQlMebpI=;
        b=atLBuT8lrZZhXxxG3es0mtuDt1H8doulreD2DNoxCHTxhadnDsly8PIAemyil3qMTK
         vcf/U9tDBZUzSyc58ckUKX4Z2+f0zvhmOktlYwJvlpqHpVm+/e8jenwmjAO0TrkL1xcV
         shlRZtTuuXkh9Mg7Yz10vAo5A+sBctNtRgzYQ/FDtp05oKQSnkdHFBDyK0apUYPbC7da
         GnbHl+aWUBZ/PiS3fOXbspzTAl5AyR3/yY3j0ZNjIzJI7FCuD0o+Fw1v+C3DAXICBpLb
         J+6fKe6y7K71yjUyAK09cZjHv04BuKv6fAzGPm4LfHJIze5veVpofEgrtXP5S8V0C7Lo
         CQyA==
X-Gm-Message-State: AOJu0YxeVV54nN33HKCs2A39/tp/SMB5jpVfUcq/Ricjbsx1K5xeS8Uu
	bE3ukDefI4P7fJ/23eDiPE4Nqypo7+SiwCwHZ1zGrzbye95we+jQ9+QDaJjcLA==
X-Gm-Gg: AfdE7clKPrunn6DRNeDy21ZpfREZFgu/777klPGG6VT9jkPi1TXNUF/6Dcz0S8dOxbc
	IKCPV3Sfd9aMst6vTMXvBsYyd07vhX/3WkS8vGzdZnnGKzRMqxD7/XB6xnUSYfJx/DFFpe9pxNg
	qCdr3PSF6U852F86Te9OkGG8u9bXK3VSugFnZEuPLRP4nDpAMjNCwqCjOGUM2IIjab8eD1xeCVM
	YimmQH1+XTHGjuuMC2tUUW5JX+LT10SdXjw+SfK3MEyBA55EWHQqbO+iFxpbg2NC8BpgBlU1s7i
	pcBKd77UWjMzTzIitP6lnS4J8VRyfNV3GZ93hny273Dat49mOd8e8qnmSavmHbrWJTX+oamAlfC
	Q4VRYolZIeqxKnHlxrhp0XGFxN9h8AEACn/oGUc6Lui/2NUpO74pTpWEGvllFQUMpJONorxWcNk
	jxyJu3BjBvZQ==
X-Received: by 2002:a05:6870:d201:b0:43d:1c8a:5977 with SMTP id 586e51a60fabf-451bb1d97f0mr9670777fac.24.1784055849058;
        Tue, 14 Jul 2026 12:04:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:08 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 01/22] scripts/pull-spdx-licenses.py: Add exceptions
Date: Tue, 14 Jul 2026 12:31:11 -0600
Message-ID: <20260714190405.3328796-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240909

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


