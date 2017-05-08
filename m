Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4C95E71A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 14:47:38 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 07:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="97069126"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.140.209])
	by orsmga005.jf.intel.com with ESMTP; 08 May 2017 07:47:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  8 May 2017 22:47:26 +0800
Message-Id: <1494254846-9382-5-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
References: <1494254846-9382-1-git-send-email-sgw@linux.intel.com>
Cc: Gan, "Gan, Yau Wai" <yau.wai.gan@intel.com>
Subject: [PATCH 4/4] mc: Upgrade from 4.8.18 to 4.8.19
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
X-List-Received-Date: Mon, 08 May 2017 14:47:38 -0000

From: "Gan, Yau Wai" <yau.wai.gan@intel.com>

Signed-off-by: Gan, Yau Wai <yau.wai.gan@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.18.bb => mc_4.8.19.bb} (94%)

diff --git a/meta/recipes-extended/mc/mc_4.8.18.bb b/meta/recipes-extended/mc/mc_4.8.19.bb
similarity index 94%
rename from meta/recipes-extended/mc/mc_4.8.18.bb
rename to meta/recipes-extended/mc/mc_4.8.19.bb
index 17f3f73..23be048 100644
--- a/meta/recipes-extended/mc/mc_4.8.18.bb
+++ b/meta/recipes-extended/mc/mc_4.8.19.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            "
-SRC_URI[md5sum] = "cc56f0c9abd63c4caa3636bba3a08bfb"
-SRC_URI[sha256sum] = "5b591e10dcbea95233434da40cdad4663d360229adf89826576c319667c103cb"
+SRC_URI[md5sum] = "ef423f5b6f80a1a5a5fc53b8324cab70"
+SRC_URI[sha256sum] = "d0dddfae7149fac903f74ef55cfcb2a198e0f7004346c7bded43669d61ba436f"
 
 inherit autotools gettext pkgconfig
 
-- 
2.7.4


