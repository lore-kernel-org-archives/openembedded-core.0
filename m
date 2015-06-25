Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 36AF36AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:18:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jun 2015 04:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,675,1427785200"; d="scan'208";a="750211086"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2015 04:18:58 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:19:30 +0300
Message-Id: <cover.1435228589.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Point upgrades (X, mesa, freetype)
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
X-List-Received-Date: Thu, 25 Jun 2015 11:18:59 -0000

The following changes since commit 18e902b2dc17746af453869bcc1fba4dbae7c94f:

  wpa-supplicant: Revert "Make SystemD D-Bus config conditional" (2015-06-24 14:04:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades

Jussi Kukkonen (4):
  freetype: Upgrade 2.5.5 -> 2.6
  mesa: Upgrade 10.5.6 -> 10.5.8
  xorg-xserver: Upgrade 1.17.1 -> 1.17.2
  xf86-video-vesa: Upgrade 2.3.3 -> 2.3.4

 .../{freetype_2.5.5.bb => freetype_2.6.bb}         |  4 +-
 .../mesa/{mesa-gl_10.5.6.bb => mesa-gl_10.5.8.bb}  |  0
 .../mesa/{mesa_10.5.6.bb => mesa_10.5.8.bb}        |  4 +-
 ...ideo-vesa_2.3.3.bb => xf86-video-vesa_2.3.4.bb} |  4 +-
 ...Fix-error-check-for-pci_device_map_legacy.patch | 50 ----------------------
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch | 48 ---------------------
 .../fix_open_max_preprocessor_error.patch          | 15 -------
 .../xserver-xorg/xorg-CVE-2013-6424.patch          | 31 --------------
 .../xorg-xserver/xserver-xorg/xtrans.patch         | 38 ----------------
 ...erver-xorg_1.17.1.bb => xserver-xorg_1.17.2.bb} | 13 ++----
 10 files changed, 9 insertions(+), 198 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype_2.5.5.bb => freetype_2.6.bb} (92%)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.5.6.bb => mesa-gl_10.5.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.5.6.bb => mesa_10.5.8.bb} (77%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.3.bb => xf86-video-vesa_2.3.4.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.1.bb => xserver-xorg_1.17.2.bb} (62%)

-- 
2.1.4


