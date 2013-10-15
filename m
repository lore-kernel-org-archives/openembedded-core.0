Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C635C6CABC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 12:46:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2013 05:46:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,498,1378882800"; d="scan'208";a="417091158"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2013 05:46:11 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:45:57 +0300
Message-Id: <cover.1381841061.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Tue, 15 Oct 2013 12:46:11 -0000

Basic functionality tests done with a core-image-sato image for qemux86 and a
lenovo s10-3t. Also, buildhistory didn't show major changes.

The patchset was build tested on a local autobuilder too, for all major architectures, on
top of the following commit: faf8f8660fae26a14578738b642fdeb08bcb9d54.

Thanks,
Laurentiu

The following changes since commit 2b5bac02196b8bd30d223d508f5f7d4300889fd7:

  poky: Update Version post release (2013-10-14 16:59:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (10):
  byacc: upgrade to 20130925
  xkeyboard-config: upgrade to 2.10.1
  xauth: upgrade to 1.0.8
  xf86-input-evdev: upgrade to 2.8.2
  libdrm: upgrade to 2.4.47
  xset: upgrade to 1.2.3
  xf86-video-intel: upgrade to 2.21.15
  xinput: upgrade to 1.6.1
  xprop: upgrade to 1.2.2
  xf86-video-fbdev: upgrade to 0.4.4

 .../byacc/{byacc_20130304.bb => byacc_20130925.bb} |    4 +--
 .../drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb}     |    4 +--
 .../xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb}    |    5 ++-
 .../xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb}  |    5 ++-
 .../xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb}    |    5 ++-
 .../xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb}      |    5 ++-
 ...ut-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} |    4 +--
 .../xf86-video-fbdev/Remove-mibstore.h.patch       |   35 --------------------
 ...eo-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} |    6 ++--
 ...ntel_2.21.13.bb => xf86-video-intel_2.21.15.bb} |    4 +--
 ...rd-config_2.9.bb => xkeyboard-config_2.10.1.bb} |    4 +--
 11 files changed, 20 insertions(+), 61 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20130304.bb => byacc_20130925.bb} (74%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.46.bb => libdrm_2.4.47.bb} (46%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.7.bb => xauth_1.0.8.bb} (65%)
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.0.bb => xinput_1.6.1.bb} (64%)
 rename meta/recipes-graphics/xorg-app/{xprop_1.2.1.bb => xprop_1.2.2.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.2.bb => xset_1.2.3.bb} (74%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.1.bb => xf86-input-evdev_2.8.2.bb} (83%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-fbdev_0.4.3.bb => xf86-video-fbdev_0.4.4.bb} (44%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.13.bb => xf86-video-intel_2.21.15.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.9.bb => xkeyboard-config_2.10.1.bb} (87%)

-- 
1.7.9.5


