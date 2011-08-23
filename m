Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvzbJ-0004jV-Lb
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 00:37:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 15:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41503277"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.108])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 15:32:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2011 23:32:45 +0100
Message-Id: <67afbdbdca8b47638e5710d9de2961b1cae469e1.1314138692.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314138692.git.paul.eggleton@linux.intel.com>
References: <cover.1314138692.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314138692.git.paul.eggleton@linux.intel.com>
References: <cover.1314138692.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] base.bbclass: clarify COMMERCIAL_LICENSE skip reason
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
X-List-Received-Date: Tue, 23 Aug 2011 22:37:41 -0000

Change to a proper sentence and add a reference to the
COMMERCIAL_LICENSE variable so that the user knows where this can be
controlled.

Addresses remainder of [YOCTO #846]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4332d24..3501f4b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -345,7 +345,7 @@ python () {
     pnr = pn.replace('+', "\+")
     if commercial_license and re.search(pnr, commercial_license):
         bb.debug(1, "Skipping %s because it's commercially licensed" % pn)
-        raise bb.parse.SkipPackage("because it requires commercial license to ship product")
+        raise bb.parse.SkipPackage("because it may require a commercial license to ship in a product (listed in COMMERCIAL_LICENSE)")
 
     # If we're building a target package we need to use fakeroot (pseudo)
     # in order to capture permissions, owners, groups and special files
-- 
1.7.4.1



