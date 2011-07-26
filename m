Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QlZDx-0007y8-3t
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 06:26:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2011 21:22:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,266,1309762800"; d="scan'208";a="34477909"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.158])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2011 21:22:02 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 21:21:56 -0700
Message-Id: <ecf0ccbec73c85ee2e5bbbe9828468fcd995c88c.1311653945.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311653945.git.josh@linux.intel.com>
References: <cover.1311653945.git.josh@linux.intel.com>
In-Reply-To: <cover.1311653945.git.josh@linux.intel.com>
References: <cover.1311653945.git.josh@linux.intel.com>
Subject: [PATCH 1/1] classes/image_types: IMAGE_TYPES was missing some entries
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
X-List-Received-Date: Tue, 26 Jul 2011 04:26:29 -0000

Some of these entries are required by the GUI to enable the expected workflow
of the ADT, namely a compressed rootfs image.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 1108802..f1aef86 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -103,4 +103,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi"
+IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma"
-- 
1.7.6



