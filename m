Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.6918.1614867757185202327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 06:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1eLMAL3A;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.53, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f53.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so4607008wma.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b5walEEHHQ1sEYdsX2UfNoJEnseLb/RbA4XDgsY6heU=;
        b=1eLMAL3ApR5jEa7NlDA7UAUukijGj/+n+Hv8OsDAn+KdoSZrYBTUPwwG+dUbvjqm/s
         4Qv0HBHL2aAr8JWN5aPbaV5VKjX92oZ79+RTLSE1B6X+3VmRIam0cChBjgsOw2rH3FnY
         oDxgwUuOxMsqny1ZCBSNKYW/eRlrM2mxOtpwpOcu+ka+bdtYMI4w4mV4G5jGQhhXO2cQ
         mmUY/ZSaTR2vk2CEEi5ep2jwWdc1UQ8kOgPfnc04zyNajJweNw0t0DoLFGIKZgT3Wr84
         BK6AilcuvQuvgxirWYXGZjZkE7MW8Cb+cBsT+107HaPO3O2ls7HgbG3FmQ+JptOigXEA
         Msqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b5walEEHHQ1sEYdsX2UfNoJEnseLb/RbA4XDgsY6heU=;
        b=fTAezRWzDTjy8thHyIq5sD71/p0/v5BbAnEsLgz4QRKBhyfJg2kkOHPOo4VmeMWfHS
         8yxr5FrQag4w6nZtgMzYD94Jj1gwPsGmsxWe4bAPTPPqL623r2jk4kioaw83AIjOmOy2
         35rNWi0f6W2POQ8PWfG0qo8PY6Y1UVRUYZHUSDYU7aNIjJB2lSJxe5Ab0sezo6emLxCi
         IwJ5r4UiCwrhp0lcGd0t10rYdynQJP1mKHDfSAqDushtT1JgTaGmS3wA1+GkKwbgyQYu
         RtYT3zcXbDCkQapFZdB1pz6FlJeSR4szOH/NgHIT86bEj/z68Jr4iyidJ4PycdEvFDF+
         EIhQ==
X-Gm-Message-State: AOAM532HQ5sXVAw4VjDTMdP0DbmJPTbRDdPasWAqpkzVZr27MpPjg2kJ
	kbdvwN9DCYuU1IcfoINhNQDknJQRtOBWQ9EdDy8h5Q==
X-Google-Smtp-Source: ABdhPJzfWdhdTEvc0JbiCF0t+KSIhLsSaRaRZaoiJDBjYqiLh6mwk9Y9ZYPsBaMeuFA4HEuqNjxQSZpzi7frMTliNF4=
X-Received: by 2002:a1c:67d6:: with SMTP id b205mr4219427wmc.118.1614867755316;
 Thu, 04 Mar 2021 06:22:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614780812.git.steve@sakoman.com> <CAMKF1sr9mfJPigoX+ShJQn+F3ZVu2tHOQ=c4MgmJK6pBmiOk1w@mail.gmail.com>
 <1668E4840CB0FC3A.19537@lists.openembedded.org>
In-Reply-To: <1668E4840CB0FC3A.19537@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 4 Mar 2021 04:22:22 -1000
Message-ID: <CAOSpxdZD=zxHDvhEoGZcPE=8BPF_kTxkau8BSah850dOphrOvg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/41] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2021 at 7:15 AM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Wed, Mar 3, 2021 at 6:40 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Mar 3, 2021 at 6:17 AM Steve Sakoman <steve@sakoman.com> wrote=
:
> > >
> > > The following changes since commit a8debddd6cbdd70db74e096d72f97fbee=
008ee63:
> > >
> > >   build-appliance-image: Update to dunfell head revision (2021-02-18=
 23:43:04 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.openembedded.org/openembedded-core-contrib stable/dunfel=
l-next
> > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dst=
able/dunfell-next
> > >
> > > Alexander Kanavin (1):
> > >   connman: update to 1.38
> > >
> >
> > connman changes will impact iwd and also depend on ell version. Many
> > times they go in lock steps.
>
> Armin specifically requested these connman version update patches for
> dunfell. Armin, can you comment on Khem's concerns?

In order to not hold up the other 38 patches I am going to remove the
two patches in question from this pull request and resubmit.

Once Armin has responded I can add them to the next batch of patches.

Steve

>
> > > Andrei Gherzan (2):
> > >   oe/recipeutils: Fix copying patches when BBLAYERS entries are not
> > >     normalised
> > >   qemu: Backport patch to avoid assertion fails on icache line size
> > >
> > > Bruce Ashfield (2):
> > >   linux-yocto/5.4: update to v5.4.96
> > >   linux-yocto/5.4: update to v5.4.98
> > >
> > > Chris Laplante (2):
> > >   cve-check: introduce CVE_CHECK_RECIPE_FILE variable to allow chang=
ing
> > >     of per-recipe check file
> > >   cve-check: add CVE_CHECK_REPORT_PATCHED variable to suppress repor=
ting
> > >     of patched CVEs
> > >
> > > Jan-Simon M=C3=B6ller (1):
> > >   package_rpm: Enable use_source_date_epoch_as_buildtime in package_=
rpm
> > >     class
> > >
> > > Joshua Watt (3):
> > >   oeqa: reproducible: Fix SSTATE_MIRRORS variable
> > >   oeqa: reproducible: Add more logging
> > >   libomxil: Fix up commercial license flag
> > >
> > > Lee Chee Yang (2):
> > >   sudo: 1.8.31 -> 1.8.32
> > >   go: update to 1.14.15
> > >
> > > Marek Vasut (1):
> > >   weston-init: Fix weston-keyboard path in weston.ini
> > >
> > > Martin Jansa (1):
> > >   icu: backport fix for rare random genrb segmentation fault
> > >
> > > Richard Purdie (16):
> > >   pseudo: Update to work with glibc 2.33
> > >   pseudo: Update for rename and faccessat fixes
> > >   pseudo: Update to include fixes for glibc 2.33
> > >   quilt: Be determnistic about column presence
> > >   buildtools-extended-tarball: Add glibc-gconvs needed for build
> > >   cwautomacros: Ensure version is set deterministically
> > >   vim: Improve determinism
> > >   vim: Fix a race over creation of the desktop files
> > >   watchdog: Fix determinism issue from sendmail host path
> > >   watchdog: Avoid reproducibility failures after fixing build
> > >   xorg-fonts-minimal: Fix reproducibility
> > >   xorg-minimal-fonts: Really fix determinism
> > >   xmlto: Fix reproducibility
> > >   groff: Fix determinism issue
> > >   oeqa/commands: Fix compatibility with python 3.9
> > >   selftest/reproducible: Don't call sync between each file compare
> > >
> > > Scott Murray (1):
> > >   u-boot: fix CVE-2020-8432 and CVE-2020-10648
> > >
> > > Teoh Jay Shen (1):
> > >   oeqa/runlevel : add test for runlevels
> > >
> > > Thomas Viehweger (1):
> > >   mtd-utils: Remove duplicate assignments to alternative link names
> > >
> > > Vivien Didelot (2):
> > >   local.conf.sample.extended: fix double 'of' typo
> > >   local.conf.sample.extended: prefer INIT_MANAGER
> > >
> > > Wes Lindauer (1):
> > >   df.py: Add feature check for read-only-rootfs
> > >
> > > Yoann Congal (1):
> > >   npm.bbclass: avoid building target nodejs for native npm recipes
> > >
> > > Zbigniew Bodek (1):
> > >   wpebackend-fdo: Fix missing .so symlink when using dev package
> > >
> > > akuster (2):
> > >   cve-check.bbclass: add layer to cve log
> > >   connman: update to 1.39
> > >
> > >  meta/classes/cve-check.bbclass                |   46 +-
> > >  meta/classes/npm.bbclass                      |    2 +-
> > >  meta/classes/package_rpm.bbclass              |    1 +
> > >  meta/conf/local.conf.sample.extended          |   23 +-
> > >  meta/lib/oe/recipeutils.py                    |    2 +-
> > >  meta/lib/oeqa/runtime/cases/df.py             |    2 +
> > >  meta/lib/oeqa/runtime/cases/runlevel.py       |   22 +
> > >  meta/lib/oeqa/selftest/cases/reproducible.py  |    7 +-
> > >  meta/lib/oeqa/utils/commands.py               |    4 +-
> > >  .../u-boot/files/CVE-2020-10648-1.patch       |   98 ++
> > >  .../u-boot/files/CVE-2020-10648-2.patch       |   52 +
> > >  .../u-boot/files/CVE-2020-8432.patch          |  114 ++
> > >  meta/recipes-bsp/u-boot/u-boot-common.inc     |    3 +
> > >  meta/recipes-connectivity/connman/connman.inc |    1 +
> > >  ...-gweb-fix-segfault-with-musl-v1.1.21.patch |   34 -
> > >  ...ve-musl-does-not-implement-res_ninit.patch |   20 +-
> > >  .../connman/connman_1.37.bb                   |   17 -
> > >  .../connman/connman_1.39.bb                   |   15 +
> > >  .../meta/buildtools-extended-tarball.bb       |   10 +
> > >  meta/recipes-devtools/go/go-1.14.inc          |    5 +-
> > >  ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch |   98 --
> > >  meta/recipes-devtools/mtd/mtd-utils_git.bb    |    2 -
> > >  meta/recipes-devtools/pseudo/pseudo_git.bb    |    2 +-
> > >  meta/recipes-devtools/qemu/qemu.inc           |    1 +
> > >  ...fix-crash-when-compiling-with-uClibc.patch |   48 +
> > >  meta/recipes-devtools/quilt/quilt.inc         |    2 +-
> > >  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |    2 +-
> > >  .../cwautomacros/cwautomacros_20110201.bb     |    2 +-
> > >  .../groff/files/0001-Include-config.h.patch   | 1026 +-------------=
---
> > >  meta/recipes-extended/groff/groff_1.22.4.bb   |   11 +
> > >  meta/recipes-extended/sudo/sudo.inc           |    2 +-
> > >  ...Fix-includes-when-building-with-musl.patch |   29 +
> > >  .../sudo/{sudo_1.8.31.bb =3D> sudo_1.8.32.bb}   |    5 +-
> > >  .../watchdog/watchdog_5.15.bb                 |    6 +
> > >  .../wayland/weston-init/weston.ini            |    2 +-
> > >  .../xorg-font/xorg-minimal-fonts.bb           |    8 +-
> > >  .../linux/linux-yocto-rt_5.4.bb               |    6 +-
> > >  .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
> > >  .../libomxil/libomxil_0.9.3.bb                |    6 +-
> > >  .../webkit/wpebackend-fdo_1.4.1.bb            |    3 +
> > >  ...cnvalias-as-a-dependency-of-misc_res.patch |   24 +
> > >  meta/recipes-support/icu/icu_66.1.bb          |    4 +-
> > >  meta/recipes-support/vim/files/racefix.patch  |   33 +
> > >  meta/recipes-support/vim/vim.inc              |    3 +
> > >  45 files changed, 574 insertions(+), 1259 deletions(-)
> > >  create mode 100644 meta/lib/oeqa/runtime/cases/runlevel.py
> > >  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-1.p=
atch
> > >  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-10648-2.p=
atch
> > >  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2020-8432.patc=
h
> > >  delete mode 100644 meta/recipes-connectivity/connman/connman/0001-g=
web-fix-segfault-with-musl-v1.1.21.patch
> > >  delete mode 100644 meta/recipes-connectivity/connman/connman_1.37.b=
b
> > >  create mode 100644 meta/recipes-connectivity/connman/connman_1.39.b=
b
> > >  delete mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-per=
mit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
> > >  create mode 100644 meta/recipes-devtools/qemu/qemu/0012-util-cachei=
nfo-fix-crash-when-compiling-with-uClibc.patch
> > >  create mode 100644 meta/recipes-extended/sudo/sudo/0001-Fix-include=
s-when-building-with-musl.patch
> > >  rename meta/recipes-extended/sudo/{sudo_1.8.31.bb =3D> sudo_1.8.32.=
bb} (89%)
> > >  create mode 100644 meta/recipes-support/icu/icu/0002-ICU-21175-Add-=
cnvalias-as-a-dependency-of-misc_res.patch
> > >  create mode 100644 meta/recipes-support/vim/files/racefix.patch
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
>
>=20
>
