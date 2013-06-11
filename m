Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E35836A9BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680025"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:38 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:27 +0300
Message-Id: <cover.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] Package upgrades
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:38 -0000

Tests done:
 * each package was build tested locally for all architectures (where applicable);
 * ran autobuilder nigthlies for (x86, x86-64, ppc, arm, mips). All completed
   successfully;
 * no major changes spotted in buildhistory;
 * basic functionality tests done on an ideapad s10-3t netbook with a
   core-image-sato image;

Thanks,
Laurentiu

The following changes since commit 96b144a25598090b1e58eb5e33f216b5bfef7595:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:37 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (7):
  xf86-input-synaptics: upgrade to 1.7.1
  xkeyboard-config: upgrade to 2.9
  xdpyinfo: upgrade to 1.3.1
  xf86-video-intel: upgrade to 2.21.9
  xwininfo: upgrade to 1.1.3
  libdrm: upgrade to 2.4.45
  libxt: upgrade to 1.1.4

 .../drm/{libdrm_2.4.44.bb => libdrm_2.4.45.bb}     |    4 ++--
 .../{xdpyinfo_1.3.0.bb => xdpyinfo_1.3.1.bb}       |    5 ++---
 .../{xwininfo_1.1.2.bb => xwininfo_1.1.3.bb}       |    5 ++---
 ...tics_1.7.0.bb => xf86-input-synaptics_1.7.1.bb} |    4 ++--
 ...-intel_2.21.6.bb => xf86-video-intel_2.21.9.bb} |    4 ++--
 .../xorg-lib/{libxt_1.1.3.bb => libxt_1.1.4.bb}    |    7 +++----
 ...board-config_2.8.bb => xkeyboard-config_2.9.bb} |    5 ++---
 7 files changed, 15 insertions(+), 19 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.44.bb => libdrm_2.4.45.bb} (46%)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.0.bb => xdpyinfo_1.3.1.bb} (80%)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.2.bb => xwininfo_1.1.3.bb} (69%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.0.bb => xf86-input-synaptics_1.7.1.bb} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.6.bb => xf86-video-intel_2.21.9.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.3.bb => libxt_1.1.4.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.8.bb => xkeyboard-config_2.9.bb} (87%)

-- 
1.7.9.5


