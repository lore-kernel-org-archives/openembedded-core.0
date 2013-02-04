Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2EAD-0002kH-G1
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 06:00:20 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2013 20:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,596,1355126400"; d="scan'208";a="280497692"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 03 Feb 2013 20:44:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Feb 2013 20:44:27 -0800
Message-Id: <cover.1359952930.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/20] Kernel and Clean-up
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
X-List-Received-Date: Mon, 04 Feb 2013 05:00:21 -0000



Richard,

Some kernel updates, along with clean up from Ross. A couple of
package updates from folks and a bitbake.conf tweak from Robert.

I pulled in Peter's package.bbclass change, not sure if you had
seen that or factored it into your changes also.


Thanks

Sau!

The following changes since commit 82602d2c55f5d233bd8351e95a84a65b792786e5:

  qt4: Add space for _appends (2013-02-01 22:49:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  pax-utils : upgrade to 0.6

Bogdan Marinescu (1):
  distcc: updated to version 3.1

Bruce Ashfield (5):
  guilt: remove GIT_EXEC_BASE export
  kernel-yocto: make configuration audit details debug only
  kernel-yocto: fix .scc and .cfg matching
  kernel-yocto: allow multiple / shared kernel feature directories
  kernel-yocto/linux-yocto-custom: support low bandwidth options

Jeremy Stashluk (1):
  gst-plugins-gl: add package recipe

Martin Jansa (1):
  console-tools, kbd: add RREPLACES/RPROVIDES/RCONFLICTS combo between
    PN-dbg

Peter Seebach (2):
  pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3
  package.bbclass: Allow per-package SKIP_FILEDEPS

Radu Moisan (1):
  polkit: Enable systemd support

Robert Yang (2):
  bitbake.conf: add STAMPS_DIR for constructing STAMP
  bitbake-whatchanged: print what is about to happen

Ross Burton (6):
  orinoco-conf: remove
  packagegroup-core-x11-sato: remove matchbox-stroke
  matchbox-stroke: remove
  packagegroup-core-tools-testapps: remove clutter-box2d
  clutter-box2d: remove
  scripts/wipe-sysroot: add script to safely wipe the sysroots

 meta/classes/kernel-yocto.bbclass                  |   77 +-
 meta/classes/package.bbclass                       |    2 +
 meta/conf/bitbake.conf                             |    5 +-
 meta/recipes-bsp/orinoco/files/COPYING.patch       |  346 --
 meta/recipes-bsp/orinoco/files/orinoco_cs.conf     |    2 -
 meta/recipes-bsp/orinoco/files/spectrum_fw.h       | 4569 --------------------
 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb       |   16 -
 .../console-tools/console-tools_0.3.2.bb           |    7 +
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    3 +
 .../packagegroup-core-tools-testapps.bb            |    1 -
 .../distcc/{distcc_2.18.3.bb => distcc_3.1.bb}     |   19 +-
 .../distcc/files/distcc-avahi.patch                | 1738 --------
 .../distcc/files/makefile-param-order.patch        |   20 -
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    3 +-
 .../{pax-utils_0.2.2.bb => pax-utils_0.6.bb}       |    7 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |    8 +-
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb       |    8 -
 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb       |    8 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |    7 +-
 meta/recipes-graphics/clutter/clutter-box2d.inc    |   15 -
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |   14 -
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../gstreamer/gst-plugins-gl_0.10.3.bb             |   11 +
 .../matchbox-stroke/files/configure_fix.patch      |   15 -
 .../matchbox-stroke/files/single-instance.patch    |   20 -
 .../matchbox-stroke/matchbox-stroke_git.bb         |   25 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |    1 -
 scripts/bitbake-whatchanged                        |  339 ++
 scripts/oe-buildenv-internal                       |    6 +-
 scripts/wipe-sysroot                               |   34 +
 31 files changed, 498 insertions(+), 6834 deletions(-)
 delete mode 100644 meta/recipes-bsp/orinoco/files/COPYING.patch
 delete mode 100644 meta/recipes-bsp/orinoco/files/orinoco_cs.conf
 delete mode 100644 meta/recipes-bsp/orinoco/files/spectrum_fw.h
 delete mode 100644 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb
 rename meta/recipes-devtools/distcc/{distcc_2.18.3.bb => distcc_3.1.bb} (79%)
 delete mode 100644 meta/recipes-devtools/distcc/files/distcc-avahi.patch
 delete mode 100644 meta/recipes-devtools/distcc/files/makefile-param-order.patch
 rename meta/recipes-devtools/pax-utils/{pax-utils_0.2.2.bb => pax-utils_0.6.bb} (81%)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d_git.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/single-instance.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
 create mode 100755 scripts/bitbake-whatchanged
 create mode 100755 scripts/wipe-sysroot

-- 
1.8.0.2



