Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StXyq-0007o2-Er
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:48:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 22:36:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172328348"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 22:36:57 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:36:57 +0300
Message-Id: <1343108218-7108-5-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
References: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 4/5] libpcap: upgrade to ver. 1.3
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
X-List-Received-Date: Tue, 24 Jul 2012 05:48:24 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{libpcap-1.2.1 => libpcap-1.3.0}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    0
 .../libpcap/{libpcap_1.2.1.bb => libpcap_1.3.0.bb} |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.1 => libpcap-1.3.0}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.1 => libpcap-1.3.0}/ieee80215-arphrd.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.2.1.bb => libpcap_1.3.0.bb} (73%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.patch
rename to meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arphrd.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-arphrd.patch
rename to meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arphrd.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
similarity index 73%
rename from meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
index 91bedf7..717e0e8 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
@@ -5,8 +5,8 @@ PR = "${INC_PR}.0"
 SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch"
 
-SRC_URI[md5sum] = "06046e0e81efc60566daf1cc96c77d46"
-SRC_URI[sha256sum] = "a135a6ef7e539729a57c7ed345bdb9b64159e13404174006a7972eb33f00debd"
+SRC_URI[md5sum] = "f78455a92622b7a3c05c58b6ad1cec7e"
+SRC_URI[sha256sum] = "41cbd9ed68383afd9f1fda279cb78427d36879d9e34ee707e31a16a1afd872b9"
 
 #
 # make install doesn't cover the shared lib
-- 
1.7.9.5



