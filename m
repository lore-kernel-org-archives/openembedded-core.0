Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJI-0001mf-Qk
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2011 16:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="429934556"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 03 May 2011 16:44:35 -0700
Message-Id: <edaa3afe817dda76d44cadcc6ec348b6c2932ff3.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 16:43:57 +0800
Date: Tue, 03 May 2011 16:44:35 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 11/33] create-lsb-iamge:Fix bugs
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
X-List-Received-Date: Tue, 03 May 2011 23:47:21 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Change variables "${ARCH}" to "${1}"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 scripts/create-lsb-image |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/create-lsb-image b/scripts/create-lsb-image
index 94cb337..48b96e2 100755
--- a/scripts/create-lsb-image
+++ b/scripts/create-lsb-image
@@ -81,7 +81,7 @@ case ${1} in
     ;;
 "ppc32")
     P_ARCH=ppc
-    T_ARCH=${ARCH}
+    T_ARCH=${1}
     COM_PACKAGE_LIST="lsb-dist-testkit-4.1.0-5.${T_ARCH}.tar.gz"
     ;;
 *)
-- 
1.7.4.1



