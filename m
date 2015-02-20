Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BBE9771F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:44:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2015 09:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,616,1418112000"; d="scan'208";a="669192675"
Received: from marazel-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.23.180])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2015 09:44:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 17:44:05 +0000
Message-Id: <d48d2e69497be6aa1fbf91d899d42d6428dbc881.1424454072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424454072.git.paul.eggleton@linux.intel.com>
References: <cover.1424454072.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424454072.git.paul.eggleton@linux.intel.com>
References: <cover.1424454072.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] bitbake.conf: Add two variables for layer index
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
X-List-Received-Date: Fri, 20 Feb 2015 17:44:28 -0000

From: Chong Lu <Chong.Lu@windriver.com>

Add BBLAYERS_LAYERINDEX_URL variable that bitbake-layers can use to find layer index.
Add BBLAYERS_FETCH_DIR variable that bitbake-layers can use to specify fetch directory.

[YOCTO #5348]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/conf/bitbake.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b5b54b7..10ee42a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -551,6 +551,12 @@ SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
 BUILD_OPTIMIZATION = "-O2 -pipe"
 
 ##################################################################
+# Settings used by bitbake-layers.
+##################################################################
+BBLAYERS_LAYERINDEX_URL ??= "http://layers.openembedded.org/layerindex/"
+BBLAYERS_FETCH_DIR ??= "${COREBASE}"
+
+##################################################################
 # Download locations and utilities.
 ##################################################################
 
-- 
1.9.3


