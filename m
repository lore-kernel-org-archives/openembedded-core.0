Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcye-0007DK-4p
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:44 +0100
Received: by mail-ww0-f43.google.com with SMTP id 15so3168700wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:30:22 -0800 (PST)
Received: by 10.216.163.69 with SMTP id z47mr3791817wek.43.1298799022765;
	Sun, 27 Feb 2011 01:30:22 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm1287220wee.2.2011.02.27.01.30.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:22 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:57 +0100
Message-Id: <536f17b90bd8dda8511b8ef9e7f5f387db50fc93.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 44/50] task-poky-lsb: add necessary packages name
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
X-List-Received-Date: Sun, 27 Feb 2011 09:36:27 -0000

From: Jingdong Lu <jingdong.lu@windriver.com>

In order to install and run LSB test cases we should add some necessary packages name
into task-poky-lsb for lsb image.

[sgw: modified the perl and python lists to use the core -modules, removed mesa-dri]
Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tasks/task-poky-lsb.bb |   62 +++++++++++++++++++++++++-
 1 files changed, 61 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-poky-lsb.bb b/meta/recipes-extended/tasks/task-poky-lsb.bb
index 9d308e7..5120764 100644
--- a/meta/recipes-extended/tasks/task-poky-lsb.bb
+++ b/meta/recipes-extended/tasks/task-poky-lsb.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Small Image Tasks"
-PR = "r2"
+PR = "r3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${POKYBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${POKYBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -28,8 +28,14 @@ PACKAGES = "\
     task-poky-tcl \
     task-poky-tcl-dbg \
     task-poky-tcl-dev \
+    task-poky-lsb-perl-add \
+    task-poky-lsb-python-add \
+    task-poky-lsb-graphic-add \
+    task-poky-lsb-runtime-add \
+    task-poky-lsb-command-add \
     "
 
+
 ALLOW_EMPTY = "1"
 
 RDEPENDS_task-poky-lsb = "\
@@ -39,6 +45,11 @@ RDEPENDS_task-poky-lsb = "\
     task-poky-perl \
     task-poky-python \
     task-poky-tcl \
+    task-poky-lsb-perl-add \
+    task-poky-lsb-python-add \
+    task-poky-lsb-graphic-add \
+    task-poky-lsb-runtime-add \
+    task-poky-lsb-command-add \
     "
 
 #
@@ -111,3 +122,52 @@ RDEPENDS_task-poky-misc = "\
     usbutils \
     zlib \
     "
+
+RDEPENDS_task-poky-lsb-command-add = "\
+    localedef \
+    fontconfig-utils \
+    mailx \
+    msmtp \
+"
+#    cups
+
+RDEPENDS_task-poky-lsb-perl-add = "\
+    perl-modules \
+    perl-dev \
+    perl-misc \
+    perl-pod \
+"
+
+RDEPENDS_task-poky-lsb-python-add = "\
+    python-modules \
+"
+
+RDEPENDS_task-poky-lsb-graphic-add = "\
+    libqtcore4 \
+    libqtgui4 \
+    libqtsql4 \
+    libqtsvg4 \
+    libqtxml4 \
+    libqtnetwork4 \
+    libqtopengl4 \
+    libxt \
+    libxxf86vm \
+    libdrm \
+    libglu \
+    libxi \
+    libxtst \
+    qt4-plugin-sqldriver-sqlite \
+"
+
+#    mesa-dri 
+
+RDEPENDS_task-poky-lsb-runtime-add = "\
+    ldd \
+    pam-plugin-wheel \
+    e2fsprogs-mke2fs \
+    eglibc-localedata-posix \
+    mkfontdir \
+    liburi-perl \
+    libxml-parser-perl \
+    libxml-perl \
+"
-- 
1.6.6.1



