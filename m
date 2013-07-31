Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EF09460593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:56:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="379484628"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2013 06:56:07 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:58:42 +0300
Message-Id: <cover.1375278766.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Wed, 31 Jul 2013 13:56:09 -0000

* apt
Tested on core-image-minimal on all architectures
makerace.patch: adapted to the new version

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (2):
  freetype: Upgrade from 2.4.12 to 2.5.0
  apt: Upgrade from 0.9.8.2 to 0.9.9.4

 .../disable-configure-in-makefile.patch                    |    0
 .../fix-gcc-4.6-null-not-defined.patch                     |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/makerace.patch        |   12 ++++++------
 .../{apt-0.9.8.2 => apt-0.9.9.4}/no-ko-translation.patch   |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-nls-dpkg.patch     |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/noconfigure.patch     |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/nodoc.patch           |    0
 .../{apt-0.9.8.2 => apt-0.9.9.4}/truncate-filename.patch   |    0
 .../apt/{apt-0.9.8.2 => apt-0.9.9.4}/use-host.patch        |    0
 .../apt/{apt-native_0.9.8.2.bb => apt-native_0.9.9.4.bb}   |    0
 .../apt/{apt_0.9.8.2.bb => apt_0.9.9.4.bb}                 |    4 ++--
 .../freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb}     |    9 +++------
 12 files changed, 11 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/makerace.patch (66%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.8.2 => apt-0.9.9.4}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.8.2.bb => apt-native_0.9.9.4.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.8.2.bb => apt_0.9.9.4.bb} (74%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.12.bb => freetype_2.5.0.bb} (90%)

-- 
1.7.10.4


