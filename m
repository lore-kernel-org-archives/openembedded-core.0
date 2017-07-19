Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 65094782EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:01:12 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 08:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="128573791"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2017 08:00:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 357265808DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:00:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 18:01:22 +0300
Message-Id: <1500476485-20310-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
References: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/6] orc: upgrade to 0.4.27
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
X-List-Received-Date: Wed, 19 Jul 2017 15:01:12 -0000

0.4.26 -> 0.4.27

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/orc/{orc_0.4.26.bb => orc_0.4.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.26.bb => orc_0.4.27.bb} (84%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.26.bb b/meta/recipes-devtools/orc/orc_0.4.27.bb
similarity index 84%
rename from meta/recipes-devtools/orc/orc_0.4.26.bb
rename to meta/recipes-devtools/orc/orc_0.4.27.bb
index e47342f..303f991 100644
--- a/meta/recipes-devtools/orc/orc_0.4.26.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.27.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8e9bef677bae289d3324d81c337a4507"
-SRC_URI[sha256sum] = "7d52fa80ef84988359c3434e1eea302d077a08987abdde6905678ebcad4fa649"
+SRC_URI[md5sum] = "5837dc20dacb5b668935bbded10cbb61"
+SRC_URI[sha256sum] = "51e53e58fc8158e5986a1f1a49a6d970c5b16493841cf7b9de2c2bde7ce36b93"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
2.4.0


