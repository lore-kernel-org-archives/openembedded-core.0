Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B4AC7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:17:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20135.1750169814697816904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 07:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25A8B150C
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 07:16:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C27573F58B
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 07:16:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libcheck: remove obsolete patch
Date: Tue, 17 Jun 2025 15:16:47 +0100
Message-ID: <20250617141649.378910-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218879

This patch is specific to the autotools build of libcheck, but we use
CMake now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...echo-compiler-info-to-check_stdint.h.patch | 19 -------------------
 .../libcheck/libcheck_0.15.2.bb               |  3 +--
 2 files changed, 1 insertion(+), 21 deletions(-)
 delete mode 100644 meta/recipes-support/libcheck/libcheck/not-echo-compi=
ler-info-to-check_stdint.h.patch

diff --git a/meta/recipes-support/libcheck/libcheck/not-echo-compiler-inf=
o-to-check_stdint.h.patch b/meta/recipes-support/libcheck/libcheck/not-ec=
ho-compiler-info-to-check_stdint.h.patch
deleted file mode 100644
index 3c7572700d9..00000000000
--- a/meta/recipes-support/libcheck/libcheck/not-echo-compiler-info-to-ch=
eck_stdint.h.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Do not echo compiler info in a comment line to check_stdint.h which caus=
es
-multilib install file conflict.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/m4/ax_create_stdint_h.m4 b/m4/ax_create_stdint_h.m4
-index 33a21f8..eacc37a 100644
---- a/m4/ax_create_stdint_h.m4
-+++ b/m4/ax_create_stdint_h.m4
-@@ -272,7 +272,6 @@ echo "#ifndef" $_ac_stdint_h >$ac_stdint
- echo "#define" $_ac_stdint_h "1" >>$ac_stdint
- echo "#ifndef" _GENERATED_STDINT_H >>$ac_stdint
- echo "#define" _GENERATED_STDINT_H '"'$PACKAGE $VERSION'"' >>$ac_stdint
--echo "/* generated $ac_cv_stdint_message */" >>$ac_stdint
- if test "_$ac_cv_header_stdint_t" !=3D "_" ; then
- echo "#define _STDINT_HAVE_STDINT_H" "1" >>$ac_stdint
- echo "#include <stdint.h>" >>$ac_stdint
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/reci=
pes-support/libcheck/libcheck_0.15.2.bb
index 8455f2c7483..ea0453a1667 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -11,8 +11,7 @@ LICENSE  =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3D2d5025d4aa3495befef8f1=
7206a5b0a1"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
-           file://automake-output.patch \
-           file://not-echo-compiler-info-to-check_stdint.h.patch"
+           file://automake-output.patch"
 SRC_URI[sha256sum] =3D "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d88=
35eb1a52932fa20a"
 GITHUB_BASE_URI =3D "https://github.com/libcheck/check/releases/"
=20
--=20
2.43.0


