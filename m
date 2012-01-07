Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjM8C-000869-OK
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 03:35:43 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 18:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="95426155"
Received: from unknown (HELO localhost) ([10.255.13.210])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2012 18:28:17 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org, philb@gnu.org,
	paul.eggleton@linux.intel.com
Date: Fri,  6 Jan 2012 20:27:41 -0600
Message-Id: <3a052c8736059227b4c90c61c72a982bafd9477a.1325902364.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325902364.git.tom.zanussi@intel.com>
References: <cover.1325902364.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1325902364.git.tom.zanussi@intel.com>
References: <cover.1325902364.git.tom.zanussi@intel.com>
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
X-List-Received-Date: Sat, 07 Jan 2012 02:35:43 -0000

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



