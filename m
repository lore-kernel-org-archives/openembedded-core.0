Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC8B719E2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:59:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="1122912397"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.85.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2017 12:59:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  6 Feb 2017 12:59:10 -0800
Message-Id: <1486414751-24947-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
References: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] libva-intel-driver: Update to 1.7.3
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
X-List-Received-Date: Mon, 06 Feb 2017 20:59:15 -0000

The upstream has moved their source base from FreeDesktop to github.com/01org

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libva/{libva-intel-driver_1.7.2.bb => libva-intel-driver_1.7.3.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename common/recipes-multimedia/libva/{libva-intel-driver_1.7.2.bb => libva-intel-driver_1.7.3.bb} (89%)

diff --git a/common/recipes-multimedia/libva/libva-intel-driver_1.7.2.bb b/common/recipes-multimedia/libva/libva-intel-driver_1.7.3.bb
similarity index 89%
rename from common/recipes-multimedia/libva/libva-intel-driver_1.7.2.bb
rename to common/recipes-multimedia/libva/libva-intel-driver_1.7.3.bb
index f82e9d7..0194063 100644
--- a/common/recipes-multimedia/libva/libva-intel-driver_1.7.2.bb
+++ b/common/recipes-multimedia/libva/libva-intel-driver_1.7.3.bb
@@ -13,7 +13,8 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 DEPENDS = "libva libdrm"
 
-SRC_URI = "http://www.freedesktop.org/software/vaapi/releases/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "git://github.com/01org/intel-vaapi-driver.git;protocol=https"
+SRCREV = "c747c3428cd862869b75e96b737fa61532d6f27f"
 
 SRC_URI[md5sum] = "f28ac265f836f7ce881305bd3a282c90"
 SRC_URI[sha256sum] = "099e7bf6aa826971ec2caff235babf4da995f754e2ca16a73b258671130e67bc"
-- 
2.7.4


