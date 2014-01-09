Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B71476D1AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 06:58:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2014 22:54:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,629,1384329600"; d="scan'208";a="463953449"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.53])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2014 22:58:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 22:58:23 -0800
Message-Id: <cover.1389250526.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/14] Upgrades and some patches
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
X-List-Received-Date: Thu, 09 Jan 2014 06:58:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard, 

Mostly upgrade with a couple of patches, most notibly Chen's TMPDIR check

Thanks
	Sau!


The following changes since commit 1028ac813fa9803ebfff6bcfa7f8b67012609b27:

  sstate: add do_package to the noexec list in setscene_depvalid (2014-01-07 13:58:28 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (1):
  shadow: set correct entries for pseudo terminals in /etc/securetty

Chen Qi (3):
  sanity.bbclass: check for validity of TMPDIR
  busybox: enable SEAMLESS_XZ by default
  systemd: fix ptest to make it able to run on target

Chong Lu (2):
  tcl: enable ptest support
  beecrypt: add ptest support

Cristian Iorga (2):
  netbase: upgrade to 5.2
  qemu: upgrade to 1.7.0

Irina Patru (2):
  libtasn1: upgrade to 3.4
  libsoup-2.4: upgrade to 2.45.3

Paul Barker (1):
  libarchive: Upgrade to v3.1.2

Trevor Woerner (1):
  libxfont: upgrade to 1.4.7

Upgrade Helper (1):
  base-passwd: upgrade to 3.5.29

Yasir-Khan (1):
  lighttpd: add www/{logs,var} symlinks

 meta/classes/sanity.bbclass                        |  27 +++++-
 .../add_shutdown.patch                             |   0
 .../disable-docs.patch                             |   0
 .../input.patch                                    |   0
 .../nobash.patch                                   |   0
 ...base-passwd_3.5.28.bb => base-passwd_3.5.29.bb} |   4 +-
 meta/recipes-core/busybox/busybox/defconfig        |   2 +-
 .../netbase/{netbase_5.1.bb => netbase_5.2.bb}     |   4 +-
 meta/recipes-core/systemd/systemd/run-ptest        |   1 +
 meta/recipes-core/systemd/systemd_208.bb           |  12 ++-
 ...Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch |  92 ---------------------
 meta/recipes-devtools/qemu/qemu.inc                |   1 -
 .../qemu/{files => qemu}/disable-grabs.patch       |   0
 .../fix-libcap-header-issue-on-some-distro.patch   |   0
 .../qemu/{files => qemu}/fxrstorssefix.patch       |   0
 .../{files => qemu}/larger_default_ram_size.patch  |   0
 .../qemu/{files => qemu}/no-strip.patch            |   0
 .../qemu/{files => qemu}/powerpc_rom.bin           | Bin
 .../qemu/{qemu_1.6.1.bb => qemu_1.7.0.bb}          |   4 +-
 meta/recipes-devtools/tcltk/tcl/run-ptest          |   8 ++
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb           |  13 ++-
 .../0001-Patch-from-upstream-revision-1990.patch   |  42 ----------
 .../0002-Patch-from-upstream-revision-1991.patch   |  31 -------
 .../0004-Patch-from-upstream-rev-2514.patch        |  33 --------
 .../0005-Patch-from-upstream-rev-2520.patch        |  31 -------
 .../0006-Patch-from-upstream-rev-2521.patch        |  28 -------
 ...YS-error-when-setting-up-xattrs.-Closes-5.patch |  31 -------
 .../{libarchive_2.8.5.bb => libarchive_3.1.2.bb}   |  14 +---
 meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb  |   5 +-
 meta/recipes-extended/shadow/files/securetty       |  16 +---
 .../{libxfont_1.4.6.bb => libxfont_1.4.7.bb}       |   4 +-
 .../beecrypt/beecrypt-enable-ptest-support.patch   |  37 +++++++++
 meta/recipes-support/beecrypt/beecrypt/run-ptest   |   5 ++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  12 ++-
 .../gnutls/{libtasn1_3.3.bb => libtasn1_3.4.bb}    |   4 +-
 ...libsoup-2.4_2.44.2.bb => libsoup-2.4_2.45.3.bb} |   4 +-
 36 files changed, 131 insertions(+), 334 deletions(-)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.28 => base-passwd}/add_shutdown.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.28 => base-passwd}/disable-docs.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.28 => base-passwd}/input.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd-3.5.28 => base-passwd}/nobash.patch (100%)
 rename meta/recipes-core/base-passwd/{base-passwd_3.5.28.bb => base-passwd_3.5.29.bb} (96%)
 rename meta/recipes-core/netbase/{netbase_5.1.bb => netbase_5.2.bb} (84%)
 delete mode 100644 meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
 rename meta/recipes-devtools/qemu/{files => qemu}/disable-grabs.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/fix-libcap-header-issue-on-some-distro.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/fxrstorssefix.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu_1.6.1.bb => qemu_1.7.0.bb} (78%)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/run-ptest
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Patch-from-upstream-revision-1990.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0002-Patch-from-upstream-revision-1991.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Patch-from-upstream-rev-2514.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Patch-from-upstream-rev-2520.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0006-Patch-from-upstream-rev-2521.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0007-Ignore-ENOSYS-error-when-setting-up-xattrs.-Closes-5.patch
 rename meta/recipes-extended/libarchive/{libarchive_2.8.5.bb => libarchive_3.1.2.bb} (64%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.6.bb => libxfont_1.4.7.bb} (77%)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/beecrypt-enable-ptest-support.patch
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/run-ptest
 rename meta/recipes-support/gnutls/{libtasn1_3.3.bb => libtasn1_3.4.bb} (82%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.44.2.bb => libsoup-2.4_2.45.3.bb} (85%)

-- 
1.8.3.1


