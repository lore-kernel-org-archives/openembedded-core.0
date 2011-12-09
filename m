Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6GH-00071o-Pz
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:37:38 +0100
Received: by iadj38 with SMTP id j38so4678110iad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ka7Vtxb218wtjKyHYoncDgltB387K5/ztoVdo2wofUQ=;
	b=OEAzTg1Pn0uqrUAb2tSfiZS0pDNwGQx22TXoBwRD3GorRhGoYR7BF9VHU/4AgrRLnc
	he9Wlpl6icxxk/M4fSnEQucQLHPhyc3o1heoVm6cDJiZ5+uWfaanV6PrVj+C+fNcEtH1
	RG9qo/AA1Z/5fBw8fRvLz26jgInsZX57VWU4Y=
Received: by 10.42.137.197 with SMTP id z5mr4040401ict.5.1323459042636;
	Fri, 09 Dec 2011 11:30:42 -0800 (PST)
Received: from localhost.localdomain (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ew6sm19306820igc.4.2011.12.09.11.30.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 11:30:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 11:30:35 -0800
Message-Id: <cover.1323458858.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/3] Update QEMU and add support for eglibc testing
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
X-List-Received-Date: Fri, 09 Dec 2011 19:37:38 -0000

Minor release 0.15.1 of 0.15 branch is available for QEMU

Generate a testing script to help with eglibc cross testing

Add nfs-utils-client to nfs-server package group so when we
have server, we can also have client, helps in eglibc cross testing

The following changes since commit 86d174648b0fe770ac0dddbee08ecfd94cc13ec8:

  eglibc: Generate cross testing script during install (2011-12-09 11:24:43 -0800)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-testing

Khem Raj (3):
  qemu-0.15.1: Bump recipes from 0.15.0 to 0.15.1
  task-core-nfs: Add nfs-utils-client to RDEPENDS
  eglibc: Generate cross testing script during install

 meta/recipes-core/eglibc/eglibc-common.inc         |    1 -
 meta/recipes-core/eglibc/eglibc-package.inc        |   46 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb            |    2 +-
 meta/recipes-core/tasks/task-core-nfs.bb           |    6 ++-
 .../{qemu-0.15.0 => qemu-0.15.1}/arm-bgr.patch     |    0
 .../enable-i386-linux-user.patch                   |    0
 .../fallback-to-safe-mmap_min_addr.patch           |    0
 .../fix-configure-checks.patch                     |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/fix-nogl.patch    |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/glflags.patch     |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/init-info.patch   |    0
 .../larger_default_ram_size.patch                  |    0
 .../linker-flags.patch                             |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/no-strip.patch    |    0
 .../opengl-sdl-fix.patch                           |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/powerpc_rom.bin   |  Bin 4096 -> 4096 bytes
 .../qemu-git-qemugl-host.patch                     |    0
 .../qemu-vmware-vga-depth.patch                    |    0
 .../qemugl-allow-glxcontext-release.patch          |    0
 .../{qemu-0.15.0 => qemu-0.15.1}/qemugl-fix.patch  |    0
 .../qemu/{qemu_0.15.0.bb => qemu_0.15.1.bb}        |    6 +--
 22 files changed, 54 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/arm-bgr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/enable-i386-linux-user.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fallback-to-safe-mmap_min_addr.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fix-configure-checks.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/fix-nogl.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/glflags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/init-info.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/larger_default_ram_size.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/linker-flags.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/no-strip.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/opengl-sdl-fix.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/powerpc_rom.bin (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemu-git-qemugl-host.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemu-vmware-vga-depth.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemugl-allow-glxcontext-release.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu-0.15.0 => qemu-0.15.1}/qemugl-fix.patch (100%)
 rename meta/recipes-devtools/qemu/{qemu_0.15.0.bb => qemu_0.15.1.bb} (88%)

-- 
1.7.5.4



