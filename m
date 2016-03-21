Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 61A396FFFB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:11:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2016 22:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="915344824"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2016 22:11:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:10:59 +1300
Message-Id: <bd9dc1e934c177e4916d25a32e8f78b335a6a8b3.1458537025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537025.git.paul.eggleton@linux.intel.com>
References: <cover.1458537025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] site.conf.sample: fix reference to oe-git-proxy script
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
X-List-Received-Date: Mon, 21 Mar 2016 05:11:40 -0000

The name of the script is oe-git-proxy, not oe-git-proxy.sh.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/site.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/site.conf.sample b/meta/conf/site.conf.sample
index c551e8f..6cfefc5 100644
--- a/meta/conf/site.conf.sample
+++ b/meta/conf/site.conf.sample
@@ -17,7 +17,7 @@ SCONF_VERSION = "1"
 #
 
 # To use git with a proxy, you must use an external git proxy command, such as
-# the one provided by scripts/oe-git-proxy.sh. To use this script, copy it to
+# the one provided by scripts/oe-git-proxy. To use this script, copy it to
 # your PATH and uncomment the following:
 #GIT_PROXY_COMMAND ?= "oe-git-proxy"
 #ALL_PROXY ?= "socks://socks.example.com:1080"
-- 
2.5.5


