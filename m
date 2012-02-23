Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC9-0004to-FD
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:02 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652378"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:27 -0800
Message-Id: <980b4324dad37df23945522ff7457f37994d78c4.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/25] task-self-hosted: remove duplicate packages
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
1.7.6.5



