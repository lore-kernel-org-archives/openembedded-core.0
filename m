Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.1929.1600733027732140786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 17:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jxRM1PXH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id a9so614633pjg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 17:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=y4dLY8juH1FXdLF/hGmk3HFnQbI5EroDI4yBI1Fgcpo=;
        b=jxRM1PXH3BOSqJMAQ0DGBo162SLykFLYBAx1ogG4/YVotuvB0DD1M+nMGi5GECIKh4
         aAikX40pjAeq4VUWWMhXbqteR+qcT/wUSLXH+15PXGq88AtyERoiMPw8Mv+GnUBHdewi
         UlqWTuzUGFLtbnwBHaiKlgLTLRp+W++SVtJzAaMttypesf76svP4aOSUXwE2XCpiUKXk
         82txWsrUV/GpIL2GFTm4d/buGYg8a8jyp/YxgkbICFrhYmdCkHkNFpd3MTwXLREBfNVN
         bs7empD6dmaWJZSqkHri5SiCpW42h5Q+Mj0ta4zI+nrQRgUiw5uUx4M9R2VvVaOyZQ9c
         5iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=y4dLY8juH1FXdLF/hGmk3HFnQbI5EroDI4yBI1Fgcpo=;
        b=stVrGFqw3PrYPhmxMv8m2L1r2N/thBZqkY6x4OKnXZgK9W4eou2hmvWKNI1/HiJCv5
         8QifLnhRGUEl3oPXOSO6wyW899L/1hkJgUYAOTKzgO5m5udclcHADSbysMhmjx731X1z
         bJsiBWt9nZxQ7HqqwAJ+ErzJJYpkEOPYcj2uzLVTOOFROatfdzfHq56f/48ktirWM3g0
         FMihneG6SBGh1070PY52NmdBGwBN6sjtqUNthWm4X57TklcFui+X9KK9yi2IMEVrftq/
         IH180p/UfAtEyHWwvL3JUyPWFrf8h64wQ3Wbze1kSeDLg84MJgL6nFFqjswXUfCyGbKv
         TubQ==
X-Gm-Message-State: AOAM532tJf3Zsv4+nRHgId33UrTzYpyN6pHpysrLGj2bPQ7UW7do+9Sl
	pxI6mWlysmWlsFK7i+m9GX0C45Es3/GxJc2rRl4=
X-Google-Smtp-Source: ABdhPJw3F7S2kJ6iM2b0+EzPpZ+IDVcLM0gB5mfIml32rCSYi2eDlS6ZA8shrj2AMZZ2kiXVCEQaTQ==
X-Received: by 2002:a17:90a:ca03:: with SMTP id x3mr1547572pjt.92.1600733026631;
        Mon, 21 Sep 2020 17:03:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s24sm468931pjp.53.2020.09.21.17.03.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 17:03:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Mon, 21 Sep 2020 14:03:37 -1000
Message-Id: <cover.1600732964.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit b98e50f08b2bcf61fbc75ea1b0ad83a17c0a736a:

  cve-check: avoid FileNotFoundError if no do_cve_check task has run (2020-09-14 04:26:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Christophe GUIBOUT (1):
  initramfs-framework: support kernel cmdline with double quotes

Geoff Parker (1):
  systemd-serialgetty: Replace sed quoting using ' with " to allow var
    expansion

Khem Raj (1):
  populate_sdk_ext: Do not assume local.conf will always exist

Michael Gloff (1):
  sysvinit: Remove ${B} assignment

Pierre-Jean Texier (1):
  libubootenv: upgrade 0.3 -> 0.3.1

Rahul Kumar (1):
  systemd-serialgetty: Fix sed expression quoting

Steve Sakoman (1):
  Revert "kernel.bbclass: run do_symlink_kernsrc before do_patch"

 meta/classes/kernel.bbclass                         |  2 +-
 meta/classes/populate_sdk_ext.bbclass               |  5 +++--
 .../{libubootenv_0.3.bb => libubootenv_0.3.1.bb}    |  2 +-
 .../initrdscripts/initramfs-framework/init          | 13 +++++++++++++
 meta/recipes-core/systemd/systemd-serialgetty.bb    |  4 ++--
 meta/recipes-core/sysvinit/sysvinit_2.96.bb         |  1 -
 6 files changed, 20 insertions(+), 7 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} (94%)

-- 
2.17.1

