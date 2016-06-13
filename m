Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E88AB65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037602"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:13:52 +1200
Message-Id: <7796eacc3c62d4d5d8a569c290e404d3d23c2130.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/9] bitbake.conf: whitelist progress varflag
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:32 -0000

We don't want the value of this varflag in any signatures since it's
only there for the purpose of aiding display of task execution.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 942b8b1..2e95819 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -822,7 +822,8 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
-    recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno"
+    recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
+    progress"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.5.5


