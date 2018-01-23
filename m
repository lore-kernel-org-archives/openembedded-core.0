Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 96CEF7867B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="13509592"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2018 06:04:09 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id EF22C5800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:08 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:41 +0200
Message-Id: <1516716352-32735-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 01/12] freetype: upgrade to version 2.9
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:08 -0000

2.8.1 -> 2.9

Change in LIC_FILES_CHKSUM is due to change of URL www.freetype.org
from http to https.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../freetype/{freetype_2.8.1.bb => freetype_2.9.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.8.1.bb => freetype_2.9.bb} (89%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.8.1.bb b/meta/recipes-graphics/freetype/freetype_2.9.bb
similarity index 89%
rename from meta/recipes-graphics/freetype/freetype_2.8.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.9.bb
index e035375..da05916 100644
--- a/meta/recipes-graphics/freetype/freetype_2.8.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.9.bb
@@ -9,7 +9,7 @@ SECTION = "libs"
 
 LICENSE = "FreeType | GPLv2+"
 LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1 \
-                    file://docs/FTL.TXT;md5=13b25413274c9b3b09b63e4028216ff4 \
+                    file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI[md5sum] = "bf0a210b6fe781228fa0e4a80691a521"
-SRC_URI[sha256sum] = "e5435f02e02d2b87bb8e4efdcaa14b1f78c9cf3ab1ed80f94b6382fb6acc7d78"
+SRC_URI[md5sum] = "513c403c110016fdc7e537216a642b1d"
+SRC_URI[sha256sum] = "e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a"
 
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-- 
2.4.0


