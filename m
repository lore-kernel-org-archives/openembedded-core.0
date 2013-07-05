Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 158A46AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:12 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059366"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:11 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:17 +0300
Message-Id: <cover.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/10] Package upgrades
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:12 -0000

Tested on core-image-sato on all architectures (pcc, x86, x86-64, ppc, arm)

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (10):
  libassuan: Updated from 2.1.0 to 2.1.1
  augeas: Update from 1.0.0 to 1.1.0
  libxvmc: Update from 1.0.7 to 1.0.8
  libxi: Update from 1.7.1 to 1.7.2
  libsoup-2.4: Updated from 2.42.1 to 2.43.2
  libgpg-error: Updated from 1.11 to 1.12
  libxrender: Updated from 0.9.7 to 0.9.8
  libxv: Updated from 1.0.8 to 1.0.9
  freetype: Updated from 2.4.12 to 2.5.0
  ethtool: Updated from 3.9 to 3.10

 meta/recipes-extended/augeas/augeas_1.0.0.bb                     |    6 ------
 meta/recipes-extended/augeas/augeas_1.1.0.bb                     |    6 ++++++
 .../recipes-extended/ethtool/{ethtool_3.9.bb => ethtool_3.10.bb} |    4 ++--
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb}           |    6 ++----
 .../recipes-graphics/xorg-lib/{libxi_1.7.1.bb => libxi_1.7.2.bb} |    5 ++---
 .../xorg-lib/{libxrender_0.9.7.bb => libxrender_0.9.8.bb}        |    5 ++---
 .../recipes-graphics/xorg-lib/{libxv_1.0.8.bb => libxv_1.0.9.bb} |    6 ++----
 .../xorg-lib/{libxvmc_1.0.7.bb => libxvmc_1.0.8.bb}              |    5 ++---
 .../libassuan/{libassuan_2.1.0.bb => libassuan_2.1.1.bb}         |    4 ++--
 .../{libgpg-error-1.11 => libgpg-error-1.12}/pkgconfig.patch     |    0
 .../libgpg-error/{libgpg-error_1.11.bb => libgpg-error_1.12.bb}  |    5 ++---
 .../libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.2.bb}     |    4 ++--
 12 files changed, 24 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.0.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.1.0.bb
 rename meta/recipes-extended/ethtool/{ethtool_3.9.bb => ethtool_3.10.bb} (79%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.1.bb => libxi_1.7.2.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.7.bb => libxrender_0.9.8.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.8.bb => libxv_1.0.9.bb} (76%)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.7.bb => libxvmc_1.0.8.bb} (75%)
 rename meta/recipes-support/libassuan/{libassuan_2.1.0.bb => libassuan_2.1.1.bb} (83%)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.11 => libgpg-error-1.12}/pkgconfig.patch (100%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.11.bb => libgpg-error_1.12.bb} (85%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.42.1.bb => libsoup-2.4_2.43.2.bb} (85%)

-- 
1.7.10.4


