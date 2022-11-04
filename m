Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E24C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 02:56:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.7133.1667530564226507198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 19:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=YR3d7+Cg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id l2so3675890pld.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 19:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhZfv8zyiqgtbjY45Ge3Qe+00aWYi2KXgOoyl4JlcIA=;
        b=YR3d7+Cg7Dc4JI1/ad+SXAgtw2HXJwS49XB36OTvysor6v1DNiwBHRiJhh7mqDvcZU
         X1PD7wXBLddbEfnzdt3mSTWwuclGhlbxZyPfx3TNac1ITjRNjlFr2ueIOcoQCe2EIz59
         ju2eelJVpXCvP2gYGQLSbbuKnUFGX83fxjbHtDYz2mBwCwzdr0VzqYgpx9+POss1B1zL
         ycqjewDuOxcOYsqRFeiUZCHBSV9sWArVF7Fc9LwcgEwqVK1x9yOWBjbrcVcdUke0Ibht
         mTftxur3wweqq93huCJO74bc6v9s19HRX+s6Azp4mfioVpsoZh3x/GyFLMBpd2tZhNW5
         9flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hhZfv8zyiqgtbjY45Ge3Qe+00aWYi2KXgOoyl4JlcIA=;
        b=t4U+cOqDLrjHRbG5agb0G7zh9WSorKIYIMF3krWIAGBtOSdW+9pCv5rT3i+nmELLOU
         z3p8uQigUAtC6FOhERZy8OxdOWZySTI2dl2hAkusRXFtJXqEyd28daps7uCHMiDI6NkQ
         Ftt8rHsrKZUDWlQmmlxC0+23NxIRK0HT1deOnzvE9ccwpTSgaw5cJ9tFSOY4S/SY1vT8
         +ve+GP95uZ+3qUEf6FdokGv4kDuMGA4G8jW3d5nre0G5EuAqi/Xy8xyyQqbr02ITnYgk
         olG29WmA1JAPlukMe+D+KAkSEyWmPjIvm+qXdsHsUSwgkc1or/LmzFZnAJBCy2FqO2jX
         PVZw==
X-Gm-Message-State: ACrzQf1roeNI09xdboIgS2fg+OPT+NzsDMuyCE2zobORuKJ9ZcGNMoL8
	ls7W6lBDu11C4qy4wlA/2F15DWYW1XOmnSHQ
X-Google-Smtp-Source: AMsMyM5tdxpHwfeb8eaeAz/VWlEifKjPMkA9UKb8Nm0qnPW7ZEBmvslzSvaAEC1TFY7VxXl10F5W0g==
X-Received: by 2002:a17:902:768c:b0:186:b136:187a with SMTP id m12-20020a170902768c00b00186b136187amr32452727pll.94.1667530563026;
        Thu, 03 Nov 2022 19:56:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id ja18-20020a170902efd200b0016c5306917fsm1405728plb.53.2022.11.03.19.56.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 19:56:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/21] Pull request (cover letter only)
Date: Thu,  3 Nov 2022 16:55:56 -1000
Message-Id: <cover.1667529832.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 02:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172660

The following changes since commit d40f7ddcfbdd5cb1d9f96271fefddf67e9044bb9:

  openssl: Fix SSL_CERT_FILE to match ca-certs location (2022-10-26 23:01:13 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Ed Tanous (1):
  openssl: Upgrade 3.0.5 -> 3.0.7

Hitendra Prajapati (1):
  openssl: CVE-2022-3358 Using a Custom Cipher with NID_undef may lead
    to NULL encryption

Jan-Simon Moeller (1):
  buildtools-tarball: export certificates to python and curl

Jeremy Puhlman (1):
  qemu-native: Add PACKAGECONFIG option for jack

Joshua Watt (2):
  runqemu: Do not perturb script environment
  runqemu: Fix gl-es argument from causing other arguments to be ignored

Kai Kang (1):
  mesa: only apply patch to fix ALWAYS_INLINE for native

Liam Beguin (1):
  meson: make wrapper options sub-command specific

Qiu, Zheng (1):
  tiff: fix a typo for CVE-2022-2953.patch

Ross Burton (6):
  libx11: apply the fix for CVE-2022-3554
  xserver-xorg: ignore CVE-2022-3553 as it is XQuartz-specific
  xserver-xorg: backport fixes for CVE-2022-3550 and CVE-2022-3551
  tiff: fix a number of CVEs
  qemu: backport the fix for CVE-2022-3165
  pango: upgrade 1.50.9 -> 1.50.10

Teoh Jay Shen (1):
  vim: Upgrade 9.0.0598 -> 9.0.0614

Vyacheslav Yurkov (1):
  overlayfs: Allow not used mount points

wangmy (4):
  meson: upgrade 0.63.2 -> 0.63.3
  mtools: upgrade 4.0.40 -> 4.0.41
  ifupdown: upgrade 0.8.37 -> 0.8.39
  gnutls: upgrade 3.7.7 -> 3.7.8

 meta/classes-recipe/overlayfs.bbclass         |   6 +-
 meta/lib/oe/overlayfs.py                      |   6 +-
 .../{openssl_3.0.5.bb => openssl_3.0.7.bb}    |   2 +-
 ...{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} |   2 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +
 .../meson/meson/meson-wrapper                 |  21 +-
 .../{meson_0.63.2.bb => meson_0.63.3.bb}      |   2 +-
 .../mtools/disable-hardcoded-configs.patch    |   6 +-
 .../{mtools_4.0.40.bb => mtools_4.0.41.bb}    |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2022-3165.patch             |  59 ++
 meta/recipes-graphics/mesa/mesa.inc           |   4 +-
 .../{pango_1.50.9.bb => pango_1.50.10.bb}     |   2 +-
 ...ak-in-XRegisterIMInstantiateCallback.patch |  57 ++
 .../recipes-graphics/xorg-lib/libx11_1.8.1.bb |   1 +
 .../xorg-xserver/xserver-xorg.inc             |   2 +
 ...possible-memleaks-in-XkbGetKbdByName.patch |  63 ++
 ...ntedString-against-request-length-at.patch |  38 +
 .../xorg-xserver/xserver-xorg_21.1.4.bb       |   2 +
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 266 +++++++
 ...fcrop-S-option-Make-decision-simpler.patch |  36 +
 ...-incompatibility-of-Z-X-Y-z-options-.patch |  59 ++
 ...ines-require-a-larger-buffer-fixes-2.patch | 653 ++++++++++++++++++
 .../libtiff/files/CVE-2022-2953.patch         |   2 +-
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   5 +-
 .../{gnutls_3.7.7.bb => gnutls_3.7.8.bb}      |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/runqemu                               |  28 +-
 28 files changed, 1301 insertions(+), 33 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.5.bb => openssl_3.0.7.bb} (99%)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.37.bb => ifupdown_0.8.39.bb} (97%)
 rename meta/recipes-devtools/meson/{meson_0.63.2.bb => meson_0.63.3.bb} (98%)
 rename meta/recipes-devtools/mtools/{mtools_4.0.40.bb => mtools_4.0.41.bb} (93%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
 rename meta/recipes-graphics/pango/{pango_1.50.9.bb => pango_1.50.10.bb} (94%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/0001-fix-a-memory-leak-in-XRegisterIMInstantiateCallback.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffcrop-S-option-Make-decision-simpler.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch
 rename meta/recipes-support/gnutls/{gnutls_3.7.7.bb => gnutls_3.7.8.bb} (97%)

-- 
2.25.1


