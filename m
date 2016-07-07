Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 181896013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 15:13:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jul 2016 08:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,324,1464678000"; d="scan'208";a="1017395080"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2016 08:13:29 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C6C536A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 08:13:22 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 18:13:03 +0300
Message-Id: <1467904384-841-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] neard: upgrade to 0.16
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
X-List-Received-Date: Thu, 07 Jul 2016 15:13:55 -0000

0.15 -> 0.16

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/neard/{neard_0.15.bb => neard_0.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/neard/{neard_0.15.bb => neard_0.16.bb} (93%)

diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
similarity index 93%
rename from meta/recipes-connectivity/neard/neard_0.15.bb
rename to meta/recipes-connectivity/neard/neard_0.16.bb
index 93bddb3..b7126f6 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -10,8 +10,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
           "
-SRC_URI[md5sum] = "b746ce62eeef88e8de90765e00a75a1c"
-SRC_URI[sha256sum] = "651f6513d32cdaf8a426255d03aff38a6620a89b0567ec2b36606c6330a93353"
+SRC_URI[md5sum] = "5c691fb7872856dc0d909c298bc8cb41"
+SRC_URI[sha256sum] = "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
-- 
2.4.0


