Return-Path: <max.eliaser@intel.com>
X-Greylist: delayed 598 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 May 2014 20:11:57 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5FBD65D7F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 20:11:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2014 12:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,966,1389772800"; d="scan'208";a="504542970"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.155])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2014 13:01:59 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 May 2014 13:00:27 -0700
Message-Id: <cover.1398973767.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Add texinfo.bbclass; recipes that use texinfo utils at build-time inherit it.
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
X-List-Received-Date: Thu, 01 May 2014 20:11:59 -0000

Hello list,

As per discussion with Richard Purdie and others, I'm submitting a patch to add
a class inherited by any recipe whose upstream package invokes the texinfo 
utilities at build-time. The class currently does nothing; the purpose of this
commit is just to identify for future reference the recipes that currently 
depend implicitly on the host system's texinfo utilities. 

In the future, this class could be used to suppress the generation/formatting of
documentation for performance (see bug 2421 [1]) and eliminate Yocto's current
dependency on the host system's texinfo utilities.

Regards,
-Max Eliaser

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=2421
The following changes since commit 68efcde3cf458445b7a37dee7fdae83da9ab3b2d:

  tcmode-default: Update PREFERRED_PROVIDERS (2014-05-01 09:41:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/mark-texinfo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/mark-texinfo

Max Eliaser (1):
  Add texinfo.bbclass; recipes that use texinfo utils at build-time
    inherit it.

 meta/classes/texinfo.bbclass                            | 2 ++
 meta/recipes-bsp/grub/grub-efi_2.00.bb                  | 4 +---
 meta/recipes-bsp/grub/grub_0.97.bb                      | 2 +-
 meta/recipes-bsp/grub/grub_2.00.bb                      | 3 +--
 meta/recipes-bsp/grub/grub_git.bb                       | 3 +--
 meta/recipes-core/coreutils/coreutils_6.9.bb            | 2 +-
 meta/recipes-core/coreutils/coreutils_8.22.bb           | 2 +-
 meta/recipes-core/eglibc/eglibc.inc                     | 2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb             | 2 +-
 meta/recipes-core/gettext/gettext_0.18.3.2.bb           | 2 +-
 meta/recipes-core/readline/readline.inc                 | 2 +-
 meta/recipes-devtools/autoconf/autoconf.inc             | 2 +-
 meta/recipes-devtools/autogen/autogen-native_5.18.2.bb  | 2 +-
 meta/recipes-devtools/automake/automake.inc             | 2 +-
 meta/recipes-devtools/binutils/binutils.inc             | 2 +-
 meta/recipes-devtools/bison/bison_2.3.bb                | 2 +-
 meta/recipes-devtools/bison/bison_2.7.1.bb              | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc           | 2 +-
 meta/recipes-devtools/flex/flex.inc                     | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc                | 2 +-
 meta/recipes-devtools/gdb/gdb-common.inc                | 2 +-
 meta/recipes-devtools/guile/guile_2.0.9.bb              | 2 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc         | 2 +-
 meta/recipes-devtools/m4/m4.inc                         | 2 +-
 meta/recipes-devtools/make/make.inc                     | 2 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb            | 2 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb           | 2 +-
 meta/recipes-extended/bash/bash.inc                     | 2 +-
 meta/recipes-extended/bc/bc_1.06.bb                     | 2 +-
 meta/recipes-extended/cpio/cpio_v2.inc                  | 2 +-
 meta/recipes-extended/diffutils/diffutils.inc           | 2 +-
 meta/recipes-extended/ed/ed_0.5.bb                      | 2 +-
 meta/recipes-extended/ed/ed_1.9.bb                      | 2 ++
 meta/recipes-extended/findutils/findutils.inc           | 2 +-
 meta/recipes-extended/gawk/gawk_3.1.5.bb                | 2 +-
 meta/recipes-extended/gawk/gawk_4.0.2.bb                | 2 +-
 meta/recipes-extended/grep/grep_2.18.bb                 | 2 +-
 meta/recipes-extended/grep/grep_2.5.1a.bb               | 2 +-
 meta/recipes-extended/groff/groff_1.18.1.4.bb           | 2 +-
 meta/recipes-extended/groff/groff_1.22.2.bb             | 2 +-
 meta/recipes-extended/gzip/gzip.inc                     | 2 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb           | 2 +-
 meta/recipes-extended/libidn/libidn_1.28.bb             | 2 +-
 meta/recipes-extended/parted/parted_3.1.bb              | 2 +-
 meta/recipes-extended/screen/screen_4.0.3.bb            | 2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb                  | 2 +-
 meta/recipes-extended/sed/sed_4.2.2.bb                  | 2 +-
 meta/recipes-extended/tar/tar.inc                       | 2 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb        | 2 +-
 meta/recipes-extended/time/time.inc                     | 2 +-
 meta/recipes-extended/wget/wget.inc                     | 2 +-
 meta/recipes-extended/which/which_2.18.bb               | 2 +-
 meta/recipes-extended/which/which_2.20.bb               | 2 +-
 meta/recipes-gnome/libffi/libffi_3.0.13.bb              | 2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb          | 2 +-
 meta/recipes-support/gdbm/gdbm_1.11.bb                  | 2 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb                 | 2 +-
 meta/recipes-support/gmp/gmp.inc                        | 2 +-
 meta/recipes-support/gmp/gmp_4.2.1.bb                   | 2 +-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb               | 2 +-
 meta/recipes-support/gnupg/gnupg_2.0.22.bb              | 2 +-
 meta/recipes-support/gnutls/gnutls.inc                  | 2 +-
 meta/recipes-support/gnutls/libtasn1_3.4.bb             | 2 +-
 meta/recipes-support/gpgme/gpgme_1.4.3.bb               | 2 +-
 meta/recipes-support/libassuan/libassuan_2.1.1.bb       | 2 +-
 meta/recipes-support/libcheck/libcheck_0.9.12.bb        | 2 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc            | 2 +-
 meta/recipes-support/libksba/libksba_1.3.0.bb           | 2 +-
 meta/recipes-support/libmpc/libmpc.inc                  | 2 +-
 meta/recipes-support/libunistring/libunistring_0.9.3.bb | 2 +-
 meta/recipes-support/mpfr/mpfr.inc                      | 2 +-
 71 files changed, 73 insertions(+), 73 deletions(-)
 create mode 100644 meta/classes/texinfo.bbclass

-- 
1.8.3.2


