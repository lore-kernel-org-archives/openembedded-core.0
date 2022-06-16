Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFDBC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 02:35:10 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web09.13453.1655346900760193904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 19:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=58Qf/zdr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id w29so9310pgl.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 19:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1PgQUsBDtrUpBq10yhvQkrleDn24uPFy5FRxpmubCAs=;
        b=58Qf/zdr7wOl3ZN+f0igLEZGa2xen2QotrcrosMt66j/eTipxRAxGnL21Obq+jCRjV
         qgG72WswPZs3NzjBsBoTBaSTKxJZbRylXX6thsE2lVj4bA1Ebbpvw7O7xpRzpHToq1X4
         mAcfeyoLGXbAesr2fZ8gXEhX46KsVFzaNV91svZff5fOqBJnigwMP9lyHfGqTjARL8Ys
         jAhQn7zXdIBjbeP3STIH3O4opvcyHwFHupAX46oZShdLSClBfzuct4u+SMHoxiGgMGJd
         C5iQFspsYAA9XgzF87HJx3GTcGGHENasQ2QvyH5H1h78YOsKXartmID+4/9RuVD66Cuz
         IhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1PgQUsBDtrUpBq10yhvQkrleDn24uPFy5FRxpmubCAs=;
        b=bBMBbAjrb30V6qjHD7HYFsAiu2J2jmxq+o3upRjR8YN529jmfLVa3TDCvmkQcZGJUn
         fkgtRDlXJs+Q+wkMgqjHqxIH5gXxT9N1Zz8gHUmNdKUQqKEZ+kkstuNMq1KpwZVFDM+x
         ewH2Wijfjh3PuUyy3CjRJpTR10v4DkWEKM+llouNIWaBht7vthcCQrSi+Qo/devsUXVm
         qOH6YXuW3FlaPA9sp4pIHHSaDs5DI0uS3/kGLe2DNMQ6qSDXCOC0yGcbfvagy2L0R+Gt
         Sk1Pv6EcfLBvR2a56+JmYcQi+femr4fuSfTOwtNGw7MpspdX18IDw6ffbbEX4y0Aivwt
         SkrA==
X-Gm-Message-State: AJIora+LGJgIrIQ5d9r9bUeub1pfzZwRyTCaZ7jvlVY2ffNOUGu9quRG
	4I/jV/hsaYJIRDW0rDz6mO4N/p0gzq9ciECr
X-Google-Smtp-Source: 
 AGRyM1ujxGs9ipe8DWpdfUMCCR97kNLU9bb4DhGxMGfX6X/9YPyDj0lq+kjrdIe0BB4VU27gO99ETg==
X-Received: by 2002:a63:5906:0:b0:401:9ade:d138 with SMTP id
 n6-20020a635906000000b004019aded138mr2473742pgb.520.1655346899516;
        Wed, 15 Jun 2022 19:34:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a170903248b00b001618b70dcc9sm341779plw.101.2022.06.15.19.34.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 19:34:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/20] Pull request (cover letter only)
Date: Wed, 15 Jun 2022 16:34:47 -1000
Message-Id: <cover.1655346792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 02:35:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166998

The following changes since commit 6ade2bfdd9297896b9f251dd62f55e461fef1a3e:

  rootfs.py: find .ko.zst kernel modules (2022-06-06 05:32:51 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

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


