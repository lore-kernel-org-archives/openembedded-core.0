Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBE3CCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.6454.1655130124635342818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rF19z89U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id e11so5885160pfj.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iW11VOdKQO5slxaOY2lb3FSblTiy5z/1Hoguy2jrVnk=;
        b=rF19z89UTC4r5I4lijZCLGNRx/ofVbh8DqvfGycdhpSAZQWzx+lTX8bNeqFFsEx+P1
         Uar6Q01pH71bfcv0gBDGSOE0iyPpTu9fDkVm+6K5nNj7wV9aOAOdMGk+uDYpxM3HVDu0
         nEZ+WESS8myyuWaCv/OIV/OESP90WRw4mQb8lbNHqRIoHoYmgEncn9A22Zl8rdW3C31r
         VxRFNrJnolDSrnaqR8N9G/VSNXqY66AaEMpP2/79fRsM9hs2DNvsYZscwHe37sSh0K40
         1rCeeRkL0LcSXJGwR3Khx+J8YJBA67mUbrra7tJ5cHfXOQTKz9dl4CBZIBNzhXTX/qck
         KGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iW11VOdKQO5slxaOY2lb3FSblTiy5z/1Hoguy2jrVnk=;
        b=Oi81MzSmkLySY+D/WvKBPpx4VvchxVaMzOcDyP5YdQz1lUmF4HKQzbvMYYj6HnoFcZ
         /cBQSrzIlW5yCdKMltXd2seLqVZ01PoX05z+pbDNioooT32JAoYkI0MzkBSnzKrezCHG
         CQhKdMIhCkM+amtXUTOyg3u5CCuz84CbgTQWQx8OG1265YoFgs1Hlgg1hasmaa+xDRno
         kff1L/bIx1++vO2sKt+DiDVc/RUFDU4iTbH0KorNTY5s7Q/V7z206805uqQPo2LULKp8
         O3IhJK/UIPkytYqThuJ+dycBCyLOqWIaouuWLm9DosYhp6jMML6/oukMFETnTh5+/dtX
         xioQ==
X-Gm-Message-State: AOAM531aZEKhZtq8JB8r7tQgQ3Fbkk5IIrIeTELHpPnBY6mcFZeR3EAI
	BUixNCpA3r8p+APtOyxKasc0v01o3mxvPqNs
X-Google-Smtp-Source: 
 ABdhPJyyrmQQb/qrVd0bOFRxBt2TfSOZ3wWfzkHaqloGcS/Dylef387LQYodflsDSyWyuq15CFzVbg==
X-Received: by 2002:a63:1846:0:b0:3fd:dd12:ffa8 with SMTP id
 6-20020a631846000000b003fddd12ffa8mr33173825pgy.337.1655130123261;
        Mon, 13 Jun 2022 07:22:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/20] Patch review
Date: Mon, 13 Jun 2022 04:21:32 -1000
Message-Id: <cover.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166845

Please review this set of patches for kirkstone and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3774

The following changes since commit 6ade2bfdd9297896b9f251dd62f55e461fef1a3e:

  rootfs.py: find .ko.zst kernel modules (2022-06-06 05:32:51 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (8):
  linux-yocto/5.15: bpf: explicitly disable unpriv eBPF by default
  linux-yocto/5.15: update to v5.15.43
  linux-yocto/5.10: update to v5.10.118
  linux-yocto/5.15: Enable MDIO bus config
  linux-yocto/5.15: cfg/xen: Move x86 configs to separate file
  linux-yocto/5.15: update to v5.15.44
  linux-yocto/5.10: update to v5.10.119
  lttng-modules: fix build against 5.18-rc7+

Davide Gardenal (1):
  baremetal-image: fix broken symlink in do_rootfs

He Zhe (1):
  lttng-modules: Fix build failure for 5.10.119+ and 5.15.44+ kernel

Jiaqing Zhao (1):
  systemd: Correct 0001-pass-correct-parameters-to-getdents64.patch

Martin Jansa (3):
  lttng-modules: fix shell syntax
  buildhistory.bbclass: fix shell syntax when using dash
  rootfs.py: close kernel_abi_ver_file

Pavel Zhukov (1):
  bitbake.conf: Make TCLIBC and TCMODE lazy assigned

Richard Purdie (3):
  sanity: Switch to make 4.0 as a minimum version
  perl: Add dependency on make-native to avoid race issues
  glibc: Drop make-native dependency

wangmy (2):
  iso-codes: upgrade 4.9.0 -> 4.10.0
  lttng-ust: upgrade 2.13.2 -> 2.13.3

 meta/classes/baremetal-image.bbclass          |  7 ++-
 meta/classes/buildhistory.bbclass             |  2 +-
 meta/classes/sanity.bbclass                   | 30 +---------
 meta/conf/bitbake.conf                        |  4 +-
 meta/lib/oe/rootfs.py                         |  4 +-
 meta/recipes-core/glibc/glibc_2.35.bb         |  2 +-
 ...ass-correct-parameters-to-getdents64.patch | 13 ++--
 meta/recipes-devtools/perl/perl_5.34.1.bb     |  2 +
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++----
 ...emove-unused-tracepoints-v5.10-v5.15.patch | 44 ++++++++++++++
 ...g-Append-prev_state-to-tp-args-inste.patch | 59 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  2 +
 ...ttng-ust_2.13.2.bb => lttng-ust_2.13.3.bb} |  2 +-
 ...iso-codes_4.9.0.bb => iso-codes_4.10.0.bb} |  2 +-
 19 files changed, 169 insertions(+), 80 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_2.13.2.bb => lttng-ust_2.13.3.bb} (95%)
 rename meta/recipes-support/iso-codes/{iso-codes_4.9.0.bb => iso-codes_4.10.0.bb} (94%)

-- 
2.25.1


