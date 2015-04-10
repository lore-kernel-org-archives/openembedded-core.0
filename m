Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C475B6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9U7GK002956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:29:52 -0700
Message-ID: <cover.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/15] meta: unique dev and dbg packages
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:07 -0000
Content-Type: text/plain

Remove extra dev and dbg packages, keep PN-dev and PN-dbg.

// Robert

The following changes since commit 75ae0b7cf3863eb2857a2b6a7073beea626f751d:

  wic: Implement --build-rootfs command line option (2015-04-08 23:11:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/dev
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/dev

Robert Yang (15):
  xz: remove liblzma-dev and liblzma-dbg from PACKAGES
  bzip2: remove libbz2-dev libbz2-staticdev from from PACKAGES
  acl/attr: remove extra dev and staticdev from PACKAGES
  aspell: remove libpspell-dev from PACKAGES
  apmd: remove libapm-dev and libapm-staticdev from PACKAGES
  augeas: remove extra dev and dbg from PACKAGES
  cogl: remove extra dev from PACKAGES
  curl: remove extra dev and staticdev from PACKAGES
  elfutils: remove libdw-dev libasm-dev libelf-dev from PACKAGES
  libtool: remove libltdl-dev libltdl-dbg libltdl-staticdev from
    PACKAGES
  libxmu: remove libxmuu-dev from PACKAGES
  opkg: remove libopkg-dev and libopkg-staticdev from PACKAGES
  pciutils: remove libpci-dev and libpci-dbg from PACKAGES
  sysfsutils: remove libsysfs-dev and libsysfs-staticdev from PACKAGES
  tiff: remove extra dev and dbg from PACKAGES

 meta/recipes-bsp/apmd/apmd_3.2.2-14.bb           |    4 +---
 meta/recipes-bsp/pciutils/pciutils_3.3.0.bb      |    5 +----
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    5 +----
 meta/recipes-devtools/elfutils/elfutils_0.161.bb |    5 +----
 meta/recipes-devtools/libtool/libtool-2.4.6.inc  |    9 +-------
 meta/recipes-devtools/opkg/opkg_0.2.4.bb         |    4 +---
 meta/recipes-extended/augeas/augeas.inc          |    5 +----
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb       |   10 +--------
 meta/recipes-extended/xz/xz_5.2.0.bb             |    8 +-------
 meta/recipes-graphics/cogl/cogl-1.0.inc          |   24 ++--------------------
 meta/recipes-graphics/xorg-lib/libxmu_1.1.2.bb   |    3 +--
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb    |    6 +-----
 meta/recipes-support/aspell/aspell_0.60.6.1.bb   |    4 ++--
 meta/recipes-support/attr/ea-acl.inc             |   13 +-----------
 meta/recipes-support/curl/curl_7.40.0.bb         |   11 +---------
 16 files changed, 18 insertions(+), 100 deletions(-)

-- 
1.7.9.5


