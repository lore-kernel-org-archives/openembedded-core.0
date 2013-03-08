Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UE00h-00041o-Ga
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 17:19:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Mar 2013 08:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,809,1355126400"; d="scan'208";a="274174213"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.228])
	by orsmga001.jf.intel.com with ESMTP; 08 Mar 2013 08:02:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 16:02:27 +0000
Message-Id: <1362758547-7832-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dropbear: update patch upstream status
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
X-List-Received-Date: Fri, 08 Mar 2013 16:19:14 -0000
X-List-Received-Date: Fri, 08 Mar 2013 16:19:14 -0000

Blank password option patch has now been accepted upstream.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dropbear/dropbear/nopw-option.patch |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dropbear/dropbear/nopw-option.patch b/meta/recipes-core/dropbear/dropbear/nopw-option.patch
index e7fcbb3..2ff84d2 100644
--- a/meta/recipes-core/dropbear/dropbear/nopw-option.patch
+++ b/meta/recipes-core/dropbear/dropbear/nopw-option.patch
@@ -4,7 +4,7 @@ Changes this from a compile-time switch to a command-line option.
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-Upstream-Status: Pending
+Upstream-Status: Accepted [expected in next release after 2012.55]
 
 diff --git a/options.h b/options.h
 index 00f6179..b8d0ccb 100644
-- 
1.7.10.4



