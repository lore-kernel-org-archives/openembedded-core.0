Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8J-0004vH-AT
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497255"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:47 +0100
Message-Id: <f7bb8b7dcadbc23e2f65f301098c63709edea506.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 27/28] core-image-basic: tidy up
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:57 -0000

Set a more appropriate DESCRIPTION and remove commented-out line.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/images/core-image-basic.bb |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index 06f15a8..091f57d 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "A foundational basic image without support for X that can be \
-reasonably used for customization."
+DESCRIPTION = "A console-only image with more full-featured Linux system \
+functionality installed."
 
 IMAGE_FEATURES += "splash ssh-server-openssh"
 
@@ -8,6 +8,4 @@ IMAGE_INSTALL = "\
     packagegroup-core-basic \
     "
 
-#    ${CORE_IMAGE_BASE_INSTALL} 
-
 inherit core-image
-- 
1.7.9.5



