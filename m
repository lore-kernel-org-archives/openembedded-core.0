Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03F1E7C692
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:03:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1F33dCD004695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:03:50 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 19:03:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 11:22:17 +0800
Message-ID: <cover.1550200881.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Recipes upgrade
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
X-List-Received-Date: Fri, 15 Feb 2019 03:03:59 -0000
Content-Type: text/plain

The following changes since commit a88bcbae850a2e6d182291d3f8e167aabdbe4842:

  wic/engine.py: Load paths from PATH environment variable (2019-02-14 11:20:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (4):
  cryptodev: 1.9 -> 1.10
  e2fsprogs: 1.44.3 -> 1.44.5
  git: 2.18.1 -> 2.20.1
  mklibs-native: 0.1.43 -> 0.1.44

 .../{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.5.bb}   |   2 +-
 meta/recipes-devtools/git/git_2.18.1.bb            |  11 -
 meta/recipes-devtools/git/git_2.20.1.bb            |  11 +
 ...bs-native_0.1.43.bb => mklibs-native_0.1.44.bb} |   8 +-
 ...ptodev-linux_1.9.bb => cryptodev-linux_1.10.bb} |   0
 ...odev-module_1.9.bb => cryptodev-module_1.10.bb} |   5 -
 ...ptodev-tests_1.9.bb => cryptodev-tests_1.10.bb} |   1 -
 meta/recipes-kernel/cryptodev/cryptodev.inc        |   2 +-
 .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 ---------
 .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   |  49 ----
 .../0001-ioctl.c-Fix-build-with-linux-4.17.patch   |  43 ----
 ...-split-big-function-to-simplify-maintaina.patch | 250 ---------------------
 ...g-relocate-code-to-simplify-later-patches.patch |  64 ------
 ...ert-to-new-AEAD-interface-in-kernels-v4.2.patch | 102 ---------
 14 files changed, 16 insertions(+), 635 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.5.bb} (99%)
 delete mode 100644 meta/recipes-devtools/git/git_2.18.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.20.1.bb
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.43.bb => mklibs-native_0.1.44.bb} (71%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.9.bb => cryptodev-linux_1.10.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.9.bb => cryptodev-module_1.10.bb} (54%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.9.bb => cryptodev-tests_1.10.bb} (88%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch

-- 
2.7.4


