Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCtGh-0001jV-73
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 15:55:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Mar 2013 06:38:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="209063714"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2013 06:38:26 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 16:38:22 +0200
Message-Id: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Rename mesa-dri recipe to mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 14:55:08 -0000

Hi all,

This patchset will rename the "mesa-dri" recipe to "mesa" and will replace
all occurences to mesa-dri in recipes/configs.

The changes and the upgrade path were tested on qemux86 and on an atom-pc
ideapad s10-3t. No issues observed.

For more info, as to why this was needed, go here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3385

Thanks,
Laurentiu

Laurentiu Palcu (2):
  mesa: rename mesa-dri recipe to just mesa
  Replace references to mesa-dri with mesa in all files

 meta-yocto-bsp/conf/machine/atom-pc.conf           |    2 +-
 meta/conf/distro/include/default-providers.inc     |    6 +++---
 meta/conf/machine/include/ia32-base.inc            |    4 ++--
 meta/conf/machine/include/qemu.inc                 |    8 ++++----
 meta/conf/machine/qemux86-64.conf                  |    8 ++++----
 meta/conf/machine/qemux86.conf                     |    8 ++++----
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    4 ++--
 .../mesa/{mesa-dri.inc => mesa.inc}                |   11 ++++++++---
 .../mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb}      |    2 +-
 .../mesa/{mesa-dri_git.bb => mesa_git.bb}          |    4 ++--
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 .../arch/i386/conf/machine/{{=machine}}.conf       |    2 +-
 .../arch/qemu/conf/machine/{{=machine}}.conf       |    8 ++++----
 15 files changed, 41 insertions(+), 36 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-dri.inc => mesa.inc} (65%)
 rename meta/recipes-graphics/mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb} (75%)
 rename meta/recipes-graphics/mesa/{mesa-dri_git.bb => mesa_git.bb} (39%)

-- 
1.7.9.5



