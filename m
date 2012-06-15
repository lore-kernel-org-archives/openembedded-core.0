Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SfWDW-0002KJ-8h
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 15:05:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2012 05:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158041529"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 05:54:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 15:54:48 +0300
Message-Id: <1339764889-25852-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] directfb: added missing Upstream-status
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
X-List-Received-Date: Fri, 15 Jun 2012 13:05:34 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ibdirect-remove-include-of-linux-config.h.patch |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
index eeb7738..dcf6736 100644
--- a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
+++ b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
@@ -1,3 +1,5 @@
+Upstream-status: backport from 1.6.0-pre1
+
 From cd575a84f10d90759e069f5f2e6092251a1b84bd Mon Sep 17 00:00:00 2001
 From: Sven Neumann <s.neumann@raumfeld.com>
 Date: Fri, 23 Sep 2011 10:00:02 +0200
-- 
1.7.9.5



