Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 48E9771AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:41 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 71C48DB0C1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 13:47:37 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 23 Nov 2016 13:47:40 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 13:47:26 +0000
Message-ID: <20161123134733.38276-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch 0/7] MIPS: sprinkle some patches
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
X-List-Received-Date: Wed, 23 Nov 2016 13:47:42 -0000
Content-Type: text/plain

I'm running bitbake -k world using poky for various machine
configurations from https://github.com/MIPS/meta-img

Here are some patches

Regards,
ZubairLK

Zubair Lutfullah Kakakhel (7):
  webkitgtk: Use MIPS MACHINE_OVERRIDES
  qemu: Disable qemu on target for MIPS
  valgrind: Use MIPS MACHINE_OVERRIDES
  python-numpy: Use MIPS MACHINE_OVERRIDES to reduce duplication
  gmp: Disable assembly for MIPS R6
  perf: Add EXTRA_LDFLAGS for MIPS N32
  ghostscript: Use MIPS MACHINE_OVERRIDES for objarch.h

 .../{mips64n32 => mipsarchn32eb}/_numpyconfig.h    |   0
 .../files/{mips64 => mipsarchn32eb}/config.h       |   0
 .../files/mipsarchn32el/_numpyconfig.h             |  31 +++++
 .../python-numpy/files/mipsarchn32el/config.h      | 138 +++++++++++++++++++++
 .../files/{mips64 => mipsarchn64eb}/_numpyconfig.h |   0
 .../files/{mips64n32 => mipsarchn64eb}/config.h    |   0
 .../files/mipsarchn64el/_numpyconfig.h             |  32 +++++
 .../python-numpy/files/mipsarchn64el/config.h      | 138 +++++++++++++++++++++
 .../files/{mips => mipsarcho32eb}/_numpyconfig.h   |   0
 .../files/{mips => mipsarcho32eb}/config.h         |   0
 .../files/{mipsel => mipsarcho32el}/config.h       |   0
 .../files/{mipsel => mipsarcho32el}/numpyconfig.h  |   0
 .../python-numpy/python-numpy_1.11.2.bb            |  16 ++-
 .../python-numpy/python3-numpy_1.11.2.bb           |  16 ++-
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   3 +-
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   7 +-
 .../{mips64 => mipsarchn32eb}/objarch.h            |   0
 .../{mips64el => mipsarchn32el}/objarch.h          |   0
 .../{mips64n32 => mipsarchn64eb}/objarch.h         |   0
 .../{mips64eln32 => mipsarchn64el}/objarch.h       |   0
 .../ghostscript/{mips => mipsarcho32eb}/objarch.h  |   0
 .../{mipsel => mipsarcho32el}/objarch.h            |   0
 meta/recipes-kernel/perf/perf.bb                   |   7 ++
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb       |   6 +-
 meta/recipes-support/gmp/gmp_6.1.1.bb              |   1 +
 25 files changed, 381 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/python-numpy/files/{mips64n32 => mipsarchn32eb}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mips64 => mipsarchn32eb}/config.h (100%)
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
 rename meta/recipes-devtools/python-numpy/files/{mips64 => mipsarchn64eb}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mips64n32 => mipsarchn64eb}/config.h (100%)
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
 rename meta/recipes-devtools/python-numpy/files/{mips => mipsarcho32eb}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mips => mipsarcho32eb}/config.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mipsel => mipsarcho32el}/config.h (100%)
 rename meta/recipes-devtools/python-numpy/files/{mipsel => mipsarcho32el}/numpyconfig.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64 => mipsarchn32eb}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64el => mipsarchn32el}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64n32 => mipsarchn64eb}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips64eln32 => mipsarchn64el}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mips => mipsarcho32eb}/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/ghostscript/{mipsel => mipsarcho32el}/objarch.h (100%)

-- 
2.10.2


