Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3248CC43334
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:40:28 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web08.7420.1654321225508418957
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id CAEDF6402
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:40:22 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd80.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMWE-3SU9A50; Sat, 4 Jun 2022 07:40:15 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3 5/6] xorg-font-common.inc: allow to build for
 wayland
Date: Sat,  4 Jun 2022 07:39:58 +0200
Message-Id: <20220604053959.4810-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220604053959.4810-1-f_l_k@t-online.de>
References: <20220604053959.4810-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654321215-0143B811-8780E65E/19/7535076170 SUSPECT
 MAIL-COUNT
X-TOI-MSGID: 4e94b598-4b1b-4443-ae22-999339672737
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:40:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166543

Signed-off-by: Markus Volk <f_l_k@t-online.de>
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


