Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RkoZF-0005eY-MR
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 04:09:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Jan 2012 19:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="55317259"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jan 2012 19:02:05 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 11:04:15 +0800
Message-Id: <f5d2304b35f6442803be446aba966d5bf8f14ac4.1326249734.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1326249734.git.dongxiao.xu@intel.com>
References: <cover.1326249734.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/5] dummy-image.bb: add an empty image template
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
X-List-Received-Date: Wed, 11 Jan 2012 03:09:39 -0000

This recipe serves as the target when using Hob to generate image.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/images/dummy-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/images/dummy-image.bb

diff --git a/meta/recipes-core/images/dummy-image.bb b/meta/recipes-core/images/dummy-image.bb
new file mode 100644
index 0000000..c8d6f49
--- /dev/null
+++ b/meta/recipes-core/images/dummy-image.bb
@@ -0,0 +1 @@
+inherit image
-- 
1.7.0.4



