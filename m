Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QeCvY-0005Tw-KS
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 23:13:04 +0200
Received: by iwn4 with SMTP id 4so6024491iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZyQDF+LBwpFG2kA/kRx8lQCIxxmp3uwBBVl4nA8ct4w=;
	b=OO7pgyNRpNC2JrSVqZxnkREDPSFQ0Quu1uiMTFzxG8AVIMjra4lLihSajaPxzwrHY9
	QRf9IjSZPcMxm09joDlUAs4ry5ipypraj1NCUvJBcwAJxlAKtwdBI82j7ZQy+caNUApB
	/lNUs5pJAmip63vBLbFocMacRh3cPwqMHbU+0=
Received: by 10.43.134.134 with SMTP id ic6mr8260128icc.108.1309900154080;
	Tue, 05 Jul 2011 14:09:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m18sm435913ibc.28.2011.07.05.14.09.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 14:09:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 14:09:06 -0700
Message-Id: <cover.1309899985.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/5] Add recipes for 0.9.32 release
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
X-List-Received-Date: Tue, 05 Jul 2011 21:13:04 -0000

With this changeset we add new recipes for 0.9.32 and make that default
preference. Then the git recipe are moved to track the latest master.
systemd related fixes are separately applied to both git recipe and 0.9.32
recipes

Both sets work for arm,mips,ppc,x86,x86-64

Thanks
-Khem


The following changes since commit 4eb3abaa5f4b5df0314dc0d503298d65cd203259:

  uclibc-0.9.32: Implement execvpe and refresh scheduler functions (2011-07-05 13:53:05 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-0.9.32
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-0.9.32

Khem Raj (5):
  uclibc: Add recipes for 0.9.32 release
  tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
  uclibc_git: Move SRCREV past 0.9.32 release
  uclibc_git: Implement execvpe and refresh scheduler functions
  uclibc-0.9.32: Implement execvpe and refresh scheduler functions

 meta/conf/distro/include/tcmode-default.inc        |    3 +
 ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |    0
 ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |    0
 .../uclibc/uclibc-0.9.32/argp-headers.patch        |  581 +++
 .../uclibc/uclibc-0.9.32/argp-support.patch        | 5189 ++++++++++++++++++++
 .../uclibc-0.9.32/compile-arm-fork-with-O2.patch   |   21 +
 .../detect-bx-availibility.patch                   |    0
 .../epoll-asm-fix.patch                            |    0
 .../include-arm-asm.h.patch                        |    0
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   21 +
 .../uclibc/uclibc-0.9.32/mips/uClibc.machine       |   16 +
 .../uclibc/uclibc-0.9.32/orign_path.patch          |  183 +
 .../uclibc/uclibc-0.9.32/powerpc_copysignl.patch   |  107 +
 .../remove-eabi-oabi-selection.patch               |    0
 .../remove-sub-arch-variants.patch                 |    0
 .../remove_attribute_optimize_Os.patch             |  186 +
 .../uclibc/uclibc-0.9.32/rtld_no.patch             |  215 +
 .../select-force-thumb.patch                       |    0
 .../transform-eabi-oabi-choice.patch               |    0
 .../uclibc/uclibc-0.9.32/uClibc.distro             |  184 +
 .../uclibc/uclibc-0.9.32/uClibc.machine            |   14 +
 .../uclibc-0.9.32/uclibc-arm-ftruncate64.patch     |   13 +
 .../uclibc/uclibc-0.9.32/uclibc-execvpe.patch      |  160 +
 .../uclibc-0.9.32/uclibc_enable_log2_test.patch    |   30 +
 .../uclibc-0.9.32/uclibc_scheduler_update.patch    |  455 ++
 .../uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch    |   33 -
 .../uclibc/uclibc-git/orign_path.patch             |   42 +-
 .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 -
 meta/recipes-core/uclibc/uclibc-git/rtld_no.patch  |   83 +-
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    3 +
 .../uclibc/uclibc-git/uclibc-execvpe.patch         |  160 +
 .../uclibc-git/uclibc_scheduler_update.patch       |  455 ++
 meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb  |   39 +
 meta/recipes-core/uclibc/uclibc_0.9.32.bb          |   32 +
 meta/recipes-core/uclibc/uclibc_git.bb             |   23 +-
 35 files changed, 8139 insertions(+), 181 deletions(-)
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch (100%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/argp-headers.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/argp-support.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/compile-arm-fork-with-O2.patch
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/detect-bx-availibility.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/epoll-asm-fix.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/include-arm-asm.h.patch (100%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mips/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/orign_path.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/powerpc_copysignl.patch
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/remove-eabi-oabi-selection.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/remove-sub-arch-variants.patch (100%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove_attribute_optimize_Os.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/select-force-thumb.patch (100%)
 rename meta/recipes-core/uclibc/{uclibc-git => uclibc-0.9.32}/transform-eabi-oabi-choice.patch (100%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.distro
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uClibc.machine
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-execvpe.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_enable_log2_test.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc-execvpe.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-initial_0.9.32.bb
 create mode 100644 meta/recipes-core/uclibc/uclibc_0.9.32.bb

-- 
1.7.4.1



