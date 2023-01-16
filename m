Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BBFC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:05:48 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.168626.1673881538805503678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bXl8bBcU;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id m23-20020a4abc97000000b004bfe105c580so7324667oop.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARv9SwkzPehKi3v7dA3mSrcDPHfWUOTbPs672dcWkTg=;
        b=bXl8bBcUzU0LEfjloqgtifprbZdJnI/ABt3Www0ow1PAqlWcpcXZvdOcw/sRIeHgMs
         /OB+/feViJT1jYBYlHRqzFHd0qfoCNAWjsuuyo61a8ffEkkR6DCC8pd8uQulEhBORyPq
         tJi8zZfUK1ThiYi5jLmukXDvEnS12QDkgZ+NesqwtWS/lcYa/U0ZEHg2Sbzbh8zgJRTk
         M91TOg4EQl07tGXIBBQqXtxuNDFdWKGSZD1Tcm+0DTzxes+Aapuc43c4Y3mxl7yEGkuS
         FQsMmSx9ETLZrxV6u+B/QM94wN0AWFaaVNn9qt/O97NmICmxnvjwnLgDH2dVFEr4v5uN
         DpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARv9SwkzPehKi3v7dA3mSrcDPHfWUOTbPs672dcWkTg=;
        b=CK1iYrYCdjtDituXqVSJYqeqWPrelAzhCXwTcfDU2X9nTtyP5+cmgTxMndi+WwIaax
         4YPCkqloxvIkC1fezfY3R19EhB+ZWFeF+j2f8TMoEDxZykgOe6nIRcQRyJpNTaeOMYWX
         nvIenP7zIofKMTgTLmw6axog00ZdHXq7FMsc32pHZNgDfdZjsmS3jJdc5VGqzUvxkNvt
         0lCT4ZojCmD4sTxtlCMeo3xb31K9fX83l9KjpErrYD7sVl4FqTdv5Zmgv0eNYwI6rnRm
         G1VxDIQN/RKpreLuRInakSt7b2n+JVeIGPhUxRxp4T+6Ze78zNIi0u/it2acfOIWilto
         VIEA==
X-Gm-Message-State: AFqh2kppXYQAqZwUeRrKlHv8PKxWhkocjvz/IzxbquTLDPePN6OI5Q8Z
	8VJu+ZYAh5j8rvuglHCjwHo=
X-Google-Smtp-Source: AMrXdXsAGffJJEu6ER6ncg7xcjj6LZsFpcCYkNf7RiSi9vKRPry2zdP/p7JuBQdfntVM7OM0DTeG6A==
X-Received: by 2002:a05:6358:51c3:b0:df:6ffe:96bd with SMTP id 3-20020a05635851c300b000df6ffe96bdmr2557240rwl.25.1673881537960;
        Mon, 16 Jan 2023 07:05:37 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id q30-20020a37f71e000000b006ec62032d3dsm6794402qkj.30.2023.01.16.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:05:37 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: pull request
Date: Mon, 16 Jan 2023 10:05:31 -0500
Message-Id: <cover.1673881447.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175990

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Two -stable updates, and configuration tweaks that should remove the
warnings from Kevin's h/w reference version bump.

Once these merge, I'll follow up with default kernel version changes
and remove 5.19 from master.

Bruce

The following changes since commit 288cc5b879563f7f996733bc9da3b4316aa5ede0:

  gperf: Make the code C++17 compliant (2023-01-16 10:42:07 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/6.1: edgerouter: Replace OCTEON_USB with USB_OCTEON_HCD
  linux-yocto/6.1: qemuriscv32: Enable CONFIG_NONPORTABLE
  linux-yocto/6.1: update to v6.1.5
  linux-yocto/5.15: update to v5.15.87

 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.34.1


