Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13B5C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 14:33:40 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14716.1673015617306316553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 06:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=skDwJZ5H;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id vm8so3868001ejc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 06:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JY4LPeviceK4oNMOYh4bUOdDB97A7BVItkOpT7mVn+8=;
        b=skDwJZ5HEqrkujbJRUjjvhpqxeBZBWPv6Rx4JBa1JwgSRp+EC4GU0IR4kqwxBr65UN
         i0WPSGmf6Ru1nnuTCXJpwhE5WgzrvIBAK547fpechtxrJezJUeZdB22kHaWpQ0Z8J3ht
         fqyID02eewiSFsZ5uJ6Skt/L7/3YMI4DChmVe9Z3/6ISEuR5IgFZJvLjpmAi32m5b3Bu
         wxO0xl8OdibM8njNKdrmpKyNQ/Uzp2hIY6CznXblA4PisAPDBA6ns7YpGXNHCSYwUsX9
         vZboqAvcUNTDLwuig8cH+58uFILN1f+amPajoX4XULAke6rL7C5e8r40zjtRVxHZKmgT
         GFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JY4LPeviceK4oNMOYh4bUOdDB97A7BVItkOpT7mVn+8=;
        b=JAKeAxDAfpoQ4yL6Via6/BVwXyWQHHEB6V5XaKo8f0aO++RKdx8mxlyFiP+vWzWH2R
         VqO3DoWTgECiDBwkKtaXKDz0pkKFD0by2n14MPpo4xPgELSQWSnGa2pmeHfSK01Jr8H5
         sl1dHtbZO8jVBdfIO7qs4rHblkGCt46rxjY6j1/a7NKIM6GXYtnwDYBRKxLJFJr8FShZ
         GjoqDjFmKaylJKf9dgOe7Csan1aFkmawwEkK/DnZJsqF9FNlqj+fqJmzFhk1OAreBNFy
         H6PS0LCqa23uTA8mDASdHYaHUrPt2h1MU2A2dGKkiBdo3KQc9Z03uU7yiUEQj7o77YtP
         iozg==
X-Gm-Message-State: AFqh2kptheViBVkrW/kAJJM/DUv+2owrtAPli978TdEfhg3mPu1TU1m8
	mQaIE7HkS/ur7vda3/+B3zleGDOik13dVs5BfsoeKkkG7+C8nq8A
X-Google-Smtp-Source: AMrXdXswc4MfNXk5ElRMC05IGlvPcvNYpkPMDumy6cFrrqeFWBN8qjl35jq+oU7qFB6YbPAj0xS+Zi4kYneu9WEiSM8=
X-Received: by 2002:a17:907:d48a:b0:7c1:10b6:3ea0 with SMTP id
 vj10-20020a170907d48a00b007c110b63ea0mr4908280ejc.132.1673015615423; Fri, 06
 Jan 2023 06:33:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672843046.git.steve@sakoman.com>
In-Reply-To: <cover.1672843046.git.steve@sakoman.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 6 Jan 2023 04:33:23 -1000
Message-ID: <CAOSpxdYmgB33V_TcvRkqXSrB-4SzoDqyYNwMjZuujOdzZCokyg@mail.gmail.com>
Subject: Re: [OE-core][langdale 00/22] Pull request (cover letter only)
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 14:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175593

I neglected to add a comment that this is the final pull request for
the langdale 4.1.2 build on Monday.

Steve

On Wed, Jan 4, 2023 at 4:38 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> The following changes since commit 4efc5ec83bc97e5731284ef3879f89fda4b8ef0b:
>
>   yocto-check-layer: Allow OE-Core to be tested (2022-12-23 23:04:58 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next
>
> Alejandro Hernandez Samaniego (1):
>   baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
>
> Alex Stewart (1):
>   opkg: upgrade to version 0.6.1
>
> Alexander Kanavin (6):
>   libnewt: update 0.52.21 -> 0.52.23
>   ruby: merge .inc into .bb
>   ruby: update 3.1.2 -> 3.1.3
>   tzdata: update 2022d -> 2022g
>   cmake: update 3.24.0 -> 3.24.2
>   devtool/upgrade: correctly handle recipes where S is a subdir of
>     upstream tree
>
> Jagadeesh Krishnanjanappa (1):
>   qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel
>     image
>
> Marek Vasut (1):
>   systemd: Make importd depend on glib-2.0 again
>
> Martin Jansa (1):
>   libxml2: fix test data checksums
>
> Quentin Schulz (1):
>   cairo: update patch for CVE-2019-6461 with upstream solution
>
> Randy MacLeod (1):
>   valgrind: skip the boost_thread test on arm
>
> Ranjitsinh Rathod (1):
>   curl: Correct LICENSE from MIT-open-group to curl
>
> Richard Purdie (1):
>   oeqa/concurrencytest: Add number of failures to summary output
>
> Robert Andersson (1):
>   go-crosssdk: avoid host contamination by GOCACHE
>
> Ross Burton (1):
>   libepoxy: remove upstreamed patch
>
> Wang Mingyu (3):
>   libpng: upgrade 1.6.38 -> 1.6.39
>   help2man: upgrade 1.49.2 -> 1.49.3
>   gstreamer1.0: upgrade 1.20.4 -> 1.20.5
>
> Xiangyu Chen (1):
>   openssh: remove RRECOMMENDS to rng-tools for sshd package
>
> pgowda (1):
>   binutils: Add patch to fix CVE-2022-4285
>
>  meta/classes-recipe/baremetal-image.bbclass   | 20 ++++----
>  meta/classes-recipe/qemuboot.bbclass          |  3 +-
>  meta/lib/oeqa/core/utils/concurrencytest.py   |  4 +-
>  .../openssh/openssh_9.0p1.bb                  |  9 +---
>  meta/recipes-core/libxml/libxml2_2.9.14.bb    |  4 +-
>  meta/recipes-core/systemd/systemd_251.8.bb    |  2 +-
>  .../binutils/binutils-2.39.inc                |  1 +
>  .../binutils/0015-CVE-2022-4285.patch         | 37 ++++++++++++++
>  ...ative_3.24.0.bb => cmake-native_3.24.2.bb} |  0
>  meta/recipes-devtools/cmake/cmake.inc         |  2 +-
>  .../{cmake_3.24.0.bb => cmake_3.24.2.bb}      |  0
>  meta/recipes-devtools/go/go-crosssdk.inc      |  2 +
>  ...{help2man_1.49.2.bb => help2man_1.49.3.bb} |  2 +-
>  .../opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb}     |  2 +-
>  meta/recipes-devtools/ruby/ruby.inc           | 39 ---------------
>  ...001-Remove-dependency-on-libcapstone.patch | 36 --------------
>  .../ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb}     | 48 ++++++++++++++++---
>  .../valgrind/valgrind/remove-for-aarch64      |  1 +
>  .../0001-detect-gold-as-GNU-linker-too.patch  | 14 +++---
>  ...-t-ignore-CFLAGS-when-building-snack.patch | 29 -----------
>  ...{libnewt_0.52.21.bb => libnewt_0.52.23.bb} |  4 +-
>  meta/recipes-extended/timezone/timezone.inc   |  7 ++-
>  .../cairo/cairo/CVE-2019-6461.patch           | 35 +++++++++++---
>  ...atch_common.h-define-also-EGL_NO_X11.patch | 27 -----------
>  .../libepoxy/libepoxy_1.5.10.bb               |  4 +-
>  ...tools_1.20.4.bb => gst-devtools_1.20.5.bb} |  2 +-
>  ...1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} |  2 +-
>  ...x_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} |  2 +-
>  ....bb => gstreamer1.0-plugins-bad_1.20.5.bb} |  2 +-
>  ...bb => gstreamer1.0-plugins-base_1.20.5.bb} |  2 +-
>  ...bb => gstreamer1.0-plugins-good_1.20.5.bb} |  2 +-
>  ...bb => gstreamer1.0-plugins-ugly_1.20.5.bb} |  2 +-
>  ....20.4.bb => gstreamer1.0-python_1.20.5.bb} |  2 +-
>  ....bb => gstreamer1.0-rtsp-server_1.20.5.bb} |  2 +-
>  ...1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} |  2 +-
>  ...er1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} |  2 +-
>  .../{libpng_1.6.38.bb => libpng_1.6.39.bb}    |  2 +-
>  meta/recipes-support/curl/curl_7.85.0.bb      |  2 +-
>  scripts/lib/devtool/standard.py               | 19 ++++----
>  scripts/lib/devtool/upgrade.py                | 18 ++++---
>  40 files changed, 176 insertions(+), 219 deletions(-)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
>  rename meta/recipes-devtools/cmake/{cmake-native_3.24.0.bb => cmake-native_3.24.2.bb} (100%)
>  rename meta/recipes-devtools/cmake/{cmake_3.24.0.bb => cmake_3.24.2.bb} (100%)
>  rename meta/recipes-devtools/help2man/{help2man_1.49.2.bb => help2man_1.49.3.bb} (89%)
>  rename meta/recipes-devtools/opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb} (97%)
>  delete mode 100644 meta/recipes-devtools/ruby/ruby.inc
>  delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
>  rename meta/recipes-devtools/ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb} (68%)
>  delete mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
>  rename meta/recipes-extended/newt/{libnewt_0.52.21.bb => libnewt_0.52.23.bb} (87%)
>  delete mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
>  rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} (91%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} (94%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} (91%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} (90%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} (95%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} (97%)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb} (93%)
>
> --
> 2.25.1
>

