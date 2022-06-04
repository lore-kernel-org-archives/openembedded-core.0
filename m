Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFA5CCA480
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 05:40:28 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web12.7429.1654321225187749556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 22:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id BAAD863FF
	for <openembedded-core@lists.openembedded.org>;
 Sat,  4 Jun 2022 07:40:22 +0200 (CEST)
Received: from localhost.localdomain ([84.163.41.60]) by fwd80.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nxMWE-3SU9A20; Sat, 4 Jun 2022 07:40:14 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv3 2/6] libxcb: allow to build for wayland
Date: Sat,  4 Jun 2022 07:39:55 +0200
Message-Id: <20220604053959.4810-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220604053959.4810-1-f_l_k@t-online.de>
References: <20220604053959.4810-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654321214-0143B811-D7D59F90/19/7535076170 SUSPECT
 MAIL-COUNT
X-TOI-MSGID: e547c977-8060-44f2-a1fd-41b2c3ad2bc2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 05:40:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166541

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


