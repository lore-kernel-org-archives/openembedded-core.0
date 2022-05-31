Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D6CC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 19:06:50 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.1824.1654024003255457418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 12:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 15C1810880
	for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 21:06:41 +0200 (CEST)
Received: from localhost.localdomain ([84.163.46.125]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nw7CR-0ho03d0; Tue, 31 May 2022 21:06:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for wayland
Date: Tue, 31 May 2022 21:06:17 +0200
Message-Id: <20220531190620.186764-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654023999-01439E5E-121A0953/0/0 CLEAN NORMAL
X-TOI-MSGID: 2cb3cc6b-063e-4d51-90ad-14cc19cbc1eb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 19:06:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166329

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/re=
cipes-graphics/xorg-lib/xorg-lib-common.inc
index 60bc8c76fa..30122f2bfa 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -23,4 +23,4 @@ UNKNOWN_CONFIGURE_OPT_IGNORE +=3D "--enable-malloc0retu=
rnsnull --disable-malloc0re
                                 --without-xmlto --with-xmlto \
 "
=20
-REQUIRED_DISTRO_FEATURES ?=3D "x11"
+ANY_OF_DISTRO_FEATURES ?=3D "x11 wayland"
--=20
2.25.1


