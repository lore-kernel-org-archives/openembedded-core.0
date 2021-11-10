Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F98C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:21 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.11541.1636549639657442767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JGf9q3+R;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id bi29so2373037qkb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDZhRa2okucm3fGjFqyaLfbM9w6tacAZHHW6JSPW+AE=;
        b=JGf9q3+RCMHr3W+T/we2PL8pZN2hFjtyHrm/NzrekpY2acL7xFVZLSzkAVaPjUtQbX
         w9QtNe77sd2emF8feVNHoZK4MzCPiRx9sZG4j5gJ4BBkolrBliP5z6dQxG3HMC7jEX31
         F56rsNWsRpseAfgvU0fI8PmV6+HmK09Ai9MO2lx8k9TrzkPMiwo/Ypfiuk2ytulSFvmG
         s0jt0KDxlmz8XP02iYWMAL0jnI3v1EyW/0VaNOEYUP6r+TBz0aCcF8BuofnwTVnIJPY7
         /DB9U/pNIpyo00McSo7C/uwfFxPhnrT5oMqumYZhbSHF4JaqQsuzKlfOa3QCEkzSjcHQ
         djfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xDZhRa2okucm3fGjFqyaLfbM9w6tacAZHHW6JSPW+AE=;
        b=4KYtJDolSySTKqFqpSLBdp1jHGQyLvmLyKN2PmeASFzqM7Eq89u34aSKcSzk+dB3Kg
         /t9mUJiE8D9er9/1C/30pa1biglpxj9qQQPDsYpJlOlBxG2u4gBcqTr8Or1Kp34dMbxm
         ck7eQsh1bPOnfOhgPlDA/NwA39T1bTVR8aCiIMaKDaIbffwhHKSSrsHSIxlU25rvGai3
         0GaK0cu2fseBm3a9xsmJz9LC2xw0tMjLwayYT+xajt/x/Y46mpf4i3eQBWUfOXfxax+i
         K8zGpxKQXq4BKv3825yNtdflZFBybI5BiFjLPKTn+i83HGWtzj4SaY5+gkia+xekZ+z4
         JNuQ==
X-Gm-Message-State: AOAM5309fUqEhPX/udqXguaGG3jZPg4Q5Zjq6dTLh1eVmGexvejv1SYK
	//R6CJc1EC94DeQtvFSRLaE=
X-Google-Smtp-Source: 
 ABdhPJxve8gnGamKi9E10C+OpO14eGeRRpu02MvhHnoG6Aqsuaezovuwza+8S/sFJMfDvkOSFOhpuQ==
X-Received: by 2002:a05:620a:44c1:: with SMTP id
 y1mr12338318qkp.265.1636549638703;
        Wed, 10 Nov 2021 05:07:18 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel: consolidated pull request
Date: Wed, 10 Nov 2021 08:07:09 -0500
Message-Id: <cover.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158065

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable updates ... more active kernes, means
more -stable!

I've also added -rt to 5.17 in this series.

Finally, there is a non -stable patch for providing virtual/kernel to
all kernel packages. I've had this patch done locally for ages, but
my configurations are not as complex for multiple kernels and composite
images as many .. so this is more of a RFC, to get feedback on cases
that i've missed, or if the AB will pickup a problem (I've marked it
with RFC).

Cheers,

Bruce

The following changes since commit d922f577ae6174ebba20b131850d81a9d62fa29a:

  bitbake: cooker: Remove debug code, oops :( (2021-11-10 12:21:14 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto-rt/5.15: update to -rt17
  linux-yocto/5.14: update to v5.14.16
  linux-yocto/5.10: update to v5.10.77
  linux-yocto/5.14: update to v5.14.17
  linux-yocto/5.15: update to v5.15.1
  linux-yocto/5.10: update to v5.10.78
  kernel: provide virtual/kernel for all kernels

 meta/classes/kernel.bbclass                   |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 10 files changed, 60 insertions(+), 60 deletions(-)

-- 
2.19.1


