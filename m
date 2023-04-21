Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B25C77B7C
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 16:42:03 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.17731.1682095314164514440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 09:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CKlfeI2D;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3e8b3aed55bso10966531cf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682095313; x=1684687313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S3DTpu7FdZUtW+T5U6IcrkFDZFG5iheO552zZzr2QzE=;
        b=CKlfeI2DBAxrfttzX/0EipOZL8odizYla6Tg6ehmh0RhUFZDRePVGX0Sdepbxt+kUm
         Lq+uAMo0hkI4AyGZFY52vJB/lzhjSI3Eja2pIbXsGLNqwTUkSum+M8Nhb+Ko6a3RLiY3
         uSGCqiSvj/a8l8HG6PVoLQN6vsRInlwG2M0InftFSGrOBLcbxTZ6HAEjv/hXSUkPxLdo
         ex5EcztrGNNEPaTYcL2rFzU0eigGEFDbdBUUafjNpWk3Netc8FsrTd8Bh1AcnED/MP5E
         aFf+kvqyybRxvVCULAAQqu8tddcxbOM0Ig4yO2Yk3PmrwyDxgKtNye+/xV6a7XdoZfkz
         t1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095313; x=1684687313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3DTpu7FdZUtW+T5U6IcrkFDZFG5iheO552zZzr2QzE=;
        b=eOkDWhuAHbddhKfXFKrzFbBSzf60dOqjL2IPt2JP+DOJN8Q7ndAxtuqLpsh3qJZfTF
         X0Vaqg0CULxtvC94ac2Dx7tkzNVQQiY+1IC6aL/QclPtxLGCWVp/WOt0Cwp0q3g5r4sy
         m1QQ7OfS2Wn//NZPDdujebpJ2otkzLBcZrrugxuEYV6n3DWinjLWot7g1qnZ7HA7/WVb
         fkubavRG0ox2yy5xa/LUCKic4TaFN3aPGY4spNrkg/0/GQLIdm98kEWU53ous/ee9BxB
         A/Ycwdz1LhuZyu04xgKM+WGgqu36yQJKS+clAu1585CSHnJ/mFpK9wg/hQXGtkmG35LN
         c3BQ==
X-Gm-Message-State: AAQBX9ceF/8VsXFiD3r1UhxaarE7U25DqHkKzRCrXiiwHzTxn9VOZHYC
	QMbpY+427Qi75kt71TZSOW8=
X-Google-Smtp-Source: AKy350ZWW+hwfi/sP6J08LfhZq9OZvruyKF3ZSv8Uk4TzqmG/JRXNc/9WRGoRnjcyoeXs3yc49HjbQ==
X-Received: by 2002:ac8:7dca:0:b0:3ef:50c7:4e7c with SMTP id c10-20020ac87dca000000b003ef50c74e7cmr9556677qte.45.1682095313008;
        Fri, 21 Apr 2023 09:41:53 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85909000000b003ef573e24cfsm1131245qty.12.2023.04.21.09.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 09:41:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: -stable bumps
Date: Fri, 21 Apr 2023 12:41:44 -0400
Message-Id: <cover.1682095127.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180289

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

There's been a regression in 6.1 (framebuffer) that has been fixed by the
6.1-stable versions.

I'm offering up my queued -stable version bumps as a away to fix it, without
needing to cherry-pick a patch and cause downstream linux-yocto users any
issues.

Bruce

The following changes since commit cbae80ec40c7240cf958bc2a061f60e08740f881:

  bitbake: cooker: do not abort on single ctrl-c (2023-04-20 12:36:21 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/6.1: update to v6.1.23
  linux-yocto/5.15: update to v5.15.106
  linux-yocto/6.1: update to v6.1.24
  linux-yocto/5.15: update to v5.15.107
  linux-yocto/6.1: update to v6.1.25
  linux-yocto/5.15: update to v5.15.108

 .../linux/linux-yocto-rt_5.15.bb              |  6 ++--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.34.1


