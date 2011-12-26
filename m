Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfBqe-0004a0-Ps
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 15:48:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Dec 2011 06:41:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100390452"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga001.fm.intel.com with ESMTP; 26 Dec 2011 06:41:02 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Dec 2011 22:56:27 +0800
Message-Id: <cover.1324911023.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 00/13] [V3] Upgrade Packages, Dec 26, 2011
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
X-List-Received-Date: Mon, 26 Dec 2011 14:48:21 -0000

This is version 3.

All,

These are recipe upgrading for polkit, gst-plugins-ugly, gst-plugins-bad, gst-fluendo-mp3, gst-fluendo-mpegdemux, gst-ffmpeg, glib-2.0, mtd-utils, valgrind, telepathy-glib, ofono, and libpcap. Please review and pull.

Changes include:
- glib-2.0 patch: glib-2.0_fix_for_x32.patch should not be removed. So, add it back.
- reword in those patches whose licenses are changed to explain what changed.

The following changes since commit d350b3168bab234e326c8cf1609d13803e6aba9e:

  opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:18 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/upgrade

Shane Wang (13):
  polkit: upgrade to 0.103
  gst-plugins-ugly: upgrade to 0.10.18
  gst-plugins-bad: upgrade to 0.10.22
  gst-fluendo-mp3: upgrade to 0.10.16
  gst-fluendo-mpegdemux: upgrade to 0.10.69
  gst-ffmpeg: upgrade to 0.10.13
  glib-2.0: upgrade to 2.30.2
  mtd-utils: upgrade to 1.4.9
  valgrind: upgrade to 3.7.0
  telepathy-glib: upgrade to 0.17.4
  ofono: upgrade to 1.0
  libpcap: upgrade to 1.2.0
  distro_tracking_fields: update the info for recipe upgrading

 .../conf/distro/include/distro_tracking_fields.inc |   90 ++++++++++---------
 .../{libpcap-1.1.1 => libpcap-1.2.0}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../libpcap/{libpcap_1.1.1.bb => libpcap_1.2.0.bb} |    4 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
 .../ofono/{ofono_0.50.bb => ofono_1.0.bb}          |    6 +-
 ...thy-glib_0.17.0.bb => telepathy-glib_0.17.4.bb} |    4 +-
 .../{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb}     |    6 +-
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.6.bb => mtd-utils_1.4.9.bb} |    2 +-
 .../valgrind/valgrind-3.7.0/configure-fix.patch    |   23 +++++
 .../fix_issue_caused_by_ccache.patch               |    0
 .../fix_unsupporting_kernel_3.patch                |    0
 .../fixed-perl-path.patch                          |    0
 .../{valgrind_3.6.1.bb => valgrind_3.7.0.bb}       |   13 ++--
 .../introspection.patch                            |    0
 .../polkit-1_pam.patch                             |    0
 .../polkit/{polkit_0.102.bb => polkit_0.103.bb}    |    7 +-
 .../gst-ffmpeg-0.10.13/configure-fix.patch         |   20 +++++
 .../lower-rank.diff                                |    0
 ...gst-ffmpeg_0.10.11.bb => gst-ffmpeg_0.10.13.bb} |   19 +++--
 ...o-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} |    4 +-
 ...0.10.67.bb => gst-fluendo-mpegdemux_0.10.69.bb} |    4 +-
 ...s-bad_0.10.21.bb => gst-plugins-bad_0.10.22.bb} |    7 +-
 ...ugly_0.10.17.bb => gst-plugins-ugly_0.10.18.bb} |    6 +-
 27 files changed, 138 insertions(+), 85 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.1.1 => libpcap-1.2.0}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.1.1 => libpcap-1.2.0}/ieee80215-arphrd.patch (91%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.1.1.bb => libpcap_1.2.0.bb} (73%)
 rename meta/recipes-connectivity/ofono/{ofono_0.50.bb => ofono_1.0.bb} (63%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.0.bb => telepathy-glib_0.17.4.bb} (80%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb} (91%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.6 => mtd-utils-1.4.9}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.6 => mtd-utils-1.4.9}/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.6.bb => mtd-utils_1.4.9.bb} (95%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fix_issue_caused_by_ccache.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fix_unsupporting_kernel_3.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fixed-perl-path.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.6.1.bb => valgrind_3.7.0.bb} (71%)
 rename meta/recipes-extended/polkit/{polkit-0.102 => polkit-0.103}/introspection.patch (100%)
 rename meta/recipes-extended/polkit/{polkit-0.102 => polkit-0.103}/polkit-1_pam.patch (100%)
 rename meta/recipes-extended/polkit/{polkit_0.102.bb => polkit_0.103.bb} (84%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
 rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg-0.10.11 => gst-ffmpeg-0.10.13}/lower-rank.diff (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg_0.10.11.bb => gst-ffmpeg_0.10.13.bb} (58%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} (61%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.67.bb => gst-fluendo-mpegdemux_0.10.69.bb} (71%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.21.bb => gst-plugins-bad_0.10.22.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.17.bb => gst-plugins-ugly_0.10.18.bb} (84%)

-- 
1.7.6



