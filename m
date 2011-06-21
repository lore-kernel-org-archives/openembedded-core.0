Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QZ5aH-000293-R3
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:21:57 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 21 Jun 2011
	20:18:23 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 20:18:09 +0200
Message-ID: <cover.1308680000.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [RFC PATCH 0/5] Linux 3.0 build support
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
X-List-Received-Date: Tue, 21 Jun 2011 18:21:57 -0000
Content-Type: text/plain

This work is unfinished and incomplete...
It is published in its current form both to get feedback, but also to aid
anyone else who is working on 3.0-support. If some of the patches are found to
be OK, it's fine to cherrypick them.

The kernel-related classes has been modified to build a 3.0 kernel. The
patches has been simplified by removing support for the 2.4-series. (The
latter was suggested in an older mail thread:
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg02682.html
).

The patches has been tested on linux-yocto_2.6.37 and a hacked version using
the linux-yocto-dev repository (using a 3.0-rcX). The latest versions has only
been built for qemuarm, prior iterations has also been built for qemux86.

Finally, no work has been done on the libc-linux-headers classes and recipes.

/Anders

Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 835d817f1ba7b99167743fdb86ba80f3a07bd82d:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:12:40 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core kernel-3.0
  https://github.com/darander/oe-core/tree/kernel-3.0

Anders Darander (5):
  Remove support for building 2.4 kernels
  module-init-tools-cross: add provides for depmod-3
  linux-kernel-base: add support for Linux 3.x
  modutils-initscripts: move recipe prior to modutils removal
  modutils: remove modutils

 meta/classes/kernel.bbclass                        |   22 ++---
 meta/classes/linux-kernel-base.bbclass             |    3 +
 meta/classes/module-base.bbclass                   |    2 +-
 .../{modutils => module-init-tools}/files/PD.patch |    0
 .../files/modutils.sh                              |    0
 .../module-init-tools-cross_3.12.bb                |    2 +-
 .../modutils-initscripts.bb                        |    0
 meta/recipes-kernel/modutils/files/armeb.patch     |   16 ----
 meta/recipes-kernel/modutils/files/configure.patch |   34 -------
 meta/recipes-kernel/modutils/files/gcc4.patch      |   93 --------------------
 meta/recipes-kernel/modutils/files/lex.l.diff      |   35 --------
 .../modutils/files/modutils-notest.patch           |   16 ----
 .../modutils/files/program_prefix.patch            |   71 ---------------
 .../recipes-kernel/modutils/modutils-collateral.bb |   21 -----
 .../modutils/modutils-cross/module.h.diff          |   35 --------
 .../modutils/modutils-cross_2.4.27.bb              |   20 ----
 meta/recipes-kernel/modutils/modutils_2.4.27.bb    |   93 --------------------
 17 files changed, 12 insertions(+), 451 deletions(-)
 rename meta/recipes-kernel/{modutils => module-init-tools}/files/PD.patch (100%)
 rename meta/recipes-kernel/{modutils => module-init-tools}/files/modutils.sh (100%)
 rename meta/recipes-kernel/{modutils => module-init-tools}/modutils-initscripts.bb (100%)
 delete mode 100644 meta/recipes-kernel/modutils/files/armeb.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/configure.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/gcc4.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/lex.l.diff
 delete mode 100644 meta/recipes-kernel/modutils/files/modules
 delete mode 100644 meta/recipes-kernel/modutils/files/modules.conf
 delete mode 100644 meta/recipes-kernel/modutils/files/modutils-notest.patch
 delete mode 100644 meta/recipes-kernel/modutils/files/program_prefix.patch
 delete mode 100644 meta/recipes-kernel/modutils/modutils-collateral.bb
 delete mode 100644 meta/recipes-kernel/modutils/modutils-cross/module.h.diff
 delete mode 100644 meta/recipes-kernel/modutils/modutils-cross_2.4.27.bb
 delete mode 100644 meta/recipes-kernel/modutils/modutils_2.4.27.bb

-- 
1.7.4.1



