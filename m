Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RoJhs-0007jA-2v
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 20:01:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2012 10:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109179050"
Received: from unknown (HELO localhost) ([10.255.14.76])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2012 10:53:20 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 12:52:55 -0600
Message-Id: <9fb63f95709ff31486fbd9cf39e7a7a55f8d97c9.1327084753.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <c6e9e1ecaf59db9149ce4570435f48c927acb29c.1327084753.git.tom.zanussi@intel.com>
References: <c6e9e1ecaf59db9149ce4570435f48c927acb29c.1327084753.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1327084753.git.tom.zanussi@intel.com>
References: <cover.1327084753.git.tom.zanussi@intel.com>
Subject: [PATCH 5/5] documentation-audit.sh: remove COMMERCIAL_LICENSE warning
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
X-List-Received-Date: Fri, 20 Jan 2012 19:01:00 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

COMMERCIAL_LICENSE no longer exists; the equivalent functionality is
now has been replaced by LICENSE_FLAGS_WHITELIST, so replace the
COMMERCIAL_LICENSE warning with a similarly equivalent warning.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 scripts/contrib/documentation-audit.sh |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 5070fee..5b66f03 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -25,7 +25,8 @@ if [ -z "$BITBAKE" ]; then
 fi
 
 echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
-echo "REMINDER: you need to have COMMERCIAL_LICENSE = \"\" in local.conf or you'll get false positives"
+echo "REMINDER: you need to set LICENSE_FLAGS_WHITELIST appropriately in local.conf or "
+echo " you'll get false positives.  For example, LICENSE_FLAGS_WHITELIST = \"Commercial\""
 
 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
-- 
1.7.0.4



