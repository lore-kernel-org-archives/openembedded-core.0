Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJ0-0001c9-FS
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 May 2011 16:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="429934460"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2011 16:44:22 -0700
Message-Id: <c04e631e4df4f32949fabae407b9ee8b1d665f71.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Wed, 27 Apr 2011 09:50:35 -0500
Date: Tue, 03 May 2011 16:44:21 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 01/33] core-image-directdisk: add LIC_FILES_CHECKSUM
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
X-List-Received-Date: Tue, 03 May 2011 23:47:02 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Fix for build failure.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-core/images/core-image-directdisk.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/images/core-image-directdisk.inc b/meta/recipes-core/images/core-image-directdisk.inc
index 64144b9..ef9e72d 100644
--- a/meta/recipes-core/images/core-image-directdisk.inc
+++ b/meta/recipes-core/images/core-image-directdisk.inc
@@ -1,5 +1,8 @@
 inherit boot-directdisk
 
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
 do_bootdirectdisk_prepend () {
 	import bb
 	fstypes = bb.data.getVar('IMAGE_FSTYPES', d, True)
-- 
1.7.4.1



