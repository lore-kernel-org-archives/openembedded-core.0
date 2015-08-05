Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 299667646B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 22:02:23 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so104301216igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 15:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vv892G249LccYVKoUad82nmS7mbZaEL6XwhlCWxCGnA=;
	b=RX5ZhSwzRvFKPLzb1SLSL0SdzdZ797W6SSiNBF79gCbIpIR7kK6qH2R8j6avW9F9El
	/4AuuyQm5Eefj6Ku/wuL4qUMqCRF6EeXWSpwqECyr5GAya3pD8PNm5JTxaMFUKdto60C
	TQuFjAFxChai4SHwg8AW4lRcxb4gfx8hHnEesJ5586+ZR7WBF7ekW2sZFmPUeMIy8LLT
	IZbCTTIhJ28uhPEMlvui3Dy36OliXmuzf89Kh+VTi5xOqgtr430SfQIeSvtf8rVtxatn
	WrwE1AyzOYzHPNku3FgaD93m/r4AxeTxC4kChSUT3BMIyaX6TvgB6dtvkdCFSherC1gS
	5DuQ==
X-Received: by 10.50.225.35 with SMTP id rh3mr1824056igc.29.1438812143457;
	Wed, 05 Aug 2015 15:02:23 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id 38sm3066983ior.17.2015.08.05.15.02.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 15:02:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 15:02:16 -0700
Message-Id: <cover.1438811921.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Upgrade glibc to 2.22
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
X-List-Received-Date: Wed, 05 Aug 2015 22:02:24 -0000

glibc 2.22 is now released. This has been tested on feature branch for months
now as the release is out, therefore proposing it for master

Khem Raj (2):
  glibc: Upgrade 2.21 -> 2.22
  glibc: Package libmvec when built

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...tive_2.21.bb => cross-localedef-native_2.22.bb} |   35 +-
 ...glibc-initial_2.21.bb => glibc-initial_2.22.bb} |    0
 .../{glibc-locale_2.21.bb => glibc-locale_2.22.bb} |    0
 .../{glibc-mtrace_2.21.bb => glibc-mtrace_2.22.bb} |    0
 meta/recipes-core/glibc/glibc-package.inc          |    2 +-
 ...glibc-scripts_2.21.bb => glibc-scripts_2.22.bb} |    0
 ...ibc-Look-for-host-system-ld.so.cache-as-.patch} |   36 +-
 ...ibc-Fix-buffer-overrun-with-a-relocated-.patch} |   21 +-
 ...ibc-Raise-the-size-of-arrays-containing-.patch} |  126 +-
 ...tps-sourceware.org-ml-libc-ports-2007-12-.patch |   34 +
 ...00-e5500-e6500-603e-fsqrt-implementation.patch} |  222 +-
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |   33 +
 ...Fix-undefined-reference-to-__sqrt_finite.patch} |  192 +-
 ...rt-f-are-now-inline-functions-and-call-o.patch} |  270 +-
 ...ug-1443-which-explains-what-the-patch-do.patch} |   34 +-
 ...-libm-err-tab.pl-with-specific-dirs-in-S.patch} |   19 +-
 ...rt-f-are-now-inline-functions-and-call-o.patch} |   36 +-
 ...rsion-output-matching-grok-gold-s-output.patch} |   34 +-
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |   42 +
 ...ibute.patch => 0014-Add-unused-attribute.patch} |   14 +-
 ...ng-SSE-also-make-sure-that-fpmath-is-not.patch} |    6 +-
 ...hin-the-path-sets-wrong-config-variables.patch} |   30 +-
 ...timezone-re-written-tzselect-as-posix-sh.patch} |   31 +-
 ...-Cross-building-and-testing-instructions.patch} |  143 +-
 ...-Eglibc-option-group-infrastructure-to-g.patch} |  607 ++-
 ...20-eglibc-Help-bootstrap-cross-toolchain.patch} |   67 +-
 ...y-picked-from-http-www.eglibc.org-archiv.patch} |   30 +-
 ... 0022-eglibc-Clear-cache-lines-on-ppc8xx.patch} |   33 +-
 ...023-eglibc-Resolve-__fpscr_values-on-SH4.patch} |   48 +-
 ...rward-port-eglibc-options-groups-support.patch} | 5521 ++++++++++----------
 ...atch => 0025-eglibc-Install-PIC-archives.patch} |   44 +-
 ...bug_mask-is-controlled-by-__OPTION_EGLIB.patch} |  647 +--
 ...option-groups-Conditionally-exclude-c-tes.patch |  144 +
 ...81-resolv-nss_dns-dns-host.c-buffer-overf.patch |   43 -
 .../glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch  |   36 -
 .../glibc/glibc/IO-acquire-lock-fix.patch          |   17 -
 .../glibc/glibc/add_resource_h_to_wait_h.patch     |   20 -
 .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 -
 .../glibc/glibc/fix-tibetian-locales.patch         |   38 -
 .../glibc/glibc/fix_am_rootsbindir.patch           |   29 -
 .../recipes-core/glibc/glibc/initgroups_keys.patch |   20 -
 meta/recipes-core/glibc/glibc/makesyscall.patch    |   51 -
 .../glibc/glibc/mips-rld-map-check.patch           |   27 -
 .../glibc/glibc/multilib_readlib.patch             |   19 -
 .../glibc/{glibc_2.21.bb => glibc_2.22.bb}         |   93 +-
 46 files changed, 4661 insertions(+), 4271 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.21.bb => cross-localedef-native_2.22.bb} (50%)
 rename meta/recipes-core/glibc/{glibc-initial_2.21.bb => glibc-initial_2.22.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.21.bb => glibc-locale_2.22.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.21.bb => glibc-mtrace_2.22.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.21.bb => glibc-scripts_2.22.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{ld-search-order.patch => 0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch} (70%)
 rename meta/recipes-core/glibc/glibc/{relocatable_sdk_fix_openpath.patch => 0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch} (64%)
 rename meta/recipes-core/glibc/glibc/{relocatable_sdk.patch => 0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch} (63%)
 create mode 100644 meta/recipes-core/glibc/glibc/0004-Backport-https-sourceware.org-ml-libc-ports-2007-12-.patch
 rename meta/recipes-core/glibc/glibc/{glibc.fix_sqrt2.patch => 0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch} (86%)
 create mode 100644 meta/recipes-core/glibc/glibc/0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
 rename meta/recipes-core/glibc/glibc/{ppc-sqrt_finite.patch => 0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch} (40%)
 rename meta/recipes-core/glibc/glibc/{ppc_slow_ieee754_sqrt.patch => 0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (53%)
 rename meta/recipes-core/glibc/glibc/{0001-R_ARM_TLS_DTPOFF32.patch => 0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch} (78%)
 rename meta/recipes-core/glibc/glibc/{0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch => 0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch} (69%)
 rename meta/recipes-core/glibc/glibc/{ppce6500-32b_slow_ieee754_sqrt.patch => 0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch} (46%)
 rename meta/recipes-core/glibc/glibc/{grok_gold.patch => 0012-Make-ld-version-output-matching-grok-gold-s-output.patch} (62%)
 create mode 100644 meta/recipes-core/glibc/glibc/0013-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch
 rename meta/recipes-core/glibc/glibc/{0001-Add-unused-attribute.patch => 0014-Add-unused-attribute.patch} (78%)
 rename meta/recipes-core/glibc/glibc/{0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch => 0015-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch} (83%)
 rename meta/recipes-core/glibc/glibc/{0001-yes-within-the-path-sets-wrong-config-variables.patch => 0016-yes-within-the-path-sets-wrong-config-variables.patch} (87%)
 rename meta/recipes-core/glibc/glibc/{timezone-re-written-tzselect-as-posix-sh.patch => 0017-timezone-re-written-tzselect-as-posix-sh.patch} (53%)
 rename meta/recipes-core/glibc/glibc/{eglibc.patch => 0018-eglibc-Cross-building-and-testing-instructions.patch} (83%)
 rename meta/recipes-core/glibc/glibc/{option-groups.patch => 0019-eglibc-Bring-Eglibc-option-group-infrastructure-to-g.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{eglibc-header-bootstrap.patch => 0020-eglibc-Help-bootstrap-cross-toolchain.patch} (52%)
 rename meta/recipes-core/glibc/glibc/{eglibc-resolv-dynamic.patch => 0021-eglibc-cherry-picked-from-http-www.eglibc.org-archiv.patch} (65%)
 rename meta/recipes-core/glibc/glibc/{eglibc-ppc8xx-cache-line-workaround.patch => 0022-eglibc-Clear-cache-lines-on-ppc8xx.patch} (68%)
 rename meta/recipes-core/glibc/glibc/{eglibc-sh4-fpscr_values.patch => 0023-eglibc-Resolve-__fpscr_values-on-SH4.patch} (50%)
 rename meta/recipes-core/glibc/glibc/{eglibc-use-option-groups.patch => 0024-eglibc-Forward-port-eglibc-options-groups-support.patch} (90%)
 rename meta/recipes-core/glibc/glibc/{eglibc-install-pic-archives.patch => 0025-eglibc-Install-PIC-archives.patch} (80%)
 rename meta/recipes-core/glibc/glibc/{GLRO_dl_debug_mask.patch => 0026-eglibc-dl_debug_mask-is-controlled-by-__OPTION_EGLIB.patch} (68%)
 create mode 100644 meta/recipes-core/glibc/glibc/0027-eglibc-use-option-groups-Conditionally-exclude-c-tes.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-1781-resolv-nss_dns-dns-host.c-buffer-overf.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/Fix-__memcpy_chk-on-non-SSE2-CPUs.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/IO-acquire-lock-fix.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/add_resource_h_to_wait_h.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/fix-tibetian-locales.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/fix_am_rootsbindir.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/initgroups_keys.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/makesyscall.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/mips-rld-map-check.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/multilib_readlib.patch
 rename meta/recipes-core/glibc/{glibc_2.21.bb => glibc_2.22.bb} (58%)

-- 
2.1.4


