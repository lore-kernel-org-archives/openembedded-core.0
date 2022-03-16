Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA4CC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 17:07:29 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.115.1647450448964869600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 10:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id 423A3D11
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:07:27 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.155]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUX7O-0vpDee0; Wed, 16 Mar 2022 18:07:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 4/4] wayland: provide wayland-client-native and
 wayland-protocols-native
Date: Wed, 16 Mar 2022 18:07:09 +0100
Message-Id: <20220316170709.2924162-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316170709.2924162-1-f_l_k@t-online.de>
References: <20220316170709.2924162-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647450446-0000C4DD-76CC645D/0/0 CLEAN NORMAL
X-TOI-MSGID: 15cbc16d-aac7-41c5-bf57-a0f8cf75e067
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 17:07:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163345

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.25.bb | 3 +++
 meta/recipes-graphics/wayland/wayland_1.20.0.bb         | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb b/me=
ta/recipes-graphics/wayland/wayland-protocols_1.25.bb
index 074801b22d..92ba296165 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb
@@ -21,3 +21,6 @@ EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
 PACKAGES =3D "${PN}"
 FILES:${PN} +=3D "${datadir}/pkgconfig/wayland-protocols.pc"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.20.0.bb
index e8636eb11b..bd437767b2 100644
--- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
@@ -27,7 +27,7 @@ PACKAGECONFIG ??=3D "dtd-validation"
 PACKAGECONFIG[dtd-validation] =3D "-Ddtd_validation=3Dtrue,-Ddtd_validat=
ion=3Dfalse,libxml2,,"
=20
 EXTRA_OEMESON =3D "-Ddocumentation=3Dfalse"
-EXTRA_OEMESON:class-native =3D "-Ddocumentation=3Dfalse -Dlibraries=3Dfa=
lse"
+EXTRA_OEMESON:class-native =3D "-Ddocumentation=3Dfalse"
=20
 # Wayland installs a M4 macro for other projects to use, which uses the =
target
 # pkg-config to find files.  Replace pkg-config with pkg-config-native.
--=20
2.25.1


