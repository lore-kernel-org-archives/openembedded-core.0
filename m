Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S0PYt-0004Nr-MN
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 04:41:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2012 19:33:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="113726407"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2012 19:33:21 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:33:44 +0800
Message-Id: <2722b49d249177e48f610968898e06d9597ce065.1329967965.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1329967965.git.dexuan.cui@intel.com>
References: <cover.1329967965.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329967965.git.dexuan.cui@intel.com>
References: <cover.1329967965.git.dexuan.cui@intel.com>
Subject: [PATCH 1/2] task-self-hosted: remove duplicate packages
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
X-List-Received-Date: Thu, 23 Feb 2012 03:41:43 -0000

The package names are specified more than once.
We only need to keep one for each of them, so let's remove the duplicated
ones.
This patch makes no actual change to the functionality of the recipe.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 1678ac3..c9a8c49 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -30,12 +30,6 @@ RDEPENDS_task-self-hosted = "\
 RDEPENDS_task-self-hosted-host-tools = "\
     connman \
     connman-plugin-ethernet \
-    parted \
-    e2fsprogs \
-    e2fsprogs-mke2fs \
-    e2fsprogs-tune2fs \
-    e2fsprogs-e2fsck \
-    e2fsprogs-fsck \
     dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
@@ -65,7 +59,6 @@ RDEPENDS_task-self-hosted-sdk = "\
     cpp-symlinks \
     ccache \
     coreutils \
-    diffutils \
     distcc \
     eglibc-utils \
     file \
@@ -74,7 +67,6 @@ RDEPENDS_task-self-hosted-sdk = "\
     gcc-symlinks \
     g++ \
     g++-symlinks \
-    gettext \
     intltool \
     ldd \
     less \
@@ -88,7 +80,6 @@ RDEPENDS_task-self-hosted-sdk = "\
     pkgconfig \
     quilt \
     sed \
-    tcl \
     "
 
 RDEPENDS_task-self-hosted-debug = " \
@@ -100,7 +91,6 @@ RDEPENDS_task-self-hosted-debug = " \
 
 
 RDEPENDS_task-self-hosted-extended = "\
-    binutils \
     bzip2 \
     chkconfig \
     chrpath \
@@ -134,7 +124,6 @@ RDEPENDS_task-self-hosted-extended = "\
     openssl \
     opkg \
     opkg-utils \
-    parted \
     patch \
     perl \
     perl-dev \
-- 
1.7.6



