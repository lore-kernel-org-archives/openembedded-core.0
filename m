Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE815C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 04:16:40 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.5203.1643948199871606611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bQqdTQdo;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id g145so3876141qke.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osdxV9dVnO04tZb+23vpUOxAXLwvi3UtqOcyvs0yzD0=;
        b=bQqdTQdo0NgVdlDDwB/ioK4T6ZRVoRlVnAW9YNfo7Oy+0zj1pQ6BBImd43UCZ2nzLK
         O60WPt+13ovtkyc+ra3+gdU6+8toyJut+/cspnrTkkAGc3twPyqwTCRTEO6zRX/0kHiS
         4+GsWUejFYlv/z78Y9RLRcQYJ6Lu95ICafTQqQoFmj56xAeSKyJrzYUR2ArxN/4FhEH4
         YVlbvuonTud3cEYDcIU2Dg6nPbI5+yjQFobexEcfGEjdr0manxD6Y/FlfHBG4HZE7/hp
         LCWY5EQLKHIQ7wEj6St4vQay57yBez8wuHCTcEnX4QHG39LQddDPzrJnfB6AzCx2MTnE
         dgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=osdxV9dVnO04tZb+23vpUOxAXLwvi3UtqOcyvs0yzD0=;
        b=l3FFNLqKT1klvyHnPpBj+DwJaAOy7j8eaSxnMyBbf/rIOPNjxS1FQMGRLaS6snGPAf
         tZrmuPZH+lgv+fAy5U/6NLG8e3ngCees3Tu6ZS0Msezqvc1t8qFAsDdDOb/Y+aLzsGuU
         lE8Y8hz9ywZAPC3r32zdH96Bw4LcY87U9r0zxNT7HTwDsTG1DfIiHm/gLAToImwWptZ/
         +3cqNAZ1qsKH0KfVmCPQUw83sPYMupXq+vhXQ7PdxwK0KnErqdn3Fmy9VK+P5zOPAr0F
         nBKx3CK+utgvAlzBkfpj3cw6ezZcXhzM8+EqiImX7P+mK4oyvs1chNK2Q18wz7axFs9T
         zbsw==
X-Gm-Message-State: AOAM530Bj4+iV6atxzcpg4clA3VM5epZZWziHpGDtZXS3HVYeXLDyw6W
	FLdtSi2bvJPdpofBiI3u8QU=
X-Google-Smtp-Source: 
 ABdhPJwwMX6mOaXsA6y1niDisLMclfeXwpsm/eu+4xnaPfS7bAxseoB6YGqlGtd+M6pIn+esU+TpQg==
X-Received: by 2002:ae9:dfc2:: with SMTP id t185mr607806qkf.663.1643948198779;
        Thu, 03 Feb 2022 20:16:38 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 u17sm515424qkp.90.2022.02.03.20.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 20:16:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated pull request
Date: Thu,  3 Feb 2022 23:16:30 -0500
Message-Id: <cover.1643947217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 04:16:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161333

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of updates. These have all been locally tested
against the pending libc-headers update to v5.16.

A little bie of everything here:

  - dev to v5.17 (Thanks to mhalstead for fixing hooks for me late at night!)
  - lttng-modules update to build against v5.17
  - the new qemuarm64-tiny support for Alejandro (I'll circle back with
    some tests for this later)
  - stable updates to v5.10 and v5.15

This gets us closer to having the major kernel release bits ready. I'll
continue to work with v5.17 and send other fixes to make sure we are
ready to support newer kernels in the LTS.

Bruce

The following changes since commit 74a8a74a553a33dc5f41939f8070d75e6d57d3da:

  busybox: Add shell arithmetic to work with poky-tiny (2022-02-01 07:32:08 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  qemuarm64: Add tiny ktype to qemuarm64 bsp
  linux-yocto/5.15: update to v5.15.19
  linux-yocto/5.10: update to v5.10.96
  lttng-modules: fix build against v5.17+
  linux-yocto-dev: update to v5.17+
  lttng-modules: update devupstream to latest 2.13

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 ...-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch |  63 +++++++
 ...-the-rq_disk-field-in-struct-request.patch | 157 ++++++++++++++++++
 ...n-fix-the-migration-stats-in-trace_m.patch |  61 +++++++
 ...s_info-to-trace_btrfs_transaction_co.patch | 103 ++++++++++++
 ...r-than-entropy_store-abstraction-use.patch | 147 ++++++++++++++++
 ...skb-introduce-kfree_skb_reason-v5.17.patch |  88 ++++++++++
 ...ename-SKB_DROP_REASON_SOCKET_FILTER-.patch |  47 ++++++
 .../lttng/lttng-modules_2.13.1.bb             |  11 +-
 15 files changed, 716 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-block-remove-GENHD_FL_SUPPRESS_PARTITION_INFO-v5.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-block-remove-the-rq_disk-field-in-struct-request.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-compaction-fix-the-migration-stats-in-trace_m.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-pass-fs_info-to-trace_btrfs_transaction_co.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-random-rather-than-entropy_store-abstraction-use.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-net-skb-introduce-kfree_skb_reason-v5.17.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-net-socket-rename-SKB_DROP_REASON_SOCKET_FILTER-.patch

-- 
2.19.1


