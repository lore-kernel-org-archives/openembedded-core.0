Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D180860111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 11:13:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2016 04:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,556,1459839600"; d="scan'208";a="727872200"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Jul 2016 04:13:36 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BBFDC2C8002
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 04:13:31 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:13:05 +0300
Message-Id: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/6] move directfb from oe-core
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
X-List-Received-Date: Fri, 01 Jul 2016 11:13:37 -0000

directfb.org has been down for about a year now. Our attempts to locate
a trustworthy source from Github has failed to provide a definite answer.

https://github.com/deniskropp/DirectFB/issues/2#issuecomment-226316231

Remove directfb recipe from oe-core and submit it to meta-oe.

[YOCTO #8489]

Maxin B. John (6):
  remove packagegroup-core-directfb.bb
  remove core-image-directfb.bb
  default-distrovars.inc: remove directfb from GTK2DISTROFEATURES
  distro_alias.inc: remove directfb related references
  buildoptions.py: remove directfb image build test
  move directfb from oe-core

 meta/conf/distro/include/default-distrovars.inc    |   2 +-
 meta/conf/distro/include/distro_alias.inc          |   3 -
 meta/lib/oeqa/selftest/buildoptions.py             |  13 ---
 .../configure.in-Fix-string-argument-syntax.patch  |  28 -----
 .../directfb/directfb-examples_1.7.0.bb            |  21 ----
 meta/recipes-graphics/directfb/directfb.inc        |  80 --------------
 ...direct-Aboid-usng-VLAs-and-printf-formats.patch |  61 -----------
 .../directfb/directfb/bashism.patch                |  18 ----
 .../directfb/directfb/compar_fn_t.patch            |  62 -----------
 .../directfb/directfb/configurefix.patch           |  60 -----------
 .../fix-client-gfx_state-initialisation.patch      |  38 -------
 .../directfb/directfb/fusion.patch                 |  36 -------
 .../directfb/directfb/union-sigval.patch           |  19 ----
 .../directfb/use-PTHREAD_MUTEX_RECURSIVE.patch     | 116 ---------------------
 meta/recipes-graphics/directfb/directfb_1.7.7.bb   |   8 --
 .../recipes-graphics/images/core-image-directfb.bb |  13 ---
 .../packagegroups/packagegroup-core-directfb.bb    |  15 ---
 17 files changed, 1 insertion(+), 592 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
 delete mode 100644 meta/recipes-graphics/directfb/directfb.inc
 delete mode 100644 meta/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/bashism.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/compar_fn_t.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/configurefix.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fix-client-gfx_state-initialisation.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fusion.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/union-sigval.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/use-PTHREAD_MUTEX_RECURSIVE.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.7.7.bb
 delete mode 100644 meta/recipes-graphics/images/core-image-directfb.bb
 delete mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb

-- 
2.4.0


