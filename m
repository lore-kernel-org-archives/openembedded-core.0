Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U3bCd-00050f-P3
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 00:48:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r17NWYfZ027215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Feb 2013 15:32:34 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 7 Feb 2013 15:32:33 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2013 17:59:21 -0600
Message-ID: <cover.1360270255.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 00/11] Various fixes for master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 23:48:28 -0000
Content-Type: text/plain

Various fixes that apply to master.

The following changes since commit 688e9485980de0f29aa00e24ce53a3efd3a3a7cc:

    qemu.bbclass: fix segfaults when running through pseudo

are available in the git repository at:

    git://git.yoctoproject.org/poky-contrib mhatle/wr-master

Jackie Huang (1):
  populate_sdk_base.bbclass: add execution permission for
    self-extracting archive

Jason Wessel (1):
  eglibc-nativesdk: Fix buffer overrun with a relocated SDK

Jesse Zhang (6):
  ghostscript: add pregenerated objarch for mipsel/mips64/mips64el
  libart-lgpl: add art_config for mips64/mips64el
  ghostscript: fix endianness detection
  coreutils: remove dependency on coreutils-native
  initscripts: Add status function to /etc/init.d/functions
  udev: Add start/stop/status/restart support to init script

Jim Somerville (1):
  rt-tests: fix cyclictest reported 1 sec latencies

Randy MacLeod (1):
  openssl: Add mips64 configure support.

Xin Ouyang (1):
  libcgroup: fix failure for absolute path

 meta/classes/populate_sdk_base.bbclass             |   3 +
 meta/recipes-connectivity/openssl/openssl.inc      |   3 +
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   3 +-
 .../eglibc-2.17/relocatable_sdk_fix_openpath.patch |  41 ++++++++
 meta/recipes-core/eglibc/eglibc_2.17.bb            |   3 +-
 .../initscripts/initscripts-1.0/functions          |  15 +++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |   2 +-
 meta/recipes-core/libcgroup/libcgroup_0.38.bb      |   5 +-
 meta/recipes-core/udev/udev/init                   | 113 ++++++++++++---------
 meta/recipes-core/udev/udev_182.bb                 |   2 +-
 .../ghostscript-9.05-NOT-check-endian.patch        |  40 ++------
 .../ghostscript/ghostscript/mips/objarch.h         |   2 +-
 .../ghostscript/ghostscript/mips64/objarch.h       |  40 ++++++++
 .../ghostscript/ghostscript/mips64el/objarch.h     |  40 ++++++++
 .../ghostscript/ghostscript/mipsel/objarch.h       |  40 ++++++++
 .../ghostscript/ghostscript_9.05.bb                |   9 +-
 .../gnome/libart-lgpl/mips64/art_config.h          |  10 ++
 .../gnome/libart-lgpl/mips64el/art_config.h        |  10 ++
 ...st-finish-removal-of-1-second-first-loops.patch |  58 +++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |   3 +-
 20 files changed, 352 insertions(+), 90 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.17/relocatable_sdk_fix_openpath.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips64el/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsel/objarch.h
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips64/art_config.h
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/mips64el/art_config.h
 create mode 100644 meta/recipes-rt/rt-tests/files/cyclictest-finish-removal-of-1-second-first-loops.patch

-- 
1.8.1.2.545.g2f19ada



