Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgZ-0008V4-HZ
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495884"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:39 -0700
Message-Id: <cover.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
Subject: [PATCH 00/21] Add SRC_URI Checksums and some Updates
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:39 -0000

Richard,

Found some recipes missing Checksums and do a couple of
package updates.

Thanks
Sau!

The following changes since commit cc626b9e1671670a931ea3e528ea4b0f7b2e923b:

  webkit-gtk: Enable dependency tracking since the webkit makefiles have bugs (2011-10-05 14:36:18 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (21):
  grub: Add SRC_URI Checksum
  dosfstools: Add SRC_URI Checksum
  libx11-trim: Add SRC_URI Checksum
  guilt-native: Add SRC_URI Checksums
  libx11-diet: Add SRC_URI Checksum
  eds-tools: Convert from BZR to GIT Repo
  clutter-gst-1.6: Add SRC_URI Checksum
  xserver-kdrive: Add SRC_URI Checksum
  mutter: Add SRC_URI Checksum
  icon-naming-utils: Add SRC_URI Checksum
  libxml-perl: Add SRC_URI Checksum
  liburi-perl: Add SRC_URI Checksum
  gconf-dbus: Add SRC_URI Checksum
  gail: Add SRC_URI Checksum
  boost-jam-native: Add SRC_URI Checksum
  puzzles: Update to latest version
  gnutls: Update to 2.12.11
  tzdata: Update to 2011k
  lsof: Update to 4.84
  apt: Update to 0.8.15.8
  distro_tracking: Updates

 .../conf/distro/include/distro_tracking_fields.inc |   62 ++++++++++++--------
 meta/recipes-bsp/grub/grub_1.99.bb                 |    5 +-
 .../includes-fix.patch                             |    0
 .../no-ko-translation.patch                        |    0
 .../{apt-0.7.14 => apt-0.8.15.8}/noconfigure.patch |    0
 .../apt/{apt-0.7.14 => apt-0.8.15.8}/nodoc.patch   |    0
 .../{apt-0.7.14 => apt-0.8.15.8}/use-host.patch    |    0
 ...apt-native_0.7.14.bb => apt-native_0.8.15.8.bb} |    6 +-
 .../apt/{apt_0.7.14.bb => apt_0.8.15.8.bb}         |    6 +-
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |    5 +-
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    5 +-
 .../icon-naming-utils-native_0.8.7.bb              |    5 +-
 meta/recipes-devtools/perl/liburi-perl_1.58.bb     |    5 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |    5 +-
 .../lsof/{lsof_4.84.bb => lsof_4.85.bb}            |    5 +-
 .../tzdata/{tzdata_2011i.bb => tzdata_2011k.bb}    |    4 +-
 meta/recipes-gnome/gnome/gail_1.20.2.bb            |    5 +-
 meta/recipes-gnome/gnome/gconf-dbus_705.bb         |    5 +-
 .../clutter/clutter-gst-1.6_1.3.6.bb               |    5 ++
 meta/recipes-graphics/mutter/mutter_2.28.1.bb      |    5 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |    5 +-
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |    5 +-
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    5 +-
 .../eds/{eds-tools_bzr.bb => eds-tools_git.bb}     |    6 +-
 .../puzzles/{puzzles_r9175.bb => puzzles_r9306.bb} |    0
 meta/recipes-support/boost/boost-jam-native.inc    |    2 +-
 .../boost/boost-jam-native_3.1.18.bb               |    4 +
 .../configure-fix.patch                            |   40 ++++++-------
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 .../gnutls/{gnutls_2.12.5.bb => gnutls_2.12.11.bb} |    4 +-
 31 files changed, 130 insertions(+), 74 deletions(-)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/includes-fix.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.8.15.8}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.7.14.bb => apt-native_0.8.15.8.bb} (60%)
 rename meta/recipes-devtools/apt/{apt_0.7.14.bb => apt_0.8.15.8.bb} (67%)
 rename meta/recipes-extended/lsof/{lsof_4.84.bb => lsof_4.85.bb} (89%)
 rename meta/recipes-extended/tzdata/{tzdata_2011i.bb => tzdata_2011k.bb} (97%)
 rename meta/recipes-sato/eds/{eds-tools_bzr.bb => eds-tools_git.bb} (72%)
 rename meta/recipes-sato/puzzles/{puzzles_r9175.bb => puzzles_r9306.bb} (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.5 => gnutls-2.12.11}/configure-fix.patch (54%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.5 => gnutls-2.12.11}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.5 => gnutls-2.12.11}/gnutls-texinfo-euro.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls_2.12.5.bb => gnutls_2.12.11.bb} (46%)

-- 
1.7.6.2



