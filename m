Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF283C433FE
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 08:48:16 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web12.14552.1653209292614700410
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 01:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout07.t-online.de (Postfix) with SMTP id 29A09C80D
	for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:48:11 +0200 (CEST)
Received: from localhost.localdomain ([84.163.33.213]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nshFy-29T2lm0; Sun, 22 May 2022 10:48:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv5 2/5] libxkbcommon: allow to build
 native/nativesdk
Date: Sun, 22 May 2022 10:47:49 +0200
Message-Id: <20220522084752.1855131-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522084752.1855131-1-f_l_k@t-online.de>
References: <20220522084752.1855131-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653209290-0000C4DD-37699CDB/0/0 CLEAN NORMAL
X-TOI-MSGID: a3385466-65a1-42cc-bced-2f0862bf6609
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 08:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165968

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
index 34652e9c4e..9840b0797b 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb
@@ -34,3 +34,5 @@ python populate_packages:prepend () {
 # Fix a following runtime error:
 # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
 RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx=
11-locale', 'libx11-compose-data', d)}"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


