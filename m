Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 474076F59F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 16:57:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Mar 2014 08:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,578,1389772800"; d="scan'208";a="484921420"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.25])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 08:57:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 16:56:50 +0000
Message-Id: <3066d5337280dfa55e997bbd729a39102c6826d6.1393865774.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393865774.git.paul.eggleton@linux.intel.com>
References: <cover.1393865774.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393865774.git.paul.eggleton@linux.intel.com>
References: <cover.1393865774.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] bitbake.conf: add new vardepvalueexclude varflag to BB_SIGNATURE_EXCLUDE_FLAGS
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
X-List-Received-Date: Mon, 03 Mar 2014 16:57:02 -0000

We don't want the value of this varflag itself entering any signatures,
ever.

Part of the fix for [YOCTO #5897].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f81dea6..7291bf2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -773,8 +773,8 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc defaultval _append _prepend deps depends \
-    lockfiles type vardepsexclude vardeps vardepvalue file-checksums python \
-    func task export unexport noexec nostamp dirs cleandirs \
+    lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
+    file-checksums python func task export unexport noexec nostamp dirs cleandirs \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-base stamp-extra-info"
 
-- 
1.8.5.3


