Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E49CD6ED26
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:54:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9945.1732193662712410744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A6E11480
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:54:52 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED80D3F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:54:21 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gdk-pixbuf: remove obsolete .la references
Date: Thu, 21 Nov 2024 12:54:16 +0000
Message-Id: <20241121125416.2004452-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121125416.2004452-1-ross.burton@arm.com>
References: <20241121125416.2004452-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 12:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207527

gdk-pixbuf uses Meson to build now, so it doesn't generate .la files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index e32903a4511..96487a284af 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -64,7 +64,6 @@ FILES:${PN}-dev +=3D " \
 	${bindir}/gdk-pixbuf-pixdata \
         ${bindir}/gdk-pixbuf-print-mime-types \
 	${includedir}/* \
-	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
 "
=20
 PACKAGES_DYNAMIC +=3D "^gdk-pixbuf-loader-.*"
@@ -98,8 +97,6 @@ do_install_ptest() {
 }
=20
 do_install:append:class-native() {
-	find ${D}${libdir} -name "libpixbufloader-*.la" -exec rm \{\} \;
-
 	create_wrapper ${D}/${bindir}/gdk-pixbuf-csource \
 		XDG_DATA_DIRS=3D${STAGING_DATADIR} \
 		GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIB=
V}/loaders.cache
--=20
2.34.1


