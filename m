Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D5AC48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 06:32:08 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.36262.1708324319290887208
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 22:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout09.t-online.de (Postfix) with SMTP id A329126A06
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 07:31:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rbxBz-2nC3ph0; Mon, 19 Feb 2024 07:31:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] ell: update 0.61 -> 0.62
Date: Mon, 19 Feb 2024 07:32:11 +0100
Message-ID: <20240219063211.10183-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708324315-DBFFC94C-3C5EA4FF/0/0 CLEAN NORMAL
X-TOI-MSGID: c9b28923-92c9-4253-b697-ac5f61ae1cc1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 06:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195864

ver 0.62:
	Add support for cleanup functions and macros.
	Add support for setting DHCP max attempts.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/ell/{ell_0.61.bb =3D> ell_0.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.61.bb =3D> ell_0.62.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.61.bb b/meta/recipes-core/ell/el=
l_0.62.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.61.bb
rename to meta/recipes-core/ell/ell_0.62.bb
index 5472714646..c6ec91afb4 100644
--- a/meta/recipes-core/ell/ell_0.61.bb
+++ b/meta/recipes-core/ell/ell_0.62.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "dbus"
 inherit autotools pkgconfig
=20
 SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN=
}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "c21ba3530d530c736f9b3e6acc954d4404c1ce4abaf2a469=
4e46ecec17653fa0"
+SRC_URI[sha256sum] =3D "f1efae12085610049714dc509c6fab3478925801609ad423=
2ce873b7daf1e03d"
=20
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
--=20
2.43.0


