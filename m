Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0G-0000H4-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2011 06:12:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="96985601"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2011 06:12:31 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:26 +0800
Message-Id: <cover.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/8] [Dexuan]: upgrades for 7 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 14:19:16 -0000

The following changes since commit 00d121aad3a4263bc0e3a004a3a479e6352e063d:

  clutter-box2d: drop unbuildable clutter-box2d-1.6_0.10.0 (2011-11-30 22:06:00 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (8):
  pixman: upgrade from 0.22.0 to the latest stable 0.24.0
  libxrandr: upgrade from 1.3.1 to the latest version 1.3.2
  lzo: upgrade from 2.05 to the latest version 2.06
  libxfont: upgrade from 1.4.3 to 1.4.4
  libxcursor: upgrade from 1.1.11 to 1.1.12
  xcb-util: upgrade from 0.3.6 to 0.3.8
  inputproto: upgrade from 2.0.2 to the latest stable 2.0.99.1
  distro_tracking_fields.inc: update the info

 .../conf/distro/include/distro_tracking_fields.inc |   66 ++++++++++---------
 meta/recipes-graphics/xcb/xcb-util_0.3.6.bb        |   18 -----
 meta/recipes-graphics/xcb/xcb-util_0.3.8.bb        |    9 +++
 .../{libxcursor_1.1.11.bb => libxcursor_1.1.12.bb} |    4 +-
 .../{libxfont_1.4.3.bb => libxfont_1.4.4.bb}       |    8 +--
 .../{libxrandr_1.3.1.bb => libxrandr_1.3.2.bb}     |    6 +-
 .../{pixman_0.22.0.bb => pixman_0.24.0.bb}         |    4 +-
 ...{inputproto_2.0.2.bb => inputproto_2.0.99.1.bb} |    4 +-
 .../lzo/{lzo-2.05 => lzo-2.06}/acinclude.m4        |    0
 .../lzo/{lzo-2.05 => lzo-2.06}/autoconf.patch      |    9 +++-
 .../lzo/{lzo_2.05.bb => lzo_2.06.bb}               |    4 +-
 11 files changed, 66 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
 create mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.11.bb => libxcursor_1.1.12.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.3.bb => libxfont_1.4.4.bb} (62%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.1.bb => libxrandr_1.3.2.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.22.0.bb => pixman_0.24.0.bb} (83%)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.0.2.bb => inputproto_2.0.99.1.bb} (78%)
 rename meta/recipes-support/lzo/{lzo-2.05 => lzo-2.06}/acinclude.m4 (100%)
 rename meta/recipes-support/lzo/{lzo-2.05 => lzo-2.06}/autoconf.patch (79%)
 rename meta/recipes-support/lzo/{lzo_2.05.bb => lzo_2.06.bb} (81%)

-- 
1.7.6



