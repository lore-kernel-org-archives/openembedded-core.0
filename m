Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 564606FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 16:56:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 2D43920761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:26 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Wed, 17 Feb 2016 11:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=I59z99ma+3l5LLCgoPuUv53JKcQ=; b=e/lIh
	Wn804QEbXIuUOGsiUu0JmpBNuUa8CpwkbNB1b9XX9aE5uE9+dltafIKgSMouTOsX
	2ZIEEbkw082WvpN74dIp5LVLUpAKkwT3MDBUzL5ChvFlrFRJSvCsw0NnGQm37zEq
	Hdlo6uhDL5t0tVun1zaf0HLReO1rX3tuCOc4H8=
X-Sasl-enc: X8b756Qb7aeeHv6FJoYHXbkJepTheOAEzwHmsZ41mmBp 1455728185
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 91554C0001E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:25 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 18:56:13 +0200
Message-Id: <6974c1ab4a13a2c1048fcb2c4a73da0ac32e6a6a.1455727967.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
In-Reply-To: <cover.1455727967.git.tanuk@iki.fi>
References: <cover.1455727967.git.tanuk@iki.fi>
Subject: [PATCH 1/4] alsa-tools: 1.0.29 -> 1.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 16:56:25 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v1.1.0

There are almost no changes in the new version: just one invalid macro
was removed from the cspctl man page.

Rebased patches "autotools.patch" and "makefile_no_gtk.patch".

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/alsa/alsa-tools/autotools.patch               | 2 +-
 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch         | 2 +-
 .../alsa/{alsa-tools_1.0.29.bb => alsa-tools_1.1.0.bb}                | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.29.bb => alsa-tools_1.1.0.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
index 59391d6..319f25d 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
@@ -20,7 +20,7 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
 --- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +0800
 +++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
 @@ -1,8 +1,8 @@
- VERSION = 1.0.29
+ VERSION = 1.1.0
  TOP = .
 -SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
 +SUBDIRS = as10k1 envy24control \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
index c957609..9bd6848 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -14,7 +14,7 @@ index 2457a1c..72346d9 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,9 +1,9 @@
- VERSION = 1.0.29
+ VERSION = 1.1.0
  TOP = .
 -SUBDIRS = as10k1 envy24control \
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
index fdf396e..9e633f1 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
@@ -16,8 +16,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            file://0001-as10k1-Make-output_tram_line-static-inline.patch \
           "
 
-SRC_URI[md5sum] = "f339a3cd24f748c9d007bdff0e98775b"
-SRC_URI[sha256sum] = "94abf0ab5a73f0710c70d4fb3dc1003af5bae2d2ed721d59d245b41ad0f2fbd1"
+SRC_URI[md5sum] = "b476a5afaa3ea3230855553ad59d259d"
+SRC_URI[sha256sum] = "7d34558c590a50294b36576d257316a1ac5cd951eb8cd7d330e09f8cc757ab51"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.7.0


