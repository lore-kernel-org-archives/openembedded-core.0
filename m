Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEl-0001MN-Cx
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:43 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119574781"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:32:43 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:18 +0800
Message-Id: <7e9ea0d07aa2d1b7cb5f0ad6fb517bce7f123766.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 21/60] libpcap: upgrade to 1.2.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:43 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libpcap-1.2.0 => libpcap-1.2.1}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    0
 .../libpcap/{libpcap_1.2.0.bb => libpcap_1.2.1.bb} |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.0 => libpcap-1.2.1}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.0 => libpcap-1.2.1}/ieee80215-arphrd.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.2.0.bb => libpcap_1.2.1.bb} (73%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.0/aclocal.patch b/meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.2.0/aclocal.patch
rename to meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.0/ieee80215-arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-arphrd.patch
similarity index 100%
rename from meta/recipes-connectivity/libpcap/libpcap-1.2.0/ieee80215-arphrd.patch
rename to meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-arphrd.patch
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.2.0.bb b/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
similarity index 73%
rename from meta/recipes-connectivity/libpcap/libpcap_1.2.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
index bc7c03b..91bedf7 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.2.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
@@ -5,8 +5,8 @@ PR = "${INC_PR}.0"
 SRC_URI += "file://aclocal.patch \
             file://ieee80215-arphrd.patch"
 
-SRC_URI[md5sum] = "dfb8aa690b7a29821bfa183025436569"
-SRC_URI[sha256sum] = "702ac51cfaa5c17d6b92771b22835d58eda4dc9e1f596c80a0b031e4c45c07d6"
+SRC_URI[md5sum] = "06046e0e81efc60566daf1cc96c77d46"
+SRC_URI[sha256sum] = "a135a6ef7e539729a57c7ed345bdb9b64159e13404174006a7972eb33f00debd"
 
 #
 # make install doesn't cover the shared lib
-- 
1.7.6



