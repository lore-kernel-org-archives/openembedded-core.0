Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F39FC43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:40:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.7343.1654321234311561567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id CC4A16D64
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:40:22 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd80.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMWF-3SU9A60; Sat, 4 Jun 2022 07:40:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3 6/6] xorg-app-common.inc: allow to build for
 wayland
Date: Sat,  4 Jun 2022 07:39:59 +0200
Message-Id: <20220604053959.4810-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220604053959.4810-1-f_l_k@t-online.de>
References: <20220604053959.4810-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654321215-0143B811-F948E827/19/7535076170 SUSPECT
 MAIL-COUNT
X-TOI-MSGID: 88a91958-0d87-4ffc-bc71-ac81b17ee5fb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:40:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166544

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/re=
cipes-graphics/xorg-app/xorg-app-common.inc
index 5dbe8abe86..7aed6e7138 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
 DEPENDS =3D "util-macros-native virtual/libx11"
=20
 # depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
=20
 SRC_URI_EXT =3D "bz2"
 SRC_URI =3D "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.${SRC_URI_EX=
T}"
--=20
2.25.1


