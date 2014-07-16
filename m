Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE43170601
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQRUl011058; Wed, 16 Jul 2014 17:26:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n9mTk25XbUCV; Wed, 16 Jul 2014 17:26:27 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQMXT011025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:24 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S25-0004M3-Sn; Wed, 16 Jul 2014 17:26:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:16 +0100
Message-Id: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH 00/19] Various fixes and package upgrades
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:20 -0000

The following changes since commit f826b13e4ae2f2f2ffebdf22435452c1a72980d8:

  libpcap: Avoid libpcap build error when libnl1 is involved (2014-07-16 17:18:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core master-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core/log/?h=master-next

Richard Purdie (19):
  pkgconfig: Drop version from RPROVIDES
  python-docutil: Upgrade 0.11 -> 0.12
  python-scons: Upgrade 2.3.0 -> 2.3.2
  gdb: Upgrade 7.7 -> 7.7.1
  mdadm: Upgrade 3.3 -> 3.3.1
  gccmakedep: Upgrade 1.0.2 -> 1.0.3
  powertop: Upgrade 2.5 -> 2.6.1
  nasm: Update 2.11.02 -> 2.11.05
  cross-canadian: Fix shlibs directory after recent shlibs changes
  subversion: Upgrade 1.7.7 -> 1.8.9
  python-pycurl: Upgrade 7.19.3 -> 7.19.3.1
  libconvert-asn1-perl: Upgrade 0.26 -> 0.27
  btrfs-tools: Upgrade 3.12 -> 3.14.2
  neard: Fix typo in patch leading to parallel make race
  fontcache: Fix build dependency errors
  libpcap: Fix floating dbus dependency
  gnutls: Fix floating libidn dependency
  xserver-xorg: Fix build determinism problem
  python: Forcibly disable tk

 meta/classes/cross-canadian.bbclass                |   4 +-
 meta/classes/fontcache.bbclass                     |   7 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |   1 +
 .../neard/neard/parallel-build.patch               |   2 +-
 .../btrfs-tools/allow-relative-path.patch          |  58 ---------
 .../btrfs-tools/btrfs-tools/nodocs.patch           |  22 ++++
 .../btrfs-tools/btrfs-tools/weak-defaults.patch    |  31 -----
 .../btrfs-tools/btrfs-tools_git.bb                 |   9 +-
 .../gdb/{gdb-7.7.inc => gdb-7.7.1.inc}             |   4 +-
 ...canadian_7.7.bb => gdb-cross-canadian_7.7.1.bb} |   0
 .../gdb/{gdb-cross_7.7.bb => gdb-cross_7.7.1.bb}   |   0
 .../gdb/{gdb_7.7.bb => gdb_7.7.1.bb}               |   0
 .../nasm/{nasm_2.11.02.bb => nasm_2.11.05.bb}      |   4 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   2 +-
 ...on-docutils_0.11.bb => python-docutils_0.12.bb} |   6 +-
 .../python/python-pycurl/no-static-link.patch      |  24 ++--
 ...-pycurl_7.19.3.bb => python-pycurl_7.19.3.1.bb} |   6 +-
 ...ative_2.3.0.bb => python-scons-native_2.3.2.bb} |   0
 ...python-scons_2.3.0.bb => python-scons_2.3.2.bb} |   6 +-
 .../python/avoid_warning_about_tkinter.patch       |  15 ++-
 .../subversion-1.7.10/allow-updated-neon.patch     |  20 ----
 .../subversion-1.7.10/fix-install-depends.patch    |  48 --------
 .../neon.m4-fix-includes-and-cflags.patch          |  32 -----
 .../subversion-CVE-2013-4131.patch                 |  42 -------
 .../subversion-CVE-2013-4277.patch                 |  15 ---
 .../subversion-CVE-2013-4505.patch                 | 130 ---------------------
 .../subversion-1.8.9/disable_macos.patch           |  68 +++++++++++
 .../libtool2.patch                                 |   0
 .../{subversion_1.7.10.bb => subversion_1.8.9.bb}  |  15 +--
 .../mdadm/{mdadm_3.3.bb => mdadm_3.3.1.bb}         |   6 +-
 ...1-perl_0.26.bb => libconvert-asn1-perl_0.27.bb} |   4 +-
 .../{gccmakedep_1.0.2.bb => gccmakedep_1.0.3.bb}   |   4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   1 +
 .../{powertop_2.5.bb => powertop_2.6.1.bb}         |   5 +-
 meta/recipes-support/gnutls/gnutls.inc             |   1 +
 35 files changed, 157 insertions(+), 435 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch
 rename meta/recipes-devtools/gdb/{gdb-7.7.inc => gdb-7.7.1.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.7.bb => gdb-cross-canadian_7.7.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.7.bb => gdb-cross_7.7.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_7.7.bb => gdb_7.7.1.bb} (100%)
 rename meta/recipes-devtools/nasm/{nasm_2.11.02.bb => nasm_2.11.05.bb} (81%)
 rename meta/recipes-devtools/python/{python-docutils_0.11.bb => python-docutils_0.12.bb} (60%)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.3.bb => python-pycurl_7.19.3.1.bb} (78%)
 rename meta/recipes-devtools/python/{python-scons-native_2.3.0.bb => python-scons-native_2.3.2.bb} (100%)
 rename meta/recipes-devtools/python/{python-scons_2.3.0.bb => python-scons_2.3.2.bb} (52%)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.10 => subversion-1.8.9}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.10.bb => subversion_1.8.9.bb} (67%)
 rename meta/recipes-extended/mdadm/{mdadm_3.3.bb => mdadm_3.3.1.bb} (90%)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.26.bb => libconvert-asn1-perl_0.27.bb} (76%)
 rename meta/recipes-graphics/xorg-util/{gccmakedep_1.0.2.bb => gccmakedep_1.0.3.bb} (78%)
 rename meta/recipes-kernel/powertop/{powertop_2.5.bb => powertop_2.6.1.bb} (85%)

-- 
1.9.2


