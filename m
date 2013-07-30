Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D8BE76B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 06:14:20 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jul 2013 23:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,776,1367996400"; d="scan'208";a="338842232"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.47])
	by azsmga001.ch.intel.com with ESMTP; 29 Jul 2013 23:14:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: ross.burton@intel.com, paul.eggleton@linux.intel.com,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 23:14:19 -0700
Message-Id: <cover.1375164419.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL (M3 rc1) 00/26] Needs early review and ACK
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
X-List-Received-Date: Tue, 30 Jul 2013 06:14:21 -0000

Paul, Ross:

Please review (and if needed create new branch) in your morning for an RP
review.  This will be RC1 of M3 and we need it to be as solid as possible
as M2 was a bit of a bust!

Please review the build status on the Autobuild, which is currently looking OK,
but not near enough finished.

There is also a batch of Poky changes which I will consolidate for the poky@yp.org
ML.

Please review and ACK both this and the poky@yp.org email.

Thanks
	Sau!

The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:

  external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andre McCurdy (1):
  lib/oe/terminal.py: add support for MATE desktop terminals

Andrei Dinu (1):
  libpng : upgrade to 1.6.3

Colin Walters (1):
  util-linux: Update for swapoff being a separate binary

Cristian Iorga (1):
  iproute2: upgrade to v3.10.0

Emilia Ciobanu (4):
  docbook-sgml-dtd-3.1-native: fix recipe name
  docbook-sgml-dtd-4.1-native: fix recipe name
  distrodata.bbclass: Remove whitespaces
  distrodata.bbclass: Include PRSPV variable in upstream version
    checking

Hongxu Jia (3):
  util-linux: use u-a for su
  shadow: use u-a for su
  busybox: move /bin/su to /usr/bin/su to match util-linux and shadow

Jackie Huang (2):
  dbus: remove build host test in configure script
  matchbox-wm: correct the SRC_URI and add checksums

Jonathan Liu (1):
  syslinux: update to 4.07

Jukka Rissanen (1):
  bluez5: Only install .conf files if found

Laurentiu Palcu (1):
  csl-versions.inc: instruct user to check local.conf

Ming Liu (2):
  openssl: Fix multilib header conflict - opensslconf.h
  libpam: deny all services for the OTHER entries

Muhammad Shakeel (2):
  systemd: Remove init.d dir if systemd unit file is present and
    sysvinit not a distro feature
  busybox: Add syslog-init alternative only if SysV in enabled

Paul Eggleton (1):
  classes/sanity: check for suid root command evility

Peter Seebach (1):
  pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0

Ross Burton (1):
  v86d: mark as compatible with all x86, not just qemux86

Saul Wold (2):
  bluez5: Add obex as a PACKAGECONFIG and package seperately
  texinfo: Update to 5.1

Wenzong Fan (1):
  ccache: allow CCACHE_DIR to be overriden

 meta/classes/ccache.bbclass                        |   2 +-
 meta/classes/distrodata.bbclass                    |  41 +++++---
 meta/classes/sanity.bbclass                        |  10 ++
 meta/classes/systemd.bbclass                       |  15 +++
 meta/conf/distro/include/csl-versions.inc          |   1 +
 meta/lib/oe/terminal.py                            |   4 +
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |   2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |  22 ++++-
 .../{iproute2_3.9.0.bb => iproute2_3.10.0.bb}      |   4 +-
 meta/recipes-connectivity/openssl/openssl.inc      |   3 +-
 .../busybox/busybox-1.21.1/su-usr-bin.patch        |  26 +++++
 meta/recipes-core/busybox/busybox.inc              |  11 ++-
 meta/recipes-core/busybox/busybox_1.21.1.bb        |   1 +
 meta/recipes-core/dbus/dbus-1.6.10/os-test.patch   |  35 +++++++
 meta/recipes-core/dbus/dbus.inc                    |   4 +-
 meta/recipes-core/util-linux/util-linux.inc        |  12 ++-
 ...ative.bb => docbook-sgml-dtd-3.1-native_3.1.bb} |   0
 ...ative.bb => docbook-sgml-dtd-4.1-native_4.1.bb} |   0
 meta/recipes-devtools/pseudo/pseudo.inc            |  50 ++++++++--
 .../{syslinux_4.06.bb => syslinux_4.07.bb}         |   4 +-
 meta/recipes-extended/pam/libpam/pam.d/other       |  15 ++-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   3 +-
 .../texinfo-4.13a/dont-depend-on-help2man.patch    |  79 ---------------
 .../texinfo/texinfo-4.13a/gettext-macros.patch     |  61 ------------
 .../texinfo-4.13a/texinfo-4.13a-data_types.patch   |  34 -------
 .../texinfo-4.13a-help-index-segfault.patch        |  25 -----
 .../texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch  |  13 ---
 .../texinfo_fix_for_automake-1.12.patch            |  24 -----
 .../texinfo/texinfo-4.13a/use_host_makedoc.patch   |  37 -------
 .../disable-native-tools.patch                     |   0
 .../texinfo-5.1/dont-depend-on-help2man.patch      |  16 +++
 .../{texinfo-4.13a => texinfo-5.1}/link-zip.patch  |  12 +--
 .../texinfo-4.12-zlib.patch                        | 110 ++++++++++++---------
 .../texinfo-4.13a-powerpc.patch                    |   0
 .../texinfo/texinfo-5.1/use_host_makedoc.patch     |  13 +++
 .../texinfo/{texinfo_4.13a.bb => texinfo_5.1.bb}   |  25 ++---
 .../matchbox-wm/matchbox-wm_1.2.bb                 |   5 +-
 .../libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb}    |   8 +-
 38 files changed, 328 insertions(+), 399 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.9.0.bb => iproute2_3.10.0.bb} (64%)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.10/os-test.patch
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-3.1-native.bb => docbook-sgml-dtd-3.1-native_3.1.bb} (100%)
 rename meta/recipes-devtools/docbook-sgml-dtd/{docbook-sgml-dtd-4.1-native.bb => docbook-sgml-dtd-4.1-native_4.1.bb} (100%)
 rename meta/recipes-devtools/syslinux/{syslinux_4.06.bb => syslinux_4.07.bb} (93%)
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/dont-depend-on-help2man.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/gettext-macros.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-data_types.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-help-index-segfault.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/use_host_makedoc.patch
 rename meta/recipes-extended/texinfo/{texinfo-4.13a => texinfo-5.1}/disable-native-tools.patch (100%)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-5.1/dont-depend-on-help2man.patch
 rename meta/recipes-extended/texinfo/{texinfo-4.13a => texinfo-5.1}/link-zip.patch (49%)
 rename meta/recipes-extended/texinfo/{texinfo-4.13a => texinfo-5.1}/texinfo-4.12-zlib.patch (59%)
 rename meta/recipes-extended/texinfo/{texinfo-4.13a => texinfo-5.1}/texinfo-4.13a-powerpc.patch (100%)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-5.1/use_host_makedoc.patch
 rename meta/recipes-extended/texinfo/{texinfo_4.13a.bb => texinfo_5.1.bb} (66%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.2.bb => libpng_1.6.3.bb} (64%)

-- 
1.8.1.4


