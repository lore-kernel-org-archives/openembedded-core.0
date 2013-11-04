Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 803196D2FE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 22:07:39 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Nov 2013 14:07:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="384603192"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.66])
	by azsmga001.ch.intel.com with ESMTP; 04 Nov 2013 14:07:40 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2013 14:07:40 -0800
Message-Id: <1383602860-7758-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] mdadm: Disable the RUN_DIR check
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
X-List-Received-Date: Mon, 04 Nov 2013 22:07:39 -0000

This check was looking for /run/mdadm on the host system, this check is optional so disable it.

[YOCTO #5447]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mdadm/mdadm_3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
index 23c9408..586e04a 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -25,6 +25,8 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/sha1.h
 }
 
+EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
+
 do_compile() {
 	oe_runmake
 }
-- 
1.8.3.1


