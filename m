Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB01CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 15:19:42 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.223.1757603979343221698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 08:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id BD5941CD91
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 17:19:35 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.207]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uwj5B-3sB7Tt0; Thu, 11 Sep 2025 17:19:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] freetype: add PACKAGECONFIG for brotli
Date: Thu, 11 Sep 2025 17:19:22 +0200
Message-ID: <20250911151922.65277-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757603973-1DFF0977-B0069482/0/0 CLEAN NORMAL
X-TOI-MSGID: fa21a586-1835-48fe-8856-c1c1d7765178
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 15:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223282

Enabling brotli adds support for processing WOFF2 fonts.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/freetype/freetype_2.13.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.3.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.13.3.bb
index 100a7d95b6..dbfffdb65f 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
@@ -27,6 +27,7 @@ EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader --exclude=
=3Dautomake -I ."
=20
 PACKAGECONFIG ??=3D "zlib pixmap"
=20
+PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[bzip2] =3D "--with-bzip2,--without-bzip2,bzip2"
 # harfbuzz results in a circular dependency so enabling is non-trivial
 PACKAGECONFIG[harfbuzz] =3D "--with-harfbuzz,--without-harfbuzz,harfbuzz=
"
--=20
2.50.1


