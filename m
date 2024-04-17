Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D06C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 14:21:33 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by mx.groups.io with SMTP id smtpd.web10.14212.1713363692237633948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 07:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=Abs2Bge1;
 spf=pass (domain: protonmail.com, ip: 185.70.43.16, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1713363689; x=1713622889;
	bh=tiY7IgiIIavydqu8CgR+oHdrybnpavH2m5tSgHW+xvM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Abs2Bge1r0Ls3wXLO1QGA6IPVVlRdiDOXvX1pOpMtTrMytZl5lbaLkqKRKG/nKTQQ
	 b9jLDuaZhlrXq+DJvW7tx8cbqAUn+4Mp0lnsBm8bjWOGqb9lAelw5azTBbfGNK1Mk7
	 scjJs75zdbZQU19t9sBK5jLwz2q6BoR/PEp4BCnPtI9+Fw1RykgO9WPxNMzexByO37
	 sMfbN5jlLG7zXb+ntiyJxoJi/F3C2wFHs+Z3Y33B02by5lIODFin/r50/k88BN4WRp
	 +rTKCMQVIZMK307KI7zg3NwlSNaXpI3LegDOUy5wuRqagD/wSNipXrYVWpiL2VhWoL
	 mwAtolGcoB0rA==
Date: Wed, 17 Apr 2024 14:21:06 +0000
To: openembedded-core@lists.openembedded.org
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: rasmus.villemoes@prevas.dk, Emil Kronborg <emil.kronborg@protonmail.com>
Subject: [PATCH] at-spi2-core: set CVE_PRODUCT
Message-ID: <20240417142100.56518-1-emil.kronborg@protonmail.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 14:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198467

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
---
 meta/recipes-support/atk/at-spi2-core_2.52.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb b/meta/recipes=
-support/atk/at-spi2-core_2.52.0.bb
index cf221e038927..2ab42ba13f50 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
@@ -7,6 +7,8 @@ BUGTRACKER =3D "http://bugzilla.gnome.org/"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
+CVE_PRODUCT =3D "at-spi2-atk"
+
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"

base-commit: 946086abf5ac5172258ddb27af9c1c615258f62f
--=20
2.44.0



