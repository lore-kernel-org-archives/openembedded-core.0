Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5dy-0003RL-Rn
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:48:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2011 14:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; 
   d="scan'208";a="2468381"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2011 14:44:02 -0700
Message-Id: <cfd8d3c9ec48872a2d64ad13fa8b4b0a671c35a0.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 23:44:34 -0700
Date: Mon, 16 May 2011 14:44:02 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 03/14] e2fsprogs_1.41.14.bb: Package libraries into separate packages
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
X-List-Received-Date: Mon, 16 May 2011 21:48:05 -0000

From: Khem Raj <raj.khem@gmail.com>

add libcomerr libss libe2p libext2fs packages
helps in reducing the root file system size

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
index d493f6f..91a783d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
@@ -39,11 +39,17 @@ do_install () {
 RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-badblocks"
 
 PACKAGES =+ "e2fsprogs-blkid e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
+PACKAGES =+ "libcomerr libss libe2p libext2fs"
+
 FILES_e2fsprogs-blkid = "${base_sbindir}/blkid"
 FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext*"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
+FILES_libcomerr = "${libdir}/libcom_err.so.*"
+FILES_libss = "${libdir}/libss.so.*"
+FILES_libe2p = "${libdir}/libe2p.so.*"
+FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
 
 BBCLASSEXTEND = "native"
-- 
1.7.1.1



