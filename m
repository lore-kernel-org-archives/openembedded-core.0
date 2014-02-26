Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 19CEF6DC27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 12:48:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2014 04:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,547,1389772800"; d="scan'208";a="490080387"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.179])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2014 04:48:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 14:48:17 +0200
Message-Id: <1393418897-10829-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] security_flags: disable PIE flags for cups builds
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
X-List-Received-Date: Wed, 26 Feb 2014 12:48:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e7d4933a..93d6355 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -7,6 +7,7 @@ SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
 # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
 # to CPPFLAGS it gets picked into CFLAGS in bitbake.
 #TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
+SECURITY_CFLAGS_pn-cups = "${SECURITY_NO_PIE_CLAGS}"
 SECURITY_CFLAGS_pn-curl = "-fstack-protector-all -pie -fpie"
 SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.8.3.1


