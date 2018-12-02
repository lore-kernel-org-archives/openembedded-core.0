Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 028EA6BC3D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:58:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z5so9739434wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wEZpdg7s/qu1KE27jXSZOXG/ZPglInQ9pceLQeulvB4=;
	b=Rim03GCgEeL9dTV3eKsX9UZsRbcY9aL8fn/VvzTNz+yC3TAFrx8b90tjPYz6Ye/BN5
	VMC4GL/4MF5BzMadU6PbVRzZseonkPfMKLXfjApL3+wNky8YjImVGYv6ly4c/qUbvTBv
	nj4jq3yuO9hptTdgSyl5srivDT/HWUHLPQBiOIWaycJM8zanGtv39bDiEb0fle4IWYw7
	Qe5DaLZAs41c4xFvDo2K0uDaLEfSzqgF+AUtuhr96u9OM0M2BdztGDVQ5UT03iObmEsl
	8wLFzGQ44bSejcE6PwS/QgRm+RNf/ILVga3KiGQ6JEqlrMHL+cS49USZqKHJCG4U/D8q
	6xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wEZpdg7s/qu1KE27jXSZOXG/ZPglInQ9pceLQeulvB4=;
	b=gpWAM3qJBsoIwIOyA4zC/pQyweNLb+4EC7nW29ac8eZr/+XNHkoSDQ6zgrP17mRfXT
	zLB3GxjtmPnBsAmkYcJh3nM6QKFJrA3HddoKfT4eqJO+EBTU69vjJF5uj0xPTLnz5i7L
	VXUISDz3FG6Cnice7sejKFvBVicodLcPWfEOQTDbMrNfPHPrVFnP/x2u7YwvHxA3PGXu
	Tb2/I/EdkAwZvHzgj78lY5y98fCROxQN/FJ4B8V/ZeODNoU+C54XwTLSw+EsD+Jke3PX
	qO+pRXYmBkHAYtpeKANUXb8lm5HphjLpfSSrC2B7o5bTDFyG7OQdFr56dyBrrD3Bnmbv
	KaWg==
X-Gm-Message-State: AA+aEWbL3joFbPKAwJ5yFhApiknI0ueeNdm2yVAQy0mvdPqNkARLNIxl
	yvC4zs7Z9iijSdB5CNKH8pTD7SSS
X-Google-Smtp-Source: AFSGD/U3cknEmpzfSRQkukjKvebSDOPS2PogFNirnoWUrFmV5DHFcuXfn1RUeMQsT1SUzzjDBXuqOA==
X-Received: by 2002:adf:fb4c:: with SMTP id c12mr10764073wrs.297.1543769919944;
	Sun, 02 Dec 2018 08:58:39 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	k135sm6872346wmd.42.2018.12.02.08.58.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 08:58:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2018 17:58:28 +0100
Message-Id: <cover.1543769657.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/4] Reimplement perl recipe using perl-cross and update perl to 5.28.0
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
X-List-Received-Date: Sun, 02 Dec 2018 16:58:40 -0000

Please see the first patch for the rationale.

The following changes since commit 7faf6a00ba55db5cb5f2c21a72d09df8d784e9e8:

  local.conf.sample: Update the sample config as per new migration manual (2018-12-01 11:44:57 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/perl-sanity
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity

Alexander Kanavin (4):
  perl: add a version that builds the recipe using perl-cross, and
    update to 5.28.0
  perl: remove the previous version of the recipe
  meta/classes: adjust perl-related classes to the new recipes
  recipes: adjust to the new perl recipe

 meta/classes/cpan-base.bbclass                |    6 +-
 meta/classes/cpan.bbclass                     |   11 +-
 meta/classes/cpan_build.bbclass               |    7 +-
 meta/classes/perl-version.bbclass             |   46 +-
 .../docbook-xsl-stylesheets_1.79.1.bb         |    1 +
 .../intltool/intltool_0.51.0.bb               |    2 +-
 ...er-add-LDFLAGS-when-linking-binary-m.patch |   26 +
 ...ule-breaks-through-the-perl-wrapper-.patch |   34 +
 ...h-do-not-quote-the-argument-to-comma.patch |   29 +
 ...oss-add-LDFLAGS-when-linking-libperl.patch |   27 +
 .../files}/errno_ver.diff                     |    0
 .../files}/native-perlinc.patch               |    0
 .../files}/perl-configpm-switch.patch         |    0
 .../files}/perl-dynloader.patch               |   12 +-
 .../perl => perl-sanity/files}/run-ptest      |    0
 .../{perl => perl-sanity}/perl-ptest.inc      |    4 +-
 .../perl-sanity/perl-rdepends_5.28.0.inc      | 2173 ++++++++++++++
 .../perl-sanity/perl_5.28.0.bb                |  224 ++
 .../perl/perl-native_5.24.4.bb                |  140 -
 .../perl/perl-rdepends_5.24.4.inc             | 2575 -----------------
 meta/recipes-devtools/perl/perl.inc           |   10 -
 ...-fstack-protector-strong-for-native-.patch |  103 -
 ...-ExtUtils-MM_Unix.pm-fix-race-issues.patch |   52 -
 ...tests-if-PERL_BUILD_PACKAGING-is-set.patch |  126 -
 .../perl/perl/CVE-2018-12015.patch            |   48 -
 .../perl/perl/Configure-multilib.patch        |   17 -
 .../perl/perl/MM_Unix.pm.patch                |   22 -
 .../perl/perl/Makefile.SH.patch               |  383 ---
 .../recipes-devtools/perl/perl/Makefile.patch |   58 -
 meta/recipes-devtools/perl/perl/config.sh     | 1249 --------
 meta/recipes-devtools/perl/perl/config.sh-32  |   38 -
 .../perl/perl/config.sh-32-be                 |    1 -
 .../perl/perl/config.sh-32-le                 |    1 -
 meta/recipes-devtools/perl/perl/config.sh-64  |   38 -
 .../perl/perl/config.sh-64-be                 |    1 -
 .../perl/perl/config.sh-64-le                 |    1 -
 .../perl/perl/cross-generate_uudmap.patch     |   15 -
 .../perl/debian/cpan-missing-site-dirs.diff   |   63 -
 .../perl/perl/debian/cpan_definstalldirs.diff |   38 -
 .../perl/perl/debian/db_file_ver.diff         |   35 -
 .../perl/perl/debian/deprecate-with-apt.diff  |   57 -
 .../perl/perl/debian/doc_info.diff            |   36 -
 .../perl/perl/debian/enc2xs_inc.diff          |   71 -
 .../debian/extutils_set_libperl_path.diff     |   38 -
 .../perl/perl/debian/fakeroot.diff            |   43 -
 .../perl/perl/debian/find_html2text.diff      |   36 -
 .../fixes/document_makemaker_ccflags.diff     |   32 -
 .../debian/fixes/memoize_storable_nstore.diff |  111 -
 .../perl/perl/debian/fixes/net_smtp_docs.diff |   26 -
 .../perl/perl/debian/fixes/perl-Cnn.diff      |   74 -
 .../fixes/pod_man_reproducible_date.diff      |  171 --
 .../perl/debian/fixes/podman-empty-date.diff  |   52 -
 .../perl/perl/debian/fixes/podman-pipe.diff   |  110 -
 .../perl/debian/fixes/podman-utc-docs.diff    |   87 -
 .../perl/perl/debian/fixes/podman-utc.diff    |   34 -
 .../perl/perl/debian/fixes/respect_umask.diff |  154 -
 .../perl/perl/debian/instmodsh_doc.diff       |   28 -
 .../perl/perl/debian/ld_run_path.diff         |   25 -
 .../perl/perl/debian/libnet_config_path.diff  |   38 -
 .../perl/perl/debian/libperl_embed_doc.diff   |   27 -
 .../perl/perl/debian/locale-robustness.diff   |   53 -
 .../perl/perl/debian/makemaker-pasthru.diff   |   31 -
 .../perl/debian/makemaker_customized.diff     |   43 -
 .../perl/perl/debian/mod_paths.diff           |  100 -
 .../perl/debian/no_packlist_perllocal.diff    |   93 -
 .../perl/perl/debian/patchlevel.diff          |   31 -
 .../debian/perl5db-x-terminal-emulator.patch  |   30 -
 .../perl/perl/debian/perlivp.diff             |   40 -
 .../perl/perl/debian/pod2man-customized.diff  |   24 -
 .../perl/perl/debian/prefix_changes.diff      |  119 -
 .../perl/perl/debian/prune_libs.diff          |   43 -
 .../perl/perl/debian/regen-skip.diff          |   28 -
 .../perl/perl/debian/skip-kfreebsd-crash.diff |   41 -
 .../perl/debian/skip-upstream-git-tests.diff  |   29 -
 .../perl/debian/squelch-locale-warnings.diff  |   57 -
 .../perl/perl/debian/writable_site_dirs.diff  |   37 -
 .../perl/perl/dynaloaderhack.patch            |   35 -
 ...e-hints-linux.pl-link-libgdbm_compat.patch |   35 -
 ...odbm.t-fix-the-path-of-dbmt_common.p.patch |   33 -
 .../perl/perl/fix_bad_rpath.patch             |   24 -
 .../perl/perl/generate-sh.patch               |   56 -
 .../perl/perl/installperl.patch               |   17 -
 .../perl/perl/letgcc-find-errno.patch         |   46 -
 ...regenerate-makefile-failed-while-cc-.patch |   27 -
 .../perl/perl/native-nopacklist.patch         |   91 -
 .../perl-5.26.1-guard_old_libcrypt_fix.patch  |   28 -
 ...Tools-don-t-filter-out-blib-from-INC.patch |   33 -
 .../perl/perl/perl-archlib-exp.patch          |   40 -
 .../perl/perl/perl-configure.sh               |   43 -
 .../perl/perl-errno-generation-gcc5.patch     |   37 -
 ...ix-conflict-between-skip_all-and-END.patch |  181 --
 .../perl/perl/perl-moreconfig.patch           |   18 -
 .../perl/t-run-switches.t-perl5-perl.patch    |   30 -
 ...st-threads-t-join.t-adjust-ps-option.patch |   38 -
 ...-DynaLoader.t-fix-calling-dl_findfil.patch |   26 -
 meta/recipes-devtools/perl/perl_5.24.4.bb     |  353 ---
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |    1 +
 meta/recipes-extended/groff/groff_1.22.3.bb   |    1 +
 meta/recipes-extended/texinfo/texinfo_6.5.bb  |    1 +
 99 files changed, 2585 insertions(+), 8274 deletions(-)
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
 create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
 rename meta/recipes-devtools/{perl/perl/debian => perl-sanity/files}/errno_ver.diff (100%)
 rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/perl-dynloader.patch (72%)
 rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/run-ptest (100%)
 rename meta/recipes-devtools/{perl => perl-sanity}/perl-ptest.inc (93%)
 create mode 100644 meta/recipes-devtools/perl-sanity/perl-rdepends_5.28.0.inc
 create mode 100644 meta/recipes-devtools/perl-sanity/perl_5.28.0.bb
 delete mode 100644 meta/recipes-devtools/perl/perl-native_5.24.4.bb
 delete mode 100644 meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
 delete mode 100644 meta/recipes-devtools/perl/perl.inc
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/Configure-multilib.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/Makefile.SH.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/Makefile.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-32
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-32-be
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-32-le
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-64
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-64-be
 delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-64-le
 delete mode 100644 meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/doc_info.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fakeroot.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/find_html2text.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/mod_paths.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/patchlevel.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/perlivp.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/prune_libs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/regen-skip.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/dynaloaderhack.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/generate-sh.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/installperl.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
 delete mode 100755 meta/recipes-devtools/perl/perl/perl-configure.sh
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-moreconfig.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
 delete mode 100644 meta/recipes-devtools/perl/perl_5.24.4.bb

-- 
2.17.1


