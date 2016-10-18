Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD0271AD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 16:24:14 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 18 Oct 2016 09:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,362,1473145200"; d="scan'208";a="21292673"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga004.jf.intel.com with ESMTP; 18 Oct 2016 09:24:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2016 09:23:12 -0700
Message-Id: <1476807792-16431-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] insane.bbclass: Additional "mips" and "mipsel" machine definitions
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
X-List-Received-Date: Tue, 18 Oct 2016 16:24:15 -0000

Add "mips" and "mipsel" to "machdata" table.
Although there is a way to add entries to the "machdata" table
from a BSP without modifying the insane.bbclass directly, MIPS is
already supported in openembedded-core and as such the relevant entries
should be present in insane.bbclass.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/insane.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b347638..21c5cda 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -66,6 +66,8 @@ def package_qa_get_machine_dict(d):
                         "i586" :      (3,      0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
                         "epiphany":   (4643,   0,    0,          True,          32),
+                        "mips":       ( 8,     0,    0,          False,         32),
+                        "mipsel":     ( 8,     0,    0,          True,          32),
                       },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
-- 
2.7.4


