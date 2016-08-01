Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A303D6AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 11:00:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 01 Aug 2016 04:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,454,1464678000"; d="scan'208";a="1006219508"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.24.213])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2016 04:00:36 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 12:00:27 +0100
Message-Id: <f7ddc37efe3c6696b4aa8248595c06987cb4e222.1470049100.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1470049100.git.joshua.g.lock@intel.com>
References: <cover.1470049100.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1470049100.git.joshua.g.lock@intel.com>
References: <cover.1470049100.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/2] pseudo: update git recipe to include xattr perf fix
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
X-List-Received-Date: Mon, 01 Aug 2016 11:00:38 -0000

Update the SRCREV to 2 commits beyond the 1.8.1 tag (to the current
HEAD) in order to include a fix for the xattr performance regression
[YOCTO #9929].

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 9febf60..8735cf4 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRCREV = "eb47d855a831b6dc0ad34890e84b8f6f483693df"
+SRCREV = "f4b1c752186f4d08f1fadb0ea10ebcde9b0ea251"
 PV = "1.8.1+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.7.4


