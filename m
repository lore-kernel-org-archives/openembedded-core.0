Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C71A787DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 19:49:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 11:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,405,1505804400"; 
   d="scan'208";a="3105426"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2017 11:49:03 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 11:48:49 -0800
Message-Id: <1510861730-82471-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
References: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 3/4] x11perf: improve reproducibility
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
X-List-Received-Date: Thu, 16 Nov 2017 19:49:03 -0000

Remove build host refeences.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb b/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
index 4e93558..a06aa26 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb
@@ -13,6 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
 
 PE = "1"
 
+do_install_append_class-target () {
+    sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}${bindir}/x11perfcomp
+}
+
 FILES_${PN} += "${libdir}/X11/x11perfcomp/*"
 
 SRC_URI[md5sum] = "f0b24e4d8beb622a419e8431e1c03cd7"
-- 
2.7.4


