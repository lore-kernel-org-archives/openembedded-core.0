Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E7FCF9C59
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:37:21 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.21199.1726846633946854691
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 48CC617587
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 17:36:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfgV-1UIeoM0; Fri, 20 Sep 2024 17:36:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/3] gtk+3: rename tracker dependencies
Date: Fri, 20 Sep 2024 17:37:07 +0200
Message-ID: <20240920153708.1774041-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920153708.1774041-1-f_l_k@t-online.de>
References: <20240920153708.1774041-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726846599-43FFD416-7261849B/0/0 CLEAN NORMAL
X-TOI-MSGID: ab87103a-586a-4fae-b243-a94eaa74112f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 15:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204761

This is required for gnome 47 update in meta-openembedded

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
index e1603b43fc..03913768b1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -47,7 +47,7 @@ PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-D=
wayland_backend=3Dfalse,wayland
 PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovid=
ers=3Dfalse,libcloudproviders"
-PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tracke=
r,tracker-miners"
+PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tinysp=
arql,localsearch"
=20
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon=
-cache-3.0
--=20
2.46.0


