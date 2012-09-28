Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THVyw-0003Iz-CA
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 10:31:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2012 01:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,501,1344236400"; d="scan'208";a="199197132"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.173])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2012 01:18:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2012 01:18:39 -0700
Message-Id: <cover.1348820169.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED REQUEST 00/16]
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
X-List-Received-Date: Fri, 28 Sep 2012 08:31:34 -0000

Richard,

This is a set of changes (close to final) for rc3 of 1.3.

I have built this against the AB core, there is the issue with
both Multi-Lib and X32 from yesterday's Perl change, that still
exists, otherwise a clean build.

Please Cherry-pick as you see appropriate.

I will be out until Monday Morning (with no email access).

Sau!


The following changes since commit f95a9e2c292a1551861220270838cf1eaaba85b9:

  Revert "autotools.bbclass: using relative paths for acpaths" (2012-09-27 17:57:46 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  eglibc: Fix for dynamic linker broken offset

Bogdan Marinescu (1):
  sanity: Added explicit network error status in SanityCheckFailed
    event

Constantin Musca (1):
  sanity.bbclass: bblayers.conf should be updated automatically

Damien Lespiau (2):
  initrd: Spawn an emergency shell when something goes wrong
  initramfs: Make mkdir not fail

Elizabeth Flanagan (3):
  license.bbclass: Variable standardization
  bitbake.conf: parse license config
  license.conf/bbclass: Move globals to license.conf

Otavio Salvador (2):
  cogl: Add a missing depends on libxdamage
  xserver-xorg: Use rdepends to ensure xserver-xorg-module-exa match
    version

Paul Eggleton (1):
  gst-plugins-good: make pulseaudio support dependent on
    DISTRO_FEATURES

Richard Purdie (2):
  tcl: Fix dangerous do_install staging references
  sstate: Relax the duplicate file whitelist for now

Ross Burton (1):
  xserver-xorg: merge version-specific .inc into .bb

Scott Garman (2):
  oe-find-native-sysroot: show bitbake errors to user
  runqemu-internal: don't append an empty element to PATH

 meta/classes/license.bbclass                       |   67 +----------------
 meta/classes/sanity.bbclass                        |   81 ++++++++++++++++++--
 meta/classes/sstate.bbclass                        |    6 +-
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/licenses.conf                            |   64 +++++++++++++++
 .../eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch      |   56 ++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    3 +-
 meta/recipes-core/initrdscripts/files/init-live.sh |   17 ++++-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    6 +-
 meta/recipes-graphics/clutter/cogl.inc             |    2 +-
 meta/recipes-graphics/clutter/cogl_1.8.2.bb        |    2 +-
 meta/recipes-graphics/clutter/cogl_git.bb          |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |   11 ---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 .../xorg-xserver/xserver-xorg_1.11.2.bb            |   13 +++-
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    8 ++-
 scripts/oe-find-native-sysroot                     |   29 +++++---
 scripts/runqemu-internal                           |    6 +-
 18 files changed, 265 insertions(+), 110 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-R_ARM_TLS_DTPOFF32.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc

-- 
1.7.7.6



