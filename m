Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 94BF1608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 15:22:05 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2013 08:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,840,1367996400"; d="scan'208";a="279459980"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.14.21])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 08:22:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 08:22:05 -0700
Message-Id: <1375975325-2752-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] tzcode: Fix up tzdata to 2013d
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
X-List-Received-Date: Thu, 08 Aug 2013 15:22:06 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/tzcode/tzcode-native_2013d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
index 8dea55e..af21151 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013d.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d2
 # note that we allow for us to use data later than our code version
 #
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2013b.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2013d.tar.gz;name=tzdata"
 
 SRC_URI[tzdata.md5sum] = "65b6818162230fc02f86f293376c73df"
 SRC_URI[tzdata.sha256sum] = "cd1c96f0676e0edceebc6a418a2222ffb05becb41180dd9f847b9c7cef303b04"
-- 
1.8.1.4


