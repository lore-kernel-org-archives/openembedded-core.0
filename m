Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B7A5960053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:32:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 00:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="26929030"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 12 Feb 2018 00:32:24 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 16:27:06 +0800
Message-Id: <1518424026-25060-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518424026-25060-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1518424026-25060-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/2] build-appliance-image: update version to 19.0.0
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
X-List-Received-Date: Mon, 12 Feb 2018 08:32:23 -0000

Updating recipe to reflect latest poky version and SRCREV points
to latest master HEAD revision.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 ...{build-appliance-image_15.0.0.bb => build-appliance-image_19.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/images/{build-appliance-image_15.0.0.bb => build-appliance-image_19.0.0.bb} (99%)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_19.0.0.bb
similarity index 99%
rename from meta/recipes-core/images/build-appliance-image_15.0.0.bb
rename to meta/recipes-core/images/build-appliance-image_19.0.0.bb
index dc16c0b..f3a2eac 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_19.0.0.bb
@@ -22,7 +22,7 @@ IMAGE_FSTYPES = "wic.vmdk"
 
 inherit core-image module-base setuptools3
 
-SRCREV ?= "433ef0f8e9e63e4459934a06a42b56989c885e44"
+SRCREV ?= "44ea6ded0e8e73f5258ce55bd1b851e24243b76a"
 SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
2.7.4


