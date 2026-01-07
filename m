Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7264BCFD65A
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8658.1767800290299822764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225B9497
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:03 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8BB2F3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] alsa-utils: clean up udev PACKAGECONFIG
Date: Wed,  7 Jan 2026 15:38:01 +0000
Message-ID: <20260107153803.2905889-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107153803.2905889-1-ross.burton@arm.com>
References: <20260107153803.2905889-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229009

The default value for the udev rules location is looked up using
pkg-config, so there's no need to make this line very long by doing it
again.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 188dfd858f..e528591ec6 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG ??=3D "udev"
 # or no alsabat at all.
 PACKAGECONFIG[bat] =3D "--enable-bat,--disable-bat,fftwf"
=20
-PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-config --variable=3D=
udevdir udev`/rules.d,--with-udev-rules-dir=3D/unwanted/rules.d,udev"
+PACKAGECONFIG[udev] =3D ",--with-udev-rules-dir=3D/unwanted/rules.d,udev=
"
 PACKAGECONFIG[manpages] =3D "--enable-rst2man --enable-xmlto, --disable-=
rst2man --disable-xmlto, python3-docutils-native xmlto-native docbook-xml=
-dtd4-native docbook-xsl-stylesheets-native"
=20
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
--=20
2.43.0


