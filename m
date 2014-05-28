Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C51116FBDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:50:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S8o3nq007216
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 01:50:03 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 01:50:02 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 16:49:56 +0800
Message-ID: <cover.1401266832.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V2 0/3] elfutils: upgrade to 0.158
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
X-List-Received-Date: Wed, 28 May 2014 08:50:04 -0000
Content-Type: text/plain

Change in V2:
- Add the missing 'm4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch'
  and 'elf_additions.diff' patches.

Build Steps:

1. Add 'PREFERRED_VERSION_elfutils="0.158"' to local.conf
2. bitbake elfutils

//Hongxu

The following changes since commit 894df445fa71a170397c6e0b4960a89ef20a4230:

  guile: Update to 2.0.11 version (2014-05-21 19:50:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-elfutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-elfutils

Hongxu Jia (3):
  elfutils: remove 0.155
  elfutils: upgrade to 0.158
  elfutils: backport from debian

 .../elfutils/elfutils-0.155/dso-link-change.patch  |   32 -
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   |   23 -
 .../elfutils/elfutils-0.155/i386_dis.h             | 1657 --------------------
 .../elfutils/elfutils-0.155/mempcpy.patch          |   24 -
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   27 -
 .../elfutils/elfutils-0.155/uclibc-support.patch   |   91 --
 .../elfutils/elfutils-0.155/x86_64_dis.h           | 1632 -------------------
 .../elfutils/elfutils-0.158/CVE-2014-0172.patch    |   35 +
 .../arm_backend.diff                               |  433 +++--
 .../elfutils/elfutils-0.158/core_filename.patch    |   27 +
 .../elf_additions.diff                             |   66 +-
 .../hppa_backend.diff                              |   77 +-
 ...4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch |   34 +
 .../m68k_backend.diff                              |  250 ++-
 .../mips_backend.diff                              |   72 +-
 .../elfutils/elfutils-0.158/mips_readelf_w.patch   |   22 +
 .../redhat-portability.diff                        |  953 +++++++----
 .../redhat-robustify.diff                          |  326 ++--
 .../elfutils/elfutils-0.158/scanf-format.patch     |   40 +
 .../elfutils-0.158/testsuite-ignore-elflint.diff   |   39 +
 .../elfutils/elfutils-0.158/unwind_non_linux.patch |  256 +++
 .../{elfutils_0.155.bb => elfutils_0.158.bb}       |   24 +-
 22 files changed, 1833 insertions(+), 4307 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-to-memset.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/arm_backend.diff (44%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/elf_additions.diff (49%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/hppa_backend.diff (92%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/m68k_backend.diff (51%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/mips_backend.diff (91%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/redhat-portability.diff (66%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.155 => elfutils-0.158}/redhat-robustify.diff (81%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
 rename meta/recipes-devtools/elfutils/{elfutils_0.155.bb => elfutils_0.158.bb} (82%)

-- 
1.8.1.2


