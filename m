Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SDsKN-0005iR-CF
	for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 09:02:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2012 23:53:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="148113553"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2012 23:53:19 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Mar 2012 14:49:25 +0800
Message-Id: <cffbb91699ff957fba458132a19a9c1799129dc9.1333176251.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
References: <d33b7d21b1cc23f7c20743d85a261c4d610e2f41.1333176251.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333176251.git.lianhao.lu@intel.com>
References: <cover.1333176251.git.lianhao.lu@intel.com>
Subject: [PATCH 5/5] pkgconfig.bbclass: corrected dependency for -nativesdk.
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
X-List-Received-Date: Sat, 31 Mar 2012 07:02:23 -0000

For -nativesdk, the dependency should be pkgconfig-nativesdk instead of
pkgconfig.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/pkgconfig.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
index 53e793a..ddcf878 100644
--- a/meta/classes/pkgconfig.bbclass
+++ b/meta/classes/pkgconfig.bbclass
@@ -2,5 +2,6 @@ DEPENDS_prepend = "pkgconfig-native "
 
 PKGCONFIGRDEP = "pkgconfig"
 PKGCONFIGRDEP_virtclass-native = ""
+PKGCONFIGRDEP_virtclass-nativesdk = "pkgconfig-nativesdk"
 
 RDEPENDS_${PN}-dev += "${PKGCONFIGRDEP}"
-- 
1.7.0.4



