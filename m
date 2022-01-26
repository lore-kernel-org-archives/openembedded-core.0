Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA9C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:46 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11075.1643192924550948992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=h+2pjkjP;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E82EB8304C;
	Wed, 26 Jan 2022 11:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192923;
	bh=M4gbpDpPPvSQ4s5zP33OkL3lFuwitkgtHdD+vhp1wBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+2pjkjPV/mucRBQVCqD0M+PDmSTy86KeXrNj5q8WXERTr2iQKYLDfxj8OLiTPTrz
	 dUkr7AyxSOOAwCA0pShotAVFT3oQvHtDEEgvygNGDJISqYdvj2VUPXyPG0k3IZM+nq
	 5GHigkQpqneor1MTSOcRLXPg3McCD8KkTM9ipmlGoMWMFW4EqQMeYtz31E/hsDEP2J
	 NiCGhieO5GgU+bGUEyAJGlNwbrXWIuQ5kxaEd4mjNFSOncm0CKHMXnl4eeb5ikIm18
	 1spXewc6GZG8+pTujQotj1zcTUlMA0OhTtW2wgquawN6B7yACQFT+NZ5Cwfw+K4i7R
	 XqZoyZxflr/GQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 11/12] gst-examples: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:13 +0100
Message-Id: <20220126102814.4173943-12-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160976

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...001-Make-player-examples-installable.patch | 22 +++++++++----------
 ...mples_1.18.5.bb =3D> gst-examples_1.20.0.bb} | 11 +++++-----
 2 files changed, 16 insertions(+), 17 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb =3D> gs=
t-examples_1.20.0.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-pla=
yer-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-ex=
amples/0001-Make-player-examples-installable.patch
index ab93c13244..96baab2415 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-exa=
mples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-exa=
mples-installable.patch
@@ -9,29 +9,29 @@ Upstream-Status: Denied [Upstream considers these code =
examples, for now a least
 https://bugzilla.gnome.org/show_bug.cgi?id=3D777827
=20
 ---
- playback/player/gst-play/meson.build | 1 +
- playback/player/gtk/meson.build      | 1 +
+ subprojects/gst-examples/playback/player/gst-play/meson.build | 1 +
+ subprojects/gst-examples/playback/player/gtk/meson.build      | 1 +
  2 files changed, 2 insertions(+)
=20
-diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-=
play/meson.build
+diff --git a/subprojects/gst-examples/playback/player/gst-play/meson.bui=
ld b/subprojects/gst-examples/playback/player/gst-play/meson.build
 index 8ec021d..977cc5c 100644
---- a/playback/player/gst-play/meson.build
-+++ b/playback/player/gst-play/meson.build
+--- a/subprojects/gst-examples/playback/player/gst-play/meson.build
++++ b/subprojects/gst-examples/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
      ['gst-play.c',
       'gst-play-kb.c',
       'gst-play-kb.h'],
 +    install: true,
-     dependencies : [gst_dep, gstplayer_dep, m_dep])
+     dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
 =20
-diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson=
.build
+diff --git a/subprojects/gst-examples/playback/player/gtk/meson.build b/=
subprojects/gst-examples/playback/player/gtk/meson.build
 index f7a7419..6281130 100644
---- a/playback/player/gtk/meson.build
-+++ b/playback/player/gtk/meson.build
+--- a/subprojects/gst-examples/playback/player/gtk/meson.build
++++ b/subprojects/gst-examples/playback/player/gtk/meson.build
 @@ -13,5 +13,6 @@ if gtk_dep.found()
          gtk_play_resources,
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
-+    install: true,
-       dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gstt=
ag_dep, gstplayer_dep, gtk_dep, x11_dep])
++      install: true,
+       dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gstt=
ag_dep, gstplay_dep, gtk_dep, x11_dep])
  endif
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb b/m=
eta/recipes-multimedia/gstreamer/gst-examples_1.20.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.20.0.bb
index a720bb73ff..ef1b457882 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.20.0.bb
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM =3D "file://playback/player/gtk/gtk-pl=
ay.c;beginline=3D1;endline=3D20
=20
 DEPENDS =3D "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.=
0-plugins-bad gtk+3 libsoup-2.4 json-glib glib-2.0-native"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;pro=
tocol=3Dhttps;branch=3D1.18 \
-           file://0001-Make-player-examples-installable.patch \
-           file://gst-player.desktop \
-           "
+require gstreamer1.0-source.inc
=20
-SRCREV =3D "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
+S =3D "${SRC_BASE}/subprojects/gst-examples"
=20
-S =3D "${WORKDIR}/git"
+SRC_URI +=3D "file://0001-Make-player-examples-installable.patch;patchdi=
r=3D${SRC_BASE} \
+            file://gst-player.desktop \
+            "
=20
 inherit meson pkgconfig features_check
=20
--=20
2.34.1


