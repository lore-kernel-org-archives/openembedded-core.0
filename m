Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzcw-0005zp-W9
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:39:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721007"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:29:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:45 -0700
Message-Id: <cover.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/12] Subset of Pending Changes
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
X-List-Received-Date: Wed, 09 May 2012 05:39:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

I have looked these over and there have been some comments on
past version of Seebs' Sanity.bbclass but nothing on the current
version, but please review it.

Other changes have been built and run.

Sau!



The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:

  kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Eric Bénard (1):
  zlib: upgrade to 1.2.7

Khem Raj (4):
  libatomics-ops: Make it build for SH4
  qemu-git: Move to tip of git
  openssl: Fix build for mips64(el)
  classes/mirrors.bbclass: Point snapshot.debian.org mirror to working
    location

Nitin A Kamble (1):
  guile: upgrade from 2.0.3 to 2.0.5

Otavio Salvador (1):
  qt4-graphics-system: set graphic system in profile instead of X11
    session

Peter Seebach (2):
  sanity.bbclass: Implement initial toolchain sanity checks
  sanity.bbclass: Check for bogus values in BBCLASSEXTEND

Saul Wold (2):
  libpcap: Move pcap-config to -dev package
  h264_qpel_mmx.patch: fix Upstream-Status tag

Ting Liu (1):
  image_types.bbclass: redefine EXTRA_IMAGECMD_jffs2 to leverage
    siteinfo

 meta/classes/image_types.bbclass                   |    7 ++-
 meta/classes/mirrors.bbclass                       |    2 +-
 meta/classes/sanity.bbclass                        |   86 ++++++++++++++++++++
 meta/conf/documentation.conf                       |    6 ++
 meta/recipes-connectivity/libpcap/libpcap.inc      |    7 ++-
 .../openssl/openssl-1.0.0i/configure-targets.patch |   16 ++--
 .../recipes-connectivity/openssl/openssl_1.0.0i.bb |    2 +-
 .../remove.ldconfig.call.patch                     |    0
 .../zlib/{zlib_1.2.6.bb => zlib_1.2.7.bb}          |    6 +-
 ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 --------
 ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 ------
 ...-modules-are-removed-gc-test-as-unresolve.patch |   38 +++++++++
 ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 ------
 ...with-owner-not-retained-threads-test-as-u.patch |   33 ++++++++
 .../guile/files/guile_2.0.5_fix_sed_error.patch    |   24 ++++++
 .../guile/files/opensuse/guile-64bit.patch         |    3 +-
 .../files/opensuse/guile-turn-off-gc-test.patch    |    3 +-
 .../guile/{guile_2.0.3.bb => guile_2.0.5.bb}       |   16 ++--
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu_git.bb             |   18 +---
 .../gst-ffmpeg-0.10.13/h264_qpel_mmx.patch         |    2 +-
 .../libatomics-ops/gentoo/sh4-atomic-ops.patch     |   70 ++++++++++++++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    6 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   12 +--
 24 files changed, 309 insertions(+), 132 deletions(-)
 rename meta/recipes-core/zlib/{zlib-1.2.6 => zlib-1.2.7}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.6.bb => zlib_1.2.7.bb} (80%)
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0001-Fix-the-SRFI-60-copy-bit-documentation.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
 create mode 100644 meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
 create mode 100644 meta/recipes-devtools/guile/files/guile_2.0.5_fix_sed_error.patch
 rename meta/recipes-devtools/guile/{guile_2.0.3.bb => guile_2.0.5.bb} (84%)
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/gentoo/sh4-atomic-ops.patch

-- 
1.7.7.6



