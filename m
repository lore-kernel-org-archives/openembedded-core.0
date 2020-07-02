Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.2707.1593713773139215826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DEeVrGo/;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id l12so30817611ejn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fo7iVoVS1ONG+cAbVe+OVFZxZJ/CibcrshLTCZEEyGc=;
        b=DEeVrGo/LiwJrtllPuQSJTsF+HpBIUzJimrvx+tEBT71+SWE4slmrDycfRj2XxER9K
         kwwfCFsp/EK549Ps3JuSKz26dydUaplvpcbVHKD2VImnPQUM5rk60Buy4+cDrGM5yV17
         S9DkpU/Kv0Az8hdmexspCG0hdVz2bEs16PZwVUj75sODvbpxOzN6s/erVsB5wmexrqt6
         sR6lNPDPs0jRbo7rf7jWap5H+td/tnJXr8nuBsuIFC5cGsUfU1U4cp4Dw5WRPufKWlqn
         26IHdhERN9YNaWOvetywUxcjnNGBzxXSe3CPmzDmWlIPieBHAvYmJvcRXuR+Iz7j4K/R
         hvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fo7iVoVS1ONG+cAbVe+OVFZxZJ/CibcrshLTCZEEyGc=;
        b=Us8H3HDQ/jQMjk8O5VYOvl2Tu/+iCUGXiLEeEgYda5X9IxtelU0nB78g1uJutQDE1w
         kA/BpbaerYx5cgR+E2CCDmWD3UUExHkyhnP7OyOAEVrabO2ZxxFqH/nmMldS8yW++mEQ
         WFMs1Gxwy8rRq0DNJJEkDe1jZ9AIEQ19RTOFRi1JVIGFAIKQiTwOhgT/wOwBsygqapkU
         k1G+aEQU5zzj4HkjrWarLs7KjN4Tk4zEzYSSn1IlPVx2A59cWGgelV3jSyUQz6wujTne
         8xbZush7v1+sJE5Kr9YokARKNYFo4w9TXJUUILgHudRrqoaXyG5/7ldXifvSDvgp17lo
         ntnQ==
X-Gm-Message-State: AOAM530Qt9rB67Rdb+vAzKl9sFijWvVZel5pg87+kvNdjfC3UHzAqy2m
	qKuMfBuBL8waXqWUAagZIOg2jDdYQu6j7utriLn+Pg==
X-Google-Smtp-Source: ABdhPJyR3xIiMgOPwwXOr+3KkU9e4ixZD5EvTbDiHmmX1vHPnB+Ictm/6m05mxcnMKC+33BPpAQGaHW9Bl//X/Q9u74=
X-Received: by 2002:a17:906:af6d:: with SMTP id os13mr27975510ejb.57.1593713771590;
 Thu, 02 Jul 2020 11:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593653993.git.steve@sakoman.com> <CADkTA4PsN1t8pi=qtGNcZDcSvhCx0RO55cV87YWwUufwCXqLOQ@mail.gmail.com>
In-Reply-To: <CADkTA4PsN1t8pi=qtGNcZDcSvhCx0RO55cV87YWwUufwCXqLOQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 2 Jul 2020 08:16:00 -1000
Message-ID: <CAOSpxdaHZpvfLwVy=-g9E3+VLFbEQcQ9ZbJC7kKTpPwFnNr1Bw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/22] Pull request (cover letter only)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 8:08 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Jul 1, 2020 at 9:41 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > The following changes since commit 1a98936830ba468d63e2e49d766add9e9cb75998:
> >
> >   gstreamer1.0-plugins-bad: add support for vdpau (2020-06-23 04:33:47 -1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> >
> > Alexander Kanavin (1):
> >   linux-firmware: upgrade 20200519 -> 20200619
> >
> > Andrej Valek (1):
> >   oeqa/runtime/cases/ptest: Make output content path absolute
> >
> > Armin Kuster (2):
> >   curl: Security fixes for CVE-2020-{8169/8177}
> >   wpa-supplicant: Security fix CVE-2020-12695
> >
> > Changqing Li (1):
> >   mime.bbclass: fix post install scriptlet error
> >
> > Chen Qi (1):
> >   systemd-serialgetty: do not use BindsTo
> >
> > Konrad Weihmann (2):
> >   runqemu: add QB_ROOTFS_EXTRA_OPT parameter
> >   testimage: enable ovmf support
> >
> > Lee Chee Yang (2):
> >   dbus: fix CVE-2020-12049
> >   perl: fix CVE-2020-10543 & CVE-2020-10878
> >
> > Lili Li (1):
> >   kernel.bbclass: Fix Module.symvers support
>
> I wouldn't recommend this going back to dunfell. It is papering over
> an issue, and is for a new kernel than we ever used in dunfell.

Your comment is a few hours too late!  Richard did the pull earlier today.

Do you recommend that I revert this patch?

Steve

> > Ming Liu (1):
> >   u-boot: introduce UBOOT_INITIAL_ENV
> >
> > Nicolas Dechesne (1):
> >   checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
> >
> > Pierre-Jean Texier (1):
> >   ell: upgrade 0.31 -> 0.32
> >
> > Richard Purdie (7):
> >   pseudo: Fix attr errors due to incorrect library resolution issues
> >   oeqa/selftest/runcmd: Add better debug for thread count mismatch
> >     failures
> >   oeqa/utils/command: Improve stdin handling in runCmd
> >   scripts/install-buildtools: Update to 3.2 M1 buildtools
> >   scripts/install-buildtools: Handle new format checksum files
> >   oeqa/selftest: Clean up separate builddir in success case when
> >     non-threaded
> >   populate_sdk_ext: Fix to use python3, not python
> >
> > Steve Sakoman (1):
> >   u-boot: move redundant-yyloc-global patch to u-boot-common.inc
> >
> >  meta/classes/kernel.bbclass                   |   2 +-
> >  meta/classes/mime.bbclass                     |  13 +-
> >  meta/classes/populate_sdk_ext.bbclass         |   2 +-
> >  meta/classes/qemuboot.bbclass                 |   5 +
> >  meta/classes/testimage.bbclass                |   6 +-
> >  meta/lib/oeqa/core/target/qemu.py             |   6 +-
> >  meta/lib/oeqa/core/utils/concurrencytest.py   |  23 +--
> >  meta/lib/oeqa/runtime/cases/ptest.py          |   4 +
> >  meta/lib/oeqa/selftest/cases/runcmd.py        |   9 +-
> >  meta/lib/oeqa/selftest/context.py             |  36 ++++-
> >  meta/lib/oeqa/utils/commands.py               |   4 +-
> >  meta/lib/oeqa/utils/qemurunner.py             |   5 +-
> >  .../remove-redundant-yyloc-global.patch       |   0
> >  meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
> >  .../u-boot/u-boot-tools_2020.01.bb            |   2 -
> >  meta/recipes-bsp/u-boot/u-boot.inc            |  55 ++++---
> >  ...allow-event-subscriptions-with-URLs-.patch | 151 +++++++++++++++++
> >  ...nt-message-generation-using-a-long-U.patch |  62 +++++++
> >  ...HTTP-initiation-failures-for-events-.patch |  50 ++++++
> >  .../wpa-supplicant/wpa-supplicant_2.9.bb      |   5 +-
> >  .../dbus/dbus/CVE-2020-12049.patch            |  78 +++++++++
> >  meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
> >  .../ell/{ell_0.31.bb => ell_0.32.bb}          |   3 +-
> >  .../systemd-serialgetty/serial-getty@.service |   3 +-
> >  .../perl/files/CVE-2020-10543.patch           |  36 +++++
> >  .../perl/files/CVE-2020-10878_1.patch         | 152 ++++++++++++++++++
> >  .../perl/files/CVE-2020-10878_2.patch         |  36 +++++
> >  meta/recipes-devtools/perl/perl_5.30.1.bb     |   3 +
> >  .../pseudo/files/xattr_version.patch          |  54 +++++++
> >  meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
> >  ...20200519.bb => linux-firmware_20200619.bb} |   4 +-
> >  .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++
> >  .../curl/curl/CVE-2020-8177.patch             |  67 ++++++++
> >  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
> >  scripts/install-buildtools                    |  10 +-
> >  scripts/lib/checklayer/__init__.py            |   7 +-
> >  scripts/runqemu                               |  11 +-
> >  37 files changed, 979 insertions(+), 70 deletions(-)
> >  rename meta/recipes-bsp/u-boot/{u-boot-tools => files}/remove-redundant-yyloc-global.patch (100%)
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
> >  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
> >  rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)
> >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
> >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
> >  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
> >  create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
> >  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch
> >
> > --
> > 2.17.1
> >
> > 
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
