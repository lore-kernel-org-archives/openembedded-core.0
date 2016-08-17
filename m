Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 01CE060762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:18:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2016 19:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="866670710"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga003.jf.intel.com with ESMTP; 16 Aug 2016 19:17:59 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 22:14:55 -0700
Message-Id: <1471410895-3159-3-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1471410895-3159-1-git-send-email-california.l.sullivan@intel.com>
References: <1471410895-3159-1-git-send-email-california.l.sullivan@intel.com>
Subject: [PATCH 3/3] parselogs.py: Add failed to setup card detect gpio error on x86
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
X-List-Received-Date: Wed, 17 Aug 2016 02:18:01 -0000

This error has occurred on the MinnowBoard Max and Turbot since its
inception. It supposedly indicates a non-working SD card reader, but
ours works fine. Whitelist the error.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 69d0783..9f954bc 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -55,6 +55,7 @@ x86_common = [
     'Could not enable PowerButton event',
     'probe of LNXPWRBN:00 failed with error -22',
     'pmd_set_huge: Cannot satisfy',
+    'failed to setup card detect gpio',
 ] + common_errors
 
 qemux86_common = [
-- 
2.5.5


