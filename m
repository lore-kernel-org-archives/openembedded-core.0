Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SCPKB-0006eo-6d
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 07:52:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Mar 2012 22:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146024242"
Received: from unknown (HELO swold-mobl.domain.invalid) ([10.255.12.107])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2012 22:43:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 22:42:56 -0700
Message-Id: <1c8002704bc7dbb1dc70549366d8a2e4773e2d0d.1332826876.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
Subject: [PATCH 2/6] image-vmdk: Add symbolic link for a short named vmdk image
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
X-List-Received-Date: Tue, 27 Mar 2012 05:52:07 -0000

This adds a link from the date stamped vmdk image to a shortened
name file.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-vmdk.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 3e63006..9d596cd 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -10,6 +10,8 @@ inherit image-live
 
 create_vmdk_image () {
 	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
+	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
+
 }
 
 python do_vmdkimg() {
-- 
1.7.7.6



