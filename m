Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9030A6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 17:40:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2016 10:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,356,1455004800"; d="scan'208";a="936970572"
Received: from mmaidmen-mobl3.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.103.97])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2016 10:40:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 18 Mar 2016 10:40:01 -0700
Message-Id: <1458322801-14714-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] parselogs: add new whitelist entries to address 4.4.3 issues
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
X-List-Received-Date: Fri, 18 Mar 2016 17:40:03 -0000

This message appears on older hardware and is a benign warning

[YOCTO #9179]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 431c436..32d9081 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -54,6 +54,7 @@ x86_common = [
     'wrong ELF class',
     'Could not enable PowerButton event',
     'probe of LNXPWRBN:00 failed with error -22',
+    'pmd_set_huge: Cannot satisfy',
 ] + common_errors
 
 qemux86_common = [
-- 
2.5.0


