Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17F6C4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 14:42:21 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.16864.1670424135557943349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 06:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tU6YY7IB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id n3so13357510pfq.10
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 06:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGLk0DZZmpBTdErPJdkmkDU068Hhq0MQrd/BydjaVOk=;
        b=tU6YY7IByJ7llcpB5N0jARjIBCARi2aEPHL2HN/lILpxurd/A4yP1MOkX8ml8I8J1x
         D1YHXbae+egdAt9/Vy8xvr+jXRSC5Q03cR5NdTa6x1c61vsqSAquee0yrTbaRgyb1xXM
         XESohnaiFz9PQzSI0T25nOelYoDjUL0X/fz4dr8NuuCNEFoiWZdDhaxhztbj9Dh5MWDJ
         ofynpAuK95JhIdWnvT6C/KgyyA/ZUyBsIzr8GkOH+KjhjvAL2lhcVhoLvDnGZNE+NICR
         N95xsj/Fing9Cku2TMjy+0X2fsoXDlD9BtCTvNgkTy+aBy8xiFB0gUYJsrEmBZSz1CPW
         gDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGLk0DZZmpBTdErPJdkmkDU068Hhq0MQrd/BydjaVOk=;
        b=eVjyO+rJdWEGd9BPB7BvX/+3G5RFGj1NxQXI70/DnsfLBhrh3cw5HgtueLWnT2xur+
         rN96wTVbsJc4O9U2EXve6W46Mza5AXLtHIy5SOuAnCZlag51rCLs+Yh2RKJRStH1op76
         yrpgHS/vcG7MMudXyWS1lKBBvw+th7cFaLbFMU3WeKqZ5+lcM4QQLldPzLhGtFFGwhtS
         z+3fdFj2WwtNYRenULSyYDlRquxawyO93OP34E0aCXA3RV/CPF+jjvAc4fVaiXGcwt3g
         mFGNKfEQLTvLS+WHg07fMbuhkVCcmgvQylqZOvqKyzSNhB8aPd6XbwgP4tT10KbfCn1K
         5yIg==
X-Gm-Message-State: ANoB5pls2mQWR/bMtxSDVhy7Pek9d4jokicQzSiU8LZZDhPxrWtrkiXF
	N/3a/Y9W6CSD8y8/IDIRrh5Pz4KZEuxABvmvvEMNvw==
X-Google-Smtp-Source: AA0mqf4DwJph2jh/hdtGRqHX1/l/pjhZNblvUf1ye8y+qFaJDSf3D9n2sIa/ICeONla7RoetqXLGwg==
X-Received: by 2002:a63:ce0e:0:b0:457:dced:8ba9 with SMTP id y14-20020a63ce0e000000b00457dced8ba9mr68981596pgf.221.1670424134420;
        Wed, 07 Dec 2022 06:42:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w4-20020a634744000000b004786c63c21esm10490305pgk.42.2022.12.07.06.42.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 06:42:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/22] Pull request (cover letter only)
Date: Wed,  7 Dec 2022 04:42:07 -1000
Message-Id: <cover.1670424077.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 14:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174358

The following changes since commit 30cdb7fbec8e9cf5c5a25e28a1102fa562a7f6c2:

  create-spdx: default share_src for shared sources (2022-11-25 06:16:14 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Bruce Ashfield (11):
  linux-yocto/5.15: update to v5.15.74
  linux-yocto/5.15: update to v5.15.76
  linux-yocto/5.15: update to v5.15.78
  linux-yocto/5.15: fix CONFIG_CRYPTO_CCM mismatch warnings
  linux-yocto/5.19: update to v5.19.16
  linux-yocto/5.19: update to v5.19.17
  linux-yocto/5.19: cfg: intel and vesa updates
  linux-yocto/5.19: security.cfg: remove configs which have been dropped
  linux-yocto/5.19: fix CONFIG_CRYPTO_CCM mismatch warnings
  linux-yocto/5.19: fix elfutils run-backtrace-native-core ptest failure
  kern-tools: integrate ZFS speedup patch

Chen Qi (3):
  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild
  dhcpcd: fix to work with systemd
  resolvconf: make it work

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20221012 -> 20221109
  linux-firmware: add new fw file to ${PN}-qcom-adreno-a530

Enrico Jörns (1):
  sstatesig: emit more helpful error message when not finding sstate
    manifest

Narpat Mali (2):
  ffmpeg: fix for CVE-2022-3964
  ffmpeg: fix for CVE-2022-3965

Polampalli, Archana (1):
  libpam: fix CVE-2022-28321

Qiu, Zheng (1):
  tiff: Security fix for CVE-2022-3970

Tim Orling (1):
  mirrors.bbclass: update CPAN_MIRROR

 meta/classes-global/mirrors.bbclass           |   3 +-
 meta/classes-recipe/kernel.bbclass            |   8 +
 meta/lib/oe/sstatesig.py                      |   6 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...mprove-the-sitation-of-working-with-.patch |  82 +++++++
 ...01-avoid-using-m-option-for-readlink.patch |  37 ++++
 .../resolvconf/resolvconf_1.91.bb             |   9 +-
 .../pam/libpam/CVE-2022-28321-0002.patch      | 205 ++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |   1 +
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 ...20221012.bb => linux-firmware_20221109.bb} |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-rt_5.19.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 .../linux/linux-yocto-tiny_5.19.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 meta/recipes-kernel/linux/linux-yocto_5.19.bb |  26 +--
 ...c-stop-accessing-out-of-bounds-frame.patch |  89 ++++++++
 ...c-stop-accessing-out-of-bounds-frame.patch | 108 +++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |   6 +-
 .../libtiff/files/CVE-2022-3970.patch         |  39 ++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   1 +
 22 files changed, 629 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
 create mode 100644 meta/recipes-connectivity/resolvconf/resolvconf/0001-avoid-using-m-option-for-readlink.patch
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2022-28321-0002.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221012.bb => linux-firmware_20221109.bb} (99%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch

-- 
2.25.1


