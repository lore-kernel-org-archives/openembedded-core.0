Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B7C396B450
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:35:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2013 01:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="373325668"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2013 01:35:29 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 3FCC52C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:35:28 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 11:35:52 +0300
Message-Id: <21eae925cefae986841ca9da583060ecd68afd47.1375171561.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1375171561.git.stefanx.stanacar@intel.com>
References: <cover.1375171561.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1375171561.git.stefanx.stanacar@intel.com>
References: <cover.1375171561.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/4] oeqa/utils/qemurunner: add comment and header
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
X-List-Received-Date: Tue, 30 Jul 2013 08:35:29 -0000

One of the files was missing comment/header, unlike the others.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 1051b2b..02e0a4a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -1,3 +1,10 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# This module provides a class for starting qemu images using runqemu.
+# It's used by testimage.bbclass.
+
 import subprocess
 import optparse
 import sys
-- 
1.8.3.1


