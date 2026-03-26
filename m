Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC8C10AB80A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 19:04:37 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56622.1774551875543640026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 12:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qjHtVHV9;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82985f42664so829250b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774551875; x=1775156675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=57R2bkg1QKieUTSj7i6eCMjgHuYeNiZivLj4Z7n+vQs=;
        b=qjHtVHV9tIS0q0+y+VV0FsBtCnEkuUqfR5+pGOslTgG3j+kYyXvJrvpZP1me+VqDZK
         zW4fsphZfidd2FKRNwyZx9ajIwVT79BEva+/+s+2sN6BPNYPnqKDz/0vm4sHCB7QG7v3
         /8FdviRhctxLUXBnxDD1Oa8CcoNSvrBB7V3alVj6jgR8j0CmugTHFCU30odK4WxzjbdN
         7VpxvCsYZkA4+7ITKRBpLAYzhBjbtTGSxGRng5o1uArvOLtiZvkovr3YXmtaOxKfjIV9
         3yhxxTjaOwBPNx0k1G+Qp8G8LVkFXvFkDpepBXYI3GWAyzdyPGzQ5lN4OXEnnyWU2xTl
         GVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551875; x=1775156675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57R2bkg1QKieUTSj7i6eCMjgHuYeNiZivLj4Z7n+vQs=;
        b=BPDefYXvYL1MYWm0fwD0yxzmnLx9QAvUkIwpiaDvHggNQH1z/845SoHHTo/EIM8DTo
         HCvNDnmxnEx1pc8wiugmkDMaaWNP+X8LXos6ZKuTAcnMK06dsU2Xt25Vm+mWgtlOoT1K
         0eLh5AD+gWM/MGBdqF6457voU4bc4z/Z2bAKgYZASkHJlCEND9DJZVk2bQro4i2zjOm7
         x6/79Xe2Wo1LROzkHrDtYTVsDMlGXyo90QCtF3kyOB5S9JZGWjdxQ6YBOJP9cmZzDrVS
         EfXBI4b8CqzHftp23L1//UQFCa+0mGL3It/VaC/IkSTiAZszGVHc4b14XcYfBo/tJAUc
         zugg==
X-Gm-Message-State: AOJu0YwyBpCmOTB0+M4SkYp1hnl8+CEKkLVz/2XgdtidBijySfTEvIbh
	3YdZ7U1MFGXX99eE++v+nd4By0f3/BknvO9UvcNAz1/+VUKPNKccklxvFPonxp+P
X-Gm-Gg: ATEYQzyJRZR9gQCezza5JjQPeH2XWAK+iTdisMhwCi8hTRDUbXNMX+OQRqzlcveXojf
	Wdp8KFCmSfXPUNliAeTbig4NEz3V3nIU/Dpdef1X1G5Xk4KAbb71lVoxCEmwaxbdMVejJxMisHx
	DwA4e8hPAks8e2eiJnMhVC41L/oKngmm5BEgJ4aFW+5HbFe/7F8xB61kj2E6nRmU33dkQs5Y7GK
	+85fMcso8ENAge8QHr0Yo1wImllGyA96Gjp76X+t1BQXCn8/Qxx1nni1JwSdMZyUXJVa/9FC77q
	fVht6anrC5NBmCC2wM4h4+00CzUKDG1Zzyz2xT3ztRtASmB0/HpefKxtkHWmshPNlohfpdwxG78
	LQa4/S5chqDtXa8PWJ5s5zywzVIJqTbVly+4koCA0KUecrOC1sbZXxYCnJFOaSMb5y00O66T98A
	PR1G5gIgbdsODsyM2A3G/qRIFYpAZxspNYTro=
X-Received: by 2002:a05:6a00:1ac7:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82c6dfb1e09mr8521986b3a.30.1774551874445;
        Thu, 26 Mar 2026 12:04:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3f8a51sm3345437b3a.60.2026.03.26.12.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 12:04:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2] vte: upgrade 0.82.2 -> 0.84.0
Date: Fri, 27 Mar 2026 08:04:27 +1300
Message-ID: <20260326190427.2198044-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 19:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234044

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch which is now merged in simdutf[1] v7.7.1 used by vte[2]

[1] https://github.com/simdutf/simdutf/commit/c6f8e887ef51bb80dd978180042b9b9f4f46800f
[1] https://gitlab.gnome.org/GNOME/vte/-/blob/0.84.0/subprojects/simdutf.wrap?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rt-reproducibility-for-debug-sources.patch | 48 -------------------
 .../vte/{vte_0.82.2.bb => vte_0.84.0.bb}      |  3 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
 rename meta/recipes-support/vte/{vte_0.82.2.bb => vte_0.84.0.bb} (93%)

diff --git a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch b/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
deleted file mode 100644
index 20e8f71c0e..0000000000
--- a/meta/recipes-support/vte/vte/0001-support-reproducibility-for-debug-sources.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0959004adbe46f88d558d2ce61b496c662c196f5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 3 Nov 2025 06:13:11 +0000
-Subject: [PATCH] support reproducibility for debug sources
-
-While option --debug-sources is used, the generated source file contains
-build path comments which caused the build is not reproducible [1]
-...subprojects/simdutf/simdutf.h...
- 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
- 2 /* begin file include/simdutf.h */
- 3 // /build-dir/vte-0.82.1/subprojects/simdutf/include/simdutf.h:1
- 4 #ifndef SIMDUTF_H
-...subprojects/simdutf/simdutf.h...
-
-After apply this commit, use relative path to instead
-...subprojects/simdutf/simdutf.h...
- 1 /* auto-generated on 2025-03-17 16:13:41 -0400. Do not edit! */
- 2 /* begin file include/simdutf.h */
- 3 // include/simdutf.h:1
- 4 #ifndef SIMDUTF_H
-...subprojects/simdutf/simdutf.h...
-
-[1] https://reproducible-builds.org/
-
-Upstream-Status: Submitted [https://github.com/simdutf/simdutf/pull/848]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- singleheader/amalgamate.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/singleheader/amalgamate.py b/singleheader/amalgamate.py
-index 190b2f6..75e0d78 100755
---- a/singleheader/amalgamate.py
-+++ b/singleheader/amalgamate.py
-@@ -385,7 +385,8 @@ def filter_features(file):
-                 current_features = None
-             elif enabled:
-                 if context.args.debug_sources and not prev_line.endswith('\\'):
--                    yield f"// {file}:{lineno}"
-+                    RELFILE = os.path.relpath(file, PROJECTPATH)
-+                    yield f"// {RELFILE}:{lineno}"
- 
-                 if line or (not line and prev_line):
-                     yield line
--- 
-2.48.1
-
diff --git a/meta/recipes-support/vte/vte_0.82.2.bb b/meta/recipes-support/vte/vte_0.84.0.bb
similarity index 93%
rename from meta/recipes-support/vte/vte_0.82.2.bb
rename to meta/recipes-support/vte/vte_0.84.0.bb
index d5dced4ce6..2a31c9998c 100644
--- a/meta/recipes-support/vte/vte_0.82.2.bb
+++ b/meta/recipes-support/vte/vte_0.84.0.bb
@@ -18,10 +18,9 @@ GIDOCGEN_MESON_OPTION = "docs"
 inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
-            file://0001-support-reproducibility-for-debug-sources.patch;patchdir=./subprojects/simdutf \
 "
 
-SRC_URI[archive.sha256sum] = "e1295aafc4682b3b550f1235dc2679baa0f71570d8ed543c001c1283d530be91"
+SRC_URI[archive.sha256sum] = "0414e31583836aeb7878da25f67c515f7e8879917ecc37c92e26b83e8d8fc3e3"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

