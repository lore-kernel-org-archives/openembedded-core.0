Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02623C48285
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 18:38:57 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.4209.1706639927434551219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 10:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=dZQPfGuc;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4A2EE240101
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 19:38:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706639925; bh=NqYZ+rGDQiireyYapgNh1O2H7xWQ9CtI+DKoVX5wWyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=dZQPfGucBhXkoiqsUucMn+/ROlKR1rFwly9ytnTlc39dhWmBU2gS6H35u5xSlBNcL
	 Wlpft65N/6c7424T7AexCNqg2rvGwIvcEnh38KifBwM1jMUnaRCBrUSc2cbVzLGqoY
	 IOZN5vSUYTnMiHCRIlXDxI8l9Iy0TR3UZ5Oms6iX2PGo56V+00B2Ka0y5MPgUlWmyK
	 CPfOoJtrv/442fBmcWO3vDusqnMkgX1nrbWDsXjUA939lDXQ3U0g9yxzUamYSuz6wX
	 /6sn3xn8SgFY8fKtEAZ6QvxJ1X+iJANBJfI38dwoozE+73//eJPn37NoBSWxrNb+JF
	 +DXTdMFSDNSFQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TPYpX3HK8z6tsg;
	Tue, 30 Jan 2024 19:38:43 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] maintainers.inc: Add self for libseccomp and gnutls
Date: Tue, 30 Jan 2024 18:38:35 +0000
Message-Id: <20240130183835.42645-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 18:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194502

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index b0625a1097..f0e27b8380 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -218,7 +218,7 @@ RECIPE_MAINTAINER:pn-gnome-desktop-testing =3D "Ross =
Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gnu-config =3D "Robert Yang <liezhi.yang@windriver.=
com>"
 RECIPE_MAINTAINER:pn-gnu-efi =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-gnupg =3D "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-gnutls =3D "Unassigned <unassigned@yoctoproject.org=
>"
+RECIPE_MAINTAINER:pn-gnutls =3D "Simone Wei=C3=9F <simone.p.weiss@posteo=
.net>"
 RECIPE_MAINTAINER:pn-go =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-go-binary-native =3D "Khem Raj <raj.khem@gmail.com>=
"
 RECIPE_MAINTAINER:pn-go-cross-${TUNE_PKGARCH} =3D "Khem Raj <raj.khem@gm=
ail.com>"
@@ -385,7 +385,7 @@ RECIPE_MAINTAINER:pn-librsvg =3D "Anuj Mittal <anuj.m=
ittal@intel.com>"
 RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-libsdl2 =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-libseccomp =3D "Unassigned <unassigned@yoctoproject=
.org>"
+RECIPE_MAINTAINER:pn-libseccomp =3D "Simone Wei=C3=9F <simone.p.weiss@po=
steo.net>"
 RECIPE_MAINTAINER:pn-libsecret =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-libslirp =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libsm =3D "Unassigned <unassigned@yoctoproject.org>=
"
--=20
2.39.2


