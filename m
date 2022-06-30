Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15658C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:17:03 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.29691.1656616619559713249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JZ7rcRxc;
 spf=pass (domain: gmail.com, ip: 209.85.222.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id f14so15282841qkm.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHCuJ8bLoePJ32SBW1O2jz1jwAlnAwD0XQpLyf+SWbs=;
        b=JZ7rcRxccP7ty9fsYn7cHkDX6VKSHsiXcTzFGjXMqRFM2yYp0x+LyGFihVD6qpI44O
         tQvGgMaoHQXDk+zzLgCUaBQD8+Jw4X84AwZNR5I9gIjesGQFe85ggM1jPVFdtGadoLdE
         nY7WXWiBpU800m5uqiMS+sCqLzvm1amxIhVtlgUivS+ld5Q/Vw/alxkz9q33ZBtN0G/l
         0bYVx87H7aF5hv/0yfePs86dFW+Ea1orcLavn7B+Lvv5gzcAiQ9DSdQ5K0bk3un8GMeB
         J30wJh8EFcyKo3MxVLUTXX81/PQnb8bHjLctUJHRNFSaxwHrREqJRc44PrY1+Wj07gbC
         F0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wHCuJ8bLoePJ32SBW1O2jz1jwAlnAwD0XQpLyf+SWbs=;
        b=HPLvsNVBm58luHwsegkwLEFcKkUNhgyjL7ZTuIRHcog+9bcFMfjgJDMsGnZm2DezLR
         Sya1e5tVN/s42Y/9VtKBsDJyf4cEJqNdrddyaOwLVtdwMW7k6+DXZFvupD2kXA+GbSq/
         7qz46ZBIfJrPvkj1/t9iuzQMjIheoysJ+gD5GfMGvOhgG1JALOKjNvPrJjEfURKg7rgL
         bqTutE4M6xy+6rJvRHiGTKV7humkU2juP3uejyJChCmnVHcW/p9dTHYXYaN0wQv2IZFJ
         JjOOxq4rfjk0umD7kBz3wiTOVknHennz6AQO0ixQbDO+yd2cXmOPMcErW1ZR9dmJXsZL
         5bbw==
X-Gm-Message-State: AJIora+BkEgYGEZ4rnCZaqAKrnbqt/Ng07DwQvW/329/ex9nCUSiEFxh
	d1taw4VRVUoNlvXlu8KQbhD6nIkHU4FpEA==
X-Google-Smtp-Source: 
 AGRyM1t3GGp6CKGIR+SvrGamXqbkorrjX9bePBb0Morn19hQ9wdVyLcz3by6VEg3SUSppHK00FqGIQ==
X-Received: by 2002:a05:620a:29d0:b0:6af:1bc9:38cc with SMTP id
 s16-20020a05620a29d000b006af1bc938ccmr7531105qkp.136.1656616618479;
        Thu, 30 Jun 2022 12:16:58 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm15818291qkp.124.2022.06.30.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:16:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto: consolidated pull request
Date: Thu, 30 Jun 2022 15:16:48 -0400
Message-Id: <cover.1656616115.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:17:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167434

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

With conference travel and issues with meta-virtualization, I've been
behind in sending this out .. but I have been queueing changes, I just
wanted to be around in case something breaks.

Here are the -stable updates and the start of my efforts to bring
5.19 in as the new reference kernel for the fall release.

lttng-modules needed it's normal tweaks to work against the 5.19 source,
but otherwise, nothing significant has popped up.  I have other parts
of that uprev under test (libc-headers, systemtap, etc).

Cheers,

Bruce


The following changes since commit 012c046628990ccb230dd92c32f470a087ff332e:

  dev-manual: improve screenshot resolution (2022-06-30 17:09:51 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.10: update to v5.10.121
  linux-yocto/5.15: update to v5.15.46
  linux-yocto/5.15: update to v5.15.48
  linux-yocto/5.10: update to v5.10.123
  linux-yocto-dev: bump to v5.19-rc
  linux-yocto/5.15: drop obselete GPIO sysfs ABI
  lttng-modules: fix 5.19+ build

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 ++--
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 +++++++++++++++
 ...ags-parameter-from-aops-write_begin-.patch |  76 +++++++++++
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.4.bb             |   3 +
 11 files changed, 349 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch

-- 
2.19.1


