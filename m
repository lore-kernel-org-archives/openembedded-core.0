Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E2A457251B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:36:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2015 11:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443320759"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.118])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 11:17:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 11:30:24 -0800
Message-Id: <1421868625-22382-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
References: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] build-appliance-image: Upgrade for 1.8 Master
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
X-List-Received-Date: Wed, 21 Jan 2015 19:36:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{build-appliance-image_8.0.bb => build-appliance-image_12.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/images/{build-appliance-image_8.0.bb => build-appliance-image_12.0.1.bb} (96%)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
similarity index 96%
rename from meta/recipes-core/images/build-appliance-image_8.0.bb
rename to meta/recipes-core/images/build-appliance-image_12.0.1.bb
index 7651ff8..3d632d6 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
@@ -21,8 +21,8 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "f0a2a2f44587f02fa7f434e82f91a6de2231f6b6"
-SRC_URI = "git://git.yoctoproject.org/poky;branch=dizzy \
+SRCREV ?= "d9d5b8b499af3ae01a1e33d0d3969c54c2d4ab1b"
+SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
           "
-- 
2.1.0


