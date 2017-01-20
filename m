Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Jan 2017 09:36:03 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id A03CC71E30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 09:36:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E8C2B2073F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 04:26:35 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 20 Jan 2017 04:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Uf
	CkoHEl6kkYbtA6BksCyJ4n4l8=; b=AqfDbxo/JOfd3+sTDafJBmzTA88xHZOJtN
	8qIyWWZpqxuIv4Hoc8/KU2ZV1MtV8/XMmwYKHVmarf2aFiDEwRyCbl/uZd4laTyz
	8WS3u3QdZNJ3e6Wh/8quv8lqxByuHP/ytp1T7KnhDoeApHvMV3akE86YOMrp8L+O
	cZFwSdtqM=
X-ME-Sender: <xms:y9eBWKcsdzUH5h69enb3LFIjsd60k0aQPxOxKyjS95XYs3PL-sO8xQ>
X-Sasl-enc: ikDgC7yC4gy3moAOKLab3b8XXFik2wl3Btp4urgjr93A 1484904395
Received: from localhost.localdomain (unknown [192.40.95.5])
	by mail.messagingengine.com (Postfix) with ESMTPA id 618937EA6A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 04:26:35 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:26:28 +0200
Message-Id: <20170120092629.15146-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] alsa-tools: 1.1.0 -> 1.1.3
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
X-List-Received-Date: Fri, 20 Jan 2017 09:36:04 -0000

Drop 0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch,
because the new release has an equivalent fix (and that's actually the
only change in the new release).

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...idi-Explicitly-cast-constant-to-char-type.patch | 75 ----------------------
 .../{alsa-tools_1.1.0.bb => alsa-tools_1.1.3.bb}   |  5 +-
 2 files changed, 2 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.0.bb => alsa-tools_1.1.3.bb} (87%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch b/meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch
deleted file mode 100644
index bf95cac440..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 1cc0aa4dbd3c7f1267809e0e1ca57d46f4803bfd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 17 Apr 2016 23:25:18 +0000
-Subject: [PATCH] Cus428Midi: Explicitly cast constant to char type
-
-This is flagged by gcc6
-Cus428Midi.cc:83:1: error: narrowing conversion of '-1' from 'int' to 'char' inside { } [-Wnarrowing]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- us428control/Cus428Midi.cc | 30 +++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/us428control/Cus428Midi.cc b/us428control/Cus428Midi.cc
-index b9e6783..bef7bb1 100644
---- a/us428control/Cus428Midi.cc
-+++ b/us428control/Cus428Midi.cc
-@@ -32,22 +32,22 @@ char Cus428Midi::KnobParam[] = {
- 	0x2A,
- 	0x29,
- 	0x28,
--	-1,
-+	static_cast<char>(-1),
- 	0x10,
- 	0x11,
- 	0x18,
- 	0x19,
- 	0x1A,
--	-1,
--	-1,
--	-1,
--	-1,
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
- 	0x2C,
- 	0x2D,
- 	0x2E,
- 	0x2F,
--	-1,
--	-1,
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
- 	0x20,
- 	0x21,
- 	0x22,
-@@ -64,14 +64,14 @@ char Cus428Midi::KnobParam[] = {
- 	5,
- 	6,
- 	7,
--	-1,
--	-1,
--	-1,
--	-1,
--	-1,
--	-1,
--	-1,
--	-1,
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
-+	static_cast<char>(-1),
- 	0x30,
- 	0x31,
- 	0x32,
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
index 8d4a146580..1955fec618 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.3.bb
@@ -13,11 +13,10 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
            file://gitcompile_hdajacksensetest \
            file://0001-as10k1-Make-output_tram_line-static-inline.patch \
-           file://0001-Cus428Midi-Explicitly-cast-constant-to-char-type.patch \
            "
 
-SRC_URI[md5sum] = "b476a5afaa3ea3230855553ad59d259d"
-SRC_URI[sha256sum] = "7d34558c590a50294b36576d257316a1ac5cd951eb8cd7d330e09f8cc757ab51"
+SRC_URI[md5sum] = "b23eaae687d55410b92587c2053b301f"
+SRC_URI[sha256sum] = "d88f1dcd6872121383eded5fa24e328e68c54e527db4547e1435d5eabc2b6709"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.11.0


