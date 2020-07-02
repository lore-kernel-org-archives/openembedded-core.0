Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.2791.1593713997833546755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rk4eoCX2;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id e22so24941092edq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c4xlzGXrzryXQhEbxngED7kYlR6TcwxFIrfdPCCORsE=;
        b=Rk4eoCX2KpYL1lxLncTUOPGc1EhR8IV03tU8G4Ff6PkHhEx4d1mdhEewxFS61UFyHK
         COP1y82aTO9f9V6PXRBZfuTMad5k5V17eOgomyCzuJwkJpBGxWKuvQgDKPSwmMZGEDu/
         VdpcggO7KyOfoeiRUAzUDnSyoUaBqZOuFNox8e1kYkxCicsa0z+vkN/BMcSZRqgvOKt5
         NNqPPJmDwgb1IB+/P+VRHEYq3ERl1SZi0i9XKdK1kK9pYN9HaUAUOWLYpXKIlQ0Nbhub
         UWgG5rdtBno3TZSOZXG7tORayH1C9KDdUkuKLTKoLzDycKCLagW9f9AiX7xRXuFfrnBq
         7ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c4xlzGXrzryXQhEbxngED7kYlR6TcwxFIrfdPCCORsE=;
        b=D+Zhdj98RWZhW5XFS+eOwEpaomrVb+TiBBcVn5QMUkVjCWFj9kHu69dCDTXi7pMHMk
         /klRSkiDKaNmIoMrwRpEClOSL9B7cFXKTJrggyPcPAqf1pxhAF2/EigjqHLKfVZr3jJC
         8gkWNbH9Tow3OfgGHWVCNZRYG8ytP4IjR7CYMcsNYWj1kzTvW84tlchnw8068TEf0gsH
         521rXmh7DOeRzZfSDg2WJLH7oZ/RhiY2vByhRVo0wN9X4KLDQVjzq9ID2aLO0CGdy7iS
         QjbPDdrOIYxBSZJRPXV4QgF9p4ZAxKCtGvZpo2/6BWmugUwbR+wtdJWayVw61m7DA8Gy
         Q5IQ==
X-Gm-Message-State: AOAM5311jIDEUhI9zYUSmVg91xt5fiYu+x3JH10NMt8hsPwhyfWqogwe
	URh71Q3j1JQdg44evUlqOw2F1/lFiBPA6bAni6o=
X-Google-Smtp-Source: ABdhPJzI4tpSSUIaYN3V4XPiyfqVZou+l1V1xj+xSxiOs13aGXc2T/Gml5/wNMGQdVfiIIYxuek5iuBCfmJPH0lrGkY=
X-Received: by 2002:a05:6402:1614:: with SMTP id f20mr34833587edv.129.1593713996381;
 Thu, 02 Jul 2020 11:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593653993.git.steve@sakoman.com> <CADkTA4PsN1t8pi=qtGNcZDcSvhCx0RO55cV87YWwUufwCXqLOQ@mail.gmail.com>
 <CAOSpxdaHZpvfLwVy=-g9E3+VLFbEQcQ9ZbJC7kKTpPwFnNr1Bw@mail.gmail.com>
In-Reply-To: <CAOSpxdaHZpvfLwVy=-g9E3+VLFbEQcQ9ZbJC7kKTpPwFnNr1Bw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 14:19:45 -0400
Message-ID: <CADkTA4NtP_jPiLZ0_CpF=Fu1nRrrrOvTtVTiPdHskMTXw76Erw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/22] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 2:16 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Jul 2, 2020 at 8:08 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Jul 1, 2020 at 9:41 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > The following changes since commit 1a98936830ba468d63e2e49d766add9e9cb75998:
> > >
> > >   gstreamer1.0-plugins-bad: add support for vdpau (2020-06-23 04:33:47 -1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> > >
> > > Alexander Kanavin (1):
> > >   linux-firmware: upgrade 20200519 -> 20200619
> > >
> > > Andrej Valek (1):
> > >   oeqa/runtime/cases/ptest: Make output content path absolute
> > >
> > > Armin Kuster (2):
> > >   curl: Security fixes for CVE-2020-{8169/8177}
> > >   wpa-supplicant: Security fix CVE-2020-12695
> > >
> > > Changqing Li (1):
> > >   mime.bbclass: fix post install scriptlet error
> > >
> > > Chen Qi (1):
> > >   systemd-serialgetty: do not use BindsTo
> > >
> > > Konrad Weihmann (2):
> > >   runqemu: add QB_ROOTFS_EXTRA_OPT parameter
> > >   testimage: enable ovmf support
> > >
> > > Lee Chee Yang (2):
> > >   dbus: fix CVE-2020-12049
> > >   perl: fix CVE-2020-10543 & CVE-2020-10878
> > >
> > > Lili Li (1):
> > >   kernel.bbclass: Fix Module.symvers support
> >
> > I wouldn't recommend this going back to dunfell. It is papering over
> > an issue, and is for a new kernel than we ever used in dunfell.
>
> Your comment is a few hours too late!  Richard did the pull earlier today.
>
> Do you recommend that I revert this patch?

It can stay for now. I'm looking at the best approach, we should
either do a 2nd copy task or move the copy until after the modules
build ..  in the former solution the test is ok, since we'll pickup
the file later. In the latter, it needs to be reverted.

I just have to confirm that nothing in the module build step actually
needs the parts of the shared workdir.

Bruce

>
> Steve
>
> > > Ming Liu (1):
> > >   u-boot: introduce UBOOT_INITIAL_ENV
> > >
> > > Nicolas Dechesne (1):
> > >   checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
> > >
> > > Pierre-Jean Texier (1):
> > >   ell: upgrade 0.31 -> 0.32
> > >
> > > Richard Purdie (7):
> > >   pseudo: Fix attr errors due to incorrect library resolution issues
> > >   oeqa/selftest/runcmd: Add better debug for thread count mismatch
> > >     failures
> > >   oeqa/utils/command: Improve stdin handling in runCmd
> > >   scripts/install-buildtools: Update to 3.2 M1 buildtools
> > >   scripts/install-buildtools: Handle new format checksum files
> > >   oeqa/selftest: Clean up separate builddir in success case when
> > >     non-threaded
> > >   populate_sdk_ext: Fix to use python3, not python
> > >
> > > Steve Sakoman (1):
> > >   u-boot: move redundant-yyloc-global patch to u-boot-common.inc
> > >
> > >  meta/classes/kernel.bbclass                   |   2 +-
> > >  meta/classes/mime.bbclass                     |  13 +-
> > >  meta/classes/populate_sdk_ext.bbclass         |   2 +-
> > >  meta/classes/qemuboot.bbclass                 |   5 +
> > >  meta/classes/testimage.bbclass                |   6 +-
> > >  meta/lib/oeqa/core/target/qemu.py             |   6 +-
> > >  meta/lib/oeqa/core/utils/concurrencytest.py   |  23 +--
> > >  meta/lib/oeqa/runtime/cases/ptest.py          |   4 +
> > >  meta/lib/oeqa/selftest/cases/runcmd.py        |   9 +-
> > >  meta/lib/oeqa/selftest/context.py             |  36 ++++-
> > >  meta/lib/oeqa/utils/commands.py               |   4 +-
> > >  meta/lib/oeqa/utils/qemurunner.py             |   5 +-
> > >  .../remove-redundant-yyloc-global.patch       |   0
> > >  meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
> > >  .../u-boot/u-boot-tools_2020.01.bb            |   2 -
> > >  meta/recipes-bsp/u-boot/u-boot.inc            |  55 ++++---
> > >  ...allow-event-subscriptions-with-URLs-.patch | 151 +++++++++++++++++
> > >  ...nt-message-generation-using-a-long-U.patch |  62 +++++++
> > >  ...HTTP-initiation-failures-for-events-.patch |  50 ++++++
> > >  .../wpa-supplicant/wpa-supplicant_2.9.bb      |   5 +-
> > >  .../dbus/dbus/CVE-2020-12049.patch            |  78 +++++++++
> > >  meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
> > >  .../ell/{ell_0.31.bb => ell_0.32.bb}          |   3 +-
> > >  .../systemd-serialgetty/serial-getty@.service |   3 +-
> > >  .../perl/files/CVE-2020-10543.patch           |  36 +++++
> > >  .../perl/files/CVE-2020-10878_1.patch         | 152 ++++++++++++++++++
> > >  .../perl/files/CVE-2020-10878_2.patch         |  36 +++++
> > >  meta/recipes-devtools/perl/perl_5.30.1.bb     |   3 +
> > >  .../pseudo/files/xattr_version.patch          |  54 +++++++
> > >  meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
> > >  ...20200519.bb => linux-firmware_20200619.bb} |   4 +-
> > >  .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++
> > >  .../curl/curl/CVE-2020-8177.patch             |  67 ++++++++
> > >  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
> > >  scripts/install-buildtools                    |  10 +-
> > >  scripts/lib/checklayer/__init__.py            |   7 +-
> > >  scripts/runqemu                               |  11 +-
> > >  37 files changed, 979 insertions(+), 70 deletions(-)
> > >  rename meta/recipes-bsp/u-boot/{u-boot-tools => files}/remove-redundant-yyloc-global.patch (100%)
> > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
> > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
> > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
> > >  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
> > >  rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)
> > >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
> > >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
> > >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
> > >  create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
> > >  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)
> > >  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
> > >  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch
> > >
> > > --
> > > 2.17.1
> > >
> > > 
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
