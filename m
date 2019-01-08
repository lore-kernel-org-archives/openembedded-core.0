Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 53C296D44F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 18:49:12 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v11so5565099qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 10:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Siwker4vcLanoSZ0hSAlwhqfh6M0xPacA6x6xnf9oW4=;
	b=gpYYAnnC/1pqx1CYYa7yR+E31sDPvUAA9tSgAj2kQrrMMH02aHunab7H2iS0++dcNw
	4/Ge6hC4EXreWFHM/tKwIS43CKLJbw4CbiaXgFX5zkMC/jpSdip8IOkYhuTwGc3FbQF/
	zL9qAiR3wYjUFIfBsyzGuH+9OcO2LuaSBTvvFM4/zfqOvrXmQv+5LJJc8D7tPJXWXZyA
	+tzOXUll9vjD9Re6tPH52oMavXEVjBQrP7iEN3GFJojeXMVSoplt3NhuYFvOLCuF1sIT
	ui5jnjPc0pF0174aL0jXzddd+WL7nXhFgRrsk/LZqFgURgPVhcpxzGYGmI19q/Y1H7hW
	ZR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Siwker4vcLanoSZ0hSAlwhqfh6M0xPacA6x6xnf9oW4=;
	b=j2PeJeF+eIf2DJU/wDQfWZ1HNp+C1x0/E1UJ3lmVehjEulM/J6EmH9CyZ5BVLKGA6I
	psb4yzfnWTuQcVOig+6vwaozrYeKBgGMa+uUj5mIOtOpHo0Y4yngsGaLLGw5uvIAd5a1
	tjyp342JLLhmbx53JxE0UQygOkiegPpWULlDI4GRC/xHDUUQJtrZcxPW4lP48r4Kb6kZ
	Uw8H/bNkEtMQd+EV9Snl49HpVotNk57RV0jqlR6C16Wle9bEnVXMFk4b7Pwv2Rm/ubj0
	Jw6UK+hTBiLcyuAfbT4S+AClZaWrARqQ/EEuwrd8rpQgAjzGctLzH8cHTBirj66AAPda
	RrhQ==
X-Gm-Message-State: AJcUukddH1Tf/ClSGVs/jDXi0qFxVJZshsWycxQ3aX4e775dhE0T1aXK
	zrORWB8/ZS1IGnNfDuDW7hpul8xuCmjUf0i5xf0=
X-Google-Smtp-Source: ALg8bN5EQ2w6igNgodkPKOA9pXYrW4LDAJB4o2YlOxCzQq1umrLg4m+PQEXqS7ClQCPiA5pRMpDsrThtrUHUjeOHwcY=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr2770383qvd.224.1546973352834; 
	Tue, 08 Jan 2019 10:49:12 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546961583.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1546961583.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jan 2019 10:48:46 -0800
Message-ID: <CAMKF1spfq3brB-L+YCWY7joFC41KshZZwLzQcha3wEO3otBiQw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Reimplement perl recipe using perl-cross and update perl to 5.28.1
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
X-List-Received-Date: Tue, 08 Jan 2019 18:49:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 7:36 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Please see the first patch for the rationale.
>
> The following changes since commit 4dd51032160897be4132242d6aaaf4dd1e5167da:
>
>   oeqa/sdk: add test to exercise Meson (2019-01-08 11:16:45 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib akanavin/perl-sanity
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/perl-sanity
>

There were several recipes in extended layers such as
meta-openembedded which failed
in last attempt, have someone considered the failures that I reported
last time ?
maybe Richard can stage it in master-next and we can give it another shot.

> Alexander Kanavin (3):
>   perl: add a version that builds the recipe using perl-cross, and
>     update to 5.28.1
>   perl: remove the previous version of the recipe
>   meta/classes: adjust perl-related classes to the new recipes
>
>  meta/classes/cpan-base.bbclass                |    6 +-
>  meta/classes/cpan.bbclass                     |   11 +-
>  meta/classes/cpan_build.bbclass               |    7 +-
>  meta/classes/perl-version.bbclass             |   46 +-
>  ...er-add-LDFLAGS-when-linking-binary-m.patch |   26 +
>  ...ule-breaks-through-the-perl-wrapper-.patch |   34 +
>  ...h-do-not-hardcode-prefix-lib-as-libr.patch |   69 +
>  ...h-do-not-quote-the-argument-to-comma.patch |   29 +
>  ...oss-add-LDFLAGS-when-linking-libperl.patch |   27 +
>  .../files}/errno_ver.diff                     |    0
>  .../files/fix-race-failures-2.patch           |   34 +
>  .../perl-sanity/files/fix-race-failures.patch |   36 +
>  .../files}/native-perlinc.patch               |    1 +
>  .../files}/perl-configpm-switch.patch         |    0
>  .../files}/perl-dynloader.patch               |   12 +-
>  .../perl-sanity/files/perl-rdepends.txt       | 4296 +++++++++++++++++
>  .../perl => perl-sanity/files}/run-ptest      |    0
>  .../{perl => perl-sanity}/perl-ptest.inc      |    4 +-
>  .../perl-sanity/perl_5.28.1.bb                |  298 ++
>  .../perl/perl-native_5.24.4.bb                |  141 -
>  .../perl/perl-rdepends_5.24.4.inc             | 2575 ----------
>  meta/recipes-devtools/perl/perl.inc           |   10 -
>  ...-fstack-protector-strong-for-native-.patch |  103 -
>  ...-ExtUtils-MM_Unix.pm-fix-race-issues.patch |   52 -
>  ...tests-if-PERL_BUILD_PACKAGING-is-set.patch |  126 -
>  .../perl/perl/CVE-2018-12015.patch            |   48 -
>  .../perl/perl/Configure-multilib.patch        |   17 -
>  .../perl/perl/MM_Unix.pm.patch                |   22 -
>  .../perl/perl/Makefile.SH.patch               |  383 --
>  .../recipes-devtools/perl/perl/Makefile.patch |   58 -
>  meta/recipes-devtools/perl/perl/config.sh     | 1249 -----
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
>  .../fixes/pod_man_reproducible_date.diff      |  171 -
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
>  ...ix-conflict-between-skip_all-and-END.patch |  181 -
>  .../perl/perl/perl-moreconfig.patch           |   18 -
>  .../perl/t-run-switches.t-perl5-perl.patch    |   30 -
>  ...st-threads-t-join.t-adjust-ps-option.patch |   38 -
>  ...-DynaLoader.t-fix-calling-dl_findfil.patch |   26 -
>  meta/recipes-devtools/perl/perl_5.24.4.bb     |  354 --
>  97 files changed, 4917 insertions(+), 8275 deletions(-)
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
>  rename meta/recipes-devtools/{perl/perl/debian => perl-sanity/files}/errno_ver.diff (100%)
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/fix-race-failures-2.patch
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/fix-race-failures.patch
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/native-perlinc.patch (94%)
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/perl-configpm-switch.patch (100%)
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/perl-dynloader.patch (72%)
>  create mode 100644 meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
>  rename meta/recipes-devtools/{perl/perl => perl-sanity/files}/run-ptest (100%)
>  rename meta/recipes-devtools/{perl => perl-sanity}/perl-ptest.inc (93%)
>  create mode 100644 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
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

