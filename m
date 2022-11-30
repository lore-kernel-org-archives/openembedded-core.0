Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55A3C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 15:57:54 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.15064.1669823866445686974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 07:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 08B8581C7
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:57:44 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.245]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0PSx-0twLrt0; Wed, 30 Nov 2022 16:57:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] epiphany: use gcr3
Date: Wed, 30 Nov 2022 16:57:35 +0100
Message-Id: <20221130155735.208343-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669823863-2EFF8535-605E8789/0/0 CLEAN NORMAL
X-TOI-MSGID: f1772beb-93ff-4970-8854-f69e12de550c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 15:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174020

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/epiphany/epiphany_42.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb b/meta/recipes-=
gnome/epiphany/epiphany_42.4.bb
index afaaefc46f..0cbe1c9c58 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_42.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 DEPENDS =3D " \
           webkitgtk \
-          gcr \
+          gcr3 \
           gsettings-desktop-schemas \
           nettle \
           json-glib \
--=20
2.34.1


