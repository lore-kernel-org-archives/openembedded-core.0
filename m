Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 120BF71BD0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2016 04:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="1057842259"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2016 04:29:26 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 415256A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:53 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:56 +0300
Message-Id: <1477222197-3698-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/10] libjpeg-turbo: Upgrade 1.5.0 -> 1.5.1
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:25 -0000

Bug fixes and various improvements for AArch64 and PowerPC.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../jpeg/{libjpeg-turbo_1.5.0.bb => libjpeg-turbo_1.5.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_1.5.0.bb => libjpeg-turbo_1.5.1.bb} (93%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
similarity index 93%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
index c9e70d7..695928d 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a127
 DEPENDS = "nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "3fc5d9b6a8bce96161659ae7a9939257"
-SRC_URI[sha256sum] = "9f397c31a67d2b00ee37597da25898b03eb282ccd87b135a50a69993b6a2035f"
+SRC_URI[md5sum] = "55deb139b0cac3c8200b75d485fc13f3"
+SRC_URI[sha256sum] = "41429d3d253017433f66e3d472b8c7d998491d2f41caa7306b8d9a6f2a2c666c"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.4.0


