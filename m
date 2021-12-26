Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76734C433F5
	for <webhook@archiver.kernel.org>; Sun, 26 Dec 2021 09:46:42 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.15162.1640512001473202468
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 01:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 2EEA51412
	for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 10:46:33 +0100 (CET)
Received: from localhost.localdomain ([84.163.44.44]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1n1Q6m-1mkaGX0; Sun, 26 Dec 2021 10:46:28 +0100
From: MarkusVolk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [OE-core] [PATCH] vulkan-loader: inherit pkgconfig
Date: Sun, 26 Dec 2021 10:45:59 +0100
Message-Id: <20211226094559.104338-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640511988-0000AD4E-060785E2/0/0 CLEAN NORMAL
X-TOI-MSGID: 0c81fa0a-eab8-42a6-8c96-7271a9e4eff5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Dec 2021 09:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160011

this is needed to get the vulkan.pc file created

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
---
 meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb b/me=
ta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
index 446a2d5c05..dcd6e02ba0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.1.bb
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/git"
=20
 REQUIRED_DISTRO_FEATURES =3D "vulkan"
=20
-inherit cmake features_check
+inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
=20
 DEPENDS +=3D "vulkan-headers"
--=20
2.25.1


