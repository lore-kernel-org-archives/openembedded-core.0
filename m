Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2F2C021BF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:26:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8989.1740493603150743550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15D4628C7
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:59 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6964C3F6A8
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:26:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] apr-utils: remove obsolete patch
Date: Tue, 25 Feb 2025 14:26:35 +0000
Message-ID: <20250225142636.703255-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225142636.703255-1-ross.burton@arm.com>
References: <20250225142636.703255-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211883

This patch to change how autotools pulls in macros is no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../apr/apr-util/configure_fixes.patch        | 31 -------------------
 meta/recipes-support/apr/apr-util_1.6.3.bb    |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr-util/configure_fixes.pat=
ch

diff --git a/meta/recipes-support/apr/apr-util/configure_fixes.patch b/me=
ta/recipes-support/apr/apr-util/configure_fixes.patch
deleted file mode 100644
index 91e244ce2c6..00000000000
--- a/meta/recipes-support/apr/apr-util/configure_fixes.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: apr-util-1.4.1/configure.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- apr-util-1.4.1.orig/configure.in	2009-12-18 03:15:19.000000000 +0800
-+++ apr-util-1.4.1/configure.in	2011-12-30 13:32:07.000000000 +0800
-@@ -8,15 +8,15 @@
- AC_CONFIG_HEADER(include/private/apu_config.h)
- AC_CONFIG_AUX_DIR(build)
-=20
--sinclude(build/apu-conf.m4)
--sinclude(build/apu-iconv.m4)
--sinclude(build/apu-hints.m4)
--sinclude(build/apr_common.m4)
--sinclude(build/find_apr.m4)
--sinclude(build/crypto.m4)
--sinclude(build/dbm.m4)
--sinclude(build/dbd.m4)
--sinclude(build/dso.m4)
-+#sinclude(build/apu-conf.m4)
-+#sinclude(build/apu-iconv.m4)
-+#sinclude(build/apu-hints.m4)
-+#sinclude(build/apr_common.m4)
-+#sinclude(build/find_apr.m4)
-+#sinclude(build/crypto.m4)
-+#sinclude(build/dbm.m4)
-+#sinclude(build/dbd.m4)
-+#sinclude(build/dso.m4)
-=20
- dnl Generate ./config.nice for reproducing runs of configure
- dnl=20
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-su=
pport/apr/apr-util_1.6.3.bb
index 1371e262ddb..291e98e24df 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D158aa0b1efe0=
c12f23d4b007ddb9a5db \
=20
 SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-           file://configure_fixes.patch \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.pat=
ch \
            file://run-ptest \
            "
--=20
2.43.0


