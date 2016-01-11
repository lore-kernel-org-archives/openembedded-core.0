Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B64C26E6B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B0VST8023951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 16:31:28 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:30 +0800
Message-ID: <cover.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/9] packages upgrade
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:31 -0000
Content-Type: text/plain

The following changes since commit 221d864042658daa054281aab439b44d54fe94d7:

  bitbake: fetch/git: Change to use clearer ssh url syntax for broken servers (2016-01-08 13:58:08 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-11012016
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-11012016

Hongxu Jia (9):
  dhcp: 4.3.2 -> 4.3.3
  elfutils: 0.163 -> 0.164
  pax-utils: 1.0.5 -> 1.1.4
  xmlto: 0.0.26 -> 0.0.28
  libgcrypt: 1.6.3 -> 1.6.4
  ghostscript: 9.16 -> 9.18
  man-pages: 4.02 -> 4.04
  help2man-native: 1.47.1 -> 1.47.3
  gnupg: 2.1.7 -> 2.1.10

 .../dhcp/dhcp/fix-external-bind.patch              |   79 +-
 .../dhcp/dhcp/fixsepbuild.patch                    |   19 -
 .../dhcp/{dhcp_4.3.2.bb => dhcp_4.3.3.bb}          |    4 +-
 .../elfutils/elfutils-0.163/arm_func_value.patch   |  165 ----
 .../elfutils-0.163/arm_unwind_ret_mask.patch       |   83 --
 .../elfutils/elfutils-0.163/non_linux.patch        |   35 -
 .../elfutils-0.163/redhat-portability.diff         | 1021 --------------------
 .../elfutils/elfutils-0.163/scanf-format.patch     |   40 -
 .../uclibc-support-for-elfutils-0.161.patch        |  106 --
 ...ferences-between-mips-machine-identifiers.patch |   34 +
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-fix-a-stack-usage-warning.patch           |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |  168 ++++
 .../0003-Add-mips-n64-relocation-format-hack.patch |  226 +++++
 .../arm_backend.diff                               |  389 ++++----
 .../fixheadercheck.patch                           |    0
 .../hppa_backend.diff                              |   69 +-
 .../elfutils/elfutils-0.164/kfreebsd_path.patch    |   15 +
 .../m68k_backend.diff                              |   61 +-
 .../mips_backend.diff                              |   71 +-
 .../mips_readelf_w.patch                           |    8 +-
 .../testsuite-ignore-elflint.diff                  |    0
 .../{elfutils_0.163.bb => elfutils_0.164.bb}       |   15 +-
 ...-native_1.47.1.bb => help2man-native_1.47.3.bb} |    4 +-
 .../{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb}     |    4 +-
 ....in-drop-the-test-of-xmllint-and-xsltproc.patch |    0
 .../xmlto/{xmlto_0.0.26.bb => xmlto_0.0.28.bb}     |    4 +-
 .../{ghostscript_9.16.bb => ghostscript_9.18.bb}   |    6 +-
 .../{man-pages_4.02.bb => man-pages_4.04.bb}       |    4 +-
 .../gnupg/{gnupg_2.1.7.bb => gnupg_2.1.10.bb}      |    7 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb  |    4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb  |    4 +
 33 files changed, 798 insertions(+), 1847 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.2.bb => dhcp_4.3.3.bb} (70%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_func_value.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/arm_unwind_ret_mask.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/non_linux.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/redhat-portability.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/scanf-format.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/uclibc-support-for-elfutils-0.161.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0001-Ignore-differences-between-mips-machine-identifiers.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/0001-remove-the-unneed-checking.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0003-Add-mips-n64-relocation-format-hack.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/arm_backend.diff (82%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/hppa_backend.diff (93%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/kfreebsd_path.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/m68k_backend.diff (89%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/mips_backend.diff (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/mips_readelf_w.patch (75%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.163 => elfutils-0.164}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.163.bb => elfutils_0.164.bb} (87%)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.1.bb => help2man-native_1.47.3.bb} (79%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.0.5.bb => pax-utils_1.1.4.bb} (83%)
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.26 => xmlto-0.0.28}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (100%)
 rename meta/recipes-devtools/xmlto/{xmlto_0.0.26.bb => xmlto_0.0.28.bb} (88%)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb} (94%)
 rename meta/recipes-extended/man-pages/{man-pages_4.02.bb => man-pages_4.04.bb} (86%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.7.bb => gnupg_2.1.10.bb} (84%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.4.bb

-- 
1.9.1


