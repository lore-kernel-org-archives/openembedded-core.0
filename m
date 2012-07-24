Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StXyp-0007o2-K1
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:48:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 22:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172328335"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 22:36:54 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:36:55 +0300
Message-Id: <1343108218-7108-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/5] iptables: upgrade to ver. 1.4.14
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 05:48:23 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{iptables_1.4.13.bb => iptables_1.4.14.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.13.bb => iptables_1.4.14.bb} (91%)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.13.bb b/meta/recipes-extended/iptables/iptables_1.4.14.bb
similarity index 91%
rename from meta/recipes-extended/iptables/iptables_1.4.13.bb
rename to meta/recipes-extended/iptables/iptables_1.4.14.bb
index 59782c0..4396ccf 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.14.bb
@@ -24,8 +24,8 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch"
 
-SRC_URI[md5sum] = "40a15608ec57b50e9377cace546dd115"
-SRC_URI[sha256sum] = "321e2600fc4541a958e44cafd85a42864b0035404097e0f2e082d474029b9ded"
+SRC_URI[md5sum] = "5ab24ad683f76689cfe7e0c73f44855d"
+SRC_URI[sha256sum] = "9be675696f41cd4f35cc332b667d285fe9489ca93c8e1f77804bd04b3315a522"
 
 inherit autotools
 
-- 
1.7.9.5



