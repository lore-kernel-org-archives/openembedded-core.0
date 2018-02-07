Return-Path: <avinash.reddy.palleti@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1D665D00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 05:23:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2018 21:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,471,1511856000"; d="scan'208";a="25499156"
Received: from arpallet-desk.iind.intel.com ([10.66.247.158])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2018 21:23:59 -0800
From: avinash.reddy.palleti@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Feb 2018 10:53:53 +0530
Message-Id: <1517981033-9544-1-git-send-email-avinash.reddy.palleti@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: saul.wold@intel.com
Subject: [PATCH][PYRO] linux-firmware: Add reference to iwlwifi-8000C firmware
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
X-List-Received-Date: Wed, 07 Feb 2018 05:23:59 -0000

From: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>

Adding reference to iwlwifi-8000c firmware which was removed erroneously in
commit  3e4b382c0c687a76f824cd84b478c4f778e15e3e

Signed-off-by: Avinash Reddy Palleti <avinash.reddy.palleti@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ff60d30..3a2148d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -247,7 +247,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
              ${PN}-iwlwifi-7260 \
              ${PN}-iwlwifi-7265 \
-             ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8265 \
+             ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
@@ -619,6 +619,7 @@ FILES_${PN}-iwlwifi-6050-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6050-5.uco
 FILES_${PN}-iwlwifi-7260   = "${nonarch_base_libdir}/firmware/iwlwifi-7260-*.ucode"
 FILES_${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.ucode"
 FILES_${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode"
+FILES_${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
 FILES_${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
 FILES_${PN}-iwlwifi-misc   = "${nonarch_base_libdir}/firmware/iwlwifi-*.ucode"
 
-- 
2.7.4


