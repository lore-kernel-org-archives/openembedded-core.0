Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFe4l-0002EX-7q
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 06:13:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 21:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85498794"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Apr 2012 21:04:21 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 12:04:39 +0800
Message-Id: <a8b5a3ed58d2a136867fc55b53443b59557c6459.1333598600.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1333598600.git.dexuan.cui@intel.com>
References: <cover.1333598600.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1333598600.git.dexuan.cui@intel.com>
References: <cover.1333598600.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] self-hosted-image: use the correct location of the file sudoers
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
X-List-Received-Date: Thu, 05 Apr 2012 04:13:35 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 1db6a7a..d8f4162 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -49,7 +49,7 @@ fakeroot do_populate_poky_src () {
 	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
 
 	# Allow builder to use sudo to setup tap/tun
-	echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
+	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
-- 
1.7.6



