Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UHzal-0000C1-Eo
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 17:40:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2013 09:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,872,1355126400"; d="scan'208";a="281731366"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2013 09:23:58 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 18:23:55 +0200
Message-Id: <1363710237-31628-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v3 0/1] Rename mesa-dri recipe to mesa
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
X-List-Received-Date: Tue, 19 Mar 2013 16:40:56 -0000

Changes in v3:
 * rebased;
 * removed another 2 files that didn't belong to oe-core;

Changes in v2:
 * squashed the commits into a single one to be easily bisectable;
 * removed FILESEXTRAPATHS references;
 * removed a file that had to go to poky ML;

Thanks,
Laurentiu

Hi all,

This patchset will rename the "mesa-dri" recipe to "mesa" and will replace
all occurences to mesa-dri in recipes/configs.

The changes and the upgrade path were tested on qemux86 and on an atom-pc
ideapad s10-3t. No issues observed.

For more info, as to why this was needed, go here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3385

Thanks,
Laurentiu

Laurentiu Palcu (1):
  mesa: rename mesa-dri recipe to just mesa

 meta/conf/distro/include/default-providers.inc     |    6 ++--
 meta/conf/machine/include/ia32-base.inc            |    4 +--
 meta/conf/machine/include/qemu.inc                 |    8 ++---
 meta/conf/machine/qemux86-64.conf                  |    8 ++---
 meta/conf/machine/qemux86.conf                     |    8 ++---
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    5 +--
 meta/recipes-graphics/mesa/mesa-dri.inc            |   28 -----------------
 meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb       |    4 ---
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    8 -----
 meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
 meta/recipes-graphics/mesa/mesa.inc                |   33 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 +++
 meta/recipes-graphics/mesa/mesa_git.bb             |    7 +++++
 meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 ++--
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 16 files changed, 67 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_git.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_git.bb

-- 
1.7.9.5



