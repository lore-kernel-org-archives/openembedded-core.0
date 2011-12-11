Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZsIR-0003rn-Ex
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 23:55:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Dec 2011 14:48:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86045468"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.46])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2011 14:48:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2011 14:47:52 -0800
Message-Id: <4fef1a65c3b8f4cee2ff2bb5dd012de3820460f9.1323643434.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/26] task-core-nfs: Add nfs-utils-client to RDEPENDS
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
X-List-Received-Date: Sun, 11 Dec 2011 22:55:04 -0000

From: Khem Raj <raj.khem@gmail.com>

include nfs client in tast-core-nfs as well
this is handy when we need it on target e.g.
testing eglibc needs it and we can just do
EXTRA_IMAGE_FEATURES += "nfs-server"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/tasks/task-core-nfs.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-nfs.bb b/meta/recipes-core/tasks/task-core-nfs.bb
index 5859fad..5c7f455 100644
--- a/meta/recipes-core/tasks/task-core-nfs.bb
+++ b/meta/recipes-core/tasks/task-core-nfs.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "NFS tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 PACKAGES = "\
     task-core-nfs-server \
@@ -17,7 +17,9 @@ PACKAGES = "\
 ALLOW_EMPTY = "1"
 
 RDEPENDS_task-core-nfs-server = "\
-    nfs-utils"
+    nfs-utils \
+    nfs-utils-client \
+    "
 
 # rpcinfo can be useful but only with glibc images
 GLIBC_DEPENDENCIES = "glibc-utils"
-- 
1.7.6.4



