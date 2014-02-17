Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 914406E8DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:22:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 06:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,860,1384329600"; d="scan'208";a="484721904"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 06:22:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 14:22:27 +0000
Message-Id: <f74ef04aaf8057a788856023f22920456155486b.1392646768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1392646768.git.paul.eggleton@linux.intel.com>
References: <cover.1392646768.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] bitbake.conf: add BBINCLUDED and BB_INVALIDCONF to config hash whitelist
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
X-List-Received-Date: Mon, 17 Feb 2014 14:22:43 -0000

These variables should not influence the config hash, i.e. changing them
shouldn't trigger a reparse of the metadata, so whitelist them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4fb6a1c..f81dea6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -771,7 +771,7 @@ BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR \
     WARN_QA ERROR_QA WORKDIR"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
-    PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV"
+    PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc defaultval _append _prepend deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue file-checksums python \
     func task export unexport noexec nostamp dirs cleandirs \
-- 
1.8.5.3


