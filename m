Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB36C4321E
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 17:28:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.13799.1664904478673983560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a/wKxrDH;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id ay9so8568939qtb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=BvN/nDRJvBm2O/y+Vk5eFhKojxP/q+AZDpscrXaBDLE=;
        b=a/wKxrDHvbfExfecaf20W3tWthWeVO07zTDlCcmTSJ0hD6kloEPk2btaIYK42vOqyX
         0oxyJG4yUy3unJEal2IK3kubxSajXsXsbNNyqbAleotCG+Ledy1991UnjdFjKw7UtVq4
         e85U+96egVAB56/pxtjuTvDfb9sedSWmKsV3mx73hizzTh92oFt4P4I7ctovCWZiafdB
         lXb2w/ntz/tQZKrnw2ZPCHETbjS9zxNjchb7tAXf2NpHhhL+CV/7CSzN3JWApGd/UrzE
         CCGL7gooz5vg2e2waywS7pYHWpjsXUKNWGR3o2PjxlThfisJg76hgqvEZecEyRxw42e5
         8Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=BvN/nDRJvBm2O/y+Vk5eFhKojxP/q+AZDpscrXaBDLE=;
        b=WfLa97vEw6T3JE6PRQ2BkG98S3wto+ne387ugYO4qDcMEQS4HPce3CR4lfHiRdD3I6
         J1cHr8mruOuoAkE6sW8vK4PhTAu/KUKezQAdzQ++7PARix6DYi69+Jo7w17tmY5w7T8I
         naeTpw6iVPpBb7sG7TfX/EOtraaUNH+eH5FYyDK9NY5NwYDjklQg3DYcslgtZykr9LP4
         qwPb/YFOVhNe5YStysrCEuRyxEChkdUTCFD8zfFeUaFxWO5iIeXZHfhyGy705i2hA7ME
         XemM0IpeekyTDbygzEwzdSngGgT9JwKwcYCM6dKXphfa/tEwP7SOUqQtfa/SJMNn59VX
         DXuw==
X-Gm-Message-State: ACrzQf2suFPLLTy9mn+mnSHxYU/rlyWq1JE0rSNhbJgSA/hVGyI35RAO
	iJug2CIRAd4eyBbTssdqyDE=
X-Google-Smtp-Source: 
 AMsMyM7GJ8Jtz3iy3CGC+BajmTIkLeGRRLclt8F++kO+8Kp0HQNi045Q6MdI45USCGf6CDQiJOM3HQ==
X-Received: by 2002:a05:622a:514:b0:35d:4b66:d341 with SMTP id
 l20-20020a05622a051400b0035d4b66d341mr20734578qtx.167.1664904477603;
        Tue, 04 Oct 2022 10:27:57 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 y3-20020ac81283000000b0035a6b89412bsm12037878qti.46.2022.10.04.10.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 10:27:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel/kernel-yocto: 6.0 prep
Date: Tue,  4 Oct 2022 13:27:52 -0400
Message-Id: <cover.1664904217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 17:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171427

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is the bump of linux-yocto-dev to 6.0, as part of the testing for
core-image-kernel-dev, I ran into perf and lttng-modules issues.

The fixes are part of this series and are good for all kernels, and
part of the dot updates to langdale if they miss.

Cheers,

Bruce

The following changes since commit bfb8626cc073b2b368ae7286fe6b0361398e4c7d:

  build-appliance-image: Update to master head revision (2022-09-29 21:57:53 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto-dev: bump to v6.0+
  perf: make scripting depend on setuptools3
  lttng-modules: update to 2.13.7

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../lttng-modules/0001-fix-compaction.patch   |  68 ----------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 ---------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 --------
 ...ags-parameter-from-aops-write_begin-.patch |  76 -----------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ------------------
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  76 -----------
 ...ules_2.13.4.bb => lttng-modules_2.13.7.bb} |   8 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 9 files changed, 4 insertions(+), 513 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.7.bb} (73%)

-- 
2.19.1


