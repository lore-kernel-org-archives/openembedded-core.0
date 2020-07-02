Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.2525.1593713292432042573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bs4gG6/k;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id dm19so18660049edb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=roJxAaZ+ny2Uw8uHbtxL06pmWSU6B+9/8KiWVroCOQI=;
        b=Bs4gG6/kwp1LvRfJ0JsBT2H4q+102XZIkfsshiAo53In30d6vhKIJbVsehlEQVA783
         Jso3GrbUby3TBKl49TekVSESqpiPu0s9A3z9j+Jq2pN1CwISYSm+Bumxz36Jr1wLRBXe
         sZqDixr2EKjT2FVEg4YvCDJnx2FAyxH2R2PkAZM59vzlpYldK8yq8bCzNKHOR0hRclFK
         PrD90995tMnaVziK53QDvzDdiHpWaMNSIGuW+Ie3eu5lftUJxXkB0ljAxO6n/SP2mjsg
         pQGw1TU7D8dEqQXHnI/xYYIB7dwd5fGrUsHAvAC9EqjwBsS7LTOckmxFcWex595pVRRK
         +xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=roJxAaZ+ny2Uw8uHbtxL06pmWSU6B+9/8KiWVroCOQI=;
        b=ZWy4scxB2uJF1Z+m1EDeZbwvxvyuVVDh8RZafmsPwAd+4J4Wq+xK8F8URLPyW/QIoh
         HV70hxagSlNnjAYUQfuwtVGG18bgM3+EA/R1cau44p1JfwUKccOvzbqPvuTUKOye456Z
         eJM4n0H8N46bOVnjPlMK1ugJzk5oP+qckMX+KqgDXQ8R3X70rEQNBbUyFMRC+ixj+jdG
         KqOqqAIylKV7+I6z2Tr1r3APljA+IKpoLy1nfE7+Cy7q9YU95RXFfS2Nx7ZUW0/53Tum
         ZFoQFwHj7ozS03XAWdjLGEswoWpYa1jr/us33azXaxn/NcqjRZfo0sxJBF3ooXSK49zZ
         2/bQ==
X-Gm-Message-State: AOAM533EBTvSPLAgrH/2AQCuWw4OcDX7mWKO1MIALjVl72LrgRfUyuvx
	yzLZS1zcoM71R3EU9wrB+U3lQ23Qfq+B0e+IxuYFen9INGk=
X-Google-Smtp-Source: ABdhPJzxPAIOjGJKn0Lbzj9ED6/j6bDT2FEJ7mX5cnkqdCBjv8SAOwbyY6+UYfMecSVBx/AGuAYvQoy/q5k9y20EdBg=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr35320695edr.164.1593713290887;
 Thu, 02 Jul 2020 11:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593653993.git.steve@sakoman.com>
In-Reply-To: <cover.1593653993.git.steve@sakoman.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 14:07:59 -0400
Message-ID: <CADkTA4PsN1t8pi=qtGNcZDcSvhCx0RO55cV87YWwUufwCXqLOQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/22] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 9:41 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> The following changes since commit 1a98936830ba468d63e2e49d766add9e9cb75998:
>
>   gstreamer1.0-plugins-bad: add support for vdpau (2020-06-23 04:33:47 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> Alexander Kanavin (1):
>   linux-firmware: upgrade 20200519 -> 20200619
>
> Andrej Valek (1):
>   oeqa/runtime/cases/ptest: Make output content path absolute
>
> Armin Kuster (2):
>   curl: Security fixes for CVE-2020-{8169/8177}
>   wpa-supplicant: Security fix CVE-2020-12695
>
> Changqing Li (1):
>   mime.bbclass: fix post install scriptlet error
>
> Chen Qi (1):
>   systemd-serialgetty: do not use BindsTo
>
> Konrad Weihmann (2):
>   runqemu: add QB_ROOTFS_EXTRA_OPT parameter
>   testimage: enable ovmf support
>
> Lee Chee Yang (2):
>   dbus: fix CVE-2020-12049
>   perl: fix CVE-2020-10543 & CVE-2020-10878
>
> Lili Li (1):
>   kernel.bbclass: Fix Module.symvers support

I wouldn't recommend this going back to dunfell. It is papering over
an issue, and is for a new kernel than we ever used in dunfell.

Bruce

>
> Ming Liu (1):
>   u-boot: introduce UBOOT_INITIAL_ENV
>
> Nicolas Dechesne (1):
>   checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
>
> Pierre-Jean Texier (1):
>   ell: upgrade 0.31 -> 0.32
>
> Richard Purdie (7):
>   pseudo: Fix attr errors due to incorrect library resolution issues
>   oeqa/selftest/runcmd: Add better debug for thread count mismatch
>     failures
>   oeqa/utils/command: Improve stdin handling in runCmd
>   scripts/install-buildtools: Update to 3.2 M1 buildtools
>   scripts/install-buildtools: Handle new format checksum files
>   oeqa/selftest: Clean up separate builddir in success case when
>     non-threaded
>   populate_sdk_ext: Fix to use python3, not python
>
> Steve Sakoman (1):
>   u-boot: move redundant-yyloc-global patch to u-boot-common.inc
>
>  meta/classes/kernel.bbclass                   |   2 +-
>  meta/classes/mime.bbclass                     |  13 +-
>  meta/classes/populate_sdk_ext.bbclass         |   2 +-
>  meta/classes/qemuboot.bbclass                 |   5 +
>  meta/classes/testimage.bbclass                |   6 +-
>  meta/lib/oeqa/core/target/qemu.py             |   6 +-
>  meta/lib/oeqa/core/utils/concurrencytest.py   |  23 +--
>  meta/lib/oeqa/runtime/cases/ptest.py          |   4 +
>  meta/lib/oeqa/selftest/cases/runcmd.py        |   9 +-
>  meta/lib/oeqa/selftest/context.py             |  36 ++++-
>  meta/lib/oeqa/utils/commands.py               |   4 +-
>  meta/lib/oeqa/utils/qemurunner.py             |   5 +-
>  .../remove-redundant-yyloc-global.patch       |   0
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
>  .../u-boot/u-boot-tools_2020.01.bb            |   2 -
>  meta/recipes-bsp/u-boot/u-boot.inc            |  55 ++++---
>  ...allow-event-subscriptions-with-URLs-.patch | 151 +++++++++++++++++
>  ...nt-message-generation-using-a-long-U.patch |  62 +++++++
>  ...HTTP-initiation-failures-for-events-.patch |  50 ++++++
>  .../wpa-supplicant/wpa-supplicant_2.9.bb      |   5 +-
>  .../dbus/dbus/CVE-2020-12049.patch            |  78 +++++++++
>  meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
>  .../ell/{ell_0.31.bb => ell_0.32.bb}          |   3 +-
>  .../systemd-serialgetty/serial-getty@.service |   3 +-
>  .../perl/files/CVE-2020-10543.patch           |  36 +++++
>  .../perl/files/CVE-2020-10878_1.patch         | 152 ++++++++++++++++++
>  .../perl/files/CVE-2020-10878_2.patch         |  36 +++++
>  meta/recipes-devtools/perl/perl_5.30.1.bb     |   3 +
>  .../pseudo/files/xattr_version.patch          |  54 +++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   1 +
>  ...20200519.bb => linux-firmware_20200619.bb} |   4 +-
>  .../curl/curl/CVE-2020-8169.patch             | 140 ++++++++++++++++
>  .../curl/curl/CVE-2020-8177.patch             |  67 ++++++++
>  meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
>  scripts/install-buildtools                    |  10 +-
>  scripts/lib/checklayer/__init__.py            |   7 +-
>  scripts/runqemu                               |  11 +-
>  37 files changed, 979 insertions(+), 70 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-tools => files}/remove-redundant-yyloc-global.patch (100%)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch
>  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
>  rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10543.patch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_1.patch
>  create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-10878_2.patch
>  create mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20200519.bb => linux-firmware_20200619.bb} (99%)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8169.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2020-8177.patch
>
> --
> 2.17.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
