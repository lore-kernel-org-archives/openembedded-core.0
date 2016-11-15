Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EC9C86060F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 23:31:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 15 Nov 2016 15:31:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,496,1473145200"; d="scan'208";a="901827605"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 15 Nov 2016 15:31:21 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 15:31:07 -0800
Message-Id: <1479252667-13602-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] parselogs: Whitelist NUC6 firmware load error message on genericx86-64
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
X-List-Received-Date: Tue, 15 Nov 2016 23:31:21 -0000

This was already whitelisted, but the 4.8 kernel changed the error
message, causing it to get caught by parselogs again.

Fixes [YOCTO #10494].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 8efe2d1..58f62da 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -140,6 +140,7 @@ ignore_errors = {
         'Failed to load firmware i915',
         'Failed to fetch GuC',
         'Failed to initialize GuC',
+        'Failed to load DMC firmware',
         'The driver is built-in, so to load the firmware you need to',
         ] + x86_common,
     'edgerouter' : [
-- 
2.5.5


