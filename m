Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE54EC982C1
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:54:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8491.1789538038771037272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=NxfzltCf;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id 41B4E1C5DD
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:53:38 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.21]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6iaO-3iV6lU0; Wed, 16 Sep 2026 07:53:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/3] gtk4: upgrade 4.22.5 -> 4.24.0
Date: Wed, 16 Sep 2026 07:53:23 +0200
Message-ID: <20260916055325.3396270-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789538016-0BFFC9F0-B3FA06A1/0/0 CLEAN NORMAL
X-TOI-MSGID: 9fec1b04-8d60-4b19-80b5-ea21096b7c56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789538018; i=f_l_k@t-online.de;
	bh=204xSfVKfH+g1zETKQ6qhTOdU30Q8MPuzrjagRbYssM=;
	h=From:To:Subject:Date;
	b=NxfzltCf+GFHj6UZg2s0zhlXv5QFg1lfCtMNsrs1T8swRiTfFmJuyiPuQjBBmwdMj
	 KMdfXJ2WzzpdQYnYI/rZfLqPcEvIX4fL9LBuuxkLhKlU6bZufdVDCUldjt14s/c0p8
	 9lJjR76RECzRSVRIH6Wn3tergrpkwEn3P3BD/qCuNbDjrrSbrwD738uejs45OJC44Z
	 eW6s3Lc00mtReRNNtrzvwDHoL4nK/jjLei69ENf+iMm0Cyl9gMcAR/nEtuOU61F5CU
	 4xfMYi8jZuTSv7RKgwRpIV3/j1XWSsb1attMArh9CD1jKzESTywvUsruIWhYgK4BLV
	 yZI9An9KFSwoQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245924

Needs glib-2.0 >=3D 2.89.3, which the 2.90.0 upgrade provides.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.22.5.bb =3D> gtk4_4.24.0.bb} (97%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.24.0.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
index 5d7385d29a..8a350d44f2 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.22.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.24.0.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D " \
     file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19=
d29fb2 \
 "
=20
-SRC_URI[archive.sha256sum] =3D "7fd725deb2cb3f8dc218ad862c5056ff8548f49d=
3b0e4081796e444c22d19686"
+SRC_URI[archive.sha256sum] =3D "28ba4ac1c04f86eac09b79a163cb163a4c2b5444=
2d9f7eccc04679062a581044"
=20
 S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
--=20
2.55.0


