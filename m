Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C74C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 08:56:47 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.6806.1740646603777376178
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 00:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout09.t-online.de (Postfix) with SMTP id 3ADA710AE
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:56:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.81]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tnZhA-21ukTp0; Thu, 27 Feb 2025 09:56:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] boost: add charconv lib
Date: Thu, 27 Feb 2025 09:57:17 +0100
Message-ID: <20250227085717.177382-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740646600-31FF891F-281DAA3C/0/0 CLEAN NORMAL
X-TOI-MSGID: abad198c-bbcf-4319-8a27-6a52409a11f9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 08:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211982

In boost 1.85 a charconv implementation in c++11 was added
[https://www.boost.org/doc/libs/master/libs/charconv/doc/html/charconv.ht=
ml]

This is already used in real life and e.g. building the current wesnoth r=
elease fails with:
| /usr/src/debug/wesnoth/1.19.9/src/utils/charconv.hpp:57:(.text+0x238b):=
 undefined reference to `boost::charconv::to_chars(char*, char*, double, =
boost::charconv::chars_format)'

Add charconv to BOOST_LIBS to provide the library

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-support/boost/boost.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index 77105aa1fa..b8aba94d9b 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,6 +16,7 @@ do_configure[cleandirs] =3D "${B}"
=20
 BOOST_LIBS =3D "\
 	atomic \
+	charconv \
 	chrono \
 	container \
 	context \
--=20
2.48.1


