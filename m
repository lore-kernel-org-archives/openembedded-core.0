Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 376 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Jun 2016 17:02:23 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 195946FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:02:23 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 44970204D8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:09 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 06 Jun 2016 12:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=jEK+qGbYnFSystu9SpDSQX2K748=; b=Y0GCj
	9JTNJ2jxDvKEvINc+a//saRYA1yD+2P+6dnmOHJDpxUNxMSZ8SkxW1QcPS3IcN0n
	0QCmU2YQWsd/5BthD7YeWnEoBja8rw4Ze64lN9nG2QnMNftZoIpodyFavKGjIV+K
	lSpYnH/6Tomlqujks8fbD/6m2XvxFmgRrecQQ0=
X-Sasl-enc: 70vYhyGqr2G+z07yu7PDUlR6iiAzJ7E/pDjlx2N0LhFu 1465232168
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id C6087F2022
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:08 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 19:55:55 +0300
Message-Id: <16a9498dbff45e54bc999c9a56a015f11bd4d07c.1465231939.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
Subject: [PATCH 1/4] alsa: update BUGTRACKER links
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
X-List-Received-Date: Mon, 06 Jun 2016 17:02:24 -0000

The old bug tracker is defunct.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     | 2 +-
 meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb | 1 +
 meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb   | 2 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb   | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
index 296a7bb..cff3d01 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "ALSA sound library"
 HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
+BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
index fec6575..e541017 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "ALSA Plugins"
 HOMEPAGE = "http://alsa-project.org"
+BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "multimedia"
 
 # The primary license of alsa-plugins is LGPLv2.1.
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
index 916bf08..8d4a146 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Advanced tools for certain ALSA sound card drivers"
 HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
+BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses glib-2.0"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
index af40488..62b1686 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "ALSA sound utilities"
 HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
+BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-- 
2.8.1


