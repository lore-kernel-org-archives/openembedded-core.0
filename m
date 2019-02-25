Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEE37C8DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 15:56:41 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BF17224494
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 10:56:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 25 Feb 2019 10:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vdv/5yDDdUnfovMVc
	C3f0CtnAbfxw8T+h58dXyf1bwE=; b=5WGIkHoW52+wu1S5TNJJNk1bQUKf1V7rm
	Fk6pi9SkKD4B86EmgjBcJdsivPUKOg/uG5g1/WR8kBoqDnKsWpX1jX5uoQkpa3pi
	tTem3g6ui2NETKJGbwgYt64zFM+Kh0PznWWHcuJwfpgRoFrv+2vHxA+hy5M8IUmq
	H0+yer8ZwxgkVS5Q8JJ0XxQJWtFBxjVXhYOcl5lw5/u+BW8dxXNO6+1gMlQ7is4H
	8mSRPtRn4Qks0PIuqGsUyqvQm8w0YNsZgafQ7KNTpxiDYJd7nbBERTl4b2eTchSx
	ye3m/xAuxrKZJeLZIdNJ2qjNqD6mrxk/7c2rIS8x5qnFAQQGyJvNw==
X-ME-Sender: <xms:OhB0XJZRgVrYjQxzDTHxfvXOodIRl53HsrtZQXojiiMSuJR9vycIGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrudejgdekheculddtuddrgedtledrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhf
	iheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepkeekrd
	duudefrddvuddurdejvdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhk
	ihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:OhB0XMPr1b8tIT5tLw9Idlt4UT6FUreYwDArW2W5tCdp_Ls7iYB4eQ>
	<xmx:OhB0XHXN-xkP1lZJpMMjk9Dm_OQDsMEnIXQu9nLe9rSeKNAi2caGuw>
	<xmx:OhB0XBLWV1vjpyFbOxrl3Cer1ZrxU2o1FK2awcUe2ppcazRAMmPapw>
	<xmx:OhB0XGvsmwH2WIl80gl8MIdTTzKrsJgPCPkS_7fBY019IAuCtEMcZA>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id C38E5E423B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 10:56:41 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 17:56:15 +0200
Message-Id: <20190225155615.31481-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] alsa-tools: 1.1.6 -> 1.1.7
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
X-List-Received-Date: Mon, 25 Feb 2019 15:56:42 -0000
Content-Transfer-Encoding: 8bit

Changelog:
http://alsa-project.org/main/index.php/Changes_v1.1.6_v1.1.7

The two patches have now been upstreamed. Apart from those changes, the
only thing that changed was the hwmixvolume tool, which got ported from
PyGTK to PyGObject, and from GTK 2 to GTK 3.

When testing hwmixvolume, I found that it depends on pyalsa, which has
not been packaged for OE. I believe hwmixvolume has never worked on OE.
It certainly didn't work before this patch, trying to build it failed
due to python-pygtk not being available. Even if python-pygtk was
available at some point in the past, hwmixvolume has always used pyalsa,
but the alsa-tools recipe has never had that dependency declared.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...served-user-defined-literal-warnings.patch | 34 --------------
 .../alsa/alsa-tools/musl.patch                | 47 -------------------
 ...lsa-tools_1.1.6.bb => alsa-tools_1.1.7.bb} | 14 +++---
 3 files changed, 7 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/musl.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.6.bb => alsa-tools_1.1.7.bb} (90%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
deleted file mode 100644
index c137bc8a28..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From a861bdabf02cd9bfb3ec7c0571c563c0fa14adfb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Apr 2018 12:24:32 -0700
-Subject: [PATCH] us428control: Fix clang -Wreserved-user-defined-literal
- warnings
-
-| us428control.cc:66:18: error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
-|         printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
-|                         ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- us428control/us428control.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/us428control/us428control.cc b/us428control/us428control.cc
-index e839bf4..8cb3c42 100644
---- a/us428control/us428control.cc
-+++ b/us428control/us428control.cc
-@@ -63,7 +63,7 @@ static void usage(void)
- {
- 	printf("Tascam US-428 Control\n");
- 	printf("version %s\n", VERSION);
--	printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
-+	printf("usage: " PROGNAME " [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
- 	printf("mode is one of (us224, us428, mixxx)\n");
- }
- /*
--- 
-1.7.11.7
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/musl.patch b/meta/recipes-multimedia/alsa/alsa-tools/musl.patch
deleted file mode 100644
index 9eb129c379..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/musl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 235d9c5e8381518b0a8661786e7e0cbdd1bbcd01 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 12 Jun 2018 13:24:34 +0100
-Subject: [PATCH] ld10k1: define _GNU_SOURCE and use sighandler_t
-
-__sighandler_t is a glibc internal type which doesn't exist in musl.  By using
-AC_USE_SYSTEM_EXTENSIONS to get _GNU_SOURCE defined, both glibc and musl
-then expose sighandler_t.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- ld10k1/configure.ac      | 1 +
- ld10k1/src/ld10k1_fnc1.c | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/ld10k1/configure.ac b/ld10k1/configure.ac
-index 276b24e..f48ca31 100644
---- a/ld10k1/configure.ac
-+++ b/ld10k1/configure.ac
-@@ -4,6 +4,7 @@ AC_CONFIG_MACRO_DIR([m4])
- AM_MAINTAINER_MODE([enable])
- 
- AC_CONFIG_HEADERS(config.h)
-+AC_USE_SYSTEM_EXTENSIONS
- AC_PROG_CC
- AC_PROG_LD
- AC_PROG_INSTALL
-diff --git a/ld10k1/src/ld10k1_fnc1.c b/ld10k1/src/ld10k1_fnc1.c
-index 343584c..ddc43c6 100644
---- a/ld10k1/src/ld10k1_fnc1.c
-+++ b/ld10k1/src/ld10k1_fnc1.c
-@@ -179,7 +179,7 @@ int main_loop(comm_param *param, int audigy, const char *card_id, int tram_size,
- {
- 	fd_set active_fd_set/*, read_fd_set*/;
- 	int i, j, res = 0;
--	__sighandler_t old_sig_pipe;
-+	sighandler_t old_sig_pipe;
- 
- 	int main_sock = 0;
- 	int data_sock = 0;
--- 
-2.11.0
-
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
similarity index 90%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
index 0662b5a78d..e1b50fac52 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.7.bb
@@ -9,13 +9,10 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
                     file://ld10k1/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2 \
-           file://0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch \
-           file://musl.patch \
-           "
+SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "5ca8c9437ae779997cd62fb2815fef19"
-SRC_URI[sha256sum] = "d69c4dc2fb641a974d9903e9eb78c94cb0c7ac6c45bae664f0c9d6c0a1593227"
+SRC_URI[md5sum] = "475bdf6457bcf55c8c895d653ee56a54"
+SRC_URI[sha256sum] = "a0243328a8f6f691a3055c484fd8d3326393096325e93743b246029d327c4ef6"
 
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree
@@ -38,7 +35,6 @@ PACKAGECONFIG[hdajacksensetest] = ",,glib-2.0"
 PACKAGECONFIG[hdspconf] = ",,fltk"
 PACKAGECONFIG[hdsploader] = ""
 PACKAGECONFIG[hdspmixer] = ",,fltk"
-PACKAGECONFIG[hwmixvolume] = ",,,python-core python-pygtk"
 PACKAGECONFIG[ld10k1] = ""
 PACKAGECONFIG[mixartloader] = ""
 PACKAGECONFIG[pcxhrloader] = ""
@@ -51,6 +47,10 @@ PACKAGECONFIG[us428control] = ""
 PACKAGECONFIG[usx2yloader] = ""
 PACKAGECONFIG[vxloader] = ""
 
+# At the time of writing pyalsa is not packaged for OE, so this is not expected
+# to work.
+PACKAGECONFIG[hwmixvolume] = ",,,python-core python-pygobject pyalsa"
+
 python do_configure() {
     for subdir in d.getVar("PACKAGECONFIG").split():
         subdir = subdir.replace("--", "/")
-- 
2.20.1


