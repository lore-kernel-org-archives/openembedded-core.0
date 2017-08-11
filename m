Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 624BD78276
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:48:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 02:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="117958427"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 11 Aug 2017 02:48:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 12:45:17 +0300
Message-Id: <20170811094519.27645-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
References: <20170811094519.27645-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/5] v86d: take tarball from debian
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
X-List-Received-Date: Fri, 11 Aug 2017 09:48:39 -0000

Gentoo is removing the package due to dead upstream;
Debian might carry it for a while longer.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 579a0a27eb9..e5f6fff7379 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -9,14 +9,14 @@ DEPENDS = "virtual/kernel"
 RRECOMMENDS_${PN} = "kernel-module-uvesafb"
 PR = "r2"
 
-SRC_URI = "http://distfiles.gentoo.org/distfiles/${BP}.tar.bz2 \
+SRC_URI = "${DEBIAN_MIRROR}/main/v/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://Update-x86emu-from-X.org.patch \
            file://ar-from-env.patch \
            file://aarch64-host.patch \
 "
 
-SRC_URI[md5sum] = "51c792ba7b874ad8c43f0d3da4cfabe0"
-SRC_URI[sha256sum] = "634964ae18ef68c8493add2ce150e3b4502badeb0d9194b4bd81241d25e6735c"
+SRC_URI[md5sum] = "889686ec8424468fe0d205742e77a4c2"
+SRC_URI[sha256sum] = "93575c82e4307d8c4c370ec6b767f5cf87e527b2378146d652a6d8e25d5bdbc5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-- 
2.13.2


