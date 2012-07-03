Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Slx77-00036R-9g
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:01:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 23:50:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118373924"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2012 23:50:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 09:50:17 +0300
Message-Id: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/10] package upgrades, about 10
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
X-List-Received-Date: Tue, 03 Jul 2012 07:01:33 -0000

Hi,

This patchset upgrades the packages listed below. All packages were successfully
built for all architectures with the exception of xf86-input-vmmouse which only supports
x86 and x86-64 architectures. Basic sanity tests were also performed on an an atom based
Lenovo S10-3t. No obvious issues spotted.

Thanks,
Laurentiu

Laurentiu Palcu (10):
  xf86-input-vmmouse: upgrade to 12.9.0
  xf86-input-synaptics: upgrade to 1.6.2
  xcb-util: upgrade to 0.3.9
  libdrm: upgrade to 2.4.35
  ethtool: upgrade to 3.4.1
  libxft: upgrade to 2.3.1
  xcb-util-wm: upgrade to 0.3.9
  xcb-util-image: upgrade to 0.3.9
  xcb-util-keysyms: upgrade to 0.3.9
  lighttpd: upgrade to 1.4.31

 .../ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb}   |    4 ++--
 .../{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb}     |    6 +++---
 .../drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb}     |    4 ++--
 ...util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} |    4 ++--
 ...-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} |    4 ++--
 .../{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} |    4 ++--
 .../xcb/{xcb-util_0.3.8.bb => xcb-util_0.3.9.bb}   |    4 ++--
 ...tics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} |    4 ++--
 ...ouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} |    4 ++--
 .../xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb}  |    4 ++--
 10 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.2.bb => ethtool_3.4.1.bb} (79%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.30.bb => lighttpd_1.4.31.bb} (92%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.34.bb => libdrm_2.4.35.bb} (62%)
 rename meta/recipes-graphics/xcb/{xcb-util-image_0.3.8.bb => xcb-util-image_0.3.9.bb} (66%)
 rename meta/recipes-graphics/xcb/{xcb-util-keysyms_0.3.8.bb => xcb-util-keysyms_0.3.9.bb} (52%)
 rename meta/recipes-graphics/xcb/{xcb-util-wm_0.3.8.bb => xcb-util-wm_0.3.9.bb} (74%)
 rename meta/recipes-graphics/xcb/{xcb-util_0.3.8.bb => xcb-util_0.3.9.bb} (62%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.6.1.bb => xf86-input-synaptics_1.6.2.bb} (81%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.8.0.bb => xf86-input-vmmouse_12.9.0.bb} (75%)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.0.bb => libxft_2.3.1.bb} (88%)

-- 
1.7.9.5



