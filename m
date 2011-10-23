Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RHzjm-0001K1-IZ
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 17:13:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2011 08:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,394,1315206000"; d="scan'208";a="80904504"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.44])
	by fmsmga002.fm.intel.com with ESMTP; 23 Oct 2011 08:07:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 16:07:17 +0100
Message-Id: <badd38e08874a9836119459593899ba265920201.1319382376.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package
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
X-List-Received-Date: Sun, 23 Oct 2011 15:13:23 -0000

mke2fs.conf, which contains defaults for filesystem formatting options,
ought to be shipped along with mke2fs itself.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
index 1fca7b9..c6c1f0d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://quotefix.patch \
             file://acinclude.m4"
@@ -44,7 +44,7 @@ PACKAGES =+ "libcomerr libss libe2p libext2fs"
 FILES_e2fsprogs-blkid = "${base_sbindir}/blkid"
 FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
-FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext*"
+FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
 FILES_libcomerr = "${libdir}/libcom_err.so.*"
-- 
1.7.4.1



