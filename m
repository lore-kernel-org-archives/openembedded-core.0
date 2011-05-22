Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOHkl-0008VY-1i
	for openembedded-core@lists.openembedded.org;
	Mon, 23 May 2011 01:08:07 +0200
Received: by pwj9 with SMTP id 9so2454587pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 May 2011 16:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=11/LbKVtFuUgzdZOE7IaRsOqUX11zj2JkAlcSc2907s=;
	b=bOc29XI4LRn3rmTM1x+3iIye3lraz+Z9Z6ibFaLjAy3ciQqaORua2dioesoAwE1IjD
	8V9WRUg6/AR7g3fQ8TsNcLL7QXGln/+6+1UA7nWNxyjIHSB8eRxj3VYN10K+ZThlNhxm
	ScT+HUFD6QUBzwcHSvqTK1tHGBkZ5ChPkiWeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CW1xv9niqNBdsy8oEgsPPNdW9ltVdVMezR3ksbpUZZyCwh6EwAjKmVuKGyMGoltbMN
	6rRj2VrDXUNoRcMXyx5yvcp8tbFQxyAcns7Hkr4VQjGu3N6g4vAu27KwlKzcDmfwA/P8
	4P3cz2N9dc+NBpkALrBIiQDqHH5lsWoGcnI3M=
Received: by 10.68.20.38 with SMTP id k6mr1923222pbe.410.1306105498270;
	Sun, 22 May 2011 16:04:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p1sm3950004pbi.26.2011.05.22.16.04.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 May 2011 16:04:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 22 May 2011 16:04:38 -0700
Message-Id: <cover.1306105366.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Upgrade uclibc to 0.9.32rc3
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
X-List-Received-Date: Sun, 22 May 2011 23:08:07 -0000

This has been in meta-openembedded layer for a while
with this its moving into oe-core

The following changes since commit a0c3fd1eb23ef22932b938fc124bb17225eb85c4:

  uclibc: Upgrade to 0.9.32-rc3 (2011-05-22 12:02:12 -0700)

are available in the git repository at:
  git@git.openembedded.org:openembedded-core-contrib.git kraj/uclibc
  http://cgit.openembedded.org/cgit.cgi//log/?h=kraj/uclibc

Khem Raj (1):
  uclibc: Upgrade to 0.9.32-rc3

 .../uclibc/files/armeb-kernel-stat.h.patch         |  125 -
 .../recipes-core/uclibc/files/errno_values.h.patch |   21 -
 .../uclibc/files/kernel-key-t-ipc.h.patch          |   27 -
 .../uclibc/files/nokernelheadercheck.patch         |   24 -
 meta/recipes-core/uclibc/files/termios.h.patch     |   22 -
 meta/recipes-core/uclibc/files/uClibc.distro       |    3 -
 meta/recipes-core/uclibc/site_config/funcs         |    1 +
 .../uclibc/{uclibc-0.9.30.1 => }/uClibc.distro     |   23 +-
 ...Use-__always_inline-instead-of-__inline__.patch |  393 --
 .../uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch  |  218 -
 .../uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine  |   70 -
 .../uclibc/uclibc-0.9.30.1/armv6/uClibc.machine    |   70 -
 .../uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine   |   70 -
 .../uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch    |   31 -
 .../uclibc-0.9.30.1/linuxthreads-changes.patch     |  291 --
 .../uclibc/uclibc-0.9.30.1/pthread_atfork.patch    |   42 -
 .../uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t   |   69 -
 .../uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te  |   70 -
 .../uclibc-0.9.30.1/uClibc.machine.strongarm       |   70 -
 .../uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch     |  474 --
 .../uclibc-0.9.30.1/uclibc_ldso_use_O0.patch       |   13 -
 meta/recipes-core/uclibc/uclibc-config.inc         |  116 +
 .../uclibc/uclibc-git/argp-headers.patch           |  581 +++
 .../uclibc/uclibc-git/argp-support.patch           | 5189 ++++++++++++++++++++
 .../arm/uClibc.machine                             |    4 +-
 .../armeb/uClibc.machine}                          |   35 +-
 .../iwmmxt => uclibc-git/armv5te}/uClibc.machine   |   14 +-
 .../uclibc/uclibc-git/detect-bx-availibility.patch |   75 +
 .../uclibc/uclibc-git/efika/uClibc.machine         |   45 +
 .../x86 => uclibc-git/i386}/uClibc.machine         |   27 +-
 .../qemumips => uclibc-git/i486}/uClibc.machine    |   14 +-
 .../qemux86 => uclibc-git/i586}/uClibc.machine     |   14 +-
 .../qemumips => uclibc-git/i686}/uClibc.machine    |   25 +-
 .../uclibc/uclibc-git/include-arm-asm.h.patch      |   65 +
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    0
 .../qemux86 => uclibc-git/mips64}/uClibc.machine   |   49 +-
 .../armv4t => uclibc-git/mipsel}/uClibc.machine    |   46 +-
 .../armeb => uclibc-git/nslu2be}/uClibc.machine    |    5 +-
 .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 +
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |  107 +
 .../qemuarm/uClibc.machine                         |   12 +-
 .../qemux86 => uclibc-git/qemumips}/uClibc.machine |   49 +-
 .../qemumips => uclibc-git/qemux86}/uClibc.machine |   25 +-
 .../uclibc-git/remove-eabi-oabi-selection.patch    |   91 +
 .../uclibc-git/remove-sub-arch-variants.patch      |  215 +
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  186 +
 .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 +
 .../uclibc/uclibc-git/select-force-thumb.patch     |  172 +
 .../qemumips => uclibc-git/sh4}/uClibc.machine     |   50 +-
 .../uclibc-git/transform-eabi-oabi-choice.patch    |   71 +
 .../{uclibc-0.9.30.1 => uclibc-git}/uClibc.config  |    0
 .../{uclibc-0.9.30.1 => uclibc-git}/uClibc.distro  |   26 +-
 .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   13 +
 .../uclibc-git/uclibc_enable_log2_test.patch       |   30 +
 .../qemumips => uclibc-git/x86_64}/uClibc.machine  |   44 +-
 .../recipes-core/uclibc/uclibc-initial_0.9.30.1.bb |   31 -
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |   39 +
 meta/recipes-core/uclibc/uclibc.inc                |  284 +-
 meta/recipes-core/uclibc/uclibc_0.9.30.1.bb        |   33 -
 meta/recipes-core/uclibc/uclibc_git.bb             |   31 +
 60 files changed, 7487 insertions(+), 2571 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/files/armeb-kernel-stat.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/errno_values.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/kernel-key-t-ipc.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/nokernelheadercheck.patch
 delete mode 100644 meta/recipes-core/uclibc/files/termios.h.patch
 delete mode 100644 meta/recipes-core/uclibc/files/uClibc.distro
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1 => }/uClibc.distro (89%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/Use-__always_inline-instead-of-__inline__.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/arm-linuxthreads.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/armv5te/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/armv6/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/armv7a/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/linuxthreads-changes.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/pthread_atfork.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv4t
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.armv5te
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uClibc.machine.strongarm
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc-c99-ldbl-math.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.30.1/uclibc_ldso_use_O0.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-config.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/argp-headers.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/argp-support.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/arm/uClibc.machine (96%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/uClibc.machine.iwmmxt => uclibc-git/armeb/uClibc.machine} (65%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/iwmmxt => uclibc-git/armv5te}/uClibc.machine (84%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/x86 => uclibc-git/i386}/uClibc.machine (77%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/i486}/uClibc.machine (89%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemux86 => uclibc-git/i586}/uClibc.machine (88%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/i686}/uClibc.machine (82%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (100%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemux86 => uclibc-git/mips64}/uClibc.machine (57%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/armv4t => uclibc-git/mipsel}/uClibc.machine (56%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/armeb => uclibc-git/nslu2be}/uClibc.machine (92%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/qemuarm/uClibc.machine (85%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemux86 => uclibc-git/qemumips}/uClibc.machine (57%)
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/qemux86}/uClibc.machine (82%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
 copy meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/sh4}/uClibc.machine (50%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/uClibc.config (100%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1 => uclibc-git}/uClibc.distro (88%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.30.1/qemumips => uclibc-git/x86_64}/uClibc.machine (50%)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-initial_0.9.30.1.bb
 create mode 100644 meta/recipes-core/uclibc/uclibc-initial_git.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc_0.9.30.1.bb
 create mode 100644 meta/recipes-core/uclibc/uclibc_git.bb

-- 
1.7.4.1



