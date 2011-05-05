Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QHmnn-0000mS-S9
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 02:52:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2011 17:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,317,1301900400"; d="scan'208";a="742542424"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2011 17:49:42 -0700
Message-Id: <6dab3972e444dff13271fc044896c553ac25d74b.1304556949.git.ke.yu@intel.com>
In-Reply-To: <cover.1304556949.git.ke.yu@intel.com>
References: <cover.1304556949.git.ke.yu@intel.com>
Old-Date: Thu, 5 May 2011 08:32:59 +0800
Date: Thu, 05 May 2011  8:56:43 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/1] yaffs2-utils_cvs: fix the SRCDATE typo
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
X-List-Received-Date: Thu, 05 May 2011 00:52:24 -0000

From: Yu Ke <ke.yu@intel.com>

SRCDAT should be SRCDATE, thanks Frans to point out

CC: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
index c729c7c..03bdce1 100644
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
+++ b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
@@ -1,4 +1,4 @@
 require yaffs2-utils.inc
 PR = "r1"
 
-SRCDAT = "20071107"
+SRCDATE = "20071107"
-- 
1.7.0.4



