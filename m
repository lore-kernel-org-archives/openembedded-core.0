Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCyNp-0006gG-7L
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 20:13:41 +0200
Received: by mail-wy0-f175.google.com with SMTP id 20so1853045wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:11:16 -0700 (PDT)
Received: by 10.216.67.135 with SMTP id j7mr2602696wed.54.1303409475879;
	Thu, 21 Apr 2011 11:11:15 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s40sm1079773weq.28.2011.04.21.11.11.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:11:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 20:10:50 +0200
Message-Id: <1303409452-19263-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1303409452-19263-7-git-send-email-koen@dominion.thruhere.net>
References: <1303409452-19263-1-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-2-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-3-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-4-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-5-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-6-git-send-email-koen@dominion.thruhere.net>
	<1303409452-19263-7-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome 08/10] gcalctool: : import from oe-core rev 0a6f77f549c095692045825f4b5c4c5a2edff73c
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
X-List-Received-Date: Thu, 21 Apr 2011 18:13:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gcalctool/gcalctool/fix-includedir.patch       |   31 ++++++++++++++++++++
 .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |   13 ++++++++
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |   12 +++++++
 3 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb

diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch b/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
new file mode 100644
index 0000000..aeb02ab
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool/fix-includedir.patch
@@ -0,0 +1,31 @@
+---
+ Makefile.am           |    2 +-
+ gcalctool/Makefile.am |    2 --
+ 2 files changed, 1 insertion(+), 3 deletions(-)
+
+Index: gcalctool-5.8.17/gcalctool/Makefile.am
+===================================================================
+--- gcalctool-5.8.17.orig/gcalctool/Makefile.am	2005-12-19 15:46:57.000000000 +0000
++++ gcalctool-5.8.17/gcalctool/Makefile.am	2007-05-16 16:03:26.000000000 +0100
+@@ -1,8 +1,6 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ INCLUDES = \
+-	-I$(includedir) \
+-	-DG_DISABLE_DEPRECATED \
+ 	-DGDK_PIXBUF_DISABLE_DEPRECATED \
+ 	-DGDK_DISABLE_DEPRECATED \
+ 	-DGNOME_DISABLE_DEPRECATED \
+Index: gcalctool-5.8.17/Makefile.am
+===================================================================
+--- gcalctool-5.8.17.orig/Makefile.am	2007-05-16 15:35:44.000000000 +0100
++++ gcalctool-5.8.17/Makefile.am	2007-05-16 16:06:46.000000000 +0100
+@@ -29,7 +29,7 @@ DISTCLEANFILES =                \
+ 	gnome-doc-utils.make	\
+ 	gcalctool.desktop
+ 
+-SUBDIRS = po gcalctool help
++SUBDIRS = po gcalctool
+ 
+ SCHEMAS_FILE = gcalctool.schemas
+ 
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
new file mode 100644
index 0000000..f12e6c4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
@@ -0,0 +1,13 @@
+LICENSE = "GPL"
+SECTION = "x11"
+DEPENDS = "gtk+"
+DESCRIPTION = "gcalctool is a powerful calculator"
+PR = "r2"
+
+SRC_URI = "http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz \
+        file://makefile-fix.diff;patch=1\
+	file://fix-includedir.patch;patch=1"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-gnome"
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
new file mode 100644
index 0000000..c72860c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
@@ -0,0 +1,12 @@
+LICENSE = "GPL"
+SECTION = "x11"
+DEPENDS = "gtk+ gnome-doc-utils"
+DESCRIPTION = "gcalctool is a powerful calculator"
+PR = "r0"
+
+SRC_URI = "http://download.gnome.org/sources/${PN}/5.8/${PN}-${PV}.tar.gz \
+	file://fix-includedir.patch;patch=1"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--disable-gnome"
-- 
1.6.6.1



