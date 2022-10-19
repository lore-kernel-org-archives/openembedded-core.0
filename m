Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABB3C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 03:39:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.4133.1666150754145795701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 20:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPlGghd+;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id d13so9984217qko.5
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNvttqVuDIMXnyIIZmebPiKW+O03MpyQiqR2sF0T7Ko=;
        b=QPlGghd+ZPvZT/FPnINNAP5hE8YbSQ8US5TvUWLd25Q+yCjcC1m1jc/rW59bQqmYfF
         5xF/lZesLi6SY1XSSQ9x/CqAn07GFRFc/qngPGi8uOHoFQNIV2gswQ7IbhAdoUizrQCv
         +eG/O/zJMqwQPM+nX3Ii0tzgz9DF6feMdM4roy7Pk05VCHAAKiH7Wpu482/5IOY5Tiq4
         XGl7F/AIZZOri5oi7FgNZdYTwOq3NWuImpQTKlawoQZImHvGdAvCbMl+TqkNou52iBT1
         c0DSWGLxBHOwzyGdVgfIaJiG1AZqAy8kJJadbutR6sLDwlZMoEz4XpJ5cpv6VTk8I55V
         HzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNvttqVuDIMXnyIIZmebPiKW+O03MpyQiqR2sF0T7Ko=;
        b=GUZltJajzgDCMoPNnY2gyvpsHGfxOfPynLlI2Fhyr0WU3PYQRIm6G9hHk5d92mnqmf
         oaUOXEgu9vqKI8FR0H+e7eTAqTHnOkCrADskVeFU3PKzFZIvrhvnZSSOaEwOFSZVhNhc
         XqOj6BtTzvcrwGrOb0kncdGR9AGH0KtT13SRCLlRG/Y0/UjgXT8CiJ8XTyS6/gk7/jZn
         yAbkCjEbb05CQrdbLMSxW37d2WQf6qAG4oXg4Fv2PEtnIvxNPMltV1NBHxRDN0BifIPM
         A6Zjle5DSVD9nCTIVCxWqt4kEWrOVcJb3+jCeB1Fpm5/tuhI1CT+1gngRIk8zExMNigK
         UQqQ==
X-Gm-Message-State: ACrzQf2LsuFT5iipJ116XgFAdEW9of5MlZYiL0OkgugECZy6oHIwvuFH
	Y92DueMbqlsxjYK+8nK2Tnk=
X-Google-Smtp-Source: AMsMyM5MOi+ai6W0UTGvJ6c9+F1Zc/O0sWYpZz3Ai5AlpITZNnD+SmX+qh+1nin4c01LzCrbS5nvvg==
X-Received: by 2002:a37:45d4:0:b0:6e9:bdf3:6d17 with SMTP id s203-20020a3745d4000000b006e9bdf36d17mr4055710qka.535.1666150753093;
        Tue, 18 Oct 2022 20:39:13 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id t16-20020a37ea10000000b006ecc5f5635dsm3793946qkj.113.2022.10.18.20.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 20:39:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel-yocto: consolidated pull request
Date: Tue, 18 Oct 2022 23:39:08 -0400
Message-Id: <cover.1666150638.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 03:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171950

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I'm not resending patches that I've previous sent (lttng, linux-yocto-dev), but
wanted to get these out onto the list, as people are running into the kern-tools
issue, so having the commit available keeps the moving.

I've also included the -stable updates, and will follow up with more -stable
bumps later this week.

Bruce

The following changes since commit 3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2:

  ref-manual/faq.rst: update references to products built with OE / Yocto Project (2022-10-07 10:54:26 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  kern-tools: fix relative path processing
  linux-yocto/5.19: update to v5.19.14
  linux-yocto/5.15: update to v5.15.72

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 7 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1


