Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098ACC433FE
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 22:32:36 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3193.1643063554479456011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 14:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UHynm5CS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id c3so17294860pls.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 14:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkFdrzmhb5OLstw9aCQWGhdIPN+ucg1iQp7ng72MCUg=;
        b=UHynm5CSeQ0s3d6pig9Hpo5oDDTvUdhbKWFU3ztOuuCBVf7kHYAmFsAtITQ+iDznvG
         FbPMmu3Pasi/eL5sjUNUD7UUErg2A+R496rxF6YVBC9nLOBlDsTnde3hbJgvnV5WgndV
         jV5FHLX4FNNdlG667hzFgX8SlUlgmPQgBF7wWmBYW5Akr8IgXQbGCjIIKE+PKIODOSlX
         ioK9sc0qeev2CFeggbAQMdQhFhmB+d1U4JFI5oQuUdnNwfqQPjhKVeCSYgtgBpIJAMyp
         /87zH1tJI8vNAQU3qMWHtkY+4mFdWPmiMU52BwLIFamddRfXh9imUEHZU1ThyamYWVm2
         llAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkFdrzmhb5OLstw9aCQWGhdIPN+ucg1iQp7ng72MCUg=;
        b=dCAR200hOCUfcMsB3HOs1Y8vvEIEabUKd+8ZFY8ElTXfMbS3lcceckozNS3YUkAaLa
         MMrPrWjJSY4jIljMrUwwQBvwMiEz6p0KdfgiFEWyBxjK4sOHH3vF85s4pcQt/Rm0SFqF
         SxpzegFlXkkjXvdyIRsXWGKhLxGDEJwhTesyr16csMHyA9UYd45uzGlTEvuGtl6OiqPT
         BqxuRw2dK05w/tzO/uD3yihn599OHz3MG7kuh92pRgbWocMP1IT492dcW4DBIEjo71SI
         LgG6G0zjJEFWBZtua+g48Xu2ph/qmxyWGjgKsr/BVDNjpydq+cL+Q6ZGJnetsgPNGicW
         RP+Q==
X-Gm-Message-State: AOAM533/gmGUNw1nOoEJIZkl2ZV9gnaaWXBxd/nMILl89OzPUpokWaX6
	C4Vo93wXoLCgJR6bvD2aN0bCmwpOte1njH7WhSE=
X-Google-Smtp-Source: 
 ABdhPJxpI7izdxMTiGA3mvv/6BnGGn719ODtYQNgrvuSwQR2CZyqCkyGkMIGiVgvBQRBvhO1trL9xA==
X-Received: by 2002:a17:902:f549:b0:14b:4b27:48d1 with SMTP id
 h9-20020a170902f54900b0014b4b2748d1mr7271799plf.52.1643063553022;
        Mon, 24 Jan 2022 14:32:33 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y42sm8874753pfw.157.2022.01.24.14.32.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:32:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Mon, 24 Jan 2022 12:32:24 -1000
Message-Id: <cover.1643063455.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 22:32:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160903

The following changes since commit 01f256bc72fb45c80b6a6c77506bc4c375965a3a:

  glibc: Add fix for data races in pthread_create and TLS access (2022-01-12 04:37:31 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.169
  linux-yocto/5.4: update to v5.4.170
  linux-yocto/5.4: update to v5.4.171
  linux-yocto/5.4: update to v5.4.172
  kernel: introduce python3-dtschema-wrapper

Kai Kang (1):
  speex: fix CVE-2020-23903

Marek Vasut (1):
  Revert "weston: Use systemd notify,"

Richard Purdie (1):
  lttng-tools: Add missing DEPENDS on bison-native

Steve Sakoman (3):
  expat fix CVE-2022-22822 through CVE-2022-22827
  expat: fix CVE-2021-45960
  expat: fix CVE-2021-46143

 meta/conf/distro/include/maintainers.inc      |   1 +
 .../expat/expat/CVE-2021-45960.patch          |  65 +++++
 .../expat/expat/CVE-2021-46143.patch          |  43 +++
 .../expat/expat/CVE-2022-22822-27.patch       | 257 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   3 +
 .../wayland/weston-init/weston-start          |  12 -
 .../wayland/weston-init/weston@.service       |   6 -
 .../weston/systemd-notify.weston-start        |   9 -
 .../wayland/weston/xwayland.weston-start      |   3 +-
 meta/recipes-graphics/wayland/weston_8.0.0.bb |   6 -
 .../python3-dtschema-wrapper/dt-doc-validate  |  20 ++
 .../dtc/python3-dtschema-wrapper/dt-mk-schema |  20 ++
 .../dtc/python3-dtschema-wrapper/dt-validate  |  20 ++
 .../dtc/python3-dtschema-wrapper_2021.10.bb   |  17 ++
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../lttng/lttng-tools_2.11.5.bb               |   2 +-
 .../speex/speex/CVE-2020-23903.patch          |  30 ++
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |   4 +-
 20 files changed, 500 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-45960.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-46143.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-22822-27.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch

-- 
2.25.1


