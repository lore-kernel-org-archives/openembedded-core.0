Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF44CCA47E
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:30:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.7374.1654320646447016274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id 986981537
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:30:44 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMMv-0Vhqdd0; Sat, 4 Jun 2022 07:30:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2 1/6] xorg-lib-common: allow to build for wayland
Date: Sat,  4 Jun 2022 07:30:23 +0200
Message-Id: <20220604053028.4682-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654320637-014319F2-ECD80D9E/0/0 CLEAN NORMAL
X-TOI-MSGID: e439f316-575f-4698-8fb5-8052d9a9e934
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166536

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


