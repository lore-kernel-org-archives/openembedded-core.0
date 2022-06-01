Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947E8CCA473
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:09:56 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.8888.1654096191969303738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 742391971
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Jun 2022 17:09:48 +0200 (CEST)
Received: from localhost.localdomain ([84.163.46.87]) by fwd74.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nwPyl-0ChY4P0; Wed, 1 Jun 2022 17:09:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] xorg-font-common.inc: allow to build for wayland
Date: Wed,  1 Jun 2022 17:09:31 +0200
Message-Id: <20220601150931.13683-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654096187-0143D1EA-8FD30310/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b1a1b09-2ebd-4bfc-841e-0d13392fde40
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166384

---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/=
recipes-graphics/xorg-font/xorg-font-common.inc
index 2df23efed4..f552bb0076 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -15,7 +15,7 @@ S =3D "${WORKDIR}/${XORG_PN}-${PV}"
 inherit autotools pkgconfig features_check
=20
 # The mkfontscale-native requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
=20
 EXTRA_OEMAKE +=3D "FCCACHE=3D/bin/true UTIL_DIR=3D${STAGING_DIR_TARGET}\=
$\(MAPFILES_PATH\)"
=20
--=20
2.25.1


