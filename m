Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78804C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 02:28:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.1710.1667960880777057580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 18:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gOx5DdUL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id e129so15005701pgc.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 18:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZYOBSy1auyUg29DzppIVZgp+WYjbE4sCA/FrqZKp7c=;
        b=gOx5DdULMIRp+eYgr5/n2Ke6TQgdbEWzjykRoYWVsU+gSlCyC+GGtbwyIvkVoGUpI8
         a/l67T4L97oCdC4t7ho28lX2sJpV/e99eByff42IXuUhvd22WAGmQWPwTiJAd1Cyrpha
         ga6eNQdR4nYYHQuc8MEcpfGrfUGRmxE23+rnftzC9ZTaUV2c6WNzVsRFq9/RUDWVY0jW
         k1T78ZimRTd4nwVX52+yoJjEbQlBJlcZ2uMHaScvIN8ymU2J/H/WjpsMUY/nsJbuD7GS
         hYmVqbUQtOLSxOcyRIw4itTW3LK81w46u5oAVbIWTKqYq2dfenYfvFAoef5R47QhlP/g
         Hkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZYOBSy1auyUg29DzppIVZgp+WYjbE4sCA/FrqZKp7c=;
        b=SfbdvN69JJ2+yxAAdfheWx79/QOpQPqpShP7WIGM8a8Kn1KnUPfoMTr1PBzw/yQR0/
         GQ27pmQ577H8O5waZPzB1LLoVJ3qiWAt2t5RdvASyfuvLLDqqRsshMJ+uGvYnmUr26hT
         hccaM4CYY1ybz9S0c//VNSHfR588dk/EKSKK4qzA1tguWzQSslJYUffnnxsVlPdzrYX6
         Er79vLaLQ4hX1x40jz6a6b09pVluDYdIEfATrUjgRalD+PfLmzsUnLmhkKcwr/re0POI
         y9Rc6VQpKks8hRBGmDtU52xk23IOaGXT69YvmkUM4gf7ExcaqzGUwtQein/5icJJ91ys
         Gz+g==
X-Gm-Message-State: ACrzQf2n/aF4HOJI6JhwpC2ampUrCtiVCoNao7ER24c5bOvosKww5Crt
	/o6RLmZ0HcgHJnApFvzcxoJ81xbrwk8L61ln
X-Google-Smtp-Source: AMsMyM5XSSpeAzb0bSNpwpVRZnVTELnRCIl59bfaolT82ASGLY0Q8J+4lIwSXqZsK9D+ChXZlgcilg==
X-Received: by 2002:a65:4bc3:0:b0:439:103b:fc35 with SMTP id p3-20020a654bc3000000b00439103bfc35mr49764242pgr.248.1667960879686;
        Tue, 08 Nov 2022 18:27:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jd10-20020a170903260a00b00185507b5ef8sm7633568plb.50.2022.11.08.18.27.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 18:27:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/34] Pull request (cover letter only)
Date: Tue,  8 Nov 2022 16:27:52 -1000
Message-Id: <cover.1667960800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 02:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173008

The following changes since commit 48f9f92c547fac35ff398180a32a5b0829cd9fff:

  openssl: Upgrade 3.0.5 -> 3.0.7 (2022-11-03 04:25:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Adrian Freihofer (1):
  buildconf: compare abspath

Alexander Kanavin (2):
  rust-target-config: match riscv target names with what rust expects
  rust: install rustfmt for riscv32 as well

Bruce Ashfield (3):
  linux-yocto/5.15: update to v5.15.72
  linux-yocto/5.19: update to v5.19.14
  kern-tools: fix relative path processing

Christian Eggers (1):
  linux-firmware: split rtl8761 firmware

Claus Stovgaard (1):
  gstreamer1.0-libav: fix errors with ffmpeg 5.x

Etienne Cordonnier (1):
  mirrors.bbclass: use shallow tarball for binutils-native

Jose Quaresma (1):
  kernel-yocto: improve fatal error messages of symbol_why.py

Keiya Nobuta (1):
  create-spdx: Remove ";name=..." for downloadLocation

Luca Boccassi (1):
  systemd: add systemd-creds and systemd-cryptenroll to
    systemd-extra-utils

Markus Volk (1):
  mesa: update 22.2.0 -> 22.2.2

Martin Jansa (2):
  vulkan-samples: add lfs=0 to SRC_URI to avoid git smudge errors in
    do_unpack
  externalsrc.bbclass: fix git repo detection

Mingli Yu (1):
  grub: disable build on armv7ve/a with hardfp

Peter Kjellerstedt (1):
  externalsrc.bbclass: Remove a trailing slash from ${B}

Ross Burton (2):
  zlib: do out-of-tree builds
  zlib: upgrade 1.2.12 -> 1.2.13

Sean Anderson (3):
  uboot-sign: Fix using wrong KEY_REQ_ARGS
  kernel: Clear SYSROOT_DIRS instead of replacing sysroot_stage_all
  kernel-fitimage: Use KERNEL_OUTPUT_DIR where appropriate

Sergei Zhmylev (1):
  wic: honor the SOURCE_DATE_EPOCH in case of updated fstab

Thomas Perrot (1):
  xserver-xorg: move some recommended dependencies in required

Tim Orling (1):
  vim: upgrade 9.0.0614 -> 9.0.0820

Vincent Davis Jr (1):
  linux-firmware: package amdgpu firmware

wangmy (8):
  libcap: upgrade 2.65 -> 2.66
  libical: upgrade 3.0.14 -> 3.0.15
  numactl: upgrade 2.0.15 -> 2.0.16
  wpebackend-fdo: upgrade 1.12.1 -> 1.14.0
  libksba: upgrade 1.6.0 -> 1.6.2
  libsdl2: upgrade 2.24.0 -> 2.24.1
  lttng-ust: upgrade 2.13.4 -> 2.13.5
  lighttpd: upgrade 1.4.66 -> 1.4.67

 meta/classes-global/mirrors.bbclass           |  1 +
 meta/classes-recipe/kernel-fitimage.bbclass   | 16 ++--
 meta/classes-recipe/kernel-yocto.bbclass      | 10 +--
 meta/classes-recipe/kernel.bbclass            |  4 +-
 .../classes-recipe/rust-target-config.bbclass | 40 ++++++---
 meta/classes-recipe/uboot-sign.bbclass        |  2 +-
 meta/classes/create-spdx.bbclass              |  1 +
 meta/classes/externalsrc.bbclass              |  6 +-
 meta/lib/bblayers/buildconf.py                |  2 +-
 meta/lib/oe/rust.py                           |  2 +
 meta/recipes-bsp/grub/grub2.inc               |  4 +-
 meta/recipes-core/systemd/systemd_251.4.bb    |  2 +
 ...t-inputs-provided-to-the-CRC-functio.patch | 54 ------------
 ...etting-a-gzip-header-extra-field-wit.patch | 38 --------
 ...processing-bug-that-dereferences-NUL.patch | 36 --------
 meta/recipes-core/zlib/zlib/cc.patch          | 27 ------
 .../zlib/zlib/ldflags-tests.patch             | 45 ----------
 .../zlib/{zlib_1.2.12.bb => zlib_1.2.13.bb}   | 12 ++-
 meta/recipes-devtools/rust/rust_1.63.0.bb     |  1 -
 .../lighttpd/lighttpd/CVE-2022-41556.patch    | 31 -------
 ...{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} |  3 +-
 ...d-in-native-OE-builds-by-not-looking.patch |  6 +-
 .../{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb}  |  2 +-
 .../{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  4 +-
 .../mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb}   |  0
 .../vulkan/vulkan-samples_git.bb              |  2 +-
 .../xorg-xserver/xserver-xorg.inc             |  6 +-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux-firmware/linux-firmware_20220913.bb | 18 ++++
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-rt_5.19.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++---
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++---
 ...ttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} |  2 +-
 ...r-APNG-encoder-property-registration.patch | 86 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.20.3.bb    |  4 +-
 ...fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} |  2 +-
 ...-Raise-the-size-of-arrays-containing.patch |  2 +-
 .../libcap/{libcap_2.65.bb => libcap_2.66.bb} |  2 +-
 .../{libical_3.0.14.bb => libical_3.0.15.bb}  |  2 +-
 .../{libksba_1.6.0.bb => libksba_1.6.2.bb}    |  2 +-
 meta/recipes-support/numactl/numactl_git.bb   |  4 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 scripts/lib/wic/partition.py                  |  7 +-
 scripts/lib/wic/plugins/imager/direct.py      |  3 +
 scripts/lib/wic/plugins/source/rootfs.py      |  2 +-
 49 files changed, 236 insertions(+), 339 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Correct-incorrect-inputs-provided-to-the-CRC-functio.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-a-bug-when-getting-a-gzip-header-extra-field-wit.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-Fix-extra-field-processing-bug-that-dereferences-NUL.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/cc.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/ldflags-tests.patch
 rename meta/recipes-core/zlib/{zlib_1.2.12.bb => zlib_1.2.13.bb} (68%)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} (96%)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.24.0.bb => libsdl2_2.24.1.bb} (97%)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb => mesa-gl_22.2.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb => mesa_22.2.2.bb} (100%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.4.bb => lttng-ust_2.13.5.bb} (95%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-libav-Fix-for-APNG-encoder-property-registration.patch
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.1.bb => wpebackend-fdo_1.14.0.bb} (90%)
 rename meta/recipes-support/libcap/{libcap_2.65.bb => libcap_2.66.bb} (96%)
 rename meta/recipes-support/libical/{libical_3.0.14.bb => libical_3.0.15.bb} (96%)
 rename meta/recipes-support/libksba/{libksba_1.6.0.bb => libksba_1.6.2.bb} (94%)

-- 
2.25.1


