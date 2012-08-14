Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GBm-0000VL-4G
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:25:38 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2012 05:13:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="208120395"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 05:13:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:22 +0300
Message-Id: <cover.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Christopher Larson <chris_larson@mentor.com>,
	Xin Ouyang <Xin.Ouyang@windriver.com>,
	Matthew McClintock <msm@freescale.com>,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [CONSOLIDATED REQUEST 00/64] Post Milestone Catch-Up
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
X-List-Received-Date: Tue, 14 Aug 2012 12:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is a set of patches that I have pulled together after the
milestone freeze, I know there is more, these have been through
the AB together, and passed local testing.

I have also included my update-alternative patch set, which I verified
with buildhistory (it showed no changes, which is good).

I will start working on the next patch today to put to the AB tonight
before I leave back the US tomorrow.

Thanks
	Sau!

The following changes since commit b5028cc84ad7c40c51cadbdf7fdc892cde4462cb:

  createrepo: add wrapper script to fix paths (2012-08-13 20:09:22 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andy Ross (1):
  dbus: Fix pid file in dbus init script

Björn Stenberg (1):
  pigz: Update to upstream version 2.2.5

Bruce Ashfield (1):
  kernel.bbclass: remove default module_autoload and module_conf values

Christopher Larson (1):
  base.bbclass: allow specifying an lsb distro hook via the metadata

Constantin Musca (1):
  libdrm: package update 2.4.35 -> 2.4.37

Jackie Huang (2):
  tcl: uncomment a line that causing TCL_SRC_DIR point to the workdir.
  gdk-pixbuf: fix the postinstall script failure when no icon is
    installed

Jesse Zhang (1):
  libxpm-native: add dependency on gettext-native

Kenneth Solbjerg (1):
  run-postinsts does not run any scripts

Khem Raj (2):
  chrpath.bbclass: Account for case when ORIGIN is in RPATH
  kernel.bbclass: Preserve generated headers

Koen Kooi (2):
  man: fix RDEPENDS and reformat recipe
  man: make man actually work by installing custom man.config

Marcin Juszkiewicz (1):
  dbus: provide/replace dbus-x11 only for target

Martin Jansa (2):
  bitbake.conf: store cooker logs in subdirectory of LOG_DIR
  layer.conf: add udev-extraconf to SIGGEN_EXCLUDERECIPES_ABISAFE

Matthew McClintock (1):
  owl-video_git.bb: fix compilation on Fedora 13 machine

Mihai Lindner (1):
  sysklogd: removed tabs from syslog.conf

Paul Eggleton (1):
  rpmresolve: improve debug output

Peter Seebach (2):
  base.bbclass: Expand PNBLACKLIST across multilibs too
  base.bbclass: Restructure multilib variable cloning

Radu Moisan (1):
  pango: upgrade to upstream stable 1.30.0

Roy.Li (1):
  qemu: backport patch to fix pl031 RTC

Saul Wold (34):
  rxvt-unicode: remove setting of LD_LIBRARY_PATH
  rxvt-unicode: cleanup update-alternatives deprecated code
  openssh: cleanup update-alternatives deprecated code
  mini-x-session: cleanup update-alternatives deprecated code
  console-tools: cleanup update-alternatives deprecated code
  kbd: cleanup update-alternatives deprecated code
  tinylogin: cleanup update-alternatives deprecated code
  patch: cleanup update-alternatives deprecated code
  ubootchart: cleanup update-alternatives deprecated code
  bc: cleanup update-alternatives deprecated code
  diffutils: refactor to add a common diffutils.inc
  diffutils: cleanup update-alternatives deprecated code
  findutils: refactor common code to findutils.inc
  findutils: cleanup update-alternatives deprecated code
  powertop: cleanup update-alternatives deprecated code
  mutter: cleanup update-alternatives deprecated code
  matchbox-wm-2: cleanup update-alternatives deprecated code
  matchbox-session: cleanup update-alternatives deprecated code
  metacity: cleanup update-alternatives deprecated code
  pigz: cleanup update-alternatives deprecated code
  msmtp: cleanup update-alternatives deprecated code
  mktemp: cleanup update-alternatives deprecated code
  which: cleanup update-alternatives deprecated code
  less: cleanup update-alternatives deprecated code
  shadow: cleanup update-alternatives deprecated code
  mingetty: cleanup update-alternatives deprecated code
  hdparm: cleanup update-alternatives deprecated code
  gzip: cleanup update-alternatives deprecated code
  procps: cleanup update-alternatives deprecated code
  time: cleanup update-alternatives deprecated code
  wget: cleanup update-alternatives deprecated code
  sed: cleanup update-alternatives deprecated code
  gawk: cleanup update-alternatives deprecated code
  net-tools: cleanup update-alternatives deprecated code

Wade Farnsworth (1):
  systemtap-uprobes: inhibit package strip

Wenzong Fan (2):
  at 3.1.13: get 'at' depends on 'flex-native' explicitly
  sysfsutils: install libs to base_libdir

Xin Ouyang (1):
  gettext-0.18: explicitly disable acl.

Yao Zhao (3):
  base.bbclass: fix PACKAGECONFIG handling code
  gstreamer: gst-ffmpeg: fix build issues for libav
  cracklib, zlib, perl: install libz, libcrack to /lib instead of
    /usr/libxx

 meta/classes/base.bbclass                          |   97 +++--
 meta/classes/chrpath.bbclass                       |    1 +
 meta/classes/kernel.bbclass                        |   21 +-
 meta/classes/package_rpm.bbclass                   |    4 +-
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/layer.conf                               |    1 +
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    4 -
 .../console-tools/console-tools_0.3.2.bb           |    8 +-
 meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init     |   11 +-
 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init     |   11 +-
 meta/recipes-core/dbus/dbus.inc                    |    4 +
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    7 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |    4 +-
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   11 +-
 meta/recipes-core/zlib/zlib_1.2.7.bb               |   11 +-
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/patch/patch.inc              |    7 +-
 meta/recipes-devtools/patch/patch_2.5.9.bb         |    2 +-
 meta/recipes-devtools/patch/patch_2.6.1.bb         |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    4 +-
 ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 ++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    1 +
 meta/recipes-devtools/rpm/rpmresolve/rpmresolve.c  |   69 +++-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |    2 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    6 +-
 meta/recipes-extended/at/at_3.1.13.bb              |    4 +-
 meta/recipes-extended/bc/bc_1.06.bb                |    4 +-
 meta/recipes-extended/cracklib/cracklib_2.8.19.bb  |    4 +-
 meta/recipes-extended/diffutils/diffutils.inc      |   22 +
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |   24 +-
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |   22 +-
 meta/recipes-extended/findutils/findutils.inc      |    7 +-
 .../recipes-extended/findutils/findutils_4.2.31.bb |   31 +--
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 +-
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    7 +-
 meta/recipes-extended/gawk/gawk_4.0.1.bb           |    7 +-
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |    7 +-
 meta/recipes-extended/hdparm/hdparm_9.39.bb        |    5 +-
 meta/recipes-extended/less/less_444.bb             |    6 +-
 meta/recipes-extended/man/man-1.6f/man.conf        |  140 +++++++
 meta/recipes-extended/man/man_1.6f.bb              |   11 +-
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |    9 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |   11 +-
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    8 +-
 .../net-tools/net-tools_1.60-23.bb                 |   19 +-
 meta/recipes-extended/pigz/pigz.inc                |    4 +-
 meta/recipes-extended/pigz/pigz_2.2.4.bb           |   11 -
 meta/recipes-extended/pigz/pigz_2.2.5.bb           |    9 +
 meta/recipes-extended/procps/procps.inc            |    9 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    9 +-
 meta/recipes-extended/sed/sed_4.1.2.bb             |    9 +-
 meta/recipes-extended/sed/sed_4.2.1.bb             |    9 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   18 +-
 meta/recipes-extended/sysklogd/files/syslog.conf   |   23 +-
 meta/recipes-extended/sysklogd/sysklogd_1.5.bb     |    2 +-
 meta/recipes-extended/time/time.inc                |    8 +-
 meta/recipes-extended/time/time_1.7.bb             |    2 +-
 meta/recipes-extended/wget/wget.inc                |   10 +-
 meta/recipes-extended/which/which_2.18.bb          |    8 +-
 meta/recipes-extended/which/which_2.20.bb          |   10 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   10 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    7 +-
 .../drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb}     |    4 +-
 .../matchbox-session/matchbox-session_0.1.bb       |    7 +-
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    7 +-
 .../mini-x-session/mini-x-session_0.1.bb           |    7 +-
 meta/recipes-graphics/mutter/mutter.inc            |    5 +-
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |    2 +-
 .../pango/pango-1.28.4/no-tests.patch              |   16 -
 .../pango/pango-1.28.4/noconst.patch               |  408 --------------------
 .../multilib-fix-clean.patch                       |    0
 .../pango/pango-1.30.0/no-tests.patch              |   12 +
 .../pango/{pango_1.28.4.bb => pango_1.30.0.bb}     |    9 +-
 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb    |    3 +-
 meta/recipes-kernel/powertop/powertop_1.13.bb      |   13 +-
 .../systemtap/systemtap-uprobes_git.bb             |    2 +
 .../gst-ffmpeg-0.10.13/libav_e500mc.patch          |   21 +
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |   16 +-
 .../owl-video/0001-add-dependency-for-xrandr.patch |   30 ++
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    5 +-
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |   10 +-
 83 files changed, 621 insertions(+), 808 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils.inc
 create mode 100644 meta/recipes-extended/man/man-1.6f/man.conf
 delete mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb
 create mode 100644 meta/recipes-extended/pigz/pigz_2.2.5.bb
 rename meta/recipes-graphics/drm/{libdrm_2.4.35.bb => libdrm_2.4.37.bb} (50%)
 delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/no-tests.patch
 delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/noconst.patch
 rename meta/recipes-graphics/pango/{pango-1.28.4 => pango-1.30.0}/multilib-fix-clean.patch (100%)
 create mode 100644 meta/recipes-graphics/pango/pango-1.30.0/no-tests.patch
 rename meta/recipes-graphics/pango/{pango_1.28.4.bb => pango_1.30.0.bb} (49%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e500mc.patch
 create mode 100644 meta/recipes-sato/owl-video-widget/owl-video/0001-add-dependency-for-xrandr.patch

-- 
1.7.7.6



