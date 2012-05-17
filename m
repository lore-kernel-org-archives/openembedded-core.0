Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44q-0006KA-Uj
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:25 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478100"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:06 +0300
Message-Id: <c1c8d2f3cffc540380c0a5fcdda48d64cbec333a.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/12] kernel.bbclass: add deploy link to KERNEL_IMAGETYPE
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
X-List-Received-Date: Thu, 17 May 2012 17:01:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

It's common to provide a non-machine-suffixed link in DEPLOY_DIR_IMAGE, so
let's be consistent and do so here as well.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a85f130..90af597 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -538,6 +538,7 @@ kernel_do_deploy() {
 	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 }
-- 
1.7.7.6



