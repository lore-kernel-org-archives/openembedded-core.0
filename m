Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 7B32B78ABD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 03:25:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 19:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,425,1515484800"; d="scan'208";a="179872402"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 19:25:54 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 19:25:18 -0800
Message-Id: <eaeb3198cf033c5960fb0c5db7cbec630d79d69d.1520219828.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
References: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 6/6] maintainers.inc: self-assign recipes from recipes-extended/perl
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
X-List-Received-Date: Mon, 05 Mar 2018 03:25:52 -0000

In prior round, the perl module recipes in recipes-extended/perl
were inadvertantly overlooked.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1e7517ac9a..1bd5fbd61e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -321,7 +321,7 @@ RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alexander.kanavin@intel.com
 RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libclass-isa-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libcroco = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libdaemon = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libdmx = "Armin Kuster <akuster@mvista.com>"
@@ -394,9 +394,9 @@ RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsolv = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@intel.com>"
+RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-libtimedate-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libtimedate-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libtirpc = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libtool = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-libtool-cross = "Robert Yang <liezhi.yang@windriver.com>"
@@ -430,11 +430,11 @@ RECIPE_MAINTAINER_pn-libxi = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxinerama = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxkbcommon = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libxkbfile = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-namespacesupport-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libxml-parser-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libxml-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
-RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libxml-sax-perl = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-libxml-sax-base-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libxml-sax-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libxml-simple-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libxmu = "Armin Kuster <akuster@mvista.com>"
-- 
2.14.3


