Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3084EC636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 14:19:16 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.15733.1676038746388896250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Feb 2023 06:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0Hm5MUhI;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id qw12so16290803ejc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 06:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BMaylo6zBykhHE4ZHMUQytLSqFEyr/90mK+knUhBRE=;
        b=0Hm5MUhIIdghhYcj82wgeg8VsshEoVlm7NI0O/mM4RSt+4lfM9BSaC3x5whbqkc8Kj
         ZOC/cPwVlfHn7cTjFVYPHSUt50lFfpjjGNTD8ZSWmbsSiLALErbOkDKyAlKEbRUCikQ4
         Q3rEL3pF33CkbumBN4nI7lJwSvr6h4//ELfA0JWaye7xUzuLvSRxotiNxPiSFcRNJ2Nu
         BJ+Kxtn7lCUn5wiaPJG0FxvTw+amE53V5AV2tKGM+waQ15o5rLQA39+CDN0QN2iQsMx7
         J2tUiYAD/hH6Jxe1SbAKXA8A9P0V1xVoCNeMXXRK5po41DSdPWuV4Y2PoHJ46B/nSq26
         V4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BMaylo6zBykhHE4ZHMUQytLSqFEyr/90mK+knUhBRE=;
        b=kK0gmNUuA22L5a8se6LlHUke/ZUverutmCMJSb1tjrX73o4ZXUD1T78BOr02Wi2L0S
         5GfwWejGU51QFtT9lhIGjLQErclzixvSELoIpma3s4DjhtBrEccxomKmkOVPhUk1pGP1
         v5sCDTofjQacOnKOCtEddbfJ0gYKCpDdQYbUw8hwfqsIC27o0c9Dhv7kovSsf4Yr8VXF
         EdilUk5f5qrzwRxgYHHEQTwSdNVKbmpqTty2sHDLwsklPrC9gF0FJ0RdsUC7os0HIirZ
         O4JBAdJG43+qKR03YL/i5nNxuDieHvqFYozXIXAiFx9AtOdXdjH+KMYYfPl9TXRTZQ4Z
         RNuA==
X-Gm-Message-State: AO0yUKWTaE5rp2w0kFCEQvKzZM2r2ewEfC934y+uiJgyZa8SfNqVXQ6x
	BbL4xl4+AUpeWHl0MvT+/bBhOLqEY3Qvs88RLOzueg==
X-Google-Smtp-Source: AK7set8bBZRydUe1rnfM8XcnkSsWelpyN8Ict8S5o2L4Z1oNXF0gvMfP0zKDUFKM/EWVUyWfJQKFhs3qUGEassuiHaY=
X-Received: by 2002:a17:906:fc01:b0:850:2768:735e with SMTP id
 ov1-20020a170906fc0100b008502768735emr3476963ejb.64.1676038744570; Fri, 10
 Feb 2023 06:19:04 -0800 (PST)
MIME-Version: 1.0
References: <1741DF989644FC2C.2540@lists.openembedded.org>
In-Reply-To: <1741DF989644FC2C.2540@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 10 Feb 2023 04:18:52 -1000
Message-ID: <CAOSpxdZFpbnHRRPN=uiqwyBy8bUbsu_06Ft96gy1rFN+S5wHQw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/27] Pull request (cover letter only)
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 14:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176992

This is the final pull request for the 3.1.23 release.

Steve

On Wed, Feb 8, 2023 at 4:26 AM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> The following changes since commit db81e3c7e7f1d4d9eba52ac35ac97627d0240b=
63:
>
>   build-appliance-image: Update to dunfell head revision (2023-01-13 18:1=
1:40 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/dunfell-n=
ext
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
dunfell-next
>
> Alexander Kanavin (2):
>   linux-firmware: upgrade 20221109 -> 20221214
>   selftest/virgl: use pkg-config from the host
>
> Beno=C3=AEt Mauduit (1):
>   lib/oe/reproducible: Use git log without gpg signature
>
> Bhabu Bindu (1):
>   ffmpeg: Fix CVE-2022-3109
>
> Bruce Ashfield (2):
>   linux-yocto/5.4: update to v5.4.229
>   linux-yocto/5.4: update to v5.4.230
>
> Hitendra Prajapati (1):
>   xserver-xorg: Fix Multiple CVEs
>
> Jan Kircher (1):
>   toolchain-scripts: compatibility with unbound variable protection
>
> Jermain Horsman (1):
>   cve-check: write the cve manifest to IMGDEPLOYDIR
>
> Khem Raj (1):
>   libtirpc: Check if file exists before operating on it
>
> Marta Rybczynska (1):
>   cve-update-db-native: avoid incomplete updates
>
> Niko Mauno (2):
>   systemd: Consider PACKAGECONFIG in RRECOMMENDS
>   Fix missing leading whitespace with ':append'
>
> Quentin Schulz (1):
>   cairo: fix CVE patches assigned wrong CVE number
>
> Randy MacLeod (1):
>   vim: upgrade 9.0.0947 -> 9.0.1211
>
> Ranjitsinh Rathod (1):
>   libsdl2: Add fix for CVE-2022-4743
>
> Ross Burton (2):
>   cve-update-db-native: add more logging when fetching
>   cve-update-db-native: show IP on failure
>
> Steve Sakoman (5):
>   python3: fix packaging of Windows distutils installer stubs
>   lttng-modules: update 2.11.6 -> 2.11.7
>   lttng-modules: update 2.11.7 -> 2.11.8
>   lttng-modules: update 2.11.8 -> 2.11.9
>   lttng-modules: fix build with 5.4.229 kernel
>
> Thomas Roos (1):
>   devtool: fix devtool finish when gitmodules file is empty
>
> Vivek Kumbhar (1):
>   go: fix CVE-2022-1962 go/parser stack exhaustion in all Parse*
>     functions
>
> Xiaobing Luo (1):
>   devtool: Fix _copy_file() TypeError
>
> jan (1):
>   cve-update-db-native: Allow to overrule the URL in a bbappend.
>
>  meta/classes/cve-check.bbclass                |   6 +-
>  meta/classes/externalsrc.bbclass              |   2 +-
>  meta/classes/populate_sdk_ext.bbclass         |   2 +-
>  meta/classes/toolchain-scripts.bbclass        |   2 +-
>  meta/lib/oe/reproducible.py                   |   3 +-
>  meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
>  .../recipes-core/meta/cve-update-db-native.bb |  97 +++--
>  meta/recipes-core/systemd/systemd_244.5.bb    |   4 +-
>  meta/recipes-devtools/go/go-1.14.inc          |   1 +
>  .../go/go-1.14/CVE-2022-1962.patch            | 357 ++++++++++++++++++
>  .../python/python3/python3-manifest.json      |   4 +-
>  .../libtirpc/libtirpc_1.2.6.bb                |   2 +-
>  .../cairo/cairo/CVE-2019-6461.patch           |  46 +--
>  .../cairo/cairo/CVE-2019-6462.patch           |  46 ++-
>  .../libsdl2/libsdl2/CVE-2022-4743.patch       |  38 ++
>  .../libsdl2/libsdl2_2.0.12.bb                 |   1 +
>  .../xserver-xorg/CVE-2022-4283.patch          |  39 ++
>  .../xserver-xorg/CVE-2022-46340.patch         |  55 +++
>  .../xserver-xorg/CVE-2022-46341.patch         |  86 +++++
>  .../xserver-xorg/CVE-2022-46342.patch         |  78 ++++
>  .../xserver-xorg/CVE-2022-46343.patch         |  51 +++
>  .../xserver-xorg/CVE-2022-46344.patch         |  75 ++++
>  .../xorg-xserver/xserver-xorg_1.20.14.bb      |   8 +-
>  ...20221109.bb =3D> linux-firmware_20221214.bb} |   4 +-
>  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
>  ...ncpy-equals-destination-size-warning.patch |  42 ---
>  ...jtool-Rename-frame.h-objtool.h-v5.10.patch |  88 -----
>  ...oints-output-proper-root-owner-for-t.patch | 316 ----------------
>  ...rdered-extent-tracepoint-take-btrfs_.patch | 179 ---------
>  ...ext4-fast-commit-recovery-path-v5.10.patch |  91 -----
>  ...intr-vectoring-info-and-error-code-t.patch | 124 ------
>  ...x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch |  82 ----
>  ...Return-unique-RET_PF_-values-if-the-.patch |  71 ----
>  ...int-Optimize-using-static_call-v5.10.patch | 155 --------
>  ...-fix-include-order-for-older-kernels.patch |  31 --
>  .../0011-Add-release-maintainer-script.patch  |  59 ---
>  .../0012-Improve-the-release-script.patch     | 173 ---------
>  ...fix-ext4-fast-commit-recovery-path-v.patch |  32 --
>  ...-fix-include-order-for-older-kernels.patch |  32 --
>  ...fix-tracepoint-Optimize-using-static.patch |  46 ---
>  ...ion-range-for-trace_find_free_extent.patch |  30 --
>  ...ix-jbd2-use-the-correct-print-format.patch | 147 ++++++++
>  ...ules_2.11.6.bb =3D> lttng-modules_2.11.9.bb} |  21 +-
>  .../ffmpeg/ffmpeg/CVE-2022-3109.patch         |  41 ++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
>  meta/recipes-support/vim/vim.inc              |   4 +-
>  scripts/lib/devtool/standard.py               |   2 +-
>  49 files changed, 1135 insertions(+), 1677 deletions(-)
>  create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.p=
atch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
022-4283.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
022-46340.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
022-46341.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
022-46342.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
022-46343.patch
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
022-46344.patch
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb =
=3D> linux-firmware_20221214.bb} (99%)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-strn=
cpy-equals-destination-size-warning.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-objt=
ool-Rename-frame.h-objtool.h-v5.10.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-btrf=
s-tracepoints-output-proper-root-owner-for-t.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrf=
s-make-ordered-extent-tracepoint-take-btrfs_.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4=
-fast-commit-recovery-path-v5.10.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-KVM-=
x86-Add-intr-vectoring-info-and-error-code-t.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kvm-=
x86-mmu-Add-TDP-MMU-PF-handler-v5.10.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-KVM-=
x86-mmu-Return-unique-RET_PF_-values-if-the-.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-trac=
epoint-Optimize-using-static_call-v5.10.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-incl=
ude-order-for-older-kernels.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0011-Add-rele=
ase-maintainer-script.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0012-Improve-=
the-release-script.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0013-fix-back=
port-of-fix-ext4-fast-commit-recovery-path-v.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0014-Revert-f=
ix-include-order-for-older-kernels.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0015-fix-back=
port-of-fix-tracepoint-Optimize-using-static.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0016-fix-adju=
st-version-range-for-trace_find_free_extent.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-=
the-correct-print-format.patch
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.6.bb =3D> lttng-mod=
ules_2.11.9.bb} (59%)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.p=
atch
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176907): https://lists.openembedded.org/g/openembedde=
d-core/message/176907
> Mute This Topic: https://lists.openembedded.org/mt/96830807/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

