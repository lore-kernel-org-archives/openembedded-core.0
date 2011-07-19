Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3a-0001ds-OJ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396961"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:06 -0700
Message-Id: <87c3e1db7585b86dac141ca603bf5cb8f1b482d6.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/22] man: add Upstream-Status field to paches
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
X-List-Received-Date: Tue, 19 Jul 2011 14:13:55 -0000

From: Scott Garman <scott.a.garman@intel.com>

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../man/man-1.6f/man-1.5g-nonrootbuild.patch       |    4 ++++
 .../man/man-1.6f/man-1.5h1-gencat.patch            |    4 ++++
 .../man/man-1.6f/man-1.5h1-make.patch              |    4 ++++
 .../man/man-1.6f/man-1.5i2-initial.patch           |    4 ++++
 .../man/man-1.6f/man-1.5i2-newline.patch           |    4 ++++
 .../man/man-1.6f/man-1.5i2-overflow.patch          |    4 ++++
 .../man/man-1.6f/man-1.5j-i18n.patch               |    4 ++++
 .../man/man-1.6f/man-1.5j-nocache.patch            |    4 ++++
 .../man/man-1.6f/man-1.5j-utf8.patch               |    4 ++++
 .../man/man-1.6f/man-1.5k-confpath.patch           |    4 ++++
 .../man/man-1.6f/man-1.5k-nonascii.patch           |    4 ++++
 .../man/man-1.6f/man-1.5k-sofix.patch              |    4 ++++
 .../man/man-1.6f/man-1.5m2-bug11621.patch          |    4 ++++
 .../man/man-1.6f/man-1.5m2-buildroot.patch         |    4 ++++
 .../man/man-1.6f/man-1.5m2-multiple.patch          |    4 ++++
 .../man-1.6f/man-1.5m2-no-color-for-printing.patch |    4 ++++
 .../man/man-1.6f/man-1.5m2-sigpipe.patch           |    4 ++++
 .../man/man-1.6f/man-1.5m2-tv_fhs.patch            |    4 ++++
 .../man/man-1.6f/man-1.6e-i18n_whatis.patch        |    4 ++++
 .../man/man-1.6f/man-1.6e-lzma+xz-support.patch    |    4 ++++
 .../man/man-1.6f/man-1.6e-mandirs.patch            |    4 ++++
 .../man/man-1.6f/man-1.6e-new_sections.patch       |    4 ++++
 .../man/man-1.6f/man-1.6e-ro_usr.patch             |    4 ++++
 .../man/man-1.6f/man-1.6e-security.patch           |    4 ++++
 .../man-1.6e-use_i18n_vars_in_a_std_way.patch      |    4 ++++
 .../man/man-1.6f/man-1.6e-whatis2.patch            |    4 ++++
 26 files changed, 104 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5g-nonrootbuild.patch b/meta/recipes-extended/man/man-1.6f/man-1.5g-nonrootbuild.patch
index ae2bc4d..6f834bd 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5g-nonrootbuild.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5g-nonrootbuild.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -u -r man-1.5g.old/configure man-1.5g/configure
 --- man-1.5g.old/configure	Wed Apr  7 04:16:05 1999
 +++ man-1.5g/configure	Mon May 15 15:22:44 2000
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5h1-gencat.patch b/meta/recipes-extended/man/man-1.6f/man-1.5h1-gencat.patch
index 6409dfc..044b14c 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5h1-gencat.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5h1-gencat.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- gencat/genlib.c	2006-08-02 20:11:44.000000000 +0200
 +++ gencat/genlib.c.oden	2008-12-21 19:18:50.000000000 +0100
 @@ -47,6 +47,7 @@ up-to-date.  Many thanks.
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5h1-make.patch b/meta/recipes-extended/man/man-1.6f/man-1.5h1-make.patch
index f9f91e4..8631eb2 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5h1-make.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5h1-make.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5g/man/Makefile.in.mike	Fri Apr  9 13:35:54 1999
 +++ man-1.5g/man/Makefile.in	Fri Apr  9 13:36:45 1999
 @@ -1,8 +1,8 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5i2-initial.patch b/meta/recipes-extended/man/man-1.6f/man-1.5i2-initial.patch
index 1b14423..fe56c07 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5i2-initial.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5i2-initial.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5i2/src/makewhatis.sh.initial	Tue Jul  3 15:38:39 2001
 +++ man-1.5i2/src/makewhatis.sh	Tue Jul  3 15:39:39 2001
 @@ -81,8 +81,10 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5i2-newline.patch b/meta/recipes-extended/man/man-1.6f/man-1.5i2-newline.patch
index da95d5a..611df5d 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5i2-newline.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5i2-newline.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- src/man.c	2008-12-21 19:17:31.000000000 +0100
 +++ src/man.c.oden	2008-12-21 19:17:38.000000000 +0100
 @@ -391,7 +391,7 @@ again:
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5i2-overflow.patch b/meta/recipes-extended/man/man-1.6f/man-1.5i2-overflow.patch
index f1ef06b..52d2881 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5i2-overflow.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5i2-overflow.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5i2/src/man.c.overflow	Mon Jun 25 00:01:45 2001
 +++ man-1.5i2/src/man.c	Mon Jun 25 00:01:45 2001
 @@ -381,6 +381,9 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5j-i18n.patch b/meta/recipes-extended/man/man-1.6f/man-1.5j-i18n.patch
index 7645542..2ae09c0 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5j-i18n.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5j-i18n.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5j/msgs/inst.sh.i18n	Wed Apr 25 10:40:50 2001
 +++ man-1.5j/msgs/inst.sh	Wed Apr 25 10:41:17 2001
 @@ -27,8 +27,7 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5j-nocache.patch b/meta/recipes-extended/man/man-1.6f/man-1.5j-nocache.patch
index 267b34b..751dddd 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5j-nocache.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5j-nocache.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5j/src/man.conf.in.nocache	Thu Nov 22 15:07:12 2001
 +++ man-1.5j/src/man.conf.in	Thu Nov 22 15:07:12 2001
 @@ -81,6 +81,9 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5j-utf8.patch b/meta/recipes-extended/man/man-1.6f/man-1.5j-utf8.patch
index c817763..33d3e4c 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5j-utf8.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5j-utf8.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5j/configure.utf8	Thu Nov 22 15:02:35 2001
 +++ man-1.5j/configure	Thu Nov 22 15:03:15 2001
 @@ -408,9 +408,9 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5k-confpath.patch b/meta/recipes-extended/man/man-1.6f/man-1.5k-confpath.patch
index 71ac9fc..b5746c2 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5k-confpath.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5k-confpath.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- configure	2006-05-01 19:56:14.000000000 +0200
 +++ configure.oden	2008-12-21 19:16:50.000000000 +0100
 @@ -198,7 +198,7 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5k-nonascii.patch b/meta/recipes-extended/man/man-1.6f/man-1.5k-nonascii.patch
index 465d839..d662d9b 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5k-nonascii.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5k-nonascii.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- ./src/apropos.sh.nonascii	2001-11-23 00:30:42.000000000 +0100
 +++ ./src/apropos.sh	2002-08-13 15:44:53.000000000 +0200
 @@ -18,9 +18,9 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5k-sofix.patch b/meta/recipes-extended/man/man-1.6f/man-1.5k-sofix.patch
index d4522ea..50b9252 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5k-sofix.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5k-sofix.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5j/src/man.c.sofix	Thu Nov 22 14:51:44 2001
 +++ man-1.5j/src/man.c	Thu Nov 22 14:52:44 2001
 @@ -300,7 +300,7 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5m2-bug11621.patch b/meta/recipes-extended/man/man-1.6f/man-1.5m2-bug11621.patch
index 9c06c4c..0512999 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5m2-bug11621.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5m2-bug11621.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- ./configure.ad	2003-12-11 19:17:10.000000000 +0100
 +++ ./configure	2003-12-11 19:17:27.000000000 +0100
 @@ -26,7 +26,7 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5m2-buildroot.patch b/meta/recipes-extended/man/man-1.6f/man-1.5m2-buildroot.patch
index d842083..bc97f56 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5m2-buildroot.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5m2-buildroot.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- ./configure.less	2003-12-11 19:18:15.000000000 +0100
 +++ ./configure	2003-12-11 19:20:03.000000000 +0100
 @@ -401,18 +401,13 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5m2-multiple.patch b/meta/recipes-extended/man/man-1.6f/man-1.5m2-multiple.patch
index cc5bffd..ec06ab7 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5m2-multiple.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5m2-multiple.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5m2/src/manfile.c_multiple	2006-12-08 23:42:17.000000000 +0100
 +++ man-1.5m2/src/manfile.c	2006-12-09 00:00:01.000000000 +0100
 @@ -25,9 +25,12 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5m2-no-color-for-printing.patch b/meta/recipes-extended/man/man-1.6f/man-1.5m2-no-color-for-printing.patch
index d1f810a..c85ff1d 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5m2-no-color-for-printing.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5m2-no-color-for-printing.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5m2/configure.color	2006-09-16 18:27:37.000000000 +0200
 +++ man-1.5m2/configure	2006-09-16 18:28:44.000000000 +0200
 @@ -539,6 +539,8 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5m2-sigpipe.patch b/meta/recipes-extended/man/man-1.6f/man-1.5m2-sigpipe.patch
index 81fb2d7..8af78ea 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5m2-sigpipe.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5m2-sigpipe.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.5m2/src/util.c_sigpipe	2006-12-09 13:43:21.000000000 +0100
 +++ man-1.5m2/src/util.c	2006-12-09 13:53:13.000000000 +0100
 @@ -116,11 +116,14 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.5m2-tv_fhs.patch b/meta/recipes-extended/man/man-1.6f/man-1.5m2-tv_fhs.patch
index 20389d9..fe66d75 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.5m2-tv_fhs.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.5m2-tv_fhs.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man/Makefile.in	2008-12-21 19:19:33.000000000 +0100
 +++ man/Makefile.in.oden	2008-12-21 19:19:39.000000000 +0100
 @@ -34,6 +34,15 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-i18n_whatis.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-i18n_whatis.patch
index ad62a60..e321325 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-i18n_whatis.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-i18n_whatis.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -Naur man-1.6e.orig/src/apropos.sh man-1.6e/src/apropos.sh
 --- man-1.6e.orig/src/apropos.sh	2007-05-18 13:49:31.000000000 -0300
 +++ man-1.6e/src/apropos.sh	2007-05-18 14:24:33.000000000 -0300
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-lzma+xz-support.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-lzma+xz-support.patch
index f8ade4f..aae980f 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-lzma+xz-support.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-lzma+xz-support.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: man-1.6f/configure
 ===================================================================
 --- man-1.6f.orig/configure	2010-12-29 14:00:35.000000000 -0800
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-mandirs.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-mandirs.patch
index 06e9869..b240064 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-mandirs.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-mandirs.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.6e.orig/src/man.conf.in	2005-08-20 20:26:06.000000000 -0300
 +++ man-1.6e/src/man.conf.in	2007-05-18 10:30:29.000000000 -0300
 @@ -36,11 +36,12 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-new_sections.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-new_sections.patch
index 5172758..fb9773c 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-new_sections.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-new_sections.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 --- man-1.6e.orig/configure	2006-05-01 14:56:14.000000000 -0300
 +++ man-1.6e/configure	2007-05-18 14:35:43.000000000 -0300
 @@ -960,7 +960,7 @@
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-ro_usr.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-ro_usr.patch
index d330e62..1d1cb0c 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-ro_usr.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-ro_usr.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: man-1.6f/src/makewhatis.sh
 ===================================================================
 --- man-1.6f.orig/src/makewhatis.sh	2010-12-29 13:42:34.000000000 -0800
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-security.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-security.patch
index 85fdf4e..312a882 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-security.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-security.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -Naur man-1.6e.orig/src/makewhatis.sh man-1.6e/src/makewhatis.sh
 --- man-1.6e.orig/src/makewhatis.sh	2006-07-19 01:58:08.000000000 -0300
 +++ man-1.6e/src/makewhatis.sh	2007-05-18 10:18:31.000000000 -0300
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-use_i18n_vars_in_a_std_way.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-use_i18n_vars_in_a_std_way.patch
index a448da5..568f742 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-use_i18n_vars_in_a_std_way.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-use_i18n_vars_in_a_std_way.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 diff -Naur man-1.6e.orig/catopen/catopen.c man-1.6e/catopen/catopen.c
 --- man-1.6e.orig/catopen/catopen.c	2005-08-20 20:26:06.000000000 -0300
 +++ man-1.6e/catopen/catopen.c	2007-05-18 11:31:05.000000000 -0300
diff --git a/meta/recipes-extended/man/man-1.6f/man-1.6e-whatis2.patch b/meta/recipes-extended/man/man-1.6f/man-1.6e-whatis2.patch
index 1a10be3..7f01383 100644
--- a/meta/recipes-extended/man/man-1.6f/man-1.6e-whatis2.patch
+++ b/meta/recipes-extended/man/man-1.6f/man-1.6e-whatis2.patch
@@ -1,3 +1,7 @@
+Upstream-Status: Pending
+
+Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
 Index: man-1.6f/src/makewhatis.sh
 ===================================================================
 --- man-1.6f.orig/src/makewhatis.sh	2010-12-29 13:51:45.000000000 -0800
-- 
1.7.3.4



