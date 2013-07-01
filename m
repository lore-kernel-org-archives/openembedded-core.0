Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3A0246A463
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 04:02:39 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa11so4493332pad.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 21:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UeHCSo/qclgU6oeWnZuVxmyLUsQOJfJqr1LHYmj0f7M=;
	b=tp755olbr5AvDuDKM/e2tZnv0vZiLQ3D+6SxLL4UqM8AR8GBDOGAw5hxfKwJa9R6gt
	uwCNT/utu2UrOxozOWzpQY9tkASEV0NZtypKedWeRBoAMvqGGKHzD6je6l8Vtqoeg1Yg
	ApGhBZFfzjmIe4mOZPKBAID2Ox7YCPokJDXfO9Y8cQvbx3XnklgMlUKg6aPsj+sExkK+
	fNi2xZqVwc1bYCHrqRr78jruDVGLYFaOucQZ+HATPU+D7uu9QR693BQcslaCTu+hxNjX
	nd073JdfR9ehqeI+TiLfdCk2lBLP8IAqN1iJO6ACLXr1fFKzuy1PhO0ti9N785I/TjEX
	gQNg==
X-Received: by 10.66.20.129 with SMTP id n1mr15529486pae.93.1372651359980;
	Sun, 30 Jun 2013 21:02:39 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	kc8sm20017191pbc.18.2013.06.30.21.02.38 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 21:02:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2013 21:02:21 -0700
Message-Id: <cover.1372651136.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Update uclibc to latest git and drop 0.9.33
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
X-List-Received-Date: Mon, 01 Jul 2013 04:02:39 -0000

Tested booting on all supported qemu machines
uclibc git is needed for supporting systemd reliably

The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-update

Khem Raj (3):
  uclibc: Update to latest git/master version
  uclibc: Remove 0.9.33 recipes
  bison: Delete unused patch

 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |   23 -
 .../uclibc/uclibc-0.9.33/argp-headers.patch        |  583 ---
 .../uclibc/uclibc-0.9.33/argp-support.patch        | 5192 --------------------
 .../uclibc-0.9.33/compile-arm-fork-with-O2.patch   |   21 -
 .../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch    |   25 -
 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch  |   37 -
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   27 -
 .../libc_symbols_include_bits_uclibc_config.patch  |   23 -
 .../uclibc/uclibc-0.9.33/mount.h-update.patch      |   83 -
 .../uclibc/uclibc-0.9.33/orign_path.patch          |  185 -
 .../uclibc/uclibc-0.9.33/posix_fallocate.patch     |  407 --
 .../uclibc/uclibc-0.9.33/powerpc_copysignl.patch   |  113 -
 .../remove_attribute_optimize_Os.patch             |  179 -
 .../uclibc/uclibc-0.9.33/uClibc.distro             |  190 -
 .../uclibc/uclibc-0.9.33/uClibc.machine            |   14 -
 .../uclibc/uclibc-0.9.33/uclibc-execvpe.patch      |  163 -
 .../uclibc-0.9.33/uclibc_enable_log2_test.patch    |   35 -
 meta/recipes-core/uclibc/uclibc-config.inc         |   12 +
 meta/recipes-core/uclibc/uclibc-git.inc            |    8 +-
 .../0001-add-posix_fadvise-for-arm.patch           |   68 +
 .../0001-i386-sysdep.h-Remove-STABS_-macros.patch  |   71 -
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |    9 +-
 meta/recipes-core/uclibc/uclibc-git/locale.cfg     |    3 +
 meta/recipes-core/uclibc/uclibc-git/obstack.cfg    |    1 +
 .../uclibc/uclibc-git/powerpc_copysignl.patch      |   10 +-
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |   36 -
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |   22 -
 .../recipes-devtools/bison/bison/remove-gets.patch |   20 -
 29 files changed, 102 insertions(+), 7464 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33.inc
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/argp-headers.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/argp-support.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/compile-arm-fork-with-O2.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/mount.h-update.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/orign_path.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/powerpc_copysignl.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/remove_attribute_optimize_Os.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.distro
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uClibc.machine
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uclibc-execvpe.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/uclibc_enable_log2_test.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-i386-sysdep.h-Remove-STABS_-macros.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/locale.cfg
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/obstack.cfg
 delete mode 100644 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc_0.9.33.bb
 delete mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch

-- 
1.7.9.5


