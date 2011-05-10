Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVN-0001a4-SM
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; 
   d="scan'208";a="163196"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2011 22:26:23 -0700
Message-Id: <729096239077e6fee4b9c9856c34156d1f55e8eb.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Sat, 30 Apr 2011 20:57:15 +0000
Date: Mon, 09 May 2011 22:26:23 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 21/30] meta/conf/local.conf.sample: fix mklibs comment line split and typo
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
X-List-Received-Date: Tue, 10 May 2011 05:29:12 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/conf/local.conf.sample |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index cf7f33f..c33dc0e 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -53,9 +53,10 @@ EXTRA_IMAGE_FEATURES = "tools-debug tools-profile tools-testapps debug-tweaks"
 #PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
 PACKAGE_CLASSES ?= "package_ipk"
 
-# mklibs library size optimization is more useful to smaller images, 
-# and less useful for bigger images. Also mklibs library optimization can break the ABI compatibility, so should not be applied to the images which are tobe
-# extended or upgraded later.
+# mklibs library size optimization is more useful to smaller images,
+# and less useful for bigger images. Also mklibs library optimization
+# can break the ABI compatibility, so should not be applied to the
+# images which are to be extended or upgraded later.
 #This enabled mklibs library size optimization just for the specified image.
 #MKLIBS_OPTIMIZED_IMAGES ?= "core-image-minimal"
 #This enable mklibs library size optimization will be for all the images.
-- 
1.7.1.1



