Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B034C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:02 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.11453.1641924001543514507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Npu/CD3q;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id l17so104331qtk.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GWoYZYF1dWdVUMlD50wCv/ANC1fNZ5n5TdbQaX1jokQ=;
        b=Npu/CD3qFdy/MK+CtkV5WLtLbFCytbIEEImPcDyAyfsvmoh8POvIuC2VYMwVRzZMX0
         zzsqUA+qLjEJSwE/CDHKwgSSB2aPXGXeFheXbxKRkWyoq3vNVj8U4PcKCMZv17e5i7kd
         2O5DarNggobFfeC+G7JoEBK+fmP+OGMfxHQyPkTzVe0E6ohiM9e5q4l6zJwLQTES+i75
         PJYcxe5n+/PV4SKOXnOa4PrWjGIh6JONnnh9WZfCOllBo2ANU4bRoj2skcQy8sHwP3F8
         SWcEohIRitjXERgyQzW4YZOSFM/UdxUytg1nScxXGc2tzlkptjc/jRskOQZkqGpv4uLg
         uthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GWoYZYF1dWdVUMlD50wCv/ANC1fNZ5n5TdbQaX1jokQ=;
        b=aa3CIU9rewB8ezD17qunELD2vPlQmLuAyTH8gmSLEGFsZfwadCNmIShEcZ07S7Jd/5
         9iohSZA2WISb1CMP/JJgZDWb7AXQJkBlQqr4Jx1ZFgLy2mP1UH/9zUiHEZoeqGTrAJRh
         cxwBMcUpSoIYulF76VR2HOmlO5uW8kWS2zdFdF2QIoLVzXw7QyeskPgeNBa3F4yvNAXm
         weGIxnJOiNBC+cABduTt8j44WDWRteNj+QttvKA4etBNCpSRgQvJm//IKJ/Ua7aHGMXh
         UPEAOrdeFfyce3GbHWVGUzz8QbsdCujsigRc29/hBSNd7H2ky0W63Du/9aft/5BhlXEk
         BYww==
X-Gm-Message-State: AOAM530xUxP98FOl3LNOri/hvlf0AksoyzFa+VoTocwDpfftkYTtF1fZ
	8nTD5OmlXqe3NoaKgWdbcZM=
X-Google-Smtp-Source: 
 ABdhPJz7U0Ro+oNj6JN830sCdtdgx0uuZ/C07wQKvwGbOlpIf/3Gq0XZjgLT9zexWwoitzY6q0CmEQ==
X-Received: by 2002:ac8:7fc1:: with SMTP id b1mr4637839qtk.3.1641924000523;
        Tue, 11 Jan 2022 10:00:00 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:00 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel: consolidated pull request
Date: Tue, 11 Jan 2022 12:59:48 -0500
Message-Id: <cover.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160424

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my next consolidated pull request. The -stable updates are
routine, but I've included the default version bumps and dropping
of 5.14 in this series.

My AB run showed some ping/ssh failures on sato, but I haven't
reproduced them locally. So I wanted to send the series to see if
the issue is real or not.

There are updates to 5.14 for configuration in here, followed by
removal, but I wanted to make sure the SRCREVs for that version
are fully up to date before the drop, so we can use it as a reference
for older releases and any remaining users.

We've already sorted out 5.16 in master, so I'll be moving -dev
to 5.17 in the next couple of weeks, and we'll be ready for whichever
kernel version fits the release timeframe.

I'll send updates to poky/yocto-bsps separately.

Cheers,

Bruce


The following changes since commit bd28d659b2ef6e887e4d9ff44fa7377fa802f28d:

  systemd-boot: restore reproducibility (2022-01-11 10:53:44 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/5.10: update to v5.10.89
  linux-yocto/5.15: update to v5.15.12
  linux-yocto/5.14: fix arm 32bit -rt warnings
  linux-yocto/5.15: fix arm 32bit -rt warnings
  linux-yocto/5.10/cfg: add kcov feature fragment
  linux-yocto/5.15/cfg: add kcov feature fragment
  linux-yocto/5.15: update to v5.15.13
  linux-yocto/5.10: update to v5.10.90
  linux-yocto: drop 5.14 recipes
  conf/machine: bump qemu preferred versions to 5.15

 meta/conf/machine/include/x86/x86-base.inc    |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.14.bb              | 45 ------------
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.14.bb            | 32 ---------
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++----
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 68 -------------------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++----
 11 files changed, 41 insertions(+), 186 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.14.bb

-- 
2.19.1


