Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D517C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 14:45:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.12938.1669819495624484758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 06:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=u8o0MRra;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so2169518pjh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 06:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AT3nadK9TWt56RDC04EPeaL+l4o2hX4T3TD5ghEURLM=;
        b=u8o0MRra8CgyjPHepct45hVECLM/huYBXRTRo5s0rsUaw3hbhnX1MVFJ5vHnhvN/wY
         Jzzkx3LxWaUQzgflvK2C1ygYxQGHLV33igTiWnhsD38IBPr7CA1WUczokKCJ8TPuc3AU
         ELs7jJXTxGEVZ9GuGGq/TMSAVbg7+lrgUZz7olbgAJhTmT1kyPxCGckyKRvTyQFnxLr4
         213tqecUdeEU2brJ5ejrhZX/3Icg/cSwbTed+Wo5cO3tts0UUXCOedWtUyukU1i2w5o8
         ml/n57QXLBAqP+WNHtOfOxbYctS1jKV26N8RvqmGoBrgiMG4XZc4K7reU+1C1kUYNDPz
         7Nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT3nadK9TWt56RDC04EPeaL+l4o2hX4T3TD5ghEURLM=;
        b=l79QldIq4Un4verbA9zalBPnR9QUzuISuqE8/01a4ydXKrSl+mrcO9dmBd6iPxXDe3
         UGQYBhy2iovRzjmzFmLVkFwgTkFTmPkt8T8y6l32ZcmN1+6EY04Rnx74TsrXHLymOTzI
         GjzzT2Qyj+itItU2Vm9BnqEdngj5xVUs6Wb59l+u7WUhzGcZ0ifyb6Tt9ofvFzdDbG8R
         hSaeR5cJiuONIOsxxXuz+Vvk/M6El15BhefQ4UmfjZ5ZzjMZ+CgXQCZyL3qJgFQSOS/C
         h9RUArlooY/IclOaccG5Xsyk77j/DYUvX0MICNwC4k504k9eqLH4VFSqhnfZtDhv84G5
         ECNg==
X-Gm-Message-State: ANoB5pm6JNjvjikLVURnWuhtksZ3OsR1mgCe4s4Iz+nA+Q/oTVJjemfg
	7mYvhIA6b2y1MzQgRAGcxgFX76JhKzJdoQ6SnLk=
X-Google-Smtp-Source: AA0mqf4Daysrqy0zye0O8fyJiDs2wKSUBP4pMAAEsNf4sUKaXE4YZh4kdXgDy9ZwUh3dMHy4OvQNhQ==
X-Received: by 2002:a17:90b:3687:b0:219:468e:88ac with SMTP id mj7-20020a17090b368700b00219468e88acmr11827893pjb.105.1669819494414;
        Wed, 30 Nov 2022 06:44:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w18-20020aa79552000000b00574ffc5976fsm1484930pfq.159.2022.11.30.06.44.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 06:44:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/37] Pull request (cover letter only)
Date: Wed, 30 Nov 2022 04:44:48 -1000
Message-Id: <cover.1669819433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 14:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174015

The following changes since commit e0dc0f4a153f75d14d50d5bc91edb93fac93cd25:

  wic: make ext2/3/4 images reproducible (2022-11-19 03:59:47 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alexander Kanavin (17):
  ffmpeg: upgrade 5.1.1 -> 5.1.2
  linux-firmware: upgrade 20220913 -> 20221012
  xwayland: upgrade 22.1.3 -> 22.1.4
  libffi: upgrade 3.4.2 -> 3.4.4
  libical: upgrade 3.0.15 -> 3.0.16
  mtd-utils: upgrade 2.1.4 -> 2.1.5
  selftest: add a copy of previous mtd-utils version to meta-selftest
  gdk-pixbuf: upgrade 2.42.9 -> 2.42.10
  pango: upgrade 1.50.10 -> 1.50.11
  pango: replace a recipe fix with an upstream submitted patch
  gstreamer1.0: upgrade 1.20.3 -> 1.20.4
  libepoxy: convert to git
  libepoxy: update 1.5.9 -> 1.5.10
  mesa: do not rely on native llvm-config in target sysroot
  systemd: update 251.4 -> 251.8
  vala: install vapigen-wrapper into /usr/bin/crosscripts and stage only
    that
  gnomebase.bbclass: return the whole version for tarball directory if
    it is a number

Jose Quaresma (3):
  sstatesig: skip the rm_work task signature
  rm_work: exclude the SSTATETASKS from the rm_work tasks sinature
  sstate: Allow optimisation of do_deploy_archives task dependencies

Joshua Watt (2):
  qemu-helper-native: Re-write bridge helper as C program
  qemu-helper-native: Correctly pass program name as argv[0]

Konrad Weihmann (1):
  create-spdx: default share_src for shared sources

Nathan Rossi (2):
  oeqa/selftest/lic_checksum: Cleanup changes to emptytest include
  package: Fix handling of minidebuginfo with newer binutils

Peter Kjellerstedt (1):
  pango: Make it build with ptest disabled

Peter Marko (2):
  systemd: add group render to udev package
  meta-selftest/staticids: add render group for systemd

Richard Purdie (1):
  sanity: Drop data finalize call

Ross Burton (1):
  linux-firmware: don't put the firmware into the sysroot

Wang Mingyu (7):
  xwayland: upgrade 22.1.4 -> 22.1.5
  sysstat: upgrade 12.6.0 -> 12.6.1
  mobile-broadband-provider-info: upgrade 20220725 -> 20221107
  libsdl2: upgrade 2.24.1 -> 2.24.2
  mesa: upgrade 22.2.2 -> 22.2.3
  babeltrace: upgrade 1.5.8 -> 1.5.11
  iso-codes: upgrade 4.11.0 -> 4.12.0

 meta-selftest/files/static-group              |  1 +
 ...used-linux-fs.h-header-from-includes.patch |  0
 .../mtd/mtd-utils-selftest_git.bb             | 77 +++++++++++++++++
 meta/classes-global/package.bbclass           | 21 ++++-
 meta/classes-global/sanity.bbclass            | 11 +--
 meta/classes-global/sstate.bbclass            |  2 +-
 meta/classes-recipe/gnomebase.bbclass         |  2 +-
 meta/classes/create-spdx.bbclass              |  5 +-
 meta/classes/rm_work.bbclass                  |  2 +
 meta/lib/oe/sstatesig.py                      |  6 ++
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |  2 +
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 ...md-boot_251.4.bb => systemd-boot_251.8.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 .../{systemd_251.4.bb => systemd_251.8.bb}    |  2 +
 meta/recipes-devtools/llvm/llvm/llvm-config   |  9 ++
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |  8 +-
 .../qemu/qemu-helper-native_1.0.bb            |  6 +-
 .../qemu/qemu-helper/qemu-oe-bridge-helper    | 25 ------
 .../qemu/qemu-helper/qemu-oe-bridge-helper.c  | 34 ++++++++
 meta/recipes-devtools/vala/vala.inc           | 10 +--
 .../{sysstat_12.6.0.bb => sysstat_12.6.1.bb}  |  2 +-
 ...pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} |  2 +-
 .../{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} |  6 +-
 .../{libsdl2_2.24.1.bb => libsdl2_2.24.2.bb}  |  2 +-
 .../{mesa-gl_22.2.2.bb => mesa-gl_22.2.3.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 12 +--
 .../mesa/{mesa_22.2.2.bb => mesa_22.2.3.bb}   |  0
 ...d-install-nofonts-fonts.conf-as-it-i.patch | 35 ++++++++
 .../{pango_1.50.10.bb => pango_1.50.11.bb}    |  9 +-
 ...{xwayland_22.1.3.bb => xwayland_22.1.5.bb} |  2 +-
 ...20220913.bb => linux-firmware_20221012.bb} |  9 +-
 ...beltrace_1.5.8.bb => babeltrace_1.5.11.bb} |  2 +-
 .../{ffmpeg_5.1.1.bb => ffmpeg_5.1.2.bb}      |  2 +-
 ...tools_1.20.3.bb => gst-devtools_1.20.4.bb} |  2 +-
 ...r-APNG-encoder-property-registration.patch | 86 -------------------
 ...1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} |  6 +-
 ...x_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.4.bb} |  2 +-
 ...-system-headers-for-isspace-and-ssca.patch | 35 --------
 ...bb => gstreamer1.0-plugins-base_1.20.4.bb} |  3 +-
 ...bb => gstreamer1.0-plugins-good_1.20.4.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.4.bb} |  2 +-
 ....20.3.bb => gstreamer1.0-python_1.20.4.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.4.bb} |  2 +-
 ...1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} |  2 +-
 ...er1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} |  2 +-
 ...so-codes_4.11.0.bb => iso-codes_4.12.0.bb} |  2 +-
 ...m-sysv-reverted-clang-VFP-mitigation.patch |  6 +-
 .../libffi/libffi/not-win32.patch             |  8 +-
 .../{libffi_3.4.2.bb => libffi_3.4.4.bb}      |  4 +-
 .../{libical_3.0.15.bb => libical_3.0.16.bb}  |  2 +-
 53 files changed, 252 insertions(+), 234 deletions(-)
 rename {meta/recipes-devtools/mtd/mtd-utils => meta-selftest/recipes-devtools/mtd/mtd-utils-selftest}/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch (100%)
 create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
 rename meta/recipes-core/systemd/{systemd-boot_251.4.bb => systemd-boot_251.8.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_251.4.bb => systemd_251.8.bb} (99%)
 delete mode 100755 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper
 create mode 100644 meta/recipes-devtools/qemu/qemu-helper/qemu-oe-bridge-helper.c
 rename meta/recipes-extended/sysstat/{sysstat_12.6.0.bb => sysstat_12.6.1.bb} (65%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.9.bb => gdk-pixbuf_2.42.10.bb} (98%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.9.bb => libepoxy_1.5.10.bb} (83%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.1.bb => libsdl2_2.24.2.bb} (97%)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.2.bb => mesa-gl_22.2.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.2.bb => mesa_22.2.3.bb} (100%)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch
 rename meta/recipes-graphics/pango/{pango_1.50.10.bb => pango_1.50.11.bb} (85%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.3.bb => xwayland_22.1.5.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221012.bb} (99%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.5.8.bb => babeltrace_1.5.11.bb} (98%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.1.bb => ffmpeg_5.1.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.3.bb => gst-devtools_1.20.4.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.3.bb => gstreamer1.0-libav_1.20.4.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.3.bb => gstreamer1.0-omx_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.3.bb => gstreamer1.0-plugins-bad_1.20.4.bb} (98%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-include-required-system-headers-for-isspace-and-ssca.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.3.bb => gstreamer1.0-plugins-base_1.20.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.3.bb => gstreamer1.0-plugins-good_1.20.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.3.bb => gstreamer1.0-plugins-ugly_1.20.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.3.bb => gstreamer1.0-python_1.20.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.3.bb => gstreamer1.0-rtsp-server_1.20.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.3.bb => gstreamer1.0-vaapi_1.20.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.3.bb => gstreamer1.0_1.20.4.bb} (97%)
 rename meta/recipes-support/iso-codes/{iso-codes_4.11.0.bb => iso-codes_4.12.0.bb} (94%)
 rename meta/recipes-support/libffi/{libffi_3.4.2.bb => libffi_3.4.4.bb} (90%)
 rename meta/recipes-support/libical/{libical_3.0.15.bb => libical_3.0.16.bb} (96%)

-- 
2.25.1


