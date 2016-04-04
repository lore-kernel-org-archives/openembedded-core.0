Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D5D4D70031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 05:03:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2016 22:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,439,1455004800"; d="scan'208";a="951008536"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.142.238])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2016 22:03:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 17:02:21 +1200
Message-Id: <496a5e995b633431d424fb6e4e1c678b588d4d6f.1459746060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459746060.git.paul.eggleton@linux.intel.com>
References: <cover.1459746060.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459746060.git.paul.eggleton@linux.intel.com>
References: <cover.1459746060.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] classes/buildhistory: fix grammar in comments
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
X-List-Received-Date: Mon, 04 Apr 2016 05:03:20 -0000

Fix a minor grammatical error in the comments here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 60d19e2..0fa9b16 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -42,7 +42,7 @@ BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
-# We want to avoid influence the signatures of sstate tasks - first the function itself:
+# We want to avoid influencing the signatures of sstate tasks - first the function itself:
 sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
 # then the value added to SSTATEPOSTINSTFUNCS:
 SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
-- 
2.5.5


