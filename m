Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EE3A06FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 15:41:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 07:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,317,1449561600"; d="scan'208";a="893851750"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2016 07:40:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:37:31 +0200
Message-Id: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 00/12] Package version updates and version check fixes
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
X-List-Received-Date: Tue, 19 Jan 2016 15:41:20 -0000

I did a quick review of upstream version checks, and fixed a few recipes
where it wasn't working properly. Also bundled version updates for recipes
where I'm the maintainer or there is no maintainer and the update is trivial.

The following changes since commit 839fb1893546ad58a1f5475a9e852b81afb056d6:

  e2fsprogs: fix PV (2016-01-19 08:53:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (12):
  nss: update to 3.21
  bootchart2: update to 0.14.8
  btrfs-tools: update to 4.4
  build-appliance-image: bump version to 14.0
  e2fsprogs: fix upstream version check
  libsolv: fix upstream version check
  ncurses: fix upstream version check
  pbzip2: update to 1.1.13
  sysstat: fix upstream version check
  gnutls: update to 3.4.8
  libical: fix upstream version check
  libjpeg-turbo: fix upstream version check (sort of)

 ...age_12.0.1.bb => build-appliance-image_14.0.bb} |  0
 meta/recipes-core/ncurses/ncurses_6.0.bb           |  1 +
 .../{bootchart2_0.14.7.bb => bootchart2_0.14.8.bb} |  2 +-
 .../{btrfs-tools_4.3.1.bb => btrfs-tools_4.4.bb}   |  2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb   |  1 +
 meta/recipes-extended/libsolv/libsolv_git.bb       |  1 +
 .../pbzip2/{pbzip2_1.1.12.bb => pbzip2_1.1.13.bb}  |  4 ++--
 meta/recipes-extended/sysstat/sysstat.inc          |  1 +
 .../jpeg/libjpeg-turbo_8d+1.4.2.bb                 |  2 ++
 .../gnutls/{gnutls_3.4.7.bb => gnutls_3.4.8.bb}    |  4 ++--
 meta/recipes-support/libical/libical_1.0.1.bb      |  1 +
 .../0001-Fix-build-failure-on-opensuse-13.1.patch  | 27 ++++++++++++++++++++++
 .../nss/{nss_3.19.2.bb => nss_3.21.bb}             | 11 ++++++---
 13 files changed, 48 insertions(+), 9 deletions(-)
 rename meta/recipes-core/images/{build-appliance-image_12.0.1.bb => build-appliance-image_14.0.bb} (100%)
 rename meta/recipes-devtools/bootchart2/{bootchart2_0.14.7.bb => bootchart2_0.14.8.bb} (99%)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.3.1.bb => btrfs-tools_4.4.bb} (94%)
 rename meta/recipes-extended/pbzip2/{pbzip2_1.1.12.bb => pbzip2_1.1.13.bb} (86%)
 rename meta/recipes-support/gnutls/{gnutls_3.4.7.bb => gnutls_3.4.8.bb} (60%)
 create mode 100644 meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch
 rename meta/recipes-support/nss/{nss_3.19.2.bb => nss_3.21.bb} (95%)

-- 
2.6.4


