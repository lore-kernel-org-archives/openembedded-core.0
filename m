Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S0PYu-0004Nr-DG
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 04:41:44 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2012 19:33:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="113726412"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2012 19:33:21 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:33:45 +0800
Message-Id: <a347ae3ef53afdd663c2af02a2a291f16a0386c3.1329967965.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1329967965.git.dexuan.cui@intel.com>
References: <cover.1329967965.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329967965.git.dexuan.cui@intel.com>
References: <cover.1329967965.git.dexuan.cui@intel.com>
Subject: [PATCH 2/2] task-self-hosted: make the package lists alphabetical
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
X-List-Received-Date: Thu, 23 Feb 2012 03:41:44 -0000

This patch makes no actual change to the functionality of the recipe.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |   36 +++++++++++++-------------
 1 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index c9a8c49..3c5fad6 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -53,20 +53,20 @@ RDEPENDS_task-self-hosted-host-tools = "\
 RDEPENDS_task-self-hosted-sdk = "\
     autoconf \
     automake \
-    binutils-symlinks \
     binutils \
-    cpp \
-    cpp-symlinks \
+    binutils-symlinks \
     ccache \
     coreutils \
+    cpp \
+    cpp-symlinks \
     distcc \
     eglibc-utils \
     file \
     findutils \
-    gcc \
-    gcc-symlinks \
     g++ \
     g++-symlinks \
+    gcc \
+    gcc-symlinks \
     intltool \
     ldd \
     less \
@@ -85,9 +85,9 @@ RDEPENDS_task-self-hosted-sdk = "\
 RDEPENDS_task-self-hosted-debug = " \
     gdb \
     gdbserver \
-    tcf-agent \
     rsync \
-    strace"
+    strace \
+    tcf-agent"
 
 
 RDEPENDS_task-self-hosted-extended = "\
@@ -101,16 +101,17 @@ RDEPENDS_task-self-hosted-extended = "\
     elfutils \
     expat \
     gamin \
+    gawk \
     gdbm \
-    git \
     gettext \
     gettext-runtime \
+    git \
     grep \
     groff \
-    gawk \
+    gzip \
     libaio \
-    libxml2 \
     libusb1 \
+    libxml2 \
     lrzsz \
     lsof \
     lzo \
@@ -133,11 +134,13 @@ RDEPENDS_task-self-hosted-extended = "\
     python \
     python-compile \
     python-compiler \
+    python-compression \
     python-core \
     python-curses \
     python-datetime \
     python-distutils \
     python-elementtree \
+    python-email \
     python-fcntl \
     python-logging \
     python-misc \
@@ -145,17 +148,15 @@ RDEPENDS_task-self-hosted-extended = "\
     python-netclient \
     python-netserver \
     python-pickle \
+    python-pkgutil \
     python-re \
     python-rpm \
     python-shell \
     python-sqlite3 \
     python-subprocess \
     python-textutils \
-    python-xmlrpc \
-    python-email \
     python-unixadmin \
-    python-compression \
-    python-pkgutil \
+    python-xmlrpc \
     quota \
     readline \
     rpm \
@@ -164,12 +165,11 @@ RDEPENDS_task-self-hosted-extended = "\
     sudo \
     sysstat \
     tar \
-    gzip \
     tcl \
     texi2html \
     texinfo \
-    usbutils \
     unzip \
+    usbutils \
     watchdog \
     wget \
     which \
@@ -180,7 +180,7 @@ RDEPENDS_task-self-hosted-extended = "\
 
 
 RDEPENDS_task-self-hosted-graphics = "\
-    python-pygtk \
+    builder \
     libgl \
     libgl-dev \
     libglu \
@@ -188,5 +188,5 @@ RDEPENDS_task-self-hosted-graphics = "\
     libsdl \
     libsdl-dev \
     libx11-dev \
-    builder \
+    python-pygtk \
     "
-- 
1.7.6



