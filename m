Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E229B7F7B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:29:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2020 23:30:00 -0800
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; d="scan'208";a="228283696"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.21.115])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jan 2020 23:29:59 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 15:29:50 +0800
Message-Id: <20200120072950.22884-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH] libva: upgrade 2.6.0 -> 2.6.1
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
X-List-Received-Date: Mon, 20 Jan 2020 07:30:00 -0000
Content-Transfer-Encoding: 8bit

Also switch back to using the released tarballs.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libva/{libva_2.6.0.bb => libva_2.6.1.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva_2.6.0.bb => libva_2.6.1.bb} (87%)

diff --git a/meta/recipes-graphics/libva/libva_2.6.0.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
similarity index 87%
rename from meta/recipes-graphics/libva/libva_2.6.0.bb
rename to meta/recipes-graphics/libva/libva_2.6.1.bb
index d14e1911ad..92cea83bc1 100644
--- a/meta/recipes-graphics/libva/libva_2.6.0.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -17,9 +17,9 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "git://github.com/intel/libva.git;branch=v2.6-branch"
-SRCREV = "5f693d9e603e0e83928cec67c30b6ac902d7aa85"
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
+SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.21.1


