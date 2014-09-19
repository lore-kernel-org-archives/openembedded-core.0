Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D0CDA7143F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 09:32:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8J9WRKv004505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Sep 2014 02:32:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Fri, 19 Sep 2014 02:32:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Fri, 19 Sep 2014 17:21:04 +0800
Message-ID: <cover.1411117403.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] V3: Add machine qemuaarch64
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
X-List-Received-Date: Fri, 19 Sep 2014 09:32:31 -0000
Content-Type: text/plain

According to Khem and Mark's comments, I send V3. 

Update:
* keep dynamic linker in directory /lib, and redefine library install directory from /lib64 to /lib
* Use _remove to simpilify perf patch

The following changes since commit 280b6d0011f101e7a8edabd34c265b37a2f791ed:

  sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2014-09-17 22:00:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemuarm64
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64

Kai Kang (9):
  linux-yocto: depend on libgcc for aarch64
  Add machine qemuarm64
  gcc-4.9: redefine default library install directory
  libatomics-ops: add aarch64 target iniitial support
  qt4-native: add aarch64 support
  qt4: add aarch64 support
  qt4-embedded: disable webkit
  libpng: add neon option for aarch64
  perf: disable libunwind support for aarch64

 meta/conf/machine/include/arm/arch-armv8.inc       |  20 +
 meta/conf/machine/qemuarm64.conf                   |  12 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 ...0056-gcc-redefine-library-dir-for-aarch64.patch |  29 ++
 meta/recipes-kernel/linux/linux-yocto.inc          |   1 +
 meta/recipes-kernel/perf/perf-features.inc         |   1 +
 meta/recipes-multimedia/libpng/libpng_1.6.13.bb    |   1 +
 .../0001-libatomic_ops-Aarch64-basic-port.patch    | 239 ++++++++++
 .../pulseaudio/libatomics-ops_7.2.bb               |   1 +
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   4 +
 .../0029-aarch64_arm64_fix_arch_detection.patch    |  53 +++
 .../0030-aarch64_arm64_qatomic_support.patch       | 491 +++++++++++++++++++++
 .../qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch | 124 ++++++
 .../qt4/qt4-4.8.6/0032-aarch64_add_header.patch    |  18 +
 meta/recipes-qt/qt4/qt4-embedded_4.8.6.bb          |   1 +
 meta/recipes-qt/qt4/qt4-native.inc                 |   4 +
 meta/recipes-qt/qt4/qt4-x11-free_4.8.6.bb          |   3 +
 meta/recipes-qt/qt4/qt4_arch.inc                   |   1 +
 18 files changed, 1004 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/qemuarm64.conf
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-gcc-redefine-library-dir-for-aarch64.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch

-- 
1.9.1


