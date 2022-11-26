Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD764C43217
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:06:38 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.81096.1669503998046187977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id 81A53107A2
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 00:06:01 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4FC-0J7An30; Sun, 27 Nov 2022 00:05:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/2] epiphany: use gcr3
Date: Sun, 27 Nov 2022 00:05:46 +0100
Message-Id: <20221126230547.1432326-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503958-EDFED7E2-502CD9B2/0/0 CLEAN NORMAL
X-TOI-MSGID: 78e19bc6-e58c-4b18-8b95-9669a6c360f5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 23:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173833

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


