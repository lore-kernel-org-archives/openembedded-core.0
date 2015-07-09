Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 38DB86E5F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:27:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2015 07:27:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,440,1432623600"; d="scan'208";a="603039259"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga003.jf.intel.com with ESMTP; 09 Jul 2015 07:27:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 17:28:10 +0300
Message-Id: <f49c678049285cbb70db3e1d6f31a42f31cef36f.1436452048.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436452048.git.cristian.iorga@intel.com>
References: <cover.1436452048.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1436452048.git.cristian.iorga@intel.com>
References: <cover.1436452048.git.cristian.iorga@intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bluez5: upgrade to 5.32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jul 2015 14:27:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mostly a bug fix release.

Fixes in several different areas, including OPP,
ATT and advertising (instance number handling in particular).
Fix for handling a sudden disconnect when a connection setup
process hasn’t yet completed.
New feature: ability to select between letting the stack
handle ATT security elevation or doing the respective
error handling in higher layers.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.31.bb => bluez5_5.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.31.bb => bluez5_5.32.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.31.bb b/meta/recipes-connectivity/bluez5/bluez5_5.32.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.31.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.32.bb
index 395c512..db02be4 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.31.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.32.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "cb1db487b65dd4d57a2dd6b8f063c393"
-SRC_URI[sha256sum] = "c4b661cc5866d9a9a9d608d700392afa278c3b6fe8426238bf6979be7c63818f"
+SRC_URI[md5sum] = "432b1f292c0b78771818c67140baf3d9"
+SRC_URI[sha256sum] = "fe4f35e701cbec04478818adf014ed9bbd1f7d11e2603370f1b70a78106f57f7"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.1.4


