Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF6CC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:22 +0000 (UTC)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web12.1637.1646443521186402861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HPsbKXEJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id x62so5259595vkg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UoQjacTEt35cobKpsd3cZazgkM8EoMMmbLKb+tlQqg0=;
        b=HPsbKXEJnSekt10aIlmzvS28GdZFCtc1WEZE5MXtgF/VnDDPyA+rcGsNJZB5t4bTxT
         WZxb7avqzCgSFahGXmscnRJSim689i2CoHbbg0Rcyl/Zr1hdWTHEshzKNfMp1dhb7Puf
         EPRJtKt+fznV6XxUpsZuKzSx5VrgeuxRYBDGObJ1md9Pww1ax8920y7t6BR3pp2hHqnO
         ezHAMeD6Zbj1W89PjjKlgwRbCidCMHevNsK+TTCBOdJRYRRy8AJqB0/QhjbzC/DDFpSl
         ODIvUVg/7zqXDnSB9J6CLdUrsjsFqPmxzOE1LRlOApv9yX/cY4xHj8IepvdD9CQboXcv
         4t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UoQjacTEt35cobKpsd3cZazgkM8EoMMmbLKb+tlQqg0=;
        b=6PT0NIDd3HMK0YTd/e7LoTxYM58UjQ0MFOY4RHJ28lEpzHs/R7W5AHlyX9hJhb8NOv
         XGlzIF5Hv7gK3RXtDA9cznuE5Jbk+oIzUYzdlAOAqIk7pFln5laGo8DQebJ6IWbhE2Ht
         PmJq5rOiM3AJjC2F6sPzKGoPE8qQ9n0kMkfb77+y258lor+5wXJ33PkO8UCmUl6IdtJX
         FCYZgZmjcprVo6WT+LuSa4iB4bOy6Iiu0xZX+45FHw9SjdqTUL3ZuWqMyyiHgdlz5qi7
         ucfYJkuQvLoJlFZ9M8ECKUEUA8wZhA46HE1tLlCCzqKHiNSLN47xGTfb6Du4cejSttDw
         wIhw==
X-Gm-Message-State: AOAM5334Vp6YWFLQsOWKRcI0YH1fElP0mdEHfw9Sh6k8kqiVGztFXsP9
	p/Id8IOKVc7TcXYNdAPQfjQ=
X-Google-Smtp-Source: 
 ABdhPJxa1HRPRzc5jj3FDSNX0zIvPCadvkNPh0kTluRGtqmOWf2c9rTkMKEBq1+vsZfIKemyco6peQ==
X-Received: by 2002:a1f:30ce:0:b0:32b:8671:deaf with SMTP id
 w197-20020a1f30ce000000b0032b8671deafmr631719vkw.36.1646443520127;
        Fri, 04 Mar 2022 17:25:20 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
Date: Fri,  4 Mar 2022 20:25:08 -0500
Message-Id: <cover.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162765

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable and configuration updates for 5.10 and
5.15.

Nothing significant here, I've been soaking them for a while, hopefully
the AB agrees with my "it's green" assesment!

Cheers,

Bruce

The following changes since commit a25c07622502727ca1b0e01d32127b57f75d28fb:

  Revert "libsdl2: Add libunwind-native to the libsdl2-native DEPENDS" (2022-03-05 00:08:33 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/5.15: riscv64: drop MAXPHYSMEM_128GB
  linux-yocto/5.10: features/zram: remove CONFIG_ZRAM_DEF_COMP
  linux-yocto/5.15: update to v5.15.24
  linux-yocto/5.10: update to v5.10.101
  linux-yocto/5.10: Fix ramoops/ftrace
  linux-yocto/5.15: arm defconfig fixes
  linux-yocto/5.15: update to v5.15.26
  linux-yocto/5.10: update to v5.10.103
  linux-yocto/5.15: riscv32: drop MAXPHYSMEM_1GB

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1


