Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEB965C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:29:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9T73J013632
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Nov 2014 01:29:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:29:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 14 Nov 2014 17:29:02 +0800
Message-ID: <cover.1415956955.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] elfutils: upgrade to 0.160
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
X-List-Received-Date: Fri, 14 Nov 2014 09:29:11 -0000
Content-Type: text/plain

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-elfutils
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-elfutils

Hongxu Jia (1):
  elfutils: upgrade to 0.160

 .../{elfutils => elfutils-0.148}/arm_backend.diff  |    0
 .../elf_additions.diff                             |    0
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   |    0
 .../elfutils-fsize.patch                           |    0
 .../fix-build-gcc-4.8.patch                        |    0
 .../fix_for_gcc-4.7.patch                          |    0
 .../{elfutils => elfutils-0.148}/hppa_backend.diff |    0
 .../{elfutils => elfutils-0.148}/m68k_backend.diff |    0
 .../{elfutils => elfutils-0.148}/mips_backend.diff |    0
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch |    0
 .../redhat-portability.diff                        |    0
 .../redhat-robustify.diff                          |    0
 .../remove-unused.patch                            |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../elfutils/elfutils-0.158/CVE-2014-0172.patch    |   35 -
 .../elfutils/elfutils-0.158/core_filename.patch    |   27 -
 .../elfutils/elfutils-0.158/elf_additions.diff     |   77 -
 ...4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch |   34 -
 .../elfutils/elfutils-0.158/redhat-robustify.diff  | 1756 --------------------
 .../elfutils/elfutils-0.158/unwind_non_linux.patch |  256 ---
 .../arm_backend.diff                               |  382 +++--
 .../elfutils/elfutils-0.160/arm_func_value.patch   |  166 ++
 .../elfutils-0.160/arm_unwind_ret_mask.patch       |   83 +
 .../fixheadercheck.patch                           |    0
 .../hppa_backend.diff                              |    2 +-
 .../m68k_backend.diff                              |    2 +-
 .../mips_backend.diff                              |    2 +-
 .../mips_readelf_w.patch                           |    0
 .../elfutils/elfutils-0.160/non_linux.patch        |   35 +
 .../redhat-portability.diff                        |  408 +++--
 .../scanf-format.patch                             |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../{elfutils_0.158.bb => elfutils_0.160.bb}       |   28 +-
 33 files changed, 736 insertions(+), 2557 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/elf_additions.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/elfutils-ar-c-fix-num-passed-to-memset.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/elfutils-fsize.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/fix-build-gcc-4.8.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/fix_for_gcc-4.7.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/redhat-portability.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/redhat-robustify.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/remove-unused.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/testsuite-ignore-elflint.diff (100%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/arm_backend.diff (82%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/hppa_backend.diff (99%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/m68k_backend.diff (99%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/mips_backend.diff (99%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/mips_readelf_w.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/redhat-portability.diff (71%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.158.bb => elfutils_0.160.bb} (87%)

-- 
1.9.1


