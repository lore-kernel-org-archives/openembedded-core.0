Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF45C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:34:44 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.78397.1674750873885078271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DPuz8XjB;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id vw16so6475802ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOiDui94lwiyJGmq8KuDisuK4V5Ifjm1uadESTvHeFI=;
        b=DPuz8XjBurAkkyNhYjLpHWyHAJD7oe4VRVwT6vT5mi+AGHnzJONEIkJPu0jGGxSUQQ
         LrIdAkdZY1MjEl5WvfxfGfdt3E0xk/o+HTbrpvwDxsmEP5L9kCwQyMkGuHASm20O/tDD
         Qp2auo6+K1X062TQC311xGSuWP/VcO3GpAdQtfSDJyRi0OcvkKNsjnVAyty90apMWhjO
         9t96F+59HVe7Ig7psDXKaWENWqIGR2GiuWMNDMHgjrDTkFg9nmFkVupEnBoTT49Y4LRg
         HPiOGQd1Zp8QdWi3xaQH30S66OPyKBsoVn+nyPgB7igNGaajr4492+A0qmJXxTmB3VQp
         YZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOiDui94lwiyJGmq8KuDisuK4V5Ifjm1uadESTvHeFI=;
        b=IPzvAlxWRCmhkL2PO8ioIVCxPRvFOrODsN1Xj3T4reQCmXs53dQhYcN7xCetfd51za
         mjZn/sKF01xH2S4D1HjlUtongmHCGq8crEKtrVWSEguiYDYSUJAnFJgfJ8hxT7mWMhzF
         UojekNEtmyhFpQXJGUxzBetL1zcjRy6XuS2J+KU4DF9JMcFWa39JC+3MWkVdFI6bGE3Z
         1a0ZcZT0JdeaqiMXsszfZ1RZQUQzZWK6opUg7IfKYdaAbY34ZnRbuUOYowkxz40IPCYx
         dD6aV5eS8ZDd7eMbGoUyuUm1iuDf1lSmtPWJpwk8EO0/IFydYX9nsBhYXMF/r+XhbGIs
         NVfw==
X-Gm-Message-State: AO0yUKVhp25Uzm/o/cLEePB9eWW1GOqbqpBFuDcxpoN+qx+g/8gcJe/K
	X9LnLUIjh8u20fqBe4h+9GjjhZzwIOZvVSi+AZ1WfGVI7AadapnX
X-Google-Smtp-Source: AK7set9wqlQgrca5qvbdkv0Jguw2QYLAIGRa2kiqzGV7GGlDec3kpxbBrzbPZExUMkbGXViQmenIGjC0n9Vyw/wKN2k=
X-Received: by 2002:a17:907:398:b0:877:ef86:5aab with SMTP id
 ss24-20020a170907039800b00877ef865aabmr1820815ejb.286.1674750871726; Thu, 26
 Jan 2023 08:34:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674613569.git.steve@sakoman.com>
In-Reply-To: <cover.1674613569.git.steve@sakoman.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 26 Jan 2023 06:34:20 -1000
Message-ID: <CAOSpxdaRUOPwda0WV3_b76_T1Vb_fBX_=h2b=muNZGxSjebKQQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/42] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 16:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176406

This is the final pull request for the kirkstone 4.0.7 release build next w=
eek.

Steve

On Tue, Jan 24, 2023 at 4:30 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> The following changes since commit 4760fac939a6204e3cb7dcd3699cd9a2508f9d=
ee:
>
>   devtool: process local files only for the main branch (2023-01-12 04:56=
:26 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/kirkstone=
-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
kirkstone-next
>
> Alex Kiernan (1):
>   classes: image: Set empty weak default IMAGE_LINGUAS
>
> Alexander Kanavin (5):
>   libksba: update 1.6.2 -> 1.6.3
>   linux-firmware: upgrade 20221109 -> 20221214
>   xwayland: upgrade 22.1.5 -> 22.1.7
>   xserver-xorg: upgrade 21.1.4 -> 21.1.6
>   selftest/virgl: use pkg-config from the host
>
> Antonin Godard (2):
>   busybox: always start do_compile with orig config files
>   busybox: rm temporary files if do_compile was interrupted
>
> Beno=C3=AEt Mauduit (1):
>   lib/oe/reproducible: Use git log without gpg signature
>
> Bhabu Bindu (1):
>   qemu: Fix CVE-2022-4144
>
> Bruce Ashfield (5):
>   linux-yocto/5.15: ltp and squashfs fixes
>   linux-yocto/5.15: fix perf build with clang
>   linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
>   linux-yocto/5.15: update to v5.15.84
>   linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user
>     copy
>
> Chen Qi (2):
>   dhcpcd: backport two patches to fix runtime error
>   libseccomp: fix typo in DESCRIPTION
>
> Daniel Gomez (1):
>   gtk-icon-cache: Fix GTKIC_CMD if-else condition
>
> He Zhe (1):
>   lttng-modules: update 2.13.7 -> 2.13.8
>
> Hitendra Prajapati (1):
>   go: fix CVE-2022-41717 Excessive memory use in got server
>
> Jan Kircher (1):
>   toolchain-scripts: compatibility with unbound variable protection
>
> Jermain Horsman (1):
>   cve-check: write the cve manifest to IMGDEPLOYDIR
>
> KARN JYE LAU (1):
>   freetype:update mirror site.
>
> Khem Raj (1):
>   tiff: Add packageconfig knob for webp
>
> Marta Rybczynska (1):
>   cve-update-db-native: avoid incomplete updates
>
> Martin Jansa (1):
>   ffmpeg: refresh patches to apply cleanly
>
> Narpat Mali (4):
>   python3-setuptools: fix for CVE-2022-40897
>   python3-wheel: fix for CVE-2022-40898
>   python3-git: fix for CVE-2022-24439
>   ffmpeg: fix for CVE-2022-3341
>
> Pavel Zhukov (1):
>   gcc: Refactor linker patches and fix linker on arm with usrmerge
>
> Petr Kubiz=C5=88=C3=A1k (1):
>   harfbuzz: remove bindir only if it exists
>
> Quentin Schulz (1):
>   cairo: fix CVE patches assigned wrong CVE number
>
> Randy MacLeod (1):
>   vim: upgrade 9.0.0947 -> 9.0.1211
>
> Ross Burton (1):
>   cve-update-db-native: show IP on failure
>
> Sandeep Gundlupet Raju (2):
>   kernel-fitimage: Adjust order of dtb/dtbo files
>   kernel-fitimage: Allow user to select dtb when multiple dtb exists
>
> Saul Wold (1):
>   at: Change when files are copied
>
> Steve Sakoman (1):
>   Revert "libksba: fix CVE-2022-47629"
>
> Vivek Kumbhar (1):
>   openssl: fix CVE-2022-3996 double locking leads to denial of service
>
> Yash Shinde (1):
>   glibc: stable 2.35 branch updates.
>
> Yogita Urade (1):
>   libksba: fix CVE-2022-47629
>
>  meta/classes/cve-check.bbclass                |   6 +-
>  meta/classes/gtk-icon-cache.bbclass           |   2 +-
>  meta/classes/image.bbclass                    |   3 +-
>  meta/classes/kernel-fitimage.bbclass          |  21 +-
>  meta/classes/toolchain-scripts.bbclass        |   2 +-
>  meta/lib/oe/reproducible.py                   |   3 +-
>  meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
>  .../dhcpcd/dhcpcd_9.4.1.bb                    |   2 +
>  ...low-getrandom-sysctl-for-newer-glibc.patch |  30 ++
>  ...sep-Allow-newfstatat-syscall-as-well.patch |  31 ++
>  .../openssl/openssl/CVE-2022-3996.patch       |  43 ++
>  .../openssl/openssl_3.0.7.bb                  |   1 +
>  meta/recipes-core/busybox/busybox.inc         |  26 +-
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  .../recipes-core/meta/cve-update-db-native.bb |  88 +++-
>  meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 -
>  ...rm-add-armv9-a-architecture-to-march.patch |  89 ++--
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++---
>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |  10 +-
>  ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 -
>  meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
>  .../go/go-1.18/CVE-2022-41717.patch           |  89 ++++
>  ...-git-CVE-2022-24439-fix-from-PR-1518.patch |  97 ++++
>  ...-git-CVE-2022-24439-fix-from-PR-1521.patch | 488 ++++++++++++++++++
>  .../python/python3-git_3.1.27.bb              |   4 +
>  ...-of-whitespace-to-search-backtrack.-.patch |  31 ++
>  .../python/python3-setuptools_59.5.0.bb       |   1 +
>  ...tential-DoS-attack-via-WHEEL_INFO_RE.patch |  32 ++
>  .../python/python3-wheel_0.37.1.bb            |   4 +-
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  .../qemu/qemu/CVE-2022-4144.patch             |  99 ++++
>  meta/recipes-extended/at/at_3.2.5.bb          |   6 +-
>  .../cairo/cairo/CVE-2019-6461.patch           |  46 +-
>  .../cairo/cairo/CVE-2019-6462.patch           |  46 +-
>  .../freetype/freetype_2.11.1.bb               |   2 +-
>  .../harfbuzz/harfbuzz_4.0.1.bb                |   6 +-
>  ...possible-memleaks-in-XkbGetKbdByName.patch |  63 ---
>  ...ntedString-against-request-length-at.patch |  38 --
>  ...-xorg_21.1.4.bb =3D> xserver-xorg_21.1.6.bb} |   4 +-
>  ...{xwayland_22.1.5.bb =3D> xwayland_22.1.7.bb} |   2 +-
>  ...20221109.bb =3D> linux-firmware_20221214.bb} |   4 +-
>  .../linux/linux-yocto-rt_5.15.bb              |   6 +-
>  .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
>  ...ules_2.13.7.bb =3D> lttng-modules_2.13.8.bb} |   2 +-
>  ...c-stop-accessing-out-of-bounds-frame.patch |  19 +-
>  ...c-stop-accessing-out-of-bounds-frame.patch |   7 +-
>  ...-vp3-Add-missing-check-for-av_malloc.patch |  12 +-
>  ...ec-Add-check-for-avformat_new_stream.patch |  67 +++
>  .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
>  meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
>  .../libksba/ksba-add-pkgconfig-support.patch  |   6 +-
>  .../{libksba_1.6.2.bb =3D> libksba_1.6.3.bb}    |   2 +-
>  .../libseccomp/libseccomp_2.5.3.bb            |   2 +-
>  meta/recipes-support/vim/vim.inc              |   4 +-
>  55 files changed, 1479 insertions(+), 404 deletions(-)
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-A=
llow-getrandom-sysctl-for-newer-glibc.patch
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-A=
llow-newfstatat-syscall-as-well.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-39=
96.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_=
DYNAMIC_LINKER.patch
>  create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
>  create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3=
-git-CVE-2022-24439-fix-from-PR-1518.patch
>  create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3=
-git-CVE-2022-24439-fix-from-PR-1521.patch
>  create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-=
Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
>  create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Fixed=
-potential-DoS-attack-via-WHEEL_INFO_RE.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
xkb-proof-GetCountedString-against-request-length-at.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.4.bb =3D> x=
server-xorg_21.1.6.bb} (80%)
>  rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb =3D> xwayland_=
22.1.7.bb} (95%)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb =
=3D> linux-firmware_20221214.bb} (99%)
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb =3D> lttng-mod=
ules_2.13.8.bb} (94%)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-n=
utdec-Add-check-for-avformat_new_stream.patch
>  rename meta/recipes-support/libksba/{libksba_1.6.2.bb =3D> libksba_1.6.3=
.bb} (94%)
>
> --
> 2.25.1
>

