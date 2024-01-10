Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E64DC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 13:42:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11611.1704894125912073482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 05:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D6852F4
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:42:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39EAC3F64C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 05:42:05 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: use pkg-config in the cross files
Date: Wed, 10 Jan 2024 13:42:02 +0000
Message-Id: <20240110134202.4080156-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 13:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193509

From: Ross Burton <ross.burton@arm.com>

From Meson 1.3.0, the "pkgconfig" entry is deprecated and "pkg-config"
should be used instead[1].

[1] https://mesonbuild.com/Release-notes-for-1-3-0.html#machine-files-pkg=
config-field-deprecated-and-replaced-by-pkgconfig

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index a85d120d77f..33043231b48 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -74,7 +74,7 @@ nm =3D ${@meson_array('NM', d)}
 strip =3D ${@meson_array('STRIP', d)}
 readelf =3D ${@meson_array('READELF', d)}
 objcopy =3D ${@meson_array('OBJCOPY', d)}
-pkgconfig =3D 'pkg-config'
+pkg-config =3D 'pkg-config'
 llvm-config =3D 'llvm-config'
 cups-config =3D 'cups-config'
 g-ir-scanner =3D '${STAGING_BINDIR}/g-ir-scanner-wrapper'
@@ -115,7 +115,7 @@ strip =3D ${@meson_array('BUILD_STRIP', d)}
 readelf =3D ${@meson_array('BUILD_READELF', d)}
 objcopy =3D ${@meson_array('BUILD_OBJCOPY', d)}
 llvm-config =3D '${STAGING_BINDIR_NATIVE}/llvm-config'
-pkgconfig =3D 'pkg-config-native'
+pkg-config =3D 'pkg-config-native'
 ${@rust_tool(d, "RUST_BUILD_SYS")}
=20
 [built-in options]
--=20
2.34.1


