Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1867C41513
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 10:18:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.56865.1716200317005000870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 03:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8A0FEC
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:19:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4531F3F766
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] meson: don't use deprecated pkgconfig variable
Date: Mon, 20 May 2024 10:18:30 +0000
Message-Id: <20240520101833.1798907-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520101833.1798907-1-ross.burton@arm.com>
References: <20240520101833.1798907-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 10:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199565

As with a previous change to the class[1], the "pkgconfig" entry is now
deprecated and "pkg-config" should be used instead.

[1] oe-core d64b307891422e290bbe821d4303b3af526bbe17

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson_1.3.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.3.1.bb b/meta/recipes-de=
vtools/meson/meson_1.3.1.bb
index 3d2eedca10a..5b0d82fe9f5 100644
--- a/meta/recipes-devtools/meson/meson_1.3.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.3.1.bb
@@ -86,7 +86,7 @@ ar =3D ${@meson_array('BUILD_AR', d)}
 nm =3D ${@meson_array('BUILD_NM', d)}
 strip =3D ${@meson_array('BUILD_STRIP', d)}
 readelf =3D ${@meson_array('BUILD_READELF', d)}
-pkgconfig =3D 'pkg-config-native'
+pkg-config =3D 'pkg-config-native'
=20
 [built-in options]
 c_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@=
var_list2str('BUILD_OPTIMIZATION', d)}]
@@ -104,7 +104,7 @@ cpp =3D @CXX
 ar =3D @AR
 nm =3D @NM
 strip =3D @STRIP
-pkgconfig =3D 'pkg-config'
+pkg-config =3D 'pkg-config'
=20
 [built-in options]
 c_args =3D @CFLAGS
--=20
2.34.1


