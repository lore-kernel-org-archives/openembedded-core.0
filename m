Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07392C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:30:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web09.7341.1654320648543236870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id 3AD039A03
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:30:47 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMN2-0Vhqdi0; Sat, 4 Jun 2022 07:30:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2 6/6] xorg-app-common: allow to build for wayland
Date: Sat,  4 Jun 2022 07:30:28 +0200
Message-Id: <20220604053028.4682-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220604053028.4682-1-f_l_k@t-online.de>
References: <20220604053028.4682-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654320644-014319F2-47570D8E/0/0 CLEAN NORMAL
X-TOI-MSGID: c9462e6e-4d46-4169-a563-d07ddcb7c2a7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166538

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


