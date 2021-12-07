Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13759C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:52:12 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.624.1638895931571920988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bxkZMwv9;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id m192so15270694qke.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3jB9sEZeqOs3IkRAl8f0R6/Vi5q1JoaR7LuSCUB19RY=;
        b=bxkZMwv9GU5FnAlwNrhCLPn+plmXBs3T+ZIVlYkrzx8/1lgJ7Hlrym+pxXKEGW3EIw
         XxF9nC/aW9GpaBxIW829XU7dvmTCIuzbH1777WoPC7Dzcgjff8uMIw/cs8H8W4aFSINl
         z2RuiB0vmp+IlBJr2B9Gy3kEqrMxuSunp9K3jvsi3o4QpwfMrIoU4IvDa/doeWlTGFIZ
         1r/TS5GzId4/9r7roQIitgNTjR5y6adZY4DTX7Qk7CZEmmRh2ZZOV/lqdm9+tNPtJ36/
         hAkWfF8UW98fTwfL9lOMpWya2inilmPLwLX+4tmwcb0+BBeR/sEIBFE+OsTMnGgkWWxX
         EwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3jB9sEZeqOs3IkRAl8f0R6/Vi5q1JoaR7LuSCUB19RY=;
        b=XdzEeX3CN8IRjQ7I+ZhcyacNP1Te7p5S+xgdSOOWHjPkmCbD9mY0oKyHqeCTCNtJJ1
         LSd4oBI7Kc9iasZN/3NgS3cJwI1sNBdSNOKgXP8c6NADh9Sxx9GU79kXNGu+PdJLCMQx
         EYhA9kdH6sj31CH398/kxe6gJSg+6Lf+PWFOXdaotSPi7+uu82ahF3IHo1TtE6pXeaLQ
         FEobAX++fD6VltsZ9uo7xLf9Q9wMZHBrkKbRwZiiKuv1zndQIpq08epS2aSsDSph+wEu
         EvS/tqOFvpX9bks6JWJB7+cRTv6oJRJWZRSoWnec1Y3+JKggvBglPe02jLcdNhl9W8Hg
         1Jyg==
X-Gm-Message-State: AOAM532neoJwGsu2EEmb+FyKkovOE4pULdynuVhQ8njms4mjRfFVeyza
	VTisDUbSnkfXuPcka/wyguY=
X-Google-Smtp-Source: 
 ABdhPJzfN3l8k7ZV7Uu18scSroh2Fipn0ewmS0G5oHy0MndQp88GT7Z/FIoMWSNZcwvglyJRjB4JQg==
X-Received: by 2002:a37:98d:: with SMTP id 135mr345373qkj.166.1638895930487;
        Tue, 07 Dec 2021 08:52:10 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v9sm57536qkf.90.2021.12.07.08.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:52:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel: consolidated pull request
Date: Tue,  7 Dec 2021 11:52:01 -0500
Message-Id: <cover.1638895732.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:52:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159315

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable updates, a -dev kernel branching tweak
(as discussed on the mailing list) and the kernel tools that I presented
during the YP summit.

I also have patches to make 5.15 the default kernel for qemu*, but I
wasn't sure if you wanted those before -m1 or not. Let me know if there's
interest, and I'll send them along.

Bruce


The following changes since commit 6245f65fa300f7f3e4cc13c7fe272a9d16668485:

  gcc: Update patch status submitted->backport (2021-12-06 11:21:52 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.15: update to v5.15.5
  linux-yocto/5.14: update to v5.14.21
  linux-yocto/5.10: update to v5.10.82
  linux-yocto/5.15: update to v5.15.6
  linux-yocto-dev: use versioned branch as default
  linux-yocto-rt/5.10: update to -rt56
  kern-tools: bug fixes and kgit-gconfig

 .../kern-tools/kern-tools-native_git.bb       |  4 +--
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 11 files changed, 62 insertions(+), 62 deletions(-)

-- 
2.19.1


