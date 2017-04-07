Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5D62977D20
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 06:09:28 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 06 Apr 2017 23:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,163,1488873600"; d="scan'208";a="85788776"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2017 23:09:30 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9DA256A4080;
	Thu,  6 Apr 2017 23:09:20 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 09:08:53 +0300
Message-Id: <cover.1491483222.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Use fixed DISTRO_FEATURES for native
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
X-List-Received-Date: Fri, 07 Apr 2017 06:09:29 -0000

Avoid signifant native task churn when DISTRO_FEATURES is changed
by defining a fixed DISTRO_FEATURES value (default is "") for native
recipes.

The xorg changes are all removals of x11 requirements (that were not
real) from recipes that have native versions.

I added a configuration default in bitbake.conf, let me know if this
is not a good place.

This seems to work fine (tested multiple different images) but I am
not really sure how to test it further... Suggestions are welcome, as
are results from autobuilder. 


Thanks,
  Jussi



The following changes since commit 633ad6c9f436f5d2b6ee1a005b697661a054a394:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/native-distro-features
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/native-distro-features

Jussi Kukkonen (4):
  mkfontdir: Remove x11 requirement
  mkfontscale: Remove x11 requirement
  xorg-font-common.inc: Remove x11 requirement
  native.bbclass: Use fixed DISTRO_FEATURES

 meta/classes/native.bbclass                          | 12 ++++++++----
 meta/conf/bitbake.conf                               |  2 ++
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb    |  4 ++++
 meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb  |  3 +++
 meta/recipes-graphics/xorg-font/xorg-font-common.inc |  3 ---
 5 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.1.4


