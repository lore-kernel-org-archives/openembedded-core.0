Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id CC3EC6B0F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 09:32:29 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 02:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1019,1363158000"; d="scan'208";a="265333084"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.28])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jul 2013 02:32:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 10:32:18 +0100
Message-Id: <cover.1373275874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 00/44] Backports from master (cover letter only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2013 09:32:30 -0000

A set of changes for the dylan branch. All of these are backports from
master and have been tested on the Yocto Project autobuilder.

Note: this does include an upgrade for gnutls - I have included this
because it contains a CVE fix that Ross (who submitted the patch)
advises me would be very difficult to separate out of the upgrade.



The following changes since commit 7b8dd3b5547b501e94a6887d3be5c2bbb8845ec8:

  systemd: don't install quotaon.service twice (2013-06-11 18:07:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Alex Olson (1):
  udev: only use devtmpfs for udev

Chen Qi (1):
  bind: use /var/run/named instead of /var/run/bind/run

Christopher Larson (1):
  avahi: inherit python classes, use PACKAGECONFIG

Darren Hart (1):
  linux-firmware: Look for RTL license in the right directory

Hongxu Jia (5):
  ddimage: fix incompatibility with dash
  systemd-udevd: fix invoking init script failed
  adt_installer_internal: fix perl modules relocated failed on older
    distributions
  adt_installer_internal:fix perl lib version mismatch
  adt_installer_internal:add sudo when permission deny on installation
    directory

Jackie Huang (1):
  libproxy_0.4.7 do_unpack failed of qemuppc_world

Jonathan Liu (3):
  openssl: fix documentation build errors with Perl 5.18 pod2man
  qt4: disable gdb_dwarf_index
  qt4: add eglibc-gconv-utf-16 to QtCore RRECOMMENDS when using glibc

Kai Kang (3):
  python-pygobject: disable parallel install
  python-pygtk: fix parallel compile issue
  cleanup-workdir: fix typo

Kevin Strasser (1):
  archiver.bbclass: check if package contains a copyleft license

Laurentiu Palcu (2):
  archive-*-source.bbclass: handle dependency in anonymous function
  populate_sdk_base, adt_installer: abort install if path contains
    spaces

Lukas Bulwahn (2):
  python-argparse: adding runtime dependency on python-codecs
  python-multiprocessing: adding runtime dependencies

Marc Ferland (1):
  openssh: fix initscript restart command

Martin Jansa (1):
  boost: Limit PARALLEL_MAKE by -j 64

Ming Liu (1):
  grep: fix for CVE-2012-5667

Muhammad Shakeel (2):
  ofono: Add run time dependency for ofono test scripts
  openssl: Add fix for cipher des-ede3-cfb1

Otavio Salvador (1):
  alsa-tools: Pass ACLOCAL_FLAGS so aclocal uses the right params

Paul Eggleton (2):
  python-native: add python-codecs-native to RPROVIDES
  qt4: disable qmeegographicssystemhelper

Richard Purdie (3):
  base.bbclass: Ensure finalised data is displayed in build banner
  path.py: Deal with race issue
  package: Ensure we iterate all the pool objects

Robert Yang (1):
  sstate.bbclass: make hard links for staging files

Ross Burton (4):
  runqemu: when tunctl can't be found, say what package builds it
  gnutls: upgrade to 2.12.23
  gst-plugins-bad: use correct option when enabling librsvg
  gst-plugins-bad: tremor was moved from here to -base

Roy.Li (2):
  bind: backport six CVE patches
  directfb:filter out -fno-omit-frame-pointer option on x86 arch

Saul Wold (2):
  chrpath: Fix SRC_URI to correct location
  systemd: Ensure that we mount devtmpfs

Wenzong Fan (2):
  libpam: Fix for CVE-2010-4708
  logrotate: fix for CVE-2011-1548

Zhenhua Luo (1):
  groff: correct the install path of man.local

 meta/classes/archive-configured-source.bbclass     |   7 +-
 meta/classes/archive-original-source.bbclass       |   7 +-
 meta/classes/archive-patched-source.bbclass        |   7 +-
 meta/classes/archiver.bbclass                      |   5 +-
 meta/classes/base.bbclass                          |   6 +-
 meta/classes/package.bbclass                       |   4 +-
 meta/classes/populate_sdk_base.bbclass             |  13 +-
 meta/classes/sstate.bbclass                        |   2 +-
 meta/lib/oe/path.py                                |  21 +-
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |   9 +-
 .../bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch | 119 ++++++
 .../bind/bind-9.8.1/bind-CVE-2011-4313.patch       |  89 +++++
 .../bind/bind-9.8.1/bind-CVE-2012-1667.patch       |  92 +++++
 .../bind/bind-9.8.1/bind-CVE-2012-3817.patch       |  40 ++
 .../bind/bind-9.8.1/bind-CVE-2013-2266.patch       |  41 ++
 .../bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch   | 141 +++++++
 .../bind/bind-9.8.1/conf.patch                     |   4 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |   6 +
 meta/recipes-connectivity/ofono/ofono.inc          |   2 +-
 .../openssh/openssh-6.1p1/init                     |   2 +-
 .../openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch  |  22 ++
 .../openssl/openssl-1.0.1e/openssl-fix-doc.patch   | 435 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   2 +
 meta/recipes-core/systemd/systemd/init             |  10 +-
 meta/recipes-core/udev/udev/init                   |   6 +-
 meta/recipes-devtools/chrpath/chrpath_0.14.bb      |   2 +-
 .../installer/adt-installer/adt_installer          |  13 +-
 .../adt-installer/scripts/adt_installer_internal   |  15 +-
 .../python/python-2.7-manifest.inc                 |   2 +-
 .../python/python-argparse_1.2.1.bb                |   4 +-
 .../recipes-devtools/python/python-native_2.7.3.bb |   2 +-
 .../python/python-pygobject_2.27.91.bb             |   2 +
 .../update-dependences-of-defs.c.patch             |  38 ++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   3 +-
 .../grep/grep-2.5.1a/grep-CVE-2012-5667.patch      |  32 ++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |   3 +-
 ...off-1.22.2-correct-man.local-install-path.patch |  32 ++
 meta/recipes-extended/groff/groff_1.22.2.bb        |   6 +-
 .../logrotate-3.8.1/logrotate-CVE-2011-1548.patch  |  43 ++
 meta/recipes-extended/logrotate/logrotate_3.8.1.bb |   1 +
 .../pam/libpam/libpam-fix-for-CVE-2010-4708.patch  |  41 ++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   1 +
 meta/recipes-graphics/directfb/directfb.inc        |   4 +
 .../linux-firmware/linux-firmware_git.bb           |   2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |   2 +-
 .../gstreamer/gst-plugins-bad_0.10.23.bb           |   6 +-
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |   1 +
 ...ls.pro-disable-qmeegographicssystemhelper.patch |  28 ++
 meta/recipes-qt/qt4/qt4-4.8.4/g++.conf             |   3 +
 meta/recipes-qt/qt4/qt4.inc                        |   1 +
 meta/recipes-support/boost/boost.inc               |  18 +-
 meta/recipes-support/gnutls/gnutls.inc             |   4 +-
 .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |  43 --
 .../gnutls/gnutls/obsolete_automake_macros.patch   |  39 --
 .../gnutls/gnutls/remove-gets.patch                |  41 --
 .../{gnutls_2.12.21.bb => gnutls_2.12.23.bb}       |   8 +-
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |   8 +-
 scripts/cleanup-workdir                            |   2 +-
 scripts/contrib/ddimage                            |  16 +-
 scripts/contrib/python/generate-manifest-2.7.py    |   2 +-
 scripts/runqemu-ifdown                             |   2 +-
 61 files changed, 1359 insertions(+), 203 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-doc.patch
 create mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep-CVE-2012-5667.patch
 create mode 100644 meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
 create mode 100644 meta/recipes-extended/logrotate/logrotate-3.8.1/logrotate-CVE-2011-1548.patch
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0027-tools.pro-disable-qmeegographicssystemhelper.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch
 rename meta/recipes-support/gnutls/{gnutls_2.12.21.bb => gnutls_2.12.23.bb} (61%)

-- 
1.8.1.2


