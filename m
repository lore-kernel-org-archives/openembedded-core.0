Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOA-00085Q-K9
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:43 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115401"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:39 -0700
Message-Id: <cover.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Consolidated Pull 00/45] Random Fixes & Pre-Automake Updates
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
X-List-Received-Date: Fri, 25 May 2012 06:52:43 -0000

Richard,

This has a number of fixes from the community along with a partial
set of Nitin's changes for the pending automake update.

Sau!


The following changes since commit 0f795f81fe5ad3ef78c21a177eca90fbc8810f81:

  qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bogdan Marinescu (3):
  lttng2-ust: updated to version 2.0.2
  lttng-tools: updated to 2.0.1
  Updated distro-tracking-fields.inc

Jiajun Xu (2):
  ltp: Upgrade LTP to version 20120401
  distro_tracking_fields: update information for ltp

Mark Hatle (1):
  package.bbclass: Add additional debugging for dependencies

Martin Jansa (2):
  wpa-supplicant: add wpa_supplicant.conf to CONFFILES and don't
    install it twice
  wpa-supplicant: don't let postinst fail when dbus-1 reload fails

Mihai Lindner (1):
  sudo: fixed wrong `chmod` path

Nitin A Kamble (29):
  gmp: fix build with automake 1.12
  mpfr: fix build with automake 1.12
  popt: fix build with automake 1.12
  rpm: fix build with automake 1.12
  libxml2: fix build with automake 1.12
  shadow shadow-native: fix build with automake 1.12
  libtasn1: fix build with automake 1.12
  systemtap: fix build with automake 1.12
  libmpc: fix build with automake 1.12
  libcheck: fix build with automake 1.12
  texinfo: fix build with automake 1.12
  libidn: fix build with automake 1.12
  glew: fix build with automake 1.12
  findutils: fix build with automake 1.12
  lrzsz: fix build with automake 1.12
  minicom: fix build with automake 1.12
  lighttpd: fix build with automake 1.12
  libfm: fix build with automake 1.12
  libcroco: fix build with automake 1.12
  gmp-4.2.1: fix build with automake 1.12
  coreutils-native-6.9: fix build with automake 1.12
  grub-0.97: fix build with automake 1.12
  diffutils-2.8.1: fix build with automake 1.12
  grep-2.5.1a: fix build with automake 1.12
  gawk-3.1.5: fix build with automake 1.12
  findutils-4.2.31: fix build with automake 1.12
  make-3.81: fix build with automake 1.12
  avahi: fix install issue
  pango: fix dependencies to avoid build issue

Paul Eggleton (1):
  opkg-nogpg: add file path

Richard Purdie (2):
  fontconfig-native: Be clear about FILE search path
  binutils: Drop old/stale/broken csl recipe

Robert Yang (2):
  utils.bbclass: remove the unused oe_system
  oe/process.py: remove it since it is unused and duplicated

Saul Wold (1):
  ltp: Add attr to DEPENDS list

Steffen Sledz (1):
  dropbear: fix include dependent PR generation

 meta/classes/package.bbclass                       |    7 +-
 meta/classes/utils.bbclass                         |   26 -------
 .../conf/distro/include/distro_tracking_fields.inc |   16 ++--
 meta/lib/oe/process.py                             |   74 -------------------
 .../grub-0.97/grub_fix_for_automake-1.12.patch     |   48 ++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |    6 +-
 .../lrzsz_fix_for_automake-1.12.patch              |   49 ++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    6 +-
 .../avahi/files/avahi_fix_install_issue.patch      |   32 ++++++++
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 .../coreutils_fix_for_automake-1.12.patch          |   32 ++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 +-
 meta/recipes-core/dropbear/dropbear.inc            |    2 +
 meta/recipes-core/dropbear/dropbear_2012.55.bb     |    2 +-
 .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 ++++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 +-
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    3 -
 .../binutils/binutils_csl-arm-2008q1.bb            |   25 ------
 .../make-3.81/make_fix_for_automake-1.12.patch     |   43 +++++++++++
 meta/recipes-devtools/make/make_3.81.bb            |    4 +-
 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb     |    2 +
 .../rpm/rpm/rpm_fix_for_automake-1.12.patch        |   21 +++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../diffutils_fix_for_automake-1.12.patch          |   27 +++++++
 meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    6 +-
 .../findutils_fix_for_automake-1.12.patch          |   23 ++++++
 .../findutils_fix_for_automake-1.12.patch          |   22 ++++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |    6 +-
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 +-
 .../gawk-3.1.5/gawk_fix_for_automake-1.12.patch    |   41 ++++++++++
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    2 +
 .../grep-2.5.1a/grep_fix_for_automake-1.12.patch   |   52 +++++++++++++
 meta/recipes-extended/grep/grep_2.5.1a.bb          |    7 +-
 .../libidn/libidn_fix_for_automake-1.12.patch      |   26 +++++++
 meta/recipes-extended/libidn/libidn_1.24.bb        |    5 +-
 .../files/lighttpd_fix_for_automake-1.12.patch     |   37 +++++++++
 meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    5 +-
 .../ltp/ltp/uclibc-getcontext.patch                |   78 --------------------
 .../ltp/{ltp_20120104.bb => ltp_20120401.bb}       |    9 +-
 .../minicom_fix_for_automake-1.12.patch            |   21 +++++
 meta/recipes-extended/minicom/minicom_2.6.1.bb     |    3 +
 .../files/shadow_fix_for_automake-1.12.patch       |   23 ++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    6 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    6 +-
 meta/recipes-extended/sudo/sudo_1.8.4p4.bb         |    6 +-
 .../texinfo_fix_for_automake-1.12.patch            |   24 ++++++
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
 .../fontconfig/fontconfig-native_2.8.0.bb          |    2 +
 .../glew/files/glew_fix_for_automake-1.12.patch    |   25 ++++++
 meta/recipes-graphics/glew/glew_1.7.0.bb           |    3 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 ...tools-fix-compiling-error-for-powerpc-arm.patch |   27 -------
 ...tng-tools_2.0-pre16.bb => lttng-tools_2.0.1.bb} |   12 ++-
 .../{lttng2-ust_1.9.4.bb => lttng2-ust_2.0.2.bb}   |    8 +-
 .../systemtap_fix_for_automake_1.12.patch          |   23 ++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
 .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  |   48 ++++++++++++
 .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48 ++++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    6 +-
 meta/recipes-support/gmp/gmp_5.0.4.bb              |    6 +-
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 +++++++
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    6 +-
 .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 +++++++
 meta/recipes-support/libcheck/libcheck_0.9.8.bb    |    6 +-
 .../files/libcroco_fix_for_automake-1.12.patch     |   22 ++++++
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    5 +-
 .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48 ++++++++++++
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    6 +-
 .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 +++++++
 meta/recipes-support/libmpc/libmpc_0.8.2.bb        |    5 +-
 .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 +++++++++
 meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    7 +-
 .../popt/popt/popt_fix_for_automake-1.12.patch     |   21 +++++
 meta/recipes-support/popt/popt_1.16.bb             |    3 +-
 77 files changed, 1035 insertions(+), 313 deletions(-)
 delete mode 100644 meta/lib/oe/process.py
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/lrzsz_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/avahi_fix_install_issue.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
 create mode 100644 meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils-2.8.1/diffutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/gawk/gawk-3.1.5/gawk_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/grep/grep-2.5.1a/grep_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
 rename meta/recipes-extended/ltp/{ltp_20120104.bb => ltp_20120401.bb} (95%)
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.13a/texinfo_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-graphics/glew/files/glew_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-tools/lttng-tools-fix-compiling-error-for-powerpc-arm.patch
 rename meta/recipes-kernel/lttng-2.0/{lttng-tools_2.0-pre16.bb => lttng-tools_2.0.1.bb} (70%)
 rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_1.9.4.bb => lttng2-ust_2.0.2.bb} (81%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/gmp/gmp/gmp_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libcroco/files/libcroco_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/mpfr/mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch

-- 
1.7.7.6



