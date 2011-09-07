Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1DaT-00066T-L8
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:34:28 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2011 01:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,344,1312182000"; d="scan'208";a="14729407"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2011 01:29:21 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 16:33:42 +0800
Message-Id: <eea0b7f57dfa9ff06c79119ba10e42b863e5e105.1315384269.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315384269.git.dongxiao.xu@intel.com>
References: <cover.1315384269.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315384269.git.dongxiao.xu@intel.com>
References: <cover.1315384269.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/2] multilib: Remove the multilib extension for linux-yocto
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
X-List-Received-Date: Wed, 07 Sep 2011 08:34:28 -0000

Kernel should be unique in a multilib system, so we remove the
linux-yocto's extension in multilib.conf

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/conf/multilib.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index eec1da7..f23fbb7 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -242,7 +242,6 @@ BBCLASSEXTEND_append_pn-libxxf86vm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-libzypp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lighttpd = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-linux-libc-headers = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-linux-yocto = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-logrotate = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lrzsz = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-lsb = " ${MULTILIBS}"
-- 
1.7.1



