Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2FAC63701
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.8795.1650466445930559416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VbyQxYOD;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id s25so2596196edi.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VN3jD5SSPmUCo9jRPmhNWrjkMzp/itOYfGznnOX6DLo=;
        b=VbyQxYOD2Vd+mIWjRNEmHYZf/DWM860zhKOlh4YbB/cUH1Hx5VCELpoUIUXCnGYFqD
         eP3/oF9qDUcxOSgIChDiIPHcpAjme2C1Mm4qOSeQCZZfQODBUtvACqJPkZ/L6ME714iE
         QNLfQ4oRyTCGO/+v4PvWfB/9+FojGhmqXF7Qqj5VRSKzuhANxiOL5Z6TSpi0Ztt8HJ2f
         PUaEAm4kC1Sc2AU6W/Ely9sYr2YiUkkb5lAvo2Gs9F7IiEGvgYM90wSiB55Hdr8iBcdS
         pN32bauZQd0QDDgflecvMV9iNnZMHivLYDjbka1BUxWdRFGIoI8MgRSeQA1ZPOcdp36w
         6EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VN3jD5SSPmUCo9jRPmhNWrjkMzp/itOYfGznnOX6DLo=;
        b=A/qVJQ6ywJRWnfRILFvLDFeCfCMs+eTrFRpMXckmMudIqNSEiUy4bGLmUEHCV6OXEV
         OokuBLsc24Sb/ST2IkE1koBbDj5C/4LZwjFu6rNsyvmPQV+1q+CokDNsxfKJNvRN9yr7
         X5HRojJMN3KPHpwSNht/UaVtqzfEU9+0U0TyKGyV4800xsEne4NWPg47pwgvFUPqXiGJ
         TNOdVaYQSRMI0vLGShc3skq4X0+/5F57UG6k+L8HOqEAcpEVNe6UVjJq6iKlzf/glIdA
         9bRPsWR/ywpbtQzDN1teMtTjMkqU8fLx4E3imeDy9GaxNINtC3flSEkydSRRMcQXECLh
         4JKg==
X-Gm-Message-State: AOAM530AvY5hTbAy8slMpIiDxV/ShAYuMQOaZoYiw/qxksOp15OffpW4
	6GG296Khke2T6uYmzkXQsouPU2rutbh3DcqaJKh5GA==
X-Google-Smtp-Source: 
 ABdhPJzWGztnHZfMrCI9BEMfCjYaW6dCRVMiOcvyYo/5cHc+6HcYf5GuHg1bUreD++M2EDLd85HKN/e2mHBxqyoglYg=
X-Received: by 2002:a05:6402:438d:b0:424:775:27e8 with SMTP id
 o13-20020a056402438d00b00424077527e8mr793796edc.80.1650466444252; Wed, 20 Apr
 2022 07:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <16E7A00050A35F84.23874@lists.openembedded.org>
In-Reply-To: <16E7A00050A35F84.23874@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 20 Apr 2022 04:53:53 -1000
Message-ID: 
 <CAOSpxdbjagCMneqiUTotst++FJspGQXsd577H9TOfnVTm+xMpQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/27] Patch review
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164699

On Wed, Apr 20, 2022 at 4:08 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Please review this set of patches for kirkstone and have comments back by
> end of day Friday.

I'd particularly like feedback on the security/bug fix version updates
at the end of this series.

In the past I took these only on request.

Would people like me to be more proactive on this type of upgrade
(such as this series), or should I continue to take them only on
request?

Steve

>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3547
>
> The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:
>
>   lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut
>
> Alexander Kanavin (1):
>   webkitgtk: adjust patch status
>
> Davide Gardenal (1):
>   create-spdx: fix error when symlink cannot be created
>
> Ferry Toth (2):
>   apt: add apt selftest to test signed package feeds
>   package_manager: fix missing dependency on gnupg when signing deb
>     package feeds
>
> Jon Mason (1):
>   qemuarm64: use virtio pci interfaces
>
> Kai Kang (1):
>   update_udev_hwdb: fix multilib issue with systemd
>
> Khem Raj (5):
>   babeltrace: Disable warnings as errors
>   xserver-xorg: Fix build with gcc12
>   systemtap: Fix build with gcc-12
>   gnupg: Disable FORTIFY_SOURCES on mips
>   mdadm: Drop clang specific cflags
>
> Konrad Weihmann (2):
>   git: correct license
>   ncurses: use COPYING file
>
> Martin Jansa (1):
>   systemd-boot: remove outdated EFI_LD comment
>
> Paulo Neves (1):
>   selftest/lic_checksum: Add test for filename containing space
>
> Peter Kjellerstedt (2):
>   u-boot: Correct the SRC_URI
>   u-boot: Inherit pkgconfig
>
> Richard Purdie (1):
>   buildtools-tarball: Only add cert envvars if certs are included
>
> Ross Burton (1):
>   zlib: upgrade to 1.2.12
>
> wangmy (5):
>   linux-firmware: upgrade 20220310 -> 20220411
>   libsoup: upgrade 3.0.5 -> 3.0.6
>   apt: upgrade 2.4.3 -> 2.4.4
>   libusb1: upgrade 1.0.25 -> 1.0.26
>   libgit2: upgrade 1.4.2 -> 1.4.3
>
> zhengruoqin (3):
>   wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
>   git: upgrade 2.35.2 -> 2.35.3
>   ruby: upgrade 3.1.1 -> 3.1.2
>
>  meta/classes/create-spdx.bbclass              |  10 +-
>  meta/classes/sign_package_feed.bbclass        |   1 +
>  meta/conf/machine/qemuarm64.conf              |   8 +-
>  meta/lib/oeqa/runtime/cases/apt.py            |  38 +-
>  meta/lib/oeqa/selftest/cases/lic_checksum.py  |  18 +
>  meta/lib/oeqa/selftest/cases/runtime_test.py  |  38 ++
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |   6 +-
>  meta/recipes-core/meta/buildtools-tarball.bb  |   6 +-
>  meta/recipes-core/ncurses/ncurses.inc         |   2 +-
>  .../systemd/systemd-boot_250.4.bb             |   1 -
>  meta/recipes-core/systemd/systemd_250.4.bb    |   5 -
>  meta/recipes-core/udev/eudev_3.2.10.bb        |   4 -
>  ...configure-Pass-LDFLAGS-to-link-tests.patch |  25 +-
>  .../zlib/zlib/CVE-2018-25032.patch            | 347 ------------------
>  meta/recipes-core/zlib/zlib/cc.patch          |  27 ++
>  .../zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb}   |   7 +-
>  .../apt/{apt_2.4.3.bb => apt_2.4.4.bb}        |   2 +-
>  .../git/{git_2.35.2.bb => git_2.35.3.bb}      |  15 +-
>  .../ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb}     |   2 +-
>  meta/recipes-extended/mdadm/mdadm_4.2.bb      |   2 -
>  .../0001-render-Fix-build-with-gcc-12.patch   |  90 +++++
>  .../xorg-xserver/xserver-xorg_21.1.3.bb       |   1 +
>  ...20220310.bb => linux-firmware_20220411.bb} |   4 +-
>  .../recipes-kernel/lttng/babeltrace2_2.0.4.bb |   2 +-
>  ...ility-re-tweak-for-rhel6-use-functio.patch |  49 +++
>  .../recipes-kernel/systemtap/systemtap_git.bb |   3 +-
>  ....02.18.bb => wireless-regdb_2022.04.08.bb} |   2 +-
>  ...spection.cmake-prefix-variables-obta.patch |   5 +-
>  meta/recipes-support/gnupg/gnupg_2.3.4.bb     |   3 +
>  .../{libgit2_1.4.2.bb => libgit2_1.4.3.bb}    |   2 +-
>  .../{libsoup_3.0.5.bb => libsoup_3.0.6.bb}    |   2 +-
>  .../{libusb1_1.0.25.bb => libusb1_1.0.26.bb}  |   2 +-
>  scripts/postinst-intercepts/update_udev_hwdb  |   5 +-
>  33 files changed, 322 insertions(+), 412 deletions(-)
>  delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
>  create mode 100644 meta/recipes-core/zlib/zlib/cc.patch
>  rename meta/recipes-core/zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb} (83%)
>  rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} (97%)
>  rename meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} (86%)
>  rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
>  rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)
>  rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)
>  rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)
>  rename meta/recipes-support/libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb} (94%)
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164668): https://lists.openembedded.org/g/openembedded-core/message/164668
> Mute This Topic: https://lists.openembedded.org/mt/90584508/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

