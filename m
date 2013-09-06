Return-Path: <mihai.prica@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 634816BF8D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:50:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2013 07:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,854,1371106800"; d="scan'208";a="397701799"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.155])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2013 07:50:21 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 17:49:00 +0300
Message-Id: <c1363a436fa44130ea9e73cf05aaf2be40400008.1378477619.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378477619.git.mihai.prica@intel.com>
References: <cover.1378477619.git.mihai.prica@intel.com>
In-Reply-To: <cover.1378477619.git.mihai.prica@intel.com>
References: <cover.1378477619.git.mihai.prica@intel.com>
Subject: [PATCH 1/2] bluez5: Install the bluetooth library
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
X-List-Received-Date: Fri, 06 Sep 2013 14:50:44 -0000

Bluez5 doesn't install libbluetooth by default. This is required
by connman, ofono or other packages.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 2fae7fb..e2b7169 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -36,6 +36,7 @@ EXTRA_OECONF = "\
   --enable-test \
   --enable-datafiles \
   ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \
+  --enable-library \
 "
 
 do_install_append() {
-- 
1.7.9.5


