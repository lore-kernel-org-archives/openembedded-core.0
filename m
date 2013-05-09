Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaTwl-00052o-4u
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:44:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2013 09:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="300003073"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.169])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2013 09:24:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 17:24:26 +0100
Message-Id: <cd878250e9d7ded1fcccab02b665e960cb44bc12.1368116511.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368116511.git.paul.eggleton@linux.intel.com>
References: <cover.1368116511.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368116511.git.paul.eggleton@linux.intel.com>
References: <cover.1368116511.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] classes/core-image: drop apps-console-core IMAGE_FEATURES support
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
X-List-Received-Date: Thu, 09 May 2013 16:44:28 -0000

Remove the legacy support for the apps-console-core IMAGE_FEATURES item;
we've kept this for a while but it's time for it to go.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 86df91d..e7c34e2 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -57,14 +57,6 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 
 MACHINE_HWCODECS ??= ""
 
-python __anonymous() {
-    # Ensure we still have a splash screen for existing images
-    if base_contains("IMAGE_FEATURES", "apps-console-core", "1", "", d) == "1":
-        bb.warn("%s: apps-console-core in IMAGE_FEATURES is no longer supported; adding \"splash\" to enable splash screen" % d.getVar("PN", True))
-        d.appendVar("IMAGE_FEATURES", " splash")
-}
-
-
 CORE_IMAGE_BASE_INSTALL = '\
     packagegroup-core-boot \
     packagegroup-base-extended \
-- 
1.8.1.2



