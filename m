Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pve0P-0006Zf-RB
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Mar 2011 00:01:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2011 15:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,266,1297065600"; d="scan'208";a="716426123"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2011 15:00:20 -0800
Message-Id: <bddd9012d2a6393afceef752389d0006f2e47681.1299279540.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299279540.git.sgw@linux.intel.com>
References: <cover.1299279540.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 14:51:10 -0800
Date: Fri, 04 Mar 2011 15:00:20 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 1/1] task-poky-lsb: Remove new eglibc-* packages
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
X-List-Received-Date: Fri, 04 Mar 2011 23:01:54 -0000

From: Saul Wold <sgw@linux.intel.com>

Remove the new eglibc packages that were part of another
patch and did not get cleanup here.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tasks/task-poky-lsb.bb |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/tasks/task-poky-lsb.bb b/meta/recipes-extended/tasks/task-poky-lsb.bb
index 65b7565..42fd8e0 100644
--- a/meta/recipes-extended/tasks/task-poky-lsb.bb
+++ b/meta/recipes-extended/tasks/task-poky-lsb.bb
@@ -163,7 +163,6 @@ RDEPENDS_task-poky-lsb-graphic-add = "\
     libx11-locale \
     xorg-minimal-fonts \
     gdk-pixbuf \
-
 "
 
 RDEPENDS_task-poky-lsb-graphic-add_qemux86 = "\
@@ -183,13 +182,15 @@ RDEPENDS_task-poky-lsb-runtime-add = "\
     liburi-perl \
     libxml-parser-perl \
     libxml-perl \
+    eglibc-localedata-posix \
     eglibc-extra-nss \
-    eglibc-localedatas \
-    eglibc-gconvs \
-    eglibc-charmaps \
-    eglibc-binarys \
     eglibc-pcprofile \
     eglibc-pic \
     eglibc-utils \
-
 "
+
+#    eglibc-localedatas \
+#    eglibc-gconvs \
+#    eglibc-charmaps \
+#    eglibc-binarys \
+#
-- 
1.7.1.1



