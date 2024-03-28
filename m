Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F49CD11DF
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 18:42:56 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.4456.1711651374533126717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 11:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DbCzEScH;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c35c4d8878so588617b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 11:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651374; x=1712256174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j0dMF/R1mLZ/vSBUlCUWFJs/NBZDxmHXAdWHx8jN308=;
        b=DbCzEScHldIytHyYqtA19BszDgqlczh5BHtaxzfBKv2hFwbTthfDx+kcXO+gn5U6tG
         cfoZehP5DGM7nb+Juxu9Hyzg1m9vRajo2QYlacNGLubAByXJFW/IZI0h2zgAqlSZAHOM
         O67KGCS5HI6Io5IUBASTRTQm3XZQ3zi/bp2h1uIauHcKXvKKqJP+PAHh2hWPX0IpRYSU
         rYVxU6e0iIaARlr9FNGapJ5tyVWTwG9RN6tWER2fvN28HY0/m5t3Smx8DoFOBWluSWLX
         Rf3Tvh3CKFTreIEO2nSZEmOYXEbsZjvKaQRVJ7kGG7EFkqo2fzz9O4R5/zrpLhrHoGnA
         kQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651374; x=1712256174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0dMF/R1mLZ/vSBUlCUWFJs/NBZDxmHXAdWHx8jN308=;
        b=Ju21wB19INcrXIEVYcP2v0P8JR82i2tFgL17pgiHnvIPpOWq8/4VK4WCgEaG+vM1qD
         RNJw9Ms/yv0uGA73YIZHO3ujUeGb5gj0tC9uKWwIWrXa4GCukac41b5plhPuMjd4+CO5
         d/bWFS4l7aZZD3wHjRwLykA+JC3zMNrOjcYA2CiBcGKoF42AdrLLueWAS//KsZsR07Wv
         ssXz5V+/zh/auQHYMibWqzvvfscZHDwHl1tw/RMuDHl4izOjZz/CWnblhe5dvlWD1hmL
         Rh3accsXglBa7Gs+liGTPcwByIDi/0fBVWtuV80xGLWkXnxpIV4GbjphxLEhomVD6cao
         DyJg==
X-Gm-Message-State: AOJu0YyR8QafjtokfjQNSJEdATzUfwn7B+Dh507dGcWOsuuIvS6E2akB
	ypBKFtMPsD/fWHER91fwu/+iHpICGl1XATPQmHhHyE4ebvbgkwDw
X-Google-Smtp-Source: AGHT+IFyGpr96vOtSasziuyEdFHu7EaDyPzIIUiD7R8lsMl2FvjVtNq4KIJDji1B2Xz1BtUi8weugA==
X-Received: by 2002:a05:6808:1416:b0:3c3:ce24:e771 with SMTP id w22-20020a056808141600b003c3ce24e771mr149810oiv.8.1711651373631;
        Thu, 28 Mar 2024 11:42:53 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id x9-20020ac87a89000000b0042ebbc1196fsm836216qtr.87.2024.03.28.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 11:42:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4]: linux-yocto: pull request
Date: Thu, 28 Mar 2024 14:42:47 -0400
Message-Id: <cover.1711651290.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 18:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197602

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Take what you want from these for the upcoming release,
if they don't make it in, they are all valid for a
inclusion in -stable later.

Bruce

The following changes since commit ae7056844aa05a239384335a66684394e10290a6:

  README.hardware.md: add section on genericarm64 on qemu (2024-03-28 12:35:11 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/6.6: cfg: genericarm64 configuration updates
  linux-yocto/6.6: nftables: ptest and cleanup tweaks
  linux-yocto/6.6: update to v6.6.23
  linux-yocto/6.6: update CVE exclusions (6.6.23)

 .../linux/cve-exclusion_6.6.inc               |  4 +--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 4 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.39.2


