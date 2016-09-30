Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 50AAE6007A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 23:40:56 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 30 Sep 2016 16:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,423,1473145200"; d="scan'208";a="15171332"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga005.jf.intel.com with ESMTP; 30 Sep 2016 16:40:57 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 16:40:51 -0700
Message-Id: <1475278851-28671-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] parselogs.py: Add disabling eDP error to x86_common whitelist
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
X-List-Received-Date: Fri, 30 Sep 2016 23:40:57 -0000

The NUC6 firmware tells the kernel to try and initialize an embedded
DisplayPort it does not have, causing this warning. Its harmless, so
just whitelist it.

Fixes [YOCTO #9434].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 3bea310..8efe2d1 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -57,6 +57,7 @@ x86_common = [
     'pmd_set_huge: Cannot satisfy',
     'failed to setup card detect gpio',
     'amd_nb: Cannot enumerate AMD northbridges',
+    'failed to retrieve link info, disabling eDP',
 ] + common_errors
 
 qemux86_common = [
-- 
2.5.5


