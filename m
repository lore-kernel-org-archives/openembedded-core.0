Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxzPC-0007zw-Rv
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:26:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2013 04:09:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,521,1355126400"; d="scan'208";a="275597174"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2013 04:10:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 12:10:14 +0000
Message-Id: <67230ec57b01215c518861cb93008f2d0b6740ca.1358942978.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] libcheck: fix HOMEPAGE
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
X-List-Received-Date: Wed, 23 Jan 2013 12:26:18 -0000

This was pointing to the zypper homepage, presumably a copy-paste error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-support/libcheck/libcheck_0.9.9.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.9.bb b/meta/recipes-support/libcheck/libcheck_0.9.9.bb
index f3fa546..64bc714 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.9.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.9.bb
@@ -1,5 +1,5 @@
 DESCRIPTION  = "Check Test Framework"
-HOMEPAGE = "http://gitorious.org/opensuse/zypper"
+HOMEPAGE = "http://check.sourceforge.net/"
 SECTION = "devel"
 
 LICENSE  = "LGPLv2.1+"
-- 
1.7.10.4



