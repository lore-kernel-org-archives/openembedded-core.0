Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EE6C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 14:25:48 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.6756.1642602348332720107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 06:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id 9E89C1991E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 15:25:31 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.73]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nABtz-1kZICg0; Wed, 19 Jan 2022 15:25:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] gspell: inherit vala
Date: Wed, 19 Jan 2022 15:24:57 +0100
Message-Id: <20220119142457.2974185-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119142457.2974185-1-f_l_k@t-online.de>
References: <20220119142457.2974185-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1642602331-0001606D-9534D256/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b682ead-d2fd-47eb-9561-80cfdb8b6fb0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 14:25:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160739

This is needed to get the vala gir files created (needed e.g. to build ge=
ary).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb b/meta-gnome=
/recipes-gnome/gspell/gspell_1.9.1.bb
index d6de146b1..aba9be87a 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8c2e1ec1540fb3=
e0beb68361344cba7e"
=20
 DEPENDS =3D "gtk+3 iso-codes enchant2"
=20
-inherit gnomebase gettext gobject-introspection
+inherit gnomebase gettext gobject-introspection vala
=20
 SRC_URI[archive.sha256sum] =3D "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf=
85df08b29915e92cd723abdd"
--=20
2.25.1


