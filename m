Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYBw-0002iM-TH
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263234"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:33 +0200
Message-Id: <edcc44efb569b6d611a46649d1abdcd181893774.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/18] e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:57 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
1.7.6.4



