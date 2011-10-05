Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBXUl-0007Q8-Ll
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:51:11 +0200
Received: by pzd13 with SMTP id 13so5232617pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zqToAESxiSltz9JxvKGbPoThChaNU3w/pwdfh2lIP7I=;
	b=vlpHi3Pk43+AFhrir5ooSkzwdXO9C6GI4+Wqj30mRN33NKyDLFC/HW5oNXUdozHb1A
	sY8hl9itiNXcvfiMLQjeKC2mkUBaJ7wMHXm5/nhfw0EWWLAsLtRj/diC5sMUKqXUIvAQ
	sZMvXGDgzP9PidUlFtxwGrnKHyRGHoGEx/32w=
Received: by 10.68.19.34 with SMTP id b2mr20912965pbe.60.1317843929161;
	Wed, 05 Oct 2011 12:45:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h5sm10640434pbf.4.2011.10.05.12.45.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 12:45:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2011 12:45:24 -0700
Message-Id: <cover.1317843784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] QEMU 0.15 update please test
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
X-List-Received-Date: Wed, 05 Oct 2011 19:51:11 -0000

This brings in qemu-0.15 into OE-core I have had limited testing
on it and mainly on qemuarm. Please help testing it on other architectures
I will also work on getting it more solidified and bring some backports
as needed.

The following changes since commit abde9f65b1617ec61e964c4b3502fd4ad2215dcf:

  shared-mime-info: Upgrade recipes from 0.90 -> 0.91 (2011-10-05 12:39:47 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/qemu-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-update

Khem Raj (1):
  qemu-0.15: Add recipe and forward port patches from 0.14

 .../qemu/qemu-0.15.0/arm-bgr.patch                 |   30 +
 .../qemu/qemu-0.15.0/enable-i386-linux-user.patch  |   55 +
 .../fallback-to-safe-mmap_min_addr.patch           |   39 +
 .../qemu/qemu-0.15.0/fix-configure-checks.patch    |   22 +
 .../qemu/qemu-0.15.0/fix-nogl.patch                |  127 +
 .../qemu/qemu-0.15.0/glflags.patch                 |   15 +
 .../qemu/qemu-0.15.0/init-info.patch               |   18 +
 .../qemu/qemu-0.15.0/larger_default_ram_size.patch |   22 +
 .../qemu/qemu-0.15.0/linker-flags.patch            |   25 +
 .../qemu/qemu-0.15.0/no-strip.patch                |   15 +
 .../qemu/qemu-0.15.0/opengl-sdl-fix.patch          |   43 +
 .../qemu/qemu-0.15.0/powerpc_rom.bin               |  Bin 0 -> 4096 bytes
 .../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch    |34368 ++++++++++++++++++++
 .../qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch   |  118 +
 .../qemugl-allow-glxcontext-release.patch          |   65 +
 .../qemu/qemu-0.15.0/qemugl-fix.patch              |   74 +
 meta/recipes-devtools/qemu/qemu_0.15.0.bb          |   45 +
 17 files changed, 35081 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/glflags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/init-info.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/no-strip.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_rom.bin
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu_0.15.0.bb

-- 
1.7.5.4



