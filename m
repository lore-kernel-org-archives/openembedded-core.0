Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE8FC43217
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 12:43:04 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.26656.1653309775932598385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 05:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id 64A70A36B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 14:42:54 +0200 (CEST)
Received: from localhost.localdomain ([79.219.229.214]) by fwd87.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nt7Of-0ZMhzH0; Mon, 23 May 2022 14:42:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC PATCHv6 3/5] xkexboard-config: allow to build
 native/nativesdk
Date: Mon, 23 May 2022 14:42:38 +0200
Message-Id: <20220523124240.1649817-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523124240.1649817-1-f_l_k@t-online.de>
References: <20220523124240.1649817-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653309774-00000271-F8AB6728/0/0 CLEAN NORMAL
X-TOI-MSGID: e52437a5-9650-49f2-9e28-af0b55f23a2a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 12:43:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166014

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


