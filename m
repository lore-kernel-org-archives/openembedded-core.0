Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAvgP-0003eJ-PE
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 06:05:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2013 20:48:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,753,1355126400"; d="scan'208";a="262444296"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.143])
	by azsmga001.ch.intel.com with ESMTP; 27 Feb 2013 20:48:45 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 20:48:44 -0800
Message-Id: <1362026924-10574-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <1362026924-10574-1-git-send-email-sgw@linux.intel.com>
References: <1362026924-10574-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] iproute2: don't use the kernel header tree
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
X-List-Received-Date: Thu, 28 Feb 2013 05:05:41 -0000

This should compile against the userspace safe kernel headers

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 41957ce..fb233eb 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables"
 
 inherit update-alternatives
 
-EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_KERNEL_DIR}/include DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
+EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
 do_install () {
     oe_runmake DESTDIR=${D} install
-- 
1.8.0.2



