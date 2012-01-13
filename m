Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RlZea-0004cv-Vy
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 06:26:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 21:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="97965662"
Received: from unknown (HELO localhost) ([10.255.13.225])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2012 21:18:46 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 23:18:10 -0600
Message-Id: <7de63fe81466dc1c9ed1ddcfa66f19f354f45314.1326431435.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1c27c9814d62adcde5540d6cbbdab5e0417a484c.1326431435.git.tom.zanussi@intel.com>
References: <1c27c9814d62adcde5540d6cbbdab5e0417a484c.1326431435.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1326431435.git.tom.zanussi@intel.com>
References: <cover.1326431435.git.tom.zanussi@intel.com>
Subject: [PATCH 3/5] base.bbclass: remove COMMERCIAL_LICENSE code
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
X-List-Received-Date: Fri, 13 Jan 2012 05:26:19 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

The COMMERCIAL_LICENSE mechanism has been superseded by LICENSE_FLAGS
so remove the code that implements COMMERCIAL_LICENSE.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/classes/base.bbclass |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 085bb36..8898882 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -356,13 +356,6 @@ python () {
         raise bb.parse.SkipPackage("because it has a restricted license (%s) not"
              " whitelisted in LICENSE_FLAGS_WHITELIST" % unmatched_license_flag)
 
-    commercial_license = " %s " % d.getVar('COMMERCIAL_LICENSE', 1)
-    import re
-    pnr = "[ \t]%s[ \t]" % pn.replace('+', "\+")
-    if commercial_license and re.search(pnr, commercial_license):
-        bb.debug(1, "Skipping %s because it's commercially licensed" % pn)
-        raise bb.parse.SkipPackage("because it may require a commercial license to ship in a product (listed in COMMERCIAL_LICENSE)")
-
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-- 
1.7.0.4



