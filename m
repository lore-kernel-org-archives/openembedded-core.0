Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC9-0004tn-G2
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652379"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:28 -0800
Message-Id: <b78c5fcd691f9d4f31708754f6614bbc7b7a9e21.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/25] task-self-hosted: make the package lists alphabetical
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
X-List-Received-Date: Thu, 23 Feb 2012 16:07:04 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.6.5



