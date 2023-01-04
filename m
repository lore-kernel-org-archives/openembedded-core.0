Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53ABC4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:36:33 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.13467.1672842989888487632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 06:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=t2C+XQwq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so27199096pjk.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 06:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EX73WGzAuvw8sl5qh5OuO0W4C2STUcoh7R3IKYE/Dlw=;
        b=t2C+XQwqvwNRIJvBvwAA2SUA/JXvNfOr8y7DjYVm5mOgg7C3K2uXspSJszNbO9dUG2
         jGwfLAHd7N8EeDUTlM/bxkXaSUmoGWD9mHtzl6RbOumgxSACpqZp7lttRt5gDyFBJcOw
         o8J/rRcOUi4IJWjWagkKi/qntBaiZi3pq+nxJHgkLunvLpflV5dW92VE1RYOtt/o9KQm
         2qAvWg8yYHSH01XK5soOYsJyz14eWShnLyBv/CtOAQRcsumFeWhD0mumHUefAuTJq7Am
         S17UQQKGboMFkyCRtTFbz03nqinnhrBripU7SCofIAZknkgG2S/XTToYE0L6VOFhBs3v
         SE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EX73WGzAuvw8sl5qh5OuO0W4C2STUcoh7R3IKYE/Dlw=;
        b=ZV3HySX/7Amp4KQgdxbYe0F2VQ4zgYYVxjqtXM26PIJZzugFqIfT8ughmgfouVflCh
         HOlvPAQvY99o/kwz+9JzB73lYm2zeEHnVoUWZvBGrbgionmVjx99I7SeiFA5S2KVw863
         mXAdmK+WJlEQno2lWurZ9eT3Uu3VjuHRG8uGf2TI2HycgpCtc9ZzYgRAMMo+j/bcLoAb
         gdtvT3Dx9EeEeawR941dy5huhR7CfH6ynuLNewHoG/w3CR3ejKKVSPyWuX5T7wjrnye/
         EKWfl5iWXNrNR80PVFasw1no9q+AdDv3Nlsa9nuYMB69xchE0kRgtLeuY42AL1d0lp8g
         nX3w==
X-Gm-Message-State: AFqh2kqj1zh7oHXLBasv2teRqbPFh32YED/HIs245+iCEAT9/CKL56Ji
	/etic6ODxd+wDx0itOYy0WYGYwBQQR10gVJBzsk=
X-Google-Smtp-Source: AMrXdXuz7i15Cqxhdy6yC+q+SuaH5xeqbIZYkTMFOtS7V+hpNiv/5Z8L30DuskB+6oY3Ls86Jk673g==
X-Received: by 2002:a17:902:f7ce:b0:192:a51d:e29f with SMTP id h14-20020a170902f7ce00b00192a51de29fmr23939557plw.62.1672842988570;
        Wed, 04 Jan 2023 06:36:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id k16-20020a170902c41000b00192754737aesm19700893plk.10.2023.01.04.06.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 06:36:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/29] Pull request (cover letter only)
Date: Wed,  4 Jan 2023 04:36:23 -1000
Message-Id: <cover.1672842927.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 14:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175480

The following changes since commit ada5e64a97d5f269886772540e0bb0c324088b21:

  efibootmgr: update compilation with musl (2022-12-17 04:10:41 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alejandro Hernandez Samaniego (1):
  baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES

Alexander Kanavin (5):
  libnewt: update 0.52.21 -> 0.52.23
  ruby: merge .inc into .bb
  ruby: update 3.1.2 -> 3.1.3
  tzdata: update 2022d -> 2022g
  devtool/upgrade: correctly handle recipes where S is a subdir of
    upstream tree

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.152
  linux-yocto/5.10: update to v5.10.154
  linux-yocto/5.10: update to v5.10.160

Hitendra Prajapati (2):
  systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with
    a long backtrace
  libX11: CVE-2022-3554 & CVE-2022-3555 Fix memory leak

Jagadeesh Krishnanjanappa (1):
  qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel
    image

Joshua Watt (1):
  classes/create-spdx: Add SPDX_PRETTY option

Kai Kang (1):
  webkitgtk: 2.36.7 -> 2.36.8

Martin Jansa (1):
  libxml2: fix test data checksums

Ovidiu Panait (1):
  kernel.bbclass: remove empty module directories to prevent QA issues

Quentin Schulz (1):
  cairo: update patch for CVE-2019-6461 with upstream solution

Randy MacLeod (1):
  valgrind: skip the boost_thread test on arm

Ranjitsinh Rathod (3):
  curl: Correct LICENSE from MIT-open-group to curl
  curl: Add patch to fix CVE-2022-43551
  curl: Add patch to fix CVE-2022-43552

Richard Purdie (1):
  oeqa/concurrencytest: Add number of failures to summary output

Robert Andersson (1):
  go-crosssdk: avoid host contamination by GOCACHE

Ross Burton (1):
  libepoxy: remove upstreamed patch

Vivek Kumbhar (1):
  sqlite: fix CVE-2022-46908 safe mode authorizer callback allows
    disallowed UDFs.

Wang Mingyu (2):
  libpng: upgrade 1.6.38 -> 1.6.39
  gstreamer1.0: upgrade 1.20.4 -> 1.20.5

Xiangyu Chen (1):
  openssh: remove RRECOMMENDS to rng-tools for sshd package

Yash.Shinde@windriver.com (1):
  binutils : Fix CVE-2022-4285

 meta/classes/baremetal-image.bbclass          |  11 ++
 meta/classes/create-spdx.bbclass              |  22 +++-
 meta/classes/kernel.bbclass                   |   4 +-
 meta/classes/qemuboot.bbclass                 |   3 +-
 meta/lib/oe/sbom.py                           |   4 +-
 meta/lib/oeqa/core/utils/concurrencytest.py   |   4 +-
 .../openssh/openssh_8.9p1.bb                  |  10 +-
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   4 +-
 .../systemd/systemd/CVE-2022-45873.patch      | 124 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   1 +
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0019-CVE-2022-4285.patch         |  37 ++++++
 meta/recipes-devtools/go/go-crosssdk.inc      |   2 +
 meta/recipes-devtools/ruby/ruby.inc           |  39 ------
 ...001-Remove-dependency-on-libcapstone.patch |  36 -----
 .../ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb}     |  48 ++++++-
 .../valgrind/valgrind/remove-for-aarch64      |   1 +
 .../0001-detect-gold-as-GNU-linker-too.patch  |  14 +-
 ...-t-ignore-CFLAGS-when-building-snack.patch |  29 ----
 ...{libnewt_0.52.21.bb => libnewt_0.52.23.bb} |   4 +-
 meta/recipes-extended/timezone/timezone.inc   |   7 +-
 .../cairo/cairo/CVE-2019-6461.patch           |  35 ++++-
 ...atch_common.h-define-also-EGL_NO_X11.patch |  27 ----
 .../libepoxy/libepoxy_1.5.10.bb               |   4 +-
 .../xorg-lib/libx11/CVE-2022-3554.patch       |  58 ++++++++
 .../xorg-lib/libx11/CVE-2022-3555.patch       |  40 ++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 ++--
 ...tools_1.20.4.bb => gst-devtools_1.20.5.bb} |   2 +-
 ...1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} |   2 +-
 ...x_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.5.bb} |   2 +-
 ....20.4.bb => gstreamer1.0-python_1.20.5.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.5.bb} |   2 +-
 ...1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} |   2 +-
 ...er1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} |   2 +-
 .../{libpng_1.6.38.bb => libpng_1.6.39.bb}    |   2 +-
 ...ebkitgtk_2.36.7.bb => webkitgtk_2.36.8.bb} |   4 +-
 .../curl/curl/CVE-2022-43551.patch            |  35 +++++
 .../curl/curl/CVE-2022-43552.patch            |  80 +++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   4 +-
 .../sqlite/files/CVE-2022-46908.patch         |  39 ++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 scripts/lib/devtool/standard.py               |  19 +--
 scripts/lib/devtool/upgrade.py                |  18 ++-
 50 files changed, 595 insertions(+), 238 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-45873.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby.inc
 delete mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 rename meta/recipes-devtools/ruby/{ruby_3.1.2.bb => ruby_3.1.3.bb} (68%)
 delete mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
 rename meta/recipes-extended/newt/{libnewt_0.52.21.bb => libnewt_0.52.23.bb} (87%)
 delete mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch
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
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.7.bb => webkitgtk_2.36.8.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43551.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-43552.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2022-46908.patch

-- 
2.25.1


