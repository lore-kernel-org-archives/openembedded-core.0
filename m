Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EC62B71B42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:15:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 17 Oct 2016 08:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,357,1473145200"; d="scan'208";a="180649205"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 17 Oct 2016 08:15:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 18:12:41 +0300
Message-Id: <d3eb92aa4c4de22f5392463c11612de5b0379494.1476716907.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/23] manpages.bbclass: add a class
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
X-List-Received-Date: Mon, 17 Oct 2016 15:15:25 -0000

This class enables 'manpages' feature in packages if 'api-documentation'
is in distro features. This ensures that manpages are always built
and installed when API documentation feature is enabled.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/manpages.bbclass | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta/classes/manpages.bbclass

diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
new file mode 100644
index 0000000..d16237b
--- /dev/null
+++ b/meta/classes/manpages.bbclass
@@ -0,0 +1,5 @@
+# Inherit this class to enable or disable building and installation of manpages
+# depending on whether 'api-documentation' is in DISTRO_FEATURES. Such building
+# tends to pull in the entire XML stack and other tools, so it's not enabled
+# by default.
+PACKAGECONFIG_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'manpages', '', d)}"
-- 
2.9.3


