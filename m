Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ECBC4332F
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 08:48:16 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.14162.1653209293585188823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 01:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id E5780ABFF
	for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:48:11 +0200 (CEST)
Received: from localhost.localdomain ([84.163.33.213]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nshFz-29T2ln0; Sun, 22 May 2022 10:48:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv5 3/5] xkexboard-config: allow to build
 native/nativesdk
Date: Sun, 22 May 2022 10:47:50 +0200
Message-Id: <20220522084752.1855131-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220522084752.1855131-1-f_l_k@t-online.de>
References: <20220522084752.1855131-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653209291-0000C4DD-87A512C1/0/0 CLEAN NORMAL
X-TOI-MSGID: 12d140e5-1cbd-4215-bc3a-0c26067094e0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 08:48:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165969

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb b/=
meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
index 5215131e3e..46c73879e6 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
@@ -28,3 +28,5 @@ do_install:append () {
     install -d ${D}${datadir}/X11/xkb/compiled
     cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


