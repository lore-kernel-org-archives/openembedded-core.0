Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E46B0607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6P8GWAi023071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:33 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:24 -0700
Message-ID: <cover.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [V2 PATCH 0/7] Packages Upgrade
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
X-List-Received-Date: Mon, 25 Jul 2016 08:16:33 -0000
Content-Type: text/plain

* V2
  - Use SECURITY_NO_PIE_CFLAGS for SECURITY_CFLAGS
  - Drop e2fsprogs upgrading atm since it can't be built when musl + qemux86 + --enable-hardening.

// Robert

The following changes since commit 0a2df616a5c3316704742f1dcf37b450920e0280:

  boost: fix CVE-2012-2677 (2016-07-21 07:45:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pu

Robert Yang (7):
  git: 2.8.4 -> 2.9.2
  guile: 2.0.11 -> 2.0.12
  gnu-efi: 3.0.3 -> 3.0.4
  slang: 2.2.4 -> 2.3.0
  gettext: 0.19.6 -> 0.19.8.1
  gettext-minimal-native: 0.19.4 -> 0.19.8.1
  ccache: 3.2.4 -> 3.2.5

 meta/conf/distro/include/security_flags.inc        |   1 +
 .../aarch64-initplat.c-fix-const-qualifier.patch   |  35 ++++
 .../gnu-efi-Make-setjmp.S-portable-to-ARM.patch    |  50 -----
 .../gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} |  27 ++-
 .../add-with-bisonlocaledir.patch                  |   0
 .../parallel.patch                                 |   0
 .../gettext/gettext-minimal-0.19.4/aclocal.tgz     | Bin 39744 -> 0 bytes
 ...-PATCH-Disable-the-test-to-convert-euc-jp.patch |   0
 .../COPYING                                        |   2 +-
 .../Makefile.in.in                                 |  44 +++--
 .../gettext/gettext-minimal-0.19.8.1/aclocal.tgz   | Bin 0 -> 40014 bytes
 .../config.rpath                                   |   2 +-
 .../remove-potcdate.sin                            |   0
 ....19.4.bb => gettext-minimal-native_0.19.8.1.bb} |   3 +-
 .../{gettext_0.19.6.bb => gettext_0.19.8.1.bb}     |   9 +-
 meta/recipes-devtools/ccache/ccache_3.2.4.bb       |  10 -
 meta/recipes-devtools/ccache/ccache_3.2.5.bb       |  11 ++
 ...te-man-page-in-the-make-install-from-git-.patch |  33 ++++
 meta/recipes-devtools/git/git_2.9.2.bb             |  11 ++
 ...guile-Check-for-strtol_l-during-configure.patch |  56 ------
 ...002-Recognize-nios2-as-compilation-target.patch |  20 +-
 ...guile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch |  43 ----
 .../guile/files/remove_strcase_l_funcs.patch       |  38 ----
 .../guile/{guile_2.0.11.bb => guile_2.0.12.bb}     |  11 +-
 ...change-char-type-to-signed-char-in-macros.patch | 218 ---------------------
 .../slang/slang/fix-check-pcre.patch               |  30 +--
 meta/recipes-extended/slang/slang/rpathfix.patch   |  18 +-
 .../slang-fix-the-iconv-existence-checking.patch   |  31 +--
 .../sprintf-bug-concerning-8-bit-characters.patch  |  42 ----
 .../slang/{slang_2.2.4.bb => slang_2.3.0.bb}       |   9 +-
 30 files changed, 216 insertions(+), 538 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gnu-efi-Make-setjmp.S-portable-to-ARM.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.3.bb => gnu-efi_3.0.4.bb} (59%)
 rename meta/recipes-core/gettext/{gettext-0.19.6 => gettext-0.19.8.1}/add-with-bisonlocaledir.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.19.6 => gettext-0.19.8.1}/parallel.patch (100%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.4/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/COPYING (76%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/Makefile.in.in (91%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.4 => gettext-minimal-0.19.8.1}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.19.4.bb => gettext-minimal-native_0.19.8.1.bb} (93%)
 rename meta/recipes-core/gettext/{gettext_0.19.6.bb => gettext_0.19.8.1.bb} (93%)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.2.4.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.5.bb
 create mode 100644 meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch
 create mode 100644 meta/recipes-devtools/git/git_2.9.2.bb
 delete mode 100644 meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch
 delete mode 100644 meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
 delete mode 100644 meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
 rename meta/recipes-devtools/guile/{guile_2.0.11.bb => guile_2.0.12.bb} (91%)
 delete mode 100644 meta/recipes-extended/slang/slang/change-char-type-to-signed-char-in-macros.patch
 delete mode 100644 meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
 rename meta/recipes-extended/slang/{slang_2.2.4.bb => slang_2.3.0.bb} (82%)

-- 
2.9.0


