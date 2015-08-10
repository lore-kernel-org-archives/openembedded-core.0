Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C6DF0766D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:07:29 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Aug 2015 05:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="780435991"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 10 Aug 2015 05:06:58 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 15:08:22 +0300
Message-Id: <dfab1128c16084f82e650ccdbf64be6c64495d84.1439204506.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
References: <f3db7c80b857792fb3bd1ee12ffa2d5968a28395.1439204506.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1439204506.git.jussi.kukkonen@intel.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/5] resolvconf: Upgrade 1.76 -> 1.77
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
X-List-Received-Date: Mon, 10 Aug 2015 12:07:31 -0000

Improve the recipe by using ${DEBIAN_MIRROR} and ${PV} instead of hard
coded values.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.76.bb => resolvconf_1.77.bb} (89%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
similarity index 89%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
index 797e9b0..45862ff 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.77.bb
@@ -11,13 +11,13 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20141013T184415Z/pool/main/r/${BPN}/${BPN}_1.76.tar.xz \
+SRC_URI = "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.tar.xz \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
 
-SRC_URI[md5sum] = "d78ce30ea068999cd3e0523300b27255"
-SRC_URI[sha256sum] = "c9f40f7405b37399ddbf29ca4205b4911ee35cb9ffd9be7671faa2385b1fa573"
+SRC_URI[md5sum] = "7362d766e47bfc253500f42b30330d9f"
+SRC_URI[sha256sum] = "5a6e21e8ba6822a5f93075c8c8fe7977e34780ba551af51930d0b31fdd99ab56"
 
 inherit allarch
 
-- 
2.1.4


