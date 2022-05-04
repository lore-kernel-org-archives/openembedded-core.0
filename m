Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C556C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 00:01:22 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.800.1651622472132176649
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 17:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MdbJ9DRq;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id x9so14792226qts.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pZ0GEzI3tpeNhcMjHD1auxf0ugQTVk0uIosrnMiDzPo=;
        b=MdbJ9DRqMLvGddUziIRU8wHi6AFalaXh65DQltlizr4aIsiMesISyrjQ4gCy4uU+C3
         /BVfel2DGEGsYBfYoT+oGk6tAFlb9eeis8r8dJq9sj2o22eGQjNYc6t/bZiBIWd7nHLE
         IfxObdQaAS7IhNZEFGSJo2tO2g3uxOaJBTsASqfiglh1D/fwfBMKrItcG6foDXbNKjqP
         xBzewY3AlONOyrUIj5FMCREPdOG7p11LEhbjb5/xXJjcpaDZWjZMiX14KP/W40XLyB7r
         3i1jN/jt5faljU45aeY33wuXps7Nu1EFvNIFALWbWq0oXRv6ojxZhr9vCM2dQf+NlAMK
         v9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZ0GEzI3tpeNhcMjHD1auxf0ugQTVk0uIosrnMiDzPo=;
        b=qpvl/fs8BzzDUGjpijdiA+O/gJ0MKFdi7RwObpW3BJkRn8ka6lDZqREdWvmHCDMkyO
         TFz7TK6afAhAurx0SM8PiwmFmmHaSoB0oXFLFrjERk9STZ7Lim14iZVZ0vcToF1VDyYG
         AYQM/9mU0YKiIRjldQhLUAfw0Yh4Y8NojxYqVvG5Mh50uDYbza4AnNaO6A/LrotKEzfl
         QLMNdd8qNQGe5gg125+a+bAc2s9GHsgD6O2e0rVuP3HOWDLjy+QZGd3vqN6rvUO6qEcH
         BkzwB9dwwl7cmpcyRkqTVP1pyaTAH+uiZROY+2QOw00DnsuaZI7gGBqlcB3YPtxQ/XRB
         B/mA==
X-Gm-Message-State: AOAM533QIlj1pjlndezN2XpVtJXKEyArXfg0XOrUE974lnLSHCxWbwdB
	ssoAYZFb4yH3o1lDPWFoBypCwagIss5vPCc9LMo=
X-Google-Smtp-Source: 
 ABdhPJyHTrIl5+JzTyzQXUL2SscUe31pvcYsW4MeYDU3e3sBV7OkSr8pmn+DvyiyHSSD0qIwpR8DiUDT6PJUXpU3bPY=
X-Received: by 2002:a05:622a:108:b0:2f3:b31b:b45f with SMTP id
 u8-20020a05622a010800b002f3b31bb45fmr3233495qtw.532.1651622470864; Tue, 03
 May 2022 17:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651617090.git.steve@sakoman.com>
 <e3891bfd-95ec-15d5-0b11-36966cd3eaa7@gmail.com>
 <CAOSpxdYmHbwwUKJ0ED2uqqpomoVOT0wn39DzHZtYO7rSwBQoCg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYmHbwwUKJ0ED2uqqpomoVOT0wn39DzHZtYO7rSwBQoCg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 May 2022 17:00:59 -0700
Message-ID: 
 <CAMKF1srN1p1K_O1j2+wRJr-u_ao2H=8fUO81w28rz3T5Q_vVnA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/34] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000add49f05de24522d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 00:01:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165210

--000000000000add49f05de24522d
Content-Type: text/plain; charset="UTF-8"

On Tue, May 3, 2022 at 4:57 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Tue, May 3, 2022 at 1:44 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > can you pick
> >
> >
> >
> https://git.openembedded.org/openembedded-core/commit/?id=20e9917b8d40f576b3661bc29e13602a24e86b7b
>
> Yes, I've already got that in my patch set currently under test:
>
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
>

Thanks Steve


> Steve
>
> > On 5/3/22 15:33, Steve Sakoman wrote:
> > > The following changes since commit
> ca1c990df62f1b3d53b2114a387f192efe7e38e8:
> > >
> > >    ruby: upgrade 3.1.1 -> 3.1.2 (2022-04-28 17:07:01 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >    git://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-next
> > >
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next
> > >
> > > Alexander Kanavin (2):
> > >    glib: upgrade 2.72.0 -> 2.72.1
> > >    libxml2: update patch status
> > >
> > > Carlos Rafael Giani (2):
> > >    gstreamer1.0-plugins-good: Fix libsoup dependency
> > >    gstreamer1.0: Minor documentation addition
> > >
> > > Chen Qi (2):
> > >    cases/buildepoxy.py: fix typo
> > >    go.bbclass: disable the use of the default configuration file
> > >
> > > Davide Gardenal (1):
> > >    create-spdx: delete virtual/kernel dependency to fix FreeRTOS build
> > >
> > > Dmitry Baryshkov (2):
> > >    linux-firmware: correct license for ar3k firmware
> > >    arch-armv8-2a.inc: fix a typo in TUNEVALID variable
> > >
> > > Henning Schild (1):
> > >    wic: do not use PARTLABEL for msdos partition tables
> > >
> > > Khem Raj (7):
> > >    seatd: Disable overflow warning as error on ppc64/musl
> > >    musl: Fix build when usrmerge distro feature is enabled
> > >    gcompat: Fix build when usrmerge distro feature is enabled
> > >    libc-glibc: Use libxcrypt to provide virtual/crypt
> > >    qemu.bbclass: Extend ppc/ppc64 extra options
> > >    busybox: Use base_bindir instead of hardcoding /bin path
> > >    util-linux: Create u-a symlink for findfs utility
> > >
> > > Naveen Saini (1):
> > >    gstreamer1.0-plugins-bad: drop patch
> > >
> > > Nicolas Dechesne (1):
> > >    sanity: skip make 4.2.1 warning for debian
> > >
> > > Paul Gortmaker (1):
> > >    install/devshell: Introduce git intercept script due to fakeroot
> > >      issues
> > >
> > > Peter Kjellerstedt (2):
> > >    terminal.py: Restore error output from Terminal
> > >    devshell.bbclass: Allow devshell & pydevshell to use the network
> > >
> > > Pgowda (1):
> > >    glibc: ptest: Fix glibc-tests package issue
> > >
> > > Rahul Kumar (1):
> > >    neard: Switch SRC_URI to git repo
> > >
> > > Richard Purdie (2):
> > >    base: Drop git intercept
> > >    staging: Ensure we filter out ourselves
> > >
> > > Ross Burton (5):
> > >    e2fsprogs: fix CVE-2022-1304
> > >    python3: ignore CVE-2015-20107
> > >    cve_check: skip remote patches that haven't been fetched when
> > >      searching for CVE tags
> > >    subversion: upgrade to 1.14.2
> > >    bitbake.conf: mark all directories as safe for git to read
> > >
> > > Russ Dill (2):
> > >    package.bbclass: Prevent perform_packagecopy from removing
> > >      /sysroot-only
> > >    kernel-yocto.bbclass: Fixup do_kernel_configcheck usage of KMETA
> > >
> > > wangmy (1):
> > >    apt: upgrade 2.4.4 -> 2.4.5
> > >
> > >   meta/classes/create-spdx.bbclass              |  2 -
> > >   meta/classes/devshell.bbclass                 |  4 ++
> > >   meta/classes/go.bbclass                       |  1 +
> > >   meta/classes/kernel-yocto.bbclass             | 14 ++--
> > >   meta/classes/package.bbclass                  |  8 +--
> > >   meta/classes/qemu.bbclass                     |  6 +-
> > >   meta/classes/sanity.bbclass                   |  2 +-
> > >   meta/classes/staging.bbclass                  |  2 +-
> > >   meta/conf/bitbake.conf                        |  8 +++
> > >   meta/conf/distro/include/tclibc-glibc.inc     |  1 +
> > >   .../machine/include/arm/arch-armv8-2a.inc     |  2 +-
> > >   meta/lib/oe/cve_check.py                      |  5 +-
> > >   meta/lib/oe/terminal.py                       |  3 +-
> > >   meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 +-
> > >   meta/recipes-connectivity/neard/neard_0.16.bb | 13 ++--
> > >   meta/recipes-core/busybox/busybox.inc         |  2 +-
> > >   ...s-for-typechecking-with-atomic-compa.patch | 64 -----------------
> > >   ...variant-of-g_atomic_int_compare_and_.patch | 70 ------------------
> > >   ...ble-more-tests-while-cross-compiling.patch | 32 ++++-----
> > >   .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 +--
> > >   ...{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} |  4 +-
> > >   meta/recipes-core/glibc/glibc-tests_2.35.bb   |  3 +-
> > >   .../recipes-core/libxml/libxml2/runtest.patch |  4 +-
> > >   meta/recipes-core/musl/gcompat_git.bb         |  8 +--
> > >   meta/recipes-core/musl/musl_git.bb            |  6 +-
> > >   meta/recipes-core/seatd/seatd_0.6.4.bb        |  3 +
> > >   .../util-linux/util-linux_2.37.4.bb           |  1 +
> > >   .../apt/{apt_2.4.4.bb => apt_2.4.5.bb}        |  2 +-
> > >   .../e2fsprogs/e2fsprogs/extents.patch         | 56 +++++++++++++++
> > >   .../e2fsprogs/e2fsprogs_1.46.5.bb             |  1 +
> > >   .../recipes-devtools/python/python3_3.10.4.bb |  3 +
> > >   .../subversion/subversion/disable_macos.patch | 71
> -------------------
> > >   ...version_1.14.1.bb => subversion_1.14.2.bb} |  3 +-
> > >   .../linux-firmware/linux-firmware_20220411.bb |  4 +-
> > >   .../0005-msdk-fix-includedir-path.patch       | 40 -----------
> > >   .../gstreamer1.0-plugins-bad_1.20.1.bb        |  3 +-
> > >   .../gstreamer1.0-plugins-base_1.20.1.bb       |  2 +
> > >   .../gstreamer1.0-plugins-good_1.20.1.bb       |  7 +-
> > >   scripts/git-intercept/git                     | 19 +++++
> > >   scripts/lib/wic/plugins/imager/direct.py      |  2 +-
> > >   40 files changed, 174 insertions(+), 317 deletions(-)
> > >   delete mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
> > >   delete mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
> > >   rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.0.bb =>
> glib-2.0_2.72.1.bb} (90%)
> > >   rename meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb}
> (97%)
> > >   create mode 100644
> meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
> > >   delete mode 100644
> meta/recipes-devtools/subversion/subversion/disable_macos.patch
> > >   rename meta/recipes-devtools/subversion/{subversion_1.14.1.bb =>
> subversion_1.14.2.bb} (96%)
> > >   delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
> > >   create mode 100755 scripts/git-intercept/git
> > >
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#165207):
> https://lists.openembedded.org/g/openembedded-core/message/165207
> > > Mute This Topic: https://lists.openembedded.org/mt/90876532/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

--000000000000add49f05de24522d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 3, 2022 at 4:57 PM Steve Sakoman &lt;<a href=3D=
"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Tue, May 3, 2022 at 1:44 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; can you pick<br>
&gt;<br>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D20e9917b8d40f576b3661bc29e13602a24e86b7b" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D20e9917b=
8d40f576b3661bc29e13602a24e86b7b</a><br>
<br>
Yes, I&#39;ve already got that in my patch set currently under test:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
stable/kirkstone-nut" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-nut</a><br=
>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks Steve=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Steve<br>
<br>
&gt; On 5/3/22 15:33, Steve Sakoman wrote:<br>
&gt; &gt; The following changes since commit ca1c990df62f1b3d53b2114a387f19=
2efe7e38e8:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 ruby: upgrade 3.1.1 -&gt; 3.1.2 (2022-04-28 17:07:01=
 +0100)<br>
&gt; &gt;<br>
&gt; &gt; are available in the Git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 git://<a href=3D"http://git.openembedded.org/openemb=
edded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.o=
rg/openembedded-core-contrib</a> stable/kirkstone-next<br>
&gt; &gt;=C2=A0 =C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded=
-core-contrib/log/?h=3Dstable/kirkstone-next" rel=3D"noreferrer" target=3D"=
_blank">http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dsta=
ble/kirkstone-next</a><br>
&gt; &gt;<br>
&gt; &gt; Alexander Kanavin (2):<br>
&gt; &gt;=C2=A0 =C2=A0 glib: upgrade 2.72.0 -&gt; 2.72.1<br>
&gt; &gt;=C2=A0 =C2=A0 libxml2: update patch status<br>
&gt; &gt;<br>
&gt; &gt; Carlos Rafael Giani (2):<br>
&gt; &gt;=C2=A0 =C2=A0 gstreamer1.0-plugins-good: Fix libsoup dependency<br=
>
&gt; &gt;=C2=A0 =C2=A0 gstreamer1.0: Minor documentation addition<br>
&gt; &gt;<br>
&gt; &gt; Chen Qi (2):<br>
&gt; &gt;=C2=A0 =C2=A0 cases/buildepoxy.py: fix typo<br>
&gt; &gt;=C2=A0 =C2=A0 go.bbclass: disable the use of the default configura=
tion file<br>
&gt; &gt;<br>
&gt; &gt; Davide Gardenal (1):<br>
&gt; &gt;=C2=A0 =C2=A0 create-spdx: delete virtual/kernel dependency to fix=
 FreeRTOS build<br>
&gt; &gt;<br>
&gt; &gt; Dmitry Baryshkov (2):<br>
&gt; &gt;=C2=A0 =C2=A0 linux-firmware: correct license for ar3k firmware<br=
>
&gt; &gt;=C2=A0 =C2=A0 arch-armv8-2a.inc: fix a typo in TUNEVALID variable<=
br>
&gt; &gt;<br>
&gt; &gt; Henning Schild (1):<br>
&gt; &gt;=C2=A0 =C2=A0 wic: do not use PARTLABEL for msdos partition tables=
<br>
&gt; &gt;<br>
&gt; &gt; Khem Raj (7):<br>
&gt; &gt;=C2=A0 =C2=A0 seatd: Disable overflow warning as error on ppc64/mu=
sl<br>
&gt; &gt;=C2=A0 =C2=A0 musl: Fix build when usrmerge distro feature is enab=
led<br>
&gt; &gt;=C2=A0 =C2=A0 gcompat: Fix build when usrmerge distro feature is e=
nabled<br>
&gt; &gt;=C2=A0 =C2=A0 libc-glibc: Use libxcrypt to provide virtual/crypt<b=
r>
&gt; &gt;=C2=A0 =C2=A0 qemu.bbclass: Extend ppc/ppc64 extra options<br>
&gt; &gt;=C2=A0 =C2=A0 busybox: Use base_bindir instead of hardcoding /bin =
path<br>
&gt; &gt;=C2=A0 =C2=A0 util-linux: Create u-a symlink for findfs utility<br=
>
&gt; &gt;<br>
&gt; &gt; Naveen Saini (1):<br>
&gt; &gt;=C2=A0 =C2=A0 gstreamer1.0-plugins-bad: drop patch<br>
&gt; &gt;<br>
&gt; &gt; Nicolas Dechesne (1):<br>
&gt; &gt;=C2=A0 =C2=A0 sanity: skip make 4.2.1 warning for debian<br>
&gt; &gt;<br>
&gt; &gt; Paul Gortmaker (1):<br>
&gt; &gt;=C2=A0 =C2=A0 install/devshell: Introduce git intercept script due=
 to fakeroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 issues<br>
&gt; &gt;<br>
&gt; &gt; Peter Kjellerstedt (2):<br>
&gt; &gt;=C2=A0 =C2=A0 terminal.py: Restore error output from Terminal<br>
&gt; &gt;=C2=A0 =C2=A0 devshell.bbclass: Allow devshell &amp; pydevshell to=
 use the network<br>
&gt; &gt;<br>
&gt; &gt; Pgowda (1):<br>
&gt; &gt;=C2=A0 =C2=A0 glibc: ptest: Fix glibc-tests package issue<br>
&gt; &gt;<br>
&gt; &gt; Rahul Kumar (1):<br>
&gt; &gt;=C2=A0 =C2=A0 neard: Switch SRC_URI to git repo<br>
&gt; &gt;<br>
&gt; &gt; Richard Purdie (2):<br>
&gt; &gt;=C2=A0 =C2=A0 base: Drop git intercept<br>
&gt; &gt;=C2=A0 =C2=A0 staging: Ensure we filter out ourselves<br>
&gt; &gt;<br>
&gt; &gt; Ross Burton (5):<br>
&gt; &gt;=C2=A0 =C2=A0 e2fsprogs: fix CVE-2022-1304<br>
&gt; &gt;=C2=A0 =C2=A0 python3: ignore CVE-2015-20107<br>
&gt; &gt;=C2=A0 =C2=A0 cve_check: skip remote patches that haven&#39;t been=
 fetched when<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 searching for CVE tags<br>
&gt; &gt;=C2=A0 =C2=A0 subversion: upgrade to 1.14.2<br>
&gt; &gt;=C2=A0 =C2=A0 bitbake.conf: mark all directories as safe for git t=
o read<br>
&gt; &gt;<br>
&gt; &gt; Russ Dill (2):<br>
&gt; &gt;=C2=A0 =C2=A0 package.bbclass: Prevent perform_packagecopy from re=
moving<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /sysroot-only<br>
&gt; &gt;=C2=A0 =C2=A0 kernel-yocto.bbclass: Fixup do_kernel_configcheck us=
age of KMETA<br>
&gt; &gt;<br>
&gt; &gt; wangmy (1):<br>
&gt; &gt;=C2=A0 =C2=A0 apt: upgrade 2.4.4 -&gt; 2.4.5<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/create-spdx.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 -<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/devshell.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/package.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +--<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/qemu.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/sanity.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/staging.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
&gt; &gt;=C2=A0 =C2=A0meta/conf/distro/include/tclibc-glibc.inc=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0.../machine/include/arm/arch-armv8-2a.inc=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/lib/oe/cve_check.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/lib/oe/terminal.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/lib/oeqa/sdk/cases/buildepoxy.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-connectivity/neard/<a href=3D"http://nea=
rd_0.16.bb" rel=3D"noreferrer" target=3D"_blank">neard_0.16.bb</a> | 13 ++-=
-<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/busybox/busybox.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0...s-for-typechecking-with-atomic-compa.patch | 64 --=
---------------<br>
&gt; &gt;=C2=A0 =C2=A0...variant-of-g_atomic_int_compare_and_.patch | 70 --=
----------------<br>
&gt; &gt;=C2=A0 =C2=A0...ble-more-tests-while-cross-compiling.patch | 32 ++=
++-----<br>
&gt; &gt;=C2=A0 =C2=A0.../glib-2.0/glib-2.0/relocate-modules.patch=C2=A0 |=
=C2=A0 8 +--<br>
&gt; &gt;=C2=A0 =C2=A0...{<a href=3D"http://glib-2.0_2.72.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">glib-2.0_2.72.0.bb</a> =3D&gt; <a href=3D"http://=
glib-2.0_2.72.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.1.bb=
</a>} |=C2=A0 4 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc-tests=
_2.35.bb" rel=3D"noreferrer" target=3D"_blank">glibc-tests_2.35.bb</a>=C2=
=A0 =C2=A0|=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 =C2=A0.../recipes-core/libxml/libxml2/runtest.patch |=C2=A0=
 4 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/musl/<a href=3D"http://gcompat_git.=
bb" rel=3D"noreferrer" target=3D"_blank">gcompat_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +--<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">musl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
&gt; &gt;=C2=A0 =C2=A0meta/recipes-core/seatd/<a href=3D"http://seatd_0.6.4=
.bb" rel=3D"noreferrer" target=3D"_blank">seatd_0.6.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt; &gt;=C2=A0 =C2=A0.../util-linux/<a href=3D"http://util-linux_2.37.4.bb=
" rel=3D"noreferrer" target=3D"_blank">util-linux_2.37.4.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0.../apt/{<a href=3D"http://apt_2.4.4.bb" rel=3D"noref=
errer" target=3D"_blank">apt_2.4.4.bb</a> =3D&gt; <a href=3D"http://apt_2.4=
.5.bb" rel=3D"noreferrer" target=3D"_blank">apt_2.4.5.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0.../e2fsprogs/e2fsprogs/extents.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 56 +++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0.../e2fsprogs/<a href=3D"http://e2fsprogs_1.46.5.bb" =
rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.46.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0.../recipes-devtools/python/<a href=3D"http://python3=
_3.10.4.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.4.bb</a> |=C2=
=A0 3 +<br>
&gt; &gt;=C2=A0 =C2=A0.../subversion/subversion/disable_macos.patch | 71 --=
-----------------<br>
&gt; &gt;=C2=A0 =C2=A0...<a href=3D"http://version_1.14.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">version_1.14.1.bb</a> =3D&gt; <a href=3D"http://sub=
version_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.14.2.b=
b</a>} |=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 =C2=A0.../linux-firmware/<a href=3D"http://linux-firmware_2=
0220411.bb" rel=3D"noreferrer" target=3D"_blank">linux-firmware_20220411.bb=
</a> |=C2=A0 4 +-<br>
&gt; &gt;=C2=A0 =C2=A0.../0005-msdk-fix-includedir-path.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 40 -----------<br>
&gt; &gt;=C2=A0 =C2=A0.../<a href=3D"http://gstreamer1.0-plugins-bad_1.20.1=
.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-bad_1.20.1.b=
b</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 =C2=A0.../<a href=3D"http://gstreamer1.0-plugins-base_1.20.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-base_1.20.1=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
&gt; &gt;=C2=A0 =C2=A0.../<a href=3D"http://gstreamer1.0-plugins-good_1.20.=
1.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.20.1=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +-<br>
&gt; &gt;=C2=A0 =C2=A0scripts/git-intercept/git=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++<br>
&gt; &gt;=C2=A0 =C2=A0scripts/lib/wic/plugins/imager/direct.py=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A040 files changed, 174 insertions(+), 317 deletions(-)=
<br>
&gt; &gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-core/glib-2.0/glib-2.=
0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch<br>
&gt; &gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-core/glib-2.0/glib-2.=
0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch<br>
&gt; &gt;=C2=A0 =C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://=
glib-2.0_2.72.0.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.72.0.bb=
</a> =3D&gt; <a href=3D"http://glib-2.0_2.72.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">glib-2.0_2.72.1.bb</a>} (90%)<br>
&gt; &gt;=C2=A0 =C2=A0rename meta/recipes-devtools/apt/{<a href=3D"http://a=
pt_2.4.4.bb" rel=3D"noreferrer" target=3D"_blank">apt_2.4.4.bb</a> =3D&gt; =
<a href=3D"http://apt_2.4.5.bb" rel=3D"noreferrer" target=3D"_blank">apt_2.=
4.5.bb</a>} (97%)<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/e2fsprogs/e2=
fsprogs/extents.patch<br>
&gt; &gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/subversion/s=
ubversion/disable_macos.patch<br>
&gt; &gt;=C2=A0 =C2=A0rename meta/recipes-devtools/subversion/{<a href=3D"h=
ttp://subversion_1.14.1.bb" rel=3D"noreferrer" target=3D"_blank">subversion=
_1.14.1.bb</a> =3D&gt; <a href=3D"http://subversion_1.14.2.bb" rel=3D"noref=
errer" target=3D"_blank">subversion_1.14.2.bb</a>} (96%)<br>
&gt; &gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/=
gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch<br>
&gt; &gt;=C2=A0 =C2=A0create mode 100755 scripts/git-intercept/git<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#165207): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/165207" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/165207</a><b=
r>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/908=
76532/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/90876532/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000add49f05de24522d--

