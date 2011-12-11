Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIG-0003rc-MH
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:54:52 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045443"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:47:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:31 -0800
Message-Id: <d2ad4a428f57f8995c53dd72f47c02a94fa320f3.1323643433.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/26] task-self-hosted: Reorder by Alpha
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
X-List-Received-Date: Sun, 11 Dec 2011 22:54:52 -0000

No additions/subtractions

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |   38 +++++++++++++-------------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index b3a68b4..e359b3d 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -27,9 +27,6 @@ RDEPENDS_task-self-hosted = "\
 
 # eglibc-utils: for rpcgen
 RDEPENDS_task-self-hosted-sdk = "\
-    sed \
-    mktemp \
-    eglibc-utils \
     autoconf \
     automake \
     binutils-symlinks \
@@ -37,27 +34,30 @@ RDEPENDS_task-self-hosted-sdk = "\
     cpp \
     cpp-symlinks \
     ccache \
+    coreutils \
+    diffutils \
+    distcc \
+    eglibc-utils \
+    file \
+    findutils \
     gcc \
     gcc-symlinks \
     g++ \
     g++-symlinks \
     gettext \
-    make \
     intltool \
+    ldd \
+    less \
     libstdc++ \
     libstdc++-dev \
     libtool \
+    make \
+    mktemp \
     perl-module-re \
     perl-module-text-wrap \
-    coreutils \
-    diffutils \
     pkgconfig \
-    findutils \
     quilt \
-    less \
-    distcc \
-    ldd \
-    file \
+    sed \
     tcl \
     "
 
@@ -74,6 +74,7 @@ RDEPENDS_task-self-hosted-extended = "\
     bzip2 \
     chkconfig \
     chrpath \
+    cpio \
     curl \
     dhcp-client \
     diffstat \
@@ -89,6 +90,12 @@ RDEPENDS_task-self-hosted-extended = "\
     groff \
     gawk \
     hdparm \
+    iptables \
+    kernel-module-tun \
+    kernel-module-iptable-raw \
+    kernel-module-iptable-nat \
+    kernel-module-iptable-mangle \
+    kernel-module-iptable-filter \
     libaio \
     libxml2 \
     libusb1 \
@@ -158,13 +165,6 @@ RDEPENDS_task-self-hosted-extended = "\
     xinetd \
     zip \
     zlib \
-    cpio \
-    iptables \
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
     "
 
 
-- 
1.7.6.4



