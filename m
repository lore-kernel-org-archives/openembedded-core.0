Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C51BD607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 12:46:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2016 05:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,439,1464678000"; d="scan'208";a="147503774"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 29 Jul 2016 05:46:18 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D21286A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 05:46:05 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 15:45:46 +0300
Message-Id: <1469796346-9594-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] glew: upgrade to 2.0.0
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
X-List-Received-Date: Fri, 29 Jul 2016 12:46:18 -0000

1.13.0 -> 2.0.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb} (84%)

diff --git a/meta/recipes-graphics/glew/glew_1.13.0.bb b/meta/recipes-graphics/glew/glew_2.0.0.bb
similarity index 84%
rename from meta/recipes-graphics/glew/glew_1.13.0.bb
rename to meta/recipes-graphics/glew/glew_2.0.0.bb
index a25c405..489dd7c 100644
--- a/meta/recipes-graphics/glew/glew_1.13.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.0.0.bb
@@ -11,8 +11,8 @@ DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://no-strip.patch"
 
-SRC_URI[md5sum] = "7cbada3166d2aadfc4169c4283701066"
-SRC_URI[sha256sum] = "aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7"
+SRC_URI[md5sum] = "2a2cd7c98f13854d2fcddae0d2b20411"
+SRC_URI[sha256sum] = "c572c30a4e64689c342ba1624130ac98936d7af90c3103f9ce12b8a0c5736764"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/glew/files/glew"
 UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
@@ -29,7 +29,7 @@ EXTRA_OEMAKE = "SYSTEM='linux' \
                 LDFLAGS.EXTRA='${LDFLAGS}' \
                 POPT='${CFLAGS}' \
                 GLEW_PREFIX='${prefix}' BINDIR='${bindir}' \
-                LIBDIR='${libdir}' INCDIR='${includedir}/GL'"
+                LIBDIR='${libdir}' INCDIR='${includedir}/GL' PKGDIR='${libdir}/pkgconfig'"
 
 do_compile() {
 	oe_runmake
-- 
2.4.0


