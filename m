Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297C8C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 15:10:48 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.64.1664550640214947707
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 08:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lMIAYtLZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id sd10so9715091ejc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=mh/9N+j+2tJqNtWjNyUT/U2WTz4YV3bjriTPQ6ezgAc=;
        b=lMIAYtLZyDOm80nkZjbGMVI/L/KKqovJkaVDjXNqF2nvS4M0vDG53TFcauANlegWlv
         rtPkqdR/P9oKCyUZSYnmcTuOBPd8zrGqsYLchxkOqB514ViEpEaqgMVejL+EtzWlpRVE
         FG2z2KPPr/56bq69Z+uGXmTTUK3Og9WNui0+PNr8s6MQZHIsSqBTVPvxlpoDcdf3h6PP
         hkEeKS03jVhb68a8ZlBuylfF1oOH1n215Ld/pv1OlE0zgoIWuIsnu4HhJmCDQIymQb2E
         ABr0DrKgykR10ZlG3cJWz9ORZfkT40wN8K74CpnecK+LOrNDZ4aAmJYjEgRUHkp/F98C
         gXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mh/9N+j+2tJqNtWjNyUT/U2WTz4YV3bjriTPQ6ezgAc=;
        b=X2LM0gz5jjN1tKYBLXH4boyvSW/Nvwn9ydX3XIng9DiFqAkF8A+diRtcn599qICmHM
         M6nXD8HOidry/XhFA5FrWPZqkdwKmufR3zzbzH6MYduFf4Q4st4uDBNHsehEvvENuvWc
         u8zLAYhLHbvVinMNRqoPWPAb+pgyBxAeMd2CJ+ZBTOWJ6kq1zJvMvzEM5PGunGUoDpUG
         4HVzMfij8PryoJU1j1YBdA65kEEvGC6CNLmSeNMSs8yAxzMjS+7dmoFErKSVQCoZrsO2
         GnuEM7u0pDZt8WK0B611YJeP8Bv60b6tL1ROrKVEuC8fSiyaO36soufhAzzhJ0Zbf9z6
         t4Vg==
X-Gm-Message-State: ACrzQf1C0ACnUBeeV//i+tZIpWxTe3+zZznyhKYT3cs+tQX0yAlOp9iL
	NNJw+ZpRQTbSgE/MV4WhNVSs/VH0pgLxY0wu+QYzCXrWnHULnwJz
X-Google-Smtp-Source: 
 AMsMyM7k8Dhy/mAdDhUTENfcVwp14OJnj/JPpC8FngevNttH/pf6wRy+GjRubmUk+sO1hsX5Vk5hJsM+Rc9amlZdMSU=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr7034415ejc.36.1664550637688; Fri, 30
 Sep 2022 08:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220930054703.1799739-1-jay.shen.teoh@intel.com>
 <20220930054703.1799739-3-jay.shen.teoh@intel.com>
In-Reply-To: <20220930054703.1799739-3-jay.shen.teoh@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 30 Sep 2022 05:10:26 -1000
Message-ID: 
 <CAOSpxdbOyey5qqyt_nSKWUGkq+JHqQV+xGO5R+gyMTUBVeruXQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][Patch 3/4] rpm: Upgrade 4.17.1 -> 4.18rc1
To: openembedded-core@lists.openembedded.org
Cc: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 15:10:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171223

The last two patches in this series do a version upgrade with added
and changed APIs, which is typically not OK for an LTS release.
However I'd like to get some feedback on whether people think this is
an acceptable risk for the CVEs that it fixes.

To help with reviewing this, I've cut pasted the changes in this release be=
low.

Summary of changes from RPM 4.17.x

General bugfixes and enhancements

Add a new Sequoia-based OpenPGP backend (#1978)
Documentation updates

Lua extensions, examples
Typos, grammar, clarifications, presentation improvements
Bring install-order documentation to this millenium
Drop some misleadingly outdated docs
Translation updates

Command line

Fix --restore to properly honor file states and all (#965)
Fix --setperms processing recorded symlinks (RhBug:1900662)
Fix rpmkeys return code on I/O errors
Fix --showrc to return an error code on broken rc and macro files (#1796)
Fix mismatch between rpmspec -q --srpm and rpmbuild -bs architecture (#1116=
)
Fix --short-circuit for (dynamic) buildrequires checking
Fix -q/--query option not visible in --help (#1473)
Fix query arguments containing ^ not working (#2104)
Fix various dark corners in rpm2cpio.sh (RhBug:2115206)
Add downgrade (--oldpackage) support to --freshen (#652)
Add --path query for support for stateless file information (RhBug:1940895)
Add rpmlua command for running rpm=E2=80=99s embedded Lua interpreter
standalone, with command history and support for iLua
Add --shell option for interactive macro shell to rpmspec
Add --justdb counterpart --nodb option and matching API flag
Add -bd, -td and -rd switches to rpmbuild for checking build dependencies
Add available database backends to --showrc output

Transactions

Fix intermediate symlinks not verified (CVE-2021-35939)
Fix unowned directories created unsafely
Fix spurious %transfiletriggerpostun execution (RhBug:2023311)
Fix %_minimize_writes regression (in 4.15.0)
Fix possible priority inversion in ordering code wrt weak dependencies
with qualifiers
Fix ctrl-c during transaction killing scriptlets (regression in 4.17.0)
Fix excluded and non-installed files getting considered in file
conflicts calculation
Fix uncontrolled sqlite WAL growth during large transactions
Fix %posttrans argument on upgrade

Package building

Spec

Fix mismatch between package name and provides/obsoletes rules (#1694)
Fix check-buildroot not stopping on errors with grep >=3D 3.5 (#1968)
Fix build summary confusingly mixing warnings and errors (#793)
Fix %patch 1 applying patches 0 and 1
Fix package build tree not getting removed on successful build
Fix .gemspec from %setup not getting removed on %clean
Fix %setup and %patch not getting expanded in rpmspec =E2=80=93parse (#2048=
)
Fix missing quotes on %sources and %patches (#1445)
Add new SourceLicense tag for specifying a source license different
from the binary license (#2079)
Add new %conf spec section for build configuration (#1086)
Add %bcond macro as a nicer way of defining build conditionals (#941)
Add an optional =E2=80=9Coverride clock=E2=80=9D from SOURCE_DATE_EPOCH env=
ironment to
support deterministic timestamps inside OS images
Add support for qualifiers (eg pre, post=E2=80=A6) for weak dependencies
Add support for zstd long distance matching compression (L<n> io flag)
Add warning if %source_date_epoch_from_changelog set but changelog missing
Add new rpmuncompress cli tool which handles extraction of sources and
uncompress of patches in %setup and %patch pseudomacros.
Add new informational UpstreamReleases and TranslationURL tags
Add parsed and expanded spec to src.rpm header as Spec tag
Make %{buildsubdir} settable outside %setup
Deprecate implicit =E2=80=9C%patch number zero=E2=80=9D syntax

Macros

Fix individual patch application via %autopatch (#1766)
Fix consistency issues in macro expansion for builtin macros
Fix %{define name body} syntax in specs
Fix non-parametric built-in macros (regression in 4.17.0)
Fix short-circuiting of version strings in expressions (#1883)
Add %{shescape:...} macro for single quoting and escapes for the shell
Add optional argument for the %verbose macro
Add support for multiple arguments in %{quote}
Add support for Lua functions in expressions (eg %[lua:string.reverse("hell=
o")])
Drop arbitrary macro name minimum length limit (RhBug:1994223)
Protect automatic macros from being redefined and undefined

Buildroot policies

Fix handling of filenames with spaces in brp-compress
Fix Guile object files getting stripped (#1765)
Fix brp-strip-comment-note running only serially
Fix brp-remove-la-files sometimes removing non-libtool files
Fix unwanted network access in check-rpaths helper script (RhBug:2079600)

Generators

Fix OCaml generators to ignore cmxs files
Add a provides generator for rpm macros

Signatures and keys

Fix signature check result on valid header signature but unverifiable paylo=
ad
Fix subkey binding signatures not checked on PGP public keys (CVE-2021-3521=
)
Fix Ed25519 signature verification with libgcrypt
Fix subkeys not capable of signing accepted for verification (#1911)
Fix signing of packages unusual filenames
Fix subkey binding timestamp used for main gpg-pubkey (#2004)
Add support for =E2=80=93import in fs keyring
Add support for linting keys on import (Sequoia backend only)

Plugins

Fix IMA causing install failure on filesystems without xattr support
Add file descriptor argument to file-prepare hook
Revert file-pre, file-prepare and file-post hook execution to their
pre-4.17.0 positions

Python bindings

Fix ancient Python ts.check() argument order regression (#1871, in 4.8.0)
Add bindings for rpmfilesFSignature() and rpmfilesVSignature()
(.imasig and .veritysig properties in rpm.file objects)
Drop experimental and internal _build method from from the spec bindings

Lua interface

Fix relocation info not available in Lua scriptlets (#1531)
Fix scriptlet arguments passed as numbers again (regression in 4.17.0)
Fix off-by-one in rpm.call()
Fix newline behavior in interactive mode
Fix rpm.next_file() to be usable only inside scriptlets with input
Fix rpm.vercmp() error message on second argument (#2165)
Add rpm.splitargs() and rpm.unsplitargs() functions for macro argument
processing
Add auto-print of returned values from macros
Drop defunct and unused rex extension

API changes

Added APIs

rpmtsAddRestoreElement(), rpmRestore() for --restore
rreallocn(), similar to glibc=E2=80=99s reallocarray()
rpmhex() for hex-enconding binary data

Changed APIs

Fix database open hijacking normal signal handling
Fix rpmfiSetFX() return code to be meaningful
Fix pgpPubkeyFingerprint() to do something meaningful again
Add new PGP-independent set of hash algorithm symbols (#1899)
Various generic crypto APIs moved from rpmpgp.h to rpmcrypto.h header
Disable and obsolete rpmfiSetDX(), rpmfiInitD() and rpmfiNextD()

Removed APIs

N/A

Internal improvements and cleanups

Fix IMA signature lengths assumed constant (#1833, RhBug:2018937)
Fix various leaks and other findings from static analyzers
Fix various correctness and safety issues in the OpenPGP parser
Fix rpmdb cookie in FIPS mode by changing it to SHA256
Fix pgpDigParams to be properly opaque
Fix rpmio stats spew in stderr (#1987)
Fix changelog parsing affecting caller timezone state (#1821)
Add an artificial limit of 1M to header array sizes
Add support for loongarch64 architecture
Add ARCHSUFFIX extension tag
Optimize C source file classification
Drop support for undocumented keyid based import over the net
Various code cleanups to macro engine and Lua extensions
Refactor file and directory operations to use fd-based APIs throughout
(CVE-2021-35938)
Various fixes and cleanups to hardlink handling
Physically separate public and private headers in the codebase

Build process

Require POSIX.1-2008 level operating system for the openat() family of APIs
Fix Doxygen deprecation warnings
Fix UID_0_USER and UID_0_GROUP values when /etc/passwd not present (#1838)
Fix out of tree build regression wrt man page generation (#1851)
Fix stat64 build on Apple Big Sur (#1752)
Fix build on armhf and mipsel
Fix db backend default as per availability
Fix signing tests assuming gpg default to sha256 hash algo
Fix test-suite relying on deprecated distutils
Fix warnings from autotools >=3D 2.70 (#1785)
Fix make ci in a VPATH build
Add option to disable libelf dependency (--enable/--disable-libelf)
Add multiple new test-cases
Update minimum required gettext version to 0.19.8
Update CI to Fedora 36

On Thu, Sep 29, 2022 at 7:47 PM Teoh, Jay Shen <jay.shen.teoh@intel.com> wr=
ote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> rpm is close to release and give our release timings, update to the
> rc1 of 4.18.
>
> Includes fixes for CVE-2021-35937, CVE-2021-35938 and CVE-2021-35939
> which can't be easily backported.
>
> Add a PACKAGECONFIG option for a new readline dependency and disable
> it by default since it pulls in GPLv3 and that breaks a number of
> our test configurations as things stand.
>
> Refresh patches and drop the error.h patch as error() no longer used.
>
> (From OE-Core rev: 4b31e4f2aea490bd5056c97742b5e25a8dcc8b36)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...olor-setting-for-mips64_n32-binaries.patch | 22 +++---
>  ...satisfiable-dependency-when-building.patch | 10 +--
>  ...lib-rpm-as-the-installation-path-for.patch | 26 +++----
>  ...1-Do-not-read-config-files-from-HOME.patch | 11 ++-
>  ...-PATH-environment-variable-before-ru.patch | 10 +--
>  ...lling-execute-package-scriptlets-wit.patch | 20 +++---
>  ...not-insert-payloadflags-into-.rpm-me.patch |  8 +--
>  ...-linux-gnux32-variant-to-triplet-han.patch | 17 ++---
>  ...o-not-build-manpages-requires-pandoc.patch | 11 ++-
>  ....c-fix-file-conflicts-for-MIPS64-N32.patch | 13 ++--
>  ...tools-Add-error.h-for-non-glibc-case.patch | 71 -------------------
>  ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 17 ++---
>  ...ge-logging-level-around-scriptlets-t.patch | 16 ++---
>  meta/recipes-devtools/rpm/files/fifofix.patch | 22 ++++++
>  meta/recipes-devtools/rpm/rpm_4.17.1.bb       | 10 ++-
>  15 files changed, 113 insertions(+), 171 deletions(-)
>  delete mode 100644 meta/recipes-devtools/rpm/files/0001-tools-Add-error.=
h-for-non-glibc-case.patch
>  create mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for=
-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-col=
or-setting-for-mips64_n32-binaries.patch
> index 331ea849e6..9f5dde0720 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64=
_n32-binaries.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64=
_n32-binaries.patch
> @@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   rpmrc.in      | 2 ++
>   2 files changed, 6 insertions(+)
>
> -diff --git a/build/rpmfc.c b/build/rpmfc.c
> -index 10c380ee9..b7655aa93 100644
> ---- a/build/rpmfc.c
> -+++ b/build/rpmfc.c
> -@@ -639,6 +639,7 @@ exit:
> +Index: git/build/rpmfc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/build/rpmfc.c
> ++++ git/build/rpmfc.c
> +@@ -645,6 +645,7 @@ exit:
>   static const struct rpmfcTokens_s rpmfcTokens[] =3D {
>     { "directory",              RPMFC_INCLUDE },
>
> @@ -23,7 +23,7 @@ index 10c380ee9..b7655aa93 100644
>     { "ELF 32-bit",             RPMFC_ELF32|RPMFC_INCLUDE },
>     { "ELF 64-bit",             RPMFC_ELF64|RPMFC_INCLUDE },
>
> -@@ -1149,6 +1150,9 @@ static uint32_t getElfColor(const char *fn)
> +@@ -1150,6 +1151,9 @@ static uint32_t getElfColor(const char *
>                 color =3D RPMFC_ELF32;
>                 break;
>             }
> @@ -33,11 +33,11 @@ index 10c380ee9..b7655aa93 100644
>             elf_end(elf);
>         }
>         close(fd);
> -diff --git a/rpmrc.in b/rpmrc.in
> -index 5bd9ba3e5..f15bb8dad 100644
> ---- a/rpmrc.in
> -+++ b/rpmrc.in
> -@@ -137,6 +137,8 @@ archcolor: mipsr6el 1
> +Index: git/rpmrc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/rpmrc.in
> ++++ git/rpmrc.in
> +@@ -139,6 +139,8 @@ archcolor: mipsr6el 1
>   archcolor: mips64r6 2
>   archcolor: mips64r6el 2
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfi=
able-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-=
Do-not-add-an-unsatisfiable-dependency-when-building.patch
> index 4029233fb7..8440c3516d 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-de=
pendency-when-building.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-de=
pendency-when-building.patch
> @@ -14,11 +14,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   build/pack.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> -diff --git a/build/pack.c b/build/pack.c
> -index e6cec1816..810cd7351 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> -@@ -724,10 +724,6 @@ static rpmRC packageBinary(rpmSpec spec, Package pk=
g, const char *cookie, int ch
> +Index: git/build/pack.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/build/pack.c
> ++++ git/build/pack.c
> +@@ -709,10 +709,6 @@ static rpmRC packageBinary(rpmSpec spec,
>         headerPutBin(pkg->header, RPMTAG_SOURCEPKGID, spec->sourcePkgId,1=
6);
>       }
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm=
-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-=
Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
> index c6cf9d4c88..6f613d0a7d 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the=
-installation-path-for.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the=
-installation-path-for.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   rpm.am       | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/configure.ac b/configure.ac
> -index 372875fc4..1b7add9ee 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -884,7 +884,7 @@ else
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -942,7 +942,7 @@ else
>       usrprefix=3D$prefix
>   fi
>
> @@ -26,10 +26,10 @@ index 372875fc4..1b7add9ee 100644
>   AC_SUBST(RPMCONFIGDIR)
>
>   AC_SUBST(OBJDUMP)
> -diff --git a/macros.in b/macros.in
> -index d53ab5ed5..9d10441c8 100644
> ---- a/macros.in
> -+++ b/macros.in
> +Index: git/macros.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/macros.in
> ++++ git/macros.in
>  @@ -911,7 +911,7 @@ package or when debugging this package.\
>   %_sharedstatedir      %{_prefix}/com
>   %_localstatedir               %{_prefix}/var
> @@ -39,10 +39,10 @@ index d53ab5ed5..9d10441c8 100644
>   %_includedir          %{_prefix}/include
>   %_infodir             %{_datadir}/info
>   %_mandir              %{_datadir}/man
> -diff --git a/rpm.am b/rpm.am
> -index ebe4e40d1..e6920e258 100644
> ---- a/rpm.am
> -+++ b/rpm.am
> +Index: git/rpm.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/rpm.am
> ++++ git/rpm.am
>  @@ -1,10 +1,10 @@
>   # Internal binaries
>   ## HACK: It probably should be $(libexecdir)/rpm or $(libdir)/rpm
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-file=
s-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config=
-files-from-HOME.patch
> index 96eb418952..fda64eefe0 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-=
HOME.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-=
HOME.patch
> @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   lib/rpmrc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> -diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> -index 4ed991321..19fe80f98 100644
> ---- a/lib/rpmrc.c
> -+++ b/lib/rpmrc.c
> +Index: git/lib/rpmrc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/rpmrc.c
> ++++ git/lib/rpmrc.c
>  @@ -458,8 +458,7 @@ static void setDefaults(void)
>       if (!defrcfiles) {
>         defrcfiles =3D rstrscat(NULL, confdir, "/rpmrc", ":",
> @@ -33,6 +33,3 @@ index 4ed991321..19fe80f98 100644
>       }
>   #else
>       macrofiles =3D MACROFILES;
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-e=
nvironment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-=
Do-not-reset-the-PATH-environment-variable-before-ru.patch
> index 41cdf6ed77..ae24b663aa 100644
> --- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environm=
ent-variable-before-ru.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environm=
ent-variable-before-ru.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   lib/rpmscript.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> -index 6a31e0d..2b0e438 100644
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -184,7 +184,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_con=
st_t prefixes,
> +Index: git/lib/rpmscript.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/rpmscript.c
> ++++ git/lib/rpmscript.c
> +@@ -231,7 +231,7 @@ static void doScriptExec(ARGV_const_t ar
>         if (ipath && ipath[5] !=3D '%')
>             path =3D ipath;
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-e=
xecute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-=
When-cross-installing-execute-package-scriptlets-wit.patch
> index 2a0069cafe..bd3314a90f 100644
> --- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-=
package-scriptlets-wit.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-=
package-scriptlets-wit.patch
> @@ -28,9 +28,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.c=
om>
>   lib/rpmscript.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -17,7 +17,7 @@
> +Index: git/lib/rpmscript.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/rpmscript.c
> ++++ git/lib/rpmscript.c
> +@@ -18,7 +18,7 @@
>   #include "rpmio/rpmio_internal.h"
>
>   #include "lib/rpmplugins.h"     /* rpm plugins hooks */
> @@ -39,7 +41,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   #include "debug.h"
>
>   struct scriptNextFileFunc_s {
> -@@ -391,8 +391,7 @@ exit:
> +@@ -427,8 +427,7 @@ exit:
>         Fclose(out);    /* XXX dup'd STDOUT_FILENO */
>
>       if (fn) {
> @@ -49,18 +51,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>         free(fn);
>       }
>       free(mline);
> -@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
> +@@ -462,7 +461,13 @@ rpmRC rpmScriptRun(rpmScript script, int
>
>       if (rc !=3D RPMRC_FAIL) {
>         if (script_type & RPMSCRIPTLET_EXEC) {
> --          rc =3D runExtScript(plugins, prefixes, script->descr, lvl, sc=
riptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> +-          rc =3D runExtScript(plugins, prefixes, script->descr, lvl, sc=
riptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +          if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") !=3D NULL) {
>  +              rpmChrootOut();
> -+              rc =3D runExtScript(plugins, prefixes, script->descr, lvl=
, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> ++              rc =3D runExtScript(plugins, prefixes, script->descr, lvl=
, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +              rpmChrootIn();
>  +          } else {
> -+              rc =3D runExtScript(plugins, prefixes, script->descr, lvl=
, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> ++              rc =3D runExtScript(plugins, prefixes, script->descr, lvl=
, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +          }
>         } else {
> -           rc =3D runLuaScript(plugins, prefixes, script->descr, lvl, sc=
riptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> +           rc =3D runLuaScript(plugins, prefixes, script->descr, lvl, sc=
riptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>         }
> diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-ins=
ert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-=
build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
> index 79b168257e..64433abb6a 100644
> --- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-pay=
loadflags-into-.rpm-me.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-pay=
loadflags-into-.rpm-me.patch
> @@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   build/pack.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/build/pack.c b/build/pack.c
> -index 932cb213e..b45d0726f 100644
> ---- a/build/pack.c
> -+++ b/build/pack.c
> +Index: git/build/pack.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/build/pack.c
> ++++ git/build/pack.c
>  @@ -328,7 +328,7 @@ static char *getIOFlags(Package pkg)
>             headerPutString(pkg->header, RPMTAG_PAYLOADCOMPRESSOR, compr)=
;
>         buf =3D xstrdup(rpmio_flags);
> diff --git a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-=
gnux32-variant-to-triplet-han.patch b/meta/recipes-devtools/rpm/files/0001-=
configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
> index 2174a79e75..29b6686a94 100644
> --- a/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-=
variant-to-triplet-han.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-=
variant-to-triplet-han.patch
> @@ -11,13 +11,13 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   configure.ac | 4 ++++
>   1 file changed, 4 insertions(+)
>
> -diff --git a/configure.ac b/configure.ac
> -index 372875fc49..7d6a3d274e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -845,6 +845,10 @@ if echo "$host_os" | grep '.*-gnuabi64$' > /dev/nul=
l ; then
> -       host_os=3D`echo "${host_os}" | sed 's/-gnuabi64$//'`
> -       host_os_gnu=3D-gnuabi64
> +Index: git/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/configure.ac
> ++++ git/configure.ac
> +@@ -903,6 +903,10 @@ if echo "$host_os" | grep '.*-gnux32$' >
> +       host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> +       host_os_gnu=3D-gnux32
>   fi
>  +if echo "$host_os" | grep '.*-gnux32$' > /dev/null ; then
>  +      host_os=3D`echo "${host_os}" | sed 's/-gnux32$//'`
> @@ -26,6 +26,3 @@ index 372875fc49..7d6a3d274e 100644
>   if echo "$host_os" | grep '.*-gnu$' > /dev/null ; then
>         host_os=3D`echo "${host_os}" | sed 's/-gnu$//'`
>   fi
> ---
> -2.30.2
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpa=
ges-requires-pandoc.patch b/meta/recipes-devtools/rpm/files/0001-docs-do-no=
t-build-manpages-requires-pandoc.patch
> index ced52d1007..d7137f1d10 100644
> --- a/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-req=
uires-pandoc.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-req=
uires-pandoc.patch
> @@ -9,10 +9,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
>   docs/Makefile.am | 2 --
>   1 file changed, 2 deletions(-)
>
> -diff --git a/docs/Makefile.am b/docs/Makefile.am
> -index 5a6bd203a..6257767fd 100644
> ---- a/docs/Makefile.am
> -+++ b/docs/Makefile.am
> +Index: git/docs/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/docs/Makefile.am
> ++++ git/docs/Makefile.am
>  @@ -1,7 +1,5 @@
>   ## Process this file with automake to produce Makefile.in
>
> @@ -21,6 +21,3 @@ index 5a6bd203a..6257767fd 100644
>   EXTRA_DIST =3D
>
>   EXTRA_DIST +=3D \
> ---
> -2.32.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-f=
ile-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-l=
ib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
> index 6678c105cd..82e6567dc7 100644
> --- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-con=
flicts-for-MIPS64-N32.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-con=
flicts-for-MIPS64-N32.patch
> @@ -31,11 +31,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.c=
om>
>   lib/transaction.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> -diff --git a/lib/transaction.c b/lib/transaction.c
> -index 67b9db5..82386b8 100644
> ---- a/lib/transaction.c
> -+++ b/lib/transaction.c
> -@@ -391,7 +391,18 @@ static int handleColorConflict(rpmts ts,
> +Index: git/lib/transaction.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/transaction.c
> ++++ git/lib/transaction.c
> +@@ -402,7 +402,18 @@ static int handleColorConflict(rpmts ts,
>                     rpmfsSetAction(ofs, ofx, FA_CREATE);
>                 rpmfsSetAction(fs, fx, FA_SKIPCOLOR);
>                 rConflicts =3D 0;
> @@ -55,6 +55,3 @@ index 67b9db5..82386b8 100644
>         }
>       }
>
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-n=
on-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.=
h-for-non-glibc-case.patch
> deleted file mode 100644
> index 9783396639..0000000000
> --- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glib=
c-case.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 9b9d717f484ec913cdd3804e43489b3dc18bd77c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 31 Oct 2020 22:14:05 -0700
> -Subject: [PATCH] tools: Add error.h for non-glibc case
> -
> -error is glibc specific API, so this patch will mostly not accepted
> -upstream given that elfutils has been closely tied to glibc
> -
> -Upstream-Status: Inappropriate [workaround for musl]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - tools/elfdeps.c |  6 +++++-
> - tools/error.h   | 27 +++++++++++++++++++++++++++
> - 2 files changed, 32 insertions(+), 1 deletion(-)
> - create mode 100644 tools/error.h
> -
> -diff --git a/tools/elfdeps.c b/tools/elfdeps.c
> -index d205935bb..3a8945b33 100644
> ---- a/tools/elfdeps.c
> -+++ b/tools/elfdeps.c
> -@@ -5,10 +5,14 @@
> - #include <unistd.h>
> - #include <stdlib.h>
> - #include <fcntl.h>
> --#include <error.h>
> - #include <errno.h>
> - #include <popt.h>
> - #include <gelf.h>
> -+#ifdef __GLIBC__
> -+#include <error.h>
> -+#else
> -+#include "error.h"
> -+#endif
> -
> - #include <rpm/rpmstring.h>
> - #include <rpm/argv.h>
> -diff --git a/tools/error.h b/tools/error.h
> -new file mode 100644
> -index 000000000..ef06827a0
> ---- /dev/null
> -+++ b/tools/error.h
> -@@ -0,0 +1,27 @@
> -+#ifndef _ERROR_H_
> -+#define _ERROR_H_
> -+
> -+#include <stdarg.h>
> -+#include <stdio.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <errno.h>
> -+
> -+static unsigned int error_message_count =3D 0;
> -+
> -+static inline void error(int status, int errnum, const char* format, ..=
.)
> -+{
> -+      va_list ap;
> -+      fprintf(stderr, "%s: ", program_invocation_name);
> -+      va_start(ap, format);
> -+      vfprintf(stderr, format, ap);
> -+      va_end(ap);
> -+      if (errnum)
> -+              fprintf(stderr, ": %s", strerror(errnum));
> -+      fprintf(stderr, "\n");
> -+      error_message_count++;
> -+      if (status)
> -+              exit(status);
> -+}
> -+
> -+#endif        /* _ERROR_H_ */
> diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixi=
ng-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-=
Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
> index b3dbc319b6..2fe96a839c 100644
> --- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-=
from-RPM_ETCCONFIGDIR-.patch
> +++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-=
from-RPM_ETCCONFIGDIR-.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   lib/rpmrc.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> -diff --git a/lib/rpmrc.c b/lib/rpmrc.c
> -index 19fe80f98..6b27b3941 100644
> ---- a/lib/rpmrc.c
> -+++ b/lib/rpmrc.c
> -@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char * nam=
e,
> +Index: git/lib/rpmrc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/rpmrc.c
> ++++ git/lib/rpmrc.c
> +@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const
>   static void setDefaults(void)
>   {
>       const char *confdir =3D rpmConfigDir();
> @@ -46,7 +46,7 @@ index 19fe80f98..6b27b3941 100644
>       }
>   #else
>       macrofiles =3D MACROFILES;
> -@@ -989,7 +993,11 @@ static void read_auxv(void)
> +@@ -997,7 +1001,11 @@ static void read_auxv(void)
>    */
>   static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char=
 ** os)
>   {
> @@ -59,7 +59,7 @@ index 19fe80f98..6b27b3941 100644
>       static struct utsname un;
>       char * chptr;
>       canonEntry canon;
> -@@ -1286,6 +1294,7 @@ static void defaultMachine(rpmrcCtx ctx, const cha=
r ** arch, const char ** os)
> +@@ -1307,6 +1315,7 @@ static void defaultMachine(rpmrcCtx ctx,
>
>       if (arch) *arch =3D un.machine;
>       if (os) *os =3D un.sysname;
> @@ -67,6 +67,3 @@ index 19fe80f98..6b27b3941 100644
>   }
>
>   static
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logg=
ing-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-=
rpmscript.c-change-logging-level-around-scriptlets-t.patch
> index 43e9859ef3..9dbe7125de 100644
> --- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-lev=
el-around-scriptlets-t.patch
> +++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-lev=
el-around-scriptlets-t.patch
> @@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   lib/rpmscript.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> -diff --git a/lib/rpmscript.c b/lib/rpmscript.c
> -index 2b0e43862..e319673f1 100644
> ---- a/lib/rpmscript.c
> -+++ b/lib/rpmscript.c
> -@@ -226,7 +226,7 @@ static char * writeScript(const char *cmd, const cha=
r *script)
> +Index: git/lib/rpmscript.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/rpmscript.c
> ++++ git/lib/rpmscript.c
> +@@ -270,7 +270,7 @@ static char * writeScript(const char *cm
>       if (Ferror(fd))
>         goto exit;
>
> @@ -26,7 +26,7 @@ index 2b0e43862..e319673f1 100644
>         static const char set_x[] =3D "set -x\n";
>         /* Assume failures will be caught by the write below */
>         Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> -@@ -258,7 +258,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_c=
onst_t prefixes,
> +@@ -302,7 +302,7 @@ static rpmRC runExtScript(rpmPlugins plu
>       char *mline =3D NULL;
>       rpmRC rc =3D RPMRC_FAIL;
>
> @@ -35,7 +35,7 @@ index 2b0e43862..e319673f1 100644
>
>       if (script) {
>         fn =3D writeScript(*argvp[0], script);
> -@@ -310,7 +310,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_c=
onst_t prefixes,
> +@@ -354,7 +354,7 @@ static rpmRC runExtScript(rpmPlugins plu
>                 sname, strerror(errno));
>         goto exit;
>       } else if (pid =3D=3D 0) {/* Child */
> @@ -44,7 +44,7 @@ index 2b0e43862..e319673f1 100644
>                sname, *argvp[0], (unsigned)getpid());
>
>         fclose(in);
> -@@ -353,7 +353,7 @@ static rpmRC runExtScript(rpmPlugins plugins, ARGV_c=
onst_t prefixes,
> +@@ -397,7 +397,7 @@ static rpmRC runExtScript(rpmPlugins plu
>         reaped =3D waitpid(pid, &status, 0);
>       } while (reaped =3D=3D -1 && errno =3D=3D EINTR);
>
> diff --git a/meta/recipes-devtools/rpm/files/fifofix.patch b/meta/recipes=
-devtools/rpm/files/fifofix.patch
> new file mode 100644
> index 0000000000..71703d7f0c
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/fifofix.patch
> @@ -0,0 +1,22 @@
> +Calling openat() on a fifo causes a pseudo hang for us (e.g. the fifo in=
 psplash).
> +Avoid calling openat for fifos.
> +
> +Introduced upstream with:
> +
> +https://github.com/rpm-software-management/rpm/commit/96ec957e281220f8e1=
37a2d5eb23b83a6377d556
> +
> +Upstream-Status: Submitted [https://github.com/rpm-software-management/r=
pm/issues/2195]
> +
> +Index: git/lib/fsm.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/lib/fsm.c
> ++++ git/lib/fsm.c
> +@@ -1010,7 +1010,7 @@ int rpmPackageFilesInstall(rpmts ts, rpm
> +                     rc =3D RPMERR_UNKNOWN_FILETYPE;
> +             }
> +
> +-          if (!rc && fd =3D=3D -1 && !S_ISLNK(fp->sb.st_mode)) {
> ++          if (!rc && fd =3D=3D -1 && !S_ISLNK(fp->sb.st_mode) && !S_ISF=
IFO(fp->sb.st_mode)) {
> +               /* Only follow safe symlinks, and never on temporary file=
s */
> +               fd =3D fsmOpenat(di.dirfd, fp->fpath,
> +                               fp->suffix ? AT_SYMLINK_NOFOLLOW : 0, 0);
> diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.17.1.bb
> index 9b6446f265..36ab90d91e 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> @@ -24,7 +24,7 @@ HOMEPAGE =3D "http://www.rpm.org"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc4eec0c20c6034b9407a09945b48a=
43f"
>
> -SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-4=
.17.x;protocol=3Dhttps \
> +SRC_URI =3D "git://github.com/rpm-software-management/rpm;branch=3Drpm-4=
.18.x;protocol=3Dhttps \
>             file://environment.d-rpm.sh \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-build=
ing.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
> @@ -36,14 +36,17 @@ SRC_URI =3D "git://github.com/rpm-software-management=
/rpm;branch=3Drpm-4.17.x;protoc
>             file://0001-perl-disable-auto-reqs.patch \
>             file://0016-rpmscript.c-change-logging-level-around-scriptlet=
s-t.patch \
>             file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N=
32.patch \
> -           file://0001-tools-Add-error.h-for-non-glibc-case.patch \
>             file://0001-docs-do-not-build-manpages-requires-pandoc.patch =
\
>             file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm=
-me.patch \
>             file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-=
han.patch \
> +           file://fifofix.patch \
>             "
>
>  PE =3D "1"
> -SRCREV =3D "5bef402da334595ed9302b8bca1acdf5e88bfe11"
> +SRCREV =3D "07a6cca98489106b93467ecfaf5700368983a9b4"
> +PV =3D "4.17.1+4.18-rc1"
> +# can be removed in 4.18
> +CVE_CHECK_IGNORE +=3D "CVE-2021-35937 CVE-2021-35938 CVE-2021-35939"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -80,6 +83,7 @@ PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils=
"
>  PACKAGECONFIG[inhibit] =3D "--enable-inhibit-plugin,--disable-inhibit-pl=
ugin,dbus"
>  PACKAGECONFIG[rpm2archive] =3D "--with-archive,--without-archive,libarch=
ive"
>  PACKAGECONFIG[sqlite] =3D "--enable-sqlite=3Dyes,--enable-sqlite=3Dno,sq=
lite3"
> +PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline=
"
>  PACKAGECONFIG[ndb] =3D "--enable-ndb,--disable-ndb"
>  PACKAGECONFIG[bdb-ro] =3D "--enable-bdb-ro,--disable-bdb-ro"
>  PACKAGECONFIG[zstd] =3D "--enable-zstd=3Dyes,--enable-zstd=3Dno,zstd"
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171209): https://lists.openembedded.org/g/openembedde=
d-core/message/171209
> Mute This Topic: https://lists.openembedded.org/mt/94011010/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

