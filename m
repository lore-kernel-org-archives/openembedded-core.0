Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1To26E-0005aC-7u
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 02:17:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Dec 2012 17:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,360,1355126400"; d="scan'208";a="263216995"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.22])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2012 17:02:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2012 17:02:13 -0800
Message-Id: <1356570133-7303-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] iproute2: DEPENDS on iptables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Dec 2012 01:17:31 -0000

Make sure iproute rebuilds when iptables is updated

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index d8b1a17..41957ce 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://ip/ip.c;beginline=3;endline=8;md5=689d691d0410a4b64d3899f8d6e31817"
 
-DEPENDS = "flex-native bison-native"
+DEPENDS = "flex-native bison-native iptables"
 
 inherit update-alternatives
 
-- 
1.8.0.2



