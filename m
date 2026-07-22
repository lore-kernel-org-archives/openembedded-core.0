Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB2C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 15:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3131.1784734977760518257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 08:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=UhjToKz5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE1F61691
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B434C3F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734977; bh=LyZzfpAWJ6ttJuy59MtsWZANioSvrzHw6rsglijvYUE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UhjToKz5uF1Zc1EqdSP2un5JyqIg/PXfPM0km8M6szD4E00/VMuEMgH+wq213QLWM
	 EQVBZYHrvMIwfXohOa+T0jX/1/YvlFgpXRtwDcfFv4mp9pXffiRPXEta2fEcvOIScq
	 pZnu5PgpyW1+OUrzNrmIvjB0nMcrX3PNsCBk9zLQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] xorg-lib-common: remove --*-malloc0returnsnull from unknown configure option ignore list
Date: Wed, 22 Jul 2026 16:42:44 +0100
Message-ID: <20260722154247.2987545-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722154247.2987545-1-ross.burton@arm.com>
References: <20260722154247.2987545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 15:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241700

This was removed as an option that is passed to all xorg libraries in
2013[1] but was not removed from the ignore list at the same time.

[1] oe-core b4aaacd7699 ("xorg-lib: remove explicit --enable-malloc0retur=
nsnull")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/re=
cipes-graphics/xorg-lib/xorg-lib-common.inc
index ba7fcb73044..9584a805707 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -19,8 +19,7 @@ EXTRA_OECONF =3D "--disable-specs --without-groff --wit=
hout-ps2pdf --without-fop"
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[xmlto] =3D "--with-xmlto, --without-xmlto, xmlto-native do=
cbook-xml-dtd4-native docbook-xsl-stylesheets-native"
=20
-UNKNOWN_CONFIGURE_OPT_IGNORE +=3D "--enable-malloc0returnsnull --disable=
-malloc0returnsnull \
-                                --disable-specs --without-groff --withou=
t-ps2pdf --without-fop \
+UNKNOWN_CONFIGURE_OPT_IGNORE +=3D "--disable-specs --without-groff --wit=
hout-ps2pdf --without-fop \
                                 --without-xmlto --with-xmlto \
 "
=20
--=20
2.43.0


