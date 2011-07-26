Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QldEe-0000Mn-0o
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 10:43:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2011 01:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,268,1309762800"; d="scan'208";a="32349568"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2011 01:39:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 16:36:57 +0800
Message-Id: <f7fda63d4b69592f85b4d2817755519be8e1b774.1311669316.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1311669316.git.dongxiao.xu@intel.com>
References: <cover.1311669316.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1311669316.git.dongxiao.xu@intel.com>
References: <cover.1311669316.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] Upstream-Status: Add Upstream-Status for some missing patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 08:43:28 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../connman/connman-gnome/3g.patch                 |    2 ++
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |    2 ++
 .../lame/lame-3.98.4/no-gtk1.patch                 |    2 ++
 .../libtheora/libtheora-1.1.1/no-docs.patch        |    2 ++
 .../libtiff/files/libtool2.patch                   |    2 ++
 .../pulseaudio/libatomics-ops/doublefix.patch      |    2 ++
 .../fedora/libatomic_ops-1.2-ppclwzfix.patch       |    5 +++++
 .../gentoo/libatomic_ops-1.2-mips.patch            |    4 ++++
 8 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome/3g.patch b/meta/recipes-connectivity/connman/connman-gnome/3g.patch
index c73c1ea..58fa5e6 100644
--- a/meta/recipes-connectivity/connman/connman-gnome/3g.patch
+++ b/meta/recipes-connectivity/connman/connman-gnome/3g.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 commit 15852e826b0b47f577718ada4b68b63515387f4d
 Author: dongxiao <dongxiao@dongxiao-osel.(none)>
 Date:   Wed Jun 1 14:56:16 2011 +0800
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
index 8626336..658e190 100644
--- a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
+++ b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 From f9b017c2c958d968cc5dfd36dc68fc8e5fb89a58 Mon Sep 17 00:00:00 2001
 From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
 Date: Fri, 11 Jun 2010 09:48:58 +0200
diff --git a/meta/recipes-multimedia/lame/lame-3.98.4/no-gtk1.patch b/meta/recipes-multimedia/lame/lame-3.98.4/no-gtk1.patch
index 8669d3b..e88d7f1 100644
--- a/meta/recipes-multimedia/lame/lame-3.98.4/no-gtk1.patch
+++ b/meta/recipes-multimedia/lame/lame-3.98.4/no-gtk1.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 # Acquired from OpenEmbedded
 
 --- lame-3.96.1/configure.in~no-gtk1.patch	2004-07-25 15:52:12.000000000 +0100
diff --git a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch b/meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch
index 5734bce..359f3d1 100644
--- a/meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch
+++ b/meta/recipes-multimedia/libtheora/libtheora-1.1.1/no-docs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: libtheora-1.1.1/Makefile.am
 ===================================================================
 --- libtheora-1.1.1.orig/Makefile.am	2009-11-25 22:01:53.593775926 +0100
diff --git a/meta/recipes-multimedia/libtiff/files/libtool2.patch b/meta/recipes-multimedia/libtiff/files/libtool2.patch
index 8285be5..2ee8309 100644
--- a/meta/recipes-multimedia/libtiff/files/libtool2.patch
+++ b/meta/recipes-multimedia/libtiff/files/libtool2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  configure.ac |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
index 2172cac..0d3b718 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops/doublefix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Double path references breaks recent autoconf+automake
 
 RP 2/1/10
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
index 51161db..315ae91 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops/fedora/libatomic_ops-1.2-ppclwzfix.patch
@@ -1,3 +1,8 @@
+Upstream-Status: Inappropriate [others]
+
+The patch is imported from fedora project, and is not appropriate for us
+to upstream it.
+
 http://cvs.fedoraproject.org/viewcvs/devel/libatomic_ops/libatomic_ops-1.2-ppclwzfix.patch
 
 * add fix for bad variable handling on PPC
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
index 29f07b9..971379d 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/libatomic_ops-1.2-mips.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Inappropriate [others]
+
+Patch from gentoo which is not appropriate for us to upstream.
+
 # Patch copied from the OpenEmbedded libatomics-ops recipe. Original
 # source was from Gentoo.
 #
-- 
1.7.1



