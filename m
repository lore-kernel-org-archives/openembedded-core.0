Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40625C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 18:05:06 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.1970.1717956286932053477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 11:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout11.t-online.de (Postfix) with SMTP id E583B21C6A
	for <openembedded-core@lists.openembedded.org>; Sun,  9 Jun 2024 20:04:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.230]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGMu9-0Yj6wb0; Sun, 9 Jun 2024 20:04:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ell: update 0.65 -> 0.66
Date: Sun,  9 Jun 2024 20:05:12 +0200
Message-ID: <20240609180512.2974906-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1717956273-4FFC9D42-186210F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 3f4baced-9ae3-49d7-9801-e33224ece72c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 18:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200462

ver 0.66:
	Fix issue with handling event callback when stopping ACD.
	Fix issue with handling ICMPv6 DNS and domain lists.
	Add support for notification lists.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/ell/{ell_0.65.bb =3D> ell_0.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.65.bb =3D> ell_0.66.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.65.bb b/meta/recipes-core/ell/el=
l_0.66.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.65.bb
rename to meta/recipes-core/ell/ell_0.66.bb
index 9b559caf8a..899e2f6849 100644
--- a/meta/recipes-core/ell/ell_0.65.bb
+++ b/meta/recipes-core/ell/ell_0.66.bb
@@ -15,4 +15,4 @@ DEPENDS =3D "dbus"
 inherit autotools pkgconfig
=20
 SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN=
}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "9ee7ac57b188d391cead705d3596a6d3240341786475149d=
b297782a52269aa5"
+SRC_URI[sha256sum] =3D "7a78b757080ed6518c1c4fa26ad6a7a3d6e4e385386a20b6=
fb52379e7d1ffa36"
--=20
2.45.1


