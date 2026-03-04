Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCF3EF9008
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:57 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23111.1772642927684437052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igWjzhg8;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d513bc15c7so8721905a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642927; x=1773247727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH0P+1ESZgjWAPDC3epT+SOFN7MIIdYB7o7a9YkSZhs=;
        b=igWjzhg8h0m9rGNaevK5t4QBfPFNBG00wnSusQ3ja715jaGZRxtMMW2QaWLTcJ4gU5
         cCZVYn1n8OgnfsMYLxpBfkqEJHpEAA84O2aU/B5QhINXJKcns3mLHJWvM4UoSE5rEbHw
         T55EEw6I0XluhKbRq4JIk9Z8sdonwMWXwPNKEOcObldxxV/I7naRDXEWPPKaTc8hzGkT
         9qSBzpYH7FWfRAm44WiRredje16j+LY25Vp+kDhW/OMgKGvYt0XXEEAqkVrnxoFJcQlP
         46kuQZLIEsVJBdYwY26KFog0bs9OjHaEj/DKU+1yBD6bp0zw7hu55RN98iVuMoJNajl3
         fabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642927; x=1773247727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pH0P+1ESZgjWAPDC3epT+SOFN7MIIdYB7o7a9YkSZhs=;
        b=CLCaDqzOmUbnF5Wx6rUbK6ZKTVD+gO0xm6lweF8SoYhJsl4esVqn9//elpZtIIXVHE
         fDDjWHeoqUQKGuZGRuV4ROmRW8jxR3B0nAvKI6xR7cBtflrt6dIq1stVyr16ba9/VeHm
         O5bUsU8/cxt+IPcO++qIOLo3UqF3lj0U8iLOqw91f78zMabMUfVe6hB5ID5QXWTY8a1d
         Ypnsh21a8PZOlV5PZr7ZkB6O4N1PMYVN2XLkYgojpSM8tCkBfGFjj4YSsOv86+kFmM9v
         Mog8t5DXqeHzFgggG0zwZInPmAhgvFNcN3pOObTyPEJTTlhsG5tb65K15h5FBbAK1sqv
         qAGg==
X-Gm-Message-State: AOJu0YzkWyWz3NszhGCPL7+bgwqyLOu0rJvZqASWBsU1r3Ya4WvRxCLO
	X7QB9whLfoghVqdz+O6YJGrXnj/WcwyoHkxt44w8DcxfXktGpUWEJdX3gfqDIA==
X-Gm-Gg: ATEYQzzyyo1dJ09vCTRu2HTo7h04QnuFShc1gEyPG87J/t4vFJDCWO8a4V8+leNi0qC
	q1oodhkAnCxMbR0RrVckpRqL2d8tEDJgkmG902+cQzMC6lGc7ociFkLejTW5zvlGZYU15Rjn5ON
	8EVl83gCDB8Q0Dx4iUCLxlguV7lgA3dq6yDU0R4hKIgDT28dkQ1iY9qxNusRDlFOgtrEqsdFeZK
	jksoW6I7IP2YdjgiGClIJHc5cJ/JcUrLaIsUISGUA/Ls5nPGLHfNWy843mBJobJvSjA++jMpfzd
	wEBLX8UJwK2ATw/a2IZdwpEkV14nh03yvqKOCMl04oc6pp1VsADW2G3RhXRQof18kfOBpSXrj2z
	8L7NxxsmzNWUNRrinCclZefdYZ+tOr/n3D0nUpKFMGtfLXCPHxNmbcZ+NWMAkWkdZ7jXpgtNAmf
	XoRqMbG4qhFvE7fIDNu7Fx
X-Received: by 2002:a05:6808:3094:b0:44d:a3e3:40a9 with SMTP id 5614622812f47-4651ab4dfecmr1071891b6e.8.1772642926646;
        Wed, 04 Mar 2026 08:48:46 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 11/13] spdx: Remove fatal errors for missing providers
Date: Wed,  4 Mar 2026 09:44:22 -0700
Message-ID: <20260304164835.3072507-12-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232400

When creating images and SDKs, do not error on missing providers. This
allows recipes to use the `nospdx` inherit to prevent SPDX from being
generated, but not result in an error when assembling the final image.

Note that runtime packages generation already ignored missing
providers, so this is changing image and SDK generation to match

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 3 ++-
 meta/lib/oe/spdx30_tasks.py          | 8 +-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3288cdf75a..aa39208eae 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -858,7 +858,8 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     if packages:
         for name in sorted(packages.keys()):
             if name not in providers:
-                bb.fatal("Unable to find SPDX provider for '%s'" % name)
+                bb.note("Unable to find SPDX provider for '%s'" % name)
+                continue
 
             pkg_name, pkg_hashfn = providers[name]
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 887fac813a..ba15d74278 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1251,11 +1251,10 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
     providers = oe.spdx_common.collect_package_providers(d)
 
     build_deps = set()
-    missing_providers = set()
 
     for name in sorted(packages.keys()):
         if name not in providers:
-            missing_providers.add(name)
+            bb.note(f"Unable to find SPDX provider for '{name}'")
             continue
 
         pkg_name, pkg_hashfn = providers[name]
@@ -1274,11 +1273,6 @@ def collect_build_package_inputs(d, objset, build, packages, files_by_hash=None)
             for h, f in pkg_objset.by_sha256_hash.items():
                 files_by_hash.setdefault(h, set()).update(f)
 
-    if missing_providers:
-        bb.fatal(
-            f"Unable to find SPDX provider(s) for: {', '.join(sorted(missing_providers))}"
-        )
-
     if build_deps:
         objset.new_scoped_relationship(
             [build],
-- 
2.53.0


