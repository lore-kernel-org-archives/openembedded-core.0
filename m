Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B4BC00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 23:03:51 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.12245.1661123025566133871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 16:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=KjBPaNNh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 s3-20020a17090a2f0300b001facfc6fdbcso8930255pjd.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=1+NcgmdHkET4cjjd/bkfBhWCJM5KzMMhRo9ImOn/w1Y=;
        b=KjBPaNNhxa7KWUqqbrOByWxBch3GlKl3SpApC5zrax8UmJJ6vBJuNA6SNuacH7JQEm
         uneGiE8LZKIsbnrI13+Fnb0aHodH01nl/+i/l5W/aZ6LK7/2XTqAc+GNT6TK5nOTY8rE
         wQ1Ro5erDsyWV2bF+OO/6EOcyB5QlcAC06JPMIa/aVOGQKWRtvVzRCxH1lxe0DE5Oksr
         xFjCkGqXFS9pzuf58IjVRNb6bkzMnMtTh8L2TGKRQ6sLgyS1Vq4z+Kzsw0t4V2EH2WBd
         8iuET1GWTHjGSZ2L06AI2xSa1YBsMphaSYFNKTypSMbOjozOBekknChk75kQ5ZdLX8Wg
         rzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=1+NcgmdHkET4cjjd/bkfBhWCJM5KzMMhRo9ImOn/w1Y=;
        b=SahKRuSDn6DomaeYSDIp9wyFXQvSS7uKHeso56PHeciGWvRM5cdrH+I9WWBmHk8ht4
         V+t9JMgCSozVWb37P4AtPHEzbmRCM8jcvLPY10n/M0i0am4Flt/N0MK10btbv1PzT5uU
         t4ds4QSaC0gZhrHk8w24Jc49GXT5Eus9LsobBkBn0YVdbKgcdOL939C4PBNiltQIU3oP
         +fNe1jQSVi5CGsvwSjwj0T5untCOF4aABdSOnx2zaYPvEnlYd4NIAJbDbVOP+c+9Zvmh
         TxNVy1hlYXBXzinEo8bhzDj4abqEc2SiqkGlArzOyjRsH0Bp65L4ZV0CxU5ONayWqZ01
         m/UA==
X-Gm-Message-State: ACgBeo0Jh+yZV7IRzCU5+/y3msg96QP7gLDWhi/lOSSE5JrDhcNnJvBi
	StKjgzRLtunWRac3bY7jJs0LknePgC5OHbZC
X-Google-Smtp-Source: 
 AA6agR78YzXHYUG9HEy6IpqHbr6Yuhiv2JXwSNd72MHuby5+bhEgoINXFyFymBfi/813ebnlyv/Hiw==
X-Received: by 2002:a17:902:b48f:b0:172:b57e:f0ff with SMTP id
 y15-20020a170902b48f00b00172b57ef0ffmr16750558plr.25.1661123024205;
        Sun, 21 Aug 2022 16:03:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 nb16-20020a17090b35d000b001f516895294sm6754356pjb.40.2022.08.21.16.03.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 16:03:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Sun, 21 Aug 2022 13:03:25 -1000
Message-Id: <cover.1661122933.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Aug 2022 23:03:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169656

The following changes since commit ac6ea1a96645d2a4dd54660256603f0b191bb4d3:

  gstreamer1.0: use the correct meson option for the capabilities (2022-08-10 05:04:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  linux-firmware: update 20220610 -> 20220708

Dmitry Baryshkov (1):
  linux-firwmare: restore WHENCE_CHKSUM variable

Hitendra Prajapati (3):
  qemu: CVE-2020-27821 heap buffer overflow in msix_table_mmio_write
  gnutls: CVE-2022-2509 Double free during gnutls_pkcs7_verify
  zlib: CVE-2022-37434 a heap-based buffer over-read

Ming Liu (1):
  rootfs-postcommands.bbclass: move host-user-contaminated.txt to ${S}

Pascal Bach (1):
  bin_package: install into base_prefix

Randy MacLeod (1):
  vim: update from 9.0.0063 to 9.0.0115

Richard Purdie (2):
  vim: Upgrade 9.0.0021 -> 9.0.0063
  kernel-arch: Fix buildpaths leaking into external module compiles

Shruthi Ravichandran (1):
  initscripts: run umountnfs as a KILL script

 meta/classes/bin_package.bbclass              |   3 +-
 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/classes/rootfs-postcommands.bbclass      |   2 +-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 .../zlib/zlib/CVE-2022-37434.patch            |  44 +++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-27821.patch            |  73 +++++
 ...20220610.bb => linux-firmware_20220708.bb} |  14 +-
 .../gnutls/gnutls/CVE-2022-2509.patch         | 282 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 meta/recipes-support/vim/files/racefix.patch  |  33 --
 meta/recipes-support/vim/vim.inc              |  10 +-
 13 files changed, 418 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220610.bb => linux-firmware_20220708.bb} (98%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch
 delete mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.25.1


