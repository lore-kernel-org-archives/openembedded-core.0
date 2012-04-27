Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SNdVe-00018d-EL
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:14:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Apr 2012 22:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134301052"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 26 Apr 2012 22:04:42 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Apr 2012 13:03:40 +0800
Message-Id: <cover.1335498445.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/7] Misc fixings for multilib
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
X-List-Received-Date: Fri, 27 Apr 2012 05:14:22 -0000

1. Added a package QA check function in multilib case. It checkes whether 
there is a package runtime dependency on packages with names not prefixed 
by $MLPREFIX.

2. Fixed a bunch of recipes to use $libdir and $base_libdir instead of the 
hard coded /usr/lib and /lib.

The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:
  Martin Jansa (1):
        bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib

Lianhao Lu (7):
  multilib.bbclass: Added multilib specific package QA.
  popt: Fixing pkgconfig file installation issue.
  avahi: not using hard coded libdir.
  pulseaudio: use base_libdir for udev rules.
  alsa-utils: use base_libdir for udev rules.
  xorg-app: Use ${libdir} for packaging.
  xf86-input-vmmouse: use base_libdir for udev rules.

 meta/classes/multilib.bbclass                      |   31 ++++++++++++++++++++
 meta/recipes-connectivity/avahi/avahi.inc          |    4 +-
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb  |    2 +-
 .../recipes-graphics/xorg-app/mkfontscale_1.1.0.bb |    2 +
 meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb    |    2 +-
 meta/recipes-graphics/xorg-app/xauth_1.0.6.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb   |    2 +-
 meta/recipes-graphics/xorg-app/xhost_1.0.4.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xinit_1.3.2.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb     |    2 +-
 meta/recipes-graphics/xorg-app/xkbcomp_1.2.3.bb    |    2 +
 meta/recipes-graphics/xorg-app/xmodmap_1.0.5.bb    |    2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |    4 +-
 meta/recipes-graphics/xorg-app/xprop_1.2.1.bb      |    2 +-
 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb     |    2 +-
 meta/recipes-graphics/xorg-app/xset_1.2.2.bb       |    2 +-
 meta/recipes-graphics/xorg-app/xvinfo_1.1.1.bb     |    1 +
 meta/recipes-graphics/xorg-app/xwininfo_1.1.2.bb   |    2 +-
 .../xorg-driver/xf86-input-vmmouse_12.8.0.bb       |    6 +++-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb  |    6 ++-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 meta/recipes-support/popt/popt/pkgconfig_fix.patch |   15 +++++++++
 meta/recipes-support/popt/popt_1.16.bb             |    6 ++-
 24 files changed, 82 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-support/popt/popt/pkgconfig_fix.patch



