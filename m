Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QzPgW-0003UF-3z
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:05:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Sep 2011 02:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,317,1312182000"; d="scan'208";a="44987101"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 02 Sep 2011 02:00:16 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:03:38 +0800
Message-Id: <3a27259afa83d8fd6499682141283b4ae3710ebf.1314953755.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/5] multilib: extend multilib prefix for libsdl
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
X-List-Received-Date: Fri, 02 Sep 2011 09:05:12 -0000

libsdl is required by sato image, so extend it for multilib.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/multilib.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 5329eda..62bdfec 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -450,3 +450,4 @@ BBCLASSEXTEND_append_pn-xwininfo = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zip = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zlib = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-zypper = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-libsdl = " ${MULTILIBS}"
-- 
1.7.1



