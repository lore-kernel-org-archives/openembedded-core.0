Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561B2C433FE
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:06:50 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.1819.1654024004315676161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 12:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id A6375DC66
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 21:06:42 +0200 (CEST)
Received: from localhost.localdomain ([84.163.46.125]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw7CU-0ho03e0; Tue, 31 May 2022 21:06:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 2/4] libxcb: allow to build for wayland
Date: Tue, 31 May 2022 21:06:18 +0200
Message-Id: <20220531190620.186764-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531190620.186764-1-f_l_k@t-online.de>
References: <20220531190620.186764-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654024002-01439E5E-D168F04B/0/0 CLEAN NORMAL
X-TOI-MSGID: db55ffd4-4d98-4bf4-9c08-29357e7cb565
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 19:06:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166330

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/libxcb_1.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb b/meta/recipes=
-graphics/xorg-lib/libxcb_1.15.bb
index 839577326e..6205030591 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb
@@ -24,7 +24,7 @@ FILES:${PN} =3D "${libdir}/libxcb.so.*"
 inherit autotools pkgconfig features_check
=20
 # The libxau and others requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES =3D "x11"
+ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
=20
 export PYTHON =3D "python3"
=20
--=20
2.25.1


