Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EE30078958
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:45:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 04:45:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; d="scan'208";a="19851081"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2018 04:45:46 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 14:45:43 +0200
Message-Id: <2ffeae916137d12de324fa7a3c135eae3d01a3e6.1515415190.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
References: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 1/6] postinst_intercepts: add a delay_to_first_boot hook
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
X-List-Received-Date: Mon, 08 Jan 2018 12:45:46 -0000

This allows postinsts scripts to explicitly request a deferral to first boot
(by calling 'postinst_intercept delay_to_first_boot') instead of 'exit 1' which
should be used only to indicate actual script failures.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/postinst-intercepts/delay_to_first_boot | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 scripts/postinst-intercepts/delay_to_first_boot

diff --git a/scripts/postinst-intercepts/delay_to_first_boot b/scripts/postinst-intercepts/delay_to_first_boot
new file mode 100644
index 00000000000..ecdbef95dde
--- /dev/null
+++ b/scripts/postinst-intercepts/delay_to_first_boot
@@ -0,0 +1,2 @@
+#!/bin/sh
+exit 1
-- 
2.15.1


