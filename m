Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 940F171D9E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 06:45:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v196jmEa028885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 8 Feb 2017 22:45:48 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Feb 2017 22:45:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 01:45:33 -0500
Message-ID: <cover.1486622006.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 00/13] 11 packages upgrade
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
X-List-Received-Date: Thu, 09 Feb 2017 06:45:58 -0000
Content-Type: text/plain

Changed in V2:

- gpgme, drop gpgme-pthread and add gpgme-cpp

- libgpg-error, move errorref.txt to -doc

- bash, add loadable builtin and delete uname to
  workaround do_package_write_rpm failure.

- elfutils, addUS tags to debian patches.

//Hongxu

The following changes since commit a624cf7f95c8cf4ff764cc997fd1db4601b97dcc:

  oeqa/selftest/pkgdata: use m4 instead of bash (2017-02-07 14:50:10 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20170208
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20170208

Hongxu Jia (12):
  pax-utils: 1.1.6 -> 1.2.2
  socat: 1.7.3.1 -> 1.7.3.2
  libgcrypt: 1.7.3 -> 1.7.6
  ncurses: 6.0+20160625 -> 6.0+20161126
  man-pages: 4.08 -> 4.09
  rpcbind: 0.2.3 -> 0.2.4
  gnupg: 2.1.14 -> 2.1.18
  gpgme: 1.6.0 -> 1.8.0
  libgpg-error: 1.25 -> 1.26
  bash: update patches for 4.4
  elfutils: 0.166 -> 0.168
  elfutils: update homepage and upstream souce

Zheng Ruoqin (1):
  bash: 4.3.30 -> 4.4

 .../socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb}   |   4 +-
 ...ses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |   2 +-
 .../elfcmp-fix-self-comparision.patch              |  41 --
 .../elfutils/elfutils-0.166/m68k_backend.diff      | 492 -------------
 .../elfutils/elfutils-0.166/uclibc-support.patch   | 128 ----
 ...de-alternatives-for-glibc-assumptions-hel.patch | 772 +++++++++------------
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |   0
 .../0001-fix-a-stack-usage-warning.patch           |   0
 .../0001-remove-the-unneed-checking.patch          |   0
 .../aarch64_uio.patch                              |   0
 ...ferences-between-mips-machine-identifiers.patch |  13 +-
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   3 +
 .../0003-Add-mips-n64-relocation-format-hack.patch |  35 +-
 .../debian}/arm_backend.diff                       |  55 +-
 .../debian}/hppa_backend.diff                      |  63 +-
 .../elfutils/elfutils-0.168/debian/hurd_path.patch |  17 +
 .../elfutils-0.168/debian/ignore_strmerge.diff     |  14 +
 .../debian}/kfreebsd_path.patch                    |  11 +-
 .../debian}/mips_backend.diff                      |  75 +-
 .../debian}/mips_readelf_w.patch                   |  11 +-
 .../debian}/testsuite-ignore-elflint.diff          |  17 +-
 .../fixheadercheck.patch                           |   0
 .../shadow.patch                                   |   0
 .../{elfutils_0.166.bb => elfutils_0.168.bb}       |  34 +-
 .../{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb}     |   6 +-
 .../0001-patch-to-obtain-pkgconfig-sanity.patch    |  28 +
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 137 +---
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 ---
 meta/recipes-extended/bash/bash/test-output.patch  |  20 +-
 meta/recipes-extended/bash/bash_4.3.30.bb          |  71 --
 meta/recipes-extended/bash/bash_4.4.bb             |  69 ++
 .../{man-pages_4.08.bb => man-pages_4.09.bb}       |   4 +-
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch | 221 ------
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |  43 --
 .../rpcbind/rpcbind/cve-2015-7236.patch            |  84 ---
 .../rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} |   7 +-
 .../gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb}     |   8 +-
 meta/recipes-support/gpgme/gpgme/gpgme.pc          |  10 -
 meta/recipes-support/gpgme/gpgme/pkgconfig.patch   |  42 +-
 .../gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb}       |  20 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb  |   4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb  |   4 +
 .../{libgpg-error_1.25.bb => libgpg-error_1.26.bb} |   5 +-
 43 files changed, 701 insertions(+), 1979 deletions(-)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb} (89%)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} (84%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (47%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/aarch64_uio.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0001-Ignore-differences-between-mips-machine-identifiers.patch (78%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (98%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0003-Add-mips-n64-relocation-format-hack.patch (90%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/arm_backend.diff (94%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/hppa_backend.diff (95%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/kfreebsd_path.patch (60%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_backend.diff (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_readelf_w.patch (73%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/testsuite-ignore-elflint.diff (70%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.166.bb => elfutils_0.168.bb} (75%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb} (86%)
 create mode 100644 meta/recipes-extended/bash/bash/0001-patch-to-obtain-pkgconfig-sanity.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb
 rename meta/recipes-extended/man-pages/{man-pages_4.08.bb => man-pages_4.09.bb} (86%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} (87%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb} (80%)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/gpgme.pc
 rename meta/recipes-support/gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb} (67%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.25.bb => libgpg-error_1.26.bb} (89%)

-- 
2.8.1


