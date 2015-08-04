Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C0C0873231
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 09:21:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2015 02:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,607,1432623600"; d="scan'208";a="761518971"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2015 02:21:19 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 793166A4083;
	Tue,  4 Aug 2015 02:20:33 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 12:21:33 +0300
Message-Id: <1438680093-30359-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/ptest: Fixed pango ptest output.
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
X-List-Received-Date: Tue, 04 Aug 2015 09:21:19 -0000

It was creating output with FAILED instead of FAIL and it
was not compliant with our log parser.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/recipes-graphics/pango/pango/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango/run-ptest b/meta/recipes-graphics/pango/pango/run-ptest
index fa87a75..4d72f30 100644
--- a/meta/recipes-graphics/pango/pango/run-ptest
+++ b/meta/recipes-graphics/pango/pango/run-ptest
@@ -1,3 +1,3 @@
 #! /bin/sh
 
-gnome-desktop-testing-runner pango
+gnome-desktop-testing-runner pango | sed -e "s/FAILED:/FAIL:/"
-- 
2.1.4


