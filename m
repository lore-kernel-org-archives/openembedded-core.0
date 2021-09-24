Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.8787.1632492952408600034
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HcVK/BsO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id s11so9949197pgr.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CoBMknncwOVHt6F0yuLwecBwj+QllJNjVC3EkbLQAn4=;
        b=HcVK/BsOVa38hoY/lHcSKu/4fh5epUY0//+YpNFDaEXDQordhm1Eqsrlc6mIzqv3e9
         k/AL5J+lvQX443mVc2Mnmi7MtJCcaxZeY1RrSJXJXeMkT42/fLzfpdh4oSZivNLRL0z4
         b2oXhQNsuG25hTeNkALuOfV73QFJYFDDl4nORSyh7fyj7YIel8+qu1nL4c+OcFGSrllg
         068J9se/yBHHk7dpBNa5mlemr8zzV7kaMe/u64qf86aTskD6yKVTDxW5r5BRyEN7QxRQ
         NiRGpOSCykyWHnCx8vTJSA/yin+E+NqVaPwBlu4tlraQmrMzXH52RhofBagG1ckCBZM9
         OfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CoBMknncwOVHt6F0yuLwecBwj+QllJNjVC3EkbLQAn4=;
        b=5xjU7elrDyZld1JnXDI5Z4apARMU2tKXAm5gbNk4SB4V9VovxWDS0O594APLimktZg
         e1Ktv6CNGgxROCK4LGfTiIoa4z7dOzVLusm46Hje46vZJWbCTcamWCHRwJk9Ac8lbl6H
         P4lvUbvP+KEnPMePmDtPSQVzaV3JPQoFpEAAxLFxW/oOzt2XhLhXPE8NdAUW9yRiSBif
         JpDEKhWIpMvw57BTU2jkxJ9ZGOJK9W1j0xlGQAYHJ4hg/KV0jz1en+L1ZabVVq0gc5Yl
         Mv4r0ipHgu506PULlBy2LQF/TNl4b9iLCGn7pN8c9sqPZp95EyD3KaIDUoJeo357CBMU
         dOzg==
X-Gm-Message-State: AOAM533Gd7BwAFyV0xqY7Agmnvr8UAUBuLTOiIlrnU31T2rDbwdyqwLF
	XrzpcNUFe9Kg32lMGVAd7w5yzDkwdzhi1FFDa6A=
X-Google-Smtp-Source: ABdhPJzDQ8cy6UJcd8Sq6nROUQvMQl9K05FEJXkG9dIvHmL5Xg4IEo2JKsW+1hgTIDj0Vc3el6d6eg==
X-Received: by 2002:a63:be0e:: with SMTP id l14mr3893284pgf.363.1632492950946;
        Fri, 24 Sep 2021 07:15:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.15.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:15:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/25] Patch review
Date: Fri, 24 Sep 2021 04:15:04 -1000
Message-Id: <cover.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by end of
day Tuesday. Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2639

The following changes since commit 49ca1f62cc17c951b7737a4ee3c236f732bc8ebe:

  build-appliance-image: Update to dunfell head revision (2021-09-15 10:42:23 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  wic: keep rootfs_size as integer
  testimage: symlink the task log and qemu console log to tmp/log/oeqa

Armin Kuster (9):
  libgcrypt: Security fix CVE-2021-33560
  apr: Security fix for CVE-2021-35940
  libsndfile: Security fix for CVE-2021-3246
  qemu: Security fix CVE-2020-12829
  qemu: Security fix for CVE-2020-27617
  qemu: Security fix for CVE-2020-28916
  nettle: Security fix for CVE-2021-3580
  nettle: Security fix for CVE-2021-20305
  tar: ignore node-tar CVEs

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.143
  linux-yocto/5.4: update to v5.4.144

Jon Mason (2):
  Update mailing list address
  core-image-sato: Fix runqemu error for qemuarmv5

Kai Kang (1):
  squashfs-tools: fix CVE-2021-40153

Mike Crowe (1):
  curl: Fix CVE-2021-22946 and CVE-2021-22947, whitelist CVE-2021-22945

Ranjitsinh Rathod (1):
  rpm: Handle proper return value to avoid major issues

Richard Purdie (3):
  vim: Backport fix for CVE-2021-3770
  useradd: Ensure preinst data is expanded correctly in pkgdata
  bash: Ensure deterministic build

Ross Burton (1):
  libsoup-2.4: remove obsolete intltool dependency

Sakib Sajal (1):
  qemu: fix CVE-2021-3682

Steve Sakoman (1):
  connman: add CVE_PRODUCT

Visa Hankala (1):
  iputils: Fix regression of arp table update

 meta/classes/testimage.bbclass                |  12 +-
 meta/classes/useradd.bbclass                  |   4 +
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/recipes-connectivity/connman/connman.inc |   2 +
 .../ldconfig-native-2.12.1/ldconfig.patch     |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   8 +
 .../qemu/qemu/CVE-2020-12829_1.patch          | 164 ++++++++
 .../qemu/qemu/CVE-2020-12829_2.patch          | 139 +++++++
 .../qemu/qemu/CVE-2020-12829_3.patch          |  47 +++
 .../qemu/qemu/CVE-2020-12829_4.patch          | 100 +++++
 .../qemu/qemu/CVE-2020-12829_5.patch          | 266 +++++++++++++
 .../qemu/qemu/CVE-2020-27617.patch            |  49 +++
 .../qemu/qemu/CVE-2020-28916.patch            |  48 +++
 .../qemu/qemu/CVE-2021-3682.patch             |  41 ++
 ...rict-virtual-memory-usage-if-limit-s.patch |  25 +-
 .../squashfs-tools/files/CVE-2021-40153.patch | 253 +++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   1 +
 meta/recipes-extended/bash/bash.inc           |   5 +
 ...ng-make-update-neighbours-work-again.patch |  79 ++++
 .../iputils/iputils_s20190709.bb              |   1 +
 meta/recipes-extended/tar/tar_1.32.bb         |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../libsndfile1/CVE-2021-3246_1.patch         |  36 ++
 .../libsndfile1/CVE-2021-3246_2.patch         |  44 +++
 .../libsndfile/libsndfile1_1.0.28.bb          |   2 +
 meta/recipes-sato/images/core-image-sato.bb   |   1 +
 .../apr/apr/CVE-2021-35940.patch              |  58 +++
 meta/recipes-support/apr/apr_1.7.0.bb         |   1 +
 .../curl/curl/CVE-2021-22946-pre1.patch       |  86 +++++
 .../curl/curl/CVE-2021-22946.patch            | 328 ++++++++++++++++
 .../curl/curl/CVE-2021-22947.patch            | 352 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   5 +-
 .../libgcrypt/files/CVE-2021-33560.patch      | 109 ++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |   1 +
 .../libsoup/libsoup-2.4_2.68.4.bb             |   2 +-
 .../nettle-3.5.1/CVE-2021-20305-1.patch       | 215 +++++++++++
 .../nettle-3.5.1/CVE-2021-20305-2.patch       |  53 +++
 .../nettle-3.5.1/CVE-2021-20305-3.patch       | 122 ++++++
 .../nettle-3.5.1/CVE-2021-20305-4.patch       |  48 +++
 .../nettle-3.5.1/CVE-2021-20305-5.patch       |  53 +++
 .../nettle/nettle-3.5.1/CVE-2021-3580_1.patch | 277 ++++++++++++++
 .../nettle/nettle-3.5.1/CVE-2021-3580_2.patch | 163 ++++++++
 meta/recipes-support/nettle/nettle_3.5.1.bb   |   7 +
 ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ++++++++++
 meta/recipes-support/vim/vim.inc              |   2 +
 scripts/lib/wic/partition.py                  |   2 +-
 48 files changed, 3423 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-12829_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27617.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3682.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch
 create mode 100644 meta/recipes-extended/iputils/iputils/0001-arping-make-update-neighbours-work-again.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_1.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-3246_2.patch
 create mode 100644 meta/recipes-support/apr/apr/CVE-2021-35940.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22946.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22947.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2021-33560.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-1.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-2.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-3.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-4.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-20305-5.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_1.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.5.1/CVE-2021-3580_2.patch
 create mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch

-- 
2.25.1

