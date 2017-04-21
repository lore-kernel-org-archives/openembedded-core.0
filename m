Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 37D7F77BFF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 22:18:38 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Apr 2017 15:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,231,1488873600"; d="scan'208";a="90798088"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 21 Apr 2017 15:18:37 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:18:36 -0700
Message-Id: <1492813116-26583-2-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1492813116-26583-1-git-send-email-california.l.sullivan@intel.com>
References: <1492813116-26583-1-git-send-email-california.l.sullivan@intel.com>
Subject: [PATCH 2/2] parselogs: whitelist failed to enable keyboard error on intel-corei7-64
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
X-List-Received-Date: Fri, 21 Apr 2017 22:18:38 -0000

This error is seen on the Braswell RVP platform we have been using for
testing. The error is caused by atkbd.c keyboard driver, which is only
for AT and PS/2 keyboards. I tested a PS/2 keyboard with the board,
which worked fine, and the board does not have a separate AT connector,
so this error won't cause any functional issues.

[YOCTO #10110].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 8a9231f..c4d347d 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -152,6 +152,7 @@ ignore_errors = {
         'Bluetooth: hci0: Setting Intel event mask failed',
         'ttyS2 - failed to request DMA',
         'Bluetooth: hci0: Failed to send firmware data (-38)',
+        'atkbd serio0: Failed to enable keyboard on isa0060/serio0',
         ] + x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
-- 
2.5.5


