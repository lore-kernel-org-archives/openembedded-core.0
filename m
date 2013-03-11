Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF15n-0002R0-Ov
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:40:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 04:23:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="303796146"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 04:23:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:24:20 +0200
Message-Id: <1363001062-18854-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
References: <1363001062-18854-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/3] build-appliance-image: upgrade to newer poky revision.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:41:23 -0000

Upgraded to poky commit: d823759b4594143d522eae0b2a2498436a6dcb1e

- Includes fixes and enhancements to Hob;
- Includes fixes and improvements to bitbake;
- Includes the switch to Linux kernel 3.8;
- Includes fixes to network connectivity.

Fixes [YOCTO #3843].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 2359eca..43f0574 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -6,8 +6,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r19"
-
 IMAGE_FEATURES += "x11-base package-management splash"
 
 # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
@@ -21,7 +19,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "4493b107a7f0f9b4f441f661c16176157d950245"
+SRCREV ?= "d823759b4594143d522eae0b2a2498436a6dcb1e"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.7.10.4



