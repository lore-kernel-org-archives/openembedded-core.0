Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B1FC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:20:04 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.12904.1647969603025344063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qgks5LXt;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v14so15012805qta.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ifQiyXYh4cLRZ9v7CPcfMr7Al1BU+pSIbGTlfQwrgfo=;
        b=Qgks5LXtNv9BX4uddNK/1Ajwe1+1169bzlMvWRJ713zslm/rBqyrbopaAQ0HQAuY8i
         EIH22SIZQPK0o3T49qqjVulWkh0LjJuKbe01ZUs3XxagTLN1fYZQK+72Qvvz/e6/PIZT
         ETUslWrIBM6+iot+Zfg6Qb0YLDm/jzTvhkUe/yx1l3HtO7XfzcYQau4kr0h7+fF6QAJ8
         W8S2YmZRJg/QQz9T2QEsxd+UJ6H8tziK10EZazgAdeOvnFDbct5uDGXkPpPp8sLw/2lu
         2XLAELWWZQN+SPOpTsjLX+JT0Icvhxoqpxn1+312R1GJHQbTNFl1dkEdNt2tN5VMr7Rq
         IrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ifQiyXYh4cLRZ9v7CPcfMr7Al1BU+pSIbGTlfQwrgfo=;
        b=kEOoSRC7CrEtP34dwYub0GnPMNZ7hztJwiPTzvmNjphz0vDEIDATJINpibK9eZO9qX
         nSSEzVSAXL5aZfwRFRdJJ2f3ajospYRAuPfSy7vCorBaxtK1bIuv0BYLY6KKahAdr+qG
         zm7TjLDDnFn6Nc9jra7S3AAYKiG+sgNTyodW3ZYUmLz61LZoWLal8YeNcdmyO4lryTCz
         8ELwbtyiq4ErSvtfrcyvjXtWyzQw1bOH4MZveBrnYCPoj9cRLcbRV+Yj/qjsp4+j0u6C
         AboLDSfTO5beXtSY8pzm/4QgqMEV8M363MkQuYVkmfoDrRH43tUWtGTutBD5cd0sCmK8
         RcYQ==
X-Gm-Message-State: AOAM531WDIVs+nmv/FkcMmHwJW3Pxudc5fIczGZQesQYs/XSoX8kebYl
	+/B2fBnj3FeFsWueXbCnwPTDlMwBKoUJ2Q==
X-Google-Smtp-Source: 
 ABdhPJwEY7HQNstdWgypFyH8EJspLOWDk5m65eeZ5gCgzZ2//Q3wCOAyG+nvaRwqOdIfnpXxndBvww==
X-Received: by 2002:a05:622a:5c7:b0:2e1:d599:9e0d with SMTP id
 d7-20020a05622a05c700b002e1d5999e0dmr20826624qtb.491.1647969601936;
        Tue, 22 Mar 2022 10:20:01 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm14019648qtx.16.2022.03.22.10.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 10:20:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel-yocto: consolidated pull request
Date: Tue, 22 Mar 2022 13:19:49 -0400
Message-Id: <cover.1647969481.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 17:20:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163557

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the config, -stable (and -stable -rt) updates that I've gathered
and tested over the last while.

I don't expect any major issues .. but one never fully knows. If anything
does pop up, I'm here to fix.

Cheers,

Bruce

The following changes since commit ac942fea081eaae89df2a37c72965a01d026284b:

  kernel-yocto: allow patch author date to be commit date (2022-03-21 07:39:24 -0400)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto: nohz_full boot arg fix
  linux-yocto/5.10: split vtpm for more granular inclusion
  linux-yocto/5.15: split vtpm for more granular inclusion
  linux-yocto/5.10: cfg/debug: add configs for kcsan
  linux-yocto/5.15: cfg/debug: add configs for kcsan
  linux-yocto/5.15: update to v5.15.27
  linux-yocto-rt/5.15: update to -rt34
  linux-yocto-rt/5.10: update to -rt61
  linux-yocto/5.15: update to v5.15.30
  linux-yocto/5.10: update to v5.10.107

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1


