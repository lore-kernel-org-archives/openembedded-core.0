Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 91EBE6BC98
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:52:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Aug 2013 03:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="393193579"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2013 03:52:15 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id E8D726A4092;
	Wed, 28 Aug 2013 03:52:12 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2013 13:52:09 +0300
Message-Id: <1377687129-32760-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] classes/testimage: increase default boot timeout
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
X-List-Received-Date: Wed, 28 Aug 2013 10:52:14 -0000

While I can't reproduce on local builds, sometimes images fail
to boot on AB (which runs many builds at once). Assuming
there isn't something weird going on, let's just give it more time.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2bebbd8..b30c841 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -31,7 +31,7 @@ DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "ping ssh df connman syslog xorg sc
 
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
-TEST_QEMUBOOT_TIMEOUT ?= "500"
+TEST_QEMUBOOT_TIMEOUT ?= "1000"
 
 python do_testimage() {
     testimage_main(d)
-- 
1.8.3.1


