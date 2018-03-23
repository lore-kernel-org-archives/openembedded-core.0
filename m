Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1999260722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 05:29:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 22:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,348,1517904000"; d="scan'208";a="27731754"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga008.jf.intel.com with ESMTP; 22 Mar 2018 22:29:41 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 22:29:39 -0700
Message-Id: <20180323052939.64091-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] maintainers.inc: drop lsb4 perl modules no longer in core
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
X-List-Received-Date: Fri, 23 Mar 2018 05:29:41 -0000

The following perl module packages were removed from oe-core
with commit: 30fb4c8f329fe3aa3c528ffeba60ee7d702e873e
  - libclass-isa-perl
  - libenv-perl
  - libdumpvalue-perl
  - libfile-checktree-perl
  - libi18n-collate-perl
  - libpod-plainer-perl

Remove these from the maintainers list

Fixes: [Yocto #12582]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 60397f3607..bcfa200799 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -319,7 +319,6 @@ RECIPE_MAINTAINER_pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libcgroup = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-libclass-isa-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libcomps = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libconvert-asn1-perl = "Tim Orling <timothy.t.orling@intel.com>"
 RECIPE_MAINTAINER_pn-libcroco = "Maxin B. John <maxin.john@intel.com>"
@@ -327,8 +326,6 @@ RECIPE_MAINTAINER_pn-libdaemon = "Alexander Kanavin <alexander.kanavin@intel.com
 RECIPE_MAINTAINER_pn-libdmx = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libdnf = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libdrm = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-libdumpvalue-perl = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libenv-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libepoxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-liberror-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
@@ -337,7 +334,6 @@ RECIPE_MAINTAINER_pn-libevent = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libexif = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libfakekey = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libffi = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-libfile-checktree-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libfm = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libfm-extra = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libfontenc = "Armin Kuster <akuster@mvista.com>"
@@ -349,7 +345,6 @@ RECIPE_MAINTAINER_pn-libglade = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libglu = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libgudev = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libi18n-collate-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libical = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libice = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-libiconv = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -380,7 +375,6 @@ RECIPE_MAINTAINER_pn-libpfm4 = "Matthew McClintock <msm@freescale.com>"
 RECIPE_MAINTAINER_pn-libpipeline = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libpng = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpng12 = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-libpod-plainer-perl = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libproxy = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-librepo = "Alexander Kanavin <alexander.kanavin@intel.com>"
-- 
2.14.3


