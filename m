Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1965260762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:17:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2016 19:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="866670646"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga003.jf.intel.com with ESMTP; 16 Aug 2016 19:17:55 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 22:14:54 -0700
Message-Id: <1471410895-3159-2-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1471410895-3159-1-git-send-email-california.l.sullivan@intel.com>
References: <1471410895-3159-1-git-send-email-california.l.sullivan@intel.com>
Subject: [PATCH 2/3] parselogs.py: Add dmi and ioremap errors to ignore list for core2
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
X-List-Received-Date: Wed, 17 Aug 2016 02:17:57 -0000

These errors have been occuring since the introduction of the 4.4
kernel with no apparent functionality loss. Whitelist for now.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 3899d26..69d0783 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -110,6 +110,8 @@ ignore_errors = {
         '(EE) Failed to load module psbdrv',
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
+        'dmi: Firmware registration failed.',
+        'ioremap error for 0x78',
         ] + x86_common,
     'intel-corei7-64' : x86_common,
     'crownbay' : x86_common,
-- 
2.5.5


