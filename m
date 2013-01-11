Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TtjM4-0004Y7-GC
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 19:29:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2013 10:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,453,1355126400"; d="scan'208";a="272807062"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.194])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2013 10:14:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 10:14:07 -0800
Message-Id: <cover.1357927839.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/28] Automake patches & other fixes
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
X-List-Received-Date: Fri, 11 Jan 2013 18:29:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Another batch of automake related changes from Marko (Thanks Marko!)

Along with some other fixes and patches, I have again included the
cairo patch as I am not sure what your objection to it is.

Sau!

The following changes since commit 1e63a3b7b7915d40bb59976a02b9f53968997ed3:

  linux-libc-headers: fix headers install in long path name environments (2013-01-10 23:53:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  initscripts: remove finish.sh

Constantin Musca (1):
  gcc: add missing dependency (zlib)

Eric Bénard (1):
  gitignore: only ignore meta- directories

Felipe F. Tonello (1):
  connman: fixed init script so connman can runs over nfs

Hongxu Jia (2):
  qemu-native:add option march to BUILD_CFLAGS
  glib-2.0-native:add option march to BUILD_CFLAGS

Marko Lindqvist (17):
  libxdamage: update to upstream version 1.1.4
  coreutils: fix license segment md5sum boundary
  help2man: update to upstream version 1.40.13
  dbus-glib: replace obsolete automake macros with working ones
  tslib: replace obsolete automake macros with working ones
  makedepend: replace obsolete automake macros with working ones
  alsa-lib: replace obsolete automake macros with working ones
  python: replace obsolete automake macros with working ones
  libogg: replace obsolete automake macros with working ones
  libmad: replace obsolete automake macros with working ones
  libvorbis: replace obsolete automake macros with working ones
  opensp: replace obsolete automake macros with working ones
  gconf: replace obsolete automake macros with working ones
  startup-notification: replace obsolete automake macros with working
    ones
  gtk+: replace obsolete automake macros with working ones
  gmp: replace obsolete automake macros with working ones
  bluez4: replace obsolete automake macros with working ones

Martin Ertsaas (4):
  sanity: Make the required utilities more platform specific.
  sstate: Do not add the --no-run-if-empty arguement to xargs when on
    Darwin, as it is not supported.
  quilt: Remove non-gnu.patch, and added configure flags for darwin.
  quilt: Don't use BUILD_ROOT on darwin.

Noor Ahsan (1):
  cairo: Adds libxext in X11DEPENDS.

 .gitignore                                         |   4 +-
 meta/classes/sanity.bbclass                        |  10 +-
 meta/classes/sstate.bbclass                        |  10 +-
 .../bluez4-4.101/obsolete_automake_macros.patch    |  14 ++
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |   6 +-
 meta/recipes-connectivity/connman/connman/connman  |   6 +-
 meta/recipes-core/coreutils/coreutils_8.14.bb      |   2 +-
 .../dbus-glib-0.100/obsolete_automake_macros.patch |  15 ++
 meta/recipes-core/dbus/dbus-glib.inc               |   1 +
 meta/recipes-core/dbus/dbus-glib_0.100.bb          |   2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   7 +-
 .../initscripts/initscripts-1.0/finish.sh          |  14 --
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   7 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   4 +-
 ...native_1.38.2.bb => help2man-native_1.40.13.bb} |   6 +-
 .../opensp-1.5.2/obsolete_automake_macros.patch    |  15 ++
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |   6 +-
 .../obsolete_automake_macros.patch                 |  14 ++
 meta/recipes-devtools/python/python-dbus_1.1.1.bb  |   6 +-
 .../obsolete_automake_macros.patch                 |  23 +++
 .../python/python-pygobject_2.27.91.bb             |   6 +-
 meta/recipes-devtools/qemu/qemu.inc                |   5 +
 meta/recipes-devtools/quilt/quilt-0.60.inc         |   9 +-
 meta/recipes-devtools/quilt/quilt-native.inc       |   1 -
 meta/recipes-devtools/quilt/quilt/non-gnu.patch    | 225 ---------------------
 .../gconf-3.2.5/obsolete_automake_macros.patch     |  14 ++
 meta/recipes-gnome/gnome/gconf_3.2.5.bb            |   6 +-
 .../gtk+-2.24.14/obsolete_automake_macros.patch    |  23 +++
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |   1 +
 meta/recipes-graphics/cairo/cairo.inc              |   6 +-
 .../obsolete_automake_macros.patch                 |  15 ++
 .../startup-notification_0.12.bb                   |   4 +-
 .../tslib/tslib/obsolete_automake_macros.patch     |  15 ++
 meta/recipes-graphics/tslib/tslib_1.0.bb           |   6 +-
 .../{libxdamage_1.1.3.bb => libxdamage_1.1.4.bb}   |   6 +-
 .../obsolete_automake_macros.patch                 |  15 ++
 .../recipes-graphics/xorg-util/makedepend_1.0.4.bb |   4 +-
 .../alsa-lib-1.0.25/obsolete_automake_macros.patch |  15 ++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |   6 +-
 .../libmad/libmad/obsolete_automake_macros.patch   |  14 ++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |   6 +-
 .../libogg-1.3.0/obsolete_automake_macros.patch    |  14 ++
 meta/recipes-multimedia/libogg/libogg_1.3.0.bb     |   6 +-
 .../libvorbis-1.3.3/obsolete_automake_macros.patch |  15 ++
 .../libvorbis/libvorbis_1.3.3.bb                   |   6 +-
 .../gmp/gmp-5.1.0/obsolete_automake_macros.patch   |  13 ++
 meta/recipes-support/gmp/gmp_5.1.0.bb              |   3 +
 47 files changed, 341 insertions(+), 290 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-core/dbus/dbus-glib-0.100/obsolete_automake_macros.patch
 delete mode 100755 meta/recipes-core/initscripts/initscripts-1.0/finish.sh
 rename meta/recipes-devtools/help2man/{help2man-native_1.38.2.bb => help2man-native_1.40.13.bb} (78%)
 create mode 100644 meta/recipes-devtools/opensp/opensp-1.5.2/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt/non-gnu.patch
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.5/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.14/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/startup-notification/startup-notification-0.12/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.3.bb => libxdamage_1.1.4.bb} (86%)
 create mode 100644 meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib-1.0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libmad/libmad/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libogg/libogg-1.3.0/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.0/obsolete_automake_macros.patch

-- 
1.8.0.2



