Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id EAD786EFE9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 17:20:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.95,845,1384297200"; d="scan'208";a="41201312"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 14 Feb 2014 18:20:46 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 14 Feb 2014 18:20:46 +0100
Received: from u85.usr.ingenico.loc ([10.23.7.85]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Fri, 14 Feb 2014 18:20:46 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 18:15:36 +0100
Message-ID: <1392398136-29865-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
In-Reply-To: <1392395660-28806-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1392395660-28806-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-OriginalArrivalTime: 14 Feb 2014 17:20:46.0193 (UTC)
	FILETIME=[18F49E10:01CF29A9]
MIME-Version: 1.0
Subject: [PATCH v2] recipes: convert remaining SUMMARY/DESCRIPTION cosmetic issues
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
X-List-Received-Date: Fri, 14 Feb 2014 17:20:47 -0000
Content-Type: text/plain

Rename SUMMARY with length > 80 to DESCRIPTION.
Note: don't bump PR

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb              |  3 ++-
 meta/recipes-devtools/autogen/autogen-native_5.18.2.bb  |  2 +-
 meta/recipes-devtools/devel-config/nfs-export-root.bb   |  3 ++-
 meta/recipes-devtools/json-c/json-c_0.11.bb             |  3 ++-
 meta/recipes-graphics/xorg-proto/presentproto_git.bb    | 14 ++++++--------
 meta/recipes-multimedia/x264/x264_git.bb                |  3 ++-
 meta/recipes-support/libunistring/libunistring_0.9.3.bb |  2 +-
 7 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
index 0208509..e2c7cc0 100644
--- a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
+++ b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
@@ -1,4 +1,5 @@
-SUMMARY = "PCMCIA-cs configuration files for wireless LAN cards based on Intersil's Prism2/2.5/3 chipset"
+SUMMARY = "Configuration files for HostAP (wifi) driver"
+DESCRIPTION = "PCMCIA-cs configuration files for wireless LAN cards based on Intersil's Prism2/2.5/3 chipset."
 SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
index c7950c3..98bdb59 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
@@ -1,4 +1,4 @@
-SUMMARY = "AutoGen is a tool to manage programs that contain large amounts of repetitious text."
+SUMMARY = "Automated text and program generation tool"
 DESCRIPTION = "AutoGen is a tool designed to simplify the creation and\
  maintenance of programs that contain large amounts of repetitious text.\
  It is especially valuable in programs that have several blocks of text\
diff --git a/meta/recipes-devtools/devel-config/nfs-export-root.bb b/meta/recipes-devtools/devel-config/nfs-export-root.bb
index fc35cc8..169d005 100644
--- a/meta/recipes-devtools/devel-config/nfs-export-root.bb
+++ b/meta/recipes-devtools/devel-config/nfs-export-root.bb
@@ -1,4 +1,5 @@
-SUMMARY = "Enables NFS access from any host to the entire filesystem (for development purposes)"
+SUMMARY = "Configuration script to export target rootfs filesystem"
+DESCRIPTION = "Enables NFS access from any host to the entire filesystem (for development purposes)."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb b/meta/recipes-devtools/json-c/json-c_0.11.bb
index d1bf0e9..389e0f9 100644
--- a/meta/recipes-devtools/json-c/json-c_0.11.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.11.bb
@@ -1,4 +1,5 @@
-SUMMARY = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C"
+SUMMARY = "C bindings for apps which will manipulate JSON data"
+DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
 HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
diff --git a/meta/recipes-graphics/xorg-proto/presentproto_git.bb b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
index 007824f..bd6c60a 100644
--- a/meta/recipes-graphics/xorg-proto/presentproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
@@ -1,13 +1,11 @@
 require xorg-proto-common.inc
 
-SUMMARY = "The Present extension provides a way for applications to update their \
-           window contents from a pixmap in a well defined fashion, synchronizing \
-           with the display refresh and potentially using a more efficient \
-           mechanism than copying the contents of the source pixmap.\
-          "
-
-DESCRIPTION = "This package provides the basic headers for the X Window \
-System."
+SUMMARY = "This package provides the basic headers for the X Window System"
+DESCRIPTION = "The Present extension provides a way for applications to update their \
+               window contents from a pixmap in a well defined fashion, synchronizing \
+               with the display refresh and potentially using a more efficient \
+               mechanism than copying the contents of the source pixmap.\
+              "
 
 LICENSE = "GPLv2"
 
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 406df30..5ebf885 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -1,4 +1,5 @@
-SUMMARY = "A free software library and application for encoding video streams into the H.264/MPEG-4 AVC format"
+SUMMARY = "H.264/MPEG-4 AVC video encoder"
+DESCRIPTION = "A free software library and application for encoding video streams into the H.264/MPEG-4 AVC format."
 HOMEPAGE = "http://www.videolan.org/developers/x264.html"
 
 LICENSE = "GPLv2"
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
index 6cffef4..faabe03 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
@@ -1,4 +1,4 @@
-SUMMARY = "libunistring provides functions for manipulating according to the Unicode standard."
+SUMMARY = "Library for manipulating C and Unicode strings"
 
 DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
  consist of very different scripts from Latin letters to Chinese Hanzi\
-- 
1.8.5.4


