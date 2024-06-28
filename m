Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A0EC2BD09
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 17:56:27 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.2679.1719597380219834437
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 10:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9WApVcx;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b5253ffd24so5359376d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719597379; x=1720202179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wLtdLu3h3eSilZoHGL1eXRYVBj5LEcf+9QyItd8TzLo=;
        b=N9WApVcxwdPej9GyFWD8AE5VuVZI078qVk7HPBOkvA9+KcCNQEA7PBRSAYIe8Q7m00
         VRiAyIgZa/897zxIzSRHhmOGLnOMbU4So7nRSvM+kLIzyazO/gNfpcjtrUbODnNJJpdV
         t664rW+Wfq2cTDPwxWJ7HLBoMpzVxgiRwkTjNVGQ8vemdFDUQQYSiFFbr0qEA44NSy9C
         GU39s/E8Ineg7pbZFCVH4/0AvAsOf0dNc4SoVFY9x+l3/THmstnS+QaATlAf18UGz0gi
         m9oCBs5oClq23oK72dBRr6fNTcXDcbFG/33rfpEjaQ5Pr3k9f38FpegGWArUzebD2uoq
         O2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597379; x=1720202179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLtdLu3h3eSilZoHGL1eXRYVBj5LEcf+9QyItd8TzLo=;
        b=g8DHi6VcTXgGqjmmSQb8gIEg1iRrKQ73UjegWtfMzAgGH0qWzvZjSMh7Fy4H9tM9RS
         hd8Eux6Mm8CgLFSr+EU/HiJqKZ7pNd5MWzVu7UIiQ5cBVe3L0BIRtEvwR4wJNsMXbtoZ
         qX5jpX0Jh9UgKj9Crpi38umh09PHpA3JyVD3pYGebn+V8sJaftmCxMKn515Ro/fzXzGv
         YONCcrxGn9yAW/AXeY0c2PYbbA3WDsFDgLFuNr1YQjSskzyph90fL4eUGFs7l9DahYiJ
         MgSHa6yQgHM/tLTRWuRHPuzLMo3VY4tzprGweuMfdY4Fj1w889y/GddRTp0U0Xd99/U7
         6qdw==
X-Gm-Message-State: AOJu0YxclUwCnx/Lt0nJRnIGckUZ7uOTw4fFOHPPVuonxzZ3xK8qQZfW
	AF9kXBDVdueGkaCgOdBTIOk5Nf+1TthXyRQFzqrLU9pJSQUxtAX5
X-Google-Smtp-Source: AGHT+IE4X75HEXGuj5hqT7LDxKu1Ex1ROsEn3Oy69IIr3uuCk+GlnsZejwuyVEem8Wu/2FWPTxUuBA==
X-Received: by 2002:a0c:e0c4:0:b0:6b5:3bc:2205 with SMTP id 6a1803df08f44-6b536448c6cmr187931946d6.32.1719597379068;
        Fri, 28 Jun 2024 10:56:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b59e5746f5sm9781506d6.52.2024.06.28.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:56:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto/6.6: pull request
Date: Fri, 28 Jun 2024 13:56:12 -0400
Message-Id: <cover.1719597265.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 17:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201225

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the gathered -stable updates, and the AMD cpu traceback "fix".

You can see the details in the patch for the traceback how I decided top
solve it (for now).

Cheers,

Bruce

The following changes since commit 058465859ed5a62997bb9424e8eb88b543f43a86:

  xz: Update LICENSE variable for xz packages (2024-06-27 13:03:35 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/6.6: update to v6.6.34
  linux-yocto/6.6: update to v6.6.35
  linux-yocto/6.6: fix AMD boot trace

 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.39.2


