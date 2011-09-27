Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8SqO-0006pN-8B
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 10:16:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2011 01:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56246098"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 27 Sep 2011 01:11:21 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 16:19:20 +0800
Message-Id: <9ce2e8b59aee6c922458e8c32d4b292d78d471c5.1317109075.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317109075.git.dongxiao.xu@intel.com>
References: <cover.1317109075.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317109075.git.dongxiao.xu@intel.com>
References: <cover.1317109075.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] multilib.bbclass: map RDEPENDS for image recipes
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
X-List-Received-Date: Tue, 27 Sep 2011 08:16:48 -0000

RDEPENDS of image type recipe needs to be mapped to make sure that the
packages included in the image should be multilib version.

[YOCTO #1496]
[YOCTO #1527]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/multilib.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 98f6911..433bc07 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -54,6 +54,7 @@ python __anonymous () {
 
     if bb.data.inherits_class('image', d):
         map_dependencies("PACKAGE_INSTALL", d)
+        map_dependencies("RDEPENDS", d)
         pinstall = d.getVar("PACKAGE_INSTALL", True) + " " + d.getVar("MULTILIB_PACKAGE_INSTALL", False)
         d.setVar("MULTILIB_PACKAGE_INSTALL", pinstall)
         d.setVar("PACKAGE_INSTALL", "")
-- 
1.7.1



