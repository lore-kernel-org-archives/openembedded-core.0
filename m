Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF4EC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 14:50:17 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web08.10373.1653403814795687772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 07:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout05.t-online.de (Postfix) with SMTP id 5D32CA2C4
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 16:49:41 +0200 (CEST)
Received: from localhost.localdomain ([79.219.234.203]) by fwd89.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ntVqt-0obY260; Tue, 24 May 2022 16:49:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/2] libva-initial: unbreak do_populate_sdk
Date: Tue, 24 May 2022 16:49:24 +0200
Message-Id: <20220524144924.252281-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524144924.252281-1-f_l_k@t-online.de>
References: <20220524144924.252281-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653403779-0000F5B3-3F271EE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 2791283f-fa2b-45ad-bbeb-18ce93398a4b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 14:50:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166069

Error:
 Problem: package libva-dev-2.14.0-r0.corei7_64 requires libva-initial-de=
v, but none of the providers can be installed
  - conflicting requests
  - nothing provides libva-initial =3D 2.14.0-r0 needed by libva-initial-=
dev-2.14.0-r0.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/libva/libva-initial_2.14.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb b/meta/r=
ecipes-graphics/libva/libva-initial_2.14.0.bb
index 453096822f..14917b1c65 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
@@ -6,3 +6,4 @@ do_install:append () {
 	rm -f ${D}${libdir}/*.so*
 }
=20
+ALLOW_EMPTY:${PN} =3D "1"
--=20
2.25.1


