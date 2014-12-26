Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1377265C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:35:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBQ9ZX1O015292
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 01:35:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Dec 2014 01:35:32 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:35:26 +0800
Message-ID: <cover.1419586441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Package Upgrades
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
X-List-Received-Date: Fri, 26 Dec 2014 09:35:42 -0000
Content-Type: text/plain

The following changes since commit d5b0e6062a4e9f66a5b1813ed082a56cce5bee5d:

  boost : Add the atomic and chrono libraries to the build. (2014-12-25 22:05:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrades
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrades

Chen Qi (7):
  kmod: upgrade to 19
  tar: upgrade to 2.18
  sudo: upgrade to latest state version 1.8.11p2
  pciutils: upgrade to 3.3.0
  pciutils: add PACKAGECONFIG for 'hwdb'
  xz: upgrade to latest stable release 5.2.0
  grep: upgrade to 2.21

 .../pciutils/pciutils/lib-build-fix.patch          | 92 ----------------------
 .../{pciutils_3.2.1.bb => pciutils_3.3.0.bb}       | 19 ++---
 .../grep/{grep_2.19.bb => grep_2.21.bb}            |  4 +-
 meta/recipes-extended/sudo/sudo.inc                | 14 ++--
 .../sudo/{sudo_1.8.10p3.bb => sudo_1.8.11p2.bb}    |  6 +-
 ...ve_1.27.1.bb => tar-replacement-native_1.28.bb} |  0
 .../tar/{tar_1.27.1.bb => tar_1.28.bb}             |  5 +-
 .../xz/{xz_5.1.3alpha.bb => xz_5.2.0.bb}           |  4 +-
 meta/recipes-kernel/kmod/kmod.inc                  |  7 +-
 ...missing-O_CLOEXEC-in-kmod_module_get_size.patch | 27 -------
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 21 ++---
 11 files changed, 39 insertions(+), 160 deletions(-)
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch
 rename meta/recipes-bsp/pciutils/{pciutils_3.2.1.bb => pciutils_3.3.0.bb} (78%)
 rename meta/recipes-extended/grep/{grep_2.19.bb => grep_2.21.bb} (87%)
 rename meta/recipes-extended/sudo/{sudo_1.8.10p3.bb => sudo_1.8.11p2.bb} (80%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.27.1.bb => tar-replacement-native_1.28.bb} (100%)
 rename meta/recipes-extended/tar/{tar_1.27.1.bb => tar_1.28.bb} (53%)
 rename meta/recipes-extended/xz/{xz_5.1.3alpha.bb => xz_5.2.0.bb} (92%)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Add-missing-O_CLOEXEC-in-kmod_module_get_size.patch

-- 
1.9.1


