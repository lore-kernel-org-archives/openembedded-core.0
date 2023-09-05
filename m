Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF02C83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:23 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.23196.1693924638284725789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rbvIrXJd;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76f066e4fffso159647285a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924637; x=1694529437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xk1SpwS2fwInYf4WOZpGklIJGj69uRzPvV2Gik12tRU=;
        b=rbvIrXJdbHI0Ka4z6hcJ6pW+YdjhZP3ENQyLH1DAWXIxPJa2TnAnwKQjYKZx15yDMr
         3L7V7PnhjSOrTvbjAzerljBsJjdCZp5YSe6d8nXtX6C9LSp0V+NWC/Et9puX0QuvjnNn
         IyYodhv6ZE7JpYtwfVgzX++qJKaCeGYECTgPdF1K0sog77skztHtATyr7OxTGVuoHY5B
         o8Q3tfHW4Vjyoz7MbC1UMRIjuRBkyNBhlfM6ZR6DwM71UTP54Co0VeQ5AiMekSGLcOIQ
         4gh7AjBInclDxfk9c/GZLsgyvzAkpdomtwc75qyQOky0ynSH58SMHCHaWSG0D/TWFWhe
         lLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924637; x=1694529437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk1SpwS2fwInYf4WOZpGklIJGj69uRzPvV2Gik12tRU=;
        b=MsP6VX1FHPTIkSEPidOC4rP0g9gN20kZDnquuSPqxlUdtAv175DyhJfZG6GiqTzANH
         RXHLeCfMeUlvS+iXUZQCmHZHpgauySfFZBJe7JjhQV6puA+JCsw/3abZBbU90suMXwuW
         eWlDTV3Q7tcREIKS5KMT+qnP7EE3CL8fDoHaf/iwGV5d/4oHsGeglIGw4+SPTw2UJOYd
         hCLWUyQKjfiXn5DNOR7UKWB/tXu+vOdkRe+db9Kmw+YSumxFjsST1eDoczDcxarMuROK
         j9V8oM2WYFiBPX1dVTYaea9hIonXNyjC/7xO1qhLm17i6FpSZGulCBxq3bb35M2FWgOt
         kRRg==
X-Gm-Message-State: AOJu0YzFJNKIPA6NYehikOL//huF8p/H2e2oriPxyDe//So6++yhtWsJ
	EGshPimEcx7Ov60YIpyeL7U=
X-Google-Smtp-Source: AGHT+IEFmZFJ/AhjngBMaN1zZ6VaMsEndXU+MWJO90RO7Wur2EXP3dE04AcbAWtmjR9cvnI0fLjCyA==
X-Received: by 2002:a05:620a:15ac:b0:76d:61ca:711e with SMTP id f12-20020a05620a15ac00b0076d61ca711emr12913986qkk.64.1693924637182;
        Tue, 05 Sep 2023 07:37:17 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
Date: Tue,  5 Sep 2023 10:37:06 -0400
Message-Id: <cover.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187216

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable and configuration changes.

I also ran into a build issue with 6.4+ on one of my builders
due to a gzip mismatch with zlib versions. So I've included
a fix for that.

Cheers,

Bruce

The following changes since commit 733afeffd19a2ae3af34abe95e514cb4b99cd366:

  bitbake: server/process: Add more timing debug (2023-09-05 08:14:50 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/6.4: fix CONFIG_F2FS_IO_TRACE configuration warning
  linux-yocto/6.1: fix CONFIG_F2FS_IO_TRACE configuration warning
  linux-yocto/6.4: update to v6.4.12
  linux-yocto/6.1: update to v6.1.50
  linux-yocto/6.4: update to v6.4.13
  linux-yocto/6.4: update to v6.4.14
  linux-yocto/6.1: update to v6.1.51
  linux-yocto: add gzip-native to DEPENDS

 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 7 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.34.1


