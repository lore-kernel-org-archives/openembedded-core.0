Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BDAD573651
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:44:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2015 09:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,616,1418112000"; d="scan'208";a="669192680"
Received: from marazel-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.23.180])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2015 09:44:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 17:44:06 +0000
Message-Id: <cfd75ed07e01124f17a39fd24766e6900bb4e097.1424454072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424454072.git.paul.eggleton@linux.intel.com>
References: <cover.1424454072.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424454072.git.paul.eggleton@linux.intel.com>
References: <cover.1424454072.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] layer.conf: set a variable to map to the OE Layer Index name
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

Add a variable that allows us to map the OE-Core layer to the name that
represents it in the OpenEmbedded layer index. This will be used by
bitbake-layers layerindex-fetch so that it knows that for example
OE-Core is already fetched and included in the current configuration.

Note - it won't be required for us to go around and set this for every
layer - we can do the matching based on repo and subdirectory, but
OE-Core is somewhat special in that it does sometimes appear in
different places, for example in poky.

[YOCTO #5348]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 4fd3a16..e5e1f06 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -11,6 +11,8 @@ BBFILE_PRIORITY_core = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_core = "4"
 
+BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
+
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
-- 
1.9.3


