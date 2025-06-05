Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40906C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:35:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10731.1749137718073957190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45E1F1688
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 672533F5A1
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 08:35:17 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/16] squashfs-tools: update to 4.7
Date: Thu,  5 Jun 2025 16:35:01 +0100
Message-ID: <20250605153508.961682-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605153508.961682-1-ross.burton@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218045

The REPRODUCIBLE_DEFAULT option was removed in 4.7[1].

Also clean up the tasks to be neater and more concise.

[1] squash-tools ae9914d15293af7c596148aedd997b3058e35d9e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...uashfs-tools_4.6.1.bb =3D> squashfs-tools_4.7.bb} | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.6.1.bb =3D=
> squashfs-tools_4.7.bb} (77%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb=
 b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
similarity index 77%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
index 51a2fbdb934..6357c8a5a93 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
@@ -7,8 +7,8 @@ SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dv6.1.1"
-SRCREV =3D "d8cb82d9840330f9344ec37b992595b5d7b44184"
+SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV}"
+SRCREV =3D "2e87d42ed089dc31990d83eeb07437b9d085d6d1"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
=20
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
=20
-PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
+PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd"
 PACKAGECONFIG[gzip] =3D "GZIP_SUPPORT=3D1,GZIP_SUPPORT=3D0,zlib"
 PACKAGECONFIG[xz] =3D "XZ_SUPPORT=3D1,XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[lzo] =3D "LZO_SUPPORT=3D1,LZO_SUPPORT=3D0,lzo"
@@ -24,17 +24,15 @@ PACKAGECONFIG[lz4] =3D "LZ4_SUPPORT=3D1,LZ4_SUPPORT=3D=
0,lz4"
 PACKAGECONFIG[lzma] =3D "LZMA_XZ_SUPPORT=3D1,LZMA_XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[xattr] =3D "XATTR_SUPPORT=3D1,XATTR_SUPPORT=3D0,attr"
 PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
-PACKAGECONFIG[reproducible] =3D "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE_D=
EFAULT=3D0,"
=20
 do_compile() {
-        cd ${S}/squashfs-tools
-	oe_runmake all
+	oe_runmake -C ${S}/squashfs-tools all
 }
=20
 do_install() {
-        cd ${S}/squashfs-tools
+	oe_runmake -C ${S}/squashfs-tools install INSTALL_PREFIX=3D${D}${prefix=
} INSTALL_MANPAGES_DIR=3D${D}${datadir}/man/man1
+
 	install -d "${D}${includedir}"
-	oe_runmake install INSTALL_PREFIX=3D${D}${prefix} INSTALL_MANPAGES_DIR=3D=
${D}${datadir}/man/man1
 	install -m 0644 "${S}"/squashfs-tools/squashfs_fs.h "${D}${includedir}"
 }
=20
--=20
2.43.0


