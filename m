Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7B81673123
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 03:09:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 19:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,500,1508828400"; d="scan'208";a="17683194"
Received: from anujm-desk.png.intel.com ([172.30.199.130])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jan 2018 19:09:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jan 2018 11:09:06 +0800
Message-Id: <1514948946-3619-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [pyro][PATCH] v86d: take tarball from debian
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
X-List-Received-Date: Wed, 03 Jan 2018 03:09:17 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Gentoo is removing the package due to dead upstream;
Debian might carry it for a while longer.

Fixes [YOCTO #12452]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 579a0a2..e5f6fff 100644
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
2.7.4


