Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02529E6FE36
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 17:45:57 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.5008.1725644748583084592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 10:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X4xAeC/2;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a7ff6c4fd0so146532285a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725644747; x=1726249547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPb0aoHV69FlDb9rvxjFITdbZHC0iS7dkxXuZDkyoyY=;
        b=X4xAeC/2RKEoSw6eO+C7gAjWKIqdv4pD+EyzEtSq/l+FpCSQ0aXEGYpyXwNKJt3Gmm
         7RWpLEUKIfgYCrdbPaNQ6Fo/X+4Sh4N4eDv8Yskl8zxwutJ2JunsnpWWIAr4gKv+8d4K
         4CW4ZlBI56IXJ1gw42EefEPf8X/pUGF2C5hATRbsbe3xBBUoTR2WsbjLP0QUeV0Hd98t
         NIM7YyxcWi4NfKzXfMylqgkPgZVV5TXY86E6k0eoNcZUGPzmJrQR2DaEwF3KRNbSY2br
         rxut/cVx+Ob3M/mh+IpiHZ1YKzDoByo9tFNijwzDPsSfbmA9HNISwHPNdR79Qpl+t7fh
         3Vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725644747; x=1726249547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPb0aoHV69FlDb9rvxjFITdbZHC0iS7dkxXuZDkyoyY=;
        b=USITJ7qIOX76rZ+oPE8kkF1l4jO7zzxvBKFxfH4AyXixvNaidIEyPGQ3Ouo8x8nBs1
         JMnsQONudZEYWPPO6CNf08Ik44CBo/COfdFfyeUoXIPTd4FMIcC/iTUmELjM9YWLTAwr
         6YS1mR+gN3JRqs1V/9ojJzIeAZh+L76ZXauIP9z1c4KLNAy0KvuRA1rojxm9KErJgcYX
         XRz2JfkAJSu4M7IQHrypbBQnFE0DCY0OW0XZ0YMJbWBh4z+ZuGQF2+DkZ/rLXbrFxPDO
         zgrpZaTXGOXbK7g9driCWZ9YPpiyiVZ01LhgUkLcKxzN5PJTVImkk7KO5PlksI9NXPD2
         +NBQ==
X-Gm-Message-State: AOJu0Yx1YwoBggnLvkkHx5gCjZL4GrNcllzPGm0kAv5tT8TZhwJgm1Ue
	cTdhCXUjI1IW4KsAR66oOwv0rk4XeBcUVoFmuWLWyiENTm3X7rb2
X-Google-Smtp-Source: AGHT+IFKm/nbaipAzxnNDqvRVADH1p7Xni5+Ocv483Scx3A5UGsJXZY2yvFS24hgTjjRFpShbOlkBg==
X-Received: by 2002:a05:620a:2415:b0:7a1:40b9:10d with SMTP id af79cd13be357-7a997360950mr382987785a.52.1725644747425;
        Fri, 06 Sep 2024 10:45:47 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a98efea9c1sm188589385a.75.2024.09.06.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:45:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
Date: Fri,  6 Sep 2024 13:45:39 -0400
Message-Id: <cover.1725644584.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 17:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204281

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable updates for the kernel's in master.

I'm continuing to watch 6.10 in case we need to jump to 6.11 for
the release.

-stable updates for the other branches will be sent shortly as
well.

Bruce


The following changes since commit bd2159719c08c101a25a5012fc684163135653e6:

  patchtest: test_non_auh_upgrade: improve parse logic (2024-09-01 12:32:37 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/6.6: update to v6.6.47
  linux-yocto/6.10: fix CONFIG_PWM_SYSFS config warning
  linux-yocto/6.10: update to v6.10.7
  linux-yocto/6.10: update to v6.10.8
  linux-yocto/6.6: update to v6.6.49

 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 6 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.39.2


