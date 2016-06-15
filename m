Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ECBE06FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:14:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2016 06:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,476,1459839600"; d="scan'208";a="828552168"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2016 06:13:26 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 576B36A4080;
	Wed, 15 Jun 2016 06:13:24 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2016 16:13:00 +0300
Message-Id: <1465996380-32444-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1465996380-32444-1-git-send-email-maxin.john@intel.com>
References: <1465996380-32444-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] pointercal-xinput: add a dummy calibration file for qemu
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
X-List-Received-Date: Wed, 15 Jun 2016 13:14:13 -0000

In qemu, the emulated PS/2 mouse reports itself as an "absolute coordinate"
device and that makes xinput_calibrator think it could be calibrated.

Add a dummy calibration file as a work around to prevent xinput_calibrator from
popping up on every boot in qemu.

[YOCTO #8380]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput       | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput
new file mode 100644
index 0000000..a816d6d
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/qemuall/pointercal.xinput
@@ -0,0 +1,2 @@
+# Dummy pointercal.xinput file to prevent xinput_calibrator
+# from running on qemu startup
-- 
2.4.0


