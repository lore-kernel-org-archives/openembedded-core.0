Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7372C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 14:25:29 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web08.6838.1642602328567805262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 06:25:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 2746412DBF
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 15:25:23 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.73]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nABtr-1kZICf0; Wed, 19 Jan 2022 15:25:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] gmime: inherit vala
Date: Wed, 19 Jan 2022 15:24:56 +0100
Message-Id: <20220119142457.2974185-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642602323-0001606D-18280F9F/0/0 CLEAN NORMAL
X-TOI-MSGID: cf6d0d96-3dc4-4ff2-aaa5-a74a4d184ccc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 14:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160738

This is needed to get the vala gir files created (needed e.g. to build ge=
ary).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb b/meta-oe/recipes=
-gnome/gmime/gmime_3.2.7.bb
index 7f38d42be..d89613d74 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.7.bb
@@ -5,7 +5,7 @@ SECTION =3D "libs"
=20
 DEPENDS =3D "glib-2.0 zlib"
=20
-inherit gnomebase gobject-introspection
+inherit gnomebase gobject-introspection vala
=20
 SRC_URI +=3D "file://iconv-detect.h \
             file://nodolt.patch"
--=20
2.25.1


