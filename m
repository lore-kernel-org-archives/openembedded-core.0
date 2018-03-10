Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C37FB788BA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 18:58:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2018 10:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,451,1515484800"; d="scan'208";a="33955848"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 10 Mar 2018 10:58:45 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 10 Mar 2018 10:58:45 -0800
Message-Id: <1520708325-64209-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] dbus-test-ptest: improve reproducibility
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
X-List-Received-Date: Sat, 10 Mar 2018 18:58:45 -0000

Remove build host references from additional files.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.2.bb b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
index 26556ed..dce047a 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.2.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.2.bb
@@ -71,7 +71,7 @@ do_install_ptest() {
 	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
 
 	# Remove build host references...
-	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf \) -type f -exec \
+	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
 		sed -i \
 		 -e 's:${B}:${PTEST_PATH}:g' \
 		 {} +
-- 
2.7.4


