Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A92C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 15:50:38 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.11090.1653407432127169937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 08:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout03.t-online.de (Postfix) with SMTP id 2858557C5
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 17:50:30 +0200 (CEST)
Received: from localhost.localdomain ([79.219.234.203]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1ntWnk-4acAU50; Tue, 24 May 2022 17:50:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] libva-initial: unbreak do_populate_sdk
Date: Tue, 24 May 2022 17:50:21 +0200
Message-Id: <20220524155021.416611-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653407428-0000BD0E-065A5B79/0/0 CLEAN NORMAL
X-TOI-MSGID: 514895a8-c3d9-49c2-8ae4-7db0d9ec1387
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 15:50:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166080

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
index 453096822f..b234797efb 100644
--- a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
+++ b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
@@ -6,3 +6,4 @@ do_install:append () {
 	rm -f ${D}${libdir}/*.so*
 }
=20
+RDEPENDS:${PN}-dev =3D ""
--=20
2.25.1


