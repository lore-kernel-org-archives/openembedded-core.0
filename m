Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X6-0005NQ-JC
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:48 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260478"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:56 -0700
Message-Id: <aa5a0621a4d7110828517949f4c07221e62b068c.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 10/10] local.conf.sample: make BBMASK assignment weak
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:48 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

So that it can be overridden by layers if needed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta-yocto/conf/local.conf.sample |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.conf.sample
index 3e71b0a..4acec37 100644
--- a/meta-yocto/conf/local.conf.sample
+++ b/meta-yocto/conf/local.conf.sample
@@ -39,7 +39,7 @@ DISTRO ?= "poky"
 
 # BBMASK is a regular expression that can be used to tell BitBake to ignore
 # certain recipes.
-BBMASK = ""
+BBMASK ?= ""
 
 # EXTRA_IMAGE_FEATURES allows extra packages to be added to the generated images 
 # (Some of these are automatically added to certain image types)
-- 
1.7.6



