Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.2914.1593714303400912876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rekVSKkS;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id g20so24765074edm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pqox3MSgHbdrwIeLR37mFnogxUyXEqDpdGU+1Ipj0rY=;
        b=rekVSKkSLvp7EeLwT+TTXumN/BFMRRV0ncs7bIJtIKwJq1fi7WbkK8NkjVd1kKfNNQ
         wreQMcueT9qZmLJLoT/KNx4XIuxLKwZLbEYnsi24PfNXHgKh8pYqAzHbhXUD6v99FZ6u
         /bypfSoRHI4GSZmuefOzIORPiQwOaHe3oD+4GjDEpPnuctmmyLralY4Y6sJPoFbpO+cE
         E9a/r917o1DnO1YqVH/D9LOSjY2VF8JsA5jqyTjs4s+pmbJz5xCyEaW9ssNWRoS3Z7jo
         5QWZ+s3jKajeNMvocPX5BwSAMdzS10IbpEJmUnLzU0sdDCrYdyoyrIdNa+FwgndOgRgn
         iXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pqox3MSgHbdrwIeLR37mFnogxUyXEqDpdGU+1Ipj0rY=;
        b=k/itw5/3ZsdpjcC0Kibr0KofV64HqaEVIAoQW8tbMhmP68FN3wHl5bJw9/Y4c2uh0z
         LTcvCZsudzP6+1GMD/SSb15w+emcuH4tpnT8Tr+XtJRk2Vbbq4TcTqrkZZCQkOdFJIIy
         E7Y0FdBaVE4UJGhLqP8U5q4FFNF5KjRbFVUIrVIVFkSCzWzYsZuqyFF0QoT/sxrx3+Ik
         kZ5YaCPuHkyvzDh1cVEXoLSLMpPAT/MeFxEWVSae9v++ObAcOaGCLWUWmNUH3cbwBryv
         ZimGQ/fbLCC4kHEwALEt2qzhomkAtKugv8mUeoU/lW0BFdCR+REMdrqdjk5n05fWPKOc
         ka+g==
X-Gm-Message-State: AOAM533m30cYugTxKEsK9wXysr1JqC7ScnNq+LFVLIQpAveutjMo+0BA
	DqHJA2qW4wD6J7IkeATdcSZxVa5H534bg+IT0JM=
X-Google-Smtp-Source: ABdhPJx0TCZPq9tjtjjGjXqo10BkeE1s8yr5kpJ82OX5tngGJrzU7cotGxy47bU000R53pm5ZavAw5o5PkGwCglKiEQ=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr35400487edr.164.1593714301912;
 Thu, 02 Jul 2020 11:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593653993.git.steve@sakoman.com> <CADkTA4PsN1t8pi=qtGNcZDcSvhCx0RO55cV87YWwUufwCXqLOQ@mail.gmail.com>
 <CAOSpxdaHZpvfLwVy=-g9E3+VLFbEQcQ9ZbJC7kKTpPwFnNr1Bw@mail.gmail.com> <161E0270090CD0C2.18513@lists.openembedded.org>
In-Reply-To: <161E0270090CD0C2.18513@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 14:24:50 -0400
Message-ID: <CADkTA4NZ8op_+rYOXWttz39mhXFe3x0u2dP70kWs2bNAywSDhw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/22] Pull request (cover letter only)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 2:20 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Thu, Jul 2, 2020 at 2:16 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Thu, Jul 2, 2020 at 8:08 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Wed, Jul 1, 2020 at 9:41 PM Steve Sakoman <steve@sakoman.com> wrote:
> > > >
> > > > The following changes since commit 1a98936830ba468d63e2e49d766add9e9cb75998:
> > > >
> > > >   gstreamer1.0-plugins-bad: add support for vdpau (2020-06-23 04:33:47 -1000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> > > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> > > >
> > > > Alexander Kanavin (1):
> > > >   linux-firmware: upgrade 20200519 -> 20200619
> > > >
> > > > Andrej Valek (1):
> > > >   oeqa/runtime/cases/ptest: Make output content path absolute
> > > >
> > > > Armin Kuster (2):
> > > >   curl: Security fixes for CVE-2020-{8169/8177}
> > > >   wpa-supplicant: Security fix CVE-2020-12695
> > > >
> > > > Changqing Li (1):
> > > >   mime.bbclass: fix post install scriptlet error
> > > >
> > > > Chen Qi (1):
> > > >   systemd-serialgetty: do not use BindsTo
> > > >
> > > > Konrad Weihmann (2):
> > > >   runqemu: add QB_ROOTFS_EXTRA_OPT parameter
> > > >   testimage: enable ovmf support
> > > >
> > > > Lee Chee Yang (2):
> > > >   dbus: fix CVE-2020-12049
> > > >   perl: fix CVE-2020-10543 & CVE-2020-10878
> > > >
> > > > Lili Li (1):
> > > >   kernel.bbclass: Fix Module.symvers support
> > >
> > > I wouldn't recommend this going back to dunfell. It is papering over
> > > an issue, and is for a new kernel than we ever used in dunfell.
> >
> > Your comment is a few hours too late!  Richard did the pull earlier today.
> >
> > Do you recommend that I revert this patch?
>
> It can stay for now. I'm looking at the best approach, we should
> either do a 2nd copy task or move the copy until after the modules
> build ..  in the former solution the test is ok, since we'll pickup
> the file later. In the latter, it needs to be reverted.
>
> I just have to confirm that nothing in the module build step actually
> needs the parts of the shared workdir.

I've confirmed that the module build will do a 2nd copy of the
Module.symvers, so we are ok in the end.

Chalk this one up to "keep an eye out for changes for newer kernels
than existed in the dunfell timeframe", and I'll try and watch for
these more closely in the future.

Bruce

>
> Bruce
>
> >
> > Steve
> >
> > > > Ming Liu (1):
> > > >   u-boot: introduce UBOOT_INITIAL_ENV
> > > >
> > > > Nicolas Dechesne (1):
> > > >   checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
> > > >
> > > > Pierre-Jean Texier (1):
> > > >   ell: upgrade 0.31 -> 0.32
> > > >
> > > > Richard Purdie (7):
> > > >   pseudo: Fix attr errors due to incorrect library resolution issues
> > > >   oeqa/selftest/runcmd: Add better debug for thread count mismatch
> > > >     failures
> > > >   oeqa/utils/command: Improve stdin handling in runCmd
> > > >   scripts/install-buildtools: Update to 3.2 M1 buildtools
> > > >   scripts/install-buildtools: Handle new format checksum files
> > > >   oeqa/selftest: Clean up separate builddir in success case when
> > > >     non-threaded
> > > >   populate_sdk_ext: Fix to use python3, not python
> > > >
> > > > Steve Sakoman (1):
> > > >   u-boot: move redundant-yyloc-global patch to u-boot-common.inc
> > > >
> > > >  meta/classes/kernel.bbclass                   |   2 +-
> > > >  meta/classes/mime.bbclass                     |  13 +-
> > > >  meta/classes/populate_sdk_ext.bbclass         |   2 +-
> > > >  meta/classes/qemuboot.bbclass                 |   5 +
> > > >  meta/classes/testimage.bbclass                |   6 +-
> > > >  meta/lib/oeqa/core/target/qemu.py             |   6 +-
> > > >  meta/lib/oeqa/core/utils/concurrencytest.py   |  23 +--
> > > >  meta/lib/oeqa/runtime/cases/ptest.py          |   4 +
> > > >  meta/lib/oeqa/selftest/cases/runcmd.py        |   9 +-
> > > >  meta/lib/oeqa/selftest/context.py             |  36 ++++-
> > > >  meta/lib/oeqa/utils/commands.py               |   4 +-
> > > >  meta/lib/oeqa/utils/qemurunner.py             |   5 +-
> > > >  .../remove-redundant-yyloc-global.patch       |   0
> > > >  meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
> > > >  .../u-boot/u-boot-tools_2020.01.bb            |   2 -
> > > >  meta/recipes-bsp/u-boot/u-boot.inc            |  55 ++++---
> > > >  ...allow-event-subscriptions-with-URLs-.patch | 151 +++++++++++++++++
> > > >  ...nt-message-generation-using-a-long-U.patch |  62 +++++++
> > > >  ...HTTP-initiation-failures-for-events-.patch |  50 ++++++
> > > >  .../wpa-supplicant/wpa-supplicant_2.9.bb      |   5 +-
> > > >  .../dbus/dbus/CVE-2020-12049.patch            |  78 +++++++++
> > > >  meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
> > > >  .../ell/{ell_0.31.bb => ell_0.32.bb}          |   3 +-
> > > >  .../systemd-serialgetty/serial-getty@.service |   3 +-
> > > >  .../perl/files/CVE-2020-10543.patch           |  36 +++++
> > > >  .../perl/files/CVE-2020-10878_1.patch         | 152 ++++++++++++++++++
> > > >  .../perl/files/CVE-2020-10878_2.patch         |  36 +++++
> > > >  meta/recipes-devtools/perl/perl_5.30.1.bb     |   3 +
> > > >  .../pseudo/files/xattr_version.patch          |  54 +++++++
> > > >  meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
> > > >  ...20200519.bb => linux-firmware_20200619.bb} |   4 +-
> > > >  .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++
> > > >  .../curl/curl/CVE-2020-8177.patch             |  67 ++++++++
> > > >  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
> > > >  scripts/install-buildtools                    |  10 +-
> > > >  scripts/lib/checklayer/__init__.py            |   7 +-
> > > >  scripts/runqemu                               |  11 +-
> > > >  37 files changed, 979 insertions(+), 70 deletions(-)
> > > >  rename meta/recipes-bsp/u-boot/{u-boot-tools => files}/remove-redundant-yyloc-global.patch (100%)
> > > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
> > > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
> > > >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
> > > >  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
> > > >  rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)
> > > >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
> > > >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
> > > >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
> > > >  create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
> > > >  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)
> > > >  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
> > > >  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
