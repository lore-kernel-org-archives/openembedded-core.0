Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECF7C35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:18 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.7673.1742478014098684379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QrjjDlU+;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8efefec89so6925826d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478013; x=1743082813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msgupoMAjOiQfS0u4lu5CzaHx+CsXz/aUETZWD7hVL0=;
        b=QrjjDlU+rfmJFKm1ee7wWGM5ZxzqZs8r5Y+XGXHxDlzqmcyJRmxLAQxietXldaR51o
         6aqxtIGSDgH/Muoic96AUoYExQfIjkY8SpA0N6wzqq66PkZZQuu9lWWcrHkMshq2XfvT
         o3GgRDxLzPNDlkNQPEC7u3b7wt2AGGEDKO0rkeMm6r3Aw6lblLYe8XVboJYiTezMXIVT
         AKitTVOtYEqPbDIoZ7Rlp/Y5UxdD/ChbTeLAvRSfLt4gFjw3AkbmYs8gxD4JvLLcps1X
         dDUioeneq1i81T7VqwhCgyxxEMPFodnquTlmVUUfc86FPvkS2hCeiDlmZ/ZpLb+1r2wX
         sGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478013; x=1743082813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msgupoMAjOiQfS0u4lu5CzaHx+CsXz/aUETZWD7hVL0=;
        b=fZUVtTkJ63cazk0NSMvXX8HQPIn4x69hGkCgDnAg4AgNV5KoUx2BOV+h/ggQaOd5zT
         SCll93E1FbPvSFAZrkAafDynUvSPEmJEriHg4YUf9I5f7D21N63dhBoNjm665Cm+f0IA
         UV3LhSQIRRqOQUDOMSLV0ZjCLL6mq68F5/jPYvK9CvHu7/INHLG3tO4pH2jCT6dadi1Q
         BA5WOrPXVGZVSX4G19GmvYjfvbgcoHIaWkueBmK4MScAgk//ewY82TNH2OKOjZ3xMFb1
         2/kKx38EA63XXJA/mMIMGWtmFGnGwT6yRNMNm9t6tG7HbmyglO1JhUxjITHeBSeBWRRT
         eBCw==
X-Gm-Message-State: AOJu0Yx57+tncM7aYhtXdQw1wpcgIPYs7f1X/B9euh0IbAewL+h+qjL1
	KTBMufQKo5nxVx+L0deN8SiOzYTdffyoUHXjJWwFOGGRt2mBr9Y3
X-Gm-Gg: ASbGncvEGyjpGcJiR2kvoFEhgNNV3Yivl9J7mElFC6ml++h6YtvZfo1eC1gXzsjdLJR
	GGlRm2OQXOfrjPSFz5gDK3WoThEFCzWDJfdBhGdkuU0S/jOC9of68vKK1pv0OiNtunu9Cem1hvm
	4vgSe4fVB/tFR/3kuspFXzkobuPbepcyBRCVhaRxxsUBDPeZ2driSHr7lOYtNFgs4YMxe9WAwLz
	huckUyXCuXDed18KM6PRNKLESGKGaqS0ClrkqGE/bnfkL+vrFHm0KlrdXYSWisJCYEvL7thHJ4z
	xGE3FXORBqSv6MtaOaC65RCD/Tph9u0qa6lxEJbIQgkm3Nn25W/PAs4WLzN05DsuRMHdcxxJI+J
	SYBAPit0cEscMBQVqkIHwRMX1McT8tzuaq6IfzkSusUY+9r2/XGWLRQk8
X-Google-Smtp-Source: AGHT+IF70RuWank7N/ilwsYpQ6KzdAPInPOSG0Qpeo0XrdGTIWonbt4qZbnIk1qEDCBbrlqr55+/lQ==
X-Received: by 2002:a0c:e991:0:b0:6eb:2f30:55cd with SMTP id 6a1803df08f44-6eb2f3f99e7mr60084946d6.45.1742478012997;
        Thu, 20 Mar 2025 06:40:12 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: -stable and config tweaks
Date: Thu, 20 Mar 2025 09:40:05 -0400
Message-Id: <cover.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213388

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here are the collected -stable and configuration tweaks that are suitable
for the upcoming release.

These will also include a mips clock change that may or may not have been
part of RCU stalls seen on the AB.

I'll follow up with -stable pull requests for other releases shortly as
well.

Bruce

The following changes since commit 9cd6b3ad8b9b9574f1a9f957246b744abb993c2d:

  cronie: Resolve build failure with GCC15 (2025-03-19 12:09:06 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/6.12: configuration graphics, I2C and warnings
  linux-yocto/6.12: genericarm64: set the DMA Contiguous Memory
    Allocator size to 32MB
  linux-yocto/6.12: update to v6.12.17
  linux-yocto/6.12: update to v6.12.18
  linux-yocto/6.12: update to v6.12.19
  linux-yocto/6.12: yaffs2: fix module build

 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.39.2


