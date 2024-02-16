Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC763C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 20:05:21 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.8030.1708113919123099238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 12:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBbG7Ncn;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7810827e54eso147247985a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708113918; x=1708718718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWu89q9OivQiinLgwf7YaCvs+NYhvn6U/4iBZaPPrB8=;
        b=OBbG7NcnCY6jHFMp7QY1PtC6TFiLOC9G38gUIZRIcqd21V4rEuzcWgNtRL8FBqHEwZ
         9JMUv7YuCRkggQJNRprY5JtRWkOf0UaCvmAbmOtbaYuAIlyRe3hvgx1PQPbwl6KZqFoH
         m68JWtN4RNmN4anHOkVOvVISGMlP6AcTtXcP9N4HM3PLyO56LKqQt6GIpYTbZpHGx0UU
         AmIHxLYAMXYw+lcMySMMpMQ2LYix/mtlZqzjjVvQSG/iIEHZ5rRHxQX+La/30GE/rS0Y
         CNCWgj4psNkrNgSj31w06GYvBBrp2/lTwwhyHjKwXXErE+qeWjvFJx343Kabx6UBoXni
         c6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708113918; x=1708718718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWu89q9OivQiinLgwf7YaCvs+NYhvn6U/4iBZaPPrB8=;
        b=rm7T8s6JrN8R2sKNInvZgn9HcvBoGOvlE2GttwnOKoRDvjxbSzJdH34XoNSQuPwVYN
         W7G8WQDm5QQJoXaQ80PEFP/pk/tgKpcnEQaZ0HNMpEqHJMO1R1y+1Ntt26Tjd5V0xd1g
         2dqh1aSstuMUcdD7P/XJwZ9nKmtElHpFtImaRn8le1uN79x+wxBRpEnXe5hYLypRzHSC
         etK+08VfveDALkErifB2Dy8mJXIp7XjMx0WaXqJ+tjuYISFFzHT5uxVD7Dfpp9/W4iDc
         9rE+tW1pud7D2xPXKJUkK+ilUUbMm2ESfjoIG6WZoCZPwZmFOsblXGGzIw4yKxdWwvqg
         5vLQ==
X-Gm-Message-State: AOJu0YxwGkkhxTrzIqDUoGaPewQNYlj+OwhN9D1VCQAg3GVogN0t+A5U
	hIVYW6WNlnmCrEabtpl9FvIgjpFgaQfr9Dt5nmVjqCRWu1vVQwLb
X-Google-Smtp-Source: AGHT+IGfAJs6sOJvFqqB44FIn2neQclmMo7vq/KxaHjF1n3cpEVzPQT5bVFVsouMuluDn3Ump9eYzw==
X-Received: by 2002:a05:620a:530c:b0:787:1de4:77a1 with SMTP id oo12-20020a05620a530c00b007871de477a1mr5390499qkn.67.1708113918063;
        Fri, 16 Feb 2024 12:05:18 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id vu21-20020a05620a561500b007872e92ff64sm246046qkn.63.2024.02.16.12.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:05:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto/6.6: pull request
Date: Fri, 16 Feb 2024 15:05:13 -0500
Message-Id: <cover.1708113821.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195802

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the v6.6 changes separated out into a smaller pull request
that we can test for the upcoming feature freeze.

Cheers,

Bruce

The following changes since commit 33255c6af06bcb288dc7075f19f9036e4a9c8d81:

  llvm: Upgrade to LLVM-18 RC2 (2024-02-16 15:14:26 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.16
  linux-yocto/6.6: update CVE exclusions
  linux-yocto/6.6: qemuriscv: enable goldfish RTC

 .../linux/cve-exclusion_6.6.inc               | 28 +++++++++++++++++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 4 files changed, 45 insertions(+), 23 deletions(-)

-- 
2.39.2


