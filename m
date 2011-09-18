Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5QTU-00028g-Px
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 01:08:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2011 16:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,402,1312182000"; d="scan'208";a="52989587"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.150])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2011 16:03:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 16:03:15 -0700
Message-Id: <1fbb665ef20b7a2477ec4812a610f2b69a870bb1.1316386910.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316386910.git.sgw@linux.intel.com>
References: <cover.1316386910.git.sgw@linux.intel.com>
Subject: [RC3 FIXES 1/4] base.bbclass: add crosssdk items to INCOMPATIBLE_LICENSE exclude list
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
X-List-Received-Date: Sun, 18 Sep 2011 23:08:37 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4ca04e2..918d859 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -385,7 +385,7 @@ python () {
 
 
         dont_want_license = bb.data.getVar('INCOMPATIBLE_LICENSE', d, 1)
-        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate"):
+        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial"):
             hosttools_whitelist = (bb.data.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, d, 1) or "").split()
             lgplv2_whitelist = (bb.data.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, d, 1) or "").split()
             dont_want_whitelist = (bb.data.getVar('WHITELIST_%s' % dont_want_license, d, 1) or "").split()
-- 
1.7.6



