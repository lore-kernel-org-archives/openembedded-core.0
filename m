Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E4F2078A95
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 23:08:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 15:08:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,425,1515484800"; d="scan'208";a="22873251"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga006.jf.intel.com with ESMTP; 04 Mar 2018 15:08:01 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 15:07:50 -0800
Message-Id: <20180304230750.10113-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] libtest-needs-perl (and others): self-assign maintainerhsip
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
X-List-Received-Date: Sun, 04 Mar 2018 23:08:01 -0000

Also, take over the other recipes that were just enabled for
ptest:
  - liberror-perl
  - liburi-perl
  - libxml-parser-perl
  - libxml-perl
  - libxml-simple-perl

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5039248790..1e7517ac9a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -331,7 +331,7 @@ RECIPE_MAINTAINER_pn-libdumpvalue-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libenv-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libepoxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-liberror-perl = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-liberror-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libevdev = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libevent = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libexif = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -394,6 +394,7 @@ RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsolv = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libtimedate-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libtirpc = "Maxin B. John <maxin.john@intel.com>"
@@ -403,7 +404,7 @@ RECIPE_MAINTAINER_pn-libtool-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libunistring = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libunwind = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-liburi-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb-compat = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libuser = "Robert Yang <liezhi.yang@windriver.com>"
@@ -430,11 +431,11 @@ RECIPE_MAINTAINER_pn-libxinerama = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxkbcommon = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxkbfile = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libxml-parser-perl = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libxml-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-parser-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libxml-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libxml-sax-perl = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libxml-simple-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-simple-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libxmu = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxpm = "Armin Kuster <akuster@mvista.com>"
-- 
2.14.3


