Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tkc7Z-0002Bn-JI
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 15:56:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2012 06:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="235102398"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 06:42:03 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 16:41:58 +0200
Message-Id: <1355755320-2375-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] package upgrades
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
X-List-Received-Date: Mon, 17 Dec 2012 14:57:02 -0000

Hi,

This patchset contains 2 package upgrades.

Tests done:
 * xserver-xorg was compiled successfully for all architectures;
 * xf86-video-intel compiled successfully for x86 and x86-64;
 * functionality tests were done on an atom based ideapad netbook and in qemu;

Thanks,
Laurentiu

Laurentiu Palcu (2):
  xserver-xorg: upgrade to 1.13.1
  xf86-video-intel: upgrade to 2.20.16

 ...ntel_2.20.12.bb => xf86-video-intel_2.20.16.bb} |    4 ++--
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 .../mips64-compiler.patch                          |    0
 ...erver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} |    4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.20.12.bb => xf86-video-intel_2.20.16.bb} (86%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/mips64-compiler.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} (88%)

-- 
1.7.9.5



