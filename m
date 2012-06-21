Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShqSa-00016g-6m
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 01:06:44 +0200
Received: by pbbrq2 with SMTP id rq2so2657441pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 15:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kwcX4Pwe5WIDCuelI657z9FiFDQvb3Jy6iahIXQSUeg=;
	b=YIlXJkHaWrhHrXvOIr4GUpGsBg7Y0kMaCLbYJBX8UN/DR+Hyg6TyBIeyl2DMUEVYqs
	66ddnhzQo9LPUSFfVFjVbiDeA2dwtFlKuIf/YhiUhUn9qSFymuBz1QBtrLohoDYq2Ctw
	FKvtzdSzUhVMTO31gf54W2XMy/isRMeJzn0oD7qEMkkajkpENI2uTSDQ5KqXkHzHMsBD
	w7iY+fOhQdstCEgGMI8MXBS1PXo6MT9fUyAS0jsNgPJXHtRRa5XptceD5AsmEfPbzy9Y
	IzKVYJHDdEwFbaqAPU+TZkLLVzM8+HZYKY0+ANrNec4C4Jpgzh78iX8T6ft3hr8FQrkV
	PbfQ==
Received: by 10.68.213.7 with SMTP id no7mr3711769pbc.3.1340319356879;
	Thu, 21 Jun 2012 15:55:56 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ng8sm14565967pbc.13.2012.06.21.15.55.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 15:55:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2012 15:54:38 -0700
Message-Id: <cover.1340319020.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/5] Fix uclibc packaging and update qemu git recipe
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
X-List-Received-Date: Thu, 21 Jun 2012 23:06:44 -0000

This patchset does following

1. Fixes uclibc packaging issues that came after packaging order rework
2. Upgrades qemu git recipes to latest on qemu git/master
   This does not forward port any of the patches except the
   ROM thats required to boot ppc.
   This helps in using qemu for some of less uses architectures

3. Fix PACKAGECONFIG for qemu thats needed for qemu-git to work
   without gl patches
4. Adds recipes for kconfig-frontends which I have resent in another tree

The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:

  [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Khem Raj (5):
  kconfig-frontends: New recipe
  uclibc: Fix packaging to match the new package order
  qemu.inc: Fix packageconfig options
  qemu-git: Move to tip of git
  qemu_git: set empty PACKAGECONFIG

 meta/recipes-core/uclibc/uclibc.inc                |   28 ++++++++++---------
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   28 ++++++++++++++++++++
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |   19 ++++---------
 5 files changed, 50 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin

-- 
1.7.5.4



