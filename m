Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Rhngm-0001SS-2A
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 20:36:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 11:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108020274"
Received: from unknown (HELO localhost) ([10.255.13.35])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 11:29:35 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Mon,  2 Jan 2012 13:29:28 -0600
Message-Id: <bbd47d1eb3ea259c0f0bbcc79b1fd51a2d03f31e.1325526807.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <6f382ab47a126d96637ba3581f11bf1f2093b5a0.1325526807.git.tom.zanussi@intel.com>
References: <6f382ab47a126d96637ba3581f11bf1f2093b5a0.1325526807.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1325526807.git.tom.zanussi@intel.com>
References: <cover.1325526807.git.tom.zanussi@intel.com>
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
X-List-Received-Date: Mon, 02 Jan 2012 19:36:57 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

COMMERCIAL_LICENSE no longer exists, remove the warning about it.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 scripts/contrib/documentation-audit.sh |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 5070fee..bf72a17 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -25,7 +25,6 @@ if [ -z "$BITBAKE" ]; then
 fi
 
 echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
-echo "REMINDER: you need to have COMMERCIAL_LICENSE = \"\" in local.conf or you'll get false positives"
 
 for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
-- 
1.7.0.4



