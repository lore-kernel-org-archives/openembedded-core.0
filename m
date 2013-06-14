Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4B76A48E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 22:09:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jun 2013 15:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,868,1363158000"; d="scan'208";a="353687609"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.161])
	by orsmga002.jf.intel.com with ESMTP; 14 Jun 2013 15:09:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2013 15:09:37 -0700
Message-Id: <cover.1371247630.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/23] End of week wrap-up
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
X-List-Received-Date: Fri, 14 Jun 2013 22:09:37 -0000

Rchard,

Here is a batch of chanegs that I have tested in the autobuilder
and locally.

I will be out next week, but will catch things up after the 24th 
when I am back.

Sau!


The following changes since commit d2e0adc9720b66f56439c574520a1d58eaf0426f:

  documentation.conf: Drop variables for class that no longer exists in OE-Core (2013-06-14 14:50:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Diego Rondini (1):
  licences: Add SGI license

Jackie Huang (1):
  libcap: do not pass CFLAGS to gcc

Kevin Strasser (3):
  dhcp: drop fixincludes.patch
  dhcp: drop noattrmode.patch
  archiver.bbclass: check if package contains a copyleft license

Khem Raj (1):
  webkit-gtk: Support build on mips64

Muhammad Shakeel (1):
  openssl: Add fix for cipher des-ede3-cfb1

Ross Burton (11):
  at-spi2: add -core and -atk, for GTK+ 3.8
  gtk+3: update to 3.8.2
  gtk+3: explicitly disable introspection
  gtk+3: respect x11 and wayland DISTRO_FEATURES
  gtk+3: add dependencies for gtk+3-demo
  gtk+: remove spurious libgcrypt dependency
  gtk+3: register GSetting schemas
  gtk+3: split into .bb/.inc
  gtk+3: clean up libtool link creation to avoid errors in configure log
  gtk+3: fix repainting under Weston 1.1
  atk: inherit gnomebase

Roy.Li (4):
  bind: backport six CVE patches
  openssh: fix a unaligned memory access issue
  openssh: obey 'tcp-wrappers' PACKAGECONFIG
  directfb:filter out -fno-omit-frame-pointer option on x86 arch

Saul Wold (1):
  oe-buildenv-internal: exit -> return so the shell does not exit

 meta/classes/archiver.bbclass                      |   5 +-
 meta/conf/licenses.conf                            |   5 +-
 meta/files/common-licenses/SGI-1                   |  36 +++
 .../bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch | 119 +++++++++
 .../bind/bind-9.8.1/bind-CVE-2011-4313.patch       |  89 +++++++
 .../bind/bind-9.8.1/bind-CVE-2012-1667.patch       |  92 +++++++
 .../bind/bind-9.8.1/bind-CVE-2012-3817.patch       |  40 +++
 .../bind/bind-9.8.1/bind-CVE-2013-2266.patch       |  41 +++
 .../bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch   | 141 ++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |   6 +
 .../dhcp/dhcp/fixincludes.patch                    |  12 -
 .../dhcp/dhcp/noattrmode.patch                     |  21 --
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb    |   3 +-
 .../openssh/openssh-6.2p2/mac.patch                |  76 ++++++
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   4 +
 .../openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch  |  22 ++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +
 meta/recipes-gnome/gtk+/gtk+.inc                   |   2 +-
 .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |  33 ++-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          | 293 ---------------------
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |  32 +++
 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |  42 +++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |  17 ++
 meta/recipes-graphics/directfb/directfb.inc        |   4 +
 .../0001-Enable-mips64-build.patch                 |  69 +++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   1 +
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |  19 ++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |  17 ++
 meta/recipes-support/atk/atk_2.8.0.bb              |   9 +-
 meta/recipes-support/libcap/libcap.inc             |   4 +-
 scripts/oe-buildenv-internal                       |   4 +-
 31 files changed, 903 insertions(+), 356 deletions(-)
 create mode 100644 meta/files/common-licenses/SGI-1
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.2p2/mac.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/fix-cipher-des-ede3-cfb1.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
 create mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb

-- 
1.8.1.4


