Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKv-0004cO-BL
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472119"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:42 -0800
Message-Id: <1e1772c611deb224ad8f7d5b4c87a10dfd7271c4.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/33] linux-yocto: restore WORKDIR as a patch source directory
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:13 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

In the switch to using src_patches and using patches in their
source directory, the scanning of WORKDIR migrated items like
config fragments was dropped. Adding WORKDIR back as a patch
directory restores the old functionality.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 1b73e6e..7fdefcf 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -92,6 +92,8 @@ do_patch() {
 		fi
 	done
 
+	patch_dirs="${patch_dirs} ${WORKDIR}"
+
 	# add any explicitly referenced features onto the end of the feature
 	# list that is passed to the kernel build scripts.
 	if [ -n "${KERNEL_FEATURES}" ]; then
-- 
1.7.6.5



