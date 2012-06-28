Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <valentin.popa@intel.com>) id 1SkF32-0004nT-9H
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 15:46:16 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2012 06:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171108968"
Received: from valentin-desktop (HELO localhost.localdomain) ([10.237.105.52])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2012 06:35:17 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 15:42:20 +0300
Message-Id: <1340887340-30645-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] build-appliance-image: rename from self-hosted-image
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
X-List-Received-Date: Thu, 28 Jun 2012 13:46:16 -0000

(-) renamed self-hosted-image to build-appliance-image
(-) replaced build-appliance-image description

[YOCTO #2636]

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/conf/multilib.conf                            |    2 +-
 ...lf-hosted-image.bb => build-appliance-image.bb} |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/images/{self-hosted-image.bb => build-appliance-image.bb} (91%)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cea8694..92a7813 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -583,7 +583,7 @@ BBCLASSEXTEND_append_pn-sat-solver = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-screen = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-scrnsaverproto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-sed = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-self-hosted-image = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-build-appliance-image = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-service = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-setserial = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-settings-daemon = " ${MULTILIBS}"
diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/build-appliance-image.bb
similarity index 91%
rename from meta/recipes-core/images/self-hosted-image.bb
rename to meta/recipes-core/images/build-appliance-image.bb
index aef1507..2b7906f 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Version 1.0-r6 of the self-hosted image."
+DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
 IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
 
 LICENSE = "MIT"
-- 
1.7.9.5



