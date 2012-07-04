Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SmUJu-00056y-48
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 20:28:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2012 11:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164055177"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 11:17:52 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 21:17:31 +0300
Message-Id: <cover.1341425229.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/8] package upgrades
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
X-List-Received-Date: Wed, 04 Jul 2012 18:28:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all.

This is another set of package upgrades. All packages were compiled successfully
for all architectures. Basic sanity tests for DirectFB were performed using
core-image-gtk-directfb on qemux86. The rest of the packages were tested with
core-image-sato on qemux86.

Thanks,
Laurentiu

The following changes since commit ee89e38d478b5f9e13dd87c9333f9c4d56d51e3e:

  prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR". (2012-07-04 17:40:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (8):
  directfb: upgrade to 1.6.1
  directfb-examples: upgrade to 1.6.0
  libx11: upgrade to 1.5.0
  libx11-trim: upgrade to 1.5.0
  libx11-diet: upgrade to 1.5.0
  libxi: upgrade to 1.6.1
  xinput: upgrade to 1.6.0
  pixman: upgrade to 0.26.2

 ...xamples_1.5.3.bb => directfb-examples_1.6.0.bb} |    4 +-
 meta/recipes-graphics/directfb/directfb.inc        |    4 +-
 .../directfb/fix-compilation-with-zlib.patch       |   29 +++++
 ...se-ARM-assembler-for-atomic-operations-on.patch |   27 ----
 ...ibdirect-remove-include-of-linux-config.h.patch |   29 -----
 meta/recipes-graphics/directfb/directfb_1.5.3.bb   |   23 ----
 meta/recipes-graphics/directfb/directfb_1.6.1.bb   |   23 ++++
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |   14 --
 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb     |   15 +++
 ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 --------------------
 .../keysymdef_include.patch                        |    0
 .../makekeys_crosscompile.patch                    |    0
 .../x11_disable_makekeys.patch                     |   13 +-
 .../X18NCMSstubs.diff                              |    2 +-
 .../fix-disable-xlocale.diff                       |    0
 .../fix-utf8-wrong-define.patch                    |    0
 .../keysymdef_include.patch                        |    0
 .../x11_disable_makekeys.patch                     |   13 +-
 .../{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} |    4 +-
 .../keysymdef_include.patch                        |    0
 .../makekeys_crosscompile.patch                    |    0
 .../x11_disable_makekeys.patch                     |   20 +--
 .../{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} |    6 +-
 .../xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb}  |    7 +-
 .../xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb}    |    4 +-
 .../{pixman_0.25.2.bb => pixman_0.26.2.bb}         |    9 +-
 26 files changed, 114 insertions(+), 269 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb-examples_1.5.3.bb => directfb-examples_1.6.0.bb} (77%)
 create mode 100644 meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-Use-ARM-assembler-for-atomic-operations-on.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.5.3.bb
 create mode 100644 meta/recipes-graphics/directfb/directfb_1.6.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.6.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.4.4 => libx11-1.5.0}/x11_disable_makekeys.patch (74%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-disable-xlocale.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/fix-utf8-wrong-define.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-diet-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-diet-1.5.0}/x11_disable_makekeys.patch (74%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.4.4.bb => libx11-diet_1.5.0.bb} (86%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/keysymdef_include.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim-1.4.4 => libx11-trim-1.5.0}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.4.4 => libx11-trim-1.5.0}/x11_disable_makekeys.patch (62%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.4.4.bb => libx11-trim_1.5.0.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.4.4.bb => libx11_1.5.0.bb} (67%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.25.2.bb => pixman_0.26.2.bb} (75%)

-- 
1.7.9.5



