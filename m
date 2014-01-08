Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39FE96CEE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 16:27:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jan 2014 08:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,625,1384329600"; d="scan'208";a="455528051"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2014 08:26:59 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 18:29:39 +0200
Message-Id: <cover.1389198449.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH v2 0/2] Various PUs
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
X-List-Received-Date: Wed, 08 Jan 2014 16:27:08 -0000

V2 patchset contains a small change in qemu package:
files directory has been renamed to qemu.

The following changes since commit 854daab404a23e4ebb6107d737d9cfd5a0e5548b:

  bitbake: gitannex: Add missing file from previous commit (2014-01-08 13:07:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  netbase: upgrade to 5.2
  qemu: upgrade to 1.7.0

 .../netbase/{netbase_5.1.bb => netbase_5.2.bb}     |   4 +-
 ...Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch |  92 ---------------------
 meta/recipes-devtools/qemu/qemu.inc                |   1 -
 .../qemu/{files => qemu}/disable-grabs.patch       |   0
 .../fix-libcap-header-issue-on-some-distro.patch   |   0
 .../qemu/{files => qemu}/fxrstorssefix.patch       |   0
 .../{files => qemu}/larger_default_ram_size.patch  |   0
 .../qemu/{files => qemu}/no-strip.patch            |   0
 .../qemu/{files => qemu}/powerpc_rom.bin           | Bin
 .../qemu/{qemu_1.6.1.bb => qemu_1.7.0.bb}          |   4 +-
 10 files changed, 4 insertions(+), 97 deletions(-)
 rename meta/recipes-core/netbase/{netbase_5.1.bb => netbase_5.2.bb} (84%)
 delete mode 100644 meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
 rename meta/recipes-devtools/qemu/{files => qemu}/disable-grabs.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/fix-libcap-header-issue-on-some-distro.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/fxrstorssefix.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{files => qemu}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu_1.6.1.bb => qemu_1.7.0.bb} (78%)

-- 
1.8.3.2


