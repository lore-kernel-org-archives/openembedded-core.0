Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5F52073D44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 14:26:34 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so103924536pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=APOPnYZ8ygiqJmo0x6jOucmEYMmREK4WgCMF5LtokA4=;
	b=ciM6GxsxThxo/UAVyFHRmFES6LwMKDPi21MlXh49StUgY3pznjWaQ2sWd0k5V4tvyy
	R1R38RYOQ9BoLuAMuytpmswrxowYtbXUQV6ssbwNDBH1+IGN6yuCzNODmUSAy3FokdZD
	Ppo8SeHfIQjb/7O8lBZTIRh9+Z8CAwLK1u0qacLeCEi7tKZvwdUIbOlrdex/iKmK8pun
	jGaGzMRd88Zn+dz0XfiY3RAMZOdU2eEKnM4v6BwrbHOlQIigXq2JiIuYlbR/pDga52sR
	cGaMN9/5KJGGmxXgEoddCTFHhu9/zurU/iGeVgph0pBYDjcIoi7px4O5FLV8ylhdKZSn
	Vd8g==
X-Received: by 10.70.126.225 with SMTP id nb1mr27278572pdb.71.1428935195877;
	Mon, 13 Apr 2015 07:26:35 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id t13sm4217924pdi.95.2015.04.13.07.26.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 07:26:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 07:26:20 -0700
Message-Id: <cover.1428934577.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/24] Dizzy-next for 1.7.2
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
X-List-Received-Date: Mon, 13 Apr 2015 14:26:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V2:
removed a few commits from last request.

Please consider these changes for the next Dizzy release.

The following changes since commit c59e3bd26d863723af7ba5e16570b091ef7cdc13:

  bitbake: data.py: fixes bad substitution when running devshell (2015-04-11 16:27:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib 76b22f0a92ab06c46979a60208ff91c1f3817bed
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Aníbal Limón (1):
  files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in
    environment setup file

Armin Kuster (3):
  tzcode: update to 2015b
  tzdata: update to 2015b
  util-linux: fix CVE-2014-9114

Bruce Ashfield (3):
  linux-yocto/3.10: update to v3.10.65
  linux-yocto/3.14: update to 3.14.29
  linux-yocto/3.17: update to v3.17.8

Chen Qi (1):
  package_manager.py: fix rootfs failure with multilib enabled

Daniel Dragomir (1):
  gcc-runtime: Remove libgfortran data from receipe

Enrico Scholz (1):
  serf: fix 'ccache' builds

Jonathan Liu (2):
  libunwind: backport patch to link against libgcc_s intead of libgcc
  fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending

Martin Jansa (1):
  powertop: Fix build for !uclibc

Richard Purdie (2):
  e2fsprogs: Add a patch to speedup mkfs
  autotools: Avoid find race for S = "${WORKDIR}"

Robert Yang (5):
  dpkg: add perl to RDEPENDS
  which 2.18: fix SRC_URI
  tzdata: fix HOMEPAGE
  patch: fix CVE-2015-1196
  cpio: fix CVE-2015-1197

Ross Burton (2):
  bitbake: data_smart: split expanded removal values when handling
    _remove
  bitbake: tests/data: add test for incorrect remove behaviour

Saul Wold (1):
  linux-yocto-tiny_3.17: Update to actually use 3.17 git repo

Sona Sarmadi (1):
  e2fsprogs: CVE-2015-0247

 bitbake/lib/bb/data_smart.py                       |   3 +-
 bitbake/lib/bb/tests/data.py                       |   7 +
 meta/classes/autotools.bbclass                     |   2 +-
 meta/classes/fontcache.bbclass                     |   2 +-
 meta/files/toolchain-shar-template.sh              |   1 +
 meta/lib/oe/package_manager.py                     |   5 +-
 .../util-linux/util-linux/CVE-2014-9114.patch      | 176 ++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.2.bb  |   1 +
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        |  58 ++++++
 .../e2fsprogs/e2fsprogs/cache_inode.patch          |  52 ++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |   2 +
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  15 --
 .../patch/patch/patch-CVE-2015-1196.patch          | 200 +++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.1.bb         |   1 +
 .../cpio/cpio-2.11/cpio-CVE-2015-1197.patch        | 154 ++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |   3 +-
 .../recipes-extended/tzcode/tzcode-native_2015a.bb |  10 --
 .../recipes-extended/tzcode/tzcode-native_2015b.bb |  10 ++
 meta/recipes-extended/tzdata/tzdata.inc            |   2 +-
 meta/recipes-extended/tzdata/tzdata_2015a.bb       |   6 -
 meta/recipes-extended/tzdata/tzdata_2015b.bb       |   6 +
 meta/recipes-extended/which/which_2.18.bb          |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |   8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |  18 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |  18 +-
 meta/recipes-kernel/linux/linux-yocto_3.17.bb      |  18 +-
 meta/recipes-kernel/powertop/powertop_2.6.1.bb     |   3 +-
 ...-libunwind-to-libgcc_s-rather-than-libgcc.patch |  42 +++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |   1 +
 meta/recipes-support/serf/serf/env.patch           |  28 +++
 meta/recipes-support/serf/serf_1.3.7.bb            |   8 +-
 36 files changed, 802 insertions(+), 90 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
 create mode 100644 meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/cpio-CVE-2015-1197.patch
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015a.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015b.bb
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2015a.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2015b.bb
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
 create mode 100644 meta/recipes-support/serf/serf/env.patch

-- 
2.3.5


