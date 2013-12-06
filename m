Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E38D36DF55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 14:57:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2013 06:54:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,841,1378882800"; d="scan'208";a="420490301"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2013 06:57:53 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 17:00:14 +0200
Message-Id: <7d01a9a4f95694afdeceb912d089d28fce8e0205.1386341976.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386341976.git.cristian.iorga@intel.com>
References: <cover.1386341976.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386341976.git.cristian.iorga@intel.com>
References: <cover.1386341976.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] iptables: upgrade to 1.4.21
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
X-List-Received-Date: Fri, 06 Dec 2013 14:57:54 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iptables/{iptables_1.4.19.1.bb => iptables_1.4.21.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/iptables/{iptables_1.4.19.1.bb => iptables_1.4.21.bb} (92%)

diff --git a/meta/recipes-extended/iptables/iptables_1.4.19.1.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
similarity index 92%
rename from meta/recipes-extended/iptables/iptables_1.4.19.1.bb
rename to meta/recipes-extended/iptables/iptables_1.4.21.bb
index a98ad4c..166457d 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.19.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -24,8 +24,8 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
           "
 
-SRC_URI[md5sum] = "be97ce9007fa42c867901b496c935a0a"
-SRC_URI[sha256sum] = "dd51d3b942758a462afc7c8495930d25c93058e5319303247375183ad50164d2"
+SRC_URI[md5sum] = "536d048c8e8eeebcd9757d0863ebb0c0"
+SRC_URI[sha256sum] = "52004c68021da9a599feed27f65defcfb22128f7da2c0531c0f75de0f479d3e0"
 
 inherit autotools
 
-- 
1.8.3.2


