Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QgmNo-0008Qa-0O
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 01:28:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 16:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="26948408"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.215])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2011 16:24:52 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 16:24:43 -0700
Message-Id: <1314a49d823f6e174ca09773cde0fee7ed0e1306.1310511423.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1310511423.git.josh@linux.intel.com>
References: <cover.1310511423.git.josh@linux.intel.com>
In-Reply-To: <cover.1310511423.git.josh@linux.intel.com>
References: <cover.1310511423.git.josh@linux.intel.com>
Subject: [PATCH 1/2] classes/image_types: add a variable to list available IMAGE_FSTYPE's
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
X-List-Received-Date: Tue, 12 Jul 2011 23:28:52 -0000

This is for use in the Hob GUI to enable the user to change the type of the
generated image.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 89a745c..29d7a57 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -102,3 +102,5 @@ IMAGE_DEPENDS_cpio.xz = "xz-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
+# This variable is available to request which values are suitable for IMAGE_FSTYPES
+IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi ubifs"
-- 
1.7.6



