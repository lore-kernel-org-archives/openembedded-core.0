Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7093F601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 16:42:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2013 09:42:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,794,1363158000"; d="scan'208";a="344119258"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.181])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2013 09:42:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2013 17:41:58 +0100
Message-Id: <1370277718-19169-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH] build-appliance-image: update to latest dylan revision for release
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
X-List-Received-Date: Mon, 03 Jun 2013 16:42:10 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 53e6edc..477514c 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -19,7 +19,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "dc529e1f18975ff33a1686dc9804a38204fd1bd0"
+SRCREV ?= "beda5013e46da16a3d76f095869a5a5c5b1bc08a"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.8.1.2


