Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Rj5oj-0007dH-J9
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 10:10:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2012 01:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109381489"
Received: from dongxiao-desktop.sh.intel.com (HELO localhost) ([10.239.36.108])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2012 01:03:04 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2012 17:04:59 +0800
Message-Id: <c3bdcfb938763557c1706b5719ab8374c2d0c9d7.1325840474.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325840092.git.dongxiao.xu@intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1325840474.git.dongxiao.xu@intel.com>
References: <cover.1325840474.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/7] bblayers.conf.sample: Use ?= to set BBLAYERS
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
X-List-Received-Date: Fri, 06 Jan 2012 09:10:29 -0000

Hob may dynamically sets BBLAYERS to bitbake server, thus we need a
flexible way to load BBLAYERS value.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/bblayers.conf.sample |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bblayers.conf.sample b/meta/conf/bblayers.conf.sample
index 339a421..222b03a 100644
--- a/meta/conf/bblayers.conf.sample
+++ b/meta/conf/bblayers.conf.sample
@@ -3,6 +3,6 @@
 LCONF_VERSION = "4"
 
 BBFILES ?= ""
-BBLAYERS = " \
+BBLAYERS ?= " \
   ##COREBASE##/meta \
   "
-- 
1.7.0.4



