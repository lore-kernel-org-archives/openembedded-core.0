Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.221.1795827021951489048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 16:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r0JlX0FZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: c137.marques@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so5946617f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 16:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795827020; x=1796431820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOVNoKUzyS9F/2REvZwPGDQCIbxkdeeMtkveVkJqOgo=;
        b=r0JlX0FZ8neB3yPNcSNKjnnsppBTgAn7zdZ45hWrmWm2mjzJrYW3VsNSIyD5T6qwOO
         kROiJusa7Yv0hwG+JXpc5nVCDUnZMtPbCjLPucvhaYDCNyHDI799yyUGHPWLuTm3ydSt
         68nmnoUJeXhb31S1YFOsWiKnueyxbVRFQfvdm3zlQ8BQ4C8fmCO3OW1mL88wfob22QNA
         GbvIwHI/UoyiBlJGBxIeL3cXL5QrC2RxXSiDdPsRkTNOJ1kUSeheJgXmw7LW8n9qafZQ
         7gx9YuubJOaHLTF7x3y/tR+5gjB7LJjaoR0LW80pQYm0PiSbuCKYQqAkhKWpmuZZCnNj
         zawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827020; x=1796431820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IOVNoKUzyS9F/2REvZwPGDQCIbxkdeeMtkveVkJqOgo=;
        b=i5T4gQ27BuxxWADlWipGeCs3NNq1qhZltc4oczdcEB7mMRJo/BUDSHSLkqk9V/3Q7e
         oK9e45wYmjvuWFCRKA68wFD3FpgO3oO0QliTFZ+fNnImp9kaDriwsrV8iDK1kSjukmiv
         6kHbWyWO5lPOGCScsRmAttQ4hFQjSueCb4eA+17fgwrQ89wSIxzpQr7Z5IHGSDtWLsLJ
         epyzcYF/ChIcWeM1xp39IGa8OIKkowbzFIWtitc4CnZh2B7FQLRY7EGEfPKhqAEoh3do
         3YQtD3vrfeWwW+FCgav9LPpMb5zA1HIx+dlxISQZlFogs8b6JdSgCqddT6FGfXItqXzV
         Ww+A==
X-Gm-Message-State: APuU4Z/qWiCv/0fcmHAuZrOrk/pFyPD5ut7pJjfuZb8pQTcbFcbH11Am
	Yr3r5sb2uow5t7GMrs6BVvHcKhMlkR86z7/GOj95E6b1IkUnhbvfVWjIcOwm1W0M
X-Gm-Gg: AZFdTZfe4ZvTpEmlCI8lbesskT5jKPR0qIgAs9X9CwpTzp/LkIo4U5Ta6Cc+CS2IXTJ
	DcvoNsGCifGyCTJQUy3nTWkxTAks13G3pungZeb1pbRwvT5Abn5Uwc+NqFzsOHoT+DV2nFIxwMS
	cGAxLquiUfL/JvOqxb5ZLNDwGWj1MSjzTSz/9SEmI3Hoau7h24/IuYYBaEb4LwkpgalMEGCaeaC
	+hg5y4LxrVjOHXe0Vu7f87PUyP85g4jDHHp9OERRwzQsAMYwrj0Fl+TnpzVK8f/41CjsjdxvSoJ
	SZgRz6Cfw+sC7mEnoH9AxhE4rgjdjSHavsMd2OrHXXZ82cA2MlpAngDkGDKx0I9nAjMrevP0AV0
	lkK4bSKjins/aF768BGQC+o2N0q5QJP8yhKcugMJOATGa5k/nKlQgj2p4Dbl/qZG4tzVk3KGeSA
	xgNbPTVmBEphmww2T0Oz1652NFchoPEHgsoHgtQC2H/OqtUERglc/Vyh2ykPc9BFeb0TRlMzMmq
	6uXeH6azjenLUNGdf8kLStb579C863Cn82teCPVbecKnV9ZSxvO40wVfdblxPEXfqWD8FcEnU96
	g3Dtu522gK21IoFxY7ROJA==
X-Received: by 2002:a05:6000:401f:b0:48e:7475:fe7b with SMTP id ffacd0b85a97d-4aa545e305fmr54113862f8f.6.1795827020149;
        Fri, 27 Nov 2026 16:50:20 -0800 (PST)
Return-Path: <c137.marques@gmail.com>
Received: from pc ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm46864646f8f.18.2026.11.27.16.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:50:19 -0800 (PST)
From: Alexandre Marques <c137.marques@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
Subject: [wrynose][PATCH 1/2] spdx30_tasks: include the SDK target packages in the SDK SBOM
Date: Sat, 28 Nov 2026 00:50:08 +0000
Message-ID: <20261128005009.4101905-2-c137.marques@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128005009.4101905-1-c137.marques@gmail.com>
References: <20261128005009.4101905-1-c137.marques@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 00:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251468
Content-Type: text/plain; charset="utf-8"

From: Prasanth R <ragaprasanth@gmail.com>

The SDK target and host parts both write sdk-rootfs.spdx.json. The host
part runs last and overwrites the target one, so the SDK SBOM lists the
nativesdk packages but none of the target sysroot packages.

Write separate target and host documents, with their own build IDs, and
include both in the SDK SBOM.

SPDX 2.2 wrote separate host and target SBOMs, so this was lost when
the SDK SBOM moved to SPDX 3.0.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06452702d0694c13534555e7097a772641c39f19)
Signed-off-by: Alexandre Marques <alexandre.marques@ctw.bmwgroup.com>
---
 meta/lib/oe/spdx30_tasks.py | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 62fc41f51a..953a4ba052 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1588,7 +1588,9 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     )
     set_timestamp_now(d, sdk_rootfs, "builtTime")
 
-    sdk_build = objset.add_root(objset.new_task_build("sdk-rootfs", "sdk-rootfs"))
+    sdk_build = objset.add_root(
+        objset.new_task_build("sdk-rootfs-" + sdk_type, "sdk-rootfs")
+    )
     set_timestamp_now(d, sdk_build, "build_buildEndTime")
 
     objset.new_scoped_relationship(
@@ -1601,28 +1603,36 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     collect_build_package_inputs(d, objset, sdk_build, sdk_packages)
 
     objset.add_aliases()
-    oe.sbom30.write_jsonld_doc(d, objset, spdx_work_dir / "sdk-rootfs.spdx.json")
+    oe.sbom30.write_jsonld_doc(
+        d, objset, spdx_work_dir / ("sdk-rootfs-%s.spdx.json" % sdk_type)
+    )
 
 
 def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
-    # Load the document written earlier
-    rootfs_objset = oe.sbom30.load_jsonld(
-        d, spdx_work_dir / "sdk-rootfs.spdx.json", required=True
-    )
+    # Load the target and host documents written earlier
+    rootfs_objsets = []
+    rootfs = []
+    for sdk_type in ("target", "host"):
+        objset = oe.sbom30.load_jsonld(
+            d, spdx_work_dir / ("sdk-rootfs-%s.spdx.json" % sdk_type), required=True
+        )
+        root = objset.find_root(oe.spdx30.software_Package)
+        if root is None:
+            bb.fatal("Unable to find %s rootfs artifact" % sdk_type)
+        rootfs_objsets.append(objset)
+        rootfs.append(root)
+
+    rootfs_objset = rootfs_objsets[0]
 
     # Create a new build for the SDK installer
     sdk_build = rootfs_objset.new_task_build("sdk-populate", "sdk-populate")
     set_timestamp_now(d, sdk_build, "build_buildEndTime")
 
-    rootfs = rootfs_objset.find_root(oe.spdx30.software_Package)
-    if rootfs is None:
-        bb.fatal("Unable to find rootfs artifact")
-
     rootfs_objset.new_scoped_relationship(
         [sdk_build],
         oe.spdx30.RelationshipType.hasInput,
         oe.spdx30.LifecycleScopeType.build,
-        [rootfs],
+        rootfs,
     )
 
     files = set()
@@ -1669,7 +1679,7 @@ def create_sdk_sbom(d, sdk_deploydir, spdx_work_dir, toolchain_outputname):
         bb.warn(f"No SDK output files found in {sdk_deploydir}")
 
     objset, sbom = oe.sbom30.create_sbom(
-        d, toolchain_outputname, sorted(list(files)), [rootfs_objset]
+        d, toolchain_outputname, sorted(list(files)), rootfs_objsets
     )
 
     # Set supplier on root elements if SPDX_SDK_SUPPLIER is defined
