Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3882C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 17:07:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.114.1647450446162301005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id D3C58D0D
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:07:24 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.155]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUX7M-0vpDed0; Wed, 16 Mar 2022 18:07:24 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 3/4] libva: make buildable for native and nativesdk
Date: Wed, 16 Mar 2022 18:07:08 +0100
Message-Id: <20220316170709.2924162-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316170709.2924162-1-f_l_k@t-online.de>
References: <20220316170709.2924162-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647450444-0000C4DD-3BAEA7F6/0/0 CLEAN NORMAL
X-TOI-MSGID: 2cf37da0-7e99-4615-bf4e-7e69387376a6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 17:07:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163344

This prevents an error if trying to add "va" to mesa PACKAGECONFIG

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libva/libva.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphic=
s/libva/libva.inc
index 8ebec8159a..148bb03b5f 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -33,3 +33,5 @@ PACKAGECONFIG[glx] =3D "-Dwith_glx=3Dyes,-Dwith_glx=3Dn=
o,virtual/mesa"
=20
 PACKAGECONFIG[wayland] =3D "-Dwith_wayland=3Dyes,-Dwith_wayland=3Dno,way=
land-native wayland"
=20
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.25.1


