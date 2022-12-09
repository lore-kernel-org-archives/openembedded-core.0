Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09B2C04FDE
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 14:11:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.1984.1670595090221056293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 06:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 5707A125F6
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Dec 2022 15:11:27 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.94]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3e62-3QaSEI0; Fri, 9 Dec 2022 15:11:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv10 6/6] epiphany: use gcr3
Date: Fri,  9 Dec 2022 15:11:17 +0100
Message-Id: <20221209141117.1311827-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209141117.1311827-1-f_l_k@t-online.de>
References: <20221209141117.1311827-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670595086-5B7E9991-79502951/0/0 CLEAN NORMAL
X-TOI-MSGID: eed610e8-f696-4006-8525-a5a09833a349
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 14:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174458

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


