Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39C9E782EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 21:56:35 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 14:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,384,1498546800"; d="scan'208";a="141173211"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.corp.intel.com)
	([10.254.118.231])
	by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2017 14:56:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 16 Aug 2017 14:56:33 -0700
Message-Id: <1502920593-13785-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH] build-appliance-image: Don't use COREBASE/LICENSE for checksumming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Aug 2017 21:56:36 -0000

This file lists the licenses that the OE-Core meta data falls under
but should not be used as a LIC_FILES_CHKSUM, use the MIT license file.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 927a931..db96a05 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "An image containing the build system that you can boot and run us
 HOMEPAGE = "http://www.yoctoproject.org/documentation/build-appliance"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted \
                  kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcp-client \
-- 
2.7.5


