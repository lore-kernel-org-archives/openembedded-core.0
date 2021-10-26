Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B580CC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:25:28 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.566.1635272727301272841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SsrNte3i;
 spf=pass (domain: gmail.com, ip: 209.85.219.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id d6so77676qvb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WRHkXCLzrOZOFB+wo4wd4IByKcGQU6M+BP2yNHTyawc=;
        b=SsrNte3iGaV4cDOTSMEWFOLLJtLprDiOfml+LJwVK20Ecgulol9B0HcpTf+oQhJWp4
         GHJiEV/s9HGasFlGNd/3Esxt9HDoOX0mgoDlBgG6reWnFn+Wlb/UJQWd5n/OaS5vsSTd
         pgxYxIhf6zG7KUE+YagfUQ+NbKjspjDgq4kOjk3VYc4FP3UNr1ycUb6T7CUfuLscGXUR
         8WnICI2wynm1dBvKuEvTYaKzYNJ4qoBYoVUXHWNc1qDMovSrIqlaueO8gnXmZoZNPx5e
         rephNZOqbV69bGvlzI+aqWXr3VZXuZfPtSZ6XNM0BaYEQNVKGVTkl/oqK0zQt7EHpgkd
         lcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WRHkXCLzrOZOFB+wo4wd4IByKcGQU6M+BP2yNHTyawc=;
        b=rAm9EYvYp3I7OLlvjNW0hM6kR7hJJhuqtsukoD2uFlKsjbel03rHTpzfdaH+i7p3Sv
         a/1NaMRBiPYhRHxks1EVdzlvPQc1ugMvQnljfCyB3qs/f96JGYapXWdzNJplLBNLVtE/
         nTWxOm0AF8PxYzgMdtdeTGf2PXR/6E0otEnFkMNaj8sDen7GIqNt15lyVGoNHrEhXQxB
         wsSjpTBcjlezA9itIN3199aUSQYk97rYDes7RVPs+xga9XgMvJM6uIqDsi7lt5wDsQ7N
         49gojGG/1q2bmbT2VXBzVdR+Oo9BEB1fZbD0k13erPWGtSQebA5c8IkaoZxwYloY1MeD
         ySsw==
X-Gm-Message-State: AOAM531i8hgSB5mHPyS6pT+CeM6E5U8qCcBjqK/eRQHWOVK9pOi2BFPB
	XD1zYC/woFRksqRgILOixyQ=
X-Google-Smtp-Source: 
 ABdhPJxHHymLAk+9vM/wd10MgeF7Bw+ZTaAZswe7gd9wc846mzcwCrbptirNWGiIHVqCaDhPvyCB2A==
X-Received: by 2002:a05:6214:9c7:: with SMTP id
 dp7mr4539437qvb.16.1635272726283;
        Tue, 26 Oct 2021 11:25:26 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x16sm10608460qtp.56.2021.10.26.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:25:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: -stable updates
Date: Tue, 26 Oct 2021 14:25:17 -0400
Message-Id: <cover.1635272591.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 18:25:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157441

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These are the -stable merges that I've been testing/queuing while the
release was being completed. Each of these represents a point that I
tested, so I don't expect a surprise (that being said, there are quite
a few here, so you never know).

Along with -stable, we get one configuration tweak to get qemu booting
out of the box for the generic x86 targets.

Bruce


The following changes since commit 0d4c97c24dd4bc25760bce00f3ff65e88508e882:

  releases: update to include 3.4 honister (2021-10-26 14:04:19 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.10: update to v5.10.73
  linux-yocto/5.14: update to v5.14.12
  linux-yocto/5.14: update to v5.14.13
  linux-yocto/5.10: update to v5.10.74
  linux-yocto/5.14: common-pc: enable CONFIG_ATA_PIIX as built-in
  linux-yocto/5.14: update to v5.14.14
  linux-yocto/5.10: update to v5.10.75

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1


