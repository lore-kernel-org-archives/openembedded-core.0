Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rj5on-0007dK-7I
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 10:10:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Jan 2012 01:03:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93021007"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by azsmga001.ch.intel.com with ESMTP; 06 Jan 2012 01:03:10 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 17:05:03 +0800
Message-Id: <e40939f32e45ead152033438f74d687f0b578ba9.1325840474.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325840092.git.dongxiao.xu@intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1325840474.git.dongxiao.xu@intel.com>
References: <cover.1325840474.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/7] hob.bb: Add a empty image template
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
X-List-Received-Date: Fri, 06 Jan 2012 09:10:33 -0000

This recipe serves as the target when using Hob to generate image.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/images/hob.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/images/hob.bb

diff --git a/meta/recipes-core/images/hob.bb b/meta/recipes-core/images/hob.bb
new file mode 100644
index 0000000..c4d9210
--- /dev/null
+++ b/meta/recipes-core/images/hob.bb
@@ -0,0 +1,3 @@
+LICENSE = "MIT"
+
+inherit image
-- 
1.7.0.4



