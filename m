Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BFCCC6C736
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 04:49:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2013 20:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,844,1378882800"; d="scan'208";a="446100496"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.171])
	by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2013 20:49:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 20:49:09 -0800
Message-Id: <cover.1386353625.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/26]
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
X-List-Received-Date: Sat, 07 Dec 2013 04:49:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard:

Reviewed and AB tested.  I have one more set that I am still working on reviewing.

Sau!



The following changes since commit 4a562fd2614bb6ccce1222d47b9268d6980cf315:

  linux-yocto/*: restore branch designations (2013-12-06 13:40:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Andreas Oberritter (1):
  xorg-lib-common.inc: use REQUIRED_DISTRO_FEATURES variable

Chen Qi (1):
  nfs-utils: explicitly rdepend on bash

Hongxu Jia (6):
  qemu: add bash and python to qemu's RDEPENDS
  license.bbclass: fix copying license directories failed
  dhclient-script: let resolv.conf and resolv.conf.dhclient on the same
    directory
  dhclient-script: override make_resolv_conf for read-only fs
  mtools: add ability to compile with nativesdk
  syslinux: add ability to compile with nativesdk

Jackie Huang (1):
  grub: add explicit dependency on bison-native

Konrad Scherer (1):
  perf: Disable warnings as errors for kernels 3.1+

Lukas Bulwahn (1):
  boost: updating to 1.55.0

Michaël Burtin (1):
  initramfs-framework: fix udev working directory creation

Qiang Chen (1):
  shadow: remove reference to locale env files from login and su

Ross Burton (1):
  documentation.conf: update for new image testing variables

Roy Li (2):
  libidn: enable TLD
  buildhistory.bbclass/image.bbclass: remove obsolete codes

Saul Wold (7):
  runqemu: Extend to support genericx86 machine type
  acl: Update to 2.2.52
  file: Update to 5.16
  libxkbcommon: Update to 0.3.2
  nspr: Update to 4.10.2
  binutils: Add embedspu to standard binutils package
  boost: Move files -> boost

Scott Garman (1):
  runqemu: remove core-image-* whitelist

Zhang Xiao (1):
  nfs-utils: separate package as Debain style

yanjun.zhu (1):
  boot-directdisk: add the support of vmdk

 meta/classes/boot-directdisk.bbclass               | 21 ++++-
 meta/classes/buildhistory.bbclass                  | 10 +--
 meta/classes/image.bbclass                         |  4 +-
 meta/classes/license.bbclass                       |  7 +-
 meta/conf/documentation.conf                       |  4 +-
 meta/recipes-bsp/grub/grub_2.00.bb                 |  2 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |  7 +-
 ...ript-let-resolv.conf-and-resolv.conf.dhcl.patch | 74 ++++++++++++++++++
 .../dhcp/files/readonly-dhclient-enter-hooks       | 31 ++++++++
 .../nfs-utils/nfs-utils/nfscommon                  | 90 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils/nfsserver                  | 46 +----------
 .../nfs-utils/nfs-utils_1.2.9.bb                   | 27 +++++--
 .../initrdscripts/initramfs-framework/udev         |  2 +-
 meta/recipes-devtools/binutils/binutils.inc        |  8 +-
 meta/recipes-devtools/binutils/binutils_2.23.2.bb  |  6 ++
 .../file/{file_5.15.bb => file_5.16.bb}            |  4 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |  2 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |  2 +-
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |  2 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |  2 -
 meta/recipes-extended/libidn/libidn_1.28.bb        |  2 -
 meta/recipes-extended/shadow/files/pam.d/login     |  3 -
 meta/recipes-extended/shadow/files/pam.d/su        |  3 -
 .../xorg-lib/libpciaccess_0.13.2.bb                |  2 +
 ...libxkbcommon_0.3.1.bb => libxkbcommon_0.3.2.bb} |  4 +-
 meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb    |  2 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |  8 +-
 meta/recipes-kernel/perf/perf.bb                   |  4 +
 .../attr/acl/add-missing-configure.ac.patch        | 59 ++++++++++++++
 meta/recipes-support/attr/acl_2.2.51.bb            |  8 --
 meta/recipes-support/attr/acl_2.2.52.bb            |  9 +++
 ...bjam-native_1.54.0.bb => bjam-native_1.55.0.bb} |  0
 .../boost/{boost-1.54.0.inc => boost-1.55.0.inc}   |  4 +-
 .../boost/{files => boost}/arm-intrinsics.patch    |  0
 meta/recipes-support/boost/boost_1.54.0.bb         |  7 --
 meta/recipes-support/boost/boost_1.55.0.bb         |  4 +
 .../files/boost-1.54.0-thread-link_atomic.patch    | 59 --------------
 meta/recipes-support/boost/files/glibc.patch       | 26 -------
 .../nspr/{nspr_4.10.1.bb => nspr_4.10.2.bb}        |  4 +-
 scripts/runqemu                                    | 38 ++++-----
 scripts/runqemu-internal                           | 10 ++-
 42 files changed, 383 insertions(+), 225 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/dhclient-script-let-resolv.conf-and-resolv.conf.dhcl.patch
 create mode 100644 meta/recipes-connectivity/dhcp/files/readonly-dhclient-enter-hooks
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
 rename meta/recipes-devtools/file/{file_5.15.bb => file_5.16.bb} (86%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.3.1.bb => libxkbcommon_0.3.2.bb} (78%)
 create mode 100644 meta/recipes-support/attr/acl/add-missing-configure.ac.patch
 delete mode 100644 meta/recipes-support/attr/acl_2.2.51.bb
 create mode 100644 meta/recipes-support/attr/acl_2.2.52.bb
 rename meta/recipes-support/boost/{bjam-native_1.54.0.bb => bjam-native_1.55.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.54.0.inc => boost-1.55.0.inc} (83%)
 rename meta/recipes-support/boost/{files => boost}/arm-intrinsics.patch (100%)
 delete mode 100644 meta/recipes-support/boost/boost_1.54.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.55.0.bb
 delete mode 100644 meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
 delete mode 100644 meta/recipes-support/boost/files/glibc.patch
 rename meta/recipes-support/nspr/{nspr_4.10.1.bb => nspr_4.10.2.bb} (96%)

-- 
1.8.3.1


