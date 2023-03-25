Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B2EC761AF
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 00:50:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.13189.1679705401272992951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 17:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id C98C919E91
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 01:48:55 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfs5N-20zHG90; Sat, 25 Mar 2023 01:48:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 5/7] adwaita-icon-theme: update 43 -> 44.0
Date: Sat, 25 Mar 2023 01:48:16 +0100
Message-Id: <20230325004818.2784943-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325004818.2784943-1-f_l_k@t-online.de>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679705325-E67FBC37-AD376387/0/0 CLEAN NORMAL
X-TOI-MSGID: 8ee11568-8ce8-4992-afac-618fc9423e6b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 00:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179082

- fix patch-fuzz

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...{adwaita-icon-theme_43.bb =3D> adwaita-icon-theme_44.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_43.bb =3D> adwaita-i=
con-theme_44.0.bb} (95%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-A=
C_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001=
-Don-t-use-AC_CANONICAL_HOST.patch
index 0a1487f8e3..dd54afebc3 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANON=
ICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANON=
ICAL_HOST.patch
@@ -1,4 +1,4 @@
-From e1a12b73c25d1ad0f267b22ac5d799bc1fbd0fa4 Mon Sep 17 00:00:00 2001
+From dc3b4814a4c37fe07f5369dcc547095f5e01505e Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.c=
om>
  1 file changed, 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 6ddc49b..39752bb 100644
+index 3870795..9afb012 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
 =20
- AC_INIT([adwaita-icon-theme], [43],
+ AC_INIT([adwaita-icon-theme], [44.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=3Dadwaita-icon=
-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb b/meta/rec=
ipes-gnome/gnome/adwaita-icon-theme_44.0.bb
similarity index 95%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_44.0.bb
index 8cb4d147f1..268a68ccea 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_44.0.bb
@@ -14,7 +14,7 @@ inherit allarch autotools pkgconfig gettext gtk-icon-ca=
che gnomebase
=20
 SRC_URI +=3D " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
=20
-SRC_URI[archive.sha256sum] =3D "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a6=
5fd721e88d505f970da32ec6"
+SRC_URI[archive.sha256sum] =3D "4889c5601bbfecd25d80ba342209d0a936dcf691=
ee56bd6eca4cde361f1a664c"
=20
 DEPENDS +=3D "librsvg-native"
=20
--=20
2.34.1


