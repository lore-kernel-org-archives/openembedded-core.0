Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3D6783FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:01:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2018 04:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,429,1511856000"; d="scan'208";a="13895496"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2018 04:01:37 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 14:01:28 +0200
Message-Id: <1e1d42a53e534a7c9db8f4f695c28e7a2af427be.1517227178.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
References: <cover.1517227178.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/7] postinst_intercepts: add a delay_to_first_boot hook
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
X-List-Received-Date: Mon, 29 Jan 2018 12:01:36 -0000

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


