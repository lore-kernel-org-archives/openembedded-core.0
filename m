Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8A26473175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:25:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2016 16:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="700145686"
Received: from keanhoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.253])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2016 16:25:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:24:18 +1200
Message-Id: <731eede36c8f5a61bb56cc1091b53b9d10d1bce8.1462921503.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 4/6] bitbake.conf: whitelist progress varflag
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
X-List-Received-Date: Tue, 10 May 2016 23:25:03 -0000

We don't want the value of this varflag in any signatures since it's
only there for the purpose of aiding display of task execution.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c4175f..14fee7f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -814,7 +814,8 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
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


