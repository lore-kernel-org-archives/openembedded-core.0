Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89356C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 10:45:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.3863.1662633935445071629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 03:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E03B1516;
	Thu,  8 Sep 2022 03:45:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 642683F71A;
	Thu,  8 Sep 2022 03:45:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] gcc: remove obsolete MinGW patch
Date: Thu,  8 Sep 2022 11:45:31 +0100
Message-Id: <20220908104531.281820-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908104531.281820-1-ross.burton@arm.com>
References: <20220908104531.281820-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 10:45:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170456

This patch appears to be obsoleted by 217d5be, in GCC 11.1 onwards.

    libstdc++: Test errno macros directly for all targets [PR 93151]

    This applies the same changes to the djgpp and mingw versions of
    error_constants.h as r11-6137 did for the generic version.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-12.2.inc        |  1 -
 ...ngw32-Enable-operation_not_supported.patch | 26 -------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-ope=
ration_not_supported.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-12.2.inc
index 02dc59db631..0dbbecad4ad 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.2.inc
@@ -58,7 +58,6 @@ SRC_URI =3D "${BASEURI} \
            file://0019-Re-introduce-spe-commandline-options.patch \
            file://0020-libgcc_s-Use-alias-for-__cpu_indicator_init-inste=
ad-.patch \
            file://0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
-           file://0022-mingw32-Enable-operation_not_supported.patch \
            file://0023-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0024-Fix-install-path-of-linux64.h.patch \
            file://0026-rust-recursion-limit.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-operation_=
not_supported.patch b/meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-o=
peration_not_supported.patch
deleted file mode 100644
index f88ad51ee8a..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0022-mingw32-Enable-operation_not_sup=
ported.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 061cf79e7b6e89fdf0f2630ddaebbf1d7b271ac3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 May 2020 10:39:09 -0700
-Subject: [PATCH] mingw32: Enable operation_not_supported
-
-Fixes nativesdk build errors on mingw32 gcc-runtime
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libstdc++-v3/config/os/mingw32/error_constants.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libstdc++-v3/config/os/mingw32/error_constants.h b/libstdc+=
+-v3/config/os/mingw32/error_constants.h
-index da5f4c2ac85..e855c86267c 100644
---- a/libstdc++-v3/config/os/mingw32/error_constants.h
-+++ b/libstdc++-v3/config/os/mingw32/error_constants.h
-@@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
- #ifdef EPERM
-       operation_not_permitted =3D 		EPERM,
- #endif
--//    operation_not_supported =3D 		EOPNOTSUPP,
-+      operation_not_supported =3D 		EOPNOTSUPP,
- #ifdef EWOULDBLOCK
-       operation_would_block =3D 			EWOULDBLOCK,
- #endif
--=20
2.34.1


