Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 68CFA60809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 15:07:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8GF712S006910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 08:07:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 16 Sep 2014 08:07:00 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Sep 2014 23:06:21 +0800
Message-ID: <cover.1410879378.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org, jslater@windriver.com
Subject: [PATCH 0/9] V2: Add machine qemuaarch64
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
X-List-Received-Date: Tue, 16 Sep 2014 15:07:03 -0000
Content-Type: text/plain

V2:
* fix kernel linux-yocto build faiure
* redefine position of dynamic linker from /lib to /lib64
* other fixes of userspace packages

Test with Joe Slater's patches:
* siteinfo: account for 32 and 64 bit arm
* sysprof: add aarch64 support

The following changes since commit fceef0cace6670a8c5f15cd2f31a191176732730:

  bitbake: data_smart: Fix remove operator and its interaction with data expansion (2014-09-13 08:52:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/qemuarm64
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64

Kai Kang (9):
  linux-yocto: depend on libgcc for aarch64
  Add machine qemuarm64
  gcc-4.9: redefine dynamic linker for aarch64
  libatomics-ops: add aarch64 target iniitial support
  qt4-native: add aarch64 support
  qt4: add aarch64 support
  qt4-embedded: disable webkit
  libpng: add neon option for aarch64
  perf: disable libunwind support for aarch64

 meta/conf/bitbake.conf                             |   1 +
 meta/conf/machine/include/arm/arch-armv8.inc       |  20 +
 meta/conf/machine/qemuarm64.conf                   |  12 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 .../0056-redefine-dynamic-linker-for-aarch64.patch |  34 ++
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
 19 files changed, 1010 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/qemuarm64.conf
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0056-redefine-dynamic-linker-for-aarch64.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0029-aarch64_arm64_fix_arch_detection.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0030-aarch64_arm64_qatomic_support.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0031-aarch64_arm64_mkspecs.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0032-aarch64_add_header.patch

-- 
1.9.1


