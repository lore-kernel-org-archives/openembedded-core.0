Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A57AB77218
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1A3NG3u026288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:17 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:05 -0800
Message-ID: <cover.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 00/10] Packages upgrade
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:20 -0000
Content-Type: text/plain

The following changes since commit d1109378d730c5cf50240c4d1a468e3aef5208ea:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:50:54 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (10):
  e2fsprogs: 1.43.3 -> 1.43.4
  git: 2.11.0 -> 2.11.1
  gnu-efi: 3.0.4 -> 3.0.5
  hdparm: 9.50 -> 9.51
  libpcre: 8.39 -> 8.40
  wget: 1.18 -> 1.19
  strace: 4.14 -> 4.15
  strace: fix gawk's path
  mklibs-native: 0.1.41 -> 0.1.43
  m4: 1.4.17 -> 1.4.18

 .../aarch64-initplat.c-fix-const-qualifier.patch   | 35 ----------------
 .../gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} |  5 +--
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch |  9 ++--
 .../{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb}   |  6 +--
 meta/recipes-devtools/git/git_2.11.0.bb            | 11 -----
 meta/recipes-devtools/git/git_2.11.1.bb            | 11 +++++
 .../m4/{m4-1.4.17.inc => m4-1.4.18.inc}            |  5 ++-
 .../{m4-native_1.4.17.bb => m4-native_1.4.18.bb}   |  0
 meta/recipes-devtools/m4/m4/remove-gets.patch      | 15 +++----
 .../m4/{m4_1.4.17.bb => m4_1.4.18.bb}              |  0
 ...bs-native_0.1.41.bb => mklibs-native_0.1.43.bb} |  8 ++--
 .../0001-caps-abbrev.awk-fix-gawk-s-path.patch     | 49 ++++++++++++++++++++++
 .../strace/{strace_4.14.bb => strace_4.15.bb}      |  5 ++-
 .../hdparm/{hdparm_9.50.bb => hdparm_9.51.bb}      |  4 +-
 meta/recipes-extended/wget/wget.inc                |  2 -
 .../wget/{wget_1.18.bb => wget_1.19.bb}            |  4 +-
 .../libpcre/{libpcre_8.39.bb => libpcre_8.40.bb}   |  6 +--
 17 files changed, 93 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} (92%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb} (96%)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
 rename meta/recipes-devtools/m4/{m4-1.4.17.inc => m4-1.4.18.inc} (75%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.17.bb => m4-native_1.4.18.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.17.bb => m4_1.4.18.bb} (100%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.41.bb => mklibs-native_0.1.43.bb} (72%)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 rename meta/recipes-devtools/strace/{strace_4.14.bb => strace_4.15.bb} (88%)
 rename meta/recipes-extended/hdparm/{hdparm_9.50.bb => hdparm_9.51.bb} (89%)
 rename meta/recipes-extended/wget/{wget_1.18.bb => wget_1.19.bb} (53%)
 rename meta/recipes-support/libpcre/{libpcre_8.39.bb => libpcre_8.40.bb} (92%)

-- 
2.11.0.rc2.dirty


