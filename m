Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A29C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:38:33 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.13535.1672843105164645893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 06:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=u22K74y8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so26479998pjq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 06:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMDVAGlcUHYyclb08it3u0j4iGCjI7nEDD4ObmizUXY=;
        b=u22K74y8LVlQYfc1ld7m+pQQ1BQcQDDHidcwFnMJIJjHviaiCmGzeaAENInKNcY2ah
         +7yfGW5YCU7tMAQHCk0Iw47XdOOGIyADijpBwHP0/NuNnoBKz+WUqvT4UFDMSXf5H3UK
         iJfA6b6CuRSGIHkBwD6QMdm7xqh9dah+yJawuuAUea7QlzQrpCI6csBHwNFBJeBftIch
         zXNBkYHCOnAtIH9zcKaqt7F1M5PoVm8rwsEso/fTChyaDPRC4bnicuOyOlJE9qo41w0w
         ssoxrHSnk3HA4BY7QS/xxiodj8G1OAVbcxu8iXCB5pYAYY/UFMwCgCHGkT9CLgoSIFHA
         By3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMDVAGlcUHYyclb08it3u0j4iGCjI7nEDD4ObmizUXY=;
        b=Il8+kdPuoj/a1amQobYEj9nrXURSQW8p0JwVl91KgFkTCUlZ6GwTJJjZ/OfbZLhNIH
         BP4phamADRQ8lqy7rrDP01nIdKo5LbWgBBm2A+8kFDPzoHPsOoCwb6CdnNAS5eYISt/+
         HfoAlPneKWgRxceLTTVgXHdx1bKolCqXS3Q+2QmAq1TQF+IIDDW8jn2zjiYURMsUYyAg
         OFrEBB1BMAcoeGHTdVon8hW1ilJ18eEIDsMd5J4m4i7PKDVdAJ8dWxjdskpjlhBA1okI
         u6TOFyrD6sRHFQN/54hDdZj8m0GykwUDcUn80GmkXBdn2Dd5K6P0DbtkLJxFXJIUqHmy
         ocjg==
X-Gm-Message-State: AFqh2kpR8wCSXnnBev+LmiHXRJ8gQWtWk9+3i/yku9GqTv7vVLL5fIJ+
	koJO2iTrdYS8kyAbpFpoyhalEIBIJLJRz/fNwyg=
X-Google-Smtp-Source: AMrXdXsxJ5uFW+aa5zwgVuvzIymuQTYsJEAiZpj+G4CTvPesXg+s1mgXSX91kKlUjp+KKuiMTmthLw==
X-Received: by 2002:a05:6a20:93a7:b0:b0:42a5:fe24 with SMTP id x39-20020a056a2093a700b000b042a5fe24mr62743735pzh.4.1672843104177;
        Wed, 04 Jan 2023 06:38:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y11-20020a634b0b000000b00477a442d450sm3031466pga.16.2023.01.04.06.38.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 06:38:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/22] Pull request (cover letter only)
Date: Wed,  4 Jan 2023 04:38:19 -1000
Message-Id: <cover.1672843046.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 14:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175481

The following changes since commit 4efc5ec83bc97e5731284ef3879f89fda4b8ef0b:

  yocto-check-layer: Allow OE-Core to be tested (2022-12-23 23:04:58 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alejandro Hernandez Samaniego (1):
  baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES

Alex Stewart (1):
  opkg: upgrade to version 0.6.1

Alexander Kanavin (6):
  libnewt: update 0.52.21 -> 0.52.23
  ruby: merge .inc into .bb
  ruby: update 3.1.2 -> 3.1.3
  tzdata: update 2022d -> 2022g
  cmake: update 3.24.0 -> 3.24.2
  devtool/upgrade: correctly handle recipes where S is a subdir of
    upstream tree

Jagadeesh Krishnanjanappa (1):
  qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel
    image

Marek Vasut (1):
  systemd: Make importd depend on glib-2.0 again

Martin Jansa (1):
  libxml2: fix test data checksums

Quentin Schulz (1):
  cairo: update patch for CVE-2019-6461 with upstream solution

Randy MacLeod (1):
  valgrind: skip the boost_thread test on arm

Ranjitsinh Rathod (1):
  curl: Correct LICENSE from MIT-open-group to curl

Richard Purdie (1):
  oeqa/concurrencytest: Add number of failures to summary output

Robert Andersson (1):
  go-crosssdk: avoid host contamination by GOCACHE

Ross Burton (1):
  libepoxy: remove upstreamed patch

Wang Mingyu (3):
  libpng: upgrade 1.6.38 -> 1.6.39
  help2man: upgrade 1.49.2 -> 1.49.3
  gstreamer1.0: upgrade 1.20.4 -> 1.20.5

Xiangyu Chen (1):
  openssh: remove RRECOMMENDS to rng-tools for sshd package

pgowda (1):
  binutils: Add patch to fix CVE-2022-4285

 meta/classes-recipe/baremetal-image.bbclass   | 20 ++++----
 meta/classes-recipe/qemuboot.bbclass          |  3 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |  4 +-
 .../openssh/openssh_9.0p1.bb                  |  9 +---
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  4 +-
 meta/recipes-core/systemd/systemd_251.8.bb    |  2 +-
 .../binutils/binutils-2.39.inc                |  1 +
 .../binutils/0015-CVE-2022-4285.patch         | 37 ++++++++++++++
 ...ative_3.24.0.bb => cmake-native_3.24.2.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 .../{cmake_3.24.0.bb => cmake_3.24.2.bb}      |  0
 meta/recipes-devtools/go/go-crosssdk.inc      |  2 +
 ...{help2man_1.49.2.bb => help2man_1.49.3.bb} |  2 +-
 .../opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb}     |  2 +-
 meta/recipes-devtools/ruby/ruby.inc           | 39 ---------------
 ...001-Remove-dependency-on-libcapstone.patch | 36 --------------
 .../ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb}     | 48 ++++++++++++++++---
 .../valgrind/valgrind/remove-for-aarch64      |  1 +
 .../0001-detect-gold-as-GNU-linker-too.patch  | 14 +++---
 ...-t-ignore-CFLAGS-when-building-snack.patch | 29 -----------
 ...{libnewt_0.52.21.bb => libnewt_0.52.23.bb} |  4 +-
 meta/recipes-extended/timezone/timezone.inc   |  7 ++-
 .../cairo/cairo/CVE-2019-6461.patch           | 35 +++++++++++---
 ...atch_common.h-define-also-EGL_NO_X11.patch | 27 -----------
 .../libepoxy/libepoxy_1.5.10.bb               |  4 +-
 ...tools_1.20.4.bb => gst-devtools_1.20.5.bb} |  2 +-
 ...1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} |  2 +-
 ...x_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.5.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.5.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.5.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.5.bb} |  2 +-
 ....20.4.bb => gstreamer1.0-python_1.20.5.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.5.bb} |  2 +-
 ...1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} |  2 +-
 ...er1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} |  2 +-
 .../{libpng_1.6.38.bb => libpng_1.6.39.bb}    |  2 +-
 meta/recipes-support/curl/curl_7.85.0.bb      |  2 +-
 scripts/lib/devtool/standard.py               | 19 ++++----
 scripts/lib/devtool/upgrade.py                | 18 ++++---
 40 files changed, 176 insertions(+), 219 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
 rename meta/recipes-devtools/cmake/{cmake-native_3.24.0.bb => cmake-native_3.24.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.24.0.bb => cmake_3.24.2.bb} (100%)
 rename meta/recipes-devtools/help2man/{help2man_1.49.2.bb => help2man_1.49.3.bb} (89%)
 rename meta/recipes-devtools/opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb} (97%)
 delete mode 100644 meta/recipes-devtools/ruby/ruby.inc
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 rename meta/recipes-devtools/ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb} (68%)
 delete mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.21.bb => libnewt_0.52.23.bb} (87%)
 delete mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.38.bb => libpng_1.6.39.bb} (93%)

-- 
2.25.1


