Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66182780CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 10:15:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6CAFWYn022570
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:15:32 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 03:15:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 03:15:25 -0700
Message-ID: <cover.1499854502.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/6] Packages Upgrade
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
X-List-Received-Date: Wed, 12 Jul 2017 10:15:32 -0000
Content-Type: text/plain

The following changes since commit b1c4661742d12cfd444043e597d01bd627ee4ca4:

  libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.patch (2017-07-11 15:41:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (6):
  automake: 1.15 -> 1.15.1
  cryptodev: 1.8 -> 1.9
  debianutils: 4.8.1 -> 4.8.1.1
  git: 2.11.1 -> 2.13.2
  gnu-efi: 3.0.5 -> 3.0.6
  libbsd: 0.8.3 -> 0.8.5

 ...plicit-fall-through-so-Wextra-will-work-i.patch |  34 ---
 .../gnu-efi/gnu-efi/parallel-make-archives.patch   |  30 +--
 .../gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} |   5 +-
 ...0001-automake-port-to-Perl-5.22-and-later.patch |  32 ---
 .../{automake_1.15.bb => automake_1.15.1.bb}       |   5 +-
 meta/recipes-devtools/git/git.inc                  |   1 -
 meta/recipes-devtools/git/git_2.11.1.bb            |  11 -
 meta/recipes-devtools/git/git_2.13.2.bb            |  11 +
 ...yptodev-linux_1.8.bb => cryptodev-linux_1.9.bb} |   0
 ...todev-module_1.8.bb => cryptodev-module_1.9.bb} |   0
 ...yptodev-tests_1.8.bb => cryptodev-tests_1.9.bb} |   2 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc        |  10 +-
 ...st-to-another-change-in-the-user-page-API.patch |  40 ---
 ...talling-header-file-provided-by-another-p.patch |  18 +-
 .../06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch |  54 ----
 .../cb186f682679383e8b5806240927903730ce85d9.patch | 279 ---------------------
 .../cryptodev/files/kernel-4-10-changes.patch      |  57 -----
 ...debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} |   7 +-
 .../libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb}    |   6 +-
 19 files changed, 39 insertions(+), 563 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.5.bb => gnu-efi_3.0.6.bb} (92%)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-automake-port-to-Perl-5.22-and-later.patch
 rename meta/recipes-devtools/automake/{automake_1.15.bb => automake_1.15.1.bb} (84%)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.13.2.bb
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.8.bb => cryptodev-linux_1.9.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.8.bb => cryptodev-module_1.9.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.8.bb => cryptodev-tests_1.9.bb} (88%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/cb186f682679383e8b5806240927903730ce85d9.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/kernel-4-10-changes.patch
 rename meta/recipes-support/debianutils/{debianutils_4.8.1.bb => debianutils_4.8.1.1.bb} (86%)
 rename meta/recipes-support/libbsd/{libbsd_0.8.3.bb => libbsd_0.8.5.bb} (88%)

-- 
2.10.2


