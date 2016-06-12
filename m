Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6EB606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C8PDDu000482
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:16 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:02 -0700
Message-ID: <cover.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 00/11] Packages upgrade
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:16 -0000
Content-Type: text/plain

The following changes since commit 207dba5b6eb04c1ae2081bac06724b3b6a198cb3:

  oe-pkgdata-util: fix AttributeError (2016-06-07 21:36:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (11):
  autogen-native: 5.18.6 -> 5.18.10
  file: 5.25 -> 5.27
  mklibs-native: 0.1.40 -> 0.1.41
  git: 2.8.2 -> 2.8.4
  make: 4.1 -> 4.2
  e2fsprogs: 1.42.99+1.43+git -> 1.43
  gnu-efi: 3.0.3 -> 3.0.4
  libbsd: 0.8.2 -> 0.8.3
  libcap: 2.24 -> 2.25
  tcl: 8.6.4 -> 8.6.5
  strace: 4.11 -> 4.12

 .../gnu-efi-Make-setjmp.S-portable-to-ARM.patch    |  50 ----
 .../gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} |  17 +-
 ...-native_5.18.6.bb => autogen-native_5.18.10.bb} |   5 +-
 .../autogen/autogen/redirect-output-dir.patch      |  28 --
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |   2 +-
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch |  34 ---
 .../e2fsprogs/e2fsprogs/xattr_ordering.patch       | 219 ---------------
 .../{e2fsprogs_git.bb => e2fsprogs_1.43..bb}       |   5 +-
 .../file/{file_5.25.bb => file_5.27.bb}            |   2 +-
 meta/recipes-devtools/git/git_2.8.2.bb             |  11 -
 meta/recipes-devtools/git/git_2.8.4.bb             |  11 +
 ...-SV-43434-Handle-NULL-returns-from-ttynam.patch |   0
 .../make/{make_4.1.bb => make_4.2.bb}              |   6 +-
 ...bs-native_0.1.40.bb => mklibs-native_0.1.41.bb} |   4 +-
 ...01-Move-gcc-compat-macros-to-gcc_compat.h.patch | 176 ------------
 .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 117 --------
 ...1-scm_rights-fd.test-rewrite-without-fork.patch | 198 -------------
 .../strace/0001-tests-introduce-libtests.patch     | 306 ---------------------
 .../0001-tests-scm_rights.c-use-libtests.patch     |  54 ----
 .../strace/strace/update-gawk-paths.patch          | 114 ++++----
 .../strace/{strace_4.11.bb => strace_4.12.bb}      |   9 +-
 .../tcltk/{tcl_8.6.4.bb => tcl_8.6.5.bb}           |   4 +-
 .../libbsd/{libbsd_0.8.2.bb => libbsd_0.8.3.bb}    |   6 +-
 .../libcap/{libcap_2.24.bb => libcap_2.25.bb}      |   6 +-
 24 files changed, 98 insertions(+), 1286 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} (60%)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.6.bb => autogen-native_5.18.10.bb} (87%)
 delete mode 100644 meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_ordering.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_git.bb => e2fsprogs_1.43..bb} (94%)
 rename meta/recipes-devtools/file/{file_5.25.bb => file_5.27.bb} (96%)
 delete mode 100644 meta/recipes-devtools/git/git_2.8.2.bb
 create mode 100644 meta/recipes-devtools/git/git_2.8.4.bb
 rename meta/recipes-devtools/make/{make-4.1 => make-4.2}/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch (100%)
 rename meta/recipes-devtools/make/{make_4.1.bb => make_4.2.bb} (60%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.40.bb => mklibs-native_0.1.41.bb} (84%)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
 rename meta/recipes-devtools/strace/{strace_4.11.bb => strace_4.12.bb} (75%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.4.bb => tcl_8.6.5.bb} (95%)
 rename meta/recipes-support/libbsd/{libbsd_0.8.2.bb => libbsd_0.8.3.bb} (86%)
 rename meta/recipes-support/libcap/{libcap_2.24.bb => libcap_2.25.bb} (92%)

-- 
2.8.0


