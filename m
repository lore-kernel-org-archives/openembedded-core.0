Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9C6F78C2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:35:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2018 07:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,405,1526367600"; d="scan'208";a="249163881"
Received: from jfkehoe-mobl.amr.corp.intel.com (HELO localhost.localdomain)
	([10.252.50.133])
	by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2018 07:35:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 16:35:39 +0200
Message-Id: <20180726143539.4818-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] classes/package: fix variable name in comment
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
X-List-Received-Date: Thu, 26 Jul 2018 14:35:56 -0000

The variable is PACKAGE_WRITE_DEPS as seen in the default below the
comment.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index be76b30f31c..546047c741a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -58,7 +58,7 @@ PACKAGE_DEPENDS += "rpm-native dwarfsrcfiles-native"
 
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you need to
-# list that tool in PACKAGE_WRITE_DEPENDS. Target package dependencies belong
+# list that tool in PACKAGE_WRITE_DEPS. Target package dependencies belong
 # in the package dependencies as normal, this is just for native/cross support
 # tools at rootfs build time.
 PACKAGE_WRITE_DEPS ??= ""
-- 
2.17.1


