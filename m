Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E1F3B6B4F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 06:19:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2014 23:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1001,1392192000"; d="scan'208";a="552449958"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.194])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2014 23:18:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jun 2014 23:18:55 -0700
Message-Id: <cover.1402294655.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [Consolidated Pull 00/15] Patches & updates
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
X-List-Received-Date: Mon, 09 Jun 2014 06:19:17 -0000

Richard,

Here is a set up patches and updates that have been run through
the AB and tested locally.

Please merge as you see fit.

Thanks
	Sau!


The following changes since commit a3ee9cc7aebaecfa2223552a2c1865a9337de664:

  wic: check if BBLAYERS is valid before use (2014-06-06 10:29:22 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Chen Qi (1):
  gawk: fix libexec of the old 3.1.5 version

Chong Lu (2):
  oprofile: Add PTEST regression testing to oprofile
  nfs-utils: unset CFLAGS for testlk build

Corneliu Stoicescu (1):
  oeqa/utils/commands.py: add support for postconfig option

Hongxu Jia (1):
  libgcrypt: workaround ICE failure on mips with '-O -g'

Kai Kang (1):
  xorg-font-common.inc: remove shell debug option

Martin Jansa (1):
  update-rc.d: Allow to use different initscripts provider

Robert Yang (1):
  libgcrypt: fix do_configure failed

Ross Burton (3):
  gawk: fix module paths
  gawk: remove dgawk and pgawk packages, merge gawk-common into gawk
  mesa: add build-dependency on libxml2-native

Shan Hai (1):
  oe-core/init-install.sh: do not overwrite /etc/mtab if the link
    already exist

Valentin Popa (2):
  mesa: upgrade to 10.1.3
  xorg-xserver: enable dri3 by default

yanjun.zhu (1):
  python-gst: link python shared library to config directory

 meta/classes/update-rc.d.bbclass                   |  3 +-
 meta/lib/oeqa/utils/commands.py                    | 31 +++++--
 .../nfs-utils-unset-CFLAGS-for-testlk-build.patch  | 31 +++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  4 +-
 .../initrdscripts/files/init-install.sh            |  4 +-
 meta/recipes-devtools/python/python-gst_0.10.22.bb |  6 ++
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |  4 +-
 meta/recipes-extended/gawk/gawk_4.1.1.bb           | 12 +--
 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                | 38 ++++++---
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |  4 +-
 .../xorg-font/xorg-font-common.inc                 |  1 -
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  3 +-
 meta/recipes-kernel/oprofile/oprofile.inc          | 31 ++++++-
 .../oprofile/oprofile-cross-compile-tests.patch    | 98 ++++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile/run-ptest    | 18 ++++
 ...x-ICE-failure-on-mips-with-option-O-and-g.patch | 71 ++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |  6 +-
 19 files changed, 322 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest
 create mode 100644 meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch

-- 
1.8.3.1


