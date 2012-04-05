Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFr02-0008DW-0m
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 20:01:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2012 10:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85766023"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.33])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 10:51:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 18:51:04 +0100
Message-Id: <a2d938ab7af93a5644cdccb0ce88f2b767adf80f.1333648154.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] self-hosted-image: use the correct location of the file sudoers
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
X-List-Received-Date: Thu, 05 Apr 2012 18:01:35 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

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
1.7.5.4



