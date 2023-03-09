Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3124C6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 20:40:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.2328.1678394409630593484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 12:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id BA0CE1C7E6
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 21:40:06 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.229.247]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1paN3R-0VX7jQ0; Thu, 9 Mar 2023 21:40:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC][PATCH 4/6] adwaita-icon-theme: update 43 -> 44.beta
Date: Thu,  9 Mar 2023 21:39:31 +0100
Message-Id: <20230309203933.834098-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309203933.834098-1-f_l_k@t-online.de>
References: <20230309203933.834098-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678394401-B9016A74-13FBBBD7/0/0 CLEAN NORMAL
X-TOI-MSGID: d77ba2ae-53d8-4e84-a2d7-1feebe61d5cc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 20:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178268

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...waita-icon-theme_43.bb =3D> adwaita-icon-theme_44.beta.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_43.bb =3D> adwaita-i=
con-theme_44.beta.bb} (95%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-A=
C_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001=
-Don-t-use-AC_CANONICAL_HOST.patch
index 0a1487f8e3..576afb3b02 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANON=
ICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANON=
ICAL_HOST.patch
@@ -1,4 +1,4 @@
-From e1a12b73c25d1ad0f267b22ac5d799bc1fbd0fa4 Mon Sep 17 00:00:00 2001
+From a29deb1c73a91d824b4bdeaef652bcfbc7119c69 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.c=
om>
  1 file changed, 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 6ddc49b..39752bb 100644
+index e2774c3..27be5ef 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
 =20
- AC_INIT([adwaita-icon-theme], [43],
+ AC_INIT([adwaita-icon-theme], [44.beta],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=3Dadwaita-icon=
-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb b/meta/rec=
ipes-gnome/gnome/adwaita-icon-theme_44.beta.bb
similarity index 95%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_44.beta.bb
index 8cb4d147f1..daf9fe9fa5 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_44.beta.bb
@@ -14,7 +14,7 @@ inherit allarch autotools pkgconfig gettext gtk-icon-ca=
che gnomebase
=20
 SRC_URI +=3D " file://0001-Don-t-use-AC_CANONICAL_HOST.patch"
=20
-SRC_URI[archive.sha256sum] =3D "2e3ac77d32a6aa5554155df37e8f0a0dd54fc5a6=
5fd721e88d505f970da32ec6"
+SRC_URI[archive.sha256sum] =3D "772a156ee56244d6d56b76f70cfc6e6e4a4666ab=
48c234b7c3e95a626a39a8d6"
=20
 DEPENDS +=3D "librsvg-native"
=20
--=20
2.34.1


