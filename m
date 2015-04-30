Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2C96A73BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 07:39:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Apr 2015 00:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,675,1422950400"; d="scan'208";a="487559003"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 00:39:56 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 10:39:16 +0300
Message-Id: <0db832f02a07ef77b74759b405337f461beb1e9b.1430379176.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <3e8f4ce58a75a12e3515e66500e0c9c25e2f7ee7.1430379176.git.jussi.kukkonen@intel.com>
References: <3e8f4ce58a75a12e3515e66500e0c9c25e2f7ee7.1430379176.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430379176.git.jussi.kukkonen@intel.com>
References: <cover.1430379176.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] icu: Upgrade 54.1 -> 55.1
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
X-List-Received-Date: Thu, 30 Apr 2015 07:39:59 -0000

License checksum changed because of unrelated changes in the html
file: actual license texts are unchanged.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/icu/{icu_54.1.bb => icu_55.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/icu/{icu_54.1.bb => icu_55.1.bb} (67%)

diff --git a/meta/recipes-support/icu/icu_54.1.bb b/meta/recipes-support/icu/icu_55.1.bb
similarity index 67%
rename from meta/recipes-support/icu/icu_54.1.bb
rename to meta/recipes-support/icu/icu_55.1.bb
index 45b5cb6..f63a9bd 100644
--- a/meta/recipes-support/icu/icu_54.1.bb
+++ b/meta/recipes-support/icu/icu_55.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../license.html;md5=9890f5ff4ed056a0c2fa84848b9b6066"
+LIC_FILES_CHKSUM = "file://../license.html;md5=64eff4aadff4d104d6d437c4fde0e6d7"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
@@ -16,6 +16,6 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "e844caed8f2ca24c088505b0d6271bc0"
-SRC_URI[sha256sum] = "d42bc9a8ca6a91c55eb0925c279f49e5b508d51ef26ac9850d9be55de5bb8ab3"
+SRC_URI[md5sum] = "e2d523df79d6cb7855c2fbe284f4db29"
+SRC_URI[sha256sum] = "e16b22cbefdd354bec114541f7849a12f8fc2015320ca5282ee4fd787571457b"
 
-- 
2.1.4


