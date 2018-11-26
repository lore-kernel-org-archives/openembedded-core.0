Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
	[209.85.167.177])
	by mail.openembedded.org (Postfix) with ESMTP id CF4376C593
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:04:30 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id v6so16092690oif.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=L2d8oBWW6/7Ip0zQzShIRUExKyKTZzMRihqVTRd6ioI=;
	b=Ez+WBFr8ZJIkkMLz//n0lAvWznpmdQ85OPFTXinMy5JXAo5J0JrDJ61uqXaLR2dHN1
	vQi2oeKrwutuNNhloC0ERysH2CoT0Da6YKfn/VdJn1FRgaz19mEOhQC2sDx0AULl+8TI
	uVC3XULTbnVj9qk1MgtnozC8/Q/PuI/ECL8M/zF0z/oX6K92BJqhczHwBOBgQXqw3R4F
	TMDPuUQUAFZtBTBb8XbJsV92Y23ZjKbNdR8NAUr9hjMGpXAXOfHQyi4SvbnzKnTDK26O
	ayHx7Hra4iwc6eiaIY3WR30dautienKJrw14lC9jIGoUK9nQl36SfqZmrVIhWo8BxLQb
	dNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=L2d8oBWW6/7Ip0zQzShIRUExKyKTZzMRihqVTRd6ioI=;
	b=mc5sCXwBv5SJXs9H9DduMbRP6TpLMO5/UCeBmA51LligVsPLN69TvllTZTZHco0wmq
	EhNncg+afWy0ZeY8kArSLSkymSGWYiQCkKXC+z1LrJ2TwphKiZYiobZz3X9/fonNAih+
	ki/gvDXiXv5al6Eg9Dlp6eJxQCKRi+b57+dy42rjlj6W0NuN4Zy5J4q+ULfWEqrQ05MI
	zpny1wI7JZRvKxSotd8NEjxrbZJYhujNQ6sPO4XK1Cm38kF0/o92vlY9JgszYqpbXqES
	5YGnFgZB2iJMgn482o0WPaH/m+OCPQ6y8Y2ZzvrZjaf+UO9qkHTqvL+wXx2YjTfwAm+g
	vIKA==
X-Gm-Message-State: AGRZ1gIFTIPFStN59mEu0mGpgb9JeobD8flWnO2vSRSfWSfxfDLj0x9c
	astQrutxVwxw8urrPZYwlaBRl8eIrWcNuLgtiJCY3Q==
X-Google-Smtp-Source: AJdET5fGtE+CI90ca/DWiY1swvpIpTkAskMGAQFtGw9nZhWSoN1btzZdACT5r9tWvtz+K1e+uWK49+CjR5ieot7Eq1Q=
X-Received: by 2002:aca:2dc9:: with SMTP id
	t192mr16203168oit.325.1543244671396; 
	Mon, 26 Nov 2018 07:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20181126144308.13862-1-sno@netbsd.org>
In-Reply-To: <20181126144308.13862-1-sno@netbsd.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Nov 2018 16:04:12 +0100
Message-ID: <CANNYZj8gJiXCBBqFb-gLvV83RhO7StKxGiaTnjE_iuMK7ZGG-Q@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl{,-native}: Update 5.24.4 -> 5.28.0
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
X-List-Received-Date: Mon, 26 Nov 2018 15:04:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have an alternative patch that effectively rewrites the perl recipe
using perl-cross overlay from buildroot project. The advantage of
using that is that the recipe is much more compact and maintainable,
there are only about five custom patches to make the thing build, the
cross-build process is far saner and understandable - and also the
build time goes from several minutes to 30 seconds or so. I did not
re-implement the RDEPENDS generator, but that can be added.

I'll post this in a moment, and perhaps people interested in perl
(e.g. meta-perl maintainers) can provide feedback.

Alex


On Mon, 26 Nov 2018 at 15:43, Jens Rehsack <sno@netbsd.org> wrote:
>
> Update recipe for Perl Programming Language to 5.28.0:
> * update debian patches from perl_5.28.0-4.debian.tar.xz
> * re-introduce separation between platform specific and platform
>   independent library directories
> * introduce non-threaded Perl (by default), since it's up to 30%
>   faster
> * add alternatives for bundled bin/* scripts fof core-modules
> * add create_rdepends_inc() for rdepends.inc update
>
> Changes in Perl Programming Language contained in this update:
> * https://metacpan.org/pod/release/XSAWYERX/perl-5.28.0/pod/perldelta.pod
> * https://metacpan.org/pod/release/XSAWYERX/perl-5.28.0/pod/perl5260delta=
.pod
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/cpan.bbclass                     |    5 +-
>  meta/classes/cpan_build.bbclass               |    3 +-
>  meta/classes/perl-version.bbclass             |   41 +
>  .../perl/perl-native_5.24.4.bb                |  140 -
>  .../perl/perl-native_5.28.0.bb                |  144 +
>  .../perl/perl-rdepends_5.24.4.inc             | 2575 ---------------
>  .../perl/perl-rdepends_5.28.0.inc             | 2821 +++++++++++++++++
>  meta/recipes-devtools/perl/perl.inc           |    2 +-
>  ...-ExtUtils-MM_Unix.pm-fix-race-issues.patch |   52 -
>  ...tests-if-PERL_BUILD_PACKAGING-is-set.patch |  126 -
>  .../perl/perl/CVE-2018-12015.patch            |   48 -
>  .../perl/perl/MM_Unix.pm.patch                |   19 +-
>  .../perl/perl/Makefile.SH.patch               |  174 +-
>  meta/recipes-devtools/perl/perl/config.sh     |  159 +-
>  .../perl/debian/cpan-missing-site-dirs.diff   |    7 +-
>  .../perl/perl/debian/cpan_definstalldirs.diff |    9 +-
>  .../perl/perl/debian/db_file_ver.diff         |    5 +-
>  .../perl/perl/debian/deprecate-with-apt.diff  |   28 +-
>  .../perl/perl/debian/disable-stack-check.diff |   64 +
>  .../perl/perl/debian/doc_info.diff            |    7 +-
>  .../perl/perl/debian/enc2xs_inc.diff          |   15 +-
>  .../perl/perl/debian/errno-include-path.diff  |   75 +
>  .../perl/perl/debian/errno_ver.diff           |   41 +-
>  .../debian/extutils_set_libperl_path.diff     |   20 +-
>  .../perl/perl/debian/fakeroot.diff            |    9 +-
>  .../perl/perl/debian/find_html2text.diff      |    7 +-
>  .../fixes/document_makemaker_ccflags.diff     |    7 +-
>  .../perl/perl/debian/fixes/eumm-usrmerge.diff |  124 +
>  .../debian/fixes/in-place-edit-handles.diff   |   99 +
>  .../fixes/math_complex_doc_angle_units.diff   |   28 +
>  .../fixes/math_complex_doc_great_circle.diff  |   25 +
>  .../fixes/math_complex_doc_see_also.diff      |   25 +
>  .../perl/perl/debian/fixes/memoize-pod.diff   |   34 +
>  .../debian/fixes/memoize_storable_nstore.diff |    7 +-
>  .../perl/perl/debian/fixes/net_smtp_docs.diff |   26 -
>  .../perl/perl/debian/fixes/perl-Cnn.diff      |   74 -
>  .../fixes/pod_man_reproducible_date.diff      |  171 -
>  .../perl/debian/fixes/podman-empty-date.diff  |   52 -
>  .../perl/perl/debian/fixes/podman-pipe.diff   |  110 -
>  .../perl/debian/fixes/podman-utc-docs.diff    |   87 -
>  .../perl/perl/debian/fixes/podman-utc.diff    |   34 -
>  .../perl/perl/debian/fixes/respect_umask.diff |   47 +-
>  .../perl/debian/fixes/storable-recursion.diff |  292 ++
>  .../perl/perl/debian/gdbm-fatal.diff          |   26 +
>  .../perl/perl/debian/installman-utf8.diff     |   28 +
>  .../perl/perl/debian/instmodsh_doc.diff       |    7 +-
>  .../perl/perl/debian/ld_run_path.diff         |   20 +-
>  .../perl/perl/debian/libnet_config_path.diff  |    9 +-
>  .../perl/perl/debian/libperl_embed_doc.diff   |    7 +-
>  .../perl/perl/debian/locale-robustness.diff   |   53 -
>  .../perl/perl/debian/makemaker-manext.diff    |   31 +
>  .../perl/perl/debian/makemaker-pasthru.diff   |    7 +-
>  .../perl/debian/makemaker_customized.diff     |   43 -
>  .../perl/perl/debian/mod_paths.diff           |   43 +-
>  .../perl/debian/no_packlist_perllocal.diff    |   93 -
>  .../perl/perl/debian/patchlevel.diff          |    5 +-
>  .../debian/perl5db-x-terminal-emulator.patch  |    7 +-
>  .../perl/perl/debian/perldoc-pager.diff       |   28 +
>  .../perl/perl/debian/perlivp.diff             |    7 +-
>  .../perl/perl/debian/pod2man-customized.diff  |   24 -
>  .../perl/perl/debian/prefix_changes.diff      |  119 -
>  .../perl/perl/debian/prune_libs.diff          |   43 -
>  .../perl/perl/debian/regen-skip.diff          |   28 -
>  .../perl/perl/debian/skip-kfreebsd-crash.diff |   41 -
>  .../perl/debian/skip-upstream-git-tests.diff  |   29 -
>  .../perl/debian/squelch-locale-warnings.diff  |   25 +-
>  .../perl/perl/debian/writable_site_dirs.diff  |   11 +-
>  .../perl/perl/fix_bad_rpath.patch             |   14 +-
>  .../perl/fix_configpm_no_dot_in_INC.patch     |   20 +
>  ...rite_buildcustomize.pl_no_dot_in_INC.patch |   15 +
>  .../perl/perl/letgcc-find-errno.patch         |   14 +-
>  .../perl/perl/native-nopacklist.patch         |   91 -
>  .../perl-5.26.1-guard_old_libcrypt_fix.patch  |   28 -
>  ...Tools-don-t-filter-out-blib-from-INC.patch |   33 -
>  .../perl/perl/perl-dynloader.patch            |    8 +-
>  ...ix-conflict-between-skip_all-and-END.patch |  181 --
>  .../perl/perl/perl-moreconfig.patch           |   10 +-
>  meta/recipes-devtools/perl/perl_5.24.4.bb     |  353 ---
>  meta/recipes-devtools/perl/perl_5.28.0.bb     |  472 +++
>  79 files changed, 4774 insertions(+), 5037 deletions(-)
>  delete mode 100644 meta/recipes-devtools/perl/perl-native_5.24.4.bb
>  create mode 100644 meta/recipes-devtools/perl/perl-native_5.28.0.bb
>  delete mode 100644 meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
>  create mode 100644 meta/recipes-devtools/perl/perl-rdepends_5.28.0.inc
>  delete mode 100644 meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix=
.pm-fix-race-issues.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/0001-Skip-various-tes=
ts-if-PERL_BUILD_PACKAGING-is-set.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/disable-stack-=
check.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/errno-include-=
path.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/eumm-usr=
merge.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/in-place=
-edit-handles.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/math_com=
plex_doc_angle_units.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/math_com=
plex_doc_great_circle.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/math_com=
plex_doc_see_also.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/memoize-=
pod.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/net_smtp=
_docs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn=
.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/pod_man_=
reproducible_date.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-e=
mpty-date.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-p=
ipe.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-u=
tc-docs.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-u=
tc.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/storable=
-recursion.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/gdbm-fatal.dif=
f
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/installman-utf=
8.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/locale-robustn=
ess.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker-mane=
xt.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker_cust=
omized.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/no_packlist_pe=
rllocal.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/debian/perldoc-pager.=
diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/pod2man-custom=
ized.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/prefix_changes=
.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/prune_libs.dif=
f
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/regen-skip.dif=
f
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-=
crash.diff
>  delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-upstream-=
git-tests.diff
>  create mode 100644 meta/recipes-devtools/perl/perl/fix_configpm_no_dot_i=
n_INC.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/fix_write_buildcustom=
ize.pl_no_dot_in_INC.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist.pat=
ch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old=
_libcrypt_fix.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-=
filter-out-blib-from-INC.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-bet=
ween-skip_all-and-END.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl_5.24.4.bb
>  create mode 100644 meta/recipes-devtools/perl/perl_5.28.0.bb
>
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 511fe3fb92..121643eecb 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -10,10 +10,11 @@ EXTRA_PERLFLAGS ?=3D ""
>  export PERLCONFIGTARGET =3D "${@is_target(d)}"
>
>  # Env var which tells perl where the perl include files are
> -export PERL_INC =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}/CORE"
> +export PERL_INC =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}/${@get_perl_arch(d)}/CORE"
>  export PERL_LIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_v=
ersion(d)}"
> -export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_pe=
rl_version(d)}"
> +export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_pe=
rl_version(d)}/${@get_perl_arch(d)}"
>  export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get=
_perl_version(d)}/"
> +export PERLHOSTARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${=
@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
>
>  cpan_do_configure () {
>         yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor=
 NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 PERL=3D$(which perl) ${EXTRA_CPANFLAGS}
> diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bb=
class
> index 9a2ad895ef..14c8aad772 100644
> --- a/meta/classes/cpan_build.bbclass
> +++ b/meta/classes/cpan_build.bbclass
> @@ -7,8 +7,9 @@ EXTRA_CPAN_BUILD_FLAGS ?=3D ""
>
>  # Env var which tells perl if it should use host (no) or target (yes) se=
ttings
>  export PERLCONFIGTARGET =3D "${@is_target(d)}"
> -export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_pe=
rl_version(d)}"
> +export PERL_ARCHLIB =3D "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_pe=
rl_version(d)}/${@get_perl_arch(d)}"
>  export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get=
_perl_version(d)}/"
> +export PERLHOSTARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${=
@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
>  export LD =3D "${CCLD}"
>
>  cpan_build_do_configure () {
> diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-versio=
n.bbclass
> index fafe68a775..6b0e70aa32 100644
> --- a/meta/classes/perl-version.bbclass
> +++ b/meta/classes/perl-version.bbclass
> @@ -22,3 +22,44 @@ def get_perl_version(d):
>
>  PERLVERSION :=3D "${@get_perl_version(d)}"
>  PERLVERSION[vardepvalue] =3D ""
> +
> +# Determine the staged arch of perl from the perl configuration file
> +# Assign vardepvalue, because otherwise signature is changed before and =
after
> +# perl is built (from None to real version in config.sh).
> +def get_perl_arch(d):
> +    import re
> +    cfg =3D d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
> +    try:
> +        f =3D open(cfg, 'r')
> +    except IOError:
> +        return None
> +    l =3D f.readlines();
> +    f.close();
> +    r =3D re.compile("^archname=3D'([^']*)'")
> +    for s in l:
> +        m =3D r.match(s)
> +        if m:
> +            return m.group(1)
> +    return None
> +
> +PERLARCH :=3D "${@get_perl_arch(d)}"
> +PERLARCH[vardepvalue] =3D ""
> +
> +# Determine the staged arch of perl-native from the perl configuration f=
ile
> +# Assign vardepvalue, because otherwise signature is changed before and =
after
> +# perl is built (from None to real version in config.sh).
> +def get_perl_hostarch(d):
> +    import re
> +    cfg =3D d.expand('${STAGING_LIBDIR_NATIVE}/perl-native/perl/config.s=
h')
> +    try:
> +        f =3D open(cfg, 'r')
> +    except IOError:
> +        return None
> +    l =3D f.readlines();
> +    f.close();
> +    r =3D re.compile("^archname=3D'([^']*)'")
> +    for s in l:
> +        m =3D r.match(s)
> +        if m:
> +            return m.group(1)
> +    return None
> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.4.bb b/meta/reci=
pes-devtools/perl/perl-native_5.24.4.bb
> deleted file mode 100644
> index 81d3fd4898..0000000000
> --- a/meta/recipes-devtools/perl/perl-native_5.24.4.bb
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -require perl.inc
> -
> -# We need gnugrep (for -I)
> -DEPENDS =3D "db-native grep-native gdbm-native zlib-native"
> -
> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> -
> -SRC_URI +=3D "\
> -           file://Configure-multilib.patch \
> -           file://perl-configpm-switch.patch \
> -           file://native-nopacklist.patch \
> -           file://native-perlinc.patch \
> -           file://MM_Unix.pm.patch \
> -           file://debian/errno_ver.diff \
> -           file://dynaloaderhack.patch \
> -           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
> -           file://0001-Configure-Remove-fstack-protector-strong-for-nati=
ve-.patch \
> -           file://perl-5.26.1-guard_old_libcrypt_fix.patch \
> -           file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
> -          "
> -
> -SRC_URI[md5sum] =3D "04622bc4d3941dc7eb571c52b7c02993"
> -SRC_URI[sha256sum] =3D "7f080287ff64750270689843ae945f02159a33cb8f2fc910=
248c15befba5db84"
> -
> -inherit native
> -
> -NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
> -
> -export LD=3D"${CCLD}"
> -
> -do_configure () {
> -       ./Configure \
> -               -Dcc=3D"${CC}" \
> -               -Dcflags=3D"${CFLAGS}" \
> -               -Dldflags=3D"${LDFLAGS}" \
> -               -Dlddlflags=3D"${LDFLAGS} -shared" \
> -               -Dcf_by=3D"Open Embedded" \
> -               -Dprefix=3D${prefix} \
> -               -Dvendorprefix=3D${prefix} \
> -               -Dsiteprefix=3D${prefix} \
> -               \
> -               -Dbin=3D${STAGING_BINDIR}/${PN} \
> -               -Dprivlib=3D${STAGING_LIBDIR}/perl/${PV} \
> -               -Darchlib=3D${STAGING_LIBDIR}/perl/${PV} \
> -               -Dvendorlib=3D${STAGING_LIBDIR}/perl/vendor_perl/${PV} \
> -               -Dvendorarch=3D${STAGING_LIBDIR}/perl/vendor_perl/${PV} \
> -               -Dsitelib=3D${STAGING_LIBDIR}/perl/site_perl/${PV} \
> -               -Dsitearch=3D${STAGING_LIBDIR}/perl/site_perl/${PV} \
> -               \
> -               -Duseshrplib \
> -               -Dusethreads \
> -               -Duseithreads \
> -               -Duselargefiles \
> -               -Dnoextensions=3DODBM_File \
> -               -Ud_dosuid \
> -               -Ui_db \
> -               -Ui_ndbm \
> -               -Ui_gdbm \
> -               -Ui_gdbm_ndbm \
> -               -Ui_gdbmndbm \
> -               -Di_shadow \
> -               -Di_syslog \
> -               -Duseperlio \
> -               -Dman3ext=3D3pm \
> -               -Dsed=3D/bin/sed \
> -               -Uafs \
> -               -Ud_csh \
> -               -Uusesfio \
> -               -Uusenm -des
> -}
> -
> -do_install () {
> -       oe_runmake 'DESTDIR=3D${D}' install
> -
> -       # We need a hostperl link for building perl
> -       ln -sf perl${PV} ${D}${bindir}/hostperl
> -
> -        ln -sf perl ${D}${libdir}/perl5
> -
> -       install -d ${D}${libdir}/perl/${PV}/CORE \
> -                  ${D}${datadir}/perl/${PV}/ExtUtils
> -
> -       # Save native config
> -       install config.sh ${D}${libdir}/perl
> -       install lib/Config.pm ${D}${libdir}/perl/${PV}/
> -       install lib/ExtUtils/typemap ${D}${libdir}/perl/${PV}/ExtUtils/
> -
> -       # perl shared library headers
> -       # reference perl 5.20.0-1 in debian:
> -       # https://packages.debian.org/experimental/i386/perl/filelist
> -       for i in av.h bitcount.h charclass_invlists.h config.h cop.h cv.h=
 dosish.h \
> -               embed.h embedvar.h EXTERN.h fakesdio.h feature.h form.h g=
it_version.h \
> -               gv.h handy.h hv_func.h hv.h inline.h INTERN.h intrpvar.h =
iperlsys.h \
> -               keywords.h l1_char_class_tab.h malloc_ctl.h metaconfig.h =
mg_data.h \
> -               mg.h mg_raw.h mg_vtable.h mydtrace.h nostdio.h opcode.h o=
p.h \
> -               opnames.h op_reg_common.h overload.h pad.h parser.h patch=
level.h \
> -               perlapi.h perl.h perlio.h perliol.h perlsdio.h perlvars.h=
 perly.h \
> -               pp.h pp_proto.h proto.h reentr.h regcharclass.h regcomp.h=
 regexp.h \
> -               regnodes.h scope.h sv.h thread.h time64_config.h time64.h=
 uconfig.h \
> -               unicode_constants.h unixish.h utf8.h utfebcdic.h util.h u=
udmap.h \
> -               vutil.h warnings.h XSUB.h
> -       do
> -               install $i ${D}${libdir}/perl/${PV}/CORE
> -       done
> -
> -       # Those wrappers mean that perl installed from sstate (which may =
change
> -       # path location) works and that in the nativesdk case, the SDK ca=
n be
> -       # installed to a different location from the one it was built for=
.
> -       create_wrapper ${D}${bindir}/perl PERL5LIB=3D'$PERL5LIB:${STAGING=
_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIBDIR}/perl/vendor_perl/${PV}:${ST=
AGING_LIBDIR}/perl/${PV}'
> -       create_wrapper ${D}${bindir}/perl${PV} PERL5LIB=3D'$PERL5LIB:${ST=
AGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIBDIR}/perl/vendor_perl/${PV}=
:${STAGING_LIBDIR}/perl/${PV}'
> -
> -       # Use /usr/bin/env nativeperl for the perl script.
> -       for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
> -               sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
> -       done
> -
> -       # The packlist is large with hardcoded paths meaning it needs rel=
ocating
> -       # so just remove it.
> -       rm ${D}${libdir}/perl/${PV}/.packlist
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "perl_sysroot_create_wrapper"
> -
> -perl_sysroot_create_wrapper () {
> -       mkdir -p ${SYSROOT_DESTDIR}${bindir}
> -       # Create a wrapper that /usr/bin/env perl will use to get perl-na=
tive.
> -       # This MUST live in the normal bindir.
> -       cat > ${SYSROOT_DESTDIR}${bindir}/../nativeperl << EOF
> -#!/bin/sh
> -realpath=3D\`readlink -fn \$0\`
> -exec \`dirname \$realpath\`/perl-native/perl "\$@"
> -EOF
> -       chmod 0755 ${SYSROOT_DESTDIR}${bindir}/../nativeperl
> -       cat ${SYSROOT_DESTDIR}${bindir}/../nativeperl
> -}
> -
> -# Fix the path in sstate
> -SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> -
> -PACKAGES_DYNAMIC_class-native =3D "^perl-module-.*native$"
> diff --git a/meta/recipes-devtools/perl/perl-native_5.28.0.bb b/meta/reci=
pes-devtools/perl/perl-native_5.28.0.bb
> new file mode 100644
> index 0000000000..bcd9ba20a7
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-native_5.28.0.bb
> @@ -0,0 +1,144 @@
> +require perl.inc
> +
> +# We need gnugrep (for -I)
> +DEPENDS =3D "db-native grep-native gdbm-native zlib-native"
> +
> +EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> +
> +SRC_URI +=3D "\
> +           file://Configure-multilib.patch \
> +           file://perl-configpm-switch.patch \
> +           file://native-perlinc.patch \
> +           file://MM_Unix.pm.patch \
> +           file://debian/errno_ver.diff \
> +           file://dynaloaderhack.patch \
> +           file://0001-Configure-Remove-fstack-protector-strong-for-nati=
ve-.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "f3245183c0a08f65e94a3333995af08e"
> +SRC_URI[sha256sum] =3D "059b3cb69970d8c8c5964caced0335b4af34ac990c8e61f7=
e3f90cd1c2d11e49"
> +
> +PACKAGECONFIG ?=3D ""
> +usethreads =3D "${@["undef", "define"][bb.utils.contains('PACKAGECONFIG'=
, 'thread', 1, 0, d)]}"
> +threadmulti =3D "${@["", "-thread-multi"][bb.utils.contains('PACKAGECONF=
IG', 'thread', 1, 0, d)]}"
> +PACKAGECONFIG[thread] =3D "-Dusethreads,,"
> +
> +inherit native
> +
> +NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
> +
> +SITELIB_INC   =3D "${STAGING_LIBDIR}/perl/site_perl/${PV}/${HOST_ARCH}-$=
{HOST_OS}${threadmulti}:${STAGING_LIBDIR}/perl/site_perl/${PV}"
> +VENDORLIB_INC =3D "${STAGING_LIBDIR}/perl/vendor_perl/${PV}/${HOST_ARCH}=
-${HOST_OS}${threadmulti}:${STAGING_LIBDIR}/perl/vendor_perl/${PV}"
> +COREELIB_INC  =3D "${STAGING_LIBDIR}/perl/${PV}/${HOST_ARCH}-${HOST_OS}$=
{threadmulti}:${STAGING_LIBDIR}/perl/${PV}"
> +
> +export LD=3D"${CCLD}"
> +
> +do_configure () {
> +       ./Configure \
> +               -Dcc=3D"${CC}" \
> +               -Dcflags=3D"${CFLAGS}" \
> +               -Dldflags=3D"${LDFLAGS}" \
> +               -Dlddlflags=3D"${LDFLAGS} -shared" \
> +               -Dcf_by=3D"Open Embedded" \
> +               -Dprefix=3D${prefix} \
> +               -Dvendorprefix=3D${prefix} \
> +               -Dsiteprefix=3D${prefix} \
> +               \
> +               -Dbin=3D${STAGING_BINDIR}/${PN} \
> +               -Dprivlib=3D${STAGING_LIBDIR}/perl/${PV} \
> +               -Darchlib=3D${STAGING_LIBDIR}/perl/${PV}/${HOST_ARCH}-${H=
OST_OS}${threadmulti} \
> +               -Dvendorlib=3D${STAGING_LIBDIR}/perl/vendor_perl/${PV} \
> +               -Dvendorarch=3D${STAGING_LIBDIR}/perl/vendor_perl/${PV}/$=
{HOST_ARCH}-${HOST_OS}${threadmulti} \
> +               -Dsitelib=3D${STAGING_LIBDIR}/perl/site_perl/${PV} \
> +               -Dsitearch=3D${STAGING_LIBDIR}/perl/site_perl/${PV}/${HOS=
T_ARCH}-${HOST_OS}${threadmulti} \
> +               \
> +               -Duseshrplib \
> +               -Duselargefiles \
> +               -Dnoextensions=3DODBM_File \
> +               -Ud_dosuid \
> +               -Ui_db \
> +               -Ui_ndbm \
> +               -Ui_gdbm \
> +               -Ui_gdbm_ndbm \
> +               -Ui_gdbmndbm \
> +               -Di_shadow \
> +               -Di_syslog \
> +               -Duseperlio \
> +               -Dman3ext=3D3pm \
> +               -Dsed=3D/bin/sed \
> +               -Uafs \
> +               -Ud_csh \
> +               -Uusesfio \
> +               -Uusenm -des \
> +               ${PACKAGECONFIG_CONFARGS}
> +}
> +
> +do_install () {
> +       oe_runmake 'DESTDIR=3D${D}' install
> +
> +       # We need a hostperl link for building perl
> +       ln -sf perl${PV} ${D}${bindir}/hostperl
> +
> +        ln -sf perl ${D}${libdir}/perl5
> +
> +       install -d ${D}${libdir}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${thre=
admulti}/CORE \
> +                  ${D}${datadir}/perl/${PV}/ExtUtils
> +
> +       # Save native config
> +       install config.sh ${D}${libdir}/perl
> +       install lib/Config.pm ${D}${libdir}/perl/${PV}/
> +       install lib/ExtUtils/typemap ${D}${libdir}/perl/${PV}/ExtUtils/
> +
> +       # perl shared library headers
> +       # reference perl 5.20.0-1 in debian:
> +       # https://packages.debian.org/experimental/i386/perl/filelist
> +       for i in av.h bitcount.h charclass_invlists.h config.h cop.h cv.h=
 dosish.h \
> +               embed.h embedvar.h EXTERN.h fakesdio.h feature.h form.h g=
it_version.h \
> +               gv.h handy.h hv_func.h hv.h inline.h INTERN.h intrpvar.h =
iperlsys.h \
> +               keywords.h l1_char_class_tab.h malloc_ctl.h metaconfig.h =
mg_data.h \
> +               mg.h mg_raw.h mg_vtable.h mydtrace.h nostdio.h opcode.h o=
p.h \
> +               opnames.h op_reg_common.h overload.h pad.h parser.h patch=
level.h \
> +               perlapi.h perl.h perlio.h perliol.h perlsdio.h perlvars.h=
 perly.h \
> +               pp.h pp_proto.h proto.h reentr.h regcharclass.h regcomp.h=
 regexp.h \
> +               regnodes.h scope.h sv.h thread.h time64_config.h time64.h=
 uconfig.h \
> +               unicode_constants.h unixish.h utf8.h utfebcdic.h util.h u=
udmap.h \
> +               vutil.h warnings.h XSUB.h
> +       do
> +               install $i ${D}${libdir}/perl/${PV}/${HOST_ARCH}-${HOST_O=
S}${threadmulti}/CORE
> +       done
> +
> +       # Those wrappers mean that perl installed from sstate (which may =
change
> +       # path location) works and that in the nativesdk case, the SDK ca=
n be
> +       # installed to a different location from the one it was built for=
.
> +       create_wrapper ${D}${bindir}/perl PERL5LIB=3D'$PERL5LIB:${SITELIB=
_INC}:${VENDORLIB_INC}:${COREELIB_INC}'
> +       create_wrapper ${D}${bindir}/perl${PV} PERL5LIB=3D'$PERL5LIB:${SI=
TELIB_INC}:${VENDORLIB_INC}:${COREELIB_INC}'
> +
> +       # Use /usr/bin/env nativeperl for the perl script.
> +       for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
> +               sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
> +       done
> +
> +       # The packlist is large with hardcoded paths meaning it needs rel=
ocating
> +       # so just remove it.
> +       rm ${D}${libdir}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}=
/.packlist
> +}
> +
> +SYSROOT_PREPROCESS_FUNCS +=3D "perl_sysroot_create_wrapper"
> +
> +perl_sysroot_create_wrapper () {
> +       mkdir -p ${SYSROOT_DESTDIR}${bindir}
> +       # Create a wrapper that /usr/bin/env perl will use to get perl-na=
tive.
> +       # This MUST live in the normal bindir.
> +       cat > ${SYSROOT_DESTDIR}${bindir}/../nativeperl << EOF
> +#!/bin/sh
> +realpath=3D\`readlink -fn \$0\`
> +exec \`dirname \$realpath\`/perl-native/perl "\$@"
> +EOF
> +       chmod 0755 ${SYSROOT_DESTDIR}${bindir}/../nativeperl
> +       cat ${SYSROOT_DESTDIR}${bindir}/../nativeperl
> +}
> +
> +# Fix the path in sstate
> +SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> +
> +PACKAGES_DYNAMIC_class-native =3D "^perl-module-.*native$"
> diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc b/meta/r=
ecipes-devtools/perl/perl-rdepends_5.24.4.inc
> deleted file mode 100644
> index 10e3c0429f..0000000000
> --- a/meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
> +++ /dev/null
> @@ -1,2575 +0,0 @@
> -# To create/update the perl-rdepends_${PV}.inc use this piece of ugly sc=
ript (modified for your arch/paths etc):
> -
> -#jiahongxu:5.20.0-r1$ pwd
> -#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl=
/5.20.0-r1
> -
> -#1 cp -r packages-split packages-split.new && cd packages-split.new
> -#2 find . -name \*.pm | xargs sed -i '/^=3Dhead/,/^=3Dcut/d'
> -#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include=3D"*=
.pm"
> -#| sed "s/\/.*\.pm: */ +=3D /g;s/[\"\']//g;s/;.*/\"/g;s/+=3D .*\(require=
\|use\)\> */+=3D \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan=
/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr =
[:upper:] [:lower:]
> -#| awk '{if ($3 !=3D "\x22"$1"\x22"){ print $0}}'
> -#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e au=
toperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-=
mac -e fcgi -e lwp -e dbd -e dbix
> -#| sort -u
> -#| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-=
\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
> -#| egrep -wv '=3D>|module-a|module-apache.?|module-apr|module-authen-sas=
l|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-pe=
rl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extuti=
ls-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|modul=
e-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl=
-util|module-pluggable-object|module-test-builder-io-scalar|module-text-uni=
decode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-=
rdepends
> -
> -RDEPENDS_perl-misc +=3D "perl perl-modules"
> -RDEPENDS_${PN}-pod +=3D "perl"
> -
> -# Some additional dependencies that the above doesn't manage to figure o=
ut
> -RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-math-bigint-calc"
> -RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-attributes"
> -RDEPENDS_${PN}-module-overload +=3D "${PN}-module-overloading"
> -
> -# Depends list
> -# copy contents of /tmp/perl-rdepends in this file
> -RDEPENDS_${PN}-module-anydbm-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-anydbm-file +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-cpan"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-data-dumper"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-file-spec-functions"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-getopt-std"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-if"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-net-ping"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-user-pwent"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-app-cpan +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-app-prove-state"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-getopt-long"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-harness"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-tap-harness-env"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-app-prove +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-app-prove-state=
-result"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-tap-parser-yaml=
ish-reader"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-tap-parser-yaml=
ish-writer"
> -RDEPENDS_${PN}-module-app-prove-state +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-app-prov=
e-state-result-test"
> -RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-constant=
"
> -RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-app-prove-state-result +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-app-prove-state-result-test +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-app-prove-state-result-test +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-io-compres=
s-bzip2"
> -RDEPENDS_${PN}-module-archive-tar-constant +=3D "${PN}-module-time-local=
"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-archive-tar"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-archive-tar-co=
nstant"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-file-spec-unix=
"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-archive-tar-file +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-archive-tar-constan=
t"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-archive-tar-file"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-io-zlib"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-archive-tar +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-arybase +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-attribute-handlers +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-attributes +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-fatal"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autodie-exception +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-parent=
"
> -RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-autodie-exception-system +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autodie-hints +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-lib"
> -RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autodie +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-autodie-scope-guard +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autodie-scope-guard +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-autodie-scope-guardstack +=3D "${PN}-module-autodi=
e-scope-guard"
> -RDEPENDS_${PN}-module-autodie-scope-guardstack +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-autodie-scope-guardstack +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-autodie-skip +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autodie-skip +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-autodie-util +=3D "${PN}-module-autodie-scope-guar=
dstack"
> -RDEPENDS_${PN}-module-autodie-util +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-autodie-util +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autodie-util +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-autoloader +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-autoloader +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-file-spec-functions"
> -RDEPENDS_${PN}-module-autosplit +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-autouse +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-base +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-base +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-base +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-b-op-private"
> -RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-b-concise +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-b-debug +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-b-debug +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-b-debug +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-data-dumper"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-feature"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-overloading"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-b-deparse +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-benchmark +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-benchmark +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-benchmark +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-math-bigint-trace"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-bigint +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-bigint"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-math-bigfloat"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-math-bigfloat-trace"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-math-bigint-trace"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-bignum +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-bigint"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-math-bigfloat"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-math-bigint-trace"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-math-bigrat"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-bigrat +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-blib +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-blib +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-blib +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-b +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-b +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-b +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b-concise"
> -RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-b-terse"
> -RDEPENDS_${PN}-module-b-showlex +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-b-concise"
> -RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-b-terse +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-b-xref +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-bytes +=3D "${PN}-module-bytes-heavy"
> -RDEPENDS_${PN}-module-bytes +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-carp-heavy +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-carp +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-carp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-carp +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-charnames +=3D "${PN}-module--charnames"
> -RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module--charnames +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-charnames +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-class-struct +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-bytes "
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-carp "
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-warnings "
> -RDEPENDS_${PN}-module-compress-raw-bzip2 +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-bytes "
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-carp "
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-warnings "
> -RDEPENDS_${PN}-module-compress-raw-zlib +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-bytes "
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-carp "
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-compress-raw-zlib=
"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-io-compress-base-=
common"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-io-compress-gzip"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-io-compress-gzip-=
constants"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-io-handle "
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-io-uncompress-gun=
zip"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-compress-zlib +=3D "${PN}-module-warnings "
> -RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-config-extensions +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-config-perl-v +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-constant +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-constant +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-constant +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-list-util"
> -RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-corelist"
> -RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-version"
> -RDEPENDS_${PN}-module-corelist +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-data-dumper"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-dirhandle"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-makemaker"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-extutils-manifest"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-copy"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-lib"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-net-ping"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-safe"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-sys-hostname"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-term-readline"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-text-wrap"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-time-local"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-cpan +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-cwd +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-b-deparse"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-data-dumper +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-dbm-filter-compress +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-dbm-filter-compress +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-dbm-filter-compress +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-dbm-filter-encode +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-dbm-filter-encode +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-dbm-filter-encode +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-dbm-filter-int32 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-dbm-filter-int32 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-dbm-filter-null +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-dbm-filter-null +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-dbm-filter +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-dbm-filter-utf8 +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-dbm-filter-utf8 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-dbm-filter-utf8 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-db +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-deprecate +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-deprecate +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-deprecate +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-devel-peek +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-devel-peek +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-devel-ppport +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-devel-ppport +=3D "${PN}-module-getopt-long"
> -RDEPENDS_${PN}-module-devel-ppport +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-devel-ppport +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-devel-selfstubber +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-devel-selfstubber +=3D "${PN}-module-selfloader"
> -RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-getopt-std"
> -RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-diagnostics +=3D "${PN}-module-text-tabs"
> -RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-mime-base64"
> -RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-digest-base +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-digest-file +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-digest-file +=3D "${PN}-module-digest"
> -RDEPENDS_${PN}-module-digest-file +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-digest-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-digest-file +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-digest-base"
> -RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-digest-md5 +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-digest +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-digest +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-digest-base"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-digest-sha +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-dirhandle +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-dirhandle +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-dynaloader +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-dynaloader +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-alias +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-byte +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-byte +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-byte +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-byte +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-cjkconstants +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-encode-cn-hz +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-encode-cn-hz"
> -RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-cn +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-config +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-config +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-ebcdic +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-encoder +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-encode-mime-nam=
e"
> -RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-encoding +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-encode-gsm0338 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-encode-unicode"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-guess +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-encode-cjkconstan=
ts"
> -RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-encode-jp-h2z +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-encode-cjkconsta=
nts"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-encode-jp-h2z"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-jp-jis7 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-encode-jp-jis7"
> -RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-jp +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-encode-cjkcon=
stants"
> -RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-kr-2022-kr +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-encode-kr-2022-kr"
> -RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-kr +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-=
constant"
> -RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-=
encode-cjkconstants"
> -RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-=
parent"
> -RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-=
strict"
> -RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp +=3D "${PN}-module-=
warnings"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-mime-base64"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-encode-mime-header +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-mime-name +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-mime-name +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-alias"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-config"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-configlocal-pm"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-encode-encoding"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-symbol +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-tw +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encode-unicode +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-mime-base64=
"
> -RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encode-unicode-utf7 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-filter-util-call"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-i18n-langinfo"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-encoding +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-encoding-warnings +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-encoding-warnings +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-encoding-warnings +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-english +=3D "${PN}-module-carp "
> -RDEPENDS_${PN}-module-english +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-env +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-env +=3D "${PN}-module-tie-array"
> -RDEPENDS_${PN}-module-errno +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-errno +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-errno +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-feature"
> -RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-version"
> -RDEPENDS_${PN}-module-experimental +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-exporter-heavy +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-exporter +=3D "${PN}-module-exporter-heavy"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-dynaload=
er"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-extutils=
-mksymlists"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-file-bas=
ename"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-file-spe=
c"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-file-tem=
p"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-ipc-cmd"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-text-par=
sewords"
> -RDEPENDS_${PN}-module-extutils-cbuilder-base +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-basename=
"
> -RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-=
extutils-cbuilder-platform-unix"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-=
file-spec"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-=
strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-=
vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix +=3D "${PN}-module-=
warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-mod=
ule-config"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-mod=
ule-extutils-cbuilder-platform-unix"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-mod=
ule-file-spec"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-mod=
ule-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-mod=
ule-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-android +=3D "${PN}-mod=
ule-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-modu=
le-extutils-cbuilder-platform-unix"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-modu=
le-file-spec"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-modu=
le-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-modu=
le-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin +=3D "${PN}-modu=
le-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin +=3D "${PN}-modu=
le-extutils-cbuilder-platform-unix"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin +=3D "${PN}-modu=
le-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin +=3D "${PN}-modu=
le-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin +=3D "${PN}-modu=
le-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf +=3D "${PN}-mod=
ule-extutils-cbuilder-platform-unix"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf +=3D "${PN}-mod=
ule-file-spec"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf +=3D "${PN}-mod=
ule-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf +=3D "${PN}-mod=
ule-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf +=3D "${PN}-mod=
ule-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 +=3D "${PN}-module-=
extutils-cbuilder-platform-unix"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 +=3D "${PN}-module-=
strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 +=3D "${PN}-module-=
vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 +=3D "${PN}-module-=
warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix +=3D "${PN}-module=
-extutils-cbuilder-base"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix +=3D "${PN}-module=
-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix +=3D "${PN}-module=
-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix +=3D "${PN}-module=
-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-=
config"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-=
extutils-cbuilder-base"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-=
file-spec-functions"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-=
strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-=
vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms +=3D "${PN}-module-=
warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc +=3D "${PN}=
-module-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc +=3D "${PN}=
-module-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc +=3D "${PN}=
-module-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc +=3D "${PN}=
-module-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc +=3D "${PN=
}-module-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc +=3D "${PN=
}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-extutils-cbuilder-base"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-file-basename"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-file-spec"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-io-file"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-strict"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-vars"
> -RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows +=3D "${PN}-mod=
ule-warnings"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-extutils-co=
mmand"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-extutils-in=
stall"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-getopt-long=
"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-test-harnes=
s"
> -RDEPENDS_${PN}-module-extutils-command-mm +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-copy"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-command +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-constant=
"
> -RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-extutils=
-constant-utils"
> -RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-text-wra=
p"
> -RDEPENDS_${PN}-module-extutils-constant-base +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-extutils-cons=
tant-proxysubs"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-extutils-cons=
tant-utils"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-extutils-cons=
tant-xs"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-constant +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-car=
p"
> -RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-ext=
utils-constant-utils"
> -RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-ext=
utils-constant-xs"
> -RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-extutils-constant-proxysubs +=3D "${PN}-module-var=
s"
> -RDEPENDS_${PN}-module-extutils-constant-utils +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-constant-utils +=3D "${PN}-module-constan=
t"
> -RDEPENDS_${PN}-module-extutils-constant-utils +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-extutils-constant-utils +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-constant-utils +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-data-dumpe=
r"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-extutils-c=
onstant"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-extutils-c=
onstant-base"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-extutils-c=
onstant-utils"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-constant-xs +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-extutils-liblist=
"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-extutils-makemak=
er"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-getopt-std"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-embed +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-data-dumper"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-extutils-mak=
emaker"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-extutils-pac=
klist"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-basenam=
e"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-installed +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-autosplit"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-extutils-packl=
ist"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-compare"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-copy"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-install +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-extutils-m=
akemaker-config"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-file-basen=
ame"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-text-parse=
words"
> -RDEPENDS_${PN}-module-extutils-liblist-kid +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-extutils-libli=
st-kid"
> -RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-liblist +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-confi=
g"
> -RDEPENDS_${PN}-module-extutils-makemaker-config +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-encod=
e"
> -RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-encod=
e-alias"
> -RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-i18n-=
langinfo"
> -RDEPENDS_${PN}-module-extutils-makemaker-locale +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-mak=
emaker-config"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-mak=
emaker-version"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-man=
ifest"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-mm"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-extutils-my"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-makemaker +=3D "${PN}-module-version"
> -RDEPENDS_${PN}-module-extutils-makemaker-version +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-extutils-makemaker-version +=3D "${PN}-module-vars=
"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-basename=
"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-copy"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-manifest +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-extutils-embe=
d"
> -RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-miniperl +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-dynaloader=
"
> -RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-mkbootstrap +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-mksymlists +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-aix +=3D "${PN}-module-extutils-makema=
ker"
> -RDEPENDS_${PN}-module-extutils-mm-aix +=3D "${PN}-module-extutils-mm-uni=
x"
> -RDEPENDS_${PN}-module-extutils-mm-aix +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-autosplit"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-cpan"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-data-dumper"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-extutils-makema=
ker"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-extutils-makema=
ker-config"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-any +=3D "${PN}-module-version"
> -RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-makem=
aker-config"
> -RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-mm-an=
y"
> -RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-extutils-mm-un=
ix"
> -RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-mm-beos +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mak=
emaker-config"
> -RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-=
unix"
> -RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-extutils-mm-=
win32"
> -RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-mm-cygwin +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-darwin +=3D "${PN}-module-extutils-mm-=
unix"
> -RDEPENDS_${PN}-module-extutils-mm-darwin +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-dos +=3D "${PN}-module-extutils-mm-any=
"
> -RDEPENDS_${PN}-module-extutils-mm-dos +=3D "${PN}-module-extutils-mm-uni=
x"
> -RDEPENDS_${PN}-module-extutils-mm-dos +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-macos +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-nw5 +=3D "${PN}-module-extutils-makema=
ker"
> -RDEPENDS_${PN}-module-extutils-mm-nw5 +=3D "${PN}-module-extutils-makema=
ker-config"
> -RDEPENDS_${PN}-module-extutils-mm-nw5 +=3D "${PN}-module-extutils-mm-win=
32"
> -RDEPENDS_${PN}-module-extutils-mm-nw5 +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-extutils-mm-nw5 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-extutils-makema=
ker"
> -RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-extutils-mm-any=
"
> -RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-extutils-mm-uni=
x"
> -RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-mm-os2 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-liblist"
> -RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-makemaker"
> -RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-extutils-makemaker-=
config"
> -RDEPENDS_${PN}-module-extutils-mm +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-qnx +=3D "${PN}-module-extutils-mm-uni=
x"
> -RDEPENDS_${PN}-module-extutils-mm-qnx +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-dirhandle"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-libli=
st"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-makem=
aker"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-makem=
aker-config"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-extutils-mm-an=
y"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-mm-unix +=3D "${PN}-module-version"
> -RDEPENDS_${PN}-module-extutils-mm-uwin +=3D "${PN}-module-extutils-mm-un=
ix"
> -RDEPENDS_${PN}-module-extutils-mm-uwin +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-extutils-liblis=
t-kid"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-extutils-makema=
ker"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-extutils-makema=
ker-config"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-extutils-mm-any=
"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-extutils-mm-uni=
x"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-extutils-mm-vms +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-vos +=3D "${PN}-module-extutils-mm-uni=
x"
> -RDEPENDS_${PN}-module-extutils-mm-vos +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-extutils-make=
maker"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-extutils-make=
maker-config"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-extutils-mm-a=
ny"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-extutils-mm-u=
nix"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-file-basename=
"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-mm-win32 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-mm-win95 +=3D "${PN}-module-extutils-make=
maker-config"
> -RDEPENDS_${PN}-module-extutils-mm-win95 +=3D "${PN}-module-extutils-mm-w=
in32"
> -RDEPENDS_${PN}-module-extutils-mm-win95 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-my +=3D "${PN}-module-extutils-mm"
> -RDEPENDS_${PN}-module-extutils-my +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-packlist +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-extutils-parsexs-constants +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-extutils-parsexs-constants +=3D "${PN}-module-symb=
ol"
> -RDEPENDS_${PN}-module-extutils-parsexs-constants +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-extutils-parsexs-countlines +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-extutils-parsexs-eval +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-parsexs-eval +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parse=
xs-constants"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parse=
xs-countlines"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parse=
xs-eval"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-extutils-parse=
xs-utilities"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-parsexs +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-expo=
rter"
> -RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-extu=
tils-parsexs-constants"
> -RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-extu=
tils-typemaps"
> -RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-file=
-spec"
> -RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-extutils-parsexs-utilities +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-lib"
> -RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-testlib +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-extutils-=
typemaps"
> -RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-typemaps-cmd +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-typemaps-inputmap +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-extutils-typemaps-inputmap +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-extutils-typemaps-outputmap +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-extutils-typemaps-outputmap +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-extutils-typemaps-outputmap +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-pars=
exs"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-pars=
exs-constants"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-type=
maps-inputmap"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-type=
maps-outputmap"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-extutils-type=
maps-type"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-typemaps +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-extutils=
-typemaps"
> -RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-extutils-typemaps-type +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-exception-system"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-hints"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-autodie-util"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-tie-refhash"
> -RDEPENDS_${PN}-module-fatal +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-fcntl +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-fcntl +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-fcntl +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-feature +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-fields +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-fields +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-fields +=3D "${PN}-module-hash-util"
> -RDEPENDS_${PN}-module-fields +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-fields +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-basename +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-filecache +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-compare +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-copy +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-file-dosglob +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-copy"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-file-temp"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-ipc-cmd"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-locale-maketext-simp=
le"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-load"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-params-check"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-fetch +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-file-find +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-file-glob"
> -RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-globmapper +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-glob +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-filehandle +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-path +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-amigaos +=3D "${PN}-module-file-spec-uni=
x"
> -RDEPENDS_${PN}-module-file-spec-amigaos +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-amigaos +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-cygwin +=3D "${PN}-module-file-spec-unix=
"
> -RDEPENDS_${PN}-module-file-spec-cygwin +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-cygwin +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-epoc +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-file-spec-epoc +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-epoc +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-file-spec-u=
nix"
> -RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-functions +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-mac +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-file-spec-mac +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-mac +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-os2 +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-file-spec-os2 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-os2 +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-unix +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-vms +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-spec-win32 +=3D "${PN}-module-cwd "
> -RDEPENDS_${PN}-module-file-spec-win32 +=3D "${PN}-module-file-spec-unix"
> -RDEPENDS_${PN}-module-file-spec-win32 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-spec-win32 +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-overload "
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-file-stat +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-errno"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-io-seekable"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-file-temp +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-filter-util-call"
> -RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-text-balanced"
> -RDEPENDS_${PN}-module-filter-simple +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-filter-util-call +=3D "${PN}-module-carp "
> -RDEPENDS_${PN}-module-filter-util-call +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-filter-util-call +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-filter-util-call +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-filter-util-call +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-filter-util-call +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-findbin +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-pod-usage"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-getopt-long +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-getopt-std +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-scalar-util=
"
> -RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-hash-util-fieldhash +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-hash-util-fieldhash"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-hash-util +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-i18n-collate +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-i18n-langinfo +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-i18n-langtags-detect +=3D "${PN}-module-i18n-langt=
ags"
> -RDEPENDS_${PN}-module-i18n-langtags-detect +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-i18n-langtags-detect +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-i18n-langtags-list +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-i18n-langtags-list +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-i18n-langtags +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-bytes=
"
> -RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-compr=
ess-raw-bzip2"
> -RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-io-co=
mpress-base-common"
> -RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-io-compress-adapter-bzip2 +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-byt=
es"
> -RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-com=
press-raw-zlib"
> -RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-exp=
orter"
> -RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-io-=
compress-base-common"
> -RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-io-compress-adapter-deflate +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-by=
tes"
> -RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-io=
-compress-base-common"
> -RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-io-compress-adapter-identity +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-constan=
t"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-exporte=
r"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-file-gl=
obmapper"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-scalar-=
util"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-strict =
"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-io-compress-base-common +=3D "${PN}-module-warning=
s"
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-compress-ba=
se-common"
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-io-handle "
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io-compress-base +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-exporter "
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-io-compress-a=
dapter-bzip2"
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-io-compress-b=
ase"
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-io-compress-b=
ase-common"
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-bzip2 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-exporter "
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress=
-adapter-deflate"
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress=
-base-common"
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress=
-rawdeflate"
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-io-compress=
-zlib-constants"
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-deflate +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-byte=
s"
> -RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-cons=
tant"
> -RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-expo=
rter"
> -RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-stri=
ct "
> -RDEPENDS_${PN}-module-io-compress-gzip-constants +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-exporter "
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-ad=
apter-deflate"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-ba=
se-common"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-gz=
ip-constants"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-ra=
wdeflate"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-io-compress-zl=
ib-extra"
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-gzip +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-compress=
-raw-zlib"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-exporter=
 "
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-compr=
ess-adapter-deflate"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-compr=
ess-base"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-io-compr=
ess-base-common"
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-rawdeflate +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-const=
ant"
> -RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-expor=
ter"
> -RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-stric=
t "
> -RDEPENDS_${PN}-module-io-compress-zip-constants +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-compress-raw-zl=
ib"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-exporter "
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-ada=
pter-deflate"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-ada=
pter-identity"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-bas=
e-common"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-bzi=
p2"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-raw=
deflate"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-zip=
-constants"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-io-compress-zli=
b-extra"
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-zip +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-byte=
s"
> -RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-cons=
tant"
> -RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-expo=
rter"
> -RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-stri=
ct "
> -RDEPENDS_${PN}-module-io-compress-zlib-constants +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-io-compress-zlib-extra +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-compress-zlib-extra +=3D "${PN}-module-io-compr=
ess-gzip-constants"
> -RDEPENDS_${PN}-module-io-compress-zlib-extra +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-compress-zlib-extra +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-file-stat"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io-dir +=3D "${PN}-module-tie-hash"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-io-seekable"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-selectsaver"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-file +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-io"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-selectsaver"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-handle +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-pipe +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io-poll +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-poll +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-io-poll +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-seekable +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-seekable +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-seekable +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-seekable +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-io-seekable +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-io-select +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-errno"
> -RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-io-socket-inet +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-errno"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-socket-ip +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-errno"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-io-select"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-io-socket-inet"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-io-socket-unix"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-io-socket +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-socket-unix +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-socket-unix +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-io-socket-unix +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 +=3D "${PN}-module-b=
ytes"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 +=3D "${PN}-module-c=
ompress-raw-bzip2"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 +=3D "${PN}-module-i=
o-compress-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-=
bytes"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-=
compress-raw-zlib"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-=
io-compress-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-=
io-compress-zip-constants "
> -RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-=
strict"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-identity +=3D "${PN}-module-=
warnings"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-c=
ompress-raw-zlib"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-i=
o-compress-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-io-uncompress-adapter-inflate +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-export=
er "
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-com=
press-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-unc=
ompress-adapter-inflate"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-unc=
ompress-base"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-unc=
ompress-gunzip"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-unc=
ompress-inflate"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-unc=
ompress-rawinflate"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-io-unc=
ompress-unzip"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-io-uncompress-anyinflate +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-byt=
es"
> -RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-exp=
orter "
> -RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-io-=
compress-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-io-=
uncompress-base"
> -RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-io-uncompress-anyuncompress +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-carp "
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-io-compress-=
base-common"
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-io-file "
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-list-util"
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io-uncompress-base +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-exporter =
"
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-io-compre=
ss-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-io-uncomp=
ress-adapter-bunzip2"
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-io-uncomp=
ress-base"
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-uncompress-bunzip2 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-compress-r=
aw-zlib"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-exporter "
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-io-compres=
s-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-io-compres=
s-gzip-constants"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-io-compres=
s-zlib-extra"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-io-uncompr=
ess-rawinflate"
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-uncompress-gunzip +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-exporter =
"
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-io-compre=
ss-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-io-compre=
ss-zlib-constants"
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-io-uncomp=
ress-rawinflate"
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-uncompress-inflate +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-compre=
ss-raw-zlib"
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-export=
er "
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-io-com=
press-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-io-unc=
ompress-adapter-inflate"
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-io-unc=
ompress-base"
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-strict=
 "
> -RDEPENDS_${PN}-module-io-uncompress-rawinflate +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-compress-ra=
w-zlib"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-exporter "
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-compress=
-base-common"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-compress=
-zip-constants"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-compress=
-zlib-extra"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-uncompre=
ss-adapter-identity"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-uncompre=
ss-adapter-inflate"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-io-uncompre=
ss-rawinflate"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-strict "
> -RDEPENDS_${PN}-module-io-uncompress-unzip +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-tie-handle"
> -RDEPENDS_${PN}-module-io-zlib +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-extutils-makemaker"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-io-select"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-ipc-open3"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-locale-maketext-simple"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-load"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-params-check"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-time-hires"
> -RDEPENDS_${PN}-module-ipc-cmd +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-ipc-msg +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ipc-msg +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-ipc-msg +=3D "${PN}-module-ipc-sysv"
> -RDEPENDS_${PN}-module-ipc-msg +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-msg +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-ipc-open2 +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-ipc-open2 +=3D "${PN}-module-ipc-open3"
> -RDEPENDS_${PN}-module-ipc-open2 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-io-pipe"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-open3 +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-ipc-semaphore +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ipc-semaphore +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-ipc-semaphore +=3D "${PN}-module-ipc-sysv"
> -RDEPENDS_${PN}-module-ipc-semaphore +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-semaphore +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-ipc-sharedmem +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ipc-sharedmem +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-ipc-sharedmem +=3D "${PN}-module-ipc-sysv"
> -RDEPENDS_${PN}-module-ipc-sharedmem +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-sharedmem +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ipc-sysv +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-json-pp-boolean +=3D "${PN}-module-json-pp"
> -RDEPENDS_${PN}-module-json-pp-boolean +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-bytes"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-math-bigfloat"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-json-pp +=3D "${PN}-module-subs"
> -RDEPENDS_${PN}-module-less +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-less +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-lib +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-lib +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-lib +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-list-util +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-list-util-xs +=3D "${PN}-module-list-util"
> -RDEPENDS_${PN}-module-list-util-xs +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-loaded +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-locale-maketext-simple"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-corelist"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-load"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-params-check"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-version"
> -RDEPENDS_${PN}-module-load +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-constant=
"
> -RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-exporter=
"
> -RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-constants +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-locale-codes-country-codes +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-locale-codes-country-codes +=3D "${PN}-module-utf8=
"
> -RDEPENDS_${PN}-module-locale-codes-country-codes +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-cod=
es"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-cod=
es-constants"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-cod=
es-country-codes"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-locale-cod=
es-country-retired"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-country +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-country-retired +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-locale-codes-country-retired +=3D "${PN}-module-ut=
f8"
> -RDEPENDS_${PN}-module-locale-codes-country-retired +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-locale-codes-currency-codes +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-locale-codes-currency-codes +=3D "${PN}-module-utf=
8"
> -RDEPENDS_${PN}-module-locale-codes-currency-codes +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-co=
des"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-co=
des-constants"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-co=
des-currency-codes"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-locale-co=
des-currency-retired"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-currency +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-currency-retired +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-locale-codes-currency-retired +=3D "${PN}-module-u=
tf8"
> -RDEPENDS_${PN}-module-locale-codes-currency-retired +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-locale-codes-langext-codes +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-locale-codes-langext-codes +=3D "${PN}-module-utf8=
"
> -RDEPENDS_${PN}-module-locale-codes-langext-codes +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-cod=
es"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-cod=
es-constants"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-cod=
es-langext-codes"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-locale-cod=
es-langext-retired"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-langext +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-langext-retired +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-locale-codes-langext-retired +=3D "${PN}-module-ut=
f8"
> -RDEPENDS_${PN}-module-locale-codes-langext-retired +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-locale-codes-langfam-codes +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-locale-codes-langfam-codes +=3D "${PN}-module-utf8=
"
> -RDEPENDS_${PN}-module-locale-codes-langfam-codes +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-cod=
es"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-cod=
es-constants"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-cod=
es-langfam-codes"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-locale-cod=
es-langfam-retired"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-langfam +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-langfam-retired +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-locale-codes-langfam-retired +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-locale-codes-language-codes +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-locale-codes-language-codes +=3D "${PN}-module-utf=
8"
> -RDEPENDS_${PN}-module-locale-codes-language-codes +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-co=
des"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-co=
des-constants"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-co=
des-language-codes"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-locale-co=
des-language-retired"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-language +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-language-retired +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-locale-codes-language-retired +=3D "${PN}-module-u=
tf8"
> -RDEPENDS_${PN}-module-locale-codes-language-retired +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-locale-codes-langvar-codes +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-locale-codes-langvar-codes +=3D "${PN}-module-utf8=
"
> -RDEPENDS_${PN}-module-locale-codes-langvar-codes +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-cod=
es"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-cod=
es-constants"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-cod=
es-langvar-codes"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-locale-cod=
es-langvar-retired"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-langvar +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-langvar-retired +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-locale-codes-langvar-retired +=3D "${PN}-module-ut=
f8"
> -RDEPENDS_${PN}-module-locale-codes-langvar-retired +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-locale-codes-const=
ants"
> -RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-script-codes +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-locale-codes-script-codes +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-locale-codes-script-codes +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-code=
s"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-code=
s-constants"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-code=
s-script-codes"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-locale-code=
s-script-retired"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-codes-script +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-codes-script-retired +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-locale-codes-script-retired +=3D "${PN}-module-utf=
8"
> -RDEPENDS_${PN}-module-locale-codes-script-retired +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-country +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-currency +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-language +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-locale-maketext-gutsloader +=3D "${PN}-module-loca=
le-maketext"
> -RDEPENDS_${PN}-module-locale-maketext-guts +=3D "${PN}-module-locale-mak=
etext"
> -RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-i18n-langtags"
> -RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-i18n-langtags-d=
etect"
> -RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-maketext +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-locale-maketext-simple +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-locale-maketext-simple +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-locale +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-locale-script +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-math-complex"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigfloat +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-math-bigflo=
at"
> -RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigfloat-trace +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigint-calcemu +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigint-calcemu +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigint-calc +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-math-bigin=
t-calc"
> -RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigint-fastcalc +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-math-bigfloat"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-math-complex"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigint-trace +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-bigrat +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-math-bigrat +=3D "${PN}-module-math-bigfloat"
> -RDEPENDS_${PN}-module-math-bigrat +=3D "${PN}-module-math-bigint"
> -RDEPENDS_${PN}-module-math-bigrat +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-math-bigrat +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-bigrat +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-math-complex +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-math-complex"
> -RDEPENDS_${PN}-module-math-trig +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-memoize-anydbm-file +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-memoize-expirefile +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-memoize-expire +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-memoize +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-memoize-sdbm-file +=3D "${PN}-module-sdbm-file"
> -RDEPENDS_${PN}-module-memoize-storable +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-memoize-storable +=3D "${PN}-module-storable"
> -RDEPENDS_${PN}-module-meta-notation +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-meta-notation +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-mime-base64 +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-mime-quotedprint +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-mime-quotedprint +=3D "${PN}-module-mime-base64"
> -RDEPENDS_${PN}-module-mime-quotedprint +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-mime-quotedprint +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-mro +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-mro +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-mro +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-errno"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-net-cmd +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-config +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-net-config"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-domain +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-net-ftp-dataconn"
> -RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ftp-a +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-errno"
> -RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-net-cmd"
> -RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ftp-dataconn +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ftp-e +=3D "${PN}-module-net-ftp-i"
> -RDEPENDS_${PN}-module-net-ftp-e +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ftp-e +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-net-ftp-dataconn"
> -RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ftp-i +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-net-ftp-i"
> -RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ftp-l +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-io-socket-ip"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-cmd"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-config"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-ftp-a"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-net-netrc"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-time-local"
> -RDEPENDS_${PN}-module-net-ftp +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-hostent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-net-netent +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-net-netent +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-netent +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-netent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-netent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-netrc +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-io-socket-ip"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-net-cmd"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-net-config"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-time-local"
> -RDEPENDS_${PN}-module-net-nntp +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-filehandle"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-time-hires"
> -RDEPENDS_${PN}-module-net-ping +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-io-socket-ip"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-mime-base64"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-net-cmd"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-net-config"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-net-netrc"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-pop3 +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-protoent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-net-servent +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-net-servent +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-servent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-servent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-io-socket-ip"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-mime-base64"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-net-cmd"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-net-config"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-smtp +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-io-select"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-io-socket"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-net-config"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-net-time +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-next +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-next +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-next +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-tie-hash"
> -RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-odbm-file +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-ok +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-ok +=3D "${PN}-module-test-more"
> -RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-subs"
> -RDEPENDS_${PN}-module-opcode +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-open +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-open +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-open +=3D "${PN}-module-encoding"
> -RDEPENDS_${PN}-module-open +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-o +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-o +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-ops +=3D "${PN}-module-opcode"
> -RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-overload-numbers"
> -RDEPENDS_${PN}-module-overloading +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-overload +=3D "${PN}-module-mro"
> -RDEPENDS_${PN}-module-overload +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-overload +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-locale-maketext-si=
mple"
> -RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-params-check +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-parent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-parent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-perlfaq +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-perlfaq +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-perlio-encoding +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-perlio-encoding +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-perlio-mmap +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-perlio-scalar +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-perlio-via +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-perlio-via-quotedprint +=3D "${PN}-module-mime-quo=
tedprint"
> -RDEPENDS_${PN}-module-perlio-via-quotedprint +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-pod-parser"
> -RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-pod-parseutils"
> -RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-checker +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-escapes +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-file-find"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-pod-find +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-functions +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-functions +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-inputobjects +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-inputobjects +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-subs"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-man +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-parselink +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-parselink +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-parselink +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-parselink +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-pod-inputobjects"
> -RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-pod-parser +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-parseutils +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-parseutils +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-parseutils +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-file-spec-fu=
nctions"
> -RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-baseto +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-getoptsoo +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-spec-functions=
"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-file-temp"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-pod-perldoc-getopts=
oo"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-pod-text-col=
or"
> -RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-toansi +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-pod-check=
er"
> -RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-tochecker +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-file-spec-fun=
ctions"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-io-select"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-ipc-open3"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-pod-man"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-pod-perldoc-t=
opod"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-toman +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-pod-man"
> -RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-tonroff +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-topod +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-tortf +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-pod-text-ter=
mcap"
> -RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-toterm +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-pod-text"
> -RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-totext +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-parent"
> -RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-perldoc-toxml +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-plaintext +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-plaintext +=3D "${PN}-module-pod-select"
> -RDEPENDS_${PN}-module-pod-plaintext +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-plaintext +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-pod-plaintext +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-pod-parser"
> -RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-select +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-pod-simple-=
transcode"
> -RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-blackbox +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-checker +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-checker +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-simple-checker +=3D "${PN}-module-pod-simple-m=
ethody"
> -RDEPENDS_${PN}-module-pod-simple-checker +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-checker +=3D "${PN}-module-text-wrap"
> -RDEPENDS_${PN}-module-pod-simple-checker +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-debug +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-debug +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-simple-debug +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-debug +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-dumpastext +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-dumpastext +=3D "${PN}-module-pod-simpl=
e"
> -RDEPENDS_${PN}-module-pod-simple-dumpastext +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-pod-simple=
"
> -RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-dumpasxml +=3D "${PN}-module-text-wrap"
> -RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-overload=
"
> -RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-pod-simp=
le-blackbox"
> -RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-linksection +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-methody +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-simple-methody +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-methody +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-escapes"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-blackbox"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-linksecti=
on"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-pod-simple-tiedoutfh=
"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-pod-simple +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-progress +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-p=
od-simple-pullparsertoken"
> -RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-pod-simple-pullparserendtoken +=3D "${PN}-module-v=
ars"
> -RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simpl=
e"
> -RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simpl=
e-pullparserendtoken"
> -RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simpl=
e-pullparserstarttoken"
> -RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-pod-simpl=
e-pullparsertexttoken"
> -RDEPENDS_${PN}-module-pod-simple-pullparser +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module=
-carp"
> -RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module=
-pod-simple-pullparsertoken"
> -RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module=
-strict"
> -RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken +=3D "${PN}-module=
-vars"
> -RDEPENDS_${PN}-module-pod-simple-pullparsertexttoken +=3D "${PN}-module-=
pod-simple-pullparsertoken"
> -RDEPENDS_${PN}-module-pod-simple-pullparsertexttoken +=3D "${PN}-module-=
strict"
> -RDEPENDS_${PN}-module-pod-simple-pullparsertexttoken +=3D "${PN}-module-=
vars"
> -RDEPENDS_${PN}-module-pod-simple-pullparsertoken +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-pod-simple-rtf +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-rtf +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-pod-simple-rtf +=3D "${PN}-module-pod-simple-pullp=
arser"
> -RDEPENDS_${PN}-module-pod-simple-rtf +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-rtf +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-cwd"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-file-basename=
"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-search +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-pod-simpl=
e"
> -RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-simpletree +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-pod-simp=
le"
> -RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-textcontent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-pod-simple-meth=
ody"
> -RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-text-wrap"
> -RDEPENDS_${PN}-module-pod-simple-text +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-pod-simple-tiedoutfh +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-transcodedumb +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-pod-simple-transcodedumb +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-transcode +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-transcode +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-encod=
e"
> -RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-pod-s=
imple"
> -RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-pod-simple-transcodesmart +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-pod-sim=
ple"
> -RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-simple-xmloutstream +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-pod-text"
> -RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-term-ansicolor"
> -RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-text-color +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-pod-text"
> -RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-text-overstrike +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-encode"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-pod-simple"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-text +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-pod-text"
> -RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-term-cap"
> -RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-pod-text-termcap +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-pod-usage +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-posix +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-posix +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-posix +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-posix +=3D "${PN}-module-tie-hash"
> -RDEPENDS_${PN}-module-posix +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-posix +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-re +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-re +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-re +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-re +=3D "${PN}-module-term-cap"
> -RDEPENDS_${PN}-module-re +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-re +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-b"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-carp-heavy"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-opcode"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-safe +=3D "${PN}-module-utf8"
> -RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-list-util"
> -RDEPENDS_${PN}-module-scalar-util +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-tie-hash"
> -RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-sdbm-file +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-search-dict +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-search-dict +=3D "${PN}-module-feature"
> -RDEPENDS_${PN}-module-search-dict +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-selectsaver +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-selectsaver +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-selfloader +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-sigtrap +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-sigtrap +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-socket +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-socket +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-socket +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-socket +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-socket +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-socket +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-sort +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-sort +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-storable +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-storable +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-storable +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-storable +=3D "${PN}-module-io-file"
> -RDEPENDS_${PN}-module-storable +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-storable +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-list-util"
> -RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-sub-util +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-symbol +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-sys-hostname +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-file-basename"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-socket"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-sys-hostname"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-sys-syslog +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-base +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-tap-formatte=
r-color"
> -RDEPENDS_${PN}-module-tap-formatter-base +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-formatter-color +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-base"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-carp"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-constant"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-file-path"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-file-spec"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-strict"
> -RDEPENDS_${PN}-module-tap-formatter-console-parallelsession +=3D "${PN}-=
module-warnings"
> -RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-formatter-console +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-b=
ase"
> -RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-tap-formatter-console-session +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-tap-formatte=
r-file-session"
> -RDEPENDS_${PN}-module-tap-formatter-file +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-base=
"
> -RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-tap-formatter-file-session +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-formatter-session +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-tap-object"
> -RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-text-parsewords=
"
> -RDEPENDS_${PN}-module-tap-harness-env +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-file-path"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-io-handle"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-harness +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-object +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-benchmark=
"
> -RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-aggregator +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-tap-parser-r=
esultfactory"
> -RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-tap-parser-y=
amlish-reader"
> -RDEPENDS_${PN}-module-tap-parser-grammar +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-iterator-array +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-base=
"
> -RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-carp=
"
> -RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-cons=
tant"
> -RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-file=
-basename"
> -RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-tap-parser-iteratorfactory +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-iterator +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-bas=
e"
> -RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-con=
fig"
> -RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-io-=
handle"
> -RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-str=
ict"
> -RDEPENDS_${PN}-module-tap-parser-iterator-process +=3D "${PN}-module-war=
nings"
> -RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-base=
"
> -RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-tap-parser-iterator-stream +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-constant=
"
> -RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-io-selec=
t"
> -RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-multiplexer +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-grammar"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-iterator"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-iteratorf=
actory"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-result"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-resultfac=
tory"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-source"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehan=
dler-executable"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehan=
dler-file"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehan=
dler-handle"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehan=
dler-perl"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-tap-parser-sourcehan=
dler-rawtap"
> -RDEPENDS_${PN}-module-tap-parser +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-result-bailout +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-result-comment +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-bailout"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-comment"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-plan"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-pragma"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-test"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-unknown"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-version"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-tap-pa=
rser-result-yaml"
> -RDEPENDS_${PN}-module-tap-parser-resultfactory +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-result +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-result-plan +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-tap-parser-result-pragma +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-result-test +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-result-unknown +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-result-version +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-result-yaml +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-tap-parser-scheduler-job +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-tap-parser=
-scheduler-job"
> -RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-tap-parser=
-scheduler-spinner"
> -RDEPENDS_${PN}-module-tap-parser-scheduler +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-ca=
rp"
> -RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-tap-parser-scheduler-spinner +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-mo=
dule-base"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-mo=
dule-constant"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-mo=
dule-strict"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-mo=
dule-tap-parser-iteratorfactory"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-mo=
dule-tap-parser-iterator-process"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable +=3D "${PN}-mo=
dule-warnings"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-b=
ase"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-c=
onstant"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-t=
ap-parser-iteratorfactory"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-t=
ap-parser-iterator-stream"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-file +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module=
-base"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module=
-constant"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module=
-strict"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module=
-tap-parser-iteratorfactory"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module=
-tap-parser-iterator-stream"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle +=3D "${PN}-module=
-warnings"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-tap-pa=
rser-iterator"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-b=
ase"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-c=
onfig"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-c=
onstant"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-s=
trict"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-t=
ap-parser-iteratorfactory"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-t=
ap-parser-iterator-process"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-t=
ext-parsewords"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl +=3D "${PN}-module-w=
arnings"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module=
-base"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module=
-strict"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module=
-tap-parser-iterator-array"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module=
-tap-parser-iteratorfactory"
> -RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap +=3D "${PN}-module=
-warnings"
> -RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-file-basename=
"
> -RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tap-parser-source +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-yamlish-reader +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-tap-parser-yamlish-writer +=3D "${PN}-module-warni=
ngs"
> -RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-term-ansicolor +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-term-cap +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-term-cap +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-term-cap +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-term-complete +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-term-complete +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-term-readline +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-term-readline +=3D "${PN}-module-term-cap"
> -RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-builder-module +=3D "${PN}-module-test-builde=
r"
> -RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-perlio"
> -RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-threads-shared"
> -RDEPENDS_${PN}-module-test-builder +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-test-builder-tester-color +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-test-builder-tester-color +=3D "${PN}-module-test-=
builder-tester"
> -RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-test-builder-tester +=3D "${PN}-module-test-builde=
r"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-harness"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-aggrega=
tor"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-source"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-tap-parser-sourceh=
andler-perl"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-text-parsewords"
> -RDEPENDS_${PN}-module-test-harness +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-test-builder-module"
> -RDEPENDS_${PN}-module-test-more +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-test +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-test +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-test +=3D "${PN}-module-file-temp"
> -RDEPENDS_${PN}-module-test +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-test-simple +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-simple +=3D "${PN}-module-test-builder-module=
"
> -RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-test-builde=
r"
> -RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-threads-sha=
red"
> -RDEPENDS_${PN}-module-test-tester-capture +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-test-tester-capturerunner +=3D "${PN}-module-expor=
ter"
> -RDEPENDS_${PN}-module-test-tester-capturerunner +=3D "${PN}-module-stric=
t"
> -RDEPENDS_${PN}-module-test-tester-capturerunner +=3D "${PN}-module-test-=
tester-capture"
> -RDEPENDS_${PN}-module-test-tester-delegate +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-tester-delegate +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-test-tester-delegate +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-test-builder"
> -RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-test-tester-capture=
runner"
> -RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-test-tester-delegat=
e"
> -RDEPENDS_${PN}-module-test-tester +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-text-abbrev +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-selfloader"
> -RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-text-balanced +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-text-parsewords +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-text-parsewords +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-text-parsewords +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-text-tabs +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-text-tabs +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-text-tabs +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-text-wrap +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-text-wrap +=3D "${PN}-module-re"
> -RDEPENDS_${PN}-module-text-wrap +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-text-wrap +=3D "${PN}-module-text-tabs"
> -RDEPENDS_${PN}-module-text-wrap +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-text-wrap +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-thread +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-thread +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-thread +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-thread +=3D "${PN}-module-threads"
> -RDEPENDS_${PN}-module-thread +=3D "${PN}-module-threads-shared"
> -RDEPENDS_${PN}-module-thread +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-threads-shared"
> -RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-thread-semaphore +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-thread-semaphore +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-thread-semaphore +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-thread-semaphore +=3D "${PN}-module-threads-shared=
"
> -RDEPENDS_${PN}-module-thread-semaphore +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-threads +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-threads +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-threads +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-threads +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-threads +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-threads +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-threads-shared +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-threads-shared +=3D "${PN}-module-scalar-util"
> -RDEPENDS_${PN}-module-threads-shared +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-threads-shared +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-threads-shared +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-tie-array +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-array +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tie-array +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-tie-file +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-file +=3D "${PN}-module-fcntl"
> -RDEPENDS_${PN}-module-tie-file +=3D "${PN}-module-posix"
> -RDEPENDS_${PN}-module-tie-file +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tie-file +=3D "${PN}-module-symbol"
> -RDEPENDS_${PN}-module-tie-handle +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-handle +=3D "${PN}-module-tie-stdhandle"
> -RDEPENDS_${PN}-module-tie-handle +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-tie-hash-namedcapture +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tie-hash-namedcapture +=3D "${PN}-module-xsloader"
> -RDEPENDS_${PN}-module-tie-hash +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-hash +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-tie-memoize +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tie-memoize +=3D "${PN}-module-tie-hash"
> -RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-tie-hash"
> -RDEPENDS_${PN}-module-tie-refhash +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-tie-scalar +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-scalar +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-tie-stdhandle +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-tie-stdhandle +=3D "${PN}-module-tie-handle"
> -RDEPENDS_${PN}-module-tie-stdhandle +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-tie-substrhash +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-tie-substrhash +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-time-gmtime +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-time-gmtime +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-time-gmtime +=3D "${PN}-module-time-tm"
> -RDEPENDS_${PN}-module-time-gmtime +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-time-hires +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-time-local +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-time-localtime +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-time-localtime +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-time-localtime +=3D "${PN}-module-time-tm"
> -RDEPENDS_${PN}-module-time-localtime +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-time-local"
> -RDEPENDS_${PN}-module-time-piece +=3D "${PN}-module-time-seconds"
> -RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-overload"
> -RDEPENDS_${PN}-module-time-seconds +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-time-tm +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-time-tm +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-big5 +=3D "${PN}-module-strict=
"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-big5 +=3D "${PN}-module-warnin=
gs"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 +=3D "${PN}-module-st=
rict"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 +=3D "${PN}-module-wa=
rnings"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-korean +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-stroke +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-stroke +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin +=3D "${PN}-module-stri=
ct"
> -RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin +=3D "${PN}-module-warn=
ings"
> -RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-base"
> -RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-unicode-collate-locale +=3D "${PN}-module-warnings=
"
> -RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-constant"
> -RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-unicode-collate +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-dynaloader"
> -RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-unicode-normalize +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-charnames"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-feature"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-file-spec"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-if"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-unicode-normalize"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-unicore"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-utf8-heavy"
> -RDEPENDS_${PN}-module-unicode-ucd +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-unicore +=3D "${PN}-module-integer"
> -RDEPENDS_${PN}-module-universal +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-user-grent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-class-struct"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-config"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-exporter"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-user-pwent +=3D "${PN}-module-warnings"
> -RDEPENDS_${PN}-module-utf8 +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-utf8 +=3D "${PN}-module-utf8-heavy"
> -RDEPENDS_${PN}-module-version +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-version +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-version +=3D "${PN}-module-version-regex"
> -RDEPENDS_${PN}-module-version +=3D "${PN}-module-warnings-register"
> -RDEPENDS_${PN}-module-version-regex +=3D "${PN}-module-strict"
> -RDEPENDS_${PN}-module-version-regex +=3D "${PN}-module-vars"
> -RDEPENDS_${PN}-module-xsloader +=3D "${PN}-module-carp"
> -RDEPENDS_${PN}-module-xsloader +=3D "${PN}-module-dynaloader"
> diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.28.0.inc b/meta/r=
ecipes-devtools/perl/perl-rdepends_5.28.0.inc
> new file mode 100644
> index 0000000000..185309a761
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-rdepends_5.28.0.inc
> @@ -0,0 +1,2821 @@
> +# To create/update the perl-rdepends_5.28.0.inc use this piece of ugly s=
cript (modified for your arch/paths etc):
> +
> +#jiahongxu:5.20.0-r1$ pwd
> +#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl=
/5.20.0-r1
> +
> +#1 cp -r packages-split packages-split.new && cd packages-split.new
> +#2 find . -name \*.pm | xargs sed -i '/^=3Dhead/,/^=3Dcut/d'
> +#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include=3D"*=
.pm"
> +#| sed "s/\/.*\.pm: */ +=3D /g;s/[\"\']//g;s/;.*/\"/g;s/+=3D .*\(require=
\|use\)\> */+=3D \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan=
/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr =
[:upper:] [:lower:]
> +#| awk '{if ($3 !=3D "\x22"$1"\x22"){ print $0}}'
> +#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e au=
toperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-=
mac -e fcgi -e lwp -e dbd -e dbix
> +#| sort -u
> +#| sed 's/^/RDEPENDS_/;s/perl-module-/perl-module-/g;s/module-\(module-\=
)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
> +#| egrep -wv '=3D>|module-a|module-apache.?|module-apr|module-authen-sas=
l|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-pe=
rl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extuti=
ls-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|modul=
e-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl=
-util|module-pluggable-object|module-test-builder-io-scalar|module-text-uni=
decode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-=
rdepends
> +
> +RDEPENDS_perl-misc +=3D "perl perl-modules"
> +RDEPENDS_perl-pod +=3D "perl"
> +
> +# Some additional dependencies that the above doesn't manage to figure o=
ut
> +RDEPENDS_perl-module-file-spec +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-math-bigint-calc"
> +RDEPENDS_perl-module-thread-queue +=3D "perl-module-attributes"
> +RDEPENDS_perl-module-overload +=3D "perl-module-overloading"
> +
> +# Generated depends list beyond this line
> +RDEPENDS_perl-module-anydbm-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-anydbm-file +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-carp"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-config"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-constant"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-cpan"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-file-spec-functions"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-getopt-std"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-if"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-net-ping"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-strict"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-uri"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-user-pwent"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-vars"
> +RDEPENDS_perl-module-app-cpan +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-app-prove-state"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-base"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-carp"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-constant"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-getopt-long"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-strict"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-tap-harness"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-tap-harness-env"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-app-prove +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-app-prove-state-r=
esult"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-base"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-carp"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-constant"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-strict"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-tap-parser-yamlis=
h-reader"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-tap-parser-yamlis=
h-writer"
> +RDEPENDS_perl-module-app-prove-state +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-app-prove-state-result +=3D "perl-module-app-prove-=
state-result-test"
> +RDEPENDS_perl-module-app-prove-state-result +=3D "perl-module-carp"
> +RDEPENDS_perl-module-app-prove-state-result +=3D "perl-module-constant"
> +RDEPENDS_perl-module-app-prove-state-result +=3D "perl-module-strict"
> +RDEPENDS_perl-module-app-prove-state-result +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-app-prove-state-result-test +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-app-prove-state-result-test +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-archive-tar-constant +=3D "perl-module-constant"
> +RDEPENDS_perl-module-archive-tar-constant +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-archive-tar-constant +=3D "perl-module-io-compress-=
bzip2"
> +RDEPENDS_perl-module-archive-tar-constant +=3D "perl-module-strict"
> +RDEPENDS_perl-module-archive-tar-constant +=3D "perl-module-time-local"
> +RDEPENDS_perl-module-archive-tar-constant +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-archive-tar"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-archive-tar-cons=
tant"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-carp"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-archive-tar-file +=3D "perl-module-vars"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-archive-tar-constant"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-archive-tar-file"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-carp"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-config"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-io-zlib"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-strict"
> +RDEPENDS_perl-module-archive-tar +=3D "perl-module-vars"
> +RDEPENDS_perl-module-arybase +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-attribute-handlers +=3D "perl-module-carp"
> +RDEPENDS_perl-module-attribute-handlers +=3D "perl-module-strict"
> +RDEPENDS_perl-module-attribute-handlers +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-attributes +=3D "perl-module-carp"
> +RDEPENDS_perl-module-attributes +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-attributes +=3D "perl-module-strict"
> +RDEPENDS_perl-module-attributes +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-attributes +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-carp"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-constant"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-fatal"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-overload"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-exception +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-autodie-exception-system +=3D "perl-module-carp"
> +RDEPENDS_perl-module-autodie-exception-system +=3D "perl-module-parent"
> +RDEPENDS_perl-module-autodie-exception-system +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-exception-system +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-autodie-hints +=3D "perl-module-b"
> +RDEPENDS_perl-module-autodie-hints +=3D "perl-module-carp"
> +RDEPENDS_perl-module-autodie-hints +=3D "perl-module-constant"
> +RDEPENDS_perl-module-autodie-hints +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-hints +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-autodie +=3D "perl-module-carp"
> +RDEPENDS_perl-module-autodie +=3D "perl-module-constant"
> +RDEPENDS_perl-module-autodie +=3D "perl-module-lib"
> +RDEPENDS_perl-module-autodie +=3D "perl-module-parent"
> +RDEPENDS_perl-module-autodie +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-autodie-scope-guard +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-scope-guard +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-autodie-scope-guardstack +=3D "perl-module-autodie-=
scope-guard"
> +RDEPENDS_perl-module-autodie-scope-guardstack +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-scope-guardstack +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-autodie-skip +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-skip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-autodie-util +=3D "perl-module-autodie-scope-guards=
tack"
> +RDEPENDS_perl-module-autodie-util +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-autodie-util +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autodie-util +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-autoloader +=3D "perl-module-carp"
> +RDEPENDS_perl-module-autoloader +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-carp"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-config"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-file-spec-functions"
> +RDEPENDS_perl-module-autosplit +=3D "perl-module-strict"
> +RDEPENDS_perl-module-autouse +=3D "perl-module-carp"
> +RDEPENDS_perl-module-base +=3D "perl-module-carp"
> +RDEPENDS_perl-module-base +=3D "perl-module-strict"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-b"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-b-op-private"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-config"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-feature"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-strict"
> +RDEPENDS_perl-module-b-concise +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-b-debug +=3D "perl-module-b"
> +RDEPENDS_perl-module-b-debug +=3D "perl-module-config"
> +RDEPENDS_perl-module-b-debug +=3D "perl-module-strict"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-b"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-carp"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-config"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-feature"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-re"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-s"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-strict"
> +RDEPENDS_perl-module-b-deparse +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-benchmark +=3D "perl-module-carp"
> +RDEPENDS_perl-module-benchmark +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-benchmark +=3D "perl-module-strict"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-carp"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-constant"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-math-bigint-trace"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-overload"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-strict"
> +RDEPENDS_perl-module-bigint +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-bigint"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-carp"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-math-bigfloat"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-math-bigfloat-trace"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-math-bigint-trace"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-overload"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-strict"
> +RDEPENDS_perl-module-bignum +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-bigint"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-carp"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-math-bigfloat"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-math-bigint-trace"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-math-bigrat"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-overload"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-strict"
> +RDEPENDS_perl-module-bigrat +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-blib +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-blib +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-b +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-b +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-b-showlex +=3D "perl-module-b"
> +RDEPENDS_perl-module-b-showlex +=3D "perl-module-b-concise"
> +RDEPENDS_perl-module-b-showlex +=3D "perl-module-b-terse"
> +RDEPENDS_perl-module-b-showlex +=3D "perl-module-strict"
> +RDEPENDS_perl-module-b-terse +=3D "perl-module-b"
> +RDEPENDS_perl-module-b-terse +=3D "perl-module-b-concise"
> +RDEPENDS_perl-module-b-terse +=3D "perl-module-carp"
> +RDEPENDS_perl-module-b-terse +=3D "perl-module-strict"
> +RDEPENDS_perl-module-b-xref +=3D "perl-module-b"
> +RDEPENDS_perl-module-b-xref +=3D "perl-module-config"
> +RDEPENDS_perl-module-b-xref +=3D "perl-module-strict"
> +RDEPENDS_perl-module-bytes +=3D "perl-module-bytes-heavy"
> +RDEPENDS_perl-module-bytes +=3D "perl-module-carp"
> +RDEPENDS_perl-module-carp-heavy +=3D "perl-module-carp"
> +RDEPENDS_perl-module-carp +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-carp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-carp +=3D "perl-module-warnings"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-charnames +=3D "perl-module-bytes"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-carp"
> +RDEPENDS_perl-module-charnames +=3D "perl-module--charnames"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-re"
> +RDEPENDS_perl-module-charnames +=3D "perl-module-re"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-strict"
> +RDEPENDS_perl-module-charnames +=3D "perl-module-strict"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-unicore-name"
> +RDEPENDS_perl-module-charnames +=3D "perl-module-unicore-name"
> +RDEPENDS_perl-module--charnames +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-charnames +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-class-struct +=3D "perl-module-carp"
> +RDEPENDS_perl-module-class-struct +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-class-struct +=3D "perl-module-strict"
> +RDEPENDS_perl-module-class-struct +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-bytes "
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-carp "
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-constant"
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-dynaloader"
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-strict "
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-warnings "
> +RDEPENDS_perl-module-compress-raw-bzip2 +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-bytes "
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-carp "
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-constant"
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-dynaloader"
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-strict "
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-warnings "
> +RDEPENDS_perl-module-compress-raw-zlib +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-bytes "
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-carp "
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-compress-raw-zlib"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-constant"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-io-compress-base-co=
mmon"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-io-compress-gzip"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-io-compress-gzip-co=
nstants"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-io-handle "
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-io-uncompress-gunzi=
p"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-strict "
> +RDEPENDS_perl-module-compress-zlib +=3D "perl-module-warnings "
> +RDEPENDS_perl-module-config-extensions +=3D "perl-module-config"
> +RDEPENDS_perl-module-config-extensions +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-config-extensions +=3D "perl-module-strict"
> +RDEPENDS_perl-module-config-perl-v +=3D "perl-module-config"
> +RDEPENDS_perl-module-config-perl-v +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-config-perl-v +=3D "perl-module-strict"
> +RDEPENDS_perl-module-config-perl-v +=3D "perl-module-vars"
> +RDEPENDS_perl-module-config-perl-v +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-constant +=3D "perl-module-carp"
> +RDEPENDS_perl-module-constant +=3D "perl-module-strict"
> +RDEPENDS_perl-module-constant +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-corelist +=3D "perl-module-list-util"
> +RDEPENDS_perl-module-corelist +=3D "perl-module-corelist"
> +RDEPENDS_perl-module-corelist +=3D "perl-module-strict"
> +RDEPENDS_perl-module-corelist +=3D "perl-module-version"
> +RDEPENDS_perl-module-corelist +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-b"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-carp"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-config"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-dirhandle"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-errno"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-extutils-makemaker"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-extutils-manifest"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-file-copy"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-lib"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-net-ping"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-overload"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-posix"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-safe"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-strict"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-sys-hostname"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-term-readline"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-text-wrap"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-time-local"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-vars"
> +RDEPENDS_perl-module-cpan +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-cwd +=3D "perl-module-errno"
> +RDEPENDS_perl-module-cwd +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-cwd +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-cwd +=3D "perl-module-strict"
> +RDEPENDS_perl-module-cwd +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-b-deparse"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-carp"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-config"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-constant"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-data-dumper +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-dbm-filter-compress +=3D "perl-module-carp"
> +RDEPENDS_perl-module-dbm-filter-compress +=3D "perl-module-strict"
> +RDEPENDS_perl-module-dbm-filter-compress +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-dbm-filter-encode +=3D "perl-module-carp"
> +RDEPENDS_perl-module-dbm-filter-encode +=3D "perl-module-strict"
> +RDEPENDS_perl-module-dbm-filter-encode +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-dbm-filter-int32 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-dbm-filter-int32 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-dbm-filter-null +=3D "perl-module-strict"
> +RDEPENDS_perl-module-dbm-filter-null +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-dbm-filter +=3D "perl-module-carp"
> +RDEPENDS_perl-module-dbm-filter +=3D "perl-module-strict"
> +RDEPENDS_perl-module-dbm-filter +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-dbm-filter-utf8 +=3D "perl-module-carp"
> +RDEPENDS_perl-module-dbm-filter-utf8 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-dbm-filter-utf8 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-db +=3D "perl-module-meta-notation.pm"
> +RDEPENDS_perl-module-db +=3D "perl-module-strict"
> +RDEPENDS_perl-module-deprecate +=3D "perl-module-carp"
> +RDEPENDS_perl-module-deprecate +=3D "perl-module-strict"
> +RDEPENDS_perl-module-deprecate +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-devel-peek +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-devel-peek +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-devel-ppport +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-devel-ppport +=3D "perl-module-getopt-long"
> +RDEPENDS_perl-module-devel-ppport +=3D "perl-module-strict"
> +RDEPENDS_perl-module-devel-ppport +=3D "perl-module-vars"
> +RDEPENDS_perl-module-devel-selfstubber +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-devel-selfstubber +=3D "perl-module-selfloader"
> +RDEPENDS_perl-module-diagnostics +=3D "perl-module-carp"
> +RDEPENDS_perl-module-diagnostics +=3D "perl-module-config"
> +RDEPENDS_perl-module-diagnostics +=3D "perl-module-getopt-std"
> +RDEPENDS_perl-module-diagnostics +=3D "perl-module-strict"
> +RDEPENDS_perl-module-diagnostics +=3D "perl-module-text-tabs"
> +RDEPENDS_perl-module-digest-base +=3D "perl-module-carp"
> +RDEPENDS_perl-module-digest-base +=3D "perl-module-mime-base64"
> +RDEPENDS_perl-module-digest-base +=3D "perl-module-strict"
> +RDEPENDS_perl-module-digest-base +=3D "perl-module-vars"
> +RDEPENDS_perl-module-digest-file +=3D "perl-module-carp"
> +RDEPENDS_perl-module-digest-file +=3D "perl-module-digest"
> +RDEPENDS_perl-module-digest-file +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-digest-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-digest-file +=3D "perl-module-vars"
> +RDEPENDS_perl-module-digest-md5 +=3D "perl-module-digest-base"
> +RDEPENDS_perl-module-digest-md5 +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-digest-md5 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-digest-md5 +=3D "perl-module-vars"
> +RDEPENDS_perl-module-digest-md5 +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-digest +=3D "perl-module-strict"
> +RDEPENDS_perl-module-digest +=3D "perl-module-vars"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-carp"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-digest-base"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-dynaloader"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-integer"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-strict"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-vars"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-digest-sha +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-dirhandle +=3D "perl-module-carp"
> +RDEPENDS_perl-module-dirhandle +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-dynaloader +=3D "perl-module-carp"
> +RDEPENDS_perl-module-dynaloader +=3D "perl-module-config"
> +RDEPENDS_perl-module-encode-alias +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-alias +=3D "perl-module-constant"
> +RDEPENDS_perl-module-encode-alias +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-alias +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-encode-alias +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-alias +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-byte +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-byte +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-byte +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-byte +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-cjkconstants +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-cjkconstants +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-encode-cjkconstants +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-cjkconstants +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-cn-hz +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-cn-hz +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-cn-hz +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-cn-hz +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-encode-cn-hz +=3D "perl-module-vars"
> +RDEPENDS_perl-module-encode-cn-hz +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-cn +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-cn +=3D "perl-module-encode-cn-hz"
> +RDEPENDS_perl-module-encode-cn +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-cn +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-cn +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-config +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-config +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-ebcdic +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-ebcdic +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-ebcdic +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-ebcdic +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-constant"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-overload"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-encoder +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-encoding +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-encoding +=3D "perl-module-constant"
> +RDEPENDS_perl-module-encode-encoding +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-encoding +=3D "perl-module-encode-mime-name"
> +RDEPENDS_perl-module-encode-encoding +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-encoding +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-vars"
> +RDEPENDS_perl-module-encode-gsm0338 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-constant"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-encode-unicode"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-guess +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-jp-h2z +=3D "perl-module-encode-cjkconstants=
"
> +RDEPENDS_perl-module-encode-jp-h2z +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-jp-h2z +=3D "perl-module-vars"
> +RDEPENDS_perl-module-encode-jp-h2z +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-encode-cjkconstant=
s"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-encode-jp-h2z"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-jp +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-jp +=3D "perl-module-encode-jp-jis7"
> +RDEPENDS_perl-module-encode-jp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-jp +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-jp +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-encode-cjkconst=
ants"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-kr +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-kr +=3D "perl-module-encode-kr-2022-kr"
> +RDEPENDS_perl-module-encode-kr +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-kr +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-kr +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-mime-header-iso-2022-jp +=3D "perl-module-co=
nstant"
> +RDEPENDS_perl-module-encode-mime-header-iso-2022-jp +=3D "perl-module-en=
code-cjkconstants"
> +RDEPENDS_perl-module-encode-mime-header-iso-2022-jp +=3D "perl-module-pa=
rent"
> +RDEPENDS_perl-module-encode-mime-header-iso-2022-jp +=3D "perl-module-st=
rict"
> +RDEPENDS_perl-module-encode-mime-header-iso-2022-jp +=3D "perl-module-wa=
rnings"
> +RDEPENDS_perl-module-encode-mime-header +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode-mime-header +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-mime-header +=3D "perl-module-mime-base64"
> +RDEPENDS_perl-module-encode-mime-header +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-mime-header +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-mime-header +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-mime-name +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-mime-name +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-encode +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encode +=3D "perl-module-constant"
> +RDEPENDS_perl-module-encode +=3D "perl-module-encode-alias"
> +RDEPENDS_perl-module-encode +=3D "perl-module-encode-config"
> +RDEPENDS_perl-module-encode +=3D "perl-module-encode-configlocal-pm"
> +RDEPENDS_perl-module-encode +=3D "perl-module-encode-mime-name"
> +RDEPENDS_perl-module-encode +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-encode +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode +=3D "perl-module-storable"
> +RDEPENDS_perl-module-encode +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-symbol +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-symbol +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-symbol +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-symbol +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-tw +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-tw +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-tw +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-tw +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-unicode +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-unicode +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-unicode +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-unicode +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encode-unicode +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-encode-unicode-utf7 +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-unicode-utf7 +=3D "perl-module-mime-base64"
> +RDEPENDS_perl-module-encode-unicode-utf7 +=3D "perl-module-parent"
> +RDEPENDS_perl-module-encode-unicode-utf7 +=3D "perl-module-re"
> +RDEPENDS_perl-module-encode-unicode-utf7 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encode-unicode-utf7 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-config"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-constant"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-filter-util-call"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-i18n-langinfo"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-posix"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-encoding +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-encoding-warnings +=3D "perl-module-carp"
> +RDEPENDS_perl-module-encoding-warnings +=3D "perl-module-strict"
> +RDEPENDS_perl-module-encoding-warnings +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-english +=3D "perl-module-carp "
> +RDEPENDS_perl-module-english +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-env +=3D "perl-module-config"
> +RDEPENDS_perl-module-env +=3D "perl-module-tie-array"
> +RDEPENDS_perl-module-errno +=3D "perl-module-carp"
> +RDEPENDS_perl-module-errno +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-errno +=3D "perl-module-strict"
> +RDEPENDS_perl-module-experimental +=3D "perl-module-carp"
> +RDEPENDS_perl-module-experimental +=3D "perl-module-strict"
> +RDEPENDS_perl-module-experimental +=3D "perl-module-version"
> +RDEPENDS_perl-module-experimental +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-exporter-heavy +=3D "perl-module-carp"
> +RDEPENDS_perl-module-exporter-heavy +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-exporter-heavy +=3D "perl-module-strict"
> +RDEPENDS_perl-module-exporter +=3D "perl-module-exporter-heavy"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-dynaloader=
"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-extutils-m=
ksymlists"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-file-basen=
ame"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-file-temp"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-ipc-cmd"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-text-parse=
words"
> +RDEPENDS_perl-module-extutils-cbuilder-base +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-cbuilder +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-extutils-cbuilder +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-cbuilder +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-cbuilder +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-aix +=3D "perl-module-ex=
tutils-cbuilder-platform-unix"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-aix +=3D "perl-module-fi=
le-spec"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-aix +=3D "perl-module-st=
rict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-aix +=3D "perl-module-wa=
rnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-android +=3D "perl-modul=
e-config"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-android +=3D "perl-modul=
e-extutils-cbuilder-platform-unix"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-android +=3D "perl-modul=
e-file-spec"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-android +=3D "perl-modul=
e-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-android +=3D "perl-modul=
e-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin +=3D "perl-module=
-extutils-cbuilder-platform-unix"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin +=3D "perl-module=
-file-spec"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin +=3D "perl-module=
-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin +=3D "perl-module=
-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-darwin +=3D "perl-module=
-extutils-cbuilder-platform-unix"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-darwin +=3D "perl-module=
-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-darwin +=3D "perl-module=
-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf +=3D "perl-modul=
e-extutils-cbuilder-platform-unix"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf +=3D "perl-modul=
e-file-spec"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf +=3D "perl-modul=
e-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf +=3D "perl-modul=
e-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-os2 +=3D "perl-module-ex=
tutils-cbuilder-platform-unix"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-os2 +=3D "perl-module-st=
rict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-os2 +=3D "perl-module-wa=
rnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-unix +=3D "perl-module-e=
xtutils-cbuilder-base"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-unix +=3D "perl-module-s=
trict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-unix +=3D "perl-module-w=
arnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-vms +=3D "perl-module-co=
nfig"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-vms +=3D "perl-module-ex=
tutils-cbuilder-base"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-vms +=3D "perl-module-fi=
le-spec-functions"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-vms +=3D "perl-module-st=
rict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-vms +=3D "perl-module-wa=
rnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows-bcc +=3D "perl-m=
odule-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows-bcc +=3D "perl-m=
odule-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows-gcc +=3D "perl-m=
odule-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows-gcc +=3D "perl-m=
odule-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows-msvc +=3D "perl-=
module-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows-msvc +=3D "perl-=
module-warnings"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows +=3D "perl-modul=
e-extutils-cbuilder-base"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows +=3D "perl-modul=
e-file-basename"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows +=3D "perl-modul=
e-file-spec"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows +=3D "perl-modul=
e-io-file"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows +=3D "perl-modul=
e-strict"
> +RDEPENDS_perl-module-extutils-cbuilder-platform-windows +=3D "perl-modul=
e-warnings"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-extutils-comm=
and"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-extutils-inst=
all"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-getopt-long"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-test-harness"
> +RDEPENDS_perl-module-extutils-command-mm +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-file-copy"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-command +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-constant-base +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-constant-base +=3D "perl-module-constant"
> +RDEPENDS_perl-module-extutils-constant-base +=3D "perl-module-extutils-c=
onstant-utils"
> +RDEPENDS_perl-module-extutils-constant-base +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-constant-base +=3D "perl-module-text-wrap"
> +RDEPENDS_perl-module-extutils-constant-base +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-extutils-consta=
nt-proxysubs"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-extutils-consta=
nt-utils"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-extutils-consta=
nt-xs"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-constant +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-constant-proxysubs +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-constant-proxysubs +=3D "perl-module-extut=
ils-constant-utils"
> +RDEPENDS_perl-module-extutils-constant-proxysubs +=3D "perl-module-extut=
ils-constant-xs"
> +RDEPENDS_perl-module-extutils-constant-proxysubs +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-extutils-constant-proxysubs +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-constant-utils +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-constant-utils +=3D "perl-module-constant"
> +RDEPENDS_perl-module-extutils-constant-utils +=3D "perl-module-posix"
> +RDEPENDS_perl-module-extutils-constant-utils +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-constant-utils +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-extutils-con=
stant"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-extutils-con=
stant-base"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-extutils-con=
stant-utils"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-constant-xs +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-extutils-liblist"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-extutils-makemaker=
"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-getopt-std"
> +RDEPENDS_perl-module-extutils-embed +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-extutils-makem=
aker"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-extutils-packl=
ist"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-installed +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-autosplit"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-extutils-packlis=
t"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-file-compare"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-file-copy"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-install +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-extutils-mak=
emaker-config"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-file-basenam=
e"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-text-parsewo=
rds"
> +RDEPENDS_perl-module-extutils-liblist-kid +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-liblist +=3D "perl-module-extutils-liblist=
-kid"
> +RDEPENDS_perl-module-extutils-liblist +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-liblist +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-makemaker-config +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-makemaker-config +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-makemaker-locale +=3D "perl-module-base"
> +RDEPENDS_perl-module-extutils-makemaker-locale +=3D "perl-module-encode"
> +RDEPENDS_perl-module-extutils-makemaker-locale +=3D "perl-module-encode-=
alias"
> +RDEPENDS_perl-module-extutils-makemaker-locale +=3D "perl-module-encode-=
hanextra"
> +RDEPENDS_perl-module-extutils-makemaker-locale +=3D "perl-module-i18n-la=
nginfo"
> +RDEPENDS_perl-module-extutils-makemaker-locale +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-b"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-cpan"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-extutils-makem=
aker-config"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-extutils-makem=
aker-version"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-extutils-manif=
est"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-extutils-mm"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-extutils-my"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-makemaker +=3D "perl-module-version"
> +RDEPENDS_perl-module-extutils-makemaker-version +=3D "perl-module-extuti=
ls-makemaker-version-regex"
> +RDEPENDS_perl-module-extutils-makemaker-version +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-extutils-makemaker-version +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-file-copy"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-manifest +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-miniperl +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-miniperl +=3D "perl-module-extutils-embed"
> +RDEPENDS_perl-module-extutils-miniperl +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mkbootstrap +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-mkbootstrap +=3D "perl-module-dynaloader"
> +RDEPENDS_perl-module-extutils-mkbootstrap +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-mkbootstrap +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mksymlists +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-mksymlists +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-mksymlists +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-mksymlists +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-aix +=3D "perl-module-extutils-makemake=
r-config"
> +RDEPENDS_perl-module-extutils-mm-aix +=3D "perl-module-extutils-mm-unix"
> +RDEPENDS_perl-module-extutils-mm-aix +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-autosplit"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-cpan"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-extutils-makemake=
r"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-extutils-makemake=
r-config"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-any +=3D "perl-module-version"
> +RDEPENDS_perl-module-extutils-mm-beos +=3D "perl-module-extutils-makemak=
er-config"
> +RDEPENDS_perl-module-extutils-mm-beos +=3D "perl-module-extutils-mm-any"
> +RDEPENDS_perl-module-extutils-mm-beos +=3D "perl-module-extutils-mm-unix=
"
> +RDEPENDS_perl-module-extutils-mm-beos +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-mm-beos +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-cygwin +=3D "perl-module-c<extutils-mm-=
unix>"
> +RDEPENDS_perl-module-extutils-mm-cygwin +=3D "perl-module-extutils-makem=
aker-config"
> +RDEPENDS_perl-module-extutils-mm-cygwin +=3D "perl-module-extutils-mm-un=
ix"
> +RDEPENDS_perl-module-extutils-mm-cygwin +=3D "perl-module-extutils-mm-wi=
n32"
> +RDEPENDS_perl-module-extutils-mm-cygwin +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-mm-cygwin +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-darwin +=3D "perl-module-extutils-mm-un=
ix"
> +RDEPENDS_perl-module-extutils-mm-darwin +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-dos +=3D "perl-module-extutils-mm-any"
> +RDEPENDS_perl-module-extutils-mm-dos +=3D "perl-module-extutils-mm-unix"
> +RDEPENDS_perl-module-extutils-mm-dos +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-macos +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-nw5 +=3D "perl-module-extutils-makemake=
r"
> +RDEPENDS_perl-module-extutils-mm-nw5 +=3D "perl-module-extutils-makemake=
r-config"
> +RDEPENDS_perl-module-extutils-mm-nw5 +=3D "perl-module-extutils-mm-win32=
"
> +RDEPENDS_perl-module-extutils-mm-nw5 +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-mm-nw5 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-os2 +=3D "perl-module-extutils-makemake=
r"
> +RDEPENDS_perl-module-extutils-mm-os2 +=3D "perl-module-extutils-mm-any"
> +RDEPENDS_perl-module-extutils-mm-os2 +=3D "perl-module-extutils-mm-unix"
> +RDEPENDS_perl-module-extutils-mm-os2 +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-mm-os2 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm +=3D "perl-module-extutils-liblist"
> +RDEPENDS_perl-module-extutils-mm +=3D "perl-module-extutils-makemaker"
> +RDEPENDS_perl-module-extutils-mm +=3D "perl-module-extutils-makemaker-co=
nfig"
> +RDEPENDS_perl-module-extutils-mm +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-qnx +=3D "perl-module-extutils-mm-unix"
> +RDEPENDS_perl-module-extutils-mm-qnx +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-encode"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-extutils-liblist=
"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-extutils-makemak=
er"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-extutils-makemak=
er-config"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-extutils-mm-any"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-mm-unix +=3D "perl-module-version"
> +RDEPENDS_perl-module-extutils-mm-uwin +=3D "perl-module-extutils-mm-unix=
"
> +RDEPENDS_perl-module-extutils-mm-uwin +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-extutils-liblist-=
kid"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-extutils-makemake=
r"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-extutils-makemake=
r-config"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-extutils-mm-any"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-extutils-mm-unix"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-extutils-mm-vms +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-vos +=3D "perl-module-extutils-mm-unix"
> +RDEPENDS_perl-module-extutils-mm-vos +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-extutils-makema=
ker"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-extutils-makema=
ker-config"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-extutils-mm-any=
"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-extutils-mm-uni=
x"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-mm-win32 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-mm-win95 +=3D "perl-module-extutils-makema=
ker-config"
> +RDEPENDS_perl-module-extutils-mm-win95 +=3D "perl-module-extutils-mm-win=
32"
> +RDEPENDS_perl-module-extutils-mm-win95 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-my +=3D "perl-module-extutils-mm"
> +RDEPENDS_perl-module-extutils-my +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-packlist +=3D "perl-module-carp"
> +RDEPENDS_perl-module-extutils-packlist +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-packlist +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-packlist +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-packlist +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-packlist +=3D "perl-module-vars"
> +RDEPENDS_perl-module-extutils-parsexs-constants +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-extutils-parsexs-constants +=3D "perl-module-symbol=
"
> +RDEPENDS_perl-module-extutils-parsexs-constants +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-extutils-parsexs-countlines +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-extutils-parsexs-eval +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-parsexs-eval +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-config"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-extutils-parsexs=
-constants"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-extutils-parsexs=
-countlines"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-extutils-parsexs=
-eval"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-extutils-parsexs=
-utilities"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-re"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-parsexs +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-extutils-parsexs-utilities +=3D "perl-module-export=
er"
> +RDEPENDS_perl-module-extutils-parsexs-utilities +=3D "perl-module-extuti=
ls-parsexs-constants"
> +RDEPENDS_perl-module-extutils-parsexs-utilities +=3D "perl-module-extuti=
ls-typemaps"
> +RDEPENDS_perl-module-extutils-parsexs-utilities +=3D "perl-module-file-s=
pec"
> +RDEPENDS_perl-module-extutils-parsexs-utilities +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-extutils-parsexs-utilities +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-extutils-testlib +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-extutils-testlib +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-extutils-testlib +=3D "perl-module-lib"
> +RDEPENDS_perl-module-extutils-testlib +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-testlib +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-typemaps-cmd +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-extutils-typemaps-cmd +=3D "perl-module-extutils-ty=
pemaps"
> +RDEPENDS_perl-module-extutils-typemaps-cmd +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-typemaps-cmd +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-typemaps-inputmap +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-extutils-typemaps-inputmap +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-extutils-typemaps-outputmap +=3D "perl-module-re"
> +RDEPENDS_perl-module-extutils-typemaps-outputmap +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-extutils-typemaps-outputmap +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-extutils-parsex=
s"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-extutils-parsex=
s-constants"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-extutils-typema=
ps-inputmap"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-extutils-typema=
ps-outputmap"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-extutils-typema=
ps-type"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-typemaps +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-extutils-typemaps-type +=3D "perl-module-extutils-t=
ypemaps"
> +RDEPENDS_perl-module-extutils-typemaps-type +=3D "perl-module-strict"
> +RDEPENDS_perl-module-extutils-typemaps-type +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-autodie"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-autodie-exception-system"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-autodie-hints"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-autodie-util"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-carp"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-config"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-constant"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-posix"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-strict"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-tie-refhash"
> +RDEPENDS_perl-module-fatal +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-fcntl +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-fcntl +=3D "perl-module-strict"
> +RDEPENDS_perl-module-fcntl +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-feature +=3D "perl-module-carp"
> +RDEPENDS_perl-module-fields +=3D "perl-module-base"
> +RDEPENDS_perl-module-fields +=3D "perl-module-carp"
> +RDEPENDS_perl-module-fields +=3D "perl-module-hash-util"
> +RDEPENDS_perl-module-fields +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-basename +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-basename +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-basename +=3D "perl-module-re"
> +RDEPENDS_perl-module-file-basename +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-basename +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-filecache +=3D "perl-module-carp"
> +RDEPENDS_perl-module-filecache +=3D "perl-module-parent"
> +RDEPENDS_perl-module-filecache +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-compare +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-compare +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-compare +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-compare +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-config"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-copy +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-dosglob +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-dosglob +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-file-dosglob +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-dosglob +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-constant"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-file-copy"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-file-temp"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-ipc-cmd"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-locale-maketext-simple=
"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-load"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-params-check"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-fetch +=3D "perl-module-vars"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-config"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-find +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-file-globmapper +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-globmapper +=3D "perl-module-file-glob"
> +RDEPENDS_perl-module-file-globmapper +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-globmapper +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-glob +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-glob +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-glob +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-glob +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-filehandle +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-filehandle +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-filehandle +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-filehandle +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-path +=3D "perl-module-vars"
> +RDEPENDS_perl-module-file-spec-amigaos +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-amigaos +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-cygwin +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-cygwin +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-cygwin +=3D "perl-module-win32api-file"
> +RDEPENDS_perl-module-file-spec-epoc +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-epoc +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-functions +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-spec-functions +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-file-spec-functions +=3D "perl-module-file-spec-uni=
x"
> +RDEPENDS_perl-module-file-spec-functions +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-mac +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-spec-mac +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-mac +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-os2 +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-spec-os2 +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-os2 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-unix +=3D "perl-module-constant"
> +RDEPENDS_perl-module-file-spec-unix +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-spec-unix +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-file-spec-unix +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-vms +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-spec-vms +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-file-spec-vms +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-vms +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-win32 +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-spec-win32 +=3D "perl-module-file-spec-unix"
> +RDEPENDS_perl-module-file-spec-win32 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-spec-win32 +=3D "perl-module-win32api-file"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-constant"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-overload "
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-file-stat +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-carp"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-constant"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-errno"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-io-seekable"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-overload"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-parent"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-posix"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-file-temp +=3D "perl-module-vars"
> +RDEPENDS_perl-module-filter-simple +=3D "perl-module-carp"
> +RDEPENDS_perl-module-filter-simple +=3D "perl-module-filter-util-call"
> +RDEPENDS_perl-module-filter-simple +=3D "perl-module-text-balanced"
> +RDEPENDS_perl-module-filter-util-call +=3D "perl-module-carp"
> +RDEPENDS_perl-module-filter-util-call +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-filter-util-call +=3D "perl-module-strict"
> +RDEPENDS_perl-module-filter-util-call +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-filter-util-call +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-findbin +=3D "perl-module-carp"
> +RDEPENDS_perl-module-findbin +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-findbin +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-findbin +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-findbin +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-constant"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-overload"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-pod-usage"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-strict"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-vars"
> +RDEPENDS_perl-module-getopt-long +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-getopt-std +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-hash-util-fieldhash +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-hash-util-fieldhash +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-hash-util-fieldhash +=3D "perl-module-strict"
> +RDEPENDS_perl-module-hash-util-fieldhash +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-hash-util-fieldhash +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-carp"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-hash-util-fieldhash"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-strict"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-hash-util +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-i18n-collate +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-i18n-collate +=3D "perl-module-overload"
> +RDEPENDS_perl-module-i18n-collate +=3D "perl-module-posix"
> +RDEPENDS_perl-module-i18n-collate +=3D "perl-module-strict"
> +RDEPENDS_perl-module-i18n-collate +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-i18n-langinfo +=3D "perl-module-carp"
> +RDEPENDS_perl-module-i18n-langinfo +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-i18n-langinfo +=3D "perl-module-strict"
> +RDEPENDS_perl-module-i18n-langinfo +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-i18n-langinfo +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-i18n-langtags-detect +=3D "perl-module-i18n-langtag=
s"
> +RDEPENDS_perl-module-i18n-langtags-detect +=3D "perl-module-strict"
> +RDEPENDS_perl-module-i18n-langtags-list +=3D "perl-module-strict"
> +RDEPENDS_perl-module-i18n-langtags +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-i18n-langtags +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-compress-adapter-bzip2 +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-adapter-bzip2 +=3D "perl-module-compres=
s-raw-bzip2"
> +RDEPENDS_perl-module-io-compress-adapter-bzip2 +=3D "perl-module-io-comp=
ress-base-common"
> +RDEPENDS_perl-module-io-compress-adapter-bzip2 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-compress-adapter-bzip2 +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-io-compress-adapter-deflate +=3D "perl-module-bytes=
"
> +RDEPENDS_perl-module-io-compress-adapter-deflate +=3D "perl-module-compr=
ess-raw-zlib"
> +RDEPENDS_perl-module-io-compress-adapter-deflate +=3D "perl-module-expor=
ter"
> +RDEPENDS_perl-module-io-compress-adapter-deflate +=3D "perl-module-io-co=
mpress-base-common"
> +RDEPENDS_perl-module-io-compress-adapter-deflate +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-io-compress-adapter-deflate +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-io-compress-adapter-identity +=3D "perl-module-byte=
s"
> +RDEPENDS_perl-module-io-compress-adapter-identity +=3D "perl-module-io-c=
ompress-base-common"
> +RDEPENDS_perl-module-io-compress-adapter-identity +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-io-compress-adapter-identity +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-constant"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-encode"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-file-glob=
mapper"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-scalar-ut=
il"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-io-compress-base-common +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-carp) "
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-io-compress-base=
-common"
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-io-handle "
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-symbol)"
> +RDEPENDS_perl-module-io-compress-base +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-io-compress-ada=
pter-bzip2"
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-io-compress-bas=
e"
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-io-compress-bas=
e-common"
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-bzip2 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-io-compress-a=
dapter-deflate"
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-io-compress-b=
ase-common"
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-io-compress-r=
awdeflate"
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-io-compress-z=
lib-constants"
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-deflate +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-gzip-constants +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-gzip-constants +=3D "perl-module-consta=
nt"
> +RDEPENDS_perl-module-io-compress-gzip-constants +=3D "perl-module-export=
er"
> +RDEPENDS_perl-module-io-compress-gzip-constants +=3D "perl-module-strict=
 "
> +RDEPENDS_perl-module-io-compress-gzip-constants +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-io-compress-adap=
ter-deflate"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-io-compress-base=
-common"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-io-compress-gzip=
-constants"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-io-compress-rawd=
eflate"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-io-compress-zlib=
-extra"
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-gzip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-compress-r=
aw-zlib"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-io-compres=
s-adapter-deflate"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-io-compres=
s-base"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-io-compres=
s-base-common"
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-rawdeflate +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-zip-constants +=3D "perl-module-constan=
t"
> +RDEPENDS_perl-module-io-compress-zip-constants +=3D "perl-module-exporte=
r"
> +RDEPENDS_perl-module-io-compress-zip-constants +=3D "perl-module-strict =
"
> +RDEPENDS_perl-module-io-compress-zip-constants +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-compress-raw-zlib=
"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-config"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-file-spec)"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-adapt=
er-deflate"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-adapt=
er-identity"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-base-=
common"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-bzip2=
 "
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-lzma =
"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-rawde=
flate"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-zip-c=
onstants"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-io-compress-zlib-=
extra"
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-zip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-compress-zlib-constants +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-zlib-constants +=3D "perl-module-consta=
nt"
> +RDEPENDS_perl-module-io-compress-zlib-constants +=3D "perl-module-export=
er"
> +RDEPENDS_perl-module-io-compress-zlib-constants +=3D "perl-module-strict=
 "
> +RDEPENDS_perl-module-io-compress-zlib-constants +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-io-compress-zlib-extra +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-compress-zlib-extra +=3D "perl-module-io-compres=
s-gzip-constants"
> +RDEPENDS_perl-module-io-compress-zlib-extra +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-compress-zlib-extra +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-file-stat"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-io-dir +=3D "perl-module-tie-hash"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-io-seekable"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-selectsaver"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-file +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-io"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-selectsaver"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-handle +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-io +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-io-pipe +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-pipe +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-pipe +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-io-pipe +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-pipe +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-io-poll +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-poll +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-io-poll +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-seekable +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-seekable +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-seekable +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-seekable +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-io-seekable +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-select +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-select +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-select +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-io-socket-inet +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-socket-inet +=3D "perl-module-errno"
> +RDEPENDS_perl-module-io-socket-inet +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-socket-inet +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-io-socket-inet +=3D "perl-module-socket"
> +RDEPENDS_perl-module-io-socket-inet +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-base"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-constant"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-errno"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-posix"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-socket"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-socket-ip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-errno"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-io-select"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-io-socket-inet"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-io-socket-unix"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-socket"
> +RDEPENDS_perl-module-io-socket +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-socket-unix +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-socket-unix +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-io-socket-unix +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 +=3D "perl-module-byt=
es"
> +RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 +=3D "perl-module-com=
press-raw-bzip2"
> +RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 +=3D "perl-module-io-=
compress-base-common"
> +RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-io-uncompress-adapter-identity +=3D "perl-module-by=
tes"
> +RDEPENDS_perl-module-io-uncompress-adapter-identity +=3D "perl-module-co=
mpress-raw-zlib"
> +RDEPENDS_perl-module-io-uncompress-adapter-identity +=3D "perl-module-io=
-compress-base-common"
> +RDEPENDS_perl-module-io-uncompress-adapter-identity +=3D "perl-module-io=
-compress-zip-constants "
> +RDEPENDS_perl-module-io-uncompress-adapter-identity +=3D "perl-module-st=
rict"
> +RDEPENDS_perl-module-io-uncompress-adapter-identity +=3D "perl-module-wa=
rnings"
> +RDEPENDS_perl-module-io-uncompress-adapter-inflate +=3D "perl-module-byt=
es"
> +RDEPENDS_perl-module-io-uncompress-adapter-inflate +=3D "perl-module-com=
press-raw-zlib"
> +RDEPENDS_perl-module-io-uncompress-adapter-inflate +=3D "perl-module-io-=
compress-base-common"
> +RDEPENDS_perl-module-io-uncompress-adapter-inflate +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-io-uncompress-adapter-inflate +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-exporter=
 "
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-compr=
ess-base-common"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-uncom=
press-adapter-inflate"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-uncom=
press-base"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-uncom=
press-gunzip"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-uncom=
press-inflate"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-uncom=
press-rawinflate"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-io-uncom=
press-unzip"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-uncompress-anyinflate +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-io-uncompress-anyuncompress +=3D "perl-module-bytes=
"
> +RDEPENDS_perl-module-io-uncompress-anyuncompress +=3D "perl-module-expor=
ter "
> +RDEPENDS_perl-module-io-uncompress-anyuncompress +=3D "perl-module-io-co=
mpress-base-common"
> +RDEPENDS_perl-module-io-uncompress-anyuncompress +=3D "perl-module-io-un=
compress-base"
> +RDEPENDS_perl-module-io-uncompress-anyuncompress +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-io-uncompress-anyuncompress +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-carp "
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-constant"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-io-compress-ba=
se-common"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-io-file "
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-list-util"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-io-uncompress-base +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-io-compress=
-base-common"
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-io-uncompre=
ss-adapter-bunzip2"
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-io-uncompre=
ss-base"
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-uncompress-bunzip2 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-compress-raw=
-zlib"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-io-compress-=
base-common"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-io-compress-=
gzip-constants"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-io-compress-=
zlib-extra"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-io-uncompres=
s-rawinflate"
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-uncompress-gunzip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-io-compress=
-base-common"
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-io-compress=
-zlib-constants"
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-io-uncompre=
ss-rawinflate"
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-uncompress-inflate +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-compress=
-raw-zlib"
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-exporter=
 "
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-io-compr=
ess-base-common"
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-io-uncom=
press-adapter-inflate"
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-io-uncom=
press-base"
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-uncompress-rawinflate +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-compress-raw-=
zlib"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-constant"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-exporter "
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-compress-b=
ase-common"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-compress-z=
ip-constants"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-compress-z=
lib-extra"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-uncompress=
-adapter-identity"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-uncompress=
-adapter-inflate"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-io-uncompress=
-rawinflate"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-posix"
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-strict "
> +RDEPENDS_perl-module-io-uncompress-unzip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-carp"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-strict"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-tie-handle"
> +RDEPENDS_perl-module-io-zlib +=3D "perl-module-vars"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-constant"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-extutils-makemaker"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-io-select"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-ipc-open3"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-locale-maketext-simple"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-load"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-params-check"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-posix"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-socket"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-time-hires"
> +RDEPENDS_perl-module-ipc-cmd +=3D "perl-module-vars"
> +RDEPENDS_perl-module-ipc-msg +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ipc-msg +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-ipc-msg +=3D "perl-module-ipc-sysv"
> +RDEPENDS_perl-module-ipc-msg +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-msg +=3D "perl-module-vars"
> +RDEPENDS_perl-module-ipc-open2 +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-ipc-open2 +=3D "perl-module-ipc-open3"
> +RDEPENDS_perl-module-ipc-open2 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-constant"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-io-pipe"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-posix"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-open3 +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-ipc-semaphore +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ipc-semaphore +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-ipc-semaphore +=3D "perl-module-ipc-sysv"
> +RDEPENDS_perl-module-ipc-semaphore +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-semaphore +=3D "perl-module-vars"
> +RDEPENDS_perl-module-ipc-sharedmem +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ipc-sharedmem +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-ipc-sharedmem +=3D "perl-module-ipc-sysv"
> +RDEPENDS_perl-module-ipc-sharedmem +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-sharedmem +=3D "perl-module-vars"
> +RDEPENDS_perl-module-ipc-sysv +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ipc-sysv +=3D "perl-module-config"
> +RDEPENDS_perl-module-ipc-sysv +=3D "perl-module-dynaloader"
> +RDEPENDS_perl-module-ipc-sysv +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-ipc-sysv +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ipc-sysv +=3D "perl-module-vars"
> +RDEPENDS_perl-module-json-pp-boolean +=3D "perl-module-overload"
> +RDEPENDS_perl-module-json-pp-boolean +=3D "perl-module-strict"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-b"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-bytes"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-carp"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-constant"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-encode"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-json-pp-boolean"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-math-bigfloat"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-overload"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-json-pp +=3D "perl-module-subs"
> +RDEPENDS_perl-module-less +=3D "perl-module-strict"
> +RDEPENDS_perl-module-less +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-lib +=3D "perl-module-carp"
> +RDEPENDS_perl-module-lib +=3D "perl-module-config"
> +RDEPENDS_perl-module-lib +=3D "perl-module-strict"
> +RDEPENDS_perl-module-list-util +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-list-util +=3D "perl-module-strict"
> +RDEPENDS_perl-module-list-util +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-list-util +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-list-util-xs +=3D "perl-module-list-util"
> +RDEPENDS_perl-module-list-util-xs +=3D "perl-module-strict"
> +RDEPENDS_perl-module-list-util-xs +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-loaded +=3D "perl-module-carp"
> +RDEPENDS_perl-module-loaded +=3D "perl-module-strict"
> +RDEPENDS_perl-module-loaded +=3D "perl-module-vars"
> +RDEPENDS_perl-module-load +=3D "perl-module-carp"
> +RDEPENDS_perl-module-load +=3D "perl-module-config"
> +RDEPENDS_perl-module-load +=3D "perl-module-constant"
> +RDEPENDS_perl-module-load +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-load +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-load +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-load +=3D "perl-module-locale-maketext-simple"
> +RDEPENDS_perl-module-load +=3D "perl-module-corelist"
> +RDEPENDS_perl-module-load +=3D "perl-module-load"
> +RDEPENDS_perl-module-load +=3D "perl-module-params-check"
> +RDEPENDS_perl-module-load +=3D "perl-module-strict"
> +RDEPENDS_perl-module-load +=3D "perl-module-vars"
> +RDEPENDS_perl-module-load +=3D "perl-module-version"
> +RDEPENDS_perl-module-load +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-constants +=3D "perl-module-constant"
> +RDEPENDS_perl-module-locale-codes-constants +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-constants +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-constants +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-country-codes +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-locale-codes-country-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-country-codes +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-locale-codes-country +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-country +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-country +=3D "perl-module-locale-codes=
"
> +RDEPENDS_perl-module-locale-codes-country +=3D "perl-module-locale-codes=
-constants"
> +RDEPENDS_perl-module-locale-codes-country +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-country +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-country-retired +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-locale-codes-country-retired +=3D "perl-module-utf8=
"
> +RDEPENDS_perl-module-locale-codes-country-retired +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-locale-codes-currency-codes +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-locale-codes-currency-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-currency-codes +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-locale-codes-currency +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-currency +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-currency +=3D "perl-module-locale-code=
s"
> +RDEPENDS_perl-module-locale-codes-currency +=3D "perl-module-locale-code=
s-constants"
> +RDEPENDS_perl-module-locale-codes-currency +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-currency +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-currency-retired +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-locale-codes-currency-retired +=3D "perl-module-utf=
8"
> +RDEPENDS_perl-module-locale-codes-currency-retired +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-locale-codes-langext-codes +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-locale-codes-langext-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-langext-codes +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-locale-codes-langext +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-langext +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-langext +=3D "perl-module-locale-codes=
"
> +RDEPENDS_perl-module-locale-codes-langext +=3D "perl-module-locale-codes=
-constants"
> +RDEPENDS_perl-module-locale-codes-langext +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-langext +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-langext-retired +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-locale-codes-langext-retired +=3D "perl-module-utf8=
"
> +RDEPENDS_perl-module-locale-codes-langext-retired +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-locale-codes-langfam-codes +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-locale-codes-langfam-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-langfam-codes +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-locale-codes-langfam +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-langfam +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-langfam +=3D "perl-module-locale-codes=
"
> +RDEPENDS_perl-module-locale-codes-langfam +=3D "perl-module-locale-codes=
-constants"
> +RDEPENDS_perl-module-locale-codes-langfam +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-langfam +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-langfam-retired +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-locale-codes-langfam-retired +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-locale-codes-language-codes +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-locale-codes-language-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-language-codes +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-locale-codes-language +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-language +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-language +=3D "perl-module-locale-code=
s"
> +RDEPENDS_perl-module-locale-codes-language +=3D "perl-module-locale-code=
s-constants"
> +RDEPENDS_perl-module-locale-codes-language +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-language +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-language-retired +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-locale-codes-language-retired +=3D "perl-module-utf=
8"
> +RDEPENDS_perl-module-locale-codes-language-retired +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-locale-codes-langvar-codes +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-locale-codes-langvar-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-langvar-codes +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-locale-codes-langvar +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-langvar +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-langvar +=3D "perl-module-locale-codes=
"
> +RDEPENDS_perl-module-locale-codes-langvar +=3D "perl-module-locale-codes=
-constants"
> +RDEPENDS_perl-module-locale-codes-langvar +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-langvar +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-langvar-retired +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-locale-codes-langvar-retired +=3D "perl-module-utf8=
"
> +RDEPENDS_perl-module-locale-codes-langvar-retired +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-locale-codes +=3D "perl-module-carp"
> +RDEPENDS_perl-module-locale-codes +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes +=3D "perl-module-locale-codes-constan=
ts"
> +RDEPENDS_perl-module-locale-codes +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-script-codes +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-script-codes +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-script-codes +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-locale-codes-script +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-codes-script +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-codes-script +=3D "perl-module-locale-codes"
> +RDEPENDS_perl-module-locale-codes-script +=3D "perl-module-locale-codes-=
constants"
> +RDEPENDS_perl-module-locale-codes-script +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-codes-script +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-codes-script-retired +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-locale-codes-script-retired +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-locale-codes-script-retired +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-locale-country +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-country +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-country +=3D "perl-module-locale-codes"
> +RDEPENDS_perl-module-locale-country +=3D "perl-module-locale-codes-const=
ants"
> +RDEPENDS_perl-module-locale-country +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-country +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-currency +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-currency +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-currency +=3D "perl-module-locale-codes"
> +RDEPENDS_perl-module-locale-currency +=3D "perl-module-locale-codes-cons=
tants"
> +RDEPENDS_perl-module-locale-currency +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-currency +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-language +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-language +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-language +=3D "perl-module-locale-codes"
> +RDEPENDS_perl-module-locale-language +=3D "perl-module-locale-codes-cons=
tants"
> +RDEPENDS_perl-module-locale-language +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-language +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-locale-maketext-gutsloader +=3D "perl-module-locale=
-maketext"
> +RDEPENDS_perl-module-locale-maketext-guts +=3D "perl-module-locale-maket=
ext"
> +RDEPENDS_perl-module-locale-maketext +=3D "perl-module-carp"
> +RDEPENDS_perl-module-locale-maketext +=3D "perl-module-i18n-langtags"
> +RDEPENDS_perl-module-locale-maketext +=3D "perl-module-i18n-langtags-det=
ect"
> +RDEPENDS_perl-module-locale-maketext +=3D "perl-module-integer"
> +RDEPENDS_perl-module-locale-maketext +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-maketext-simple +=3D "perl-module-base"
> +RDEPENDS_perl-module-locale-maketext-simple +=3D "perl-module-locale-mak=
etext-lexicon"
> +RDEPENDS_perl-module-locale-maketext-simple +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale +=3D "perl-module-carp"
> +RDEPENDS_perl-module-locale +=3D "perl-module-config"
> +RDEPENDS_perl-module-locale-script +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-locale-script +=3D "perl-module-if"
> +RDEPENDS_perl-module-locale-script +=3D "perl-module-locale-codes"
> +RDEPENDS_perl-module-locale-script +=3D "perl-module-locale-codes-consta=
nts"
> +RDEPENDS_perl-module-locale-script +=3D "perl-module-strict"
> +RDEPENDS_perl-module-locale-script +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-carp"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-math-complex"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigfloat +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigfloat-trace +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-math-bigfloat-trace +=3D "perl-module-math-bigfloat=
"
> +RDEPENDS_perl-module-math-bigfloat-trace +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-bigfloat-trace +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigfloat-trace +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigint-calcemu +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigint-calcemu +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigint-calc +=3D "perl-module-carp"
> +RDEPENDS_perl-module-math-bigint-calc +=3D "perl-module-constant"
> +RDEPENDS_perl-module-math-bigint-calc +=3D "perl-module-integer"
> +RDEPENDS_perl-module-math-bigint-calc +=3D "perl-module-math-bigint-lib"
> +RDEPENDS_perl-module-math-bigint-calc +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigint-calc +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigint-fastcalc +=3D "perl-module-math-bigint-=
calc"
> +RDEPENDS_perl-module-math-bigint-fastcalc +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigint-fastcalc +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigint-fastcalc +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-math-bigint-lib +=3D "perl-module-carp"
> +RDEPENDS_perl-module-math-bigint-lib +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-bigint-lib +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-math-bigint-lib +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigint-lib +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-carp"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-math-bigfloat"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-math-complex"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigint +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigint-trace +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-math-bigint-trace +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-math-bigint-trace +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-bigint-trace +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigint-trace +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-bigrat +=3D "perl-module-carp"
> +RDEPENDS_perl-module-math-bigrat +=3D "perl-module-math-bigfloat"
> +RDEPENDS_perl-module-math-bigrat +=3D "perl-module-math-bigint"
> +RDEPENDS_perl-module-math-bigrat +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-bigrat +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-bigrat +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-complex +=3D "perl-module-config"
> +RDEPENDS_perl-module-math-complex +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-math-complex +=3D "perl-module-overload"
> +RDEPENDS_perl-module-math-complex +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-math-complex +=3D "perl-module-strict"
> +RDEPENDS_perl-module-math-complex +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-math-trig +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-math-trig +=3D "perl-module-math-complex"
> +RDEPENDS_perl-module-math-trig +=3D "perl-module-strict"
> +RDEPENDS_perl-module-memoize-anydbm-file +=3D "perl-module-vars"
> +RDEPENDS_perl-module-memoize-expirefile +=3D "perl-module-carp"
> +RDEPENDS_perl-module-memoize-expire +=3D "perl-module-carp"
> +RDEPENDS_perl-module-memoize +=3D "perl-module-carp"
> +RDEPENDS_perl-module-memoize +=3D "perl-module-config"
> +RDEPENDS_perl-module-memoize +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-memoize +=3D "perl-module-strict"
> +RDEPENDS_perl-module-memoize +=3D "perl-module-vars"
> +RDEPENDS_perl-module-memoize-sdbm-file +=3D "perl-module-sdbm-file"
> +RDEPENDS_perl-module-memoize-storable +=3D "perl-module-carp"
> +RDEPENDS_perl-module-memoize-storable +=3D "perl-module-storable"
> +RDEPENDS_perl-module-meta-notation +=3D "perl-module-strict"
> +RDEPENDS_perl-module-meta-notation +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-mime-base64 +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-mime-base64 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-mime-base64 +=3D "perl-module-vars"
> +RDEPENDS_perl-module-mime-base64 +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-mime-quotedprint +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-mime-quotedprint +=3D "perl-module-mime-base64"
> +RDEPENDS_perl-module-mime-quotedprint +=3D "perl-module-strict"
> +RDEPENDS_perl-module-mime-quotedprint +=3D "perl-module-vars"
> +RDEPENDS_perl-module-mro +=3D "perl-module-strict"
> +RDEPENDS_perl-module-mro +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-mro +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-constant"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-errno"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-net-cmd +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-config +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-config +=3D "perl-module-net-localcfg"
> +RDEPENDS_perl-module-net-config +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-config +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-config +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-net-config"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-posix"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-domain +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ftp-a +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-ftp-a +=3D "perl-module-net-ftp-dataconn"
> +RDEPENDS_perl-module-net-ftp-a +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ftp-a +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ftp-dataconn +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-ftp-dataconn +=3D "perl-module-errno"
> +RDEPENDS_perl-module-net-ftp-dataconn +=3D "perl-module-net-cmd"
> +RDEPENDS_perl-module-net-ftp-dataconn +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ftp-dataconn +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ftp-e +=3D "perl-module-net-ftp-i"
> +RDEPENDS_perl-module-net-ftp-e +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ftp-e +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ftp-i +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-ftp-i +=3D "perl-module-net-ftp-dataconn"
> +RDEPENDS_perl-module-net-ftp-i +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ftp-i +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ftp-l +=3D "perl-module-net-ftp-i"
> +RDEPENDS_perl-module-net-ftp-l +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ftp-l +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-constant"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-io-socket-inet6"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-io-socket-ip"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-io-socket-ssl"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-net-cmd"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-net-config"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-net-ftp-a"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-net-netrc"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-time-local"
> +RDEPENDS_perl-module-net-ftp +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-hostent +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-net-hostent +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-hostent +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-hostent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-netent +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-net-netent +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-netent +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-netent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-netrc +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-netrc +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-net-netrc +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-netrc +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-io-socket-inet6"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-io-socket-ip"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-io-socket-ssl"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-net-cmd"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-net-config"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-time-local"
> +RDEPENDS_perl-module-net-nntp +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-constant"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-filehandle"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-io-socket-inet"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-net-ping-external"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-posix"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-ping +=3D "perl-module-time-hires"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-io-socket-inet6"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-io-socket-ip"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-io-socket-ssl"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-mime-base64"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-net-cmd"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-net-config"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-net-netrc"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-pop3 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-protoent +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-net-protoent +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-protoent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-servent +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-net-servent +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-servent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-io-socket-inet6"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-io-socket-ip"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-io-socket-ssl"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-mime-base64"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-net-cmd"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-net-config"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-socket"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-smtp +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-carp"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-io-select"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-io-socket"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-net-config"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-strict"
> +RDEPENDS_perl-module-net-time +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-next +=3D "perl-module-carp"
> +RDEPENDS_perl-module-next +=3D "perl-module-overload"
> +RDEPENDS_perl-module-next +=3D "perl-module-strict"
> +RDEPENDS_perl-module-next +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-ok +=3D "perl-module-strict"
> +RDEPENDS_perl-module-ok +=3D "perl-module-test-more"
> +RDEPENDS_perl-module-opcode +=3D "perl-module-carp"
> +RDEPENDS_perl-module-opcode +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-opcode +=3D "perl-module-strict"
> +RDEPENDS_perl-module-opcode +=3D "perl-module-subs"
> +RDEPENDS_perl-module-opcode +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-open +=3D "perl-module-carp"
> +RDEPENDS_perl-module-open +=3D "perl-module-encode"
> +RDEPENDS_perl-module-open +=3D "perl-module-encoding"
> +RDEPENDS_perl-module-open +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-o +=3D "perl-module-b"
> +RDEPENDS_perl-module-o +=3D "perl-module-carp"
> +RDEPENDS_perl-module-ops +=3D "perl-module-opcode"
> +RDEPENDS_perl-module-overloading +=3D "perl-module-overload-numbers"
> +RDEPENDS_perl-module-overloading +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-overload +=3D "perl-module-mro"
> +RDEPENDS_perl-module-overload +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-overload +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-params-check +=3D "perl-module-carp"
> +RDEPENDS_perl-module-params-check +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-params-check +=3D "perl-module-locale-maketext-simp=
le"
> +RDEPENDS_perl-module-params-check +=3D "perl-module-strict"
> +RDEPENDS_perl-module-params-check +=3D "perl-module-vars"
> +RDEPENDS_perl-module-parent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-parent +=3D "perl-module-vars"
> +RDEPENDS_perl-module-perlfaq +=3D "perl-module-strict"
> +RDEPENDS_perl-module-perlfaq +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-perlio-encoding +=3D "perl-module-strict"
> +RDEPENDS_perl-module-perlio-encoding +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-perlio-mmap +=3D "perl-module-strict"
> +RDEPENDS_perl-module-perlio-mmap +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-perlio-mmap +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-perlio-scalar +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-perlio-via +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-perlio-via-quotedprint +=3D "perl-module-mime-quote=
dprint"
> +RDEPENDS_perl-module-perlio-via-quotedprint +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-checker +=3D "perl-module-base"
> +RDEPENDS_perl-module-pod-checker +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-checker +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-checker +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-checker +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-escapes +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-escapes +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-escapes +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-escapes +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-config"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-file-find"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-pod-find +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-functions +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-functions +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-inputobjects +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-inputobjects +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-subs"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-man +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-parselink +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-parselink +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-parselink +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-parselink +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-parser +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-parser +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-parser +=3D "perl-module-pod-inputobjects"
> +RDEPENDS_perl-module-pod-parser +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-parser +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-pod-parser +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-parseutils +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-parseutils +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-parseutils +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-baseto +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-perldoc-baseto +=3D "perl-module-config"
> +RDEPENDS_perl-module-pod-perldoc-baseto +=3D "perl-module-file-spec-func=
tions"
> +RDEPENDS_perl-module-pod-perldoc-baseto +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-baseto +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-baseto +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-getoptsoo +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-getoptsoo +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-config"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-encode"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-file-spec-functions"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-file-temp"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-pod-perldoc-getoptsoo=
"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-toansi +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-toansi +=3D "perl-module-pod-text-color=
"
> +RDEPENDS_perl-module-pod-perldoc-toansi +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-toansi +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-toansi +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-tochecker +=3D "perl-module-pod-checker=
"
> +RDEPENDS_perl-module-pod-perldoc-tochecker +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-tochecker +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-tochecker +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-encode"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-file-spec-funct=
ions"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-io-select"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-ipc-open3"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-pod-man"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-pod-perldoc-top=
od"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-toman +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-tonroff +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-tonroff +=3D "perl-module-pod-man"
> +RDEPENDS_perl-module-pod-perldoc-tonroff +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-tonroff +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-tonroff +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-topod +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-topod +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-topod +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-topod +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-tortf +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-tortf +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-tortf +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-tortf +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-toterm +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-toterm +=3D "perl-module-pod-text-termc=
ap"
> +RDEPENDS_perl-module-pod-perldoc-toterm +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-toterm +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-toterm +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-totext +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-totext +=3D "perl-module-pod-text"
> +RDEPENDS_perl-module-pod-perldoc-totext +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-totext +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-totext +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-perldoc-toxml +=3D "perl-module-parent"
> +RDEPENDS_perl-module-pod-perldoc-toxml +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-perldoc-toxml +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-perldoc-toxml +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-plaintext +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-plaintext +=3D "perl-module-pod-select"
> +RDEPENDS_perl-module-pod-plaintext +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-plaintext +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-pod-plaintext +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-select +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-select +=3D "perl-module-pod-parser"
> +RDEPENDS_perl-module-pod-select +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-select +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-blackbox +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-blackbox +=3D "perl-module-integer"
> +RDEPENDS_perl-module-pod-simple-blackbox +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-blackbox +=3D "perl-module-pod-simple-tr=
anscode"
> +RDEPENDS_perl-module-pod-simple-blackbox +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-blackbox +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-checker +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-checker +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-checker +=3D "perl-module-pod-simple-met=
hody"
> +RDEPENDS_perl-module-pod-simple-checker +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-checker +=3D "perl-module-text-wrap"
> +RDEPENDS_perl-module-pod-simple-checker +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-debug +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-debug +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-debug +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-debug +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-dumpastext +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-dumpastext +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-dumpastext +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-dumpasxml +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-dumpasxml +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-dumpasxml +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-dumpasxml +=3D "perl-module-text-wrap"
> +RDEPENDS_perl-module-pod-simple-linksection +=3D "perl-module-overload"
> +RDEPENDS_perl-module-pod-simple-linksection +=3D "perl-module-pod-simple=
-blackbox"
> +RDEPENDS_perl-module-pod-simple-linksection +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-linksection +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-methody +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-methody +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-methody +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-integer"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-pod-escapes"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-pod-simple-blackbox"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-pod-simple-linksection=
"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-pod-simple-tiedoutfh"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-pod-simple +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-progress +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-pullparserendtoken +=3D "perl-module-pod=
-simple-pullparsertoken"
> +RDEPENDS_perl-module-pod-simple-pullparserendtoken +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-pod-simple-pullparserendtoken +=3D "perl-module-var=
s"
> +RDEPENDS_perl-module-pod-simple-pullparser +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-pullparser +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-pullparser +=3D "perl-module-pod-simple-=
pullparserendtoken"
> +RDEPENDS_perl-module-pod-simple-pullparser +=3D "perl-module-pod-simple-=
pullparserstarttoken"
> +RDEPENDS_perl-module-pod-simple-pullparser +=3D "perl-module-pod-simple-=
pullparsertexttoken"
> +RDEPENDS_perl-module-pod-simple-pullparser +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-pullparserstarttoken +=3D "perl-module-c=
arp"
> +RDEPENDS_perl-module-pod-simple-pullparserstarttoken +=3D "perl-module-p=
od-simple-pullparsertoken"
> +RDEPENDS_perl-module-pod-simple-pullparserstarttoken +=3D "perl-module-s=
trict"
> +RDEPENDS_perl-module-pod-simple-pullparserstarttoken +=3D "perl-module-v=
ars"
> +RDEPENDS_perl-module-pod-simple-pullparsertexttoken +=3D "perl-module-po=
d-simple-pullparsertoken"
> +RDEPENDS_perl-module-pod-simple-pullparsertexttoken +=3D "perl-module-st=
rict"
> +RDEPENDS_perl-module-pod-simple-pullparsertexttoken +=3D "perl-module-va=
rs"
> +RDEPENDS_perl-module-pod-simple-pullparsertoken +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-pod-simple-rtf +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-rtf +=3D "perl-module-integer"
> +RDEPENDS_perl-module-pod-simple-rtf +=3D "perl-module-pod-simple-pullpar=
ser"
> +RDEPENDS_perl-module-pod-simple-rtf +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-rtf +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-config"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-cwd"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-search +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-simpletree +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-simpletree +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-simpletree +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-simpletree +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-textcontent +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-textcontent +=3D "perl-module-pod-simple=
"
> +RDEPENDS_perl-module-pod-simple-textcontent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-textcontent +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-text +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-text +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-simple-text +=3D "perl-module-pod-simple-method=
y"
> +RDEPENDS_perl-module-pod-simple-text +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-text +=3D "perl-module-text-wrap"
> +RDEPENDS_perl-module-pod-simple-text +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-tiedoutfh +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-tiedoutfh +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-tiedoutfh +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-pod-simple-tiedoutfh +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-transcodedumb +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-transcodedumb +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-transcode +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-transcode +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-transcodesmart +=3D "perl-module-encode"
> +RDEPENDS_perl-module-pod-simple-transcodesmart +=3D "perl-module-pod-sim=
ple"
> +RDEPENDS_perl-module-pod-simple-transcodesmart +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-transcodesmart +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-simple-xmloutstream +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-simple-xmloutstream +=3D "perl-module-pod-simpl=
e"
> +RDEPENDS_perl-module-pod-simple-xmloutstream +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-simple-xmloutstream +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-text-color +=3D "perl-module-pod-text"
> +RDEPENDS_perl-module-pod-text-color +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-text-color +=3D "perl-module-term-ansicolor"
> +RDEPENDS_perl-module-pod-text-color +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-text-color +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-text-overstrike +=3D "perl-module-pod-text"
> +RDEPENDS_perl-module-pod-text-overstrike +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-text-overstrike +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-text-overstrike +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-encode"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-pod-simple"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-text +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-text-termcap +=3D "perl-module-pod-text"
> +RDEPENDS_perl-module-pod-text-termcap +=3D "perl-module-posix"
> +RDEPENDS_perl-module-pod-text-termcap +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-text-termcap +=3D "perl-module-term-cap"
> +RDEPENDS_perl-module-pod-text-termcap +=3D "perl-module-vars"
> +RDEPENDS_perl-module-pod-text-termcap +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-pod-usage +=3D "perl-module-carp"
> +RDEPENDS_perl-module-pod-usage +=3D "perl-module-config"
> +RDEPENDS_perl-module-pod-usage +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-pod-usage +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-pod-usage +=3D "perl-module-strict"
> +RDEPENDS_perl-module-pod-usage +=3D "perl-module-vars"
> +RDEPENDS_perl-module-posix +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-posix +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-posix +=3D "perl-module-strict"
> +RDEPENDS_perl-module-posix +=3D "perl-module-tie-hash"
> +RDEPENDS_perl-module-posix +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-posix +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-re +=3D "perl-module-carp"
> +RDEPENDS_perl-module-re +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-re +=3D "perl-module-strict"
> +RDEPENDS_perl-module-re +=3D "perl-module-term-cap"
> +RDEPENDS_perl-module-re +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-re +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-safe +=3D "perl-module-b"
> +RDEPENDS_perl-module-safe +=3D "perl-module-carp"
> +RDEPENDS_perl-module-safe +=3D "perl-module-carp-heavy"
> +RDEPENDS_perl-module-safe +=3D "perl-module-opcode"
> +RDEPENDS_perl-module-safe +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-safe +=3D "perl-module-strict"
> +RDEPENDS_perl-module-safe +=3D "perl-module-utf8"
> +RDEPENDS_perl-module-scalar-util +=3D "perl-module-carp"
> +RDEPENDS_perl-module-scalar-util +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-scalar-util +=3D "perl-module-list-util"
> +RDEPENDS_perl-module-scalar-util +=3D "perl-module-strict"
> +RDEPENDS_perl-module-scalar-util +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-sdbm-file +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-sdbm-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-sdbm-file +=3D "perl-module-tie-hash"
> +RDEPENDS_perl-module-sdbm-file +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-sdbm-file +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-search-dict +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-search-dict +=3D "perl-module-feature"
> +RDEPENDS_perl-module-search-dict +=3D "perl-module-strict"
> +RDEPENDS_perl-module-selectsaver +=3D "perl-module-carp"
> +RDEPENDS_perl-module-selectsaver +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-selfloader +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-selfloader +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-selfloader +=3D "perl-module-strict"
> +RDEPENDS_perl-module-sigtrap +=3D "perl-module-carp"
> +RDEPENDS_perl-module-sigtrap +=3D "perl-module-meta-notation.pm"
> +RDEPENDS_perl-module-sigtrap +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-socket +=3D "perl-module-carp"
> +RDEPENDS_perl-module-socket +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-socket +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-socket +=3D "perl-module-strict"
> +RDEPENDS_perl-module-socket +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-socket +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-sort +=3D "perl-module-carp"
> +RDEPENDS_perl-module-sort +=3D "perl-module-strict"
> +RDEPENDS_perl-module-storable +=3D "perl-module-carp"
> +RDEPENDS_perl-module-storable +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-storable +=3D "perl-module-io-file"
> +RDEPENDS_perl-module-storable +=3D "perl-module-log-agent"
> +RDEPENDS_perl-module-storable +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-sub-util +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-sub-util +=3D "perl-module-list-util"
> +RDEPENDS_perl-module-sub-util +=3D "perl-module-strict"
> +RDEPENDS_perl-module-sub-util +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-symbol +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-sys-hostname +=3D "perl-module-carp"
> +RDEPENDS_perl-module-sys-hostname +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-sys-hostname +=3D "perl-module-posix"
> +RDEPENDS_perl-module-sys-hostname +=3D "perl-module-strict"
> +RDEPENDS_perl-module-sys-hostname +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-sys-hostname +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-carp"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-config"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-constant"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-dynaloader"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-posix"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-socket"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-strict"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-sys-hostname"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-vars"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-sys-syslog +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-tap-base +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-base +=3D "perl-module-constant"
> +RDEPENDS_perl-module-tap-base +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-base +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-formatter-base +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-formatter-base +=3D "perl-module-posix"
> +RDEPENDS_perl-module-tap-formatter-base +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-formatter-base +=3D "perl-module-tap-formatter-=
color"
> +RDEPENDS_perl-module-tap-formatter-base +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-formatter-color +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-formatter-color +=3D "perl-module-constant"
> +RDEPENDS_perl-module-tap-formatter-color +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-formatter-color +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-base"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-carp"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-constant"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-file-path"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-file-spec"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-strict"
> +RDEPENDS_perl-module-tap-formatter-console-parallelsession +=3D "perl-mo=
dule-warnings"
> +RDEPENDS_perl-module-tap-formatter-console +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-formatter-console +=3D "perl-module-posix"
> +RDEPENDS_perl-module-tap-formatter-console +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-formatter-console +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-formatter-console-session +=3D "perl-module-bas=
e"
> +RDEPENDS_perl-module-tap-formatter-console-session +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-tap-formatter-console-session +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-tap-formatter-file +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-formatter-file +=3D "perl-module-posix"
> +RDEPENDS_perl-module-tap-formatter-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-formatter-file +=3D "perl-module-tap-formatter-=
file-session"
> +RDEPENDS_perl-module-tap-formatter-file +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-formatter-file-session +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-formatter-file-session +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-tap-formatter-file-session +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-tap-formatter-session +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-formatter-session +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-formatter-session +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-harness-env +=3D "perl-module-constant"
> +RDEPENDS_perl-module-tap-harness-env +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-harness-env +=3D "perl-module-tap-object"
> +RDEPENDS_perl-module-tap-harness-env +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-tap-harness-env +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-file-path"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-io-handle"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-harness +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-object +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-object +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-object +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-aggregator +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-aggregator +=3D "perl-module-benchmark"
> +RDEPENDS_perl-module-tap-parser-aggregator +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-aggregator +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-aggregator +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-grammar +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-grammar +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-grammar +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-grammar +=3D "perl-module-tap-parser-res=
ultfactory"
> +RDEPENDS_perl-module-tap-parser-grammar +=3D "perl-module-tap-parser-yam=
lish-reader"
> +RDEPENDS_perl-module-tap-parser-grammar +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-iterator-array +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-iterator-array +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-iterator-array +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-tap-parser-iteratorfactory +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-iteratorfactory +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-iteratorfactory +=3D "perl-module-consta=
nt"
> +RDEPENDS_perl-module-tap-parser-iteratorfactory +=3D "perl-module-file-b=
asename"
> +RDEPENDS_perl-module-tap-parser-iteratorfactory +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-tap-parser-iteratorfactory +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-tap-parser-iterator +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-iterator +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-iterator +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-iterator +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-iterator-process +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-iterator-process +=3D "perl-module-confi=
g"
> +RDEPENDS_perl-module-tap-parser-iterator-process +=3D "perl-module-io-ha=
ndle"
> +RDEPENDS_perl-module-tap-parser-iterator-process +=3D "perl-module-stric=
t"
> +RDEPENDS_perl-module-tap-parser-iterator-process +=3D "perl-module-warni=
ngs"
> +RDEPENDS_perl-module-tap-parser-iterator-stream +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-iterator-stream +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-tap-parser-iterator-stream +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-tap-parser-multiplexer +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-multiplexer +=3D "perl-module-constant"
> +RDEPENDS_perl-module-tap-parser-multiplexer +=3D "perl-module-io-select"
> +RDEPENDS_perl-module-tap-parser-multiplexer +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-multiplexer +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-grammar"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-iterator"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-iteratorfac=
tory"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-result"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-resultfacto=
ry"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-source"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-sourcehandl=
er-executable"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-sourcehandl=
er-file"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-sourcehandl=
er-handle"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-sourcehandl=
er-perl"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-tap-parser-sourcehandl=
er-rawtap"
> +RDEPENDS_perl-module-tap-parser +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-result-bailout +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-bailout +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-bailout +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-tap-parser-result-comment +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-comment +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-comment +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-bailout"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-comment"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-plan"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-pragma"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-test"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-unknown"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-version"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-tap-pars=
er-result-yaml"
> +RDEPENDS_perl-module-tap-parser-resultfactory +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-tap-parser-result +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-result-plan +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-plan +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-plan +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-result-pragma +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-pragma +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-pragma +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-tap-parser-result-test +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-test +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-test +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-result-unknown +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-unknown +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-unknown +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-tap-parser-result-version +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-version +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-version +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-tap-parser-result-yaml +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-result-yaml +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-result-yaml +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-scheduler-job +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-scheduler-job +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-scheduler-job +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-tap-parser-scheduler +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tap-parser-scheduler +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-scheduler +=3D "perl-module-tap-parser-s=
cheduler-job"
> +RDEPENDS_perl-module-tap-parser-scheduler +=3D "perl-module-tap-parser-s=
cheduler-spinner"
> +RDEPENDS_perl-module-tap-parser-scheduler +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-scheduler-spinner +=3D "perl-module-carp=
"
> +RDEPENDS_perl-module-tap-parser-scheduler-spinner +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-tap-parser-scheduler-spinner +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-executable +=3D "perl-modu=
le-base"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-executable +=3D "perl-modu=
le-constant"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-executable +=3D "perl-modu=
le-strict"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-executable +=3D "perl-modu=
le-tap-parser-iteratorfactory"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-executable +=3D "perl-modu=
le-tap-parser-iterator-process"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-executable +=3D "perl-modu=
le-warnings"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-file +=3D "perl-module-bas=
e"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-file +=3D "perl-module-con=
stant"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-file +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-file +=3D "perl-module-tap=
-parser-iteratorfactory"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-file +=3D "perl-module-tap=
-parser-iterator-stream"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-file +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-handle +=3D "perl-module-b=
ase"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-handle +=3D "perl-module-c=
onstant"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-handle +=3D "perl-module-s=
trict"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-handle +=3D "perl-module-t=
ap-parser-iteratorfactory"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-handle +=3D "perl-module-t=
ap-parser-iterator-stream"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-handle +=3D "perl-module-w=
arnings"
> +RDEPENDS_perl-module-tap-parser-sourcehandler +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-sourcehandler +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-sourcehandler +=3D "perl-module-tap-pars=
er-iterator"
> +RDEPENDS_perl-module-tap-parser-sourcehandler +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-bas=
e"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-con=
fig"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-con=
stant"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-str=
ict"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-tap=
-parser-iteratorfactory"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-tap=
-parser-iterator-process"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-tex=
t-parsewords"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-perl +=3D "perl-module-war=
nings"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap +=3D "perl-module-b=
ase"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap +=3D "perl-module-s=
trict"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap +=3D "perl-module-t=
ap-parser-iterator-array"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap +=3D "perl-module-t=
ap-parser-iteratorfactory"
> +RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap +=3D "perl-module-w=
arnings"
> +RDEPENDS_perl-module-tap-parser-source +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-source +=3D "perl-module-constant"
> +RDEPENDS_perl-module-tap-parser-source +=3D "perl-module-file-basename"
> +RDEPENDS_perl-module-tap-parser-source +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-source +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-tap-parser-yamlish-reader +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-yamlish-reader +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-yamlish-reader +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-tap-parser-yamlish-writer +=3D "perl-module-base"
> +RDEPENDS_perl-module-tap-parser-yamlish-writer +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tap-parser-yamlish-writer +=3D "perl-module-warning=
s"
> +RDEPENDS_perl-module-term-ansicolor +=3D "perl-module-carp"
> +RDEPENDS_perl-module-term-ansicolor +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-term-ansicolor +=3D "perl-module-strict"
> +RDEPENDS_perl-module-term-ansicolor +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-term-cap +=3D "perl-module-carp"
> +RDEPENDS_perl-module-term-cap +=3D "perl-module-strict"
> +RDEPENDS_perl-module-term-cap +=3D "perl-module-vars"
> +RDEPENDS_perl-module-term-complete +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-term-complete +=3D "perl-module-strict"
> +RDEPENDS_perl-module-term-readline +=3D "perl-module-strict"
> +RDEPENDS_perl-module-term-readline +=3D "perl-module-term-cap"
> +RDEPENDS_perl-module-test2-api-breakage +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-api-breakage +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-api-breakage +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-test2-api)"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-test2-eventface=
t-trace)"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-test2-util-exte=
rnalmeta"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-test2-util-hash=
base"
> +RDEPENDS_perl-module-test2-api-context +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-ipc-sysv"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-test2-api-stac=
k)"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-test2-eventfac=
et-trace)"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-test2-util-has=
hbase"
> +RDEPENDS_perl-module-test2-api-instance +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-api-context"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-bail)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-diag)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-exception)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-eventfacet-trace)=
"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-note)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-ok)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-plan)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-skip)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-subtest)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-event-waiting)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-hub-interceptor)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-hub-interceptor-t=
erminator)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-hub-subtest)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-test2-util-trace)"
> +RDEPENDS_perl-module-test2-api +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-api-stack +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-api-stack +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-api-stack +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-api-stack +=3D "perl-module-test2-hub)"
> +RDEPENDS_perl-module-test2-api-stack +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-bail +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-bail +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-bail +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-diag +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-diag +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-diag +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-encoding +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-event-encoding +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-encoding +=3D "perl-module-test2-util-h=
ashbase"
> +RDEPENDS_perl-module-test2-event-encoding +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-exception +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-exception +=3D "perl-module-test2-util-=
hashbase"
> +RDEPENDS_perl-module-test2-event-exception +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-about +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-about +=3D "perl-module-test2-util=
-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-about +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-amnesty +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-amnesty +=3D "perl-module-test2-ut=
il-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-amnesty +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-test2-eventfacet-assert +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-assert +=3D "perl-module-test2-uti=
l-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-assert +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-control +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-control +=3D "perl-module-test2-ut=
il-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-control +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-test2-eventfacet-error +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-error +=3D "perl-module-test2-util=
-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-error +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-hub +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-hub +=3D "perl-module-test2-util-h=
ashbase"
> +RDEPENDS_perl-module-test2-eventfacet-hub +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-info +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-info +=3D "perl-module-test2-util-=
hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-info +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-meta +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-meta +=3D "perl-module-vars"
> +RDEPENDS_perl-module-test2-eventfacet-meta +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-parent +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-eventfacet-parent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-parent +=3D "perl-module-test2-uti=
l-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-parent +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-eventfacet +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-eventfacet +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-plan +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-plan +=3D "perl-module-test2-util-=
hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-plan +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-render +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-render +=3D "perl-module-test2-uti=
l-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-render +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-eventfacet-trace +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-eventfacet-trace +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-eventfacet-trace +=3D "perl-module-test2-util=
"
> +RDEPENDS_perl-module-test2-eventfacet-trace +=3D "perl-module-test2-util=
-hashbase"
> +RDEPENDS_perl-module-test2-eventfacet-trace +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-fail +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-fail +=3D "perl-module-test2-event"
> +RDEPENDS_perl-module-test2-event-fail +=3D "perl-module-test2-eventfacet=
-info"
> +RDEPENDS_perl-module-test2-event-fail +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-fail +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-generic +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-event-generic +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-event-generic +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-generic +=3D "perl-module-test2-util-ha=
shbase"
> +RDEPENDS_perl-module-test2-event-generic +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-note +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-note +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-note +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-ok +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-ok +=3D "perl-module-test2-util-hashbas=
e"
> +RDEPENDS_perl-module-test2-event-ok +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-pass +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-pass +=3D "perl-module-test2-event"
> +RDEPENDS_perl-module-test2-event-pass +=3D "perl-module-test2-eventfacet=
-info"
> +RDEPENDS_perl-module-test2-event-pass +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-pass +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-abou=
t)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-amne=
sty)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-asse=
rt)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-cont=
rol)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-erro=
r)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-hub)=
"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-info=
)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-meta=
)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-pare=
nt)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-plan=
)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-eventfacet-trac=
e)"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-util-externalme=
ta"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-util-hashbase"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-test2-util-trace"
> +RDEPENDS_perl-module-test2-event +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-plan +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-event-plan +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-plan +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-plan +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-skip +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-skip +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-event-skip +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-subtest +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-subtest +=3D "perl-module-test2-util-ha=
shbase"
> +RDEPENDS_perl-module-test2-event-subtest +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-tap-version +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-event-tap-version +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-tap-version +=3D "perl-module-test2-uti=
l-hashbase"
> +RDEPENDS_perl-module-test2-event-tap-version +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-v2 +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-event-v2 +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-event-v2 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-v2 +=3D "perl-module-test2-util-facets2=
legacy"
> +RDEPENDS_perl-module-test2-event-v2 +=3D "perl-module-test2-util-hashbas=
e"
> +RDEPENDS_perl-module-test2-event-v2 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-event-waiting +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-event-waiting +=3D "perl-module-test2-util-ha=
shbase"
> +RDEPENDS_perl-module-test2-event-waiting +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-formatter +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-formatter +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-formatter +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-formatter-tap +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-test2-formatter-tap +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-formatter-tap +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-formatter-tap +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-formatter-tap +=3D "perl-module-test2-util-ha=
shbase"
> +RDEPENDS_perl-module-test2-formatter-tap +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-hub-interceptor +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-hub-interceptor +=3D "perl-module-test2-hub-i=
nterceptor-terminator)"
> +RDEPENDS_perl-module-test2-hub-interceptor +=3D "perl-module-test2-util-=
hashbase"
> +RDEPENDS_perl-module-test2-hub-interceptor +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-hub-interceptor-terminator +=3D "perl-module-=
strict"
> +RDEPENDS_perl-module-test2-hub-interceptor-terminator +=3D "perl-module-=
warnings"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-list-util"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-test2-util-externalmeta=
"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-test2-util-hashbase"
> +RDEPENDS_perl-module-test2-hub +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-hub-subtest +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-hub-subtest +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-hub-subtest +=3D "perl-module-test2-util-hash=
base"
> +RDEPENDS_perl-module-test2-hub-subtest +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-file-spec)=
"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-file-temp)=
"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-posix)"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-scalar-uti=
l"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-storable)"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-test2-even=
t-waiting"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-test2-util=
"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-test2-util=
-hashbase"
> +RDEPENDS_perl-module-test2-ipc-driver-files +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-ipc-driver +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-ipc-driver +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-ipc-driver +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-ipc-driver +=3D "perl-module-test2-util-hashb=
ase"
> +RDEPENDS_perl-module-test2-ipc-driver +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-test2-api-instance"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-test2-ipc-driver-files"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-ipc +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2 +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-test2-hub-interc=
eptor)"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-test2-hub-interc=
eptor-terminator)"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test2-tools-tiny +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-util-externalmeta +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-util-externalmeta +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-util-externalmeta +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-util-facets2legacy +=3D "perl-module-base"
> +RDEPENDS_perl-module-test2-util-facets2legacy +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-util-facets2legacy +=3D "perl-module-scalar-u=
til"
> +RDEPENDS_perl-module-test2-util-facets2legacy +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-util-facets2legacy +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-test2-util-hashbase +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-util-hashbase +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-util-hashbase +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-util +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test2-util +=3D "perl-module-config"
> +RDEPENDS_perl-module-test2-util +=3D "perl-module-posix)"
> +RDEPENDS_perl-module-test2-util +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test2-util +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test2-util-trace +=3D "perl-module-test2-eventfacet=
-trace"
> +RDEPENDS_perl-module-test-builder-formatter +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-builder-formatter +=3D "perl-module-test2-util=
-hashbase"
> +RDEPENDS_perl-module-test-builder-formatter +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test-builder-module +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-test-builder-module +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-builder-module +=3D "perl-module-test-builder"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-data-dumper"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-overload"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test2-api"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test2-event-subtest"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test2-hub-subtest"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test2-ipc"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test2-ipc-driver-fil=
es"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test2-util"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test-builder-formatt=
er"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-test-builder-tododia=
g"
> +RDEPENDS_perl-module-test-builder +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test-builder-tester-color +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-builder-tester-color +=3D "perl-module-test-bu=
ilder-tester"
> +RDEPENDS_perl-module-test-builder-tester +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test-builder-tester +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-test-builder-tester +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-builder-tester +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-test-builder-tester +=3D "perl-module-test-builder"
> +RDEPENDS_perl-module-test-builder-tododiag +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-builder-tododiag +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-base"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-config"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-constant"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-tap-harness"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-tap-parser-aggregato=
r"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-tap-parser-source"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-tap-parser-sourcehan=
dler-perl"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-text-parsewords"
> +RDEPENDS_perl-module-test-harness +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test-more +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-test-more +=3D "perl-module-some-module"
> +RDEPENDS_perl-module-test-more +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-more +=3D "perl-module-test-builder-module"
> +RDEPENDS_perl-module-test-more +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test +=3D "perl-module-algorithm-diff"
> +RDEPENDS_perl-module-test +=3D "perl-module-carp"
> +RDEPENDS_perl-module-test +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-test +=3D "perl-module-file-temp"
> +RDEPENDS_perl-module-test +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-simple +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-simple +=3D "perl-module-test-builder-module"
> +RDEPENDS_perl-module-test-tester-capture +=3D "perl-module-config"
> +RDEPENDS_perl-module-test-tester-capture +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-tester-capture +=3D "perl-module-test-builder"
> +RDEPENDS_perl-module-test-tester-capture +=3D "perl-module-threads-share=
d"
> +RDEPENDS_perl-module-test-tester-capture +=3D "perl-module-vars"
> +RDEPENDS_perl-module-test-tester-capturerunner +=3D "perl-module-exporte=
r"
> +RDEPENDS_perl-module-test-tester-capturerunner +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-tester-capturerunner +=3D "perl-module-test-te=
ster-capture"
> +RDEPENDS_perl-module-test-tester-delegate +=3D "perl-module-scalar-util)=
"
> +RDEPENDS_perl-module-test-tester-delegate +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-tester-delegate +=3D "perl-module-vars"
> +RDEPENDS_perl-module-test-tester-delegate +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-test-tester +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-test-tester +=3D "perl-module-strict"
> +RDEPENDS_perl-module-test-tester +=3D "perl-module-test-builder"
> +RDEPENDS_perl-module-test-tester +=3D "perl-module-test-tester-captureru=
nner"
> +RDEPENDS_perl-module-test-tester +=3D "perl-module-test-tester-delegate"
> +RDEPENDS_perl-module-test-tester +=3D "perl-module-vars"
> +RDEPENDS_perl-module-text-abbrev +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-text-balanced +=3D "perl-module-carp"
> +RDEPENDS_perl-module-text-balanced +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-text-balanced +=3D "perl-module-overload"
> +RDEPENDS_perl-module-text-balanced +=3D "perl-module-selfloader"
> +RDEPENDS_perl-module-text-balanced +=3D "perl-module-strict"
> +RDEPENDS_perl-module-text-balanced +=3D "perl-module-vars"
> +RDEPENDS_perl-module-text-parsewords +=3D "perl-module-carp"
> +RDEPENDS_perl-module-text-parsewords +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-text-parsewords +=3D "perl-module-strict"
> +RDEPENDS_perl-module-text-tabs +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-text-tabs +=3D "perl-module-strict"
> +RDEPENDS_perl-module-text-tabs +=3D "perl-module-vars"
> +RDEPENDS_perl-module-text-wrap +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-text-wrap +=3D "perl-module-re"
> +RDEPENDS_perl-module-text-wrap +=3D "perl-module-strict"
> +RDEPENDS_perl-module-text-wrap +=3D "perl-module-text-tabs"
> +RDEPENDS_perl-module-text-wrap +=3D "perl-module-vars"
> +RDEPENDS_perl-module-text-wrap +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-thread +=3D "perl-module-config"
> +RDEPENDS_perl-module-thread +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-thread +=3D "perl-module-strict"
> +RDEPENDS_perl-module-thread +=3D "perl-module-threads"
> +RDEPENDS_perl-module-thread +=3D "perl-module-threads-shared"
> +RDEPENDS_perl-module-thread +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-thread-queue +=3D "perl-module-carp"
> +RDEPENDS_perl-module-thread-queue +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-thread-queue +=3D "perl-module-strict"
> +RDEPENDS_perl-module-thread-queue +=3D "perl-module-threads-shared"
> +RDEPENDS_perl-module-thread-queue +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-thread-semaphore +=3D "perl-module-carp"
> +RDEPENDS_perl-module-thread-semaphore +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-thread-semaphore +=3D "perl-module-strict"
> +RDEPENDS_perl-module-thread-semaphore +=3D "perl-module-threads-shared"
> +RDEPENDS_perl-module-thread-semaphore +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-threads +=3D "perl-module-carp"
> +RDEPENDS_perl-module-threads +=3D "perl-module-config"
> +RDEPENDS_perl-module-threads +=3D "perl-module-overload"
> +RDEPENDS_perl-module-threads +=3D "perl-module-strict"
> +RDEPENDS_perl-module-threads +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-threads +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-threads-shared +=3D "perl-module-carp"
> +RDEPENDS_perl-module-threads-shared +=3D "perl-module-scalar-util"
> +RDEPENDS_perl-module-threads-shared +=3D "perl-module-strict"
> +RDEPENDS_perl-module-threads-shared +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-threads-shared +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-tie-array +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-array +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tie-file +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-file +=3D "perl-module-fcntl"
> +RDEPENDS_perl-module-tie-file +=3D "perl-module-posix"
> +RDEPENDS_perl-module-tie-file +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tie-file +=3D "perl-module-symbol"
> +RDEPENDS_perl-module-tie-handle +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-handle +=3D "perl-module-tie-stdhandle"
> +RDEPENDS_perl-module-tie-handle +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-tie-hash-namedcapture +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tie-hash-namedcapture +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-tie-hash +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-hash +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-tie-memoize +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tie-memoize +=3D "perl-module-tie-hash"
> +RDEPENDS_perl-module-tie-refhash +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-refhash +=3D "perl-module-config"
> +RDEPENDS_perl-module-tie-refhash +=3D "perl-module-overload"
> +RDEPENDS_perl-module-tie-refhash +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tie-refhash +=3D "perl-module-tie-hash"
> +RDEPENDS_perl-module-tie-refhash +=3D "perl-module-vars"
> +RDEPENDS_perl-module-tie-scalar +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-scalar +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-tie-stdhandle +=3D "perl-module-strict"
> +RDEPENDS_perl-module-tie-stdhandle +=3D "perl-module-tie-handle"
> +RDEPENDS_perl-module-tie-substrhash +=3D "perl-module-carp"
> +RDEPENDS_perl-module-tie-substrhash +=3D "perl-module-integer"
> +RDEPENDS_perl-module-time-gmtime +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-time-gmtime +=3D "perl-module-strict"
> +RDEPENDS_perl-module-time-gmtime +=3D "perl-module-time-tm"
> +RDEPENDS_perl-module-time-hires +=3D "perl-module-carp"
> +RDEPENDS_perl-module-time-hires +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-time-hires +=3D "perl-module-strict"
> +RDEPENDS_perl-module-time-hires +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-time-local +=3D "perl-module-carp"
> +RDEPENDS_perl-module-time-local +=3D "perl-module-config"
> +RDEPENDS_perl-module-time-local +=3D "perl-module-constant"
> +RDEPENDS_perl-module-time-local +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-time-local +=3D "perl-module-parent"
> +RDEPENDS_perl-module-time-local +=3D "perl-module-strict"
> +RDEPENDS_perl-module-time-localtime +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-time-localtime +=3D "perl-module-strict"
> +RDEPENDS_perl-module-time-localtime +=3D "perl-module-time-tm"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-carp"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-constant"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-integer"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-overload"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-strict"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-time-local"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-time-seconds"
> +RDEPENDS_perl-module-time-piece +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-time-seconds +=3D "perl-module-constant"
> +RDEPENDS_perl-module-time-seconds +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-time-seconds +=3D "perl-module-overload"
> +RDEPENDS_perl-module-time-seconds +=3D "perl-module-strict"
> +RDEPENDS_perl-module-time-tm +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-time-tm +=3D "perl-module-strict"
> +RDEPENDS_perl-module-unicode-collate-cjk-big5 +=3D "perl-module-strict"
> +RDEPENDS_perl-module-unicode-collate-cjk-big5 +=3D "perl-module-warnings=
"
> +RDEPENDS_perl-module-unicode-collate-cjk-gb2312 +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-unicode-collate-cjk-gb2312 +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-unicode-collate-cjk-jisx0208 +=3D "perl-module-stri=
ct"
> +RDEPENDS_perl-module-unicode-collate-cjk-jisx0208 +=3D "perl-module-warn=
ings"
> +RDEPENDS_perl-module-unicode-collate-cjk-korean +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-unicode-collate-cjk-korean +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-unicode-collate-cjk-pinyin +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-unicode-collate-cjk-pinyin +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-unicode-collate-cjk-stroke +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-unicode-collate-cjk-stroke +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-unicode-collate-cjk-zhuyin +=3D "perl-module-strict=
"
> +RDEPENDS_perl-module-unicode-collate-cjk-zhuyin +=3D "perl-module-warnin=
gs"
> +RDEPENDS_perl-module-unicode-collate-locale +=3D "perl-module-base"
> +RDEPENDS_perl-module-unicode-collate-locale +=3D "perl-module-carp"
> +RDEPENDS_perl-module-unicode-collate-locale +=3D "perl-module-strict"
> +RDEPENDS_perl-module-unicode-collate-locale +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-unicode-collate +=3D "perl-module-carp"
> +RDEPENDS_perl-module-unicode-collate +=3D "perl-module-constant"
> +RDEPENDS_perl-module-unicode-collate +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-unicode-collate +=3D "perl-module-strict"
> +RDEPENDS_perl-module-unicode-collate +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-unicode-collate +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-unicode-normalize +=3D "perl-module-carp"
> +RDEPENDS_perl-module-unicode-normalize +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-unicode-normalize +=3D "perl-module-strict"
> +RDEPENDS_perl-module-unicode-normalize +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-unicode-normalize +=3D "perl-module-xsloader"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-carp"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-charnames"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-feature"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-file-spec"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-if"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-integer"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-strict"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-unicode-normalize"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-unicore/heavy"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-unicore/ucd"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-utf8-heavy"
> +RDEPENDS_perl-module-unicode-ucd +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-unicore +=3D "perl-module-integer"
> +RDEPENDS_perl-module-universal +=3D "perl-module-carp"
> +RDEPENDS_perl-module-user-grent +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-user-grent +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-user-grent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-user-pwent +=3D "perl-module-carp"
> +RDEPENDS_perl-module-user-pwent +=3D "perl-module-class-struct"
> +RDEPENDS_perl-module-user-pwent +=3D "perl-module-config"
> +RDEPENDS_perl-module-user-pwent +=3D "perl-module-exporter"
> +RDEPENDS_perl-module-user-pwent +=3D "perl-module-strict"
> +RDEPENDS_perl-module-user-pwent +=3D "perl-module-warnings"
> +RDEPENDS_perl-module-utf8 +=3D "perl-module-carp"
> +RDEPENDS_perl-module-utf8 +=3D "perl-module-utf8-heavy"
> +RDEPENDS_perl-module-version +=3D "perl-module-strict"
> +RDEPENDS_perl-module-version +=3D "perl-module-version-regex"
> +RDEPENDS_perl-module-version +=3D "perl-module-warnings-register"
> +RDEPENDS_perl-module-version-regex +=3D "perl-module-strict"
> +RDEPENDS_perl-module-xsloader +=3D "perl-module-carp"
> +RDEPENDS_perl-module-xsloader +=3D "perl-module-dynaloader"
> diff --git a/meta/recipes-devtools/perl/perl.inc b/meta/recipes-devtools/=
perl/perl.inc
> index 3313a9436b..1d31befd0b 100644
> --- a/meta/recipes-devtools/perl/perl.inc
> +++ b/meta/recipes-devtools/perl/perl.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.perl.org/"
>  SECTION =3D "devel"
>  LICENSE =3D "Artistic-1.0 | GPL-1.0+"
>  LIC_FILES_CHKSUM =3D "file://Copying;md5=3D5b122a36d0f6dc55279a0ebc69f3c=
60b \
> -                   file://Artistic;md5=3D2e6fd2475335af892494fe1f7327baf=
3"
> +                   file://Artistic;md5=3D71a4d5d9acc18c0952a6df2218bb68d=
a"
>
>  SRC_URI =3D "http://www.cpan.org/src/5.0/${BP}.tar.xz"
>
> diff --git a/meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix=
-race-issues.patch b/meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.=
pm-fix-race-issues.patch
> deleted file mode 100644
> index a43fbba0b6..0000000000
> --- a/meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-i=
ssues.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 40702abf3156fa92ef70ee5d445fe52dd6cfbc7d Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 20 Sep 2018 18:48:48 +0800
> -Subject: [PATCH] ExtUtils/MM_Unix.pm: fix race issues
> -
> -Fixed a race issue when compile libhtml-parser-perl and others who use M=
akeMaker:
> -[snip]
> -chmod 755 blib/arch/auto/HTML/Parser/Parser.so
> -chmod 644 "Parser.bs"
> -[snip]
> -
> -The rule INST_DYNAMIC removes '.bs' file which are generated by BOOTSTRA=
P, but
> -the have no dependencies, so there is a race issue:
> -
> -BOOTSTRAP:
> -    touch foo.bs
> -    chmod 755 foo.bs
> -
> -INST_DYNAMIC:
> -    rm -fr foo.bs
> -
> -The error would happen when INST_DYNAMIC removes foo.bs after BOOTSTRAP =
touched
> -it but before chmod on it.
> -
> -Upstream-Status: Backport [https://github.com/Perl-Toolchain-Gang/ExtUti=
ls-MakeMaker/commit/44e95e717372abe2b0a6ee55de4b686760b65360]
> -
> -Note, This is not a real backport, upstream has totally refactored it in=
 one
> -patch, please see the link above, it's not a good idea to backport such =
a big
> -patch, I just referred it to fix the problem in a simple way. I mark it =
as
> -backport is because we can drop the patch after upgrade perl to 5.26 or =
5.28.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 95d9761..9cabe2d 100644
> ---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -933,7 +933,7 @@ OTHERLDFLAGS =3D '.$ld_opt.$otherldflags.'
> - INST_DYNAMIC_DEP =3D '.$inst_dynamic_dep.'
> - INST_DYNAMIC_FIX =3D '.$ld_fix.'
> -
> --$(INST_DYNAMIC): $(OBJECT) $(MYEXTLIB) $(INST_ARCHAUTODIR)$(DFSEP).exis=
ts $(EXPORT_LIST) $(PERL_ARCHIVEDEP) $(PERL_ARCHIVE_AFTER) $(INST_DYNAMIC_D=
EP)
> -+$(INST_DYNAMIC): $(OBJECT) $(MYEXTLIB) $(INST_ARCHAUTODIR)$(DFSEP).exis=
ts $(EXPORT_LIST) $(PERL_ARCHIVEDEP) $(PERL_ARCHIVE_AFTER) $(INST_DYNAMIC_D=
EP) $(BOOTSTRAP)
> - ');
> -     if ($armaybe ne ':'){
> -       $ldfrom =3D 'tmp$(LIB_EXT)';
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-P=
ERL_BUILD_PACKAGING-is-set.patch b/meta/recipes-devtools/perl/perl/0001-Ski=
p-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
> deleted file mode 100644
> index c5db1b7060..0000000000
> --- a/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUI=
LD_PACKAGING-is-set.patch
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -From ba6733216202523a95b0b7ee2e534b8e30b6d7df Mon Sep 17 00:00:00 2001
> -From: Dominic Hargreaves <dom@earth.li>
> -Date: Sat, 14 Oct 2017 16:27:53 +0200
> -Subject: [PATCH] Skip various tests if PERL_BUILD_PACKAGING is set
> -
> -These are tests which tend not to be useful for downstream packagers
> -
> -t/porting/customized.t change originally from Todd Rinaldo
> -
> -Upstream-Status: Backport[https://perl5.git.perl.org/perl.git/ba67332162=
02523a95b0b7ee2e534b8e30b6d7df]
> -
> -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ----
> - INSTALL                |  3 ++-
> - MANIFEST               |  1 +
> - PACKAGING              | 30 ++++++++++++++++++++++++++++++
> - regen/lib_cleanup.pl   |  5 +++++
> - t/porting/customized.t |  1 +
> - t/test.pl              |  3 +++
> - 6 files changed, 42 insertions(+), 1 deletion(-)
> - create mode 100644 PACKAGING
> -
> -diff --git a/INSTALL b/INSTALL
> -index 636f4bd52f..1285fc69a2 100644
> ---- a/INSTALL
> -+++ b/INSTALL
> -@@ -2714,4 +2714,5 @@ This document is part of the Perl package and may =
be distributed under
> - the same terms as perl itself, with the following additional request:
> - If you are distributing a modified version of perl (perhaps as part of
> - a larger package) please B<do> modify these installation instructions
> --and the contact information to match your distribution.
> -+and the contact information to match your distribution. Additional
> -+information for packagers is in F<PACKAGING>.
> -diff --git a/MANIFEST b/MANIFEST
> -index b3207030a9..32de824ca1 100644
> ---- a/MANIFEST
> -+++ b/MANIFEST
> -@@ -4932,6 +4932,7 @@ os2/perlrexx.c                   Support perl inte=
rpreter embedded in REXX
> - os2/perlrexx.cmd              Test perl interpreter embedded in REXX
> - overload.h                    generated overload enum (public)
> - overload.inc                  generated overload name table (implementa=
tion)
> -+PACKAGING                     notes and best practice for packaging per=
l 5
> - packsizetables.inc            The generated packprops array used in pp_=
pack.c
> - pad.c                         Scratchpad functions
> - pad.h                         Scratchpad headers
> -diff --git a/PACKAGING b/PACKAGING
> -new file mode 100644
> -index 0000000000..0c69b87ba6
> ---- /dev/null
> -+++ b/PACKAGING
> -@@ -0,0 +1,30 @@
> -+If you read this file _as_is_, just ignore the funny characters you
> -+see.  It is written in the POD format (see pod/perlpod.pod) which is
> -+specifically designed to be readable as is.
> -+
> -+=3Dhead1 NAME
> -+
> -+PACKAGING - notes and best practice for packaging perl 5
> -+
> -+=3Dhead1 SYNOPSIS
> -+
> -+This document is aimed at anyone who is producing their own version of
> -+perl for distribution to other users. It is intended as a collection
> -+of useful tips, advice and best practice, rather than being a complete
> -+packaging manual. The starting point for installing perl remains
> -+F<INSTALL>.
> -+
> -+=3Dhead1 Customizing test running
> -+
> -+A small number of porting tests (those in t/porting) are not well suite=
d
> -+to typical distribution packaging scenarios. For example, they assume
> -+they are working in a git clone of the upstream Perl repository, or
> -+enforce rules which are not relevant to downstream packagers. These can
> -+be skipped by setting the environment variable PERL_BUILD_PACKAGING.
> -+A complete list of tests which this applied to can be found by searchin=
g
> -+the codebase for this string.
> -+
> -+An alternative strategy would be to skip all porting tests, but many of
> -+them are useful if additional patches might be applied.
> -+
> -+=3Dcut
> -diff --git a/regen/lib_cleanup.pl b/regen/lib_cleanup.pl
> -index 5e40b405a4..6caf74a563 100644
> ---- a/regen/lib_cleanup.pl
> -+++ b/regen/lib_cleanup.pl
> -@@ -164,6 +164,11 @@ if ($TAP && !-d '.git' && !-f 'lib/.gitignore') {
> -     exit 0;
> - }
> -
> -+if ($ENV{'PERL_BUILD_PACKAGING'}) {
> -+    print "ok # skip explicitly disabled git tests by PERL_BUILD_PACKAG=
ING\n";
> -+    exit 0;
> -+}
> -+
> - $fh =3D open_new('lib/.gitignore', '>',
> -                { by =3D> $0,
> -                  from =3D> 'MANIFEST and parsing files in cpan/ dist/ a=
nd ext/'});
> -diff --git a/t/porting/customized.t b/t/porting/customized.t
> -index 45fcafb100..5c3739198c 100644
> ---- a/t/porting/customized.t
> -+++ b/t/porting/customized.t
> -@@ -13,6 +13,7 @@ BEGIN {
> -     @INC =3D qw(lib Porting t);
> -     require 'test.pl';
> -     skip_all("pre-computed SHA1 won't match under EBCDIC") if $::IS_EBC=
DIC;
> -+    skip_all("This distro may have modified some files in cpan/. Skippi=
ng validation.") if $ENV{'PERL_BUILD_PACKAGING'};
> - }
> -
> - use strict;
> -diff --git a/t/test.pl b/t/test.pl
> -index 79e6e25e95..1782dcf73c 100644
> ---- a/t/test.pl
> -+++ b/t/test.pl
> -@@ -212,6 +212,9 @@ sub find_git_or_skip {
> -     } else {
> -       $reason =3D 'not being run from a git checkout';
> -     }
> -+    if ($ENV{'PERL_BUILD_PACKAGING'}) {
> -+      $reason =3D 'PERL_BUILD_PACKAGING is set';
> -+    }
> -     skip_all($reason) if $_[0] && $_[0] eq 'all';
> -     skip($reason, @_);
> - }
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch b/meta/=
recipes-devtools/perl/perl/CVE-2018-12015.patch
> deleted file mode 100644
> index a33deaff6a..0000000000
> --- a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D <ppisar@redhat.co=
m>
> -Date: Fri, 8 Jun 2018 11:45:40 +0100
> -Subject: [PATCH] [PATCH] Remove existing files before overwriting them
> -
> -Archive should extract only the latest same-named entry.
> -Extracted regular file should not be writtent into existing block
> -device (or any other one).
> -
> -https://rt.cpan.org/Ticket/Display.html?id=3D125523
> -
> -CVE: CVE-2018-12015
> -Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit=
/ae65651eab053fc6dc4590dbb863a268215c1fc5]
> -
> -Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
> -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ----
> - lib/Archive/Tar.pm | 14 ++++++++++++++
> - 1 file changed, 14 insertions(+)
> -
> -diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/=
Archive/Tar.pm
> -index 6244369..a83975f 100644
> ---- a/cpan/Archive-Tar/lib/Archive/Tar.pm
> -+++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
> -@@ -845,6 +845,20 @@ sub _extract_file {
> -         return;
> -     }
> -
> -+    ### If a file system already contains a block device with the same =
name as
> -+    ### the being extracted regular file, we would write the file's con=
tent
> -+    ### to the block device. So remove the existing file (block device)=
 now.
> -+    ### If an archive contains multiple same-named entries, the last on=
e
> -+    ### should replace the previous ones. So remove the old file now.
> -+    ### If the old entry is a symlink to a file outside of the CWD, the=
 new
> -+    ### entry would create a file there. This is CVE-2018-12015
> -+    ### <https://rt.cpan.org/Ticket/Display.html?id=3D125523>.
> -+    if (-l $full || -e _) {
> -+      if (!unlink $full) {
> -+          $self->_error( qq[Could not remove old file '$full': $!] );
> -+          return;
> -+      }
> -+    }
> -     if( length $entry->type && $entry->is_file ) {
> -         my $fh =3D IO::File->new;
> -         $fh->open( '>' . $full ) or (
> ---
> -2.13.3
> -
> diff --git a/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch b/meta/reci=
pes-devtools/perl/perl/MM_Unix.pm.patch
> index eb92ccb678..9f65627d46 100644
> --- a/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
> +++ b/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
> @@ -1,4 +1,4 @@
> -Upstream-Status:Pending
> +Upstream-Status:Inappropriate [embedded specific]
>
>  The perl-native should be relocatable while re-use sstate-cache from
>  another build, especially the original build was renamed/removed.
> @@ -6,17 +6,20 @@ another build, especially the original build was rename=
d/removed.
>  To get the MakeMaker.pm works in this case, we need perl wrapper here
>  instead of real perl binary.
>
> +Rebased to 5.28.0
> +
>  Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +Signed-off-by: Jens Rehsack <sno@NetBSD.org>
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig   2=
011-08-12 16:07:30.000000000 +0800
> -+++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm        2=
011-08-12 16:08:56.000000000 +0800
> -@@ -1019,6 +1019,9 @@
> -     }
> +--- perl-5.28.0/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig   2=
018-11-20 11:46:01.000000000 +0100
> ++++ perl-5.28.0/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm        2=
018-11-20 11:46:56.000000000 +0100
> +@@ -1117,6 +1117,9 @@
>
>       foreach my $name (@$names){
> +         my ($abs, $use_dir);
>  +        # Getting MakeMaker.pm use perl wrapper instead of 'perl.real' =
directly
>  +        $name =3D~ s/perl\.real/perl/ if ($name =3D~ /perl\.real/);
>  +
> -         foreach my $dir (@$dirs){
> -             next unless defined $dir; # $self->{PERL_SRC} may be undefi=
ned
> -             my ($abs, $val);
> +         if ($self->file_name_is_absolute($name)) {     # /foo/bar
> +             $abs =3D $name;
> +         } elsif ($self->canonpath($name) eq
> diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/rec=
ipes-devtools/perl/perl/Makefile.SH.patch
> index e4c3426b7f..1b65cf6456 100644
> --- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
> +++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
> @@ -9,13 +9,10 @@ Upstream-Status:Inappropriate [embedded specific]
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
>  ---
> - Makefile.SH | 147 ++++++++++++++++++++++++++++-------------------------=
-------
> - 1 file changed, 68 insertions(+), 79 deletions(-)
> -
> -Index: perl-5.24.4/Makefile.SH
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.24.4.orig/Makefile.SH
> -+++ perl-5.24.4/Makefile.SH
> +diff --git a/Makefile.SH b/Makefile.SH
> +index 123903dcb0..a3be07d31d 100755
> +--- a/Makefile.SH
> ++++ b/Makefile.SH
>  @@ -48,10 +48,10 @@ case "$useshrplib" in
>   true)
>         # Prefix all runs of 'miniperl' and 'perl' with
> @@ -67,23 +64,49 @@ Index: perl-5.24.4/Makefile.SH
>             ;;
>         os390)  test -f /bin/env && ldlibpth=3D"/bin/env $ldlibpth"
>                 ;;
> -@@ -596,13 +586,23 @@ splintfiles =3D $(c1)
> +@@ -332,12 +322,26 @@ PATH_SEP =3D $p_
> + # Macros to invoke a copy of miniperl during the build.  Targets which
> + # are built using these macros should depend on \$(MINIPERL_EXE)
> + MINIPERL_EXE =3D miniperl\$(EXE_EXT)
> ++!GROK!THIS!
> ++
> ++
> ++if test "X$hostperl" !=3D X; then
> ++       $spitshell >>$Makefile <<!GROK!THIS!
> ++MINIPERL =3D \$(LDLIBPTH) \$(HOST_PERL)
> ++
> ++# Macros to invoke sort the MANIFEST during build
> ++MANIFEST_SRT =3D MANIFEST.srt
> ++
> ++!GROK!THIS!
> ++else
> ++       $spitshell >>$Makefile <<!GROK!THIS!
> + MINIPERL =3D \$(LDLIBPTH) ./miniperl\$(EXE_EXT) -Ilib
> +
> + # Macros to invoke sort the MANIFEST during build
> + MANIFEST_SRT =3D MANIFEST.srt
> +
> + !GROK!THIS!
> ++fi
> +
> + case "$usecrosscompile$perl" in
> + define?*)
> +@@ -623,13 +627,23 @@ lintflags =3D \
>         @echo `$(CCCMDSRC)` -S $*.c
>         @`$(CCCMDSRC)` -S $*.c
>
> --all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(un=
idatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SR=
T)
> +-all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(un=
idatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SR=
T) common_build
>  -      @echo " ";
>  -      @echo " Everything is up to date. Type '$(MAKE) test' to run test=
 suite."
> --
> --$(MANIFEST_SRT):      MANIFEST $(PERL_EXE)
> --      @$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MA=
NIFEST"; \
> --          $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
>  +#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(u=
nidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_S=
RT)
>  +#     @echo " ";
>  +#     @echo " Everything is up to date. Type '$(MAKE) test' to run test=
 suite."
>  +
>  +all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) miniperl $(unidatafiles)
> -+
> +
> +-$(MANIFEST_SRT):      MANIFEST $(PERL_EXE)
> +-      @$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MA=
NIFEST"; \
> +-          $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
>  +more: $(generated_pods) $(private) $(public)
>  +
>  +more2: $(dynamic_ext)
> @@ -98,7 +121,7 @@ Index: perl-5.24.4/Makefile.SH
>         @touch $(MANIFEST_SRT)
>
>   .PHONY: all utilities
> -@@ -611,7 +611,7 @@ $(MANIFEST_SRT):   MANIFEST $(PERL_EXE)
> +@@ -638,7 +652,7 @@ $(MANIFEST_SRT):   MANIFEST $(PERL_EXE)
>   # by make_patchnum.pl.
>   git_version.h: lib/Config_git.pl
>
> @@ -107,7 +130,7 @@ Index: perl-5.24.4/Makefile.SH
>         $(MINIPERL) make_patchnum.pl
>
>   # make sure that we recompile perl.c if the git version changes
> -@@ -624,7 +624,7 @@ perl$(OBJ_EXT): git_version.h
> +@@ -651,7 +665,7 @@ perl$(OBJ_EXT): git_version.h
>   # loading, we need to build perl first.
>   case "$usedl$static_cwd" in
>   defineundef)
> @@ -116,43 +139,43 @@ Index: perl-5.24.4/Makefile.SH
>       ;;
>   definedefine)
>       util_deps=3D'$(PERL_EXE) $(CONFIGPM) FORCE'
> -@@ -634,7 +634,7 @@ definedefine)
> +@@ -661,7 +675,7 @@ definedefine)
>   esac
>
>   $spitshell >>$Makefile <<!GROK!THIS!
>  -utils/Makefile: \$(MINIPERL_EXE) \$(CONFIGPM) utils/Makefile.PL
>  +utils/Makefile: \$(CONFIGPM) utils/Makefile.PL
> -       \$(MINIPERL) -Ilib utils/Makefile.PL
> +       \$(MINIPERL) utils/Makefile.PL
>
>   utilities:    utils/Makefile $util_deps
> -@@ -743,7 +743,7 @@ ext.libs: $(static_ext)
> +@@ -770,7 +784,7 @@ ext.libs: $(static_ext)
>   ;;
>   *)
>   $spitshell >>$Makefile <<'!NO!SUBS!'
>  -perlmain.c: $(MINIPERL_EXE) ext/ExtUtils-Miniperl/pm_to_blib
>  +perlmain.c: ext/ExtUtils-Miniperl/lib/ExtUtils/Miniperl.pm
> -       $(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c=
", @ARGV)' DynaLoader $(static_ext)
> +       $(MINIPERL) -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @AR=
GV)' DynaLoader $(static_ext)
>
>   # The file ext.libs is a list of libraries that must be linked in
> -@@ -806,7 +806,7 @@ PERLEXPORT         =3D perl.exp
> +@@ -833,7 +847,7 @@ PERLEXPORT         =3D perl.exp
>         ;;
>         esac
>         $spitshell >>$Makefile <<'!NO!SUBS!'
>  -perl.exp: $(MINIPERLEXP) makedef.pl $(CONFIGPM) $(SYM) $(SYMH)
>  +perl.exp: makedef.pl $(CONFIGPM) $(SYM) $(SYMH)
> -       ./$(MINIPERLEXP) makedef.pl --sort-fold PLATFORM=3Daix CC_FLAGS=
=3D"$(OPTIMIZE)" > perl.exp
> +       $(MINIPERL) makedef.pl --sort-fold PLATFORM=3Daix CC_FLAGS=3D"$(O=
PTIMIZE)" > perl.exp
>
>   !NO!SUBS!
> -@@ -815,7 +815,7 @@ os2)
> +@@ -842,7 +856,7 @@ os2)
>         $spitshell >>$Makefile <<'!NO!SUBS!'
>   MINIPERLEXP           =3D miniperl
>
>  -perl5.def: $(MINIPERLEXP) makedef.pl $(CONFIGPM) $(SYM) $(SYMH) miniper=
l.map
>  +perl5.def: makedef.pl $(CONFIGPM) $(SYM) $(SYMH) miniperl.map
> -       ./$(MINIPERLEXP) makedef.pl PLATFORM=3Dos2 -DPERL_DLL=3D$(PERL_DL=
L) CC_FLAGS=3D"$(OPTIMIZE)" > perl5.def
> +       $(MINIPERL) makedef.pl PLATFORM=3Dos2 -DPERL_DLL=3D$(PERL_DLL) CC=
_FLAGS=3D"$(OPTIMIZE)" > perl5.def
>
>   !NO!SUBS!
> -@@ -878,7 +878,7 @@ $(LIBPERL): $& $(perllib_objs) $(DYNALOA
> +@@ -918,7 +932,7 @@ $(LIBPERL): $& $(perllib_dep) $(DYNALOADER) $(LIBPER=
LEXPORT)
>         true)
>                 $spitshell >>$Makefile <<'!NO!SUBS!'
>         rm -f $@
> @@ -161,13 +184,11 @@ Index: perl-5.24.4/Makefile.SH
>   !NO!SUBS!
>                 case "$osname" in
>                 aix)
> -@@ -936,15 +936,19 @@ lib/buildcustomize.pl: $& $(miniperl_obj
> +@@ -976,15 +990,17 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_b=
uildcustomize.pl
>                 $spitshell >>$Makefile <<'!NO!SUBS!'
>   lib/buildcustomize.pl: $& $(miniperl_objs)
>         $(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(miniperl_objs) $(libs)
>  -      $(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/li=
b -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please =
run make minitest; exit 1'
> -+      mv -f miniperl miniperl-target
> -+      ln -s hostperl miniperl
>  +      #$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/l=
ib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please=
 run make minitest; exit 1'
>         $(MINIPERL) -f write_buildcustomize.pl
>   !NO!SUBS!
> @@ -179,45 +200,43 @@ Index: perl-5.24.4/Makefile.SH
>  -      $(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/li=
b -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please =
run make minitest; exit 1'
>  +      $(CC) -o $(MINIPERL_EXE) $(miniperl_objs   libs)
>  +      mv -f miniperl miniperl-target
> -+      ln -s hostperl miniperl
> ++      ln -s \$(HOST_PERL) miniperl
>  +      #$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/l=
ib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please=
 run make minitest; exit 1'
>         $(MINIPERL) -f write_buildcustomize.pl
>   !NO!SUBS!
>                 ;;
> -@@ -966,7 +970,9 @@ lib/buildcustomize.pl: $& $(miniperl_obj
> +@@ -1006,7 +1022,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_b=
uildcustomize.pl
>         -@rm -f miniperl.xok
>         $(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
>             $(miniperl_objs) $(libs)
>  -      $(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/li=
b -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please =
run make minitest; exit 1'
>  +      mv -f miniperl miniperl-target
> -+      ln -s hostperl miniperl
> ++      ln -s \$(HOST_PERL) miniperl
>  +      #$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/l=
ib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please=
 run make minitest; exit 1'
>         $(MINIPERL) -f write_buildcustomize.pl
>   !NO!SUBS!
>                 ;;
> -@@ -977,7 +983,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_o
> +@@ -1017,7 +1035,7 @@ lib/buildcustomize.pl: \$& \$(miniperl_dep) write_=
buildcustomize.pl
>         -@rm -f miniperl.xok
>         -@rm \$(MINIPERL_EXE)
>         \$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
>  -      \$(LDLIBPTH) ./miniperl\$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/=
lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Pleas=
e run make minitest; exit 1'
> -+      mv -f miniperl miniperl-target
> -+      ln -s hostperl miniperl
>  +      #\$(LDLIBPTH) ./miniperl\$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter=
/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Plea=
se run make minitest; exit 1'
>         \$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
>   !GROK!THIS!
>                 else
> -@@ -986,7 +994,9 @@ lib/buildcustomize.pl: $& $(miniperl_obj
> +@@ -1026,7 +1044,9 @@ lib/buildcustomize.pl: $& $(miniperl_dep) write_bu=
ildcustomize.pl
>         -@rm -f miniperl.xok
>         $(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
>             $(miniperl_objs) $(libs)
>  -      $(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/li=
b -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please =
run make minitest; exit 1'
>  +      mv -f miniperl miniperl-target
> -+      ln -s hostperl miniperl
> ++      ln -s \$(HOST_PERL) miniperl
>  +      #$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/l=
ib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please=
 run make minitest; exit 1'
>         $(MINIPERL) -f write_buildcustomize.pl
>   !NO!SUBS!
>                 fi
> -@@ -1036,7 +1046,7 @@ case "${osname}" in
> +@@ -1076,7 +1096,7 @@ case "${osname}" in
>   catamount)
>   $spitshell >>$Makefile <<!GROK!THIS!
>   .PHONY: makeppport
> @@ -226,7 +245,7 @@ Index: perl-5.24.4/Makefile.SH
>         -@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do =
\
>         (cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../.=
./lib \$\$f); \
>         done
> -@@ -1046,7 +1056,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
> +@@ -1086,7 +1106,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
>   *)
>   $spitshell >>$Makefile <<'!NO!SUBS!'
>   .PHONY: makeppport
> @@ -235,10 +254,10 @@ Index: perl-5.24.4/Makefile.SH
>         $(MINIPERL) mkppport
>
>   !NO!SUBS!
> -@@ -1056,16 +1066,16 @@ esac
> +@@ -1096,16 +1116,16 @@ esac
>   $spitshell >>$Makefile <<'!NO!SUBS!'
>
> - .PHONY: preplibrary
> + .PHONY: preplibrary common_build
>  -preplibrary: $(MINIPERL_EXE) $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
>  +preplibrary: $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
>
> @@ -255,11 +274,11 @@ Index: perl-5.24.4/Makefile.SH
>         $(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest =
-makelist -p
>   #     Commented out so always runs, mktables looks at far more files th=
an we
>   #     can in this makefile to decide if needs to run or not
> -@@ -1074,12 +1084,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
> +@@ -1114,12 +1134,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicor=
e/mktables $(nonxs_ext)
>   # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
>   # But also this ensures that all extensions are built before we try to =
scan
>   # them, which picks up Devel::PPPort's documentation.
> --pod/perltoc.pod: $(perltoc_pod_prereqs)  $(PERL_EXE) $(ext) pod/buildto=
c
> +-pod/perltoc.pod: $(perltoc_pod_prereqs) $(PERL_EXE) $(ext) pod/buildtoc
>  -      $(RUN_PERL) -f pod/buildtoc -q
>  +pod/perltoc.pod: $(perltoc_pod_prereqs) $(ext) pod/buildtoc
>  +      $(MINIPERL) -f pod/buildtoc -q
> @@ -271,65 +290,38 @@ Index: perl-5.24.4/Makefile.SH
>         $(MINIPERL) autodoc.pl
>
>   pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
> -@@ -1089,7 +1099,7 @@ pod/perl5244delta.pod: pod/perldelta.pod
> -       $(RMS) pod/perl5244delta.pod
> -       $(LNS) perldelta.pod pod/perl5244delta.pod
> +@@ -1129,7 +1149,7 @@ pod/perl5280delta.pod: pod/perldelta.pod
> +       $(RMS) pod/perl5280delta.pod
> +       $(LNS) perldelta.pod pod/perl5280delta.pod
>
>  -extra.pods: $(MINIPERL_EXE)
>  +extra.pods:
>         -@test ! -f extra.pods || rm -f `cat extra.pods`
>         -@rm -f extra.pods
>         -@for x in `grep -l '^=3D[a-z]' README.* | grep -v README.vms` ; =
do \
> -@@ -1133,8 +1143,7 @@ EOT
> +@@ -1185,8 +1205,8 @@ for name in all notify silent strip verbose; do
>           $spitshell >>$Makefile <<EOT
>
>   install_$name install-$name: \$(INSTALL_DEPENDENCE) installperl all ins=
tallman
> --      \$(RUN_PERL) installperl --destdir=3D\$(DESTDIR) $flags \$(INSTAL=
LFLAGS) \$(STRIPFLAGS)
> --      \$(RUN_PERL) installman --destdir=3D\$(DESTDIR) $flags
> -+      ./hostperl -Ifake_config_library -Ilib -MConfig installperl --des=
tdir=3D\$(DESTDIR) $flags  \$(INSTALLFLAGS) \$(STRIPFLAGS)
> +-      \$(HOST_PERL) installperl --destdir=3D\$(DESTDIR) $flags \$(INSTA=
LLFLAGS) \$(STRIPFLAGS)
> +-      \$(HOST_PERL) installman --destdir=3D\$(DESTDIR) $flags
> ++      \$(HOST_PERL) -Ifake_config_library -Ilib -MConfig installperl --=
destdir=3D\$(DESTDIR) $flags \$(INSTALLFLAGS) \$(STRIPFLAGS)
> ++      \$(HOST_PERL) -MConfig installman --destdir=3D\$(DESTDIR) $flags
>   EOT
> -     fi
> -
> -@@ -1144,11 +1153,7 @@ done
> - if test "X$hostperl" !=3D X; then
> +     else
> +         $spitshell >>$Makefile <<EOT
> +@@ -1204,8 +1224,8 @@ if test "X$hostperl" !=3D X; then
> +       LOCAL_PERL=3D'$(HOST_PERL)'
>         $spitshell >>$Makefile <<'!NO!SUBS!'
>   install.perl: $(INSTALL_DEPENDENCE) installperl
>  -      $(HOST_PERL) installperl --destdir=3D$(DESTDIR) $(INSTALLFLAGS) $=
(STRIPFLAGS)
>  -      -@test ! -s extras.lst || $(MAKE) extras.install
> --
> --install.man:  all installman
> --      $(HOST_PERL) installman --destdir=3D$(DESTDIR) $(INSTALLFLAGS)
> -+      ./hostperl -Ifake_config_library -Ilib -MConfig installperl --des=
tdir=3D$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
> -
> - # XXX Experimental. Hardwired values, but useful for testing.
> - # Eventually Configure could ask for some of these values.
> -@@ -1166,24 +1171,8 @@ install.html: all installhtml
> - else
> -       $spitshell >>$Makefile <<'!NO!SUBS!'
> - install.perl: $(INSTALL_DEPENDENCE) installperl
> --      $(RUN_PERL) installperl --destdir=3D$(DESTDIR) $(INSTALLFLAGS) $(=
STRIPFLAGS)
> --      -@test ! -s extras.lst || PATH=3D"`pwd`:\${PATH}" PERL5LIB=3D"`pw=
d`/lib" \$(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.ls=
t`
> --
> --install.man:  all installman
> --      $(RUN_PERL) installman --destdir=3D$(DESTDIR) $(INSTALLFLAGS)
> -+      ./hostperl -Ifake_config_library -Ilib -MConfig installperl --des=
tdir=3D$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
> -
> --# XXX Experimental. Hardwired values, but useful for testing.
> --# Eventually Configure could ask for some of these values.
> --install.html: all installhtml
> --      -@test -f README.vms && cd vms && $(LNS) ../README.vms README_vms=
.pod && cd ..
> --      $(RUN_PERL) installhtml   \
> --      --podroot=3D. --podpath=3D. --recurse  \
> --      --htmldir=3D$(privlib)/html   \
> --      --htmlroot=3D$(privlib)/html  \
> --      --splithead=3Dpod/perlipc     \
> --      --splititem=3Dpod/perlfunc    \
> --      --ignore=3DPorting/Maintainers.pm,Porting/pumpkin.pod,Porting/rep=
ository.pod \
> --      --verbose
> ++      $(HOST_PERL) -Ifake_config_library -Ilib -MConfig installperl --d=
estdir=3D$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
> ++      @test ! -s extras.lst || $(MAKE) extras.install
>   !NO!SUBS!
> - fi
> -
> -@@ -1275,13 +1264,13 @@ manicheck:     FORCE
> + else
> +       LOCAL_PERL=3D'$(RUN_PERL)'
> +@@ -1318,13 +1338,13 @@ manicheck:     FORCE
>   #
>   # DynaLoader may be needed for extensions that use Makefile.PL.
>
> @@ -346,13 +338,13 @@ Index: perl-5.24.4/Makefile.SH
>         $(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE=3D"$(MAKE)" LIBP=
ERL_A=3D$(LIBPERL) LINKTYPE=3Dstatic $(STATIC_LDFLAGS)
>
>   n_dummy $(nonxs_ext): $(MINIPERL_EXE) lib/buildcustomize.pl preplibrary=
 FORCE
> -@@ -1479,14 +1468,14 @@ test_prep_pre: preplibrary utilities $(n
> +@@ -1523,14 +1543,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext=
)
>
>   case "$targethost" in
>   '') $spitshell >>$Makefile <<'!NO!SUBS!'
>  -test_prep test-prep: test_prep_pre $(MINIPERL_EXE) $(unidatafiles) $(PE=
RL_EXE) \
>  +test_prep test-prep: test_prep_pre $(unidatafiles) $(PERL_EXE) \
> -       $(dynamic_ext) $(TEST_PERL_DLL) runtests $(generated_pods)
> +       $(dynamic_ext) $(TEST_PERL_DLL) runtests $(generated_pods) common=
_build
>         cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
>
>   !NO!SUBS!
> @@ -361,9 +353,9 @@ Index: perl-5.24.4/Makefile.SH
>  -test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$=
(PERL_EXE) \
>  +test_prep test-prep: test_prep_pre \$(unidatafiles) \$(PERL_EXE) \
>         \$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
> -       \$(generated_pods)
> +       \$(generated_pods) common_build
>         $to libperl.*
> -@@ -1539,7 +1528,7 @@ test_prep test-prep: test_prep_pre \$(MI
> +@@ -1583,7 +1603,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE=
) \$(unidatafiles) \$(PERL_EXE
>   esac
>
>   $spitshell >>$Makefile <<'!NO!SUBS!'
> @@ -372,7 +364,7 @@ Index: perl-5.24.4/Makefile.SH
>         $(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE=3D"$(MAKE)" LIBPER=
L_A=3D$(LIBPERL) LINKTYPE=3Ddynamic
>         cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
>   !NO!SUBS!
> -@@ -1600,7 +1589,7 @@ minitest_prep:
> +@@ -1644,7 +1664,7 @@ minitest_prep:
>
>   MINITEST_TESTS =3D base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t opba=
sic/*.t op/*.t uni/*.t perf/*.t
>
> diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-dev=
tools/perl/perl/config.sh
> index b1b5834c71..4da236281c 100644
> --- a/meta/recipes-devtools/perl/perl/config.sh
> +++ b/meta/recipes-devtools/perl/perl/config.sh
> @@ -14,7 +14,7 @@
>
>  : Configure command line arguments.
>  config_arg0=3D'Configure'
> -config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmi=
n=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@EX=
ECPREFIX@ -Dprefix=3D@EXECPREFIX@ -Dvendorprefix=3D@EXECPREFIX@ -Dsiteprefi=
x=3D@EXECPREFIX@ -Dotherlibdirs=3D@LIBDIR@/perl/5.24.4 -Duseshrplib -Duseth=
reads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_=
ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallus=
rbinperl -Ubincompat5005 -Uversiononly -Dpager=3D@USRBIN@/less -isr'
> +config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmi=
n=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@EX=
ECPREFIX@ -Dprefix=3D@EXECPREFIX@ -Dvendorprefix=3D@EXECPREFIX@ -Dsiteprefi=
x=3D@EXECPREFIX@ -Dotherlibdirs=3D@LIBDIR@/perl/5.28.0 -Duseshrplib -Duseth=
reads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_=
ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallus=
rbinperl -Ubincompat5005 -Uversiononly -Dpager=3D@USRBIN@/less -isr'
>  config_argc=3D28
>  config_arg1=3D'-des'
>  config_arg2=3D'-Doptimize=3D-O2'
> @@ -26,7 +26,7 @@ config_arg7=3D'-Dinstallprefix=3D@EXECPREFIX@'
>  config_arg8=3D'-Dprefix=3D@EXECPREFIX@'
>  config_arg9=3D'-Dvendorprefix=3D@EXECPREFIX@'
>  config_arg10=3D'-Dsiteprefix=3D@EXECPREFIX@'
> -config_arg11=3D'-Dotherlibdirs=3D@LIBDIR@/perl/5.24.4'
> +config_arg11=3D'-Dotherlibdirs=3D@LIBDIR@/perl/5.28.0'
>  config_arg12=3D'-Duseshrplib'
>  config_arg13=3D'-Dusethreads'
>  config_arg14=3D'-Duseithreads'
> @@ -65,12 +65,12 @@ ansi2knr=3D''
>  aphostname=3D''
>  api_revision=3D'5'
>  api_subversion=3D'4'
> -api_version=3D'24'
> -api_versionstring=3D'5.24.4'
> +api_version=3D'28'
> +api_versionstring=3D'5.28.0'
>  ar=3D'ar'
> -archlib=3D'@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
> -archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
> -archlib_exp=3D'@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
> +archlib=3D'@LIBDIR@/perl/5.28.0/@ARCH@-thread-multi'
> +archlibexp=3D'@STAGINGDIR@@LIBDIR@/perl/5.28.0/@ARCH@-thread-multi'
> +archlib_exp=3D'@LIBDIR@/perl/5.28.0/@ARCH@-thread-multi'
>  archname64=3D''
>  archname=3D'@ARCH@-thread-multi'
>  archobjs=3D''
> @@ -88,8 +88,8 @@ castflags=3D'0'
>  cat=3D'cat'
>  cc=3D'gcc'
>  cccdlflags=3D'-fPIC'
> -ccdlflags=3D'-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi/=
CORE'
> -ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe=
 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_FORTIFY_SOURCE=3D2'
> +ccdlflags=3D'-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.28.0/@ARCH@-thread-multi/=
CORE'
> +ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe=
 -fstack-protector-strong -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_F=
ORTIFY_SOURCE=3D2'
>  ccflags_uselargefiles=3D'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
>  ccname=3D'gcc'
>  ccsymbols=3D''
> @@ -111,7 +111,7 @@ cpio=3D''
>  cpp=3D'cpp'
>  cpp_stuff=3D'42'
>  cppccsymbols=3D''
> -cppflags=3D'-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pip=
e'
> +cppflags=3D'-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pip=
e -fstack-protector-strong'
>  cpplast=3D'-'
>  cppminus=3D'-'
>  cpprun=3D'gcc  -E'
> @@ -136,6 +136,7 @@ d_PRIu64=3D'define'
>  d_PRIx64=3D'define'
>  d_SCNfldbl=3D'define'
>  d__fwalk=3D'undef'
> +d_accept4=3D'define'
>  d_access=3D'define'
>  d_accessx=3D'undef'
>  d_acosh=3D'define'
> @@ -162,9 +163,11 @@ d_bcopy=3D'define'
>  d_bsd=3D'undef'
>  d_bsdgetpgrp=3D'undef'
>  d_bsdsetpgrp=3D'undef'
> +d_builtin_add_overflow=3D'define'
>  d_builtin_choose_expr=3D'define'
>  d_builtin_expect=3D'define'
> -d_bzero=3D'define'
> +d_builtin_mul_overflow=3D'define'
> +d_builtin_sub_overflow=3D'define'
>  d_c99_variadic_macros=3D'define'
>  d_casti32=3D'define'
>  d_castneg=3D'define'
> @@ -201,9 +204,19 @@ d_dlerror=3D'define'
>  d_dlopen=3D'define'
>  d_dlsymun=3D'undef'
>  d_dosuid=3D'undef'
> +d_double_has_inf=3D'define'
> +d_double_has_nan=3D'define'
> +d_double_has_negative_zero=3D'define'
> +d_double_has_subnormals=3D'define'
> +d_double_style_cray=3D'undef'
> +d_double_style_ibm=3D'undef'
> +d_double_style_ieee=3D'define'
> +d_double_style_vax=3D'undef'
>  d_drand48_r=3D'define'
>  d_drand48proto=3D'define'
>  d_dup2=3D'define'
> +d_dup3=3D'define'
> +d_duplocale=3D'define'
>  d_eaccess=3D'define'
>  d_endgrent=3D'define'
>  d_endgrent_r=3D'undef'
> @@ -226,6 +239,7 @@ d_expm1=3D'define'
>  d_faststdio=3D'undef'
>  d_fchdir=3D'define'
>  d_fchmod=3D'define'
> +d_fchmodat=3D'define'
>  d_fchown=3D'define'
>  d_fcntl=3D'define'
>  d_fcntl_can_lock=3D'define'
> @@ -263,6 +277,7 @@ d_fsync=3D'define'
>  d_ftello=3D'define'
>  d_ftime=3D'undef'
>  d_futimes=3D'define'
> +d_gai_strerror=3D'define'
>  d_gdbm_ndbm_h_uses_prototypes=3D'undef'
>  d_gdbmndbm_h_uses_prototypes=3D'define'
>  d_getaddrinfo=3D'define'
> @@ -364,10 +379,12 @@ d_lgamma_r=3D'define'
>  d_libm_lib_version=3D'undef'
>  d_libname_unique=3D'undef'
>  d_link=3D'define'
> +d_linkat=3D'define'
>  d_llrint=3D'define'
>  d_llrintl=3D'define'
>  d_llround=3D'define'
>  d_llroundl=3D'define'
> +d_localeconv_l=3D'undef'
>  d_localtime64=3D'undef'
>  d_localtime_r=3D'define'
>  d_localtime_r_needs_tzset=3D'define'
> @@ -376,6 +393,11 @@ d_lockf=3D'define'
>  d_log1p=3D'define'
>  d_log2=3D'define'
>  d_logb=3D'define'
> +d_long_double_style_ieee=3D'define'
> +d_long_double_style_ieee_doubledouble=3D'undef'
> +d_long_double_style_ieee_extended=3D'define'
> +d_long_double_style_ieee_std=3D'undef'
> +d_long_double_style_vax=3D'undef'
>  d_longdbl=3D'define'
>  d_longlong=3D'define'
>  d_lrint=3D'define'
> @@ -388,16 +410,19 @@ d_madvise=3D'define'
>  d_malloc_good_size=3D'undef'
>  d_malloc_size=3D'undef'
>  d_mblen=3D'define'
> +d_mbrlen=3D'define'
> +d_mbrtowc=3D'define'
>  d_mbstowcs=3D'define'
>  d_mbtowc=3D'define'
>  d_memchr=3D'define'
>  d_memcmp=3D'define'
>  d_memcpy=3D'define'
>  d_memmove=3D'define'
> -d_memset=3D'define'
> +d_memrchr=3D'define'
>  d_mkdir=3D'define'
>  d_mkdtemp=3D'define'
>  d_mkfifo=3D'define'
> +d_mkostemp=3D'define'
>  d_mkstemp=3D'define'
>  d_mkstemps=3D'define'
>  d_mktime64=3D'undef'
> @@ -436,10 +461,12 @@ d_old_pthread_create_joinable=3D'undef'
>  d_oldpthreads=3D'undef'
>  d_oldsock=3D'undef'
>  d_open3=3D'define'
> +d_openat=3D'define'
>  d_pathconf=3D'define'
>  d_pause=3D'define'
>  d_perl_otherlibdirs=3D'define'
>  d_phostname=3D'undef'
> +d_pipe2=3D'define'
>  d_pipe=3D'define'
>  d_poll=3D'define'
>  d_portable=3D'define'
> @@ -462,6 +489,7 @@ d_pwpasswd=3D'define'
>  d_pwquota=3D'undef'
>  d_qgcvt=3D'define'
>  d_quad=3D'define'
> +d_querylocale=3D'undef'
>  d_random_r=3D'define'
>  d_re_comp=3D'undef'
>  d_readdir64_r=3D'define'
> @@ -475,6 +503,7 @@ d_regcomp=3D'define'
>  d_remainder=3D'define'
>  d_remquo=3D'define'
>  d_rename=3D'define'
> +d_renameat=3D'define'
>  d_rewinddir=3D'define'
>  d_rint=3D'define'
>  d_rmdir=3D'define'
> @@ -570,16 +599,17 @@ d_stdiobase=3D'undef'
>  d_stdstdio=3D'undef'
>  d_strchr=3D'define'
>  d_strcoll=3D'define'
> -d_strctcpy=3D'define'
> -d_strerrm=3D'strerror(e)'
> -d_strerror=3D'define'
> +d_strerror_l=3D'define'
>  d_strerror_r=3D'define'
>  d_strftime=3D'define'
>  d_strlcat=3D'undef'
>  d_strlcpy=3D'undef'
> +d_strnlen=3D'define'
>  d_strtod=3D'define'
> +d_strtod_l=3D'define'
>  d_strtol=3D'define'
>  d_strtold=3D'define'
> +d_strtold_l=3D'define'
>  d_strtoll=3D'define'
>  d_strtoq=3D'define'
>  d_strtoul=3D'define'
> @@ -599,6 +629,7 @@ d_tcsetpgrp=3D'define'
>  d_telldir=3D'define'
>  d_telldirproto=3D'define'
>  d_tgamma=3D'define'
> +d_thread_safe_nl_langinfo_l=3D'define'
>  d_time=3D'define'
>  d_timegm=3D'define'
>  d_times=3D'define'
> @@ -615,6 +646,7 @@ d_ualarm=3D'define'
>  d_umask=3D'define'
>  d_uname=3D'define'
>  d_union_semun=3D'undef'
> +d_unlinkat=3D'define'
>  d_unordered=3D'undef'
>  d_unsetenv=3D'define'
>  d_usleep=3D'define'
> @@ -645,6 +677,7 @@ db_prefixtype=3D'size_t'
>  db_version_major=3D''
>  db_version_minor=3D''
>  db_version_patch=3D''
> +default_inc_excludes_dot=3D'undef'
>  direntrytype=3D'struct dirent'
>  dlext=3D'so'
>  dlsrc=3D'dl_dlopen.xs'
> @@ -657,7 +690,7 @@ drand01=3D'Perl_drand48()'
>  drand48_r_proto=3D'REENTRANT_PROTO_I_ST'
>  dtrace=3D''
>  dtraceobject=3D''
> -dynamic_ext=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper De=
vel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/=
Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/Sy=
sV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode PO=
SIX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket S=
torable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece=
 Unicode/Collate XS/APItest XS/Typemap arybase attributes mro re threads th=
reads/shared'
> +dynamic_ext=3D'arybase attributes B Compress/Raw/Bzip2 Compress/Raw/Zlib=
 Cwd Data/Dumper Devel/Peek Devel/PPPort Digest/MD5 Digest/SHA Encode Fcntl=
 File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N=
/Langinfo IO IPC/SysV List/Util Math/BigInt/FastCalc MIME/Base64 mro Opcode=
 PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via POSIX re SDBM_File So=
cket Storable Sys/Hostname Sys/Syslog threads threads/shared Tie/Hash/Named=
Capture Time/HiRes Time/Piece Unicode/Collate Unicode/Normalize XS/APItest =
XS/Typemap'
>  eagain=3D'EAGAIN'
>  ebcdic=3D'undef'
>  echo=3D'echo'
> @@ -672,7 +705,7 @@ endservent_r_proto=3D'0'
>  eunicefix=3D':'
>  exe_ext=3D''
>  expr=3D'expr'
> -extensions=3D'B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Dev=
el/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/G=
lob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/Sys=
V List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POS=
IX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket St=
orable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece =
Unicode/Collate XS/APItest XS/Typemap arybase attributes mro re threads thr=
eads/shared Archive/Tar Attribute/Handlers AutoLoader B/Debug CPAN CPAN/Met=
a CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStubbe=
r Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command Ex=
tUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUt=
ils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp File=
Cache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/Com=
press IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/Ma=
ketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize =
Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Me=
tadata NEXT Net/Ping Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/via/Qu=
otedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Per=
ldoc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/C=
ap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Te=
xt/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/Fil=
e Tie/Memoize Tie/RefHash Time/Local Unicode/Normalize XSLoader autodie aut=
ouse base bignum constant encoding/warnings experimental if lib libnet pare=
nt perlfaq podlators version'
> +extensions=3D'arybase attributes B Compress/Raw/Bzip2 Compress/Raw/Zlib =
Cwd Data/Dumper Devel/Peek Devel/PPPort Digest/MD5 Digest/SHA Encode Fcntl =
File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/=
Langinfo IO IPC/SysV List/Util Math/BigInt/FastCalc MIME/Base64 mro Opcode =
PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via POSIX re SDBM_File Soc=
ket Storable Sys/Hostname Sys/Syslog threads threads/shared Tie/Hash/NamedC=
apture Time/HiRes Time/Piece Unicode/Collate Unicode/Normalize XS/APItest X=
S/Typemap Archive/Tar Attribute/Handlers autodie AutoLoader autouse base B/=
Debug bignum Carp Config/Perl/V constant CPAN CPAN/Meta CPAN/Meta/Requireme=
nts CPAN/Meta/YAML Devel/SelfStubber Digest Dumpvalue encoding/warnings Env=
 Errno experimental Exporter ExtUtils/CBuilder ExtUtils/Constant ExtUtils/I=
nstall ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/Pars=
eXS FileCache File/Fetch File/Find File/Path File/Temp Filter/Simple Getopt=
/Long HTTP/Tiny I18N/Collate I18N/LangTags if IO/Compress IO/Socket/IP IO/Z=
lib IPC/Cmd IPC/Open3 JSON/PP lib libnet Locale/Codes Locale/Maketext Local=
e/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize Module/CoreL=
ist Module/Load Module/Load/Conditional Module/Loaded Module/Metadata Net/P=
ing NEXT Params/Check parent perlfaq PerlIO/via/QuotedPrint Perl/OSType Pod=
/Checker Pod/Escapes Pod/Functions Pod/Html podlators Pod/Parser Pod/Perldo=
c Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/Cap =
Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/=
Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File T=
ie/Memoize Tie/RefHash Time/Local version XSLoader'
>  extern_C=3D'extern'
>  extras=3D''
>  fflushNULL=3D'define'
> @@ -832,46 +865,48 @@ i_values=3D'define'
>  i_varargs=3D'undef'
>  i_varhdr=3D'stdarg.h'
>  i_vfork=3D'undef'
> +i_wchar=3D'define'
> +i_xlocale=3D'undef'
>  ignore_versioned_solibs=3D'y'
>  inc_version_list=3D' '
>  inc_version_list_init=3D'0'
>  incpath=3D''
>  inews=3D''
>  initialinstalllocation=3D'@USRBIN@'
> -installarchlib=3D'@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
> +installarchlib=3D'@LIBDIR@/perl/5.28.0/@ARCH@-thread-multi'
>  installbin=3D'@USRBIN@'
>  installhtml1dir=3D''
>  installhtml3dir=3D''
> -installman1dir=3D''
> -installman3dir=3D''
> +installman1dir=3D'@MANDIR@/man1'
> +installman3dir=3D'@MANDIR@/man3'
>  installprefix=3D'@EXECPREFIX@'
>  installprefixexp=3D'@EXECPREFIX@'
> -installprivlib=3D'@LIBDIR@/perl/5.24.4'
> +installprivlib=3D'@LIBDIR@/perl/5.28.0'
>  installscript=3D'@USRBIN@'
> -installsitearch=3D'@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
> +installsitearch=3D'@LIBDIR@/perl/site_perl/5.28.0/@ARCH@-thread-multi'
>  installsitebin=3D'@USRBIN@'
>  installsitehtml1dir=3D''
>  installsitehtml3dir=3D''
> -installsitelib=3D'@LIBDIR@/perl/site_perl/5.24.4'
> -installsiteman1dir=3D''
> -installsiteman3dir=3D''
> +installsitelib=3D'@LIBDIR@/perl/site_perl/5.28.0'
> +installsiteman1dir=3D'@MANDIR@/man1'
> +installsiteman3dir=3D'@MANDIR@/man3'
>  installsitescript=3D'@USRBIN@'
>  installstyle=3D'lib/perl'
>  installusrbinperl=3D'define'
> -installvendorarch=3D'@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-mult=
i'
> +installvendorarch=3D'@LIBDIR@/perl/vendor_perl/5.28.0/@ARCH@-thread-mult=
i'
>  installvendorbin=3D'@USRBIN@'
>  installvendorhtml1dir=3D''
>  installvendorhtml3dir=3D''
> -installvendorlib=3D'@LIBDIR@/perl/vendor_perl/5.24.4'
> -installvendorman1dir=3D''
> -installvendorman3dir=3D''
> +installvendorlib=3D'@LIBDIR@/perl/vendor_perl/5.28.0'
> +installvendorman1dir=3D'@MANDIR@/man1'
> +installvendorman3dir=3D'@MANDIR@/man3'
>  installvendorscript=3D'@USRBIN@'
>  intsize=3D'4'
>  issymlink=3D'test -h'
>  ivdformat=3D'"ld"'
>  ivsize=3D'8'
>  ivtype=3D'long'
> -known_extensions=3D'Archive/Tar Attribute/Handlers AutoLoader B B/Debug =
CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Compress/Raw/Bzip=
2 Compress/Raw/Zlib Config/Perl/V Cwd DB_File Data/Dumper Devel/PPPort Deve=
l/Peek Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode Env =
Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtil=
s/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/P=
arseXS Fcntl File/DosGlob File/Fetch File/Find File/Glob File/Path File/Tem=
p FileCache Filter/Simple Filter/Util/Call GDBM_File Getopt/Long HTTP/Tiny =
Hash/Util Hash/Util/FieldHash I18N/Collate I18N/LangTags I18N/Langinfo IO I=
O/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/SysV JSON/PP List/Uti=
l Locale/Codes Locale/Maketext Locale/Maketext/Simple MIME/Base64 Math/BigI=
nt Math/BigInt/FastCalc Math/BigRat Math/Complex Memoize Module/CoreList Mo=
dule/Load Module/Load/Conditional Module/Loaded Module/Metadata NDBM_File N=
EXT Net/Ping ODBM_File Opcode POSIX Params/Check Parse/CPAN/Meta Perl/OSTyp=
e PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via PerlIO/via/QuotedPri=
nt Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Po=
d/Simple Pod/Usage SDBM_File Safe Search/Dict SelfLoader Socket Storable Sy=
s/Hostname Sys/Syslog Term/ANSIColor Term/Cap Term/Complete Term/ReadLine T=
est Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text=
/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memo=
ize Tie/RefHash Time/HiRes Time/Local Time/Piece Unicode/Collate Unicode/No=
rmalize VMS/DCLsym VMS/Filespec VMS/Stdio Win32 Win32API/File Win32CORE XS/=
APItest XS/Typemap XSLoader arybase attributes autodie autouse base bignum =
constant encoding/warnings experimental if lib libnet mro parent perlfaq po=
dlators re threads threads/shared version '
> +known_extensions=3D'Amiga/ARexx Amiga/Exec Archive/Tar arybase Attribute=
/Handlers attributes autodie AutoLoader autouse B base B/Debug bignum Carp =
Compress/Raw/Bzip2 Compress/Raw/Zlib Config/Perl/V constant CPAN CPAN/Meta =
CPAN/Meta/Requirements CPAN/Meta/YAML Cwd Data/Dumper DB_File Devel/Peek De=
vel/PPPort Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode =
encoding/warnings Env Errno experimental Exporter ExtUtils/CBuilder ExtUtil=
s/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/M=
iniperl ExtUtils/ParseXS Fcntl FileCache File/DosGlob File/Fetch File/Find =
File/Glob File/Path File/Temp Filter/Simple Filter/Util/Call GDBM_File Geto=
pt/Long Hash/Util Hash/Util/FieldHash HTTP/Tiny I18N/Collate I18N/Langinfo =
I18N/LangTags if IO IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/=
SysV JSON/PP lib libnet List/Util Locale/Codes Locale/Maketext Locale/Maket=
ext/Simple Math/BigInt Math/BigInt/FastCalc Math/BigRat Math/Complex Memoiz=
e MIME/Base64 Module/CoreList Module/Load Module/Load/Conditional Module/Lo=
aded Module/Metadata mro NDBM_File Net/Ping NEXT ODBM_File Opcode Params/Ch=
eck parent perlfaq PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via Per=
lIO/via/QuotedPrint Perl/OSType Pod/Checker Pod/Escapes Pod/Functions Pod/H=
tml podlators Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage POSIX re Safe SDB=
M_File Search/Dict SelfLoader Socket Storable Sys/Hostname Sys/Syslog Term/=
ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simpl=
e Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue threads =
Thread/Semaphore threads/shared Tie/File Tie/Hash/NamedCapture Tie/Memoize =
Tie/RefHash Time/HiRes Time/Local Time/Piece Unicode/Collate Unicode/Normal=
ize version VMS/DCLsym VMS/Filespec VMS/Stdio Win32 Win32API/File Win32CORE=
 XS/APItest XSLoader XS/Typemap '
>  ksh=3D''
>  ld=3D'gcc'
>  ld_can_script=3D'define'
> @@ -918,12 +953,12 @@ make_set_make=3D'#'
>  mallocobj=3D''
>  mallocsrc=3D''
>  malloctype=3D'void *'
> -man1dir=3D' '
> -man1direxp=3D''
> -man1ext=3D'0'
> -man3dir=3D' '
> -man3direxp=3D''
> -man3ext=3D'0'
> +man1dir=3D'@MANDIR@/man1'
> +man1direxp=3D'@MANDIR@/man1'
> +man1ext=3D'1'
> +man3dir=3D'@MANDIR@/man3'
> +man3direxp=3D'@MANDIR@/man3'
> +man3ext=3D'3'
>  mips_type=3D''
>  mistrustnm=3D''
>  mkdir=3D'mkdir'
> @@ -965,11 +1000,11 @@ optimize=3D'-O2'
>  orderlib=3D'false'
>  osname=3D'linux'
>  osvers=3D'3.19.5-yocto-standard'
> -otherlibdirs=3D'@LIBDIR@/perl/5.24.4'
> +otherlibdirs=3D'@LIBDIR@/perl/5.28.0'
>  package=3D'perl'
>  pager=3D'/usr/bin/less -isr'
>  passcat=3D'cat /etc/passwd'
> -patchlevel=3D'24'
> +patchlevel=3D'28'
>  path_sep=3D':'
>  perl5=3D'@USRBIN@/perl'
>  perl=3D'perl'
> @@ -986,8 +1021,8 @@ pmake=3D''
>  pr=3D''
>  prefix=3D'@EXECPREFIX@'
>  prefixexp=3D'@EXECPREFIX@'
> -privlib=3D'@LIBDIR@/perl/5.24.4'
> -privlibexp=3D'@LIBDIR@/perl/5.24.4'
> +privlib=3D'@LIBDIR@/perl/5.28.0'
> +privlibexp=3D'@LIBDIR@/perl/5.28.0'
>  procselfexe=3D'"/proc/self/exe"'
>  prototype=3D'define'
>  ptrsize=3D'8'
> @@ -1053,21 +1088,21 @@ sig_num=3D'0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 =
16 17 18 19 20 21 22 23 24 25 26
>  sig_num_init=3D'0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16=
, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 3=
5, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, =
54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
>  sig_size=3D'69'
>  signal_t=3D'void'
> -sitearch=3D'@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
> -sitearchexp=3D'@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
> +sitearch=3D'@LIBDIR@/perl/site_perl/5.28.0/@ARCH@-thread-multi'
> +sitearchexp=3D'@LIBDIR@/perl/site_perl/5.28.0/@ARCH@-thread-multi'
>  sitebin=3D'@USRBIN@'
>  sitebinexp=3D'@USRBIN@'
>  sitehtml1dir=3D''
>  sitehtml1direxp=3D''
>  sitehtml3dir=3D''
>  sitehtml3direxp=3D''
> -sitelib=3D'@LIBDIR@/perl/site_perl/5.24.4'
> +sitelib=3D'@LIBDIR@/perl/site_perl/5.28.0'
>  sitelib_stem=3D'@LIBDIR@/perl/site_perl'
> -sitelibexp=3D'@LIBDIR@/perl/site_perl/5.24.4'
> -siteman1dir=3D''
> -siteman1direxp=3D''
> -siteman3dir=3D''
> -siteman3direxp=3D''
> +sitelibexp=3D'@LIBDIR@/perl/site_perl/5.28.0'
> +siteman1dir=3D'@MANDIR@/man1'
> +siteman1direxp=3D'@MANDIR@/man1'
> +siteman3dir=3D'@MANDIR@/man3'
> +siteman3direxp=3D'@MANDIR@/man3'
>  siteprefix=3D'@EXECPREFIX@'
>  siteprefixexp=3D'@EXECPREFIX@'
>  sitescript=3D'@USRBIN@'
> @@ -1182,27 +1217,27 @@ uvtype=3D'unsigned long'
>  uvuformat=3D'"lu"'
>  uvxformat=3D'"lx"'
>  vaproto=3D'define'
> -vendorarch=3D'@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
> -vendorarchexp=3D'@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
> +vendorarch=3D'@LIBDIR@/perl/vendor_perl/5.28.0/@ARCH@-thread-multi'
> +vendorarchexp=3D'@LIBDIR@/perl/vendor_perl/5.28.0/@ARCH@-thread-multi'
>  vendorbin=3D'@USRBIN@'
>  vendorbinexp=3D'@USRBIN@'
>  vendorhtml1dir=3D' '
>  vendorhtml1direxp=3D''
>  vendorhtml3dir=3D' '
>  vendorhtml3direxp=3D''
> -vendorlib=3D'@LIBDIR@/perl/vendor_perl/5.24.4'
> +vendorlib=3D'@LIBDIR@/perl/vendor_perl/5.28.0'
>  vendorlib_stem=3D'@LIBDIR@/perl/vendor_perl'
> -vendorlibexp=3D'@LIBDIR@/perl/vendor_perl/5.24.4'
> -vendorman1dir=3D' '
> -vendorman1direxp=3D''
> -vendorman3dir=3D' '
> -vendorman3direxp=3D''
> +vendorlibexp=3D'@LIBDIR@/perl/vendor_perl/5.28.0'
> +vendorman1dir=3D'@MANDIR@/man1'
> +vendorman1direxp=3D'@MANDIR@/man1'
> +vendorman3dir=3D'@MANDIR@/man3'
> +vendorman3direxp=3D'@MANDIR@/man3'
>  vendorprefix=3D'@EXECPREFIX@'
>  vendorprefixexp=3D'@EXECPREFIX@'
>  vendorscript=3D'@USRBIN@'
>  vendorscriptexp=3D'@USRBIN@'
> -version=3D'5.24.4'
> -version_patchlevel_string=3D'version 24 subversion 4'
> +version=3D'5.28.0'
> +version_patchlevel_string=3D'version 28 subversion 0'
>  versiononly=3D'undef'
>  vi=3D''
>  xlibpth=3D'@LIBDIR@/386 @BASELIBDIR@386'
> @@ -1211,11 +1246,11 @@ yaccflags=3D''
>  zcat=3D''
>  zip=3D'zip'
>  PERL_REVISION=3D5
> -PERL_VERSION=3D24
> -PERL_SUBVERSION=3D4
> +PERL_VERSION=3D28
> +PERL_SUBVERSION=3D0
>  PERL_API_REVISION=3D5
> -PERL_API_VERSION=3D24
> -PERL_API_SUBVERSION=3D4
> +PERL_API_VERSION=3D28
> +PERL_API_SUBVERSION=3D0
>  PERL_PATCHLEVEL=3D''
>  PERL_CONFIG_SH=3Dtrue
>  : Variables propagated from previous config.sh file.
> diff --git a/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dir=
s.diff b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
> index c597701cad..f7bf2bf20b 100644
> --- a/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
> @@ -1,4 +1,4 @@
> -From d33d46963035ef726144dc66be2ae9c00aec0333 Mon Sep 17 00:00:00 2001
> +From 6412061580f67c9f4dcfdac0a9fbdf9fd007f410 Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Tue, 16 Oct 2012 23:07:56 +0300
>  Subject: Fix CPAN::FirstTime defaults with nonexisting site dirs if a pa=
rent
> @@ -13,16 +13,15 @@ explicitly tell CPAN not to touch those with INSTALLD=
IRS=3Dsite.
>
>  Bug-Debian: http://bugs.debian.org/688842
>  Patch-Name: debian/cpan-missing-site-dirs.diff
> -Upstream-Status: Pending
>  ---
>   cpan/CPAN/lib/CPAN/FirstTime.pm | 31 +++++++++++++++++++++++++++----
>   1 file changed, 27 insertions(+), 4 deletions(-)
>
>  diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstT=
ime.pm
> -index 33054cd..7b0becf 100644
> +index cdf1dc220..bdb7899bb 100644
>  --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
>  +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
> -@@ -2057,11 +2057,34 @@ sub _print_urllist {
> +@@ -2067,11 +2067,34 @@ sub _print_urllist {
>       };
>   }
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.d=
iff b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
> index 572f149514..6cd54faa54 100644
> --- a/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
> @@ -1,4 +1,4 @@
> -From 5ff1f21484aab68efe321ff4ba5d35928f72af96 Mon Sep 17 00:00:00 2001
> +From 1f1540c0b81f3eed4d6ac9d64cc8d0688ecb7513 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Provide a sensible INSTALLDIRS default for modules installed fr=
om
> @@ -9,16 +9,15 @@ explicitly in Makefile.PL or Build.PL.  This makes sens=
e for the normal @INC
>  ordering, but not ours.
>
>  Patch-Name: debian/cpan_definstalldirs.diff
> -Upstream-Status: Pending
>  ---
>   cpan/CPAN/lib/CPAN/FirstTime.pm | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstT=
ime.pm
> -index 918e009..33054cd 100644
> +index 49fa8ab7b..cdf1dc220 100644
>  --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
>  +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
> -@@ -1024,7 +1024,7 @@ sub init {
> +@@ -1033,7 +1033,7 @@ sub init {
>       my_prompt_loop(prefer_installer =3D> 'MB', $matcher, 'MB|EUMM|RAND'=
);
>
>       if (!$matcher or 'makepl_arg make_arg' =3D~ /$matcher/) {
> @@ -27,7 +26,7 @@ index 918e009..33054cd 100644
>           my_dflt_prompt(make_arg =3D> "", $matcher);
>           if ( $CPAN::Config->{makepl_arg} =3D~ /LIBS=3D|INC=3D/ ) {
>               $CPAN::Frontend->mywarn(
> -@@ -1056,7 +1056,7 @@ sub init {
> +@@ -1065,7 +1065,7 @@ sub init {
>       my_dflt_prompt(make_install_arg =3D> $CPAN::Config->{make_arg} || "=
",
>                      $matcher);
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff b/me=
ta/recipes-devtools/perl/perl/debian/db_file_ver.diff
> index 0861650eb6..57c6c5d20a 100644
> --- a/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
> @@ -1,4 +1,4 @@
> -From 01421f8a80d5c623959695ba2b8167f30112d333 Mon Sep 17 00:00:00 2001
> +From fa11b04bd5ce7b59263c3842b6c4f730a808166d Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Fri, 16 Dec 2005 01:32:14 +1100
>  Subject: Remove overly restrictive DB_File version check.
> @@ -8,13 +8,12 @@ Bug-Debian: http://bugs.debian.org/340047
>  Package dependencies ensure the correct library is linked at run-time.
>
>  Patch-Name: debian/db_file_ver.diff
> -Upstream-Status: Pending
>  ---
>   cpan/DB_File/version.c | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/cpan/DB_File/version.c b/cpan/DB_File/version.c
> -index e01f6f6..544e6ee 100644
> +index e01f6f6fa..544e6ee8f 100644
>  --- a/cpan/DB_File/version.c
>  +++ b/cpan/DB_File/version.c
>  @@ -48,6 +48,7 @@ __getBerkeleyDBInfo()
> diff --git a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.di=
ff b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
> index c2ac4a3bdf..732941e9b1 100644
> --- a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
> @@ -1,30 +1,19 @@
> -From def4aa3817f98aae625e601b791ef068276f05d5 Mon Sep 17 00:00:00 2001
> +From 0bc0d1fd494b909825256f169acdddd3551622db Mon Sep 17 00:00:00 2001
>  From: Dominic Hargreaves <dom@earth.li>
>  Date: Mon, 17 May 2010 13:23:07 +0300
>  Subject: Point users to Debian packages of deprecated core modules
>
>  Bug-Debian: http://bugs.debian.org/747628
> -
> -Several modules are being deprecated with perl 5.20.
> -To get a clean transition, perl/perl-modules is going to recommend the
> -separate Debian packages of these for one release cycle so that they wil=
l be
> -pulled in by default on upgrades. This is taking place for perl 5.20/jes=
sie.
> -
> -However, on systems configured to ignore recommendations the deprecation
> -warnings will still be useful, so modify them slightly to point to the
> -separate packages instead.
> -
>  Patch-Name: debian/deprecate-with-apt.diff
> -Upstream-Status: Pending
>  ---
> - lib/deprecate.pm | 15 ++++++++++++++-
> - 1 file changed, 14 insertions(+), 1 deletion(-)
> + lib/deprecate.pm | 18 +++++++++++++++++-
> + 1 file changed, 17 insertions(+), 1 deletion(-)
>
>  diff --git a/lib/deprecate.pm b/lib/deprecate.pm
> -index 47bc112..b0c61df 100644
> +index 47bc11253..01d48fa6c 100644
>  --- a/lib/deprecate.pm
>  +++ b/lib/deprecate.pm
> -@@ -7,6 +7,13 @@ our $VERSION =3D 0.03;
> +@@ -7,6 +7,16 @@ our $VERSION =3D 0.03;
>   our %Config;
>   unless (%Config) { require Config; *Config =3D \%Config::Config; }
>
> @@ -32,13 +21,16 @@ index 47bc112..b0c61df 100644
>  +# deprecated modules where available
>  +
>  +our %DEBIAN_PACKAGES =3D (
> -+    # None for the perl 5.22 cycle
> ++    'B::Debug'         =3D> 'libb-debug-perl',
> ++    'Locale::Codes'    =3D> 'liblocale-codes-perl',
> ++    'Locale::Country'  =3D> 'liblocale-codes-perl',
> ++    'Locale::Language' =3D> 'liblocale-codes-perl',
>  +);
>  +
>   # This isn't a public API. It's internal to code maintained by the perl=
-porters
>   # If you would like it to be a public API, please send a patch with
>   # documentation and tests. Until then, it may change without warning.
> -@@ -58,9 +65,15 @@ EOM
> +@@ -58,9 +68,15 @@ EOM
>         if (defined $callers_bitmask
>             && (vec($callers_bitmask, $warnings::Offsets{deprecated}, 1)
>                 || vec($callers_bitmask, $warnings::Offsets{all}, 1))) {
> diff --git a/meta/recipes-devtools/perl/perl/debian/disable-stack-check.d=
iff b/meta/recipes-devtools/perl/perl/debian/disable-stack-check.diff
> new file mode 100644
> index 0000000000..8f114eb433
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/disable-stack-check.diff
> @@ -0,0 +1,64 @@
> +From 004b7299d16b24e8dbd24dc92eec048484aed8cf Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Mon, 16 Jul 2018 10:12:37 +0300
> +Subject: Disable debugperl stack extension checks for binary compatibili=
ty
> + with perl
> +
> +When an XS module is built without -DDEBUGGING but the interpreter is,
> +the debugging stack high-water mark checking on the interpreter side
> +doesn't work properly. This makes /usr/bin/debugperl less useful than
> +it could be as it can no longer use many XS module packages.
> +
> +Patch the check away for now. We hope upstream will provide a Configure
> +option for this in the future.
> +
> +Bug: https://rt.perl.org/Ticket/Display.html?id=3D133327
> +Bug-Debian: https://bugs.debian.org/902779
> +Patch-Name: debian/disable-stack-check.diff
> +---
> + dump.c   | 3 +++
> + pp_hot.c | 3 +++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/dump.c b/dump.c
> +index 227eb996e..4e1c594ce 100644
> +--- a/dump.c
> ++++ b/dump.c
> +@@ -2500,6 +2500,8 @@ Perl_runops_debug(pTHX)
> +         ++PL_op_exec_cnt[PL_op->op_type];
> + #endif
> + #if defined DEBUGGING && !defined DEBUGGING_RE_ONLY
> ++/* disabled on Debian due to https://bugs.debian.org/902779 */
> ++#ifndef DEBIAN
> +         if (PL_curstackinfo->si_stack_hwm < PL_stack_sp - PL_stack_base=
)
> +             Perl_croak_nocontext(
> +                 "panic: previous op failed to extend arg stack: "
> +@@ -2507,6 +2509,7 @@ Perl_runops_debug(pTHX)
> +                     PL_stack_base, PL_stack_sp,
> +                     PL_stack_base + PL_curstackinfo->si_stack_hwm);
> +         PL_curstackinfo->si_stack_hwm =3D PL_stack_sp - PL_stack_base;
> ++#endif
> + #endif
> +       if (PL_debug) {
> +             ENTER;
> +diff --git a/pp_hot.c b/pp_hot.c
> +index 56e3cbe6e..f4e1ae726 100644
> +--- a/pp_hot.c
> ++++ b/pp_hot.c
> +@@ -5232,6 +5232,8 @@ PP(pp_entersub)
> +       CvXSUB(cv)(aTHX_ cv);
> +
> + #if defined DEBUGGING && !defined DEBUGGING_RE_ONLY
> ++/* disabled on Debian due to https://bugs.debian.org/902779 */
> ++#ifndef DEBIAN
> +         /* This duplicates the check done in runops_debug(), but provid=
es more
> +          * information in the common case of the fault being with an XS=
UB.
> +          *
> +@@ -5245,6 +5247,7 @@ PP(pp_entersub)
> +                     HvNAME(GvSTASH(CvGV(cv))), GvNAME(CvGV(cv)), CvFILE=
(cv),
> +                     PL_stack_base, PL_stack_sp,
> +                     PL_stack_base + PL_curstackinfo->si_stack_hwm);
> ++#endif
> + #endif
> +       /* Enforce some sanity in scalar context. */
> +       if (is_scalar) {
> diff --git a/meta/recipes-devtools/perl/perl/debian/doc_info.diff b/meta/=
recipes-devtools/perl/perl/debian/doc_info.diff
> index 4662ecdaa7..3df23a014a 100644
> --- a/meta/recipes-devtools/perl/perl/debian/doc_info.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/doc_info.diff
> @@ -1,4 +1,4 @@
> -From e18f81e69c55d698abd293e71063d6b6b275cc07 Mon Sep 17 00:00:00 2001
> +From 952a08ddad7fe20182890283a1ca5a5d14556ceb Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Fri, 18 Mar 2005 22:22:25 +1100
>  Subject: Replace generic man(1) instructions with Debian-specific inform=
ation.
> @@ -6,16 +6,15 @@ Subject: Replace generic man(1) instructions with Debia=
n-specific information.
>  Indicate that the user needs to install the perl-doc package.
>
>  Patch-Name: debian/doc_info.diff
> -Upstream-Status: Pending
>  ---
>   pod/perl.pod | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
>  diff --git a/pod/perl.pod b/pod/perl.pod
> -index 364e957..f97e103 100644
> +index 15c6b4427..287a7ec94 100644
>  --- a/pod/perl.pod
>  +++ b/pod/perl.pod
> -@@ -291,8 +291,16 @@ aux c2ph h2ph h2xs perlbug pl2pm pod2html pod2man s=
plain xsubpp
> +@@ -294,8 +294,16 @@ aux h2ph h2xs perlbug pl2pm pod2html pod2man splain=
 xsubpp
>
>   =3Dfor buildtoc __END__
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff b/met=
a/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
> index b3bd58c1d1..8f8f6327d6 100644
> --- a/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
> @@ -1,4 +1,4 @@
> -From 7fe59a3d0601c6d8634eae4f99dae3024cd02a92 Mon Sep 17 00:00:00 2001
> +From 9cdc7cf2d8bc41c749b00887f44380a95c542006 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Tweak enc2xs to follow symlinks and ignore missing @INC directo=
ries.
> @@ -11,17 +11,16 @@ Bug-Debian: http://bugs.debian.org/290336
>    issues with follow =3D> 1 (see #603686 and [rt.cpan.org #64585])
>
>  Patch-Name: debian/enc2xs_inc.diff
> -Upstream-Status: Pending
>  ---
>   cpan/Encode/bin/enc2xs | 8 ++++----
>   t/porting/customized.t | 3 +++
>   2 files changed, 7 insertions(+), 4 deletions(-)
>
>  diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
> -index 19f2b2b..4d64e38 100644
> +index 619b64b75..050c863ef 100644
>  --- a/cpan/Encode/bin/enc2xs
>  +++ b/cpan/Encode/bin/enc2xs
> -@@ -944,11 +944,11 @@ use vars qw(
> +@@ -1013,11 +1013,11 @@ use vars qw(
>   sub find_e2x{
>       eval { require File::Find; };
>       my (@inc, %e2x_dir);
> @@ -35,7 +34,7 @@ index 19f2b2b..4d64e38 100644
>            my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
>                $atime,$mtime,$ctime,$blksize,$blocks)
>                =3D lstat($_) or return;
> -@@ -958,7 +958,7 @@ sub find_e2x{
> +@@ -1027,7 +1027,7 @@ sub find_e2x{
>                $e2x_dir{$File::Find::dir} ||=3D $mtime;
>            }
>            return;
> @@ -44,7 +43,7 @@ index 19f2b2b..4d64e38 100644
>       warn join("\n", keys %e2x_dir), "\n";
>       for my $d (sort {$e2x_dir{$a} <=3D> $e2x_dir{$b}} keys %e2x_dir){
>       $_E2X =3D $d;
> -@@ -1025,7 +1025,7 @@ sub make_configlocal_pm {
> +@@ -1091,7 +1091,7 @@ sub make_configlocal_pm {
>             $LocalMod{$enc} ||=3D $mod;
>         }
>       };
> @@ -54,10 +53,10 @@ index 19f2b2b..4d64e38 100644
>       for my $enc ( sort keys %LocalMod ) {
>           $_ModLines .=3D
>  diff --git a/t/porting/customized.t b/t/porting/customized.t
> -index 45fcafb..3bd6adb 100644
> +index d425e5b77..d906a8255 100644
>  --- a/t/porting/customized.t
>  +++ b/t/porting/customized.t
> -@@ -101,8 +101,11 @@ foreach my $module ( sort keys %Modules ) {
> +@@ -108,8 +108,11 @@ foreach my $module ( sort keys %Modules ) {
>         print $data_fh join(' ', $module, $file, $id), "\n";
>         next;
>       }
> diff --git a/meta/recipes-devtools/perl/perl/debian/errno-include-path.di=
ff b/meta/recipes-devtools/perl/perl/debian/errno-include-path.diff
> new file mode 100644
> index 0000000000..1ab789fadb
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/errno-include-path.diff
> @@ -0,0 +1,75 @@
> +From c8fbc6bea13f34bc938c5e0f220fab5ab6dada2c Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Sat, 17 Nov 2018 19:27:42 +0200
> +Subject: Make Errno_pm.PL compatible with /usr/include/<ARCH>/errno.h
> +
> +As seen in <https://bugs.debian.org/798955>, Debian glibc
> +maintainers intend to move system header files from /usr/include to
> +/usr/include/<arch> at some point. This would break Errno_pm.PL, which
> +has logic for asking cpp for the location of errno.h but fails earlier
> +if errno.h is not on a list of known paths.
> +
> +Take the cpp fallback instead of dying. The behaviour should stay
> +identical as long as errno.h is not moved.
> +
> +This will also enable multiarch (non-sysroot) cross builds.
> +
> +Original patch by Helmut Grohne.
> +
> +Bug-Debian: https://bugs.debian.org/875921
> +Patch-Name: debian/errno-include-path.diff
> +---
> + ext/Errno/Errno_pm.PL | 24 ++++++++++++++----------
> + 1 file changed, 14 insertions(+), 10 deletions(-)
> +
> +diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
> +index 6a0031f0f..9d1454c96 100644
> +--- a/ext/Errno/Errno_pm.PL
> ++++ b/ext/Errno/Errno_pm.PL
> +@@ -2,7 +2,7 @@ use ExtUtils::MakeMaker;
> + use Config;
> + use strict;
> +
> +-our $VERSION =3D "1.29";
> ++our $VERSION =3D "1.30";
> +
> + my %err =3D ();
> +
> +@@ -111,6 +111,17 @@ sub default_cpp {
> +
> + sub get_files {
> +     my %file =3D ();
> ++    # When cross-compiling we may store a path for gcc's "sysroot" opti=
on:
> ++    my $sysroot =3D $Config{sysroot} || '';
> ++    my $linux_errno_h;
> ++    if ($^O eq 'linux') {
> ++      # Some Linuxes have weird errno.hs which generate
> ++      # no #file or #line directives
> ++      ($linux_errno_h) =3D grep { -e $_ } map { "$_/errno.h" }
> ++          "$sysroot/usr/include", "$sysroot/usr/local/include",
> ++          split / / =3D> $Config{locincpth};
> ++    }
> ++
> +     # VMS keeps its include files in system libraries
> +     if ($^O eq 'VMS') {
> +       $file{'Sys$Library:DECC$RTLDEF.TLB'} =3D 1;
> +@@ -125,17 +136,10 @@ sub get_files {
> +       }
> +     } elsif ($^O eq 'linux' &&
> +             $Config{gccversion} ne '' &&
> +-            $Config{gccversion} !~ /intel/i
> ++            $Config{gccversion} !~ /intel/i &&
> +             # might be using, say, Intel's icc
> ++            $linux_errno_h
> +            ) {
> +-    # When cross-compiling we may store a path for gcc's "sysroot" opti=
on:
> +-    my $sysroot =3D $Config{sysroot} || '';
> +-      # Some Linuxes have weird errno.hs which generate
> +-      # no #file or #line directives
> +-      my ($linux_errno_h) =3D grep { -e $_ } map { "$_/errno.h" }
> +-          "$sysroot/usr/include", "$sysroot/usr/local/include",
> +-          split / / =3D> $Config{locincpth} or
> +-              die "Cannot find errno.h";
> +       $file{$linux_errno_h} =3D 1;
> +     } elsif ($^O eq 'haiku') {
> +       # hidden in a special place
> diff --git a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff b/meta=
/recipes-devtools/perl/perl/debian/errno_ver.diff
> index a965fbeeec..d43178d39a 100644
> --- a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
> @@ -1,8 +1,8 @@
> -From 8e1efba7560d8d55524c7a0f1b0539ddce419b86 Mon Sep 17 00:00:00 2001
> +From 103570c5b872ff6040abde11e9968998fc765558 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Fri, 16 Dec 2005 01:32:14 +1100
> -Subject: [PATCH 6/8] Remove Errno version check due to upgrade problems =
with
> - long-running processes.
> +Subject: Remove Errno version check due to upgrade problems with long-ru=
nning
> + processes.
>
>  Bug-Debian: http://bugs.debian.org/343351
>
> @@ -11,27 +11,34 @@ processes embedding perl when upgrading to a newer ve=
rsion,
>  compatible, but built on a different machine.
>
>  Patch-Name: debian/errno_ver.diff
> -Upstream-Status: Pending
>  ---
> - ext/Errno/Errno_pm.PL | 5 -----
> - 1 file changed, 5 deletions(-)
> + ext/Errno/Errno_pm.PL | 16 ----------------
> + 1 file changed, 16 deletions(-)
>
>  diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
> -index 6251a3c..eeed445 100644
> +index d565f31b2..6a0031f0f 100644
>  --- a/ext/Errno/Errno_pm.PL
>  +++ b/ext/Errno/Errno_pm.PL
> -@@ -294,11 +294,6 @@ EDQ
> -     # they've already declared perl doesn't need to worry about this ri=
sk.
> -     if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
> -         print <<"CONFIG_CHECK_END";
> +@@ -288,22 +288,6 @@ package Errno;
> + require Exporter;
> + use strict;
> +
> +-EDQ
> +-
> +-    # Errno only needs Config to make sure it hasn't changed platforms.
> +-    # If someone set $ENV{PERL_BUILD_EXPAND_CONFIG_VARS} at build time,
> +-    # they've already declared perl doesn't need to worry about this ri=
sk.
> +-    if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
> +-        print <<"CONFIG_CHECK_END";
>  -use Config;
>  -"\$Config{'archname'}-\$Config{'osvers'}" eq
>  -"$archname-$Config{'osvers'}" or
>  -      die "Errno architecture ($archname-$Config{'osvers'}) does not ma=
tch executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
>  -
> - CONFIG_CHECK_END
> - }
> -
> ---
> -2.1.4
> -
> +-CONFIG_CHECK_END
> +-}
> +-
> +-    print <<"EDQ";
> + our \$VERSION =3D "$VERSION";
> + \$VERSION =3D eval \$VERSION;
> + our \@ISA =3D 'Exporter';
> diff --git a/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_=
path.diff b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_pat=
h.diff
> index e023038f04..9d1f514ac7 100644
> --- a/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.di=
ff
> +++ b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.di=
ff
> @@ -1,4 +1,4 @@
> -From 431275078b0490d2e092442d9582be06bb95b354 Mon Sep 17 00:00:00 2001
> +From b4fc1fe7acbc88c275a36598814356d17485a32f Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Sat, 10 May 2014 23:34:14 +0300
>  Subject: EU:MM: set location of libperl.a under /usr/lib
> @@ -7,17 +7,15 @@ The Debian packaging moves libperl.a a couple of levels=
 up from the
>  CORE directory to match other static libraries.
>
>  Patch-Name: debian/extutils_set_libperl_path.diff
> -Upstream-Status: Pending
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
> - pp.c                                            | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 5f1b87f..570a631 100644
> +index dbb8651a9..780e390cd 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2505,7 +2505,7 @@ MAP_PRELIBS   =3D $Config{perllibs} $Config{cryptl=
ib}
> +@@ -2564,7 +2564,7 @@ MAP_PRELIBS   =3D $Config{perllibs} $Config{cryptl=
ib}
>         ($lperl =3D $libperl) =3D~ s/\$\(A\)/$self->{LIB_EXT}/;
>       }
>       unless ($libperl && -f $lperl) { # Ilya's code...
> @@ -26,13 +24,3 @@ index 5f1b87f..570a631 100644
>         $dir =3D "$self->{PERL_ARCHLIB}/.." if $self->{UNINSTALLED_PERL};
>         $libperl ||=3D "libperl$self->{LIB_EXT}";
>         $libperl   =3D "$dir/$libperl";
> -diff --git a/pp.c b/pp.c
> -index 42f156a..77c1279 100644
> ---- a/pp.c
> -+++ b/pp.c
> -@@ -1,4 +1,4 @@
> --/*    pp.c
> -+ /*    pp.c
> -  *
> -  *    Copyright (C) 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 199=
9, 2000,
> -  *    2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 by Larry Wall and =
others
> diff --git a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff b/meta/=
recipes-devtools/perl/perl/debian/fakeroot.diff
> index bdf34d1859..8a044d0bd4 100644
> --- a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
> @@ -1,4 +1,4 @@
> -From 27ae7b18078d801a2c943aa6de2f7e9808177251 Mon Sep 17 00:00:00 2001
> +From d64f7ac7296e94ee1f900eb32a986adc48539d26 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Fri, 18 Mar 2005 22:22:25 +1100
>  Subject: Postpone LD_LIBRARY_PATH evaluation to the binary targets.
> @@ -11,16 +11,15 @@ since fakeroot (which now sets LD_LIBRARY_PATH) is no=
t used for the "build"
>  rule where the Makefile is created, but is for the clean/binary* targets=
.
>
>  Patch-Name: debian/fakeroot.diff
> -Upstream-Status: Pending
>  ---
>   Makefile.SH | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
>  diff --git a/Makefile.SH b/Makefile.SH
> -index 034d812..04dd7d5 100755
> +index 123903dcb..376a1a48c 100755
>  --- a/Makefile.SH
>  +++ b/Makefile.SH
> -@@ -39,10 +39,7 @@ case "$useshrplib" in
> +@@ -48,10 +48,7 @@ case "$useshrplib" in
>   true)
>         # Prefix all runs of 'miniperl' and 'perl' with
>         # $ldlibpth so that ./perl finds *this* shared libperl.
> @@ -32,7 +31,7 @@ index 034d812..04dd7d5 100755
>
>         pldlflags=3D"$cccdlflags"
>         static_ldflags=3D''
> -@@ -113,7 +110,7 @@ true)
> +@@ -122,7 +119,7 @@ true)
>             ;;
>         esac
>         case "$ldlibpthname" in
> diff --git a/meta/recipes-devtools/perl/perl/debian/find_html2text.diff b=
/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
> index 082709140d..29919123c3 100644
> --- a/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
> @@ -1,4 +1,4 @@
> -From c81dbdedff9e9b4fb75ac028aa718838c0292d2f Mon Sep 17 00:00:00 2001
> +From 8887509fd13dbc488b6c867f00966b5c9b42cffd Mon Sep 17 00:00:00 2001
>  From: Andreas Marschke <andreas.marschke@googlemail.com>
>  Date: Sat, 17 Sep 2011 11:38:42 +0100
>  Subject: Configure CPAN::Distribution with correct name of html2text
> @@ -16,16 +16,15 @@ Please see the attached patch for a quick fix of this=
 issue.
>  [Maintainer's note: html2text in Debian is not the same implementation
>  as the html2text.pl which is expected, but should provide similar
>  functionality].
> -Upstream-Status: Pending
>  ---
>   cpan/CPAN/lib/CPAN/Distribution.pm | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/cpan/CPAN/lib/CPAN/Distribution.pm b/cpan/CPAN/lib/CPAN/Dis=
tribution.pm
> -index 092b781..5c2bae1 100644
> +index 72101afc7..9f896584d 100644
>  --- a/cpan/CPAN/lib/CPAN/Distribution.pm
>  +++ b/cpan/CPAN/lib/CPAN/Distribution.pm
> -@@ -4099,7 +4099,7 @@ sub _display_url {
> +@@ -4149,7 +4149,7 @@ sub _display_url {
>         if $CPAN::DEBUG;
>
>       # should we define it in the config instead?
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/document_makema=
ker_ccflags.diff b/meta/recipes-devtools/perl/perl/debian/fixes/document_ma=
kemaker_ccflags.diff
> index f3d92583e3..70a5e0b959 100644
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccf=
lags.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccf=
lags.diff
> @@ -1,4 +1,4 @@
> -From 9faf6dcc3a5c4154484d812eb3cc3dd78b35563b Mon Sep 17 00:00:00 2001
> +From 55f6b9e6458ba913cbf0ed4ee05a3ca55b4c811d Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Mon, 30 May 2011 22:54:24 +0300
>  Subject: Document that CCFLAGS should include $Config{ccflags}
> @@ -10,16 +10,15 @@ Compiling XS extensions without $Config{ccflags} can =
break the
>  binary interface on some platforms.
>
>  Patch-Name: fixes/document_makemaker_ccflags.diff
> -Upstream-Status: Pending
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 4 ++++
>   1 file changed, 4 insertions(+)
>
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/Ex=
tUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
> -index fe95b27..90403e8 100644
> +index 90d9eac49..81bdc9664 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
> -@@ -1774,6 +1774,10 @@ currently used by MakeMaker but may be handy in M=
akefile.PLs.
> +@@ -1838,6 +1838,10 @@ currently used by MakeMaker but may be handy in M=
akefile.PLs.
>   String that will be included in the compiler call command line between
>   the arguments INC and OPTIMIZE.
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.d=
iff b/meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.diff
> new file mode 100644
> index 0000000000..f9b8e05d79
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.diff
> @@ -0,0 +1,124 @@
> +From 5ddabbc5bacff10739e01750304255d1b360c610 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Dagfinn=3D20Ilmari=3D20Manns=3DC3=3DA5ker?=3D <ilmari@=
ilmari.org>
> +Date: Tue, 13 Nov 2018 16:00:48 +0000
> +Subject: Avoid mangling /bin non-perl shebangs on merged-/usr systems
> +
> +If the shebang is absolute and exists in PATH, but was not the first
> +one found, leave it alone if it's actually the same file as first one.
> +
> +This avoids packages built on merged-/usr systems with /usr/bin before
> +/bin in the path breaking when installed on systems without merged
> +/usr.  See e.g. https://bugs.debian.org/913637.
> +
> +Origin: backport, https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMa=
ker/commit/9766f9c5ffd1ac915d75b309cd18c9f42794b710
> +Bug: https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/330
> +Bug-Debian: https://bugs.debian.org/913637
> +Patch-Name: fixes/eumm-usrmerge.diff
> +---
> + .../lib/ExtUtils/MM_Unix.pm                   | 22 +++++++++++--
> + cpan/ExtUtils-MakeMaker/t/fixin.t             | 33 ++++++++++++++++++-
> + .../t/lib/MakeMaker/Test/Setup/BFD.pm         |  3 ++
> + 3 files changed, 55 insertions(+), 3 deletions(-)
> +
> +diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +index bb41b274b..2e33d0a8a 100644
> +--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> ++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +@@ -1243,8 +1243,8 @@ sub _fixin_replace_shebang {
> +     my ( $self, $file, $line ) =3D @_;
> +
> +     # Now figure out the interpreter name.
> +-    my ( $cmd, $arg ) =3D split ' ', $line, 2;
> +-    $cmd =3D~ s!^.*/!!;
> ++    my ( $origcmd, $arg ) =3D split ' ', $line, 2;
> ++    (my $cmd =3D $origcmd) =3D~ s!^.*/!!;
> +
> +     # Now look (in reverse) for interpreter in absolute PATH (unless pe=
rl).
> +     my $interpreter;
> +@@ -1270,6 +1270,24 @@ sub _fixin_replace_shebang {
> +                 $interpreter =3D $maybefile;
> +             }
> +         }
> ++
> ++        # If the shebang is absolute and exists in PATH, but was not
> ++        # the first one found, leave it alone if it's actually the
> ++        # same file as first one.  This avoids packages built on
> ++        # merged-/usr systems with /usr/bin before /bin in the path
> ++        # breaking when installed on systems without merged /usr
> ++        if ($origcmd ne $interpreter and $self->file_name_is_absolute($=
origcmd)) {
> ++            my $origdir =3D dirname($origcmd);
> ++            if ($self->maybe_command($origcmd) && grep { $_ eq $origdir=
 } @absdirs) {
> ++                my ($odev, $oino) =3D stat $origcmd;
> ++                my ($idev, $iino) =3D stat $interpreter;
> ++                if ($odev =3D=3D $idev && $oino =3D=3D $iino) {
> ++                    warn "$origcmd is the same as $interpreter, leaving=
 alone"
> ++                        if $Verbose;
> ++                    $interpreter =3D $origcmd;
> ++                }
> ++            }
> ++        }
> +     }
> +
> +     # Figure out how to invoke interpreter on this machine.
> +diff --git a/cpan/ExtUtils-MakeMaker/t/fixin.t b/cpan/ExtUtils-MakeMaker=
/t/fixin.t
> +index 061e45624..872b023c5 100644
> +--- a/cpan/ExtUtils-MakeMaker/t/fixin.t
> ++++ b/cpan/ExtUtils-MakeMaker/t/fixin.t
> +@@ -9,7 +9,7 @@ BEGIN {
> +
> + use File::Spec;
> +
> +-use Test::More tests =3D> 22;
> ++use Test::More tests =3D> 30;
> +
> + use Config;
> + use TieOut;
> +@@ -123,3 +123,34 @@ END
> +         }
> +     );
> + }
> ++
> ++SKIP: {
> ++    eval { chmod(0755, "usrbin/interp") }
> ++        or skip "no chmod", 8;
> ++
> ++    my $dir =3D getcwd();
> ++    local $ENV{PATH} =3D join $Config{path_sep}, map "$dir/$_", qw(usrb=
in bin);
> ++
> ++    test_fixin(<<END,
> ++#!$dir/bin/interp
> ++
> ++blah blah blah
> ++END
> ++         sub {
> ++             is $_[0], "#!$dir/usrbin/interp\n", 'interpreter updated t=
o one found in PATH';
> ++         }
> ++     );
> ++
> ++    eval { symlink("../usrbin/interp", "bin/interp") }
> ++        or skip "no symlinks", 4;
> ++
> ++    test_fixin(<<END,
> ++#!$dir/bin/interp
> ++
> ++blah blah blah
> ++END
> ++         sub {
> ++             is $_[0], "#!$dir/bin/interp\n", 'symlinked interpreter la=
ter in PATH not mangled';
> ++         }
> ++     );
> ++}
> +diff --git a/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm b=
/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm
> +index 3d093fcfb..cfe49e546 100644
> +--- a/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm
> ++++ b/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm
> +@@ -53,6 +53,9 @@ program - this is a program
> + =3Dcut
> +
> + 1;
> ++END
> ++             'Big-Dummy/usrbin/interp'       =3D> <<'END',
> ++This is a dummy interpreter
> + END
> +
> +              'Big-Dummy/test.pl'          =3D> <<'END',
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/in-place-edit-h=
andles.diff b/meta/recipes-devtools/perl/perl/debian/fixes/in-place-edit-ha=
ndles.diff
> new file mode 100644
> index 0000000000..234e13eec0
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/in-place-edit-handles.=
diff
> @@ -0,0 +1,99 @@
> +From 2af03991e0d4f74de9e0982825ac0db380d783c2 Mon Sep 17 00:00:00 2001
> +From: Tony Cook <tony@develop-help.com>
> +Date: Mon, 2 Jul 2018 10:43:19 +1000
> +Subject: (perl #133314) always close the directory handle on clean up
> +
> +Previously the directory handle was only closed if the rest of the
> +magic free clean up is done, but in most success cases that code
> +doesn't run, leaking the directory handle.
> +
> +So always close the directory if our AV is available.
> +
> +Patch-Name: fixes/in-place-edit-handles.diff
> +Bug: https://rt.perl.org/Public/Bug/Display.html?id=3D133314
> +Bug-Debian: https://bugs.debian.org/902925
> +Origin: upstream, https://perl5.git.perl.org/perl.git/commit/3d5e9c119db=
6b727684fe75dfcfe5831c4351bec
> +---
> + doio.c | 56 +++++++++++++++++++++++++++++++-------------------------
> + 1 file changed, 31 insertions(+), 25 deletions(-)
> +
> +diff --git a/doio.c b/doio.c
> +index 4b8923f77..16daf9fd1 100644
> +--- a/doio.c
> ++++ b/doio.c
> +@@ -1163,44 +1163,50 @@ S_argvout_free(pTHX_ SV *io, MAGIC *mg) {
> +
> +     /* mg_obj can be NULL if a thread is created with the handle open, =
in which
> +      case we leave any clean up to the parent thread */
> +-    if (mg->mg_obj && IoIFP(io)) {
> +-        SV **pid_psv;
> ++    if (mg->mg_obj) {
> + #ifdef ARGV_USE_ATFUNCTIONS
> +         SV **dir_psv;
> +         DIR *dir;
> ++
> ++        dir_psv =3D av_fetch((AV*)mg->mg_obj, ARGVMG_ORIG_DIRP, FALSE);
> ++        assert(dir_psv && *dir_psv && SvIOK(*dir_psv));
> ++        dir =3D INT2PTR(DIR *, SvIV(*dir_psv));
> + #endif
> +-        PerlIO *iop =3D IoIFP(io);
> ++        if (IoIFP(io)) {
> ++            SV **pid_psv;
> ++            PerlIO *iop =3D IoIFP(io);
> +
> +-        assert(SvTYPE(mg->mg_obj) =3D=3D SVt_PVAV);
> ++            assert(SvTYPE(mg->mg_obj) =3D=3D SVt_PVAV);
> +
> +-        pid_psv =3D av_fetch((AV*)mg->mg_obj, ARGVMG_ORIG_PID, FALSE);
> ++            pid_psv =3D av_fetch((AV*)mg->mg_obj, ARGVMG_ORIG_PID, FALS=
E);
> +
> +-        assert(pid_psv && *pid_psv);
> ++            assert(pid_psv && *pid_psv);
> +
> +-        if (SvIV(*pid_psv) =3D=3D (IV)PerlProc_getpid()) {
> +-            /* if we get here the file hasn't been closed explicitly by=
 the
> +-               user and hadn't been closed implicitly by nextargv(), so
> +-               abandon the edit */
> +-            SV **temp_psv =3D av_fetch((AV*)mg->mg_obj, ARGVMG_TEMP_NAM=
E, FALSE);
> +-            const char *temp_pv =3D SvPVX(*temp_psv);
> ++            if (SvIV(*pid_psv) =3D=3D (IV)PerlProc_getpid()) {
> ++                /* if we get here the file hasn't been closed explicitl=
y by the
> ++                   user and hadn't been closed implicitly by nextargv()=
, so
> ++                   abandon the edit */
> ++                SV **temp_psv =3D av_fetch((AV*)mg->mg_obj, ARGVMG_TEMP=
_NAME, FALSE);
> ++                const char *temp_pv =3D SvPVX(*temp_psv);
> +
> +-            assert(temp_psv && *temp_psv && SvPOK(*temp_psv));
> +-            (void)PerlIO_close(iop);
> +-            IoIFP(io) =3D IoOFP(io) =3D NULL;
> ++                assert(temp_psv && *temp_psv && SvPOK(*temp_psv));
> ++                (void)PerlIO_close(iop);
> ++                IoIFP(io) =3D IoOFP(io) =3D NULL;
> + #ifdef ARGV_USE_ATFUNCTIONS
> +-            dir_psv =3D av_fetch((AV*)mg->mg_obj, ARGVMG_ORIG_DIRP, FAL=
SE);
> +-            assert(dir_psv && *dir_psv && SvIOK(*dir_psv));
> +-            dir =3D INT2PTR(DIR *, SvIV(*dir_psv));
> +-            if (dir) {
> +-                if (unlinkat(my_dirfd(dir), temp_pv, 0) < 0 &&
> +-                    NotSupported(errno))
> +-                    (void)UNLINK(temp_pv);
> +-                closedir(dir);
> +-            }
> ++                if (dir) {
> ++                    if (unlinkat(my_dirfd(dir), temp_pv, 0) < 0 &&
> ++                        NotSupported(errno))
> ++                        (void)UNLINK(temp_pv);
> ++                }
> + #else
> +-            (void)UNLINK(temp_pv);
> ++                (void)UNLINK(temp_pv);
> + #endif
> ++            }
> +         }
> ++#ifdef ARGV_USE_ATFUNCTIONS
> ++        if (dir)
> ++            closedir(dir);
> ++#endif
> +     }
> +
> +     return 0;
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_do=
c_angle_units.diff b/meta/recipes-devtools/perl/perl/debian/fixes/math_comp=
lex_doc_angle_units.diff
> new file mode 100644
> index 0000000000..910f0e0593
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_angle=
_units.diff
> @@ -0,0 +1,28 @@
> +From f8be8c077c2c70ca9e5231140b464109a5ce606e Mon Sep 17 00:00:00 2001
> +From: Dominic Hargreaves <dom@earth.li>
> +Date: Sat, 30 Apr 2016 22:56:56 +0100
> +Subject: Math::Trig: document angle units
> +
> +Bug: https://rt.cpan.org/Ticket/Display.html?id=3D114106
> +Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D731505
> +Patch-Name: fixes/math_complex_doc_angle_units.diff
> +---
> + cpan/Math-Complex/lib/Math/Trig.pm | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/cpan/Math-Complex/lib/Math/Trig.pm b/cpan/Math-Complex/lib/=
Math/Trig.pm
> +index acad31ff4..bc7ac780e 100644
> +--- a/cpan/Math-Complex/lib/Math/Trig.pm
> ++++ b/cpan/Math-Complex/lib/Math/Trig.pm
> +@@ -263,6 +263,11 @@ core Perl which defines only the C<sin()> and C<cos=
()>.  The constant
> + B<pi> is also defined as are a few convenience functions for angle
> + conversions, and I<great circle formulas> for spherical movement.
> +
> ++=3Dhead1 ANGLES
> ++
> ++All angles are defined in radians, except where otherwise specified
> ++(for example in the deg/rad conversion functions).
> ++
> + =3Dhead1 TRIGONOMETRIC FUNCTIONS
> +
> + The tangent
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_do=
c_great_circle.diff b/meta/recipes-devtools/perl/perl/debian/fixes/math_com=
plex_doc_great_circle.diff
> new file mode 100644
> index 0000000000..04a04fe332
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_great=
_circle.diff
> @@ -0,0 +1,25 @@
> +From b798f651baa96a710eeb21237149dcd19ba4b04e Mon Sep 17 00:00:00 2001
> +From: Dominic Hargreaves <dom@earth.li>
> +Date: Sat, 30 Apr 2016 22:50:52 +0100
> +Subject: Math::Trig: clarify definition of great_circle_midpoint
> +
> +Bug: https://rt.cpan.org/Ticket/Display.html?id=3D114104
> +Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D697567
> +Patch-Name: fixes/math_complex_doc_great_circle.diff
> +---
> + cpan/Math-Complex/lib/Math/Trig.pm | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/Math-Complex/lib/Math/Trig.pm b/cpan/Math-Complex/lib/=
Math/Trig.pm
> +index 1d9612a41..efc2ff80a 100644
> +--- a/cpan/Math-Complex/lib/Math/Trig.pm
> ++++ b/cpan/Math-Complex/lib/Math/Trig.pm
> +@@ -608,7 +608,7 @@ or the midpoint if you know the end points:
> +   ($thetam, $phim) =3D
> +     great_circle_midpoint($theta0, $phi0, $theta1, $phi1);
> +
> +-The great_circle_midpoint() is just a special case of
> ++The great_circle_midpoint() is just a special case (with $way =3D 0.5) =
of
> +
> + =3Dhead2 great_circle_waypoint
> +
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_do=
c_see_also.diff b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex=
_doc_see_also.diff
> new file mode 100644
> index 0000000000..f2f225e73d
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_see_a=
lso.diff
> @@ -0,0 +1,25 @@
> +From bd15e598b5eb06155c47a03274ab0d2400ef6839 Mon Sep 17 00:00:00 2001
> +From: Dominic Hargreaves <dom@earth.li>
> +Date: Sat, 30 Apr 2016 22:53:44 +0100
> +Subject: Math::Trig: add missing SEE ALSO
> +
> +Bug: https://rt.cpan.org/Ticket/Display.html?id=3D114105
> +Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D697568
> +Patch-Name: fixes/math_complex_doc_see_also.diff
> +---
> + cpan/Math-Complex/lib/Math/Trig.pm | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/cpan/Math-Complex/lib/Math/Trig.pm b/cpan/Math-Complex/lib/=
Math/Trig.pm
> +index efc2ff80a..acad31ff4 100644
> +--- a/cpan/Math-Complex/lib/Math/Trig.pm
> ++++ b/cpan/Math-Complex/lib/Math/Trig.pm
> +@@ -743,6 +743,8 @@ an answer instead of giving a fatal runtime error.
> +
> + Do not attempt navigation using these formulas.
> +
> ++=3Dhead1 SEE ALSO
> ++
> + L<Math::Complex>
> +
> + =3Dhead1 AUTHORS
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.dif=
f b/meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.diff
> new file mode 100644
> index 0000000000..5e60a38d6b
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.diff
> @@ -0,0 +1,34 @@
> +From b00e183d04414ddb481f67da5ddc3b0cd77f4a3e Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Sat, 6 Feb 2016 20:15:19 +0200
> +Subject: Fix POD errors in Memoize
> +
> +Bug: https://rt.cpan.org/Public/Bug/Display.html?id=3D89441
> +Author: Dominic Hargreaves <dom@cpan.org>
> +Patch-Name: fixes/memoize-pod.diff
> +---
> + cpan/Memoize/Memoize.pm | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/cpan/Memoize/Memoize.pm b/cpan/Memoize/Memoize.pm
> +index f4e6522d4..2f28b361f 100644
> +--- a/cpan/Memoize/Memoize.pm
> ++++ b/cpan/Memoize/Memoize.pm
> +@@ -752,6 +752,8 @@ cache that was populated by the first call.  C<compl=
icated> ends up
> + being called only once, and both subsequent calls return C<3> from the
> + cache, regardless of the calling context.
> +
> ++=3Dback
> ++
> + =3Dhead3 List values in scalar context
> +
> + Consider this function:
> +@@ -801,8 +803,6 @@ This normalizer function will store scalar context r=
eturn values in
> + the disk file under keys that begin with C<S:>, and list context
> + return values under keys that begin with C<L:>.
> +
> +-=3Dback
> +-
> + =3Dhead1 OTHER FACILITIES
> +
> + =3Dhead2 C<unmemoize>
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storabl=
e_nstore.diff b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storab=
le_nstore.diff
> index d9b36f6d23..f375f8de50 100644
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstor=
e.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstor=
e.diff
> @@ -1,4 +1,4 @@
> -From 55d430eb02fc116581847304ca20321687978269 Mon Sep 17 00:00:00 2001
> +From d2015b66fb453593c9077db1452bc8cb9453236e Mon Sep 17 00:00:00 2001
>  From: Jonathan Nieder <jrnieder@gmail.com>
>  Date: Fri, 27 Jul 2012 10:35:07 -0500
>  Subject: Memoize::Storable: respect 'nstore' option not respected
> @@ -47,14 +47,13 @@ Bug-Debian: http://bugs.debian.org/587650
>  Bug: https://rt.cpan.org/Public/Bug/Display.html?id=3D77790
>  Forwarded: https://rt.cpan.org/Public/Bug/Display.html?id=3D77790
>  Patch-Name: fixes/memoize_storable_nstore.diff
> -Upstream-Status: Pending
>  ---
>   cpan/Memoize/Memoize/Storable.pm |  2 +-
>   cpan/Memoize/t/tie_storable.t    | 24 ++++++++++++++++++++----
>   2 files changed, 21 insertions(+), 5 deletions(-)
>
>  diff --git a/cpan/Memoize/Memoize/Storable.pm b/cpan/Memoize/Memoize/Sto=
rable.pm
> -index 1314797..87876f2 100644
> +index 131479729..87876f227 100644
>  --- a/cpan/Memoize/Memoize/Storable.pm
>  +++ b/cpan/Memoize/Memoize/Storable.pm
>  @@ -55,7 +55,7 @@ sub DESTROY {
> @@ -67,7 +66,7 @@ index 1314797..87876f2 100644
>     } else {
>       Storable::store($self->{H}, $self->{FILENAME});
>  diff --git a/cpan/Memoize/t/tie_storable.t b/cpan/Memoize/t/tie_storable=
.t
> -index de3b8dc..a624238 100644
> +index de3b8dc26..a62423850 100644
>  --- a/cpan/Memoize/t/tie_storable.t
>  +++ b/cpan/Memoize/t/tie_storable.t
>  @@ -31,18 +31,34 @@ if ($@) {
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.d=
iff b/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
> deleted file mode 100644
> index afcf7fb012..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From fa085fedd9c406edcd4a1a256c025d5ff7f6c6de Mon Sep 17 00:00:00 2001
> -From: Brendan O'Dea <bod@debian.org>
> -Date: Thu, 20 Sep 2007 19:47:14 +1000
> -Subject: Document the Net::SMTP 'Port' option
> -
> -Bug-Debian: http://bugs.debian.org/100195
> -Bug: http://rt.cpan.org/Public/Bug/Display.html?id=3D36038
> -
> -Patch-Name: fixes/net_smtp_docs.diff
> -Upstream-Status: Pending
> ----
> - cpan/libnet/lib/Net/SMTP.pm | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/cpan/libnet/lib/Net/SMTP.pm b/cpan/libnet/lib/Net/SMTP.pm
> -index afd017a..6ae7d9e 100644
> ---- a/cpan/libnet/lib/Net/SMTP.pm
> -+++ b/cpan/libnet/lib/Net/SMTP.pm
> -@@ -738,6 +738,7 @@ Net::SMTP will attempt to extract the address from t=
he value passed.
> -
> - B<Debug> - Enable debugging information
> -
> -+B<Port> - Select a port on the remote host to connect to (default is 25=
)
> -
> - Example:
> -
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff b=
/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
> deleted file mode 100644
> index 9bdf41b47d..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From 0ecf83f259db09cb38cb37c9b22e72be185afa8f Mon Sep 17 00:00:00 2001
> -From: Hugo van der Sanden <hv@crypt.org>
> -Date: Thu, 11 Jun 2015 12:25:40 +0100
> -Subject: fix -Cnn parsing
> -
> -Commit 22ff313068 for [perl #123814] inadvertently changed the logic whe=
n
> -parsing a numeric parameter to the -C option, such that the successfully
> -parsed number was not saved as the option value if it parsed to the end
> -of the argument.
> -
> -Bug: https://rt.perl.org/Ticket/Display.html?id=3D125381
> -Bug-Debian: https://bugs.debian.org/788636
> -Origin: upstream, http://perl5.git.perl.org/perl.git/commit/89d84ff965
> -Patch-Name: fixes/perl-Cnn.diff
> -Upstream-Status: Pending
> ----
> - t/run/switchC.t |  7 ++++++-
> - util.c          | 17 ++++++++---------
> - 2 files changed, 14 insertions(+), 10 deletions(-)
> -
> -diff --git a/t/run/switchC.t b/t/run/switchC.t
> -index f6aa868..4f63c3b 100644
> ---- a/t/run/switchC.t
> -+++ b/t/run/switchC.t
> -@@ -11,7 +11,7 @@ BEGIN {
> -     skip_all_if_miniperl('-C and $ENV{PERL_UNICODE} are disabled on min=
iperl');
> - }
> -
> --plan(tests =3D> 13);
> -+plan(tests =3D> 14);
> -
> - my $r;
> -
> -@@ -25,6 +25,11 @@ $r =3D runperl( switches =3D> [ '-CO', '-w' ],
> -               stderr   =3D> 1 );
> - like( $r, qr/^$b(?:\r?\n)?$/s, '-CO: no warning on UTF-8 output' );
> -
> -+$r =3D runperl( switches =3D> [ '-C2', '-w' ],
> -+            prog     =3D> 'print chr(256)',
> -+              stderr   =3D> 1 );
> -+like( $r, qr/^$b(?:\r?\n)?$/s, '-C2: no warning on UTF-8 output' );
> -+
> - SKIP: {
> -     if (exists $ENV{PERL_UNICODE} &&
> -       ($ENV{PERL_UNICODE} eq "" || $ENV{PERL_UNICODE} =3D~ /[SO]/)) {
> -diff --git a/util.c b/util.c
> -index 8cf62f5..ee23314 100644
> ---- a/util.c
> -+++ b/util.c
> -@@ -4420,16 +4420,15 @@ Perl_parse_unicode_opts(pTHX_ const char **popt)
> -        if (isDIGIT(*p)) {
> -             const char* endptr;
> -             UV uv;
> --            if (grok_atoUV(p, &uv, &endptr)
> --                && uv <=3D U32_MAX
> --                && (p =3D endptr)
> --                && *p && *p !=3D '\n' && *p !=3D '\r'
> --            ) {
> -+            if (grok_atoUV(p, &uv, &endptr) && uv <=3D U32_MAX) {
> -                 opt =3D (U32)uv;
> --                if (isSPACE(*p))
> --                    goto the_end_of_the_opts_parser;
> --                else
> --                    Perl_croak(aTHX_ "Unknown Unicode option letter '%c=
'", *p);
> -+                p =3D endptr;
> -+                if (p && *p && *p !=3D '\n' && *p !=3D '\r') {
> -+                    if (isSPACE(*p))
> -+                        goto the_end_of_the_opts_parser;
> -+                    else
> -+                        Perl_croak(aTHX_ "Unknown Unicode option letter=
 '%c'", *p);
> -+                }
> -             }
> -         }
> -         else {
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reprodu=
cible_date.diff b/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_repr=
oducible_date.diff
> deleted file mode 100644
> index d23573f188..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_d=
ate.diff
> +++ /dev/null
> @@ -1,171 +0,0 @@
> -From 9057adc106d6bbef53c9e706523cd94f1a7a08d4 Mon Sep 17 00:00:00 2001
> -From: Russ Allbery <rra@debian.org>
> -Date: Sat, 30 Aug 2014 15:10:41 -0700
> -Subject: Support POD_MAN_DATE in Pod::Man for the left-hand footer
> -
> -Honor the environment variable POD_MAN_DATE and use its contents, if
> -set, as the value of the left-hand footer if the date option is not
> -set, overriding the timestamp of the input file.  This is primarily
> -useful to ensure reproducible builds of the same output file given the
> -same souce and Pod::Man version, even when file timestamps may not be
> -consistent.  Thanks, Niko Tyni.
> -
> -Bug-Debian: http://bugs.debian.org/759405
> -Origin: upstream
> -Patch-Name: fixes/pod_man_reproducible_date.diff
> -Upstream-Status: Pending
> ----
> - cpan/podlators/lib/Pod/Man.pm  | 69 +++++++++++++++++++++++++++++++----=
-------
> - cpan/podlators/t/devise-date.t | 29 +++++++++++++-----
> - 2 files changed, 72 insertions(+), 26 deletions(-)
> -
> -diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.=
pm
> -index 72ca9ff..0536662 100644
> ---- a/cpan/podlators/lib/Pod/Man.pm
> -+++ b/cpan/podlators/lib/Pod/Man.pm
> -@@ -876,25 +876,42 @@ sub devise_title {
> - }
> -
> - # Determine the modification date and return that, properly formatted i=
n ISO
> --# format.  If we can't get the modification date of the input, instead =
use the
> --# current time.  Pod::Simple returns a completely unuseful stringified =
file
> --# handle as the source_filename for input from a file handle, so we hav=
e to
> --# deal with that as well.
> -+# format.
> -+#
> -+# If POD_MAN_DATE is set, that overrides anything else.  This can be us=
ed for
> -+# reproducible generation of the same file even if the input file times=
tamps
> -+# are unpredictable or the POD coms from standard input.
> -+#
> -+# Otherwise, use the modification date of the input if we can stat it. =
 Be
> -+# aware that Pod::Simple returns the stringification of the file handle=
 as
> -+# source_filename for input from a file handle, so we'll stat some rand=
om ref
> -+# string in that case.  If that fails, instead use the current time.
> -+#
> -+# $self - Pod::Man object, used to get the source file
> -+#
> -+# Returns: YYYY-MM-DD date suitable for the left-hand footer
> - sub devise_date {
> -     my ($self) =3D @_;
> -+
> -+    # If POD_MAN_DATE is set, always use it.
> -+    if ($ENV{POD_MAN_DATE}) {
> -+        return $ENV{POD_MAN_DATE};
> -+    }
> -+
> -+    # Otherwise, get the input filename and try to stat it.  If that fa=
ils,
> -+    # use the current time.
> -     my $input =3D $self->source_filename;
> -     my $time;
> -     if ($input) {
> --        $time =3D (stat $input)[9] || time;
> -+        $time =3D (stat($input))[9] || time();
> -     } else {
> --        $time =3D time;
> -+        $time =3D time();
> -     }
> -
> --    # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker
> --    # uses this and it has to work in the core which can't load dynamic
> --    # libraries.
> --    my ($year, $month, $day) =3D (localtime $time)[5,4,3];
> --    return sprintf ("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
> -+    # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker =
uses
> -+    # this and it has to work in the core which can't load dynamic libr=
aries.
> -+    my ($year, $month, $day) =3D (localtime($time))[5,4,3];
> -+    return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
> - }
> -
> - # Print out the preamble and the title.  The meaning of the arguments t=
o .TH
> -@@ -1632,6 +1649,15 @@ argument.
> - Sets the centered page header to use instead of "User Contributed Perl
> - Documentation".
> -
> -+=3Ditem date
> -+
> -+Sets the left-hand footer.  If this option is not set, the contents of =
the
> -+environment variable POD_MAN_DATE, if set, will be used.  Failing that,
> -+the modification date of the input file will be used, or the current ti=
me
> -+if stat() can't find that file (which will be the case if the input is
> -+from C<STDIN>).  If obtained from the file modification date or the
> -+current time, he date will be formatted as C<YYYY-MM-DD>.
> -+
> - =3Ditem errors
> -
> - How to report errors.  C<die> says to throw an exception on any POD
> -@@ -1642,13 +1668,6 @@ POD errors entirely, as much as possible.
> -
> - The default is C<pod>.
> -
> --=3Ditem date
> --
> --Sets the left-hand footer.  By default, the modification date of the in=
put
> --file will be used, or the current date if stat() can't find that file (=
the
> --case if the input is from C<STDIN>), and the date will be formatted as
> --C<YYYY-MM-DD>.
> --
> - =3Ditem fixed
> -
> - The fixed-width font to use for verbatim text and code.  Defaults to
> -@@ -1810,6 +1829,20 @@ option was set to C<die>.
> -
> - =3Dback
> -
> -+=3Dhead1 ENVIRONMENT
> -+
> -+=3Dover 4
> -+
> -+=3Ditem POD_MAN_DATE
> -+
> -+If set, this will be used as the value of the left-hand footer unless t=
he
> -+C<date> option is explicitly set, overriding the timestamp of the input
> -+file or the current time.  This is primarily useful to ensure reproduci=
ble
> -+builds of the same output file given the same souce and Pod::Man versio=
n,
> -+even when file timestamps may not be consistent.
> -+
> -+=3Dback
> -+
> - =3Dhead1 BUGS
> -
> - Encoding handling assumes that PerlIO is available and does not work
> -diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-da=
te.t
> -index 3cce9f5..c610dd9 100644
> ---- a/cpan/podlators/t/devise-date.t
> -+++ b/cpan/podlators/t/devise-date.t
> -@@ -1,15 +1,28 @@
> --#!/usr/bin/perl -w
> --
> --# In order for MakeMaker to build in the core, nothing can use
> --# Fcntl which includes POSIX.  devise_date()'s use of strftime()
> --# was replaced.  This tests that it's identical.
> -+#!/usr/bin/perl
> -+#
> -+# In order for MakeMaker to build in the core, nothing can use Fcntl wh=
ich
> -+# includes POSIX.  devise_date()'s use of strftime() was replaced.  Thi=
s tests
> -+# that it's identical.  It also tests special handling of the POD_MAN_D=
ATE
> -+# environment variable.
> -
> -+use 5.006;
> - use strict;
> --
> --use Test::More tests =3D> 1;
> -+use warnings;
> -
> - use Pod::Man;
> - use POSIX qw(strftime);
> -
> -+use Test::More tests =3D> 2;
> -+
> -+# Check that the results of device_date matches strftime.  There is no =
input
> -+# file name, so this will use the current time.
> - my $parser =3D Pod::Man->new;
> --is $parser->devise_date, strftime("%Y-%m-%d", localtime);
> -+is(
> -+    $parser->devise_date,
> -+    strftime('%Y-%m-%d', localtime()),
> -+    'devise_date matches strftime'
> -+);
> -+
> -+# Set the override environment variable and ensure that it's honored.
> -+local $ENV{POD_MAN_DATE} =3D '2014-01-01';
> -+is($parser->devise_date, '2014-01-01', 'devise_date honors POD_MAN_DATE=
');
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-da=
te.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.di=
ff
> deleted file mode 100644
> index 9de29b8654..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 183bb4af7ad862a2cf31d0dcb3dd45c100f76776 Mon Sep 17 00:00:00 2001
> -From: Russ Allbery <rra@cpan.org>
> -Date: Wed, 15 Apr 2015 22:21:25 -0700
> -Subject: Support an empty POD_MAN_DATE environment variable
> -
> -One may want to set this to an empty string.  Handle that correctly.
> -
> -(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
> -
> -Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommi=
tdiff;h=3De0e9fcb53e8fc954b2b1955385eea18c27f869af
> -Bug-Debian: https://bugs.debian.org/780259
> -Patch-Name: fixes/podman-empty-date.diff
> -Upstream-Status: Pending
> ----
> - cpan/podlators/lib/Pod/Man.pm  | 2 +-
> - cpan/podlators/t/devise-date.t | 6 +++++-
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.=
pm
> -index 365892e..8997a15 100644
> ---- a/cpan/podlators/lib/Pod/Man.pm
> -+++ b/cpan/podlators/lib/Pod/Man.pm
> -@@ -894,7 +894,7 @@ sub devise_date {
> -     my ($self) =3D @_;
> -
> -     # If POD_MAN_DATE is set, always use it.
> --    if ($ENV{POD_MAN_DATE}) {
> -+    if (defined($ENV{POD_MAN_DATE})) {
> -         return $ENV{POD_MAN_DATE};
> -     }
> -
> -diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-da=
te.t
> -index 9da9d1b..27271d9 100644
> ---- a/cpan/podlators/t/devise-date.t
> -+++ b/cpan/podlators/t/devise-date.t
> -@@ -12,7 +12,7 @@ use warnings;
> - use Pod::Man;
> - use POSIX qw(strftime);
> -
> --use Test::More tests =3D> 2;
> -+use Test::More tests =3D> 3;
> -
> - # Check that the results of device_date matches strftime.  There is no =
input
> - # file name, so this will use the current time.
> -@@ -26,3 +26,7 @@ is(
> - # Set the override environment variable and ensure that it's honored.
> - local $ENV{POD_MAN_DATE} =3D '2014-01-01';
> - is($parser->devise_date, '2014-01-01', 'devise_date honors POD_MAN_DATE=
');
> -+
> -+# Check that an empty environment variable is honored.
> -+local $ENV{POD_MAN_DATE} =3D q{};
> -+is($parser->devise_date, q{}, 'devise_date honors empty POD_MAN_DATE');
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.dif=
f b/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
> deleted file mode 100644
> index d8858d8a69..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 7671d101baa75d7a79bfbd8c75c1595fbb3f53ba Mon Sep 17 00:00:00 2001
> -From: Russ Allbery <rra@cpan.org>
> -Date: Sat, 7 Feb 2015 19:03:34 -0800
> -Subject: Better errors for man pages from standard input
> -
> -[Pod::Man] Attempt to detect if the input came from a pipe and
> -therefore has a completely unhelpful (and nonreproducible) source file
> -name, and diagnose this as an error.  Document that the name option
> -(--name to pod2man) is required when processing POD source from
> -standard input.  (Debian Bug#777405)
> -
> -(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
> -
> -Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommi=
tdiff;h=3Dd98872e46c93861b7aba14949e1258712087dc55
> -Bug-Debian: https://bugs.debian.org/777405
> -Patch-Name: fixes/podman-pipe.diff
> -Upstream-Status: Pending
> ----
> - cpan/podlators/lib/Pod/Man.pm     | 15 +++++++++++++++
> - cpan/podlators/scripts/pod2man.PL |  4 ++++
> - cpan/podlators/t/devise-title.t   | 32 ++++++++++++++++++++++++++++++++
> - 3 files changed, 51 insertions(+)
> - create mode 100755 cpan/podlators/t/devise-title.t
> -
> -diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.=
pm
> -index 8997a15..969eaff 100644
> ---- a/cpan/podlators/lib/Pod/Man.pm
> -+++ b/cpan/podlators/lib/Pod/Man.pm
> -@@ -828,6 +828,17 @@ sub devise_title {
> -     $section =3D 3 if (!$$self{section} && $name =3D~ /\.pm\z/i);
> -     $name =3D~ s/\.p(od|[lm])\z//i;
> -
> -+    # If Pod::Parser gave us an IO::File reference as the source file n=
ame,
> -+    # convert that to the empty string as well.  Then, if we don't have=
 a
> -+    # valid name, emit a warning and convert it to STDIN.
> -+    if ($name =3D~ /^IO::File(?:=3D\w+)\(0x[\da-f]+\)$/i) {
> -+        $name =3D '';
> -+    }
> -+    if ($name eq '') {
> -+        $self->whine (1, 'No name given for document');
> -+        $name =3D 'STDIN';
> -+    }
> -+
> -     # If the section isn't 3, then the name defaults to just the basena=
me of
> -     # the file.  Otherwise, assume we're dealing with a module.  We wan=
t to
> -     # figure out the full module name from the path to the file, but we=
 don't
> -@@ -1705,6 +1716,10 @@ module path.  If it is, a path like C<.../lib/Pod=
/Man.pm> is converted into
> - a name like C<Pod::Man>.  This option, if given, overrides any automati=
c
> - determination of the name.
> -
> -+If generating a manual page from standard input, this option is require=
d,
> -+since there's otherwise no way for Pod::Man to know what to use for the
> -+manual page name.
> -+
> - =3Ditem nourls
> -
> - Normally, LZ<><> formatting codes with a URL but anchor text are format=
ted
> -diff --git a/cpan/podlators/scripts/pod2man.PL b/cpan/podlators/scripts/=
pod2man.PL
> -index 38695f8..43e35df 100644
> ---- a/cpan/podlators/scripts/pod2man.PL
> -+++ b/cpan/podlators/scripts/pod2man.PL
> -@@ -236,6 +236,10 @@ Note that this option is probably not useful when c=
onverting multiple POD
> - files at once.  The convention for Unix man pages for commands is for t=
he
> - man page title to be in all-uppercase even if the command isn't.
> -
> -+When converting POD source from standard input, this option is required=
,
> -+since there's otherwise no way to know what to use as the name of the
> -+manual page.
> -+
> - =3Ditem B<--nourls>
> -
> - Normally, LZ<><> formatting codes with a URL but anchor text are format=
ted
> -diff --git a/cpan/podlators/t/devise-title.t b/cpan/podlators/t/devise-t=
itle.t
> -new file mode 100755
> -index 0000000..8639441
> ---- /dev/null
> -+++ b/cpan/podlators/t/devise-title.t
> -@@ -0,0 +1,32 @@
> -+#!/usr/bin/perl
> -+#
> -+# Tests for the automatic determination of the manual page title if not
> -+# specified via options to pod2man or the Pod::Man constructor.
> -+
> -+use 5.006;
> -+use strict;
> -+use warnings;
> -+
> -+use File::Spec;
> -+use IO::File;
> -+use Test::More tests =3D> 3;
> -+
> -+BEGIN {
> -+    use_ok('Pod::Man');
> -+}
> -+
> -+# Create a parser and set it up with an input source.  There isn't a wa=
y to do
> -+# this in Pod::Simple without actually parsing the document, so send th=
e
> -+# output to a string that we'll ignore.
> -+my $path =3D File::Spec->catdir('t', 'data', 'basic.pod');
> -+my $handle =3D IO::File->new($path, 'r');
> -+my $parser =3D Pod::Man->new(errors =3D> 'pod');
> -+my $output;
> -+$parser->output_string(\$output);
> -+$parser->parse_file($handle);
> -+
> -+# Check the results of devise_title for this.  We should get back STDIN=
, and
> -+# we should have reported an error.
> -+my ($name, $section) =3D $parser->devise_title;
> -+is($name, 'STDIN', 'devise_title uses STDIN for file handle input');
> -+ok($parser->errors_seen, '...and errors were seen');
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs=
.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
> deleted file mode 100644
> index b6ae409ac0..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From 6198856b5323d6204094293f01b890472618f182 Mon Sep 17 00:00:00 2001
> -From: Russ Allbery <rra@cpan.org>
> -Date: Wed, 15 Apr 2015 20:49:07 -0700
> -Subject: Documentation and test suite updates for UTC fix
> -
> -Update the Pod::Man and pod2man documentation and the test suite
> -for the new UTC-based default page footer, and add a Changes
> -entry.
> -
> -(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
> -
> -Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommi=
tdiff;h=3D52db93bf80e4a06f8497e4ebade0506b6ee0e70d
> -Bug-Debian: https://bugs.debian.org/780259
> -Patch-Name: fixes/podman-utc-docs.diff
> -Upstream-Status: Pending
> ----
> - cpan/podlators/lib/Pod/Man.pm     |  6 +++++-
> - cpan/podlators/scripts/pod2man.PL | 11 ++++++-----
> - cpan/podlators/t/devise-date.t    |  2 +-
> - 3 files changed, 12 insertions(+), 7 deletions(-)
> -
> -diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.=
pm
> -index c3ba201..365892e 100644
> ---- a/cpan/podlators/lib/Pod/Man.pm
> -+++ b/cpan/podlators/lib/Pod/Man.pm
> -@@ -910,6 +910,8 @@ sub devise_date {
> -
> -     # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker =
uses
> -     # this and it has to work in the core which can't load dynamic libr=
aries.
> -+    # Use gmtime instead of localtime so that the generated man page do=
es not
> -+    # depend on the local time zone setting and is more reproducible
> -     my ($year, $month, $day) =3D (gmtime($time))[5,4,3];
> -     return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
> - }
> -@@ -1656,7 +1658,9 @@ environment variable POD_MAN_DATE, if set, will be=
 used.  Failing that,
> - the modification date of the input file will be used, or the current ti=
me
> - if stat() can't find that file (which will be the case if the input is
> - from C<STDIN>).  If obtained from the file modification date or the
> --current time, he date will be formatted as C<YYYY-MM-DD>.
> -+current time, the date will be formatted as C<YYYY-MM-DD> and will be b=
ased
> -+on UTC (so that the output will be reproducible regardless of local tim=
e
> -+zone).
> -
> - =3Ditem errors
> -
> -diff --git a/cpan/podlators/scripts/pod2man.PL b/cpan/podlators/scripts/=
pod2man.PL
> -index 6af3474..38695f8 100644
> ---- a/cpan/podlators/scripts/pod2man.PL
> -+++ b/cpan/podlators/scripts/pod2man.PL
> -@@ -174,9 +174,10 @@ Contributed Perl Documentation", but also see B<--o=
fficial> below.
> -
> - =3Ditem B<-d> I<string>, B<--date>=3DI<string>
> -
> --Set the left-hand footer string to this value.  By default, the modific=
ation
> --date of the input file will be used, or the current date if input comes=
 from
> --C<STDIN>.
> -+Set the left-hand footer string to this value.  By default, the
> -+modification date of the input file will be used, or the current date i=
f
> -+input comes from C<STDIN>, and will be based on UTC (so that the output
> -+will be reproducible regardless of local time zone).
> -
> - =3Ditem B<-errors>=3DI<style>
> -
> -@@ -383,8 +384,8 @@ B<pod2man> by Larry Wall and Tom Christiansen.
> -
> - =3Dhead1 COPYRIGHT AND LICENSE
> -
> --Copyright 1999, 2000, 2001, 2004, 2006, 2008, 2010, 2012, 2013 Russ
> --Allbery <rra@stanford.edu>.
> -+Copyright 1999, 2000, 2001, 2004, 2006, 2008, 2010, 2012, 2013, 2014,
> -+2015 Russ Allbery <rra@cpan.org>.
> -
> - This program is free software; you may redistribute it and/or modify it
> - under the same terms as Perl itself.
> -diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-da=
te.t
> -index c610dd9..9da9d1b 100644
> ---- a/cpan/podlators/t/devise-date.t
> -+++ b/cpan/podlators/t/devise-date.t
> -@@ -19,7 +19,7 @@ use Test::More tests =3D> 2;
> - my $parser =3D Pod::Man->new;
> - is(
> -     $parser->devise_date,
> --    strftime('%Y-%m-%d', localtime()),
> -+    strftime('%Y-%m-%d', gmtime()),
> -     'devise_date matches strftime'
> - );
> -
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff=
 b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
> deleted file mode 100644
> index 3fb7c20dde..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From c796775cdbd2cce06acbb7ac355187d4063017a2 Mon Sep 17 00:00:00 2001
> -From: Chris Lamb <lamby@debian.org>
> -Date: Wed, 15 Apr 2015 20:42:53 -0700
> -Subject: Make the embedded date from Pod::Man reproducible
> -
> -While working on the "reproducible builds" effort, we have noticed
> -that Pod::Man generates output that varies depending on the current
> -timezone.
> -
> -The attached patch fixes this by using GMT (~UTC) dates instead.
> -
> -(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
> -
> -Origin: upstream, http://git.eyrie.org/?p=3Dperl/podlators.git;a=3Dcommi=
tdiff;h=3D913fbb2bd2ce071e20128629302ae2852554cad4
> -Bug-Debian: https://bugs.debian.org/780259
> -Patch-Name: fixes/podman-utc.diff
> -Upstream-Status: Pending
> ----
> - cpan/podlators/lib/Pod/Man.pm | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.=
pm
> -index 0536662..c3ba201 100644
> ---- a/cpan/podlators/lib/Pod/Man.pm
> -+++ b/cpan/podlators/lib/Pod/Man.pm
> -@@ -910,7 +910,7 @@ sub devise_date {
> -
> -     # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker =
uses
> -     # this and it has to work in the core which can't load dynamic libr=
aries.
> --    my ($year, $month, $day) =3D (localtime($time))[5,4,3];
> -+    my ($year, $month, $day) =3D (gmtime($time))[5,4,3];
> -     return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
> - }
> -
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.d=
iff b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
> index c8663f5357..0a24c56277 100644
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
> @@ -1,4 +1,4 @@
> -From d9d535ef97f57af6e9728075944c33f3b0b5372f Mon Sep 17 00:00:00 2001
> +From 7edcfca298a6330f75c0eccba97bbb24ce84454a Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Respect umask during installation
> @@ -7,17 +7,16 @@ This is needed to satisfy Debian policy regarding group=
-writable
>  site directories.
>
>  Patch-Name: fixes/respect_umask.diff
> -Upstream-Status: Pending
>  ---
> - cpan/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
> + cpan/ExtUtils-Install/lib/ExtUtils/Install.pm  | 18 +++++++++---------
> + .../ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
>   2 files changed, 18 insertions(+), 18 deletions(-)
>
>  diff --git a/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm b/cpan/ExtUti=
ls-Install/lib/ExtUtils/Install.pm
> -index 1e8ac4c..3e79121 100644
> +index 047c00714..cd7e4f234 100644
>  --- a/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
>  +++ b/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
> -@@ -451,7 +451,7 @@ sub _can_write_dir {
> +@@ -463,7 +463,7 @@ sub _can_write_dir {
>
>   =3Dpod
>
> @@ -26,7 +25,7 @@ index 1e8ac4c..3e79121 100644
>
>   Wrapper around File::Path::mkpath() to handle errors.
>
> -@@ -468,13 +468,13 @@ writable.
> +@@ -480,13 +480,13 @@ writable.
>   =3Dcut
>
>   sub _mkpath {
> @@ -43,7 +42,7 @@ index 1e8ac4c..3e79121 100644
>               _choke("Can't create '$dir'","$@");
>           }
>
> -@@ -783,7 +783,7 @@ sub install { #XXX OS-SPECIFIC
> +@@ -799,7 +799,7 @@ sub install { #XXX OS-SPECIFIC
>           _chdir($cwd);
>       }
>       foreach my $targetdir (sort keys %check_dirs) {
> @@ -52,7 +51,7 @@ index 1e8ac4c..3e79121 100644
>       }
>       foreach my $found (@found_files) {
>           my ($diff, $ffd, $origfile, $mode, $size, $atime, $mtime,
> -@@ -797,7 +797,7 @@ sub install { #XXX OS-SPECIFIC
> +@@ -813,7 +813,7 @@ sub install { #XXX OS-SPECIFIC
>                       $targetfile=3D _unlink_or_rename( $targetfile, 'try=
hard', 'install' )
>                           unless $dry_run;
>                   } elsif ( ! -d $targetdir ) {
> @@ -61,7 +60,7 @@ index 1e8ac4c..3e79121 100644
>                   }
>                   print "Installing $targetfile\n";
>
> -@@ -837,7 +837,7 @@ sub install { #XXX OS-SPECIFIC
> +@@ -853,7 +853,7 @@ sub install { #XXX OS-SPECIFIC
>
>       if ($pack{'write'}) {
>           $dir =3D install_rooted_dir(dirname($pack{'write'}));
> @@ -70,16 +69,16 @@ index 1e8ac4c..3e79121 100644
>           print "Writing $pack{'write'}\n" if $verbose;
>           $packlist->write(install_rooted_file($pack{'write'})) unless $d=
ry_run;
>       }
> -@@ -1180,7 +1180,7 @@ environment variable will silence this output.
> +@@ -1199,7 +1199,7 @@ environment variable will silence this output.
>   sub pm_to_blib {
>       my($fromto,$autodir,$pm_filter) =3D @_;
>
> --    _mkpath($autodir,0,0755);
> -+    _mkpath($autodir,0);
> +-    _mkpath($autodir,0,0755) if defined $autodir;
> ++    _mkpath($autodir,0) if defined $autodir;
>       while(my($from, $to) =3D each %$fromto) {
>           if( -f $to && -s $from =3D=3D -s $to && -M $to < -M $from ) {
>               print "Skip $to (unchanged)\n" unless $INSTALL_QUIET;
> -@@ -1203,7 +1203,7 @@ sub pm_to_blib {
> +@@ -1222,7 +1222,7 @@ sub pm_to_blib {
>               # we wont try hard here. its too likely to mess things up.
>               forceunlink($to);
>           } else {
> @@ -89,10 +88,10 @@ index 1e8ac4c..3e79121 100644
>           if ($need_filtering) {
>               run_filter($pm_filter, $from, $to);
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index f63145c..197f102 100644
> +index fe53be12e..274e35c6f 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2118,7 +2118,7 @@ doc__install : doc_site_install
> +@@ -2229,7 +2229,7 @@ doc__install : doc_site_install
>         $(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLD=
IRS=3Dsite
>
>   pure_perl_install :: all
> @@ -101,7 +100,7 @@ index f63145c..197f102 100644
>   };
>
>       push @m,
> -@@ -2138,7 +2138,7 @@ q{               "$(INST_LIB)" "$(DESTINSTALLPRIVL=
IB)" \
> +@@ -2249,7 +2249,7 @@ q{               "$(INST_LIB)" "$(DESTINSTALLPRIVL=
IB)" \
>
>
>   pure_site_install :: all
> @@ -110,7 +109,7 @@ index f63145c..197f102 100644
>   };
>       push @m,
>   q{            read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT=
)','.packlist').q{" \
> -@@ -2156,7 +2156,7 @@ q{               "$(INST_LIB)" "$(DESTINSTALLSITEL=
IB)" \
> +@@ -2267,7 +2267,7 @@ q{               "$(INST_LIB)" "$(DESTINSTALLSITEL=
IB)" \
>                 "}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q=
{"
>
>   pure_vendor_install :: all
> @@ -119,7 +118,7 @@ index f63145c..197f102 100644
>   };
>       push @m,
>   q{            read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLE=
XT)','.packlist').q{" \
> -@@ -2188,8 +2188,8 @@ doc_vendor_install :: all
> +@@ -2299,8 +2299,8 @@ doc_vendor_install :: all
>       push @m, q{
>   doc_perl_install :: all
>         $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> @@ -128,9 +127,9 @@ index f63145c..197f102 100644
>  +      -$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +      -$(NOECHO) umask 022; $(DOC_INSTALL) \
>                 "Module" "$(NAME)" \
> -               "installed into" $(INSTALLPRIVLIB) \
> +               "installed into" "$(INSTALLPRIVLIB)" \
>                 LINKTYPE "$(LINKTYPE)" \
> -@@ -2199,8 +2199,8 @@ doc_perl_install :: all
> +@@ -2310,8 +2310,8 @@ doc_perl_install :: all
>
>   doc_site_install :: all
>         $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> @@ -139,9 +138,9 @@ index f63145c..197f102 100644
>  +      -$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +      -$(NOECHO) umask 022; $(DOC_INSTALL) \
>                 "Module" "$(NAME)" \
> -               "installed into" $(INSTALLSITELIB) \
> +               "installed into" "$(INSTALLSITELIB)" \
>                 LINKTYPE "$(LINKTYPE)" \
> -@@ -2210,8 +2210,8 @@ doc_site_install :: all
> +@@ -2321,8 +2321,8 @@ doc_site_install :: all
>
>   doc_vendor_install :: all
>         $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> @@ -150,5 +149,5 @@ index f63145c..197f102 100644
>  +      -$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +      -$(NOECHO) umask 022; $(DOC_INSTALL) \
>                 "Module" "$(NAME)" \
> -               "installed into" $(INSTALLVENDORLIB) \
> +               "installed into" "$(INSTALLVENDORLIB)" \
>                 LINKTYPE "$(LINKTYPE)" \
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/storable-recurs=
ion.diff b/meta/recipes-devtools/perl/perl/debian/fixes/storable-recursion.=
diff
> new file mode 100644
> index 0000000000..9b91f450cd
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/storable-recursion.dif=
f
> @@ -0,0 +1,292 @@
> +From 6fb669855822b2c17aa5347ba4669f5f61109741 Mon Sep 17 00:00:00 2001
> +From: Tony Cook <tony@develop-help.com>
> +Date: Tue, 7 Aug 2018 15:34:06 +1000
> +Subject: (perl #133326) fix and clarify handling of recurs_sv.
> +
> +There were a few problems:
> +
> +- the purpose of recur_sv wasn't clear, I believe I understand it
> +  now from looking at where recur_sv was actually being used.
> +  Frankly the logic of the code itself was hard to follow, apparently
> +  only counting a level if the recur_sv was equal to the current
> +  SV.
> +
> +  Fixed by adding some documentation to recur_sv in the context
> +  structure.  The logic has been re-worked (see below) to hopefully
> +  make it more understandable.
> +
> +- the conditional checks for inc/decrementing recur_depth didn't
> +  match between the beginnings and ends of the store_array() and
> +  store_hash() handlers didn't match, since recur_sv was both
> +  explicitly modified by those functions and implicitly modified
> +  in their recursive calls to process elements.
> +
> +  Fixing by storing the starting value of cxt->recur_sv locally
> +  testing against that instead of against the value that might be
> +  modified recursively.
> +
> +- the checks in store_ref(), store_array(), store_l?hash() were
> +  over complex, obscuring their purpose.
> +
> +  Fixed by:
> +   - always count a recursion level in store_ref() and store the
> +     RV in recur_sv
> +   - only count a recursion level in the array/hash handlers if
> +     the SV didn't match.
> +   - skip the check against cxt->entry, if we're in this code
> +     we could be recursing, so we want to detect it.
> +
> +- (after the other changes) the recursion checks in store_hash()/
> +  store_lhash() only checked the limit if the SV didn't match the
> +  recur_sv, which horribly broke things.
> +
> +  Fixed by:
> +   - Now only make the depth increment conditional, and always
> +     check against the limit if one is set.
> +
> +Origin: upstream, https://perl5.git.perl.org/perl.git/commit/120060c86e2=
33cb9f588314214137f3ed1b48e2a
> +Bug: https://rt.perl.org/Public/Bug/Display.html?id=3D133326
> +Bug-Debian: https://bugs.debian.org/912900
> +Patch-Name: fixes/storable-recursion.diff
> +---
> + dist/Storable/Storable.xs | 98 +++++++++++++++++++++++++--------------
> + dist/Storable/t/recurse.t | 16 ++++++-
> + 2 files changed, 77 insertions(+), 37 deletions(-)
> +
> +diff --git a/dist/Storable/Storable.xs b/dist/Storable/Storable.xs
> +index 6a90e2481..f6df32b12 100644
> +--- a/dist/Storable/Storable.xs
> ++++ b/dist/Storable/Storable.xs
> +@@ -418,6 +418,24 @@ typedef struct stcxt {
> +     SV *(**retrieve_vtbl)(pTHX_ struct stcxt *, const char *);        /=
* retrieve dispatch table */
> +     SV *prev;                 /* contexts chained backwards in real rec=
ursion */
> +     SV *my_sv;                        /* the blessed scalar who's SvPVX=
() I am */
> ++
> ++    /* recur_sv:
> ++
> ++       A hashref of hashrefs or arrayref of arrayrefs is actually a
> ++       chain of four SVs, eg for an array ref containing an array ref:
> ++
> ++         RV -> AV (element) -> RV -> AV
> ++
> ++       To make this depth appear natural from a perl level we only
> ++       want to count this as two levels, so store_ref() stores it's RV
> ++       into recur_sv and store_array()/store_hash() will only count
> ++       that level if the AV/HV *isn't* recur_sv.
> ++
> ++       We can't just have store_hash()/store_array() not count that
> ++       level, since it's possible for XS code to store an AV or HV
> ++       directly as an element (though perl code trying to access such
> ++       an object will generally croak.)
> ++     */
> +     SV *recur_sv;               /* check only one recursive SV */
> +     int in_retrieve_overloaded; /* performance hack for retrieving over=
loaded objects */
> +     int flags;                        /* controls whether to bless or t=
ie objects */
> +@@ -431,8 +449,13 @@ typedef struct stcxt {
> +
> + #define RECURSION_TOO_DEEP() \
> +     (cxt->max_recur_depth !=3D -1 && ++cxt->recur_depth > cxt->max_recu=
r_depth)
> ++
> ++/* There's cases where we need to check whether the hash recursion
> ++   limit has been reached without bumping the recursion levels, so the
> ++   hash check doesn't bump the depth.
> ++*/
> + #define RECURSION_TOO_DEEP_HASH() \
> +-    (cxt->max_recur_depth_hash !=3D -1 && ++cxt->recur_depth > cxt->max=
_recur_depth_hash)
> ++    (cxt->max_recur_depth_hash !=3D -1 && cxt->recur_depth > cxt->max_r=
ecur_depth_hash)
> + #define MAX_DEPTH_ERROR "Max. recursion depth with nested structures ex=
ceeded"
> +
> + static int storable_free(pTHX_ SV *sv, MAGIC* mg);
> +@@ -2360,21 +2383,20 @@ static int store_ref(pTHX_ stcxt_t *cxt, SV *sv)
> +     } else
> +         PUTMARK(is_weak ? SX_WEAKREF : SX_REF);
> +
> +-    TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recu=
r_depth,
> +-             PTR2UV(cxt->recur_sv)));
> +-    if (cxt->entry && cxt->recur_sv =3D=3D sv) {
> +-        if (RECURSION_TOO_DEEP()) {
> ++    cxt->recur_sv =3D sv;
> ++
> ++    TRACEME((">ref recur_depth %" IVdf ", recur_sv (0x%" UVxf ") max %"=
 IVdf, cxt->recur_depth,
> ++             PTR2UV(cxt->recur_sv), cxt->max_recur_depth));
> ++    if (RECURSION_TOO_DEEP()) {
> + #if PERL_VERSION < 15
> +-            cleanup_recursive_data(aTHX_ (SV*)sv);
> ++        cleanup_recursive_data(aTHX_ (SV*)sv);
> + #endif
> +-            CROAK((MAX_DEPTH_ERROR));
> +-        }
> ++        CROAK((MAX_DEPTH_ERROR));
> +     }
> +-    cxt->recur_sv =3D sv;
> +
> +     retval =3D store(aTHX_ cxt, sv);
> +-    if (cxt->entry && cxt->recur_sv =3D=3D sv && cxt->recur_depth > 0) =
{
> +-        TRACEME(("recur_depth --%" IVdf, cxt->recur_depth));
> ++    if (cxt->max_recur_depth !=3D -1 && cxt->recur_depth > 0) {
> ++        TRACEME(("<ref recur_depth --%" IVdf, cxt->recur_depth));
> +         --cxt->recur_depth;
> +     }
> +     return retval;
> +@@ -2635,6 +2657,7 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
> +     UV len =3D av_len(av) + 1;
> +     UV i;
> +     int ret;
> ++    SV *const recur_sv =3D cxt->recur_sv;
> +
> +     TRACEME(("store_array (0x%" UVxf ")", PTR2UV(av)));
> +
> +@@ -2659,9 +2682,9 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
> +         TRACEME(("size =3D %d", (int)l));
> +     }
> +
> +-    TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recu=
r_depth,
> +-             PTR2UV(cxt->recur_sv)));
> +-    if (cxt->entry && cxt->recur_sv =3D=3D (SV*)av) {
> ++    TRACEME((">array recur_depth %" IVdf ", recur_sv (0x%" UVxf ") max =
%" IVdf, cxt->recur_depth,
> ++             PTR2UV(cxt->recur_sv), cxt->max_recur_depth));
> ++    if (recur_sv !=3D (SV*)av) {
> +         if (RECURSION_TOO_DEEP()) {
> +             /* with <=3D 5.14 it recurses in the cleanup also, needing =
2x stack size */
> + #if PERL_VERSION < 15
> +@@ -2670,7 +2693,6 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
> +             CROAK((MAX_DEPTH_ERROR));
> +         }
> +     }
> +-    cxt->recur_sv =3D (SV*)av;
> +
> +     /*
> +      * Now store each item recursively.
> +@@ -2701,9 +2723,12 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av=
)
> +             return ret;
> +     }
> +
> +-    if (cxt->entry && cxt->recur_sv =3D=3D (SV*)av && cxt->recur_depth =
> 0) {
> +-        TRACEME(("recur_depth --%" IVdf, cxt->recur_depth));
> +-        --cxt->recur_depth;
> ++    if (recur_sv !=3D (SV*)av) {
> ++        assert(cxt->max_recur_depth =3D=3D -1 || cxt->recur_depth > 0);
> ++        if (cxt->max_recur_depth !=3D -1 && cxt->recur_depth > 0) {
> ++            TRACEME(("<array recur_depth --%" IVdf, cxt->recur_depth));
> ++            --cxt->recur_depth;
> ++        }
> +     }
> +     TRACEME(("ok (array)"));
> +
> +@@ -2766,6 +2791,7 @@ static int store_hash(pTHX_ stcxt_t *cxt, HV *hv)
> + #endif
> +                          ) ? 1 : 0);
> +     unsigned char hash_flags =3D (SvREADONLY(hv) ? SHV_RESTRICTED : 0);
> ++    SV * const recur_sv =3D cxt->recur_sv;
> +
> +     /*
> +      * Signal hash by emitting SX_HASH, followed by the table length.
> +@@ -2817,17 +2843,17 @@ static int store_hash(pTHX_ stcxt_t *cxt, HV *hv=
)
> +         TRACEME(("size =3D %d, used =3D %d", (int)l, (int)HvUSEDKEYS(hv=
)));
> +     }
> +
> +-    TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recu=
r_depth,
> +-             PTR2UV(cxt->recur_sv)));
> +-    if (cxt->entry && cxt->recur_sv =3D=3D (SV*)hv) {
> +-        if (RECURSION_TOO_DEEP_HASH()) {
> ++    TRACEME((">hash recur_depth %" IVdf ", recur_sv (0x%" UVxf ") max %=
" IVdf, cxt->recur_depth,
> ++             PTR2UV(cxt->recur_sv), cxt->max_recur_depth_hash));
> ++    if (recur_sv !=3D (SV*)hv && cxt->max_recur_depth_hash !=3D -1) {
> ++        ++cxt->recur_depth;
> ++    }
> ++    if (RECURSION_TOO_DEEP_HASH()) {
> + #if PERL_VERSION < 15
> +-            cleanup_recursive_data(aTHX_ (SV*)hv);
> ++        cleanup_recursive_data(aTHX_ (SV*)hv);
> + #endif
> +-            CROAK((MAX_DEPTH_ERROR));
> +-        }
> ++        CROAK((MAX_DEPTH_ERROR));
> +     }
> +-    cxt->recur_sv =3D (SV*)hv;
> +
> +     /*
> +      * Save possible iteration state via each() on that table.
> +@@ -3107,8 +3133,9 @@ static int store_hash(pTHX_ stcxt_t *cxt, HV *hv)
> +     TRACEME(("ok (hash 0x%" UVxf ")", PTR2UV(hv)));
> +
> +  out:
> +-    if (cxt->entry && cxt->recur_sv =3D=3D (SV*)hv && cxt->recur_depth =
> 0) {
> +-        TRACEME(("recur_depth --%" IVdf , cxt->recur_depth));
> ++    assert(cxt->max_recur_depth_hash !=3D -1 && cxt->recur_depth > 0);
> ++    TRACEME(("<hash recur_depth --%" IVdf , cxt->recur_depth));
> ++    if (cxt->max_recur_depth_hash !=3D -1 && recur_sv !=3D (SV*)hv && c=
xt->recur_depth > 0) {
> +         --cxt->recur_depth;
> +     }
> +     HvRITER_set(hv, riter);           /* Restore hash iterator state */
> +@@ -3221,6 +3248,7 @@ static int store_lhash(pTHX_ stcxt_t *cxt, HV *hv,=
 unsigned char hash_flags)
> + #ifdef DEBUGME
> +     UV len =3D (UV)HvTOTALKEYS(hv);
> + #endif
> ++    SV * const recur_sv =3D cxt->recur_sv;
> +     if (hash_flags) {
> +         TRACEME(("store_lhash (0x%" UVxf ") (flags %x)", PTR2UV(hv),
> +                  (int) hash_flags));
> +@@ -3231,15 +3259,15 @@ static int store_lhash(pTHX_ stcxt_t *cxt, HV *h=
v, unsigned char hash_flags)
> +
> +     TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recu=
r_depth,
> +              PTR2UV(cxt->recur_sv)));
> +-    if (cxt->entry && cxt->recur_sv =3D=3D (SV*)hv) {
> +-        if (RECURSION_TOO_DEEP_HASH()) {
> ++    if (recur_sv !=3D (SV*)hv && cxt->max_recur_depth_hash !=3D -1) {
> ++        ++cxt->recur_depth;
> ++    }
> ++    if (RECURSION_TOO_DEEP_HASH()) {
> + #if PERL_VERSION < 15
> +-            cleanup_recursive_data(aTHX_ (SV*)hv);
> ++        cleanup_recursive_data(aTHX_ (SV*)hv);
> + #endif
> +-            CROAK((MAX_DEPTH_ERROR));
> +-        }
> ++        CROAK((MAX_DEPTH_ERROR));
> +     }
> +-    cxt->recur_sv =3D (SV*)hv;
> +
> +     array =3D HvARRAY(hv);
> +     for (i =3D 0; i <=3D (Size_t)HvMAX(hv); i++) {
> +@@ -3252,7 +3280,7 @@ static int store_lhash(pTHX_ stcxt_t *cxt, HV *hv,=
 unsigned char hash_flags)
> +                 return ret;
> +         }
> +     }
> +-    if (cxt->entry && cxt->recur_sv =3D=3D (SV*)hv && cxt->recur_depth =
> 0) {
> ++    if (recur_sv =3D=3D (SV*)hv && cxt->max_recur_depth_hash !=3D -1 &&=
 cxt->recur_depth > 0) {
> +         TRACEME(("recur_depth --%" IVdf, cxt->recur_depth));
> +         --cxt->recur_depth;
> +     }
> +diff --git a/dist/Storable/t/recurse.t b/dist/Storable/t/recurse.t
> +index fa8be0b37..63fde90fd 100644
> +--- a/dist/Storable/t/recurse.t
> ++++ b/dist/Storable/t/recurse.t
> +@@ -20,7 +20,7 @@ use Storable qw(freeze thaw dclone);
> +
> + $Storable::flags =3D Storable::FLAGS_COMPAT;
> +
> +-use Test::More tests =3D> 38;
> ++use Test::More tests =3D> 39;
> +
> + package OBJ_REAL;
> +
> +@@ -364,5 +364,17 @@ else {
> +         dclone $t;
> +     };
> +     like $@, qr/Max\. recursion depth with nested structures exceeded/,
> +-      'Caught href stack overflow '.MAX_DEPTH*2;
> ++      'Caught href stack overflow '.MAX_DEPTH_HASH*2;
> ++}
> ++
> ++{
> ++    # perl #133326
> ++    my @tt;
> ++    #$Storable::DEBUGME=3D1;
> ++    for (1..16000) {
> ++        my $t =3D [[[]]];
> ++        push @tt, $t;
> ++    }
> ++    ok(eval { dclone \@tt; 1 },
> ++       "low depth structure shouldn't be treated as nested");
> + }
> diff --git a/meta/recipes-devtools/perl/perl/debian/gdbm-fatal.diff b/met=
a/recipes-devtools/perl/perl/debian/gdbm-fatal.diff
> new file mode 100644
> index 0000000000..be641a04c7
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/gdbm-fatal.diff
> @@ -0,0 +1,26 @@
> +From a3232f1f2897b672ea627683a2c4ebe4ce6b6fc9 Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Sun, 12 Aug 2018 11:23:24 +0300
> +Subject: Temporarily skip GDBM_File fatal.t for gdbm >=3D 1.15 compatibi=
lity
> +
> +Bug-Debian: https://bugs.debian.org/904005
> +Bug: https://rt.perl.org/Public/Bug/Display.html?id=3D133295
> +Patch-Name: debian/gdbm-fatal.diff
> +---
> + ext/GDBM_File/t/fatal.t | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/ext/GDBM_File/t/fatal.t b/ext/GDBM_File/t/fatal.t
> +index 0e426d4db..3df6878f8 100644
> +--- a/ext/GDBM_File/t/fatal.t
> ++++ b/ext/GDBM_File/t/fatal.t
> +@@ -12,6 +12,9 @@ BEGIN {
> +     plan(skip_all =3D> "GDBM_File is flaky in $^O")
> +         if $^O =3D~ /darwin/;
> +
> ++    # temporary workaround for https://bugs.debian.org/904005
> ++    plan(skip_all =3D> "to be revised for gdbm >=3D 1.15 [perl #133295]=
");
> ++
> +     plan(tests =3D> 8);
> +     use_ok('GDBM_File');
> + }
> diff --git a/meta/recipes-devtools/perl/perl/debian/installman-utf8.diff =
b/meta/recipes-devtools/perl/perl/debian/installman-utf8.diff
> new file mode 100644
> index 0000000000..cedbe53954
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/installman-utf8.diff
> @@ -0,0 +1,28 @@
> +From d6e32320db008d3c83845c06b40d9829028e4342 Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Sat, 19 Nov 2016 21:30:46 +0200
> +Subject: Generate man pages with UTF-8 characters
> +
> +This fixes totally incorrectly rendered manual pages like
> +perlunicook and perltw.
> +
> +TODO: should probably be a Configure option for proper upstreaming.
> +
> +Bug-Debian: https://bugs.debian.org/840211
> +Patch-Name: debian/installman-utf8.diff
> +---
> + installman | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/installman b/installman
> +index 0154be4d6..fff0ff04a 100755
> +--- a/installman
> ++++ b/installman
> +@@ -161,6 +161,7 @@ sub pod2man {
> +       $manpage =3D "${mandir}/${manpage}.${manext}";
> +
> +         my $parser =3D Pod::Man->new( section =3D> $manext,
> ++                                    utf8    =3D> 1,
> +                                     official=3D> 1,
> +                                     center  =3D> 'Perl Programmers Refe=
rence Guide'
> +                                   );
> diff --git a/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff b/=
meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
> index 7e1fd697ca..22fc6aac2e 100644
> --- a/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
> @@ -1,19 +1,18 @@
> -From 26209b55201a1b2d25252ac3b425bc49081299de Mon Sep 17 00:00:00 2001
> +From be78380e2062ab6cc2090df9bf56343290055256 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Debian policy doesn't install .packlist files for core or vendo=
r.
>
>  Patch-Name: debian/instmodsh_doc.diff
> -Upstream-Status: Pending
>  ---
>   cpan/ExtUtils-MakeMaker/bin/instmodsh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
>  diff --git a/cpan/ExtUtils-MakeMaker/bin/instmodsh b/cpan/ExtUtils-MakeM=
aker/bin/instmodsh
> -index 8b9aa95..e551434 100644
> +index ab0f9d1ff..b3b109f47 100644
>  --- a/cpan/ExtUtils-MakeMaker/bin/instmodsh
>  +++ b/cpan/ExtUtils-MakeMaker/bin/instmodsh
> -@@ -18,9 +18,11 @@ instmodsh - A shell to examine installed modules
> +@@ -19,9 +19,11 @@ instmodsh - A shell to examine installed modules
>
>   =3Dhead1 DESCRIPTION
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff b/me=
ta/recipes-devtools/perl/perl/debian/ld_run_path.diff
> index ff0b2871f6..b311b963e9 100644
> --- a/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
> @@ -1,25 +1,23 @@
> -From 53ce69085918232a1b7e26e7762c1b2f70b1eb4a Mon Sep 17 00:00:00 2001
> +From 529cef46fc47937497b968b847dd1c8cfd4a356f Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Fri, 18 Mar 2005 22:22:25 +1100
>  Subject: Remove standard libs from LD_RUN_PATH as per Debian policy.
>
>  Patch-Name: debian/ld_run_path.diff
> -Upstream-Status: Pending
>  ---
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm | 3 +++
> - 1 file changed, 3 insertions(+)
> + cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm | 2 ++
> + 1 file changed, 2 insertions(+)
>
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/=
ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> -index 37bcfd4..bd66e65 100644
> +index a6da85586..fb849b21c 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> -@@ -56,6 +56,9 @@ sub _unix_os2_ext {
> -     my ( $pwd )   =3D cwd();    # from Cwd.pm
> -     my ( $found ) =3D 0;
> -
> +@@ -62,6 +62,8 @@ sub _unix_os2_ext {
> +         $potential_libs =3D~ s/(^|\s)(-(?:weak_|reexport_|lazy_)?framew=
ork)\s+(\S+)/$1-Wl,$2 -Wl,$3/g;
> +         $potential_libs =3D~ s/(^|\s)(-F)\s*(\S+)/$1-Wl,$2 -Wl,$3/g;
> +     }
>  +    # Debian-specific: don't use LD_RUN_PATH for standard dirs
>  +    $ld_run_path_seen{$_}++ for @libpath;
> -+
> +
>       foreach my $thislib ( split ' ', $potential_libs ) {
>           my ( $custom_name ) =3D '';
> -
> diff --git a/meta/recipes-devtools/perl/perl/debian/libnet_config_path.di=
ff b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
> index d5347422dc..80d09f7661 100644
> --- a/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
> @@ -1,20 +1,19 @@
> -From a7f6d453e60256d329469a75b642cca854cebea1 Mon Sep 17 00:00:00 2001
> +From 2694572acd6486b385e41ba8fd166ca25352d62e Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Set location of libnet.cfg to /etc/perl/Net as /usr may not be
>   writable.
>
>  Patch-Name: debian/libnet_config_path.diff
> -Upstream-Status: Pending
>  ---
>   cpan/libnet/lib/Net/Config.pm | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
>  diff --git a/cpan/libnet/lib/Net/Config.pm b/cpan/libnet/lib/Net/Config.=
pm
> -index 953a826..61ba12a 100644
> +index 4f822a40a..4b3978113 100644
>  --- a/cpan/libnet/lib/Net/Config.pm
>  +++ b/cpan/libnet/lib/Net/Config.pm
> -@@ -68,9 +68,8 @@ my %nc =3D (
> +@@ -72,9 +72,8 @@ my %nc =3D (
>   TRY_INTERNET_CONFIG
>   }
>
> @@ -25,7 +24,7 @@ index 953a826..61ba12a 100644
>   if (-f $file) {
>     $ref =3D eval { local $SIG{__DIE__}; do $file };
>     if (ref($ref) eq 'HASH') {
> -@@ -142,8 +141,8 @@ Net::Config - Local configuration data for libnet
> +@@ -146,8 +145,8 @@ Net::Config - Local configuration data for libnet
>   C<Net::Config> holds configuration data for the modules in the libnet
>   distribution. During installation you will be asked for these values.
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.dif=
f b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
> index 0cdc0d3e39..e4c07d0fe2 100644
> --- a/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
> @@ -1,4 +1,4 @@
> -From fb8bdbb4bf56382de099e62c2564286b9dfda46d Mon Sep 17 00:00:00 2001
> +From 4855b94473682a569ba8fbbb20c2b6f0429669ef Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Note that libperl-dev package is required for embedded linking
> @@ -6,16 +6,15 @@ Subject: Note that libperl-dev package is required for =
embedded linking
>  Bug-Debian: http://bugs.debian.org/186778
>
>  Patch-Name: debian/libperl_embed_doc.diff
> -Upstream-Status: Pending
>  ---
>   lib/ExtUtils/Embed.pm | 3 +++
>   1 file changed, 3 insertions(+)
>
>  diff --git a/lib/ExtUtils/Embed.pm b/lib/ExtUtils/Embed.pm
> -index 3f983c1..0ec8a67 100644
> +index e75e41f8c..985c35345 100644
>  --- a/lib/ExtUtils/Embed.pm
>  +++ b/lib/ExtUtils/Embed.pm
> -@@ -296,6 +296,9 @@ and extensions in your C/C++ applications.
> +@@ -293,6 +293,9 @@ and extensions in your C/C++ applications.
>   Typically, an application F<Makefile> will invoke C<ExtUtils::Embed>
>   functions while building your application.
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/locale-robustness.dif=
f b/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
> deleted file mode 100644
> index 7cf1242c0a..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 289eaf87f8de4d9ebfd661d4e4299c2952435243 Mon Sep 17 00:00:00 2001
> -From: Niko Tyni <ntyni@debian.org>
> -Date: Fri, 10 Apr 2015 10:19:51 +0300
> -Subject: Make t/run/locale.t survive missing locales masked by LC_ALL
> -
> -If LC_ALL is set to a valid locale but another LC_* setting like LC_CTYP=
E
> -isn't, t/run/locale.t would fail because it explicitly unsets LC_ALL,
> -unmasking the problem underneath. All the other tests survive such
> -a scenario.
> -
> -While this is clearly an error in the build environment, it's easy to ma=
ke
> -the test more robust by first clearing all the locale relevant variables=
.
> -
> -Bug: https://rt.perl.org/Ticket/Display.html?id=3D124310
> -Bug-Debian: https://bugs.debian.org/782068
> -Patch-Name: debian/locale-robustness.diff
> -Upstream-Status: Pending
> ----
> - t/run/locale.t | 7 +++----
> - 1 file changed, 3 insertions(+), 4 deletions(-)
> -
> -diff --git a/t/run/locale.t b/t/run/locale.t
> -index bd1a034..2105339 100644
> ---- a/t/run/locale.t
> -+++ b/t/run/locale.t
> -@@ -27,6 +27,9 @@ my @locales =3D eval { find_locales( [ &LC_ALL, &LC_CT=
YPE, &LC_NUMERIC ],
> -                                  ) };
> - skip_all("no locales available") unless @locales;
> -
> -+# reset the locale environment
> -+local @ENV{'LANG', (grep /^LC_/, keys %ENV)};
> -+
> - plan tests =3D> &last;
> -
> - my $non_C_locale;
> -@@ -58,9 +61,6 @@ EOF
> - SKIP: {
> -     skip("Windows stores locale defaults in the registry", 1 )
> -                                                             if $^O eq '=
MSWin32';
> --    local $ENV{LC_NUMERIC}; # So not taken as a default
> --    local $ENV{LC_ALL}; # so it never overrides LC_NUMERIC
> --    local $ENV{LANG};   # So not taken as a default
> -     fresh_perl_is("for (qw(@locales)) {\n" . <<'EOF',
> -         use POSIX qw(locale_h);
> -         use locale;
> -@@ -348,7 +348,6 @@ EOF
> -
> -     {
> -       local $ENV{LC_NUMERIC} =3D $different;
> --      local $ENV{LC_ALL}; # so it never overrides LC_NUMERIC
> -       fresh_perl_is(<<"EOF",
> -           use POSIX qw(locale_h);
> -
> diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker-manext.diff=
 b/meta/recipes-devtools/perl/perl/debian/makemaker-manext.diff
> new file mode 100644
> index 0000000000..5dd07cf4fd
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/makemaker-manext.diff
> @@ -0,0 +1,31 @@
> +From 0973125e36adec8cda4e31f20998f069ac610eee Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Wed, 1 Jul 2015 22:23:53 +0300
> +Subject: Make EU::MakeMaker honour MANnEXT settings in generated manpage
> + headers
> +
> +This was inherited from early changes by Brendan O'Dea, previously
> +(accidentally) in debian/prefix_changes.diff and before that in
> +debian/extutils_hacks.diff
> +
> +Patch-Name: debian/makemaker-manext.diff
> +Bug-Debian: https://bugs.debian.org/247370
> +---
> + cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm b/cpan/ExtUt=
ils-MakeMaker/lib/ExtUtils/MM_Any.pm
> +index 1a3893c30..8bb0ef2ee 100644
> +--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
> ++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
> +@@ -1090,8 +1090,8 @@ END
> +     my @man_cmds;
> +     foreach my $section (qw(1 3)) {
> +         my $pods =3D $self->{"MAN${section}PODS"};
> +-        my $p2m =3D sprintf <<'CMD', $section, $] > 5.008 ? " -u" : "";
> +-      $(NOECHO) $(POD2MAN) --section=3D%s --perm_rw=3D$(PERM_RW)%s
> ++        my $p2m =3D sprintf <<CMD, $] > 5.008 ? " -u" : "";
> ++      \$(NOECHO) \$(POD2MAN) --section=3D\$(MAN${section}EXT) --perm_rw=
=3D\$(PERM_RW)%s
> + CMD
> +         push @man_cmds, $self->split_command($p2m, map {($_,$pods->{$_}=
)} sort keys %$pods);
> +     }
> diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.dif=
f b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
> index 5f07180893..a222f6bf5f 100644
> --- a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
> @@ -1,4 +1,4 @@
> -From 593dd52f535b1f439dfd0afe52211ae8960e980a Mon Sep 17 00:00:00 2001
> +From f4000f2b84fc5fefe6210251b484b3fca7afea93 Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Sun, 24 Aug 2014 12:56:11 -0700
>  Subject: Pass LD settings through to subdirectories
> @@ -11,16 +11,15 @@ the PASTHRU list fixes this.
>
>  Bug-Debian: https://bugs.debian.org/758471
>  Patch-Name: debian/makemaker-pasthru.diff
> -Upstream-Status: Pending
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 4a8e14c..548d98e 100644
> +index 4977baa15..bb41b274b 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2793,7 +2793,7 @@ sub pasthru {
> +@@ -2955,7 +2955,7 @@ sub pasthru {
>       my($sep) =3D $Is{VMS} ? ',' : '';
>       $sep .=3D "\\\n\t";
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.=
diff b/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
> deleted file mode 100644
> index d870b608cf..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 634449066a9c810e81506425d2ca925b2fd72ab2 Mon Sep 17 00:00:00 2001
> -From: Dominic Hargreaves <dom@earth.li>
> -Date: Sat, 23 May 2015 21:15:06 +0200
> -Subject: Update t/porting/customized.dat for files patched in Debian
> -
> -Patch-Name: debian/makemaker_customized.diff
> -Upstream-Status: Pending
> ----
> - t/porting/customized.dat | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/t/porting/customized.dat b/t/porting/customized.dat
> -index 7df398d..f857bd2 100644
> ---- a/t/porting/customized.dat
> -+++ b/t/porting/customized.dat
> -@@ -1,7 +1,7 @@
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm =
7f4dfd0fe884bd42412bcf04ca80ef97b39c1d54
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm bef=
099988b15fb0b2a1f5ac48c01af1f7f36d329
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm=
 8168e18f0e3ce3ece4bb7e7c72d57ec07c67c402
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 7=
115e97a53559cb3ec061dd6f7f344e522724c4a
> -+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm=
 3493ae6f93264e967f58dedaa3dbf3dbcb249853
> -+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 3=
d7abd674b15ed323f743594ef0bd09db76b1aee
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Conf=
ig.pm f8db8d4245bf0684b8210c811f50d7cfb1a27d78
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.=
pod 757bffb47857521311f8f3bde43ebe165f8d5191
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Loca=
le.pm 82be06851deb84c6419ad003ce9b6d1957f395f3
> -@@ -13,7 +13,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUti=
ls/Mkbootstrap.pm 58872d66
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm =
ab80029ab16d38d4f2e41dc88d2ceb9f3790e477
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 453e0abb=
c4bb38db4c0820ad5c4846f313b66291
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm c1b1=
babda8f43ae7a2caba1cb4f70f92af5a0e34
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 6f90=
d94ad3e7aa0045a3b1a10a1bb18391f89f57
> -+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 21bd=
e53290bf1a4da4457290b65bd1b0ca6f1d16
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm cab=
2b3ce08b71a4ce89aa630f236eb08b852439d
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 6=
1fced0faf518bf87c265fcb51ed330ba354623f
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm a=
e0ef51a7b6dd0b05aa61c779df7167dda5f5119
> -@@ -22,7 +22,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUti=
ls/MM_MacOS.pm 0544301f712
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 4331=
35eecb85b4b1d90d3027432f329436c78447
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 1fbb=
5605bfb47feee4083feba8aa85e659628f70
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5b66=
d1f485a6034d96fc24ba1665b1bad9e447f1
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 8ce=
f99a9bd370ecfd07ddb0efbdcbb4101255e45
> -+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm c45=
5c915fb7dc3eeb1200ed1cd19048e6f21e6b1
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 939=
572fde3d59ba77c2e677fe2df2bed4bed5898
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 09c2=
049bfd25b735e2a5bcf56a6cff7b4827f9c8
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm d65d=
63f8217a55c36f62e249814988974f593c79
> diff --git a/meta/recipes-devtools/perl/perl/debian/mod_paths.diff b/meta=
/recipes-devtools/perl/perl/debian/mod_paths.diff
> index 7e22484038..b79177845c 100644
> --- a/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
> @@ -1,4 +1,4 @@
> -From 6c6cf14e204f3c031372bfd9604ad524d5691186 Mon Sep 17 00:00:00 2001
> +From 925565c3d8c4df6bc2e6d1a59995bd978f2f49d0 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Fri, 18 Mar 2005 22:22:25 +1100
>  Subject: Tweak @INC ordering for Debian
> @@ -16,32 +16,33 @@ The rationale being that an admin (via site), or modu=
le packager
>  (vendor) can chose to shadow core modules when there is a newer
>  version than is included in core.
>
> +(later updates by Niko Tyni)
> +
>  Patch-Name: debian/mod_paths.diff
> -Upstream-Status: Pending
>  ---
>   perl.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
>
>  diff --git a/perl.c b/perl.c
> -index 086645b..e64f1f4 100644
> +index e6dfa8dc0..c7828e69c 100644
>  --- a/perl.c
>  +++ b/perl.c
> -@@ -4373,6 +4373,11 @@ S_init_perllib(pTHX)
> -                     INCPUSH_ADD_SUB_DIRS|INCPUSH_CAN_RELOCATE);
> - #endif
> -
> +@@ -4674,6 +4674,10 @@ S_init_perllib(pTHX)
> +     SITEARCH, SITELIB, VENDORARCH, VENDORLIB, ARCHLIB and PRIVLIB
> + */
> +     INCPUSH_APPLLIB_EXP
>  +#ifdef DEBIAN
>  +    /* for configuration where /usr is mounted ro (CPAN::Config, Net::C=
onfig) */
>  +    S_incpush_use_sep(aTHX_ STR_WITH_LEN("/etc/perl"), 0x0);
>  +#endif
> +     INCPUSH_SITEARCH_EXP
> +     INCPUSH_SITELIB_EXP
> +     INCPUSH_PERL_VENDORARCH_EXP
> +@@ -4685,6 +4689,60 @@ S_init_perllib(pTHX)
> +     INCPUSH_APPLLIB_OLD_EXP
> +     INCPUSH_SITELIB_STEM
> +     INCPUSH_PERL_VENDORLIB_STEM
>  +
> - #ifdef SITEARCH_EXP
> -     /* sitearch is always relative to sitelib on Windows for
> -      * DLL-based path intuition to work correctly */
> -@@ -4490,6 +4495,59 @@ S_init_perllib(pTHX)
> -                     INCPUSH_ADD_OLD_VERS|INCPUSH_CAN_RELOCATE);
> - #endif
> -
>  +#ifdef DEBIAN
>  +    /* Non-versioned site directory for local modules and for
>  +       compatability with the previous packages' site dirs */
> @@ -77,16 +78,16 @@ index 086645b..e64f1f4 100644
>  +         subdirectory of sitelib */
>  +      for (p =3D vers; *p; p++)
>  +      {
> -+          if (arch_vers)
> ++          if (arch_vers && !strchr(*p, '/')) /* skip arch-specific subd=
irs */
>  +          {
> -+              strcpy(arch_vers, *p);
> ++              my_snprintf(arch_vers, 16, "%s", *p);
>  +              if (PerlLIO_stat(sitearch, &s) >=3D 0 && S_ISDIR(s.st_mod=
e))
>  +                  S_incpush_use_sep(aTHX_ sitearch, strlen(sitearch), 0=
x0);
>  +          }
>  +
> -+          if (lib_vers)
> ++          if (lib_vers && !strchr(*p, '/')) /* skip arch-specific subdi=
rs */
>  +          {
> -+              strcpy(lib_vers, *p);
> ++              my_snprintf(lib_vers, 16, "%s", *p);
>  +              if (PerlLIO_stat(sitelib, &s) >=3D 0 && S_ISDIR(s.st_mode=
))
>  +                  S_incpush_use_sep(aTHX_ sitelib, strlen(sitelib), 0x0=
);
>  +          }
> @@ -95,6 +96,6 @@ index 086645b..e64f1f4 100644
>  +#endif
>  +#endif
>  +
> - #ifdef PERL_OTHERLIBDIRS
> -     S_incpush_use_sep(aTHX_ STR_WITH_LEN(PERL_OTHERLIBDIRS),
> -                     INCPUSH_ADD_OLD_VERS|INCPUSH_ADD_ARCHONLY_SUB_DIRS
> +     INCPUSH_PERL_OTHERLIBDIRS_ARCHONLY
> +
> + #endif /* !PERL_IS_MINIPERL */
> diff --git a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal=
.diff b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
> deleted file mode 100644
> index 7484bec413..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -From 240f2f4aeb3850bc0c5370b9fbc3909573bed9b3 Mon Sep 17 00:00:00 2001
> -From: Brendan O'Dea <bod@debian.org>
> -Date: Tue, 8 Mar 2005 19:30:38 +1100
> -Subject: Don't install .packlist or perllocal.pod for perl or vendor
> -
> -Patch-Name: debian/no_packlist_perllocal.diff
> -Upstream-Status: Pending
> ----
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 35 +++---------------=
-------
> - 1 file changed, 3 insertions(+), 32 deletions(-)
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 570a631..391dc22 100644
> ---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2122,11 +2122,6 @@ pure_perl_install :: all
> - };
> -
> -     push @m,
> --q{            read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEX=
T)','.packlist').q{" \
> --              write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$=
(FULLEXT)','.packlist').q{" \
> --} unless $self->{NO_PACKLIST};
> --
> --    push @m,
> - q{            "$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> -               "$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
> -               "$(INST_BIN)" "$(DESTINSTALLBIN)" \
> -@@ -2158,10 +2153,6 @@ q{              "$(INST_LIB)" "$(DESTINSTALLSITEL=
IB)" \
> - pure_vendor_install :: all
> -       $(NOECHO) umask 022; $(MOD_INSTALL) \
> - };
> --    push @m,
> --q{            read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLE=
XT)','.packlist').q{" \
> --              write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto'=
,'$(FULLEXT)','.packlist').q{" \
> --} unless $self->{NO_PACKLIST};
> -
> -     push @m,
> - q{            "$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
> -@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
> -
> -     push @m, q{
> - doc_perl_install :: all
> --      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> --      -$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
> --      -$(NOECHO) umask 022; $(DOC_INSTALL) \
> --              "Module" "$(NAME)" \
> --              "installed into" $(INSTALLPRIVLIB) \
> --              LINKTYPE "$(LINKTYPE)" \
> --              VERSION "$(VERSION)" \
> --              EXE_FILES "$(EXE_FILES)" \
> --              >> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.p=
od').q{"
> -
> - doc_site_install :: all
> --      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> --      -$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
> -+      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSI=
TEARCH)/perllocal.pod"
> -+      -$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLSITEARCH)"
> -       -$(NOECHO) umask 02; $(DOC_INSTALL) \
> -               "Module" "$(NAME)" \
> -               "installed into" $(INSTALLSITELIB) \
> -               LINKTYPE "$(LINKTYPE)" \
> -               VERSION "$(VERSION)" \
> -               EXE_FILES "$(EXE_FILES)" \
> --              >> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.p=
od').q{"
> -+              >> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.=
pod').q{"
> -
> - doc_vendor_install :: all
> --      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> --      -$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
> --      -$(NOECHO) umask 022; $(DOC_INSTALL) \
> --              "Module" "$(NAME)" \
> --              "installed into" $(INSTALLVENDORLIB) \
> --              LINKTYPE "$(LINKTYPE)" \
> --              VERSION "$(VERSION)" \
> --              EXE_FILES "$(EXE_FILES)" \
> --              >> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.p=
od').q{"
> -
> - } unless $self->{NO_PERLLOCAL};
> -
> -@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
> -       $(NOECHO) $(NOOP)
> -
> - uninstall_from_perldirs ::
> --      $(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto'=
,'$(FULLEXT)','.packlist').q{"
> -
> - uninstall_from_sitedirs ::
> -       $(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto',=
'$(FULLEXT)','.packlist').q{"
> -
> - uninstall_from_vendordirs ::
> --      $(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto=
','$(FULLEXT)','.packlist').q{"
> - };
> -
> -     join("",@m);
> diff --git a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff b/met=
a/recipes-devtools/perl/perl/debian/patchlevel.diff
> index 2d05ae5486..51c84236f4 100644
> --- a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
> @@ -1,4 +1,4 @@
> -From b517c5e15d0871e36d0f1187661fe1dd28ddf820 Mon Sep 17 00:00:00 2001
> +From 87a4fda3b1313beb99f17b9e2b13e0bb2f3d737a Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Sun, 15 May 2011 19:35:58 +0300
>  Subject: List packaged patches in patchlevel.h
> @@ -10,13 +10,12 @@ The list of packaged patches is in patchlevel-debian.=
h, which is generated
>  from the debian/patches/ directory when building the package.
>
>  Patch-Name: debian/patchlevel.diff
> -Upstream-Status: Pending
>  ---
>   patchlevel.h | 3 +++
>   1 file changed, 3 insertions(+)
>
>  diff --git a/patchlevel.h b/patchlevel.h
> -index a0ad78b..01367b7 100644
> +index 39918ea30..8c295630b 100644
>  --- a/patchlevel.h
>  +++ b/patchlevel.h
>  @@ -137,6 +137,9 @@ static const char * const local_patches[] =3D {
> diff --git a/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-em=
ulator.patch b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-em=
ulator.patch
> index 6f1625bb1c..3e369aaab0 100644
> --- a/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.=
patch
> +++ b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.=
patch
> @@ -1,4 +1,4 @@
> -From c99c61e8f863a508a0793168011c98dc74abbd05 Mon Sep 17 00:00:00 2001
> +From 60e87a3b8a103bc3c80d7f4222e3168351b873b8 Mon Sep 17 00:00:00 2001
>  From: Dominic Hargreaves <dom@earth.li>
>  Date: Sat, 14 Apr 2012 11:34:05 +0100
>  Subject: Invoke x-terminal-emulator rather than xterm in perl5db.pl
> @@ -10,16 +10,15 @@ Bug-Debian: http://bugs.debian.org/668490
>  Forwarded: not-needed
>
>  Patch-Name: debian/perl5db-x-terminal-emulator.patch
> -Upstream-Status: Pending
>  ---
>   lib/perl5db.pl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/lib/perl5db.pl b/lib/perl5db.pl
> -index 7e7194e..c466bf3 100644
> +index ecc49a814..6eb03d7c1 100644
>  --- a/lib/perl5db.pl
>  +++ b/lib/perl5db.pl
> -@@ -6960,7 +6960,7 @@ properly set up.
> +@@ -6987,7 +6987,7 @@ properly set up.
>   sub xterm_get_fork_TTY {
>       ( my $name =3D $0 ) =3D~ s,^.*[/\\],,s;
>       open XT,
> diff --git a/meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff b/=
meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff
> new file mode 100644
> index 0000000000..964a8ca3c8
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff
> @@ -0,0 +1,28 @@
> +From 97da893f78d1234e2820fd29122d3803191b3101 Mon Sep 17 00:00:00 2001
> +From: Niko Tyni <ntyni@debian.org>
> +Date: Fri, 13 Oct 2017 11:59:34 +0300
> +Subject: Fix perldoc terminal escapes when sensible-pager is less
> +
> +This is a temporary fix while upstream is reworking the
> +pager handling.
> +
> +Bug: https://rt.cpan.org/Public/Bug/Display.html?id=3D120229
> +Bug-Debian: https://bugs.debian.org/870340
> +Patch-Name: debian/perldoc-pager.diff
> +---
> + cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm b/cpan/Pod-Perld=
oc/lib/Pod/Perldoc/ToTerm.pm
> +index 9501d6310..a5aedf630 100644
> +--- a/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm
> ++++ b/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm
> +@@ -32,7 +32,7 @@ sub pager_configuration {
> +   # do not modify anything on Windows or DOS
> +   return if ( $perldoc->is_mswin32 || $perldoc->is_dos );
> +
> +-  if ( $pager =3D~ /less/ ) {
> ++  if ( $pager =3D~ /sensible-pager|less/ ) {
> +     $self->_maybe_modify_environment('LESS');
> +   }
> +   elsif ( $pager =3D~ /more/ ) {
> diff --git a/meta/recipes-devtools/perl/perl/debian/perlivp.diff b/meta/r=
ecipes-devtools/perl/perl/debian/perlivp.diff
> index 5c7413b965..2693d2e1e8 100644
> --- a/meta/recipes-devtools/perl/perl/debian/perlivp.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/perlivp.diff
> @@ -1,4 +1,4 @@
> -From fbfbeb7a690d703a3cdc56f923e89eb7b7997d31 Mon Sep 17 00:00:00 2001
> +From fefaa5842e99d3e3284e03baf3ace00e95735872 Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Fri, 9 Jan 2009 18:54:47 +0200
>  Subject: Make perlivp skip include directories in /usr/local
> @@ -21,16 +21,15 @@ On Sat, Jan 10, 2009 at 12:37:18AM +1100, Brendan O'D=
ea wrote:
>  Signed-off-by: Niko Tyni <ntyni@debian.org>
>
>  Patch-Name: debian/perlivp.diff
> -Upstream-Status: Pending
>  ---
>   utils/perlivp.PL | 1 +
>   1 file changed, 1 insertion(+)
>
>  diff --git a/utils/perlivp.PL b/utils/perlivp.PL
> -index c2f0a11..cc49f96 100644
> +index 50d187a54..bd8091c54 100644
>  --- a/utils/perlivp.PL
>  +++ b/utils/perlivp.PL
> -@@ -153,6 +153,7 @@ my $INC_total =3D 0;
> +@@ -155,6 +155,7 @@ my $INC_total =3D 0;
>   my $INC_there =3D 0;
>   foreach (@INC) {
>       next if $_ eq '.'; # skip -d test here
> diff --git a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.di=
ff b/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
> deleted file mode 100644
> index 47075625c6..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 27a4952c2e531947dc9f2f02e2063d117e2e699a Mon Sep 17 00:00:00 2001
> -From: Niko Tyni <ntyni@debian.org>
> -Date: Sat, 18 Apr 2015 17:39:32 +0300
> -Subject: Update porting/customized.dat for pod2man modifications
> -
> -Patch-Name: debian/pod2man-customized.diff
> -Upstream-Status: Pending
> ----
> - t/porting/customized.dat | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/t/porting/customized.dat b/t/porting/customized.dat
> -index 0eed9f7..7df398d 100644
> ---- a/t/porting/customized.dat
> -+++ b/t/porting/customized.dat
> -@@ -42,7 +42,7 @@ Win32API::File cpan/Win32API-File/Makefile.PL 605d0aee=
31aebe84a99408f9ab5f644db5
> - Win32API::File cpan/Win32API-File/t/file.t 124e64aa77e755235eb297644a87=
fac5388d3d78
> - Win32API::File cpan/Win32API-File/t/tie.t 712ea7edd0cc805ce1c0b8172c01b=
03dd19b583d
> - Win32API::File cpan/Win32API-File/typemap 24bff088babeadac0873e8df390d1=
666d9d9db4a
> --podlators cpan/podlators/scripts/pod2man.PL f81acf53f3ff46cdcc5ebdd661c=
5d13eb35d20d6
> -+podlators cpan/podlators/scripts/pod2man.PL 761f35d3fcf91c1bc2f9e024a9f=
a5c62fd3fc338
> - podlators cpan/podlators/scripts/pod2text.PL b4693fcfe4a0a1b38a215cfb89=
85a65d5d025d69
> - version cpan/version/lib/version.pm d0923b895d57f1d669ae36fcf85c87b16db=
341d1
> - version vutil.c 668f17ca43e2527645674d29ba772b86330d5663
> diff --git a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff b=
/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
> deleted file mode 100644
> index b681c3e892..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -From 914948f026efce02cf0abff8b0312aaad96592ed Mon Sep 17 00:00:00 2001
> -From: Brendan O'Dea <bod@debian.org>
> -Date: Tue, 8 Mar 2005 19:30:38 +1100
> -Subject: Fiddle with *PREFIX and variables written to the makefile
> -
> -Fiddle with *PREFIX and variables written to the makefile so that
> -install directories may be changed when make is run by passing
> -PREFIX=3D to the "make install" command (used when packaging
> -modules).
> -
> -Patch-Name: debian/prefix_changes.diff
> -Upstream-Status: Pending
> ----
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm  | 12 ++++++------
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |  3 +--
> - cpan/ExtUtils-MakeMaker/t/INST.t                |  4 +---
> - cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t         | 10 +++++-----
> - 4 files changed, 13 insertions(+), 16 deletions(-)
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm b/cpan/ExtUt=
ils-MakeMaker/lib/ExtUtils/MM_Any.pm
> -index 4c00129..1ea2035 100644
> ---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
> -+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
> -@@ -902,8 +902,6 @@ all POD files in MAN1PODS and MAN3PODS.
> - sub manifypods_target {
> -     my($self) =3D shift;
> -
> --    my $man1pods      =3D '';
> --    my $man3pods      =3D '';
> -     my $dependencies  =3D '';
> -
> -     # populate manXpods & dependencies:
> -@@ -919,7 +917,7 @@ END
> -     foreach my $section (qw(1 3)) {
> -         my $pods =3D $self->{"MAN${section}PODS"};
> -         my $p2m =3D sprintf <<CMD, $] > 5.008 ? " -u" : "";
> --      \$(NOECHO) \$(POD2MAN) --section=3D$section --perm_rw=3D\$(PERM_R=
W)%s
> -+      \$(NOECHO) \$(POD2MAN) --section=3D\$(MAN${section}EXT) --perm_rw=
=3D\$(PERM_RW)%s
> - CMD
> -         push @man_cmds, $self->split_command($p2m, map {($_,$pods->{$_}=
)} sort keys %$pods);
> -     }
> -@@ -1875,9 +1873,11 @@ sub init_INSTALL_from_PREFIX {
> -         $self->{SITEPREFIX}   ||=3D $sprefix;
> -         $self->{VENDORPREFIX} ||=3D $vprefix;
> -
> --        # Lots of MM extension authors like to use $(PREFIX) so we
> --        # put something sensible in there no matter what.
> --        $self->{PREFIX} =3D '$('.uc $self->{INSTALLDIRS}.'PREFIX)';
> -+      my $p =3D $self->{PREFIX} =3D $self->{PERLPREFIX};
> -+      for my $t (qw/PERL SITE VENDOR/)
> -+      {
> -+          $self->{"${t}PREFIX"} =3D~ s!^\Q$p\E(?=3D/|$)!\$(PREFIX)!;
> -+      }
> -     }
> -
> -     my $arch    =3D $Config{archname};
> -diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 391dc22..4a8e14c 100644
> ---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -3077,8 +3077,7 @@ sub prefixify {
> -     warn "  prefixify $var =3D> $path\n" if $Verbose >=3D 2;
> -     warn "    from $sprefix to $rprefix\n" if $Verbose >=3D 2;
> -
> --    if( $self->{ARGS}{PREFIX} &&
> --        $path !~ s{^\Q$sprefix\E\b}{$rprefix}s )
> -+    if( $path !~ s{^\Q$sprefix\E\b}{$rprefix}s && $self->{ARGS}{PREFIX}=
 )
> -     {
> -
> -         warn "    cannot prefix, using default.\n" if $Verbose >=3D 2;
> -diff --git a/cpan/ExtUtils-MakeMaker/t/INST.t b/cpan/ExtUtils-MakeMaker/=
t/INST.t
> -index 91058bb..e399ced 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/INST.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/INST.t
> -@@ -65,9 +65,7 @@ isa_ok( $mm, 'ExtUtils::MakeMaker' );
> - is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
> - is( $mm->{VERSION}, 0.01,            'VERSION' );
> -
> --my $config_prefix =3D $Config{installprefixexp} || $Config{installprefi=
x} ||
> --                    $Config{prefixexp}        || $Config{prefix};
> --is( $mm->{PERLPREFIX}, $config_prefix,   'PERLPREFIX' );
> -+is( $mm->{PERLPREFIX}, '$(PREFIX)',   'PERLPREFIX' );
> -
> - is( !!$mm->{PERL_CORE}, !!$ENV{PERL_CORE}, 'PERL_CORE' );
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t b/cpan/ExtUtils-Mak=
eMaker/t/INST_PREFIX.t
> -index e8de7c6..3fb3f12 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
> -@@ -10,7 +10,7 @@ BEGIN {
> - }
> -
> - use strict;
> --use Test::More tests =3D> 52;
> -+use Test::More tests =3D> 47;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> - use ExtUtils::MakeMaker;
> -@@ -62,16 +62,16 @@ like( $stdout->read, qr{
> -                         (?:Writing\ MYMETA.yml\ and\ MYMETA.json\n)?
> - }x );
> -
> --is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' )=
;
> -+#is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' =
);
> -
> - isa_ok( $mm, 'ExtUtils::MakeMaker' );
> -
> - is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
> - is( $mm->{VERSION}, 0.01,            'VERSION' );
> -
> --foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
> --    unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
> --}
> -+#foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
> -+#    unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
> -+#}
> -
> -
> - my $PREFIX =3D File::Spec->catdir('foo', 'bar');
> diff --git a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff b/met=
a/recipes-devtools/perl/perl/debian/prune_libs.diff
> deleted file mode 100644
> index a2ed52ab2e..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From c4538f966c49e356599358def7d1febf61bca21f Mon Sep 17 00:00:00 2001
> -From: Brendan O'Dea <bod@debian.org>
> -Date: Fri, 18 Mar 2005 22:22:25 +1100
> -Subject: [PATCH 15/49] Prune the list of libraries wanted to what we act=
ually
> - need.
> -
> -Bug-Debian: http://bugs.debian.org/128355
> -
> -We want to keep the dependencies on perl-base as small as possible,
> -and some of the original list may be present on buildds (see Bug#128355)=
.
> -
> -Patch-Name: debian/prune_libs.diff
> -Upstream-Status: Pending
> ----
> - Configure | 5 ++---
> - 1 file changed, 2 insertions(+), 3 deletions(-)
> -
> -diff --git a/Configure b/Configure
> -index 5a353d6..a00df64 100755
> ---- a/Configure
> -+++ b/Configure
> -@@ -1479,8 +1479,7 @@ archname=3D''
> - usereentrant=3D'undef'
> - : List of libraries we want.
> - : If anyone needs extra -lxxx, put those in a hint file.
> --libswanted=3D"cl pthread socket bind inet nsl ndbm gdbm dbm db malloc d=
l ld"
> --libswanted=3D"$libswanted sun m crypt sec util c cposix posix ucb bsd B=
SD"
> -+libswanted=3D'gdbm gdbm_compat db dl m c crypt'
> - : We probably want to search /usr/shlib before most other libraries.
> - : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist=
.
> - glibpth=3D`echo " $glibpth " | sed -e 's! /usr/shlib ! !'`
> -@@ -24007,7 +24006,7 @@ sunos*X4*)
> -     ;;
> - *) case "$usedl" in
> -     $define|true|[yY]*)
> --          set X `echo " $libs " | sed -e 's@ -lndbm @ @' -e 's@ -lgdbm =
@ @' -e 's@ -lgdbm_compat @ @' -e 's@ -ldbm @ @' -e 's@ -ldb @ @'`
> -+          set X `echo " $libs " | sed -e 's@ -lgdbm @ @' -e 's@ -lgdbm_=
compat @ @' -e 's@ -ldb @ @'`
> -           shift
> -           perllibs=3D"$*"
> -           ;;
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-devtools/perl/perl/debian/regen-skip.diff b/met=
a/recipes-devtools/perl/perl/debian/regen-skip.diff
> deleted file mode 100644
> index 5d9a7c4b46..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From cb3e98e17a666896150b109694e9eb9278620845 Mon Sep 17 00:00:00 2001
> -From: Niko Tyni <ntyni@debian.org>
> -Date: Sat, 17 May 2014 14:57:01 +0300
> -Subject: Skip a regeneration check in unrelated git repositories
> -
> -If the test is run in a git repository without lib/.gitignore,
> -for instance because the repository only imported the Perl tarball,
> -the regeneration check is broken because lib/.gitignore is missing.
> -
> -Patch-Name: debian/regen-skip.diff
> -Upstream-Status: Pending
> ----
> - regen/lib_cleanup.pl | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/regen/lib_cleanup.pl b/regen/lib_cleanup.pl
> -index c9d6e43..fece1ed 100644
> ---- a/regen/lib_cleanup.pl
> -+++ b/regen/lib_cleanup.pl
> -@@ -159,7 +159,7 @@ foreach ('win32/Makefile', 'win32/makefile.mk') {
> - }
> -
> - # This must come last as it can exit early:
> --if ($TAP && !-d '.git' && !-f 'lib/.gitignore') {
> -+if ($TAP && !-d '.git' || !-f 'lib/.gitignore') {
> -     print "ok # skip not being run from a git checkout, hence no lib/.g=
itignore\n";
> -     exit 0;
> - }
> diff --git a/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.d=
iff b/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
> deleted file mode 100644
> index 3b3745238d..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 42853af65a28066b119d23d96e964e94b55a8541 Mon Sep 17 00:00:00 2001
> -From: Niko Tyni <ntyni@debian.org>
> -Date: Fri, 5 Aug 2011 10:50:18 +0300
> -Subject: Skip a crashing test case in t/op/threads.t on GNU/kFreeBSD
> -
> -Bug: http://rt.perl.org/rt3/Ticket/Display.html?id=3D96272
> -Bug-Debian: http://bugs.debian.org/628493
> -
> -The crash is not a regression in 5.14, it just gets triggered there by
> -a new unrelated test case.
> -
> -Skip the test until the culprit is found.
> -
> -Patch-Name: debian/skip-kfreebsd-crash.diff
> -Upstream-Status: Pending
> ----
> - t/op/threads.t | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/t/op/threads.t b/t/op/threads.t
> -index e76c956..bec210b 100644
> ---- a/t/op/threads.t
> -+++ b/t/op/threads.t
> -@@ -376,6 +376,9 @@ EOF
> - }
> -
> -
> -+SKIP: {
> -+    skip "[perl #96272] avoid crash on GNU/kFreeBSD", 1
> -+        if $^O eq 'gnukfreebsd';
> - # [perl #78494] Pipes shared between threads block when closed
> - {
> -   my $perl =3D which_perl;
> -@@ -384,6 +387,7 @@ EOF
> -   threads->create(sub { })->join;
> -   ok(1, "Pipes shared between threads do not block when closed");
> - }
> -+}
> -
> - # [perl #105208] Typeglob clones should not be cloned again during a jo=
in
> - {
> diff --git a/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tes=
ts.diff b/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.di=
ff
> deleted file mode 100644
> index 279f4ab76f..0000000000
> --- a/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From ae9b645d6da2990fd055368eca2c67c449474e38 Mon Sep 17 00:00:00 2001
> -From: Niko Tyni <ntyni@debian.org>
> -Date: Fri, 22 Apr 2011 11:15:32 +0300
> -Subject: Skip tests specific to the upstream Git repository
> -
> -These tests fail if run from a different git repository than
> -upstream. This complicates things needlessly for downstream packagers.
> -
> -Skip the tests altogether even if the .git directory exists.
> -
> -Patch-Name: debian/skip-upstream-git-tests.diff
> -Upstream-Status: Pending
> ----
> - t/test.pl | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/t/test.pl b/t/test.pl
> -index cda3840..af579a2 100644
> ---- a/t/test.pl
> -+++ b/t/test.pl
> -@@ -174,7 +174,7 @@ sub skip_all_without_unicode_tables { # (but only un=
der miniperl)
> -
> - sub find_git_or_skip {
> -     my ($source_dir, $reason);
> --    if (-d '.git') {
> -+    if (-d '.git' && ! -d 'debian') {
> -       $source_dir =3D '.';
> -     } elsif (-l 'MANIFEST' && -l 'AUTHORS') {
> -       my $where =3D readlink 'MANIFEST';
> diff --git a/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnin=
gs.diff b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.di=
ff
> index 4964e480c7..c32604cd7a 100644
> --- a/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
> @@ -1,4 +1,4 @@
> -From 487a6d6ada0b08e6a7276520ebc61cd851005e7c Mon Sep 17 00:00:00 2001
> +From 00d78fe58313e940fe41d73d57aa08374e7313bd Mon Sep 17 00:00:00 2001
>  From: Niko Tyni <ntyni@debian.org>
>  Date: Sun, 3 Oct 2010 21:36:17 +0300
>  Subject: Squelch locale warnings in Debian package maintainer scripts
> @@ -14,33 +14,30 @@ Any real locale problem will show up after the system=
 upgrade too, and
>  the warning will be triggered normally again at that point.
>
>  Patch-Name: debian/squelch-locale-warnings.diff
> -Upstream-Status: Pending
>  ---
> - locale.c           | 5 ++++-
> + locale.c           | 3 +++
>   pod/perllocale.pod | 8 ++++++++
> - 2 files changed, 12 insertions(+), 1 deletion(-)
> + 2 files changed, 11 insertions(+)
>
>  diff --git a/locale.c b/locale.c
> -index 7a4a418..fdf911d 100644
> +index 765334047..aedd7da0c 100644
>  --- a/locale.c
>  +++ b/locale.c
> -@@ -674,7 +674,10 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
> +@@ -3142,6 +3142,9 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
>
>       const bool locwarn =3D (printwarn > 1
> -                           || (printwarn
> --                              && (! bad_lang_use_once
> +                           || (          printwarn
>  +                              &&
>  +                                 /* Debian specific change - see http:/=
/bugs.debian.org/508764 */
> -+                                 (!PerlEnv_getenv("DPKG_RUNNING_VERSION=
")) &&
> -+                                 (! bad_lang_use_once
> ++                                 (    ! PerlEnv_getenv("DPKG_RUNNING_VE=
RSION"))
> +                               && (    ! bad_lang_use_once
>                                     || (
> -                                     /* disallow with "" or "0" */
> -                                     *bad_lang_use_once
> +                                          /* disallow with "" or "0" */
>  diff --git a/pod/perllocale.pod b/pod/perllocale.pod
> -index 701b422..58cabaf 100644
> +index a32f72c88..e12b81cc4 100644
>  --- a/pod/perllocale.pod
>  +++ b/pod/perllocale.pod
> -@@ -1217,6 +1217,14 @@ B<NOTE>: C<PERL_BADLANG> only gives you a way to =
hide the warning message.
> +@@ -1293,6 +1293,14 @@ B<NOTE>: C<PERL_BADLANG> only gives you a way to =
hide the warning message.
>   The message tells about some problem in your system's locale support,
>   and you should investigate what the problem is.
>
> diff --git a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.di=
ff b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
> index ab373b333c..4a45d20b7e 100644
> --- a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
> @@ -1,4 +1,4 @@
> -From 591c1f9b7d4755bfc59d9665bab1f2ca410de765 Mon Sep 17 00:00:00 2001
> +From 87ee7a51218104441423b861e4e82e1439d1f836 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Set umask approproately for site install directories
> @@ -6,16 +6,15 @@ Subject: Set umask approproately for site install direc=
tories
>  Policy requires group writable site directories
>
>  Patch-Name: debian/writable_site_dirs.diff
> -Upstream-Status: Pending
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 197f102..5f1b87f 100644
> +index 274e35c6f..dbb8651a9 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2138,7 +2138,7 @@ q{               "$(INST_LIB)" "$(DESTINSTALLPRIVL=
IB)" \
> +@@ -2249,7 +2249,7 @@ q{               "$(INST_LIB)" "$(DESTINSTALLPRIVL=
IB)" \
>
>
>   pure_site_install :: all
> @@ -24,7 +23,7 @@ index 197f102..5f1b87f 100644
>   };
>       push @m,
>   q{            read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT=
)','.packlist').q{" \
> -@@ -2199,8 +2199,8 @@ doc_perl_install :: all
> +@@ -2310,8 +2310,8 @@ doc_perl_install :: all
>
>   doc_site_install :: all
>         $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> @@ -33,5 +32,5 @@ index 197f102..5f1b87f 100644
>  +      -$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +      -$(NOECHO) umask 02; $(DOC_INSTALL) \
>                 "Module" "$(NAME)" \
> -               "installed into" $(INSTALLSITELIB) \
> +               "installed into" "$(INSTALLSITELIB)" \
>                 LINKTYPE "$(LINKTYPE)" \
> diff --git a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch b/meta/r=
ecipes-devtools/perl/perl/fix_bad_rpath.patch
> index 49efcbeefc..aee35f7381 100644
> --- a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
> +++ b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
> @@ -10,13 +10,13 @@ This fixes this warning for perl recipe as well as li=
bxml-parser-perl recipe.
>  It is a fix to MakeMaker within perl, so all such perl recipes will get
>  fixed with this perl fix.
>
> -Index: perl-5.24.1/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.24.1.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> -+++ perl-5.24.1/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> -@@ -57,6 +57,7 @@ sub _unix_os2_ext {
> -     my ( $found ) =3D 0;
> -
> +diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/=
ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> +index fb849b21ca..a12ebf0775 100644
> +--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> ++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> +@@ -63,6 +63,7 @@ sub _unix_os2_ext {
> +         $potential_libs =3D~ s/(^|\s)(-F)\s*(\S+)/$1-Wl,$2 -Wl,$3/g;
> +     }
>       # Debian-specific: don't use LD_RUN_PATH for standard dirs
>  +    push(@libpath, "SYSROOTLIB");
>       $ld_run_path_seen{$_}++ for @libpath;
> diff --git a/meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.p=
atch b/meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.patch
> new file mode 100644
> index 0000000000..3ca4b33e5a
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.patch
> @@ -0,0 +1,20 @@
> +Avoids issues like
> +Can't locate lib/Config.pm in @INC (you may need to install the lib::Con=
fig module) (@INC contains: ...) at configpm line 1145
> +
> +Upstream-Status:Inappropriate [embedded specific]
> +
> +diff --git a/configpm b/configpm
> +index 09c4a3b7a7..dbe29cf40b 100755
> +--- a/configpm
> ++++ b/configpm
> +@@ -124,8 +124,8 @@ if ($Opts{chdir}) {
> + my ($Config_SH, $Config_PM, $Config_heavy, $Config_POD);
> + my $Glossary =3D 'Porting/Glossary';
> +
> +-$Config_PM =3D "lib/Config.pm";
> +-$Config_POD =3D "lib/Config.pod";
> ++$Config_PM =3D "./lib/Config.pm";
> ++$Config_POD =3D "./lib/Config.pod";
> + $Config_SH =3D "config.sh";
> +
> + ($Config_heavy =3D $Config_PM) =3D~ s/\.pm$/_heavy.pl/;
> diff --git a/meta/recipes-devtools/perl/perl/fix_write_buildcustomize.pl_=
no_dot_in_INC.patch b/meta/recipes-devtools/perl/perl/fix_write_buildcustom=
ize.pl_no_dot_in_INC.patch
> new file mode 100644
> index 0000000000..b13c95f389
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/fix_write_buildcustomize.pl_no_dot_=
in_INC.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status:Inappropriate [embedded specific]
> +
> +diff --git a/write_buildcustomize.pl b/write_buildcustomize.pl
> +index 8666a6bce2..6b4de3aeed 100644
> +--- a/write_buildcustomize.pl
> ++++ b/write_buildcustomize.pl
> +@@ -3,7 +3,7 @@
> + use strict;
> +
> + my $osname =3D $^O;
> +-my $file =3D 'lib/buildcustomize.pl';
> ++my $file =3D './lib/buildcustomize.pl';
> +
> + if ( @ARGV % 2 ) {
> +     my $dir =3D shift;
> diff --git a/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch b/me=
ta/recipes-devtools/perl/perl/letgcc-find-errno.patch
> index 5161e4c8b6..ab02037deb 100644
> --- a/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
> +++ b/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
> @@ -10,12 +10,12 @@ external toolchain since perl will search in ${STAGIN=
G_INCDIR} for
>  errno.h (when using gcc) and that isn't where it's located - its
>  wherever the external toolchain keeps it's headers.
>
> -Index: perl-5.12.3/ext/Errno/Errno_pm.PL
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.12.3.orig/ext/Errno/Errno_pm.PL
> -+++ perl-5.12.3/ext/Errno/Errno_pm.PL
> -@@ -17,8 +17,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
> - open OUT, ">Errno.tmp" or die "Cannot open Errno.tmp: $!";
> +diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
> +index d565f31b2f..479a8f5c17 100644
> +--- a/ext/Errno/Errno_pm.PL
> ++++ b/ext/Errno/Errno_pm.PL
> +@@ -16,8 +16,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
> + open OUT, '>', 'Errno.tmp' or die "Cannot open Errno.tmp: $!";
>   select OUT;
>   my $file;
>  -my @files =3D get_files();
> @@ -35,7 +35,7 @@ Index: perl-5.12.3/ext/Errno/Errno_pm.PL
>       # MinGW complains "warning: #pragma system_header ignored outside i=
nclude
>       # file" if the header files are processed individually, so include =
them
>       # all in .c file and process that instead.
> -@@ -53,7 +63,7 @@ sub process_file {
> +@@ -52,7 +62,7 @@ sub process_file {
>           chomp($file =3D `cygpath -w "$file"`);
>       }
>
> diff --git a/meta/recipes-devtools/perl/perl/native-nopacklist.patch b/me=
ta/recipes-devtools/perl/perl/native-nopacklist.patch
> deleted file mode 100644
> index 5482dcb79c..0000000000
> --- a/meta/recipes-devtools/perl/perl/native-nopacklist.patch
> +++ /dev/null
> @@ -1,91 +0,0 @@
> -Upstream-Status:Inappropriate [debian patch]
> -
> -Part of 52_debian_extutils_hacks.patch just to exclude the installation =
of .packlist files
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |   35 ++--------------=
-------
> - 1 file changed, 3 insertions(+), 32 deletions(-)
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtU=
tils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index f63145c..a589710 100644
> ---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2122,11 +2122,6 @@ pure_perl_install :: all
> - };
> -
> -     push @m,
> --q{            read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEX=
T)','.packlist').q{" \
> --              write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$=
(FULLEXT)','.packlist').q{" \
> --} unless $self->{NO_PACKLIST};
> --
> --    push @m,
> - q{            "$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> -               "$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
> -               "$(INST_BIN)" "$(DESTINSTALLBIN)" \
> -@@ -2158,10 +2153,6 @@ q{              "$(INST_LIB)" "$(DESTINSTALLSITEL=
IB)" \
> - pure_vendor_install :: all
> -       $(NOECHO) $(MOD_INSTALL) \
> - };
> --    push @m,
> --q{            read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLE=
XT)','.packlist').q{" \
> --              write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto'=
,'$(FULLEXT)','.packlist').q{" \
> --} unless $self->{NO_PACKLIST};
> -
> -     push @m,
> - q{            "$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
> -@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
> -
> -     push @m, q{
> - doc_perl_install :: all
> --      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> --      -$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
> --      -$(NOECHO) $(DOC_INSTALL) \
> --              "Module" "$(NAME)" \
> --              "installed into" $(INSTALLPRIVLIB) \
> --              LINKTYPE "$(LINKTYPE)" \
> --              VERSION "$(VERSION)" \
> --              EXE_FILES "$(EXE_FILES)" \
> --              >> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.p=
od').q{"
> -
> - doc_site_install :: all
> --      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> --      -$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
> -+      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSI=
TEARCH)/perllocal.pod"
> -+      -$(NOECHO) $(MKPATH) "$(DESTINSTALLSITEARCH)"
> -       -$(NOECHO) $(DOC_INSTALL) \
> -               "Module" "$(NAME)" \
> -               "installed into" $(INSTALLSITELIB) \
> -               LINKTYPE "$(LINKTYPE)" \
> -               VERSION "$(VERSION)" \
> -               EXE_FILES "$(EXE_FILES)" \
> --              >> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.p=
od').q{"
> -+              >> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.=
pod').q{"
> -
> - doc_vendor_install :: all
> --      $(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLAR=
CHLIB)/perllocal.pod"
> --      -$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
> --      -$(NOECHO) $(DOC_INSTALL) \
> --              "Module" "$(NAME)" \
> --              "installed into" $(INSTALLVENDORLIB) \
> --              LINKTYPE "$(LINKTYPE)" \
> --              VERSION "$(VERSION)" \
> --              EXE_FILES "$(EXE_FILES)" \
> --              >> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.p=
od').q{"
> -
> - } unless $self->{NO_PERLLOCAL};
> -
> -@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
> -       $(NOECHO) $(NOOP)
> -
> - uninstall_from_perldirs ::
> --      $(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto'=
,'$(FULLEXT)','.packlist').q{"
> -
> - uninstall_from_sitedirs ::
> -       $(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto',=
'$(FULLEXT)','.packlist').q{"
> -
> - uninstall_from_vendordirs ::
> --      $(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto=
','$(FULLEXT)','.packlist').q{"
> - };
> -
> -     join("",@m);
> diff --git a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcry=
pt_fix.patch b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcry=
pt_fix.patch
> deleted file mode 100644
> index ff3d6dc099..0000000000
> --- a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.=
patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -commit 13e70b397dcb0d1bf4a869b670f041c1d7b730d0
> -Author: Bj=E0=B8=A3=E0=B8=96rn Esser <besser82@fedoraproject.org>
> -Date:   Sat Jan 20 20:22:53 2018 +0100
> -
> -    pp: Guard fix for really old bug in glibc libcrypt
> -
> -Upstream-Status: Pending
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -
> -diff --git a/pp.c b/pp.c
> -index d50ad7ddbf..6510c7b15c 100644
> ---- a/pp.c
> -+++ b/pp.c
> -@@ -3650,8 +3650,12 @@ PP(pp_crypt)
> - #if defined(__GLIBC__) || defined(__EMX__)
> -       if (PL_reentrant_buffer->_crypt_struct_buffer) {
> -           PL_reentrant_buffer->_crypt_struct_buffer->initialized =3D 0;
> --          /* work around glibc-2.2.5 bug */
> -+#if (defined(__GLIBC__) && __GLIBC__ =3D=3D 2) && \
> -+    (defined(__GLIBC_MINOR__) && __GLIBC_MINOR__ >=3D 2 && __GLIBC_MINO=
R__ < 4)
> -+          /* work around glibc-2.2.5 bug, has been fixed at some
> -+           * time in glibc-2.3.X */
> -           PL_reentrant_buffer->_crypt_struct_buffer->current_saltbits =
=3D 0;
> -+#endif
> -       }
> - #endif
> -     }
> -
> diff --git a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-=
out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl/perl-PathTools-do=
n-t-filter-out-blib-from-INC.patch
> deleted file mode 100644
> index 7dd904140a..0000000000
> --- a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-bli=
b-from-INC.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 2001
> -From: Wenzong Fan <wenzong.fan@windriver.com>
> -Date: Wed, 11 Feb 2015 15:14:40 +0800
> -Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
> -
> -If $TOPDIR includes the string "blib", filter it out from @INC may empty
> -the @INC and cause build errors like:
> -
> -  Can't locate ExtUtils/MakeMaker.pm in @INC \
> -  (you may need to install the ExtUtils::MakeMaker module) \
> -  (@INC contains: .) at Makefile.PL
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ----
> - dist/PathTools/Makefile.PL | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
> -index 1b21de4..f562cb2 100644
> ---- a/dist/PathTools/Makefile.PL
> -+++ b/dist/PathTools/Makefile.PL
> -@@ -1,6 +1,3 @@
> --
> --BEGIN { @INC =3D grep {!/blib/} @INC }
> --
> - require 5.005;
> - use ExtUtils::MakeMaker;
> - WriteMakefile
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/perl/perl/perl-dynloader.patch b/meta/=
recipes-devtools/perl/perl/perl-dynloader.patch
> index 2572067a6e..598117a5c2 100644
> --- a/meta/recipes-devtools/perl/perl/perl-dynloader.patch
> +++ b/meta/recipes-devtools/perl/perl/perl-dynloader.patch
> @@ -17,14 +17,14 @@ Index: perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
>
>  +    # OE: Allow env to form dynamic loader to look in a different place
>  +    # This is so it finds the host .so files, not the targets
> -+    if (defined $ENV{PERLHOSTLIB})
> ++    if (defined $ENV{PERLHOSTARCHLIB})
>  +    {
> -+        my $hostlib =3D $ENV{PERLHOSTLIB};
> ++        my $hostarchlib =3D $ENV{PERLHOSTARCHLIB};
>  +        print STDERR "*** Module name IN: $modlibname\n";
>  +        ($p1, $p2, $p3, $p4, $p5) =3D $modlibname =3D~ m/(^(.*lib\w*\/)=
?)((perl\/[0-9\.]*\/)?)(.*)$/;
>  +        print STDERR "*** p1: $p1  p3: $p3  p5: $p5\n";
> -+        if ( $p1 ne "" ) {
> -+            $modlibname =3D $hostlib.$p5;
> ++        if ( $p1 ne "" and 0 !=3D index($modlibname, $hostarchlib) ) {
> ++            $modlibname =3D $hostarchlib.$p5;
>  +        }
>  +        print STDERR "*** Module name OUT: $modlibname\n";
>  +    }
> diff --git a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-sk=
ip_all-and-END.patch b/meta/recipes-devtools/perl/perl/perl-fix-conflict-be=
tween-skip_all-and-END.patch
> deleted file mode 100644
> index de946dbec7..0000000000
> --- a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-=
and-END.patch
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -Some Perl tests fail when run on a cross-compiled target machine. Apply
> -a slightly tweaked upstream patch to fix the problems. Notes:
> -    1. as of 2 Jun 2016, the original patch has been applied to the curr=
ent
> -       EUMM releases, but has not made it into perl core yet.
> -    2. when the base perl package is upgraded in Yocto, this patch may n=
eed
> -       to be replaced by the original upstream version to correctly appl=
y
> -       to the current version of ExtUtils-MakeMaker at that time.
> -
> -[YOCTO #8656]
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Bill Randle <william.c.randle@intel.com>
> -
> -From 4a07a3bd18363986112cf2b39dec3c2985353ffb Mon Sep 17 00:00:00 2001
> -From: Francois Perrad <francois.perrad@gadz.org>
> -Date: Mon, 22 Dec 2014 19:04:34 +0100
> -Subject: [PATCH] fix conflict between skip_all and END section
> -
> -since the commit 430de781809a6be3bcd25a349dc40ce54405ab53
> -the test suite fails in cross-compil environment (perl-5.21.6 & perl-5.2=
1.7)
> -like this :
> -
> -    $ ./perl harness -v ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -    ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t ..
> -    1..0 # SKIP cross-compiling and make not available
> -    ok 1 - chdir updir
> -    ok 2 - teardown
> -    # Looks like you planned 0 tests but ran 2.
> -    skipped: cross-compiling and make not available
> -
> -this commit restores the implicit call of plan() at import time of Test:=
:More
> -
> -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ----
> - cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t     | 7 ++++---
> - cpan/ExtUtils-MakeMaker/t/PL_FILES.t         | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/basic.t            | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/echo.t             | 6 +++---
> - cpan/ExtUtils-MakeMaker/t/min_perl_version.t | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/pm_to_blib.t       | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/recurs.t           | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/several_authors.t  | 4 ++--
> - 8 files changed, 19 insertions(+), 18 deletions(-)
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t b/cpan/ExtUtils-Ma=
keMaker/t/INSTALL_BASE.t
> -index f27b62c..3bbb3a6 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -@@ -15,12 +15,13 @@ $CLEANUP &&=3D 1; # so always 1 or numerically 0
> -
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> --use Test::More;
> - use Config;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> --    : (tests =3D> 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP));
> -+    : ();
> -+plan tests =3D> 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP);
> -
> - my $Is_VMS =3D $^O eq 'VMS';
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t b/cpan/ExtUtils-MakeMa=
ker/t/PL_FILES.t
> -index 0779dbb..85d53a5 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
> -@@ -11,9 +11,9 @@ use File::Temp qw[tempdir];
> - use MakeMaker::Test::Setup::PL_FILES;
> - use MakeMaker::Test::Utils;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> -     : (tests =3D> 9);
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/basic.t b/cpan/ExtUtils-MakeMaker=
/t/basic.t
> -index 3dd66ad..eddf2e9 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/basic.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/basic.t
> -@@ -20,9 +20,9 @@ use utf8;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> -     : (tests =3D> 171);
> - use File::Find;
> -diff --git a/cpan/ExtUtils-MakeMaker/t/echo.t b/cpan/ExtUtils-MakeMaker/=
t/echo.t
> -index 789b85f..c43bc47 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/echo.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/echo.t
> -@@ -14,11 +14,11 @@ use MakeMaker::Test::Utils;
> - use File::Temp;
> - use Cwd 'abs_path';
> -
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> --    : ();
> -+    : (tests =3D> 18);
> -
> - #--------------------- Setup
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t b/cpan/ExtUtil=
s-MakeMaker/t/min_perl_version.t
> -index c5d78d6..2ef118d 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
> -@@ -13,9 +13,9 @@ use TieOut;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::MPV;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> -     : (tests =3D> 36);
> - use File::Path;
> -diff --git a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t b/cpan/ExtUtils-Make=
Maker/t/pm_to_blib.t
> -index f1e348e..ebfa26c 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
> -@@ -12,9 +12,9 @@ use ExtUtils::MakeMaker;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> -     : 'no_plan';
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/recurs.t b/cpan/ExtUtils-MakeMake=
r/t/recurs.t
> -index 84c09a2..661e0db 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/recurs.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/recurs.t
> -@@ -14,9 +14,9 @@ use File::Temp qw[tempdir];
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::Recurs;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> -     : (tests =3D> 26);
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/several_authors.t b/cpan/ExtUtils=
-MakeMaker/t/several_authors.t
> -index 1a75a3e..869e9f0 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/several_authors.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/several_authors.t
> -@@ -13,9 +13,9 @@ use TieOut;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::SAS;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompil=
e'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile=
'}
> -     ? (skip_all =3D> "cross-compiling and make not available")
> -     : (tests =3D> 20);
> - use File::Path;
> diff --git a/meta/recipes-devtools/perl/perl/perl-moreconfig.patch b/meta=
/recipes-devtools/perl/perl/perl-moreconfig.patch
> index 59ce85a7a3..e3a9588ba0 100644
> --- a/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
> +++ b/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
> @@ -5,11 +5,13 @@ expand the number of items included. While this works i=
t indicates that the
>  rest of the config items are not being picked up and/or are being picked=
 up
>  from the host. More investigation needed.
>
> ---- perl-5.8.8/configpm        2007/04/20 09:48:05     1.1
> -+++ perl-5.8.8/configpm        2007/04/20 09:57:12
> -@@ -2,7 +2,7 @@
> +diff --git a/configpm b/configpm
> +index 09c4a3b7a7..543be59f06 100755
> +--- a/configpm
> ++++ b/configpm
> +@@ -37,7 +37,7 @@ EOF
>   use strict;
> - use vars qw(%Config $Config_SH_expanded);
> + our (%Config, $Config_SH_expanded);
>
>  -my $how_many_common =3D 22;
>  +my $how_many_common =3D 50;
> diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-dev=
tools/perl/perl_5.24.4.bb
> deleted file mode 100644
> index a644970192..0000000000
> --- a/meta/recipes-devtools/perl/perl_5.24.4.bb
> +++ /dev/null
> @@ -1,353 +0,0 @@
> -require perl.inc
> -
> -# We need gnugrep (for -I)
> -DEPENDS =3D "db grep-native gdbm zlib virtual/crypt"
> -
> -# Pick up patches from debian
> -# http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.22.0-1.debian.=
tar.xz
> -SRC_URI +=3D " \
> -       file://debian/cpan_definstalldirs.diff \
> -       file://debian/db_file_ver.diff \
> -       file://debian/doc_info.diff \
> -       file://debian/enc2xs_inc.diff \
> -       file://debian/errno_ver.diff \
> -       file://debian/libperl_embed_doc.diff \
> -       file://debian/fixes/respect_umask.diff \
> -       file://debian/writable_site_dirs.diff \
> -       file://debian/extutils_set_libperl_path.diff \
> -       file://debian/no_packlist_perllocal.diff \
> -       file://debian/prefix_changes.diff \
> -       file://debian/instmodsh_doc.diff \
> -       file://debian/ld_run_path.diff \
> -       file://debian/libnet_config_path.diff \
> -       file://debian/mod_paths.diff \
> -       file://debian/prune_libs.diff \
> -       file://debian/fixes/net_smtp_docs.diff \
> -       file://debian/perlivp.diff \
> -       file://debian/squelch-locale-warnings.diff \
> -       file://debian/skip-upstream-git-tests.diff \
> -       file://debian/skip-kfreebsd-crash.diff \
> -       file://debian/fixes/document_makemaker_ccflags.diff \
> -       file://debian/find_html2text.diff \
> -       file://debian/perl5db-x-terminal-emulator.patch \
> -       file://debian/cpan-missing-site-dirs.diff \
> -       file://debian/fixes/memoize_storable_nstore.diff \
> -       file://debian/regen-skip.diff \
> -"
> -
> -SRC_URI +=3D " \
> -        file://Makefile.patch \
> -        file://Makefile.SH.patch \
> -        file://installperl.patch \
> -        file://perl-archlib-exp.patch \
> -        file://perl-dynloader.patch \
> -        file://perl-moreconfig.patch \
> -        file://letgcc-find-errno.patch \
> -        file://generate-sh.patch \
> -        file://native-perlinc.patch \
> -        file://cross-generate_uudmap.patch \
> -        file://fix_bad_rpath.patch \
> -        file://dynaloaderhack.patch \
> -        file://config.sh \
> -        file://config.sh-32 \
> -        file://config.sh-32-le \
> -        file://config.sh-32-be \
> -        file://config.sh-64 \
> -        file://config.sh-64-le \
> -        file://config.sh-64-be \
> -        file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patc=
h \
> -        file://t-run-switches.t-perl5-perl.patch \
> -        file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
> -        file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patc=
h \
> -        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
> -        file://perl-errno-generation-gcc5.patch \
> -        file://perl-fix-conflict-between-skip_all-and-END.patch \
> -        file://perl-5.26.1-guard_old_libcrypt_fix.patch \
> -        file://CVE-2018-12015.patch \
> -        file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
> -"
> -
> -# Fix test case issues
> -SRC_URI_append_class-target =3D " \
> -            file://test/dist-threads-t-join.t-adjust-ps-option.patch \
> -            file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_fin=
dfil.patch \
> -            file://0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-se=
t.patch \
> -           "
> -
> -SRC_URI[md5sum] =3D "04622bc4d3941dc7eb571c52b7c02993"
> -SRC_URI[sha256sum] =3D "7f080287ff64750270689843ae945f02159a33cb8f2fc910=
248c15befba5db84"
> -
> -inherit perlnative siteinfo
> -
> -# Where to find the native perl
> -HOSTPERL =3D "${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
> -
> -# Where to find .so files - use the -native versions not those from the =
target build
> -export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/=
"
> -
> -# Where to find perl @INC/#include files
> -# - use the -native versions not those from the target build
> -export PERL_LIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
> -export PERL_ARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}=
/"
> -
> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> -
> -# LDFLAGS for shared libraries
> -export LDDLFLAGS =3D "${LDFLAGS} -shared"
> -
> -LDFLAGS_append =3D " -fstack-protector"
> -
> -# We're almost Debian, aren't we?
> -CFLAGS +=3D "-DDEBIAN"
> -
> -do_configure() {
> -        # Make hostperl in build directory be the native perl
> -        ln -sf ${HOSTPERL} hostperl
> -
> -       if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; =
then
> -               if [ "`cat ${CONFIGURESTAMPFILE}`" !=3D "${BB_TASKHASH}" =
-a -e Makefile ]; then
> -                       ${MAKE} clean
> -               fi
> -               find ${S} -name *.so -delete
> -       fi
> -       if [ -n "${CONFIGURESTAMPFILE}" ]; then
> -               echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> -       fi
> -
> -        # Do our work in the cross subdir
> -        cd Cross
> -
> -        # Generate configuration
> -        rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
> -        for i in ${WORKDIR}/config.sh \
> -                 ${WORKDIR}/config.sh-${SITEINFO_BITS} \
> -                 ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIAN=
NESS}; do
> -            cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
> -        done
> -
> -        # Fixups for musl
> -        if [ "${TARGET_OS}" =3D "linux-musl" -o "${TARGET_OS}" =3D "linu=
x-musleabi" -o "${TARGET_OS}" =3D "linux-muslx32" ]; then
> -                sed -i -e "s,\(d_libm_lib_version=3D\)'define',\1'undef'=
,g" \
> -                       -e "s,\(d_stdio_ptr_lval=3D\)'define',\1'undef',g=
" \
> -                       -e "s,\(d_stdio_ptr_lval_sets_cnt=3D\)'define',\1=
'undef',g" \
> -                       -e "s,\(d_stdiobase=3D\)'define',\1'undef',g" \
> -                       -e "s,\(d_stdstdio=3D\)'define',\1'undef',g" \
> -                       -e "s,\(d_getnetbyname_r=3D\)'define',\1'undef',g=
" \
> -                       -e "s,\(d_finitel=3D\)'define',\1'undef',g" \
> -                       -e "s,\(getprotobyname_r=3D\)'define',\1'undef',g=
" \
> -                       -e "s,\(getpwent_r=3D\)'define',\1'undef',g" \
> -                       -e "s,\(getservent_r=3D\)'define',\1'undef',g" \
> -                       -e "s,\(gethostent_r=3D\)'define',\1'undef',g" \
> -                       -e "s,\(getnetent_r=3D\)'define',\1'undef',g" \
> -                       -e "s,\(getnetbyaddr_r=3D\)'define',\1'undef',g" =
\
> -                       -e "s,\(getprotoent_r=3D\)'define',\1'undef',g" \
> -                       -e "s,\(getprotobynumber_r=3D\)'define',\1'undef'=
,g" \
> -                       -e "s,\(getgrent_r=3D\)'define',\1'undef',g" \
> -                       -e "s,\(i_fcntl=3D\)'undef',\1'define',g" \
> -                       -e "s,\(h_fcntl=3D\)'false',\1'true',g" \
> -                       -e "s,-fstack-protector,-fno-stack-protector,g" \
> -                    config.sh-${TARGET_ARCH}-${TARGET_OS}
> -        fi
> -
> -        # Update some paths in the configuration
> -        sed -i -e 's,@ARCH@-thread-multi,,g' \
> -               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
> -               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> -               -e "s,@INCLUDEDIR@,${STAGING_INCDIR},g" \
> -               -e "s,@LIBDIR@,${libdir},g" \
> -               -e "s,@BASELIBDIR@,${base_libdir},g" \
> -               -e "s,@EXECPREFIX@,${exec_prefix},g" \
> -               -e 's,@USRBIN@,${bindir},g' \
> -               -e "s,-lnsl,,g" \
> -            config.sh-${TARGET_ARCH}-${TARGET_OS}
> -
> -       case "${TARGET_ARCH}" in
> -               x86_64 | powerpc | s390)
> -                       sed -i -e "s,\(need_va_copy=3D\)'undef',\1'define=
',g" \
> -                               config.sh-${TARGET_ARCH}-${TARGET_OS}
> -                       ;;
> -               arm)
> -                       sed -i -e "s,\(d_u32align=3D\)'undef',\1'define',=
g" \
> -                               config.sh-${TARGET_ARCH}-${TARGET_OS}
> -                       ;;
> -       esac
> -        # These are strewn all over the source tree
> -        for foo in `grep -I --exclude=3D"*.patch" --exclude=3D"*.diff" -=
-exclude=3D"*.pod" --exclude=3D"README*" --exclude=3D"Glossary" -m1 "/usr/i=
nclude/.*\.h" ${S}/* -r -l` ${S}/utils/h2xs.PL ; do
> -            echo Fixing: $foo
> -            sed -e 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/=
|g' -i $foo
> -        done
> -
> -        rm -f config
> -        echo "ARCH =3D ${TARGET_ARCH}" > config
> -        echo "OS =3D ${TARGET_OS}" >> config
> -}
> -
> -do_compile() {
> -        # Fix to avoid recursive substitution of path
> -        sed -i -e 's|(@libpath, ".*"|(@libpath, "${STAGING_LIBDIR}"|g' c=
pan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> -
> -        cd Cross
> -        oe_runmake perl LD=3D"${CCLD}"
> -}
> -
> -do_compile_append_class-target() {
> -        # Remove build host references from numerous comments...
> -        find "${S}/cpan/Encode" -type f \
> -            \( -name '*.exh' -o -name '*.c' -o -name '*.h' \)\
> -            -exec sed -i -e 's:${RECIPE_SYSROOT_NATIVE}::g' {} +
> -        sed -i -e 's:${RECIPE_SYSROOT}::g' ${S}/perl.h ${S}/pp.h
> -        sed -i -e 's:${RECIPE_SYSROOT_NATIVE}/usr/bin/perl-native/perl${=
PV}.real:/usr/bin/perl${PV}:g'  \
> -            ${S}/cpan/Compress-Raw-Bzip2/constants.h \
> -            ${S}/cpan/Compress-Raw-Zlib/constants.h \
> -            ${S}/cpan/IPC-SysV/const-c.inc \
> -            ${S}/dist/Time-HiRes/const-c.inc
> -}
> -
> -do_install() {
> -       #export hostperl=3D"${STAGING_BINDIR_NATIVE}/perl-native/perl${PV=
}"
> -       oe_runmake install DESTDIR=3D${D}
> -        # Add perl pointing at current version
> -        ln -sf perl${PV} ${D}${bindir}/perl
> -
> -        ln -sf perl ${D}/${libdir}/perl5
> -
> -        # Remove unwanted file and empty directories
> -        rm -f ${D}/${libdir}/perl/${PV}/.packlist
> -       rmdir ${D}/${libdir}/perl/site_perl/${PV}
> -       rmdir ${D}/${libdir}/perl/site_perl
> -
> -        # Fix up shared library
> -        mv ${D}/${libdir}/perl/${PV}/CORE/libperl.so ${D}/${libdir}/libp=
erl.so.${PV}
> -        ln -sf libperl.so.${PV} ${D}/${libdir}/libperl.so.5
> -        ln -sf ../../../libperl.so.${PV} ${D}/${libdir}/perl/${PV}/CORE/=
libperl.so
> -
> -        # target config, used by cpan.bbclass to extract version informa=
tion
> -        install config.sh ${D}${libdir}/perl
> -
> -        ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-targ=
et.pl
> -}
> -
> -do_install_append_class-nativesdk () {
> -        create_wrapper ${D}${bindir}/perl \
> -            PERL5LIB=3D'$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_native=
sdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/v=
endor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
> -}
> -
> -PACKAGE_PREPROCESS_FUNCS +=3D "perl_package_preprocess"
> -
> -perl_package_preprocess () {
> -        # Fix up installed configuration
> -        sed -i -e "s,${D},,g" \
> -               -e "s,${DEBUG_PREFIX_MAP},,g" \
> -               -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
> -               -e "s,-isystem${STAGING_INCDIR} ,,g" \
> -               -e "s,${STAGING_LIBDIR},${libdir},g" \
> -               -e "s,${STAGING_BINDIR},${bindir},g" \
> -               -e "s,${STAGING_INCDIR},${includedir},g" \
> -               -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g"=
 \
> -               -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
> -               -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bind=
ir},g" \
> -               -e 's:${RECIPE_SYSROOT}::g' \
> -            ${PKGD}${bindir}/h2xs \
> -            ${PKGD}${bindir}/h2ph \
> -            ${PKGD}${bindir}/pod2man \
> -            ${PKGD}${bindir}/pod2text \
> -            ${PKGD}${bindir}/pod2usage \
> -            ${PKGD}${bindir}/podchecker \
> -            ${PKGD}${bindir}/podselect \
> -            ${PKGD}${libdir}/perl/${PV}/CORE/config.h \
> -            ${PKGD}${libdir}/perl/${PV}/CORE/perl.h \
> -            ${PKGD}${libdir}/perl/${PV}/CORE/pp.h \
> -            ${PKGD}${libdir}/perl/${PV}/Config.pm \
> -            ${PKGD}${libdir}/perl/${PV}/Config.pod \
> -            ${PKGD}${libdir}/perl/${PV}/Config_heavy.pl \
> -            ${PKGD}${libdir}/perl/${PV}/ExtUtils/Liblist/Kid.pm \
> -            ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
> -            ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
> -            ${PKGD}${libdir}/perl/config.sh
> -}
> -
> -PACKAGES =3D "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-li=
b \
> -            perl-module-cpan perl-module-cpanplus perl-module-unicore"
> -FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV} \
> -               ${libdir}/perl/${PV}/Config.pm \
> -               ${libdir}/perl/${PV}/strict.pm \
> -               ${libdir}/perl/${PV}/warnings.pm \
> -               ${libdir}/perl/${PV}/warnings \
> -               ${libdir}/perl/${PV}/vars.pm \
> -              "
> -FILES_${PN}_append_class-nativesdk =3D " ${bindir}/perl.real"
> -RPROVIDES_${PN} +=3D "perl-module-strict perl-module-vars perl-module-co=
nfig perl-module-warnings \
> -                    perl-module-warnings-register"
> -FILES_${PN}-dev =3D "${libdir}/perl/${PV}/CORE"
> -FILES_${PN}-lib =3D "${libdir}/libperl.so* \
> -                   ${libdir}/perl5 \
> -                   ${libdir}/perl/config.sh \
> -                  ${libdir}/perl/${PV}/Config_git.pl \
> -                   ${libdir}/perl/${PV}/Config_heavy.pl \
> -                   ${libdir}/perl/${PV}/Config_heavy-target.pl"
> -FILES_${PN}-pod =3D "${libdir}/perl/${PV}/pod \
> -                  ${libdir}/perl/${PV}/*.pod \
> -                   ${libdir}/perl/${PV}/*/*.pod \
> -                   ${libdir}/perl/${PV}/*/*/*.pod "
> -FILES_perl-misc =3D "${bindir}/*"
> -FILES_${PN}-doc =3D "${libdir}/perl/${PV}/*/*.txt \
> -                   ${libdir}/perl/${PV}/*/*/*.txt \
> -                   ${libdir}/perl/${PV}/auto/XS/Typemap \
> -                   ${libdir}/perl/${PV}/B/assemble \
> -                   ${libdir}/perl/${PV}/B/cc_harness \
> -                   ${libdir}/perl/${PV}/B/disassemble \
> -                   ${libdir}/perl/${PV}/B/makeliblinks \
> -                   ${libdir}/perl/${PV}/CGI/eg \
> -                   ${libdir}/perl/${PV}/CPAN/PAUSE2003.pub \
> -                   ${libdir}/perl/${PV}/CPAN/SIGNATURE \
> -                  ${libdir}/perl/${PV}/CPANPLUS/Shell/Default/Plugins/HO=
WTO.pod \
> -                   ${libdir}/perl/${PV}/Encode/encode.h \
> -                   ${libdir}/perl/${PV}/ExtUtils/MANIFEST.SKIP \
> -                   ${libdir}/perl/${PV}/ExtUtils/NOTES \
> -                   ${libdir}/perl/${PV}/ExtUtils/PATCHING \
> -                   ${libdir}/perl/${PV}/ExtUtils/typemap \
> -                   ${libdir}/perl/${PV}/ExtUtils/xsubpp \
> -                  ${libdir}/perl/${PV}/ExtUtils/Changes_EU-Install \
> -                   ${libdir}/perl/${PV}/Net/*.eg \
> -                   ${libdir}/perl/${PV}/unicore/mktables \
> -                   ${libdir}/perl/${PV}/unicore/mktables.lst \
> -                   ${libdir}/perl/${PV}/unicore/version "
> -
> -FILES_perl-module-cpan +=3D "${libdir}/perl/${PV}/CPAN \
> -                           ${libdir}/perl/${PV}/CPAN.pm"
> -FILES_perl-module-cpanplus +=3D "${libdir}/perl/${PV}/CPANPLUS \
> -                               ${libdir}/perl/${PV}/CPANPLUS.pm"
> -FILES_perl-module-unicore +=3D "${libdir}/perl/${PV}/unicore"
> -
> -# Create a perl-modules package recommending all the other perl
> -# packages (actually the non modules packages and not created too)
> -ALLOW_EMPTY_perl-modules =3D "1"
> -PACKAGES_append =3D " perl-modules "
> -
> -PACKAGESPLITFUNCS_prepend =3D "split_perl_packages "
> -
> -python split_perl_packages () {
> -    libdir =3D d.expand('${libdir}/perl/${PV}')
> -    do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'p=
erl-module-%s', 'perl module %s', recursive=3DTrue, match_path=3DTrue, prep=
end=3DFalse)
> -    do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s'=
, 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue=
, prepend=3DFalse)
> -    do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s',=
 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue,=
 prepend=3DFalse)
> -    do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unico=
re\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', re=
cursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue, prepend=3DFalse)
> -
> -    # perl-modules should recommend every perl module, and only the
> -    # modules. Don't attempt to use the result of do_split_packages() as=
 some
> -    # modules are manually split (eg. perl-module-unicore).
> -    packages =3D filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGE=
S').split())
> -    d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
> -}
> -
> -PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
> -PACKAGES_DYNAMIC_class-nativesdk =3D "^nativesdk-perl-module-.*"
> -
> -RPROVIDES_perl-lib =3D "perl-lib"
> -
> -require perl-rdepends_${PV}.inc
> -require perl-ptest.inc
> -
> -SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> -
> -BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-devtools/perl/perl_5.28.0.bb b/meta/recipes-dev=
tools/perl/perl_5.28.0.bb
> new file mode 100644
> index 0000000000..524d1d54ef
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl_5.28.0.bb
> @@ -0,0 +1,472 @@
> +require perl.inc
> +
> +# We need gnugrep (for -I)
> +DEPENDS =3D "db grep-native gdbm zlib virtual/crypt"
> +
> +# Pick up patches from debian
> +# https://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.28.0-4.debian=
.tar.xz
> +SRC_URI +=3D " \
> +        file://debian/cpan_definstalldirs.diff \
> +        file://debian/db_file_ver.diff \
> +        file://debian/doc_info.diff \
> +        file://debian/enc2xs_inc.diff \
> +        file://debian/errno_ver.diff \
> +        file://debian/libperl_embed_doc.diff \
> +        file://debian/fixes/respect_umask.diff \
> +        file://debian/writable_site_dirs.diff \
> +        file://debian/extutils_set_libperl_path.diff \
> +        file://debian/instmodsh_doc.diff \
> +        file://debian/ld_run_path.diff \
> +        file://debian/libnet_config_path.diff \
> +        file://debian/mod_paths.diff \
> +        file://debian/perlivp.diff \
> +        file://debian/squelch-locale-warnings.diff \
> +        file://debian/fixes/document_makemaker_ccflags.diff \
> +        file://debian/find_html2text.diff \
> +        file://debian/perl5db-x-terminal-emulator.patch \
> +        file://debian/cpan-missing-site-dirs.diff \
> +        file://debian/fixes/memoize_storable_nstore.diff \
> +        file://debian/disable-stack-check.diff \
> +        file://debian/errno-include-path.diff \
> +        file://debian/gdbm-fatal.diff \
> +        file://debian/installman-utf8.diff \
> +        file://debian/makemaker-manext.diff \
> +        file://debian/perldoc-pager.diff \
> +        file://debian/fixes/eumm-usrmerge.diff \
> +        file://debian/fixes/in-place-edit-handles.diff \
> +        file://debian/fixes/math_complex_doc_angle_units.diff \
> +        file://debian/fixes/math_complex_doc_great_circle.diff \
> +        file://debian/fixes/math_complex_doc_see_also.diff \
> +        file://debian/fixes/memoize-pod.diff \
> +        file://debian/fixes/storable-recursion.diff \
> +"
> +
> +SRC_URI +=3D " \
> +        file://Makefile.patch \
> +        file://Makefile.SH.patch \
> +        file://installperl.patch \
> +        file://perl-archlib-exp.patch \
> +        file://perl-dynloader.patch \
> +        file://perl-moreconfig.patch \
> +        file://letgcc-find-errno.patch \
> +        file://generate-sh.patch \
> +        file://native-perlinc.patch \
> +        file://cross-generate_uudmap.patch \
> +        file://fix_bad_rpath.patch \
> +        file://dynaloaderhack.patch \
> +        file://config.sh \
> +        file://config.sh-32 \
> +        file://config.sh-32-le \
> +        file://config.sh-32-be \
> +        file://config.sh-64 \
> +        file://config.sh-64-le \
> +        file://config.sh-64-be \
> +        file://make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patc=
h \
> +        file://t-run-switches.t-perl5-perl.patch \
> +        file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
> +        file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patc=
h \
> +        file://perl-errno-generation-gcc5.patch \
> +        file://fix_write_buildcustomize.pl_no_dot_in_INC.patch \
> +        file://fix_configpm_no_dot_in_INC.patch \
> +"
> +
> +# Fix test case issues
> +SRC_URI_append_class-target =3D " \
> +            file://test/dist-threads-t-join.t-adjust-ps-option.patch \
> +            file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_fin=
dfil.patch \
> +           "
> +
> +SRC_URI[md5sum] =3D "f3245183c0a08f65e94a3333995af08e"
> +SRC_URI[sha256sum] =3D "059b3cb69970d8c8c5964caced0335b4af34ac990c8e61f7=
e3f90cd1c2d11e49"
> +
> +PACKAGECONFIG ?=3D ""
> +usethreads =3D "${@["undef", "define"][bb.utils.contains('PACKAGECONFIG'=
, 'thread', 1, 0, d)]}"
> +threadmulti =3D "${@["", "-thread-multi"][bb.utils.contains('PACKAGECONF=
IG', 'thread', 1, 0, d)]}"
> +
> +inherit perlnative siteinfo
> +
> +# Determine the staged arch of perl-native from the perl configuration f=
ile
> +# Assign vardepvalue, because otherwise signature is changed before and =
after
> +# perl is built (from None to real version in config.sh).
> +def get_perl_hostarch(d):
> +    import re
> +    cfg =3D d.expand('${STAGING_LIBDIR_NATIVE}/perl-native/perl/config.s=
h')
> +    try:
> +        f =3D open(cfg, 'r')
> +    except IOError:
> +        return None
> +    l =3D f.readlines();
> +    f.close();
> +    r =3D re.compile("^archname=3D'([^']*)'")
> +    for s in l:
> +        m =3D r.match(s)
> +        if m:
> +            return m.group(1)
> +    return None
> +
> +# Where to find the native perl
> +HOSTPERL =3D "${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
> +
> +# Where to find .so files - use the -native versions not those from the =
target build
> +export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/=
"
> +export PERLHOSTARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${=
PV}/${@get_perl_hostarch(d)}/"
> +
> +# Where to find perl @INC/#include files
> +# - use the -native versions not those from the target build
> +export PERL_LIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
> +export PERL_ARCHLIB =3D "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}=
/${@get_perl_hostarch(d)}/"
> +
> +EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> +
> +# LDFLAGS for shared libraries
> +export LDDLFLAGS =3D "${LDFLAGS} -shared"
> +
> +LDFLAGS_append =3D " -fstack-protector"
> +
> +# We're almost Debian, aren't we?
> +CFLAGS +=3D "-DDEBIAN"
> +
> +do_configure() {
> +        # Make hostperl in build directory be the native perl
> +        ln -sf ${HOSTPERL} hostperl
> +
> +        if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ];=
 then
> +                if [ "`cat ${CONFIGURESTAMPFILE}`" !=3D "${BB_TASKHASH}"=
 -a -e Makefile ]; then
> +                        ${MAKE} clean
> +                fi
> +                find ${S} -name *.so -delete
> +        fi
> +        if [ -n "${CONFIGURESTAMPFILE}" ]; then
> +                echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> +        fi
> +
> +        # Do our work in the cross subdir
> +        cd Cross
> +
> +        # Generate configuration
> +        rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
> +        for i in ${WORKDIR}/config.sh \
> +                 ${WORKDIR}/config.sh-${SITEINFO_BITS} \
> +                 ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIAN=
NESS}; do
> +            cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
> +        done
> +
> +        sed -i -e "s,\(hostperl=3D\)'',\1'${HOSTPERL}',g" \
> +                config.sh-${TARGET_ARCH}-${TARGET_OS}
> +
> +        # Fixups for musl
> +        if [ "${TARGET_OS}" =3D "linux-musl" -o "${TARGET_OS}" =3D "linu=
x-musleabi" -o "${TARGET_OS}" =3D "linux-muslx32" ]; then
> +                sed -i -e "s,\(d_libm_lib_version=3D\)'define',\1'undef'=
,g" \
> +                       -e "s,\(d_stdio_ptr_lval=3D\)'define',\1'undef',g=
" \
> +                       -e "s,\(d_stdio_ptr_lval_sets_cnt=3D\)'define',\1=
'undef',g" \
> +                       -e "s,\(d_stdiobase=3D\)'define',\1'undef',g" \
> +                       -e "s,\(d_stdstdio=3D\)'define',\1'undef',g" \
> +                       -e "s,\(d_getnetbyname_r=3D\)'define',\1'undef',g=
" \
> +                       -e "s,\(d_finitel=3D\)'define',\1'undef',g" \
> +                       -e "s,\(getprotobyname_r=3D\)'define',\1'undef',g=
" \
> +                       -e "s,\(getpwent_r=3D\)'define',\1'undef',g" \
> +                       -e "s,\(getservent_r=3D\)'define',\1'undef',g" \
> +                       -e "s,\(gethostent_r=3D\)'define',\1'undef',g" \
> +                       -e "s,\(getnetent_r=3D\)'define',\1'undef',g" \
> +                       -e "s,\(getnetbyaddr_r=3D\)'define',\1'undef',g" =
\
> +                       -e "s,\(getprotoent_r=3D\)'define',\1'undef',g" \
> +                       -e "s,\(getprotobynumber_r=3D\)'define',\1'undef'=
,g" \
> +                       -e "s,\(getgrent_r=3D\)'define',\1'undef',g" \
> +                       -e "s,\(i_fcntl=3D\)'undef',\1'define',g" \
> +                       -e "s,\(h_fcntl=3D\)'false',\1'true',g" \
> +                       -e "s,-fstack-protector,-fno-stack-protector,g" \
> +                    config.sh-${TARGET_ARCH}-${TARGET_OS}
> +        fi
> +
> +        # Fixups wrt. threads
> +        sed -i -e "s,\(useithreads=3D\)'define',\1'${usethreads}',g" \
> +               -e "s,\(usemultiplicity=3D\)'define',\1'${usethreads}',g"=
 \
> +               -e "s,\(usethreads=3D\)'define',\1'${usethreads}',g" \
> +            config.sh-${TARGET_ARCH}-${TARGET_OS}
> +
> +        # Update some paths in the configuration
> +        sed -i -e 's,@ARCH@-thread-multi,${TARGET_ARCH}-${TARGET_OS}${th=
readmulti},g' \
> +               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
> +               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> +               -e "s,@INCLUDEDIR@,${STAGING_INCDIR},g" \
> +               -e "s,@LIBDIR@,${libdir},g" \
> +               -e "s,@MANDIR@,${mandir},g" \
> +               -e "s,@BASELIBDIR@,${base_libdir},g" \
> +               -e "s,@EXECPREFIX@,${exec_prefix},g" \
> +               -e 's,@USRBIN@,${bindir},g' \
> +               -e "s,-lnsl,,g" \
> +            config.sh-${TARGET_ARCH}-${TARGET_OS}
> +
> +        case "${TARGET_ARCH}" in
> +                x86_64 | powerpc | s390)
> +                        sed -i -e "s,\(need_va_copy=3D\)'undef',\1'defin=
e',g" \
> +                                config.sh-${TARGET_ARCH}-${TARGET_OS}
> +                        ;;
> +                arm)
> +                        sed -i -e "s,\(d_u32align=3D\)'undef',\1'define'=
,g" \
> +                                config.sh-${TARGET_ARCH}-${TARGET_OS}
> +                        ;;
> +        esac
> +        # These are strewn all over the source tree
> +        for foo in `grep -I --exclude=3D"*.patch" --exclude=3D"*.diff" -=
-exclude=3D"*.pod" --exclude=3D"README*" --exclude=3D"Glossary" -m1 "/usr/i=
nclude/.*\.h" ${S}/* -r -l` ${S}/utils/h2xs.PL ; do
> +            echo Fixing: $foo
> +            sed -e 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/=
|g' -i $foo
> +        done
> +
> +        rm -f config
> +        echo "ARCH =3D ${TARGET_ARCH}" > config
> +        echo "OS =3D ${TARGET_OS}" >> config
> +}
> +
> +do_compile() {
> +        # Fix to avoid recursive substitution of path
> +        sed -i -e 's|(@libpath, ".*"|(@libpath, "${STAGING_LIBDIR}"|g' c=
pan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
> +
> +        cd Cross
> +        oe_runmake perl LD=3D"${CCLD}" MAKE_EXT_ARGS=3D"--verbose"
> +
> +        cd ..
> +        sed -i -e "s,\([^=3D]*=3D\)\"\([^\"]*\)\",\1'\2',g" \
> +            config.sh
> +}
> +
> +do_compile_append_class-target() {
> +        # Remove build host references from numerous comments...
> +        find "${S}/cpan/Encode" -type f \
> +            \( -name '*.exh' -o -name '*.c' -o -name '*.h' \)\
> +            -exec sed -i -e 's:${RECIPE_SYSROOT_NATIVE}::g' {} +
> +        sed -i -e 's:${RECIPE_SYSROOT}::g' ${S}/perl.h ${S}/pp.h
> +        sed -i -e 's:${RECIPE_SYSROOT_NATIVE}/usr/bin/perl-native/perl${=
PV}.real:/usr/bin/perl${PV}:g'  \
> +            ${S}/cpan/Compress-Raw-Bzip2/constants.h \
> +            ${S}/cpan/Compress-Raw-Zlib/constants.h \
> +            ${S}/cpan/IPC-SysV/const-c.inc \
> +            ${S}/dist/Time-HiRes/const-c.inc
> +}
> +
> +do_install() {
> +        oe_runmake install DESTDIR=3D${D}
> +        # Add perl pointing at current version
> +        ln -sf perl${PV} ${D}${bindir}/perl
> +
> +        ln -sf perl ${D}/${libdir}/perl5
> +
> +        # Remove unwanted file and empty directories
> +        rm -f ${D}/${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/.packlist
> +        rmdir ${D}/${libdir}/perl/site_perl/${PV}/${TARGET_ARCH}-${TARGE=
T_OS}${threadmulti}
> +        rmdir ${D}/${libdir}/perl/site_perl/${PV}
> +        rmdir ${D}/${libdir}/perl/site_perl
> +
> +        # Fix up shared library
> +        mv ${D}/${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thread=
multi}/CORE/libperl.so ${D}/${libdir}/libperl.so.${PV}
> +        ln -sf libperl.so.${PV} ${D}/${libdir}/libperl.so.5
> +        ln -sf ../../../libperl.so.${PV} ${D}/${libdir}/perl/${PV}/${TAR=
GET_ARCH}-${TARGET_OS}${threadmulti}/CORE/libperl.so
> +
> +        # target config, used by cpan.bbclass to extract version informa=
tion
> +        install config.sh ${D}${libdir}/perl
> +
> +        ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/${TARGET_ARCH}-${=
TARGET_OS}${threadmulti}/Config_heavy-target.pl
> +}
> +
> +NATIVE_SITELIB_INC   =3D "$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/per=
l/site_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:$OECORE_NATIVE_SYSR=
OOT/${libdir_nativesdk}/perl/site_perl/${PV}"
> +NATIVE_VENDORLIB_INC =3D "$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/per=
l/vendor_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:$OECORE_NATIVE_SY=
SROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}"
> +NATIVE_COREELIB_INC  =3D "$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/per=
l/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:$OECORE_NATIVE_SYSROOT/${libd=
ir_nativesdk}/perl/${PV}"
> +
> +do_install_append_class-nativesdk () {
> +        create_wrapper ${D}${bindir}/perl \
> +            PERL5LIB=3D'$PERL5LIB:${NATIVE_SITELIB_INC}:${NATIVE_VENDORL=
IB_INC}:${NATIVE_COREELIB_INC}'
> +}
> +
> +PACKAGE_PREPROCESS_FUNCS +=3D "perl_package_preprocess"
> +
> +perl_package_preprocess () {
> +        # Fix up installed configuration
> +        sed -i -e "s,${D},,g" \
> +               -e "s,${DEBUG_PREFIX_MAP},,g" \
> +               -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
> +               -e "s,-isystem${STAGING_INCDIR} ,,g" \
> +               -e "s,${STAGING_LIBDIR},${libdir},g" \
> +               -e "s,${STAGING_BINDIR},${bindir},g" \
> +               -e "s,${STAGING_INCDIR},${includedir},g" \
> +               -e "s,${STAGING_BINDIR_NATIVE}/perl-native/,${bindir}/,g"=
 \
> +               -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
> +               -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bind=
ir},g" \
> +               -e 's:${RECIPE_SYSROOT}::g' \
> +            ${PKGD}${bindir}/h2xs.perl \
> +            ${PKGD}${bindir}/h2ph.perl \
> +            ${PKGD}${bindir}/pod2man.perl \
> +            ${PKGD}${bindir}/pod2text.perl \
> +            ${PKGD}${bindir}/pod2usage.perl \
> +            ${PKGD}${bindir}/podchecker.perl \
> +            ${PKGD}${bindir}/podselect.perl \
> +            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/CORE/config.h \
> +            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/CORE/perl.h \
> +            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/CORE/pp.h \
> +            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config.pm \
> +            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config.pod \
> +            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config_heavy.pl \
> +            ${PKGD}${libdir}/perl/${PV}/ExtUtils/Liblist/Kid.pm \
> +            ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
> +            ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
> +            ${PKGD}${libdir}/perl/config.sh
> +}
> +
> +PACKAGES =3D "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-li=
b \
> +            perl-module-cpan perl-module-cpanplus perl-module-extutils-m=
anifest perl-module-unicore"
> +FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV} \
> +               ${libdir}/perl/${PV}/strict.pm \
> +               ${libdir}/perl/${PV}/warnings.pm \
> +               ${libdir}/perl/${PV}/warnings \
> +               ${libdir}/perl/${PV}/vars.pm \
> +              "
> +FILES_${PN}_append_class-nativesdk =3D " ${bindir}/perl.real"
> +RPROVIDES_${PN} +=3D "perl-module-strict perl-module-vars perl-module-co=
nfig perl-module-warnings \
> +                    perl-module-warnings-register"
> +FILES_${PN}-dev =3D "${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${t=
hreadmulti}/CORE \
> +                   ${libdir}/perl/${PV}/*/*.h \
> +                   ${libdir}/perl/${PV}/*/*/*.h \
> +                   ${libdir}/perl/${PV}/ExtUtils/typemap \
> +                   ${libdir}/perl/${PV}/ExtUtils/xsubpp "
> +FILES_${PN}-lib =3D "${libdir}/libperl.so* \
> +                   ${libdir}/perl5 \
> +                   ${libdir}/perl/config.sh \
> +                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config.pm \
> +                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config_git.pl \
> +                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config_heavy.pl \
> +                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${thr=
eadmulti}/Config_heavy-target.pl \
> +                   "
> +FILES_${PN}-pod =3D "${libdir}/perl/${PV}/pod \
> +                   ${libdir}/perl/${PV}/*.pod \
> +                   ${libdir}/perl/${PV}/*/*.pod \
> +                   ${libdir}/perl/${PV}/*/*/*.pod "
> +FILES_${PN}-misc =3D "${bindir}/*"
> +FILES_${PN}-doc =3D "${mandir} \
> +                   ${libdir}/perl/${PV}/*/*.txt \
> +                   ${libdir}/perl/${PV}/*/*/*.txt "
> +
> +FILES_${PN}-module-cpan +=3D "${libdir}/perl/${PV}/CPAN \
> +                           ${libdir}/perl/${PV}/CPAN.pm"
> +FILES_${PN}-module-cpanplus +=3D "${libdir}/perl/${PV}/CPANPLUS \
> +                               ${libdir}/perl/${PV}/CPANPLUS.pm"
> +FILES_${PN}-module-extutils-manifest_append +=3D " ${libdir}/perl/${PV}/=
ExtUtils/MANIFEST.SKIP"
> +FILES_${PN}-module-unicore +=3D "${libdir}/perl/${PV}/unicore"
> +
> +RDEPENDS_${PN}-doc +=3D "perl-pod"
> +RDEPENDS_${PN}-dev +=3D "perl-modules"
> +
> +# Create a perl-modules package recommending all the other perl
> +# packages (actually the non modules packages and not created too)
> +ALLOW_EMPTY_perl-modules =3D "1"
> +PACKAGES_append =3D " perl-modules "
> +
> +PACKAGESPLITFUNCS_prepend =3D "split_perl_packages "
> +
> +python split_perl_packages () {
> +    libdir =3D d.expand('${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS=
}${threadmulti}')
> +    do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'p=
erl-module-%s', 'perl module %s', recursive=3DTrue, match_path=3DTrue, prep=
end=3DFalse)
> +    do_split_packages(d, libdir, '(^(?!(auto\/)[^\/]).*)\.(pm|pl|e2x)', =
'perl-module-%s', 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, m=
atch_path=3DTrue, prepend=3DFalse)
> +    libdir =3D d.expand('${libdir}/perl/${PV}')
> +    do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s'=
, 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue=
, prepend=3DFalse)
> +    do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s',=
 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue,=
 prepend=3DFalse)
> +    do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unico=
re\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', re=
cursive=3DTrue, allow_dirs=3DFalse, match_path=3DTrue, prepend=3DFalse)
> +
> +    # perl-modules should recommend every perl module, and only the
> +    # modules. Don't attempt to use the result of do_split_packages() as=
 some
> +    # modules are manually split (eg. perl-module-unicore).
> +    packages =3D filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGE=
S').split())
> +    d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
> +}
> +
> +PACKAGES_DYNAMIC +=3D "^perl-module-.*(?<!\-native)$"
> +PACKAGES_DYNAMIC_class-nativesdk =3D "^nativesdk-perl-module-.*"
> +
> +RPROVIDES_perl-lib =3D "perl-lib"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY =3D "100"
> +
> +ALTERNATIVE_${PN} =3D "corelist cpan enc2xs encguess h2ph h2xs instmodsh=
 json_pp libnetcfg \
> +                     piconv pl2pm pod2html pod2man pod2text pod2usage po=
dchecker podselect \
> +                     prove ptar ptardiff ptargrep shasum splain xsubpp z=
ipdetails"
> +ALTERNATIVE_LINK_NAME[corelist] =3D "${bindir}/corelist"
> +ALTERNATIVE_LINK_NAME[cpan] =3D "${bindir}/cpan"
> +ALTERNATIVE_LINK_NAME[enc2xs] =3D "${bindir}/enc2xs"
> +ALTERNATIVE_LINK_NAME[encguess] =3D "${bindir}/encguess"
> +ALTERNATIVE_LINK_NAME[h2ph] =3D "${bindir}/h2ph"
> +ALTERNATIVE_LINK_NAME[h2xs] =3D "${bindir}/h2xs"
> +ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
> +ALTERNATIVE_LINK_NAME[json_pp] =3D "${bindir}/json_pp"
> +ALTERNATIVE_LINK_NAME[libnetcfg] =3D "${bindir}/libnetcfg"
> +ALTERNATIVE_LINK_NAME[piconv] =3D "${bindir}/piconv"
> +ALTERNATIVE_LINK_NAME[pl2pm] =3D "${bindir}/pl2pm"
> +ALTERNATIVE_LINK_NAME[pod2html] =3D "${bindir}/pod2html"
> +ALTERNATIVE_LINK_NAME[pod2man] =3D "${bindir}/pod2man"
> +ALTERNATIVE_LINK_NAME[pod2text] =3D "${bindir}/pod2text"
> +ALTERNATIVE_LINK_NAME[pod2usage] =3D "${bindir}/pod2usage"
> +ALTERNATIVE_LINK_NAME[podchecker] =3D "${bindir}/podchecker"
> +ALTERNATIVE_LINK_NAME[podselect] =3D "${bindir}/podselect"
> +ALTERNATIVE_LINK_NAME[prove] =3D "${bindir}/prove"
> +ALTERNATIVE_LINK_NAME[ptar] =3D "${bindir}/ptar"
> +ALTERNATIVE_LINK_NAME[ptardiff] =3D "${bindir}/ptardiff"
> +ALTERNATIVE_LINK_NAME[ptargrep] =3D "${bindir}/ptargrep"
> +ALTERNATIVE_LINK_NAME[shasum] =3D "${bindir}/shasum"
> +ALTERNATIVE_LINK_NAME[splain] =3D "${bindir}/splain"
> +ALTERNATIVE_LINK_NAME[xsubpp] =3D "${bindir}/xsubpp"
> +ALTERNATIVE_LINK_NAME[zipdetails] =3D "${bindir}/zipdetails"
> +
> +require perl-rdepends_${PV}.inc
> +require perl-ptest.inc
> +
> +SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> +
> +do_create_rdepends_inc() {
> +    cd ${WORKDIR}
> +    cat <<'EOPREAMBLE' > ${WORKDIR}/perl-rdepends.inc
> +# To create/update the perl-rdepends_${PV}.inc use this piece of ugly sc=
ript (modified for your arch/paths etc):
> +
> +#jiahongxu:5.20.0-r1$ pwd
> +#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl=
/5.20.0-r1
> +
> +#1 cp -r packages-split packages-split.new && cd packages-split.new
> +#2 find . -name \*.pm | xargs sed -i '/^=3Dhead/,/^=3Dcut/d'
> +#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include=3D"*=
.pm"
> +#| sed "s/\/.*\.pm: */ +=3D /g;s/[\"\']//g;s/;.*/\"/g;s/+=3D .*\(require=
\|use\)\> */+=3D \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan=
/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr =
[:upper:] [:lower:]
> +#| awk '{if ($3 !=3D "\x22"$1"\x22"){ print $0}}'
> +#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e au=
toperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-=
mac -e fcgi -e lwp -e dbd -e dbix
> +#| sort -u
> +#| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-=
\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
> +#| egrep -wv '=3D>|module-a|module-apache.?|module-apr|module-authen-sas=
l|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-pe=
rl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extuti=
ls-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|modul=
e-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl=
-util|module-pluggable-object|module-test-builder-io-scalar|module-text-uni=
decode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-=
rdepends
> +
> +RDEPENDS_perl-misc +=3D "perl perl-modules"
> +RDEPENDS_${PN}-pod +=3D "perl"
> +
> +# Some additional dependencies that the above doesn't manage to figure o=
ut
> +RDEPENDS_${PN}-module-file-spec +=3D "${PN}-module-file-spec-unix"
> +RDEPENDS_${PN}-module-math-bigint +=3D "${PN}-module-math-bigint-calc"
> +RDEPENDS_${PN}-module-thread-queue +=3D "${PN}-module-attributes"
> +RDEPENDS_${PN}-module-overload +=3D "${PN}-module-overloading"
> +
> +# Generated depends list beyond this line
> +EOPREAMBLE
> +    test -e packages-split.new && rm -rf packages-split.new
> +    cp -r packages-split packages-split.new && cd packages-split.new
> +    find . -name \*.pm | xargs sed -i '/^=3Dhead/,/^=3Dcut/d'
> +    egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include=3D"=
*.pm" | \
> +    sed "s/\/.*\.pm: */ +=3D /g;s/[\"\']//g;s/;.*/\"/g;s/+=3D .*\(requir=
e\|use\)\> */+=3D \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpa=
n/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr=
 [:upper:] [:lower:] | \
> +    awk '{if ($3 !=3D "\x22"$1"\x22"){ print $0}}'| \
> +    grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e a=
utoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module=
-mac -e fcgi -e lwp -e dbd -e dbix | \
> +    sort -u | \
> +    sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module=
-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | =
\
> +    egrep -wv '=3D>|module-a|module-apache.?|module-apr|module-authen-sa=
sl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-p=
erl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extut=
ils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|modu=
le-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modper=
l-util|module-pluggable-object|module-test-builder-io-scalar|module-text-un=
idecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' >> ${WORKDI=
R}/perl-rdepends.inc
> +    cp ${WORKDIR}/perl-rdepends.inc ${THISDIR}/perl-rdepends_${PV}.inc
> +}
> +
> +# bitbake perl -c create_rdepends_inc
> +addtask do_create_rdepends_inc
> +
> +# Make sure we have native python ready when we create a new manifest
> +do_create_rdepends_inc[depends] +=3D "python3:do_prepare_recipe_sysroot"
> +do_create_rdepends_inc[depends] +=3D "python3:do_package"
> +do_create_rdepends_inc[depends] +=3D "python3:do_patch"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

