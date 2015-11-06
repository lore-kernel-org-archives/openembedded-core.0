Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DAD7C76E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 15:28:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 06 Nov 2015 07:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="595303965"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2015 07:28:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 15:28:21 +0000
Message-Id: <cover.1446823542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/11] Fix missing SUMMARY values
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
X-List-Received-Date: Fri, 06 Nov 2015 15:28:46 -0000

One of my pet peeves is where SUMMARY isn't set properly in a recipe;
we use these in a few places now (packages, the OE layer index,
Toaster, etc.).


The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/summaries
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/summaries

Paul Eggleton (11):
  gptfdisk: add SUMMARY
  libunwind: add SUMMARY
  stress: add SUMMARY
  python-nose: add SUMMARY
  linux-yocto.inc: set SUMMARY instead of DESCRIPTION
  tzcode-native: set SUMMARY instead of DESCRIPTION
  alsa-plugins: set SUMMARY instead of DESCRIPTION
  swig: set SUMMARY instead of DESCRIPTION
  mmc-utils: set SUMMARY instead of DESCRIPTION
  gstreamer1.0-meta-base: set SUMMARY instead of DESCRIPTION
  texinfo-dummy-native: set SUMMARY instead of DESCRIPTION

 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb                      | 1 +
 meta/recipes-devtools/mmc/mmc-utils_git.bb                         | 2 +-
 meta/recipes-devtools/python/python-nose_1.3.6.bb                  | 1 +
 meta/recipes-devtools/swig/swig.inc                                | 2 +-
 meta/recipes-extended/stress/stress_1.0.4.bb                       | 1 +
 meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb | 2 +-
 meta/recipes-extended/tzcode/tzcode-native_2015g.bb                | 2 +-
 meta/recipes-kernel/linux/linux-yocto.inc                          | 2 +-
 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb        | 2 +-
 meta/recipes-support/libunwind/libunwind.inc                       | 1 +
 11 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.1.0


