Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SH6s4-0007rk-Lu
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 07:10:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2012 22:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151367375"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2012 22:01:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Apr 2012 22:01:04 -0700
Message-Id: <cover.1333914345.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 0/6] Various Patches
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
X-List-Received-Date: Mon, 09 Apr 2012 05:10:32 -0000

Richard,

This is a set patches to address various 1.2 bugs along with
a change to the create-pull-request script from Darren.

Please review the package.bbclass change, seems correct to me.

Thanks
	Sau!

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=oe-mut

Andrei Gherzan (1):
  package.bbclass: needs_ldconfig from linux_so is needed in global
    namespace

Darren Hart (2):
  create-pull-request: Assume remote branch from local branch
  grub-efi: Include GPT partition EXT FS support

Joshua Lock (1):
  mesa-common: package gl.pc in libgl-dev

Lianhao Lu (1):
  python: multilib header support.

Zhai Edwin (1):
  qemu: Fix gl failure from 64b target on 32b host

 meta/classes/package.bbclass                       |    4 +-
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    4 +-
 .../python/python-2.7-manifest.inc                 |    2 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    4 +-
 .../qemu/qemu-0.15.1/opengl-args-copy-fix.patch    |   66 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    3 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 scripts/create-pull-request                        |   11 +++-
 10 files changed, 88 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/opengl-args-copy-fix.patch

-- 
1.7.7.6



