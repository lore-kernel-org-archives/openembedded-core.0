Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8C1C63708
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.8865.1650467153908498186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9Nj5QuG;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id e128so1396731qkd.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mGBuLPy2Isv/icZNgalNFP7HzWxzKFjmVqEUWqD5ezI=;
        b=G9Nj5QuGg/KhdXlS2xeleTNgvvES1A8p0qtsu+7LE2MJdjfurYNsk15p4W0JkEmpeI
         xBm/t4u9eMQpBWtNhPlbS1848mn+W4iq4yuJ3T5sFF6Hs5Sb6KGInboVBNofa7czlmwW
         Fs7QZqe0tisqptbPgQtaj3JDKYgKoJFUWHCsPNq3G2ltBJiHjp324bMCYEMOuKWnkfKM
         3zOYAHOCy4VaEEoFKjMsDY72k7Bx42Z7iglS9fnVGbDdADKUfmYBsq6RrpymyXWQG4HI
         YO6/E7pCL+B3u+5tlyFW7reDjxdoMmcwU1lLFHQyWgTPlfJuPrzmmZwlqffv4KXfvNIz
         3EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mGBuLPy2Isv/icZNgalNFP7HzWxzKFjmVqEUWqD5ezI=;
        b=H+StwAyfhldOcp3Hp7lhCkJEYnH0uT2aeXNY84ITEf08XgMSXGhJIfcN+Ndg68t375
         3seK6+hTvHVKv3pU0p7tUnzu7O4/Gto3TSgab1vl0NvavfoEexvJihnfjMxJDM4GkUJ1
         0UurKigkHkC5PGAYysOzn9cB3rwbF1hfPYkxovmJ6ONE8GVI2C1P8hGOOaR9UHKI6nBI
         YwyuwWUC+7J2bsuRg89bMsmfjdnICxzFGx+0e6mH4ipIzHiAVSmu/6Ikl/V4sYYuwFNB
         T3HWPXG8PYnTrUsAo7UVhfLKtO78bCgoXXhdOQdhKWk7VuhNJ9pCThJ2Q41Kod/Bvo9A
         JA5w==
X-Gm-Message-State: AOAM5325MEI1VS1a1TcapwhNfsNyJyLfLmVfOAHyoyrJqTKTce2pW8B5
	SAR/a7YsgaaG+44RqGq6sIpMCKWX6j56TIE7yR7mIQ634aE=
X-Google-Smtp-Source: 
 ABdhPJw+OyfYiGFaSOOuWX5vWAOJD218qsuWOakjv4uVO3u1kKFxAcm4/+K8Lv4K3XY8ZpM/iet0UYjp0ekz+cUozB8=
X-Received: by 2002:a05:620a:444e:b0:69e:d240:9cd2 with SMTP id
 w14-20020a05620a444e00b0069ed2409cd2mr3128584qkp.72.1650467152708; Wed, 20
 Apr 2022 08:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <16E7A00050A35F84.23874@lists.openembedded.org>
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Apr 2022 08:05:26 -0700
Message-ID: 
 <CAMKF1srWFLHrd=THR=8AgiJY3rnYp0TZ2EJYxAdpmGHj_H6e2A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/27] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164700

On Wed, Apr 20, 2022 at 7:54 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Wed, Apr 20, 2022 at 4:08 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > Please review this set of patches for kirkstone and have comments back by
> > end of day Friday.
>
> I'd particularly like feedback on the security/bug fix version updates
> at the end of this series.
>
> In the past I took these only on request.
>
> Would people like me to be more proactive on this type of upgrade
> (such as this series), or should I continue to take them only on
> request?

I think being proactive would be fine

>
> Steve
>
> >
> > Passed a-full on autobuilder:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3547
> >
> > The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:
> >
> >   lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
> >
> > Alexander Kanavin (1):
> >   webkitgtk: adjust patch status
> >
> > Davide Gardenal (1):
> >   create-spdx: fix error when symlink cannot be created
> >
> > Ferry Toth (2):
> >   apt: add apt selftest to test signed package feeds
> >   package_manager: fix missing dependency on gnupg when signing deb
> >     package feeds
> >
> > Jon Mason (1):
> >   qemuarm64: use virtio pci interfaces
> >
> > Kai Kang (1):
> >   update_udev_hwdb: fix multilib issue with systemd
> >
> > Khem Raj (5):
> >   babeltrace: Disable warnings as errors
> >   xserver-xorg: Fix build with gcc12
> >   systemtap: Fix build with gcc-12
> >   gnupg: Disable FORTIFY_SOURCES on mips
> >   mdadm: Drop clang specific cflags
> >
> > Konrad Weihmann (2):
> >   git: correct license
> >   ncurses: use COPYING file
> >
> > Martin Jansa (1):
> >   systemd-boot: remove outdated EFI_LD comment
> >
> > Paulo Neves (1):
> >   selftest/lic_checksum: Add test for filename containing space
> >
> > Peter Kjellerstedt (2):
> >   u-boot: Correct the SRC_URI
> >   u-boot: Inherit pkgconfig
> >
> > Richard Purdie (1):
> >   buildtools-tarball: Only add cert envvars if certs are included
> >
> > Ross Burton (1):
> >   zlib: upgrade to 1.2.12
> >
> > wangmy (5):
> >   linux-firmware: upgrade 20220310 -> 20220411
> >   libsoup: upgrade 3.0.5 -> 3.0.6
> >   apt: upgrade 2.4.3 -> 2.4.4
> >   libusb1: upgrade 1.0.25 -> 1.0.26
> >   libgit2: upgrade 1.4.2 -> 1.4.3
> >
> > zhengruoqin (3):
> >   wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
> >   git: upgrade 2.35.2 -> 2.35.3
> >   ruby: upgrade 3.1.1 -> 3.1.2
> >
> >  meta/classes/create-spdx.bbclass              |  10 +-
> >  meta/classes/sign_package_feed.bbclass        |   1 +
> >  meta/conf/machine/qemuarm64.conf              |   8 +-
> >  meta/lib/oeqa/runtime/cases/apt.py            |  38 +-
> >  meta/lib/oeqa/selftest/cases/lic_checksum.py  |  18 +
> >  meta/lib/oeqa/selftest/cases/runtime_test.py  |  38 ++
> >  meta/recipes-bsp/u-boot/u-boot-common.inc     |   6 +-
> >  meta/recipes-core/meta/buildtools-tarball.bb  |   6 +-
> >  meta/recipes-core/ncurses/ncurses.inc         |   2 +-
> >  .../systemd/systemd-boot_250.4.bb             |   1 -
> >  meta/recipes-core/systemd/systemd_250.4.bb    |   5 -
> >  meta/recipes-core/udev/eudev_3.2.10.bb        |   4 -
> >  ...configure-Pass-LDFLAGS-to-link-tests.patch |  25 +-
> >  .../zlib/zlib/CVE-2018-25032.patch            | 347 ------------------
> >  meta/recipes-core/zlib/zlib/cc.patch          |  27 ++
> >  .../zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb}   |   7 +-
> >  .../apt/{apt_2.4.3.bb => apt_2.4.4.bb}        |   2 +-
> >  .../git/{git_2.35.2.bb => git_2.35.3.bb}      |  15 +-
> >  .../ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb}     |   2 +-
> >  meta/recipes-extended/mdadm/mdadm_4.2.bb      |   2 -
> >  .../0001-render-Fix-build-with-gcc-12.patch   |  90 +++++
> >  .../xorg-xserver/xserver-xorg_21.1.3.bb       |   1 +
> >  ...20220310.bb => linux-firmware_20220411.bb} |   4 +-
> >  .../recipes-kernel/lttng/babeltrace2_2.0.4.bb |   2 +-
> >  ...ility-re-tweak-for-rhel6-use-functio.patch |  49 +++
> >  .../recipes-kernel/systemtap/systemtap_git.bb |   3 +-
> >  ....02.18.bb => wireless-regdb_2022.04.08.bb} |   2 +-
> >  ...spection.cmake-prefix-variables-obta.patch |   5 +-
> >  meta/recipes-support/gnupg/gnupg_2.3.4.bb     |   3 +
> >  .../{libgit2_1.4.2.bb => libgit2_1.4.3.bb}    |   2 +-
> >  .../{libsoup_3.0.5.bb => libsoup_3.0.6.bb}    |   2 +-
> >  .../{libusb1_1.0.25.bb => libusb1_1.0.26.bb}  |   2 +-
> >  scripts/postinst-intercepts/update_udev_hwdb  |   5 +-
> >  33 files changed, 322 insertions(+), 412 deletions(-)
> >  delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
> >  create mode 100644 meta/recipes-core/zlib/zlib/cc.patch
> >  rename meta/recipes-core/zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb} (83%)
> >  rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} (97%)
> >  rename meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} (86%)
> >  rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)
> >  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
> >  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
> >  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
> >  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)
> >  rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)
> >  rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)
> >  rename meta/recipes-support/libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb} (94%)
> >
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164699): https://lists.openembedded.org/g/openembedded-core/message/164699
> Mute This Topic: https://lists.openembedded.org/mt/90584508/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

