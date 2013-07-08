Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DC68A6AF6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 15:52:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2013 08:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; d="scan'208";a="362092576"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2013 08:53:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 08:52:02 -0700
Message-Id: <1373298723-12460-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 1/2] packagegroup-core-basic: remove libpam
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
X-List-Received-Date: Mon, 08 Jul 2013 15:52:26 -0000

It is a dependency of shadow and other PAM related recipes and will be
built when the pam DISTRO_FEATURE is enabled.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index dd3c450..2e6f576 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -108,7 +108,6 @@ RDEPENDS_packagegroup-core-multiuser = "\
     cracklib \
     gzip \
     libuser \
-    ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
     shadow \
     sudo \
     "
-- 
1.8.1.4


