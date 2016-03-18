Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF6860767
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 21:25:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 18 Mar 2016 14:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,357,1455004800"; d="scan'208";a="672092512"
Received: from mmaidmen-mobl3.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.103.97])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2016 14:24:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 18 Mar 2016 14:24:46 -0700
Message-Id: <1458336286-21607-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] parselogs: add new whitelist entries to address 4.4.3 issues
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
X-List-Received-Date: Fri, 18 Mar 2016 21:25:06 -0000

Adds intel-corei7-64 with x86-common, this makes the x86-common
whitelist available for intel-corei7-64 bsp also.

[YOCTO #9179]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oeqa/runtime/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 431c436..4def533 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -54,6 +54,7 @@ x86_common = [
     'wrong ELF class',
     'Could not enable PowerButton event',
     'probe of LNXPWRBN:00 failed with error -22',
+    'pmd_set_huge: Cannot satisfy',
 ] + common_errors
 
 qemux86_common = [
@@ -110,6 +111,7 @@ ignore_errors = {
         '(EE) open /dev/fb0: No such file or directory',
         '(EE) AIGLX: reverting to software rendering',
         ] + x86_common,
+    'intel-corei7-64' : x86_common,
     'crownbay' : x86_common,
     'genericx86' : x86_common,
     'genericx86-64' : x86_common,
-- 
2.5.0


