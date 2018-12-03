Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id A02E56BE0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 14:03:40 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id o5so4555779iop.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 06:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gi8XmD02pVP5d0YcrcJuuReO3qrYXlO7xM9HCezslrE=;
	b=jZk+imbnawMAfMI88C4GAchhTeYfAkZLVhRS5fYpS0jrzZAClJV6C2Ku/PrZL6p5xM
	Ix3G28B5Y+tD3DKwADbNNKQiwervsMzdbfvc5+b1j6rMsJ8Uc1DbUtdVHh/n0+N3qpC5
	VfK4KoP//wmboQoCCd+2QymL80wjgKJ4thZ8tNtdJvXVLV9LxnSlS5zsef3vTJn9/vr7
	of9yb/v9Bop/vr6uM9oj97i1cflinsWi8mTokzO8JebUMEiNPL/U+ef1f6yi0LZuXKMV
	KUzgNijdqm7wTYH67pcn0pKR3vFI7rRd0ni5KIleS0+OAj3v4asIHrYdnkUHSEpQ99Rm
	m0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gi8XmD02pVP5d0YcrcJuuReO3qrYXlO7xM9HCezslrE=;
	b=MCA5n/beaM7/D12hRzsjIo75ssBQSCUbnGOXR/yWUWCXEmC01Ee1vO3wA3z8Cr/pmC
	06MN1OTSERWOJILG3kZ1iSKTRygvX4bYHAhNXwYdCdMlKV06qrHPtWe9CBEhHZnDvH/0
	WhhPBL7bK2YNLzgZnD1KkpYfhe5NVInqy/IavfpoFMch1qqj2KljNxi/4y8BrH8nCcaq
	Wt+zLWno7CGAWxALaYXmfg1USNE60acDW2o8e52hd8CBMWwvaT/8lDbawu6rmsvSzPo0
	CuyJctfy1CsYD4+jx34t3p1haYKv/V83YKSWY2NyFn8mmkVi1H8syLw8J4gMYBbJZuvG
	3ZWw==
X-Gm-Message-State: AA+aEWYk0QhezuAGxOj0O8pnAPRcbGfT/wv5AHIghkg19WB7CFKyZ/G3
	ks2Oz8gOw4f3FOeF25ofX/ZIt8ogecOuCpCebYL2RQ==
X-Google-Smtp-Source: AFSGD/XdgZ5ZsobeH+9aOf6x7MFljObQYPEInlKQ4P3VCb6+QRe7f+Pd9mrtJPpnve2YV9fwzJfkrJNBDjcP1rnY5OU=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr12462691iog.270.1543845821534;
	Mon, 03 Dec 2018 06:03:41 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543769657.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2018 14:03:29 +0000
Message-ID: <CAJTo0LZec6=7fuPOEq3paUdEZv2MvDj3bh+oj=0496U7=vPMVA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Reimplement perl recipe using perl-cross and update perl to 5.28.0
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
X-List-Received-Date: Mon, 03 Dec 2018 14:03:40 -0000
Content-Type: text/plain; charset="UTF-8"

Awesome work!

Some things to do:
1) show a working ptest on target
2) figure out what to do with intltool: it depends on
libxml-parser-perl-native and so perl-native because that's a
non-standard Perl module that we haven't been assuming is on build
hosts.
3) rewrite that depends mojo to be a proper task like Python has

Ross
On Sun, 2 Dec 2018 at 16:59, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Please see the first patch for the rationale.
>
> The following changes since commit 7faf6a00ba55db5cb5f2c21a72d09df8d784e9e8:
>
>   local.conf.sample: Update the sample config as per new migration manual (2018-12-01 11:44:57 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib akanavin/perl-sanity
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity
>
> Alexander Kanavin (4):
>   perl: add a version that builds the recipe using perl-cross, and
>     update to 5.28.0
>   perl: remove the previous version of the recipe
>   meta/classes: adjust perl-related classes to the new recipes
>   recipes: adjust to the new perl recipe
>
>  meta/classes/cpan-base.bbclass                |    6 +-
>  meta/classes/cpan.bbclass                     |   11 +-
>  meta/classes/cpan_build.bbclass               |    7 +-
>  meta/classes/perl-version.bbclass             |   46 +-
>  .../docbook-xsl-stylesheets_1.79.1.bb         |    1 +
>  .../intltool/intltool_0.51.0.bb               |    2 +-
>  ...er-add-LDFLAGS-when-linking-binary-m.patch |   26 +
>  ...ule-breaks-through-the-perl-wrapper-.patch |   34 +
>  ...h-do-not-quote-the-argument-to-comma.patch |   29 +
>  ...oss-add-LDFLAGS-when-linking-libperl.patch |   27 +
>  .../files}/errno_ver.diff                     |    0
>  .../files}/native-perlinc.patch               |    0
>  .../files}/perl-configpm-switch.patch         |    0
>  .../files}/perl-dynloader.patch               |   12 +-
>  .../perl => perl-sanity/files}/run-ptest      |    0
>  .../{perl => perl-sanity}/perl-ptest.inc      |    4 +-
>  .../perl-sanity/perl-rdepends_5.28.0.inc      | 2173 ++++++++++++++
>  .../perl-sanity/perl_5.28.0.bb                |  224 ++
>  .../perl/perl-native_5.24.4.bb                |  140 -
>  .../perl/perl-rdepends_5.24.4.inc             | 2575 -----------------
>  meta/recipes-devtools/perl/perl.inc           |   10 -
>  ...-fstack-protector-strong-for-native-.patch |  103 -
>  ...-ExtUtils-MM_Unix.pm-fix-race-issues.patch |   52 -
>  ...tests-if-PERL_BUILD_PACKAGING-is-set.patch |  126 -
>  .../perl/perl/CVE-2018-12015.patch            |   48 -
>  .../perl/perl/Configure-multilib.patch        |   17 -
>  .../perl/perl/MM_Unix.pm.patch                |   22 -
>  .../perl/perl/Makefile.SH.patch               |  383 ---
>  .../recipes-devtools/perl/perl/Makefile.patch |   58 -
>  meta/recipes-devtools/perl/perl/config.sh     | 1249 --------
>  meta/recipes-devtools/perl/perl/config.sh-32  |   38 -
>  .../perl/perl/config.sh-32-be                 |    1 -
>  .../perl/perl/config.sh-32-le                 |    1 -
>  meta/recipes-devtools/perl/perl/config.sh-64  |   38 -
>  .../perl/perl/config.sh-64-be                 |    1 -
>  .../perl/perl/config.sh-64-le                 |    1 -
>  .../perl/perl/cross-generate_uudmap.patch     |   15 -
>  .../perl/debian/cpan-missing-site-dirs.diff   |   63 -
>  .../perl/perl/debian/cpan_definstalldirs.diff |   38 -
>  .../perl/perl/debian/db_file_ver.diff         |   35 -
>  .../perl/perl/debian/deprecate-with-apt.diff  |   57 -
>  .../perl/perl/debian/doc_info.diff            |   36 -
>  .../perl/perl/debian/enc2xs_inc.diff          |   71 -
>  .../debian/extutils_set_libperl_path.diff     |   38 -
>  .../perl/perl/debian/fakeroot.diff            |   43 -
>  .../perl/perl/debian/find_html2text.diff      |   36 -
>  .../fixes/document_makemaker_ccflags.diff     |   32 -
>  .../debian/fixes/memoize_storable_nstore.diff |  111 -
>  .../perl/perl/debian/fixes/net_smtp_docs.diff |   26 -
>  .../perl/perl/debian/fixes/perl-Cnn.diff      |   74 -
>  .../fixes/pod_man_reproducible_date.diff      |  171 --
>  .../perl/debian/fixes/podman-empty-date.diff  |   52 -
>  .../perl/perl/debian/fixes/podman-pipe.diff   |  110 -
>  .../perl/debian/fixes/podman-utc-docs.diff    |   87 -
>  .../perl/perl/debian/fixes/podman-utc.diff    |   34 -
>  .../perl/perl/debian/fixes/respect_umask.diff |  154 -
>  .../perl/perl/debian/instmodsh_doc.diff       |   28 -
>  .../perl/perl/debian/ld_run_path.diff         |   25 -
>  .../perl/perl/debian/libnet_config_path.diff  |   38 -
>  .../perl/perl/debian/libperl_embed_doc.diff   |   27 -
>  .../perl/perl/debian/locale-robustness.diff   |   53 -
>  .../perl/perl/debian/makemaker-pasthru.diff   |   31 -
>  .../perl/debian/makemaker_customized.diff     |   43 -
>  .../perl/perl/debian/mod_paths.diff           |  100 -
>  .../perl/debian/no_packlist_perllocal.diff    |   93 -
>  .../perl/perl/debian/patchlevel.diff          |   31 -
>  .../debian/perl5db-x-terminal-emulator.patch  |   30 -
>  .../perl/perl/debian/perlivp.diff             |   40 -
>  .../perl/perl/debian/pod2man-customized.diff  |   24 -
>  .../perl/perl/debian/prefix_changes.diff      |  119 -
>  .../perl/perl/debian/prune_libs.diff          |   43 -
>  .../perl/perl/debian/regen-skip.diff          |   28 -
>  .../perl/perl/debian/skip-kfreebsd-crash.diff |   41 -
>  .../perl/debian/skip-upstream-git-tests.diff  |   29 -
>  .../perl/debian/squelch-locale-warnings.diff  |   57 -
>  .../perl/perl/debian/writable_site_dirs.diff  |   37 -
>  .../perl/perl/dynaloaderhack.patch            |   35 -
>  ...e-hints-linux.pl-link-libgdbm_compat.patch |   35 -
>  ...odbm.t-fix-the-path-of-dbmt_common.p.patch |   33 -
>  .../perl/perl/fix_bad_rpath.patch             |   24 -
>  .../perl/perl/generate-sh.patch               |   56 -
>  .../perl/perl/installperl.patch               |   17 -
>  .../perl/perl/letgcc-find-errno.patch         |   46 -
>  ...regenerate-makefile-failed-while-cc-.patch |   27 -
>  .../perl/perl/native-nopacklist.patch         |   91 -
>  .../perl-5.26.1-guard_old_libcrypt_fix.patch  |   28 -
>  ...Tools-don-t-filter-out-blib-from-INC.patch |   33 -
>  .../perl/perl/perl-archlib-exp.patch          |   40 -
>  .../perl/perl/perl-configure.sh               |   43 -
>  .../perl/perl-errno-generation-gcc5.patch     |   37 -
>  ...ix-conflict-between-skip_all-and-END.patch |  181 --
>  .../perl/perl/perl-moreconfig.patch           |   18 -
>  .../perl/t-run-switches.t-perl5-perl.patch    |   30 -
>  ...st-threads-t-join.t-adjust-ps-option.patch |   38 -
>  ...-DynaLoader.t-fix-calling-dl_findfil.patch |   26 -
>  meta/recipes-devtools/perl/perl_5.24.4.bb     |  353 ---
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |    1 +
>  meta/recipes-extended/groff/groff_1.22.3.bb   |    1 +
>  meta/recipes-extended/texinfo/texinfo_6.5.bb  |    1 +
>  99 files changed, 2585 insertions(+), 8274 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
>  rename meta/recipes-devtools/{perl/perl/debian => perl-sanity/files}/errno_ver.diff (100%)
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/native-perlinc.patch (100%)
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/perl-configpm-switch.patch (100%)
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/perl-dynloader.patch (72%)
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/run-ptest (100%)
>  rename meta/recipes-devtools/{perl => perl-sanity}/perl-ptest.inc (93%)
>  create mode 100644 meta/recipes-devtools/perl-sanity/perl-rdepends_5.28.0.inc
>  create mode 100644 meta/recipes-devtools/perl-sanity/perl_5.28.0.bb
>  delete mode 100644 meta/recipes-devtools/perl/perl-native_5.24.4.bb
>  delete mode 100644 meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
>  delete mode 100644 meta/recipes-devtools/perl/perl.inc
>  delete mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/Configure-multilib.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/Makefile.SH.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/Makefile.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-32
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-32-be
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-32-le
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-64
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-64-be
>  delete mode 100644 meta/recipes-devtools/perl/perl/config.sh-64-le
>  delete mode 100644 meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/doc_info.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fakeroot.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/find_html2text.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/mod_paths.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/patchlevel.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/perlivp.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/prune_libs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/regen-skip.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/dynaloaderhack.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/generate-sh.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/installperl.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
>  delete mode 100755 meta/recipes-devtools/perl/perl/perl-configure.sh
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-errno-generation-gcc5.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-moreconfig.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/t-run-switches.t-perl5-perl.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl_5.24.4.bb
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

