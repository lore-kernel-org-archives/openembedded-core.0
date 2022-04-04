Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32531C636FE
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:46 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.36598.1649085560115559653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dVnALOuN;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id kc20so7699287qvb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VlXaVjZsy1I0qUVgaE6Kn50mEaB5YYvpqIklU9ordKM=;
        b=dVnALOuNbAqtkJkF1z8K6ghdszTvPtQQ5NfrFTWiqaqv3HoRUNl5UiPLLE+lLcKbWE
         1htM/q0hh8t6w9DXorwiJDcEpoy6IKSsHCVth28e+bJzlIbeRD2WQIjkv1NtXBp77Amx
         viuAzGLoW0X1cMVcPu88RNOSthAUPLlN8uzWFhDwXK6lKFZk4FEl2cQlrcZHCLgqmCdJ
         hWN1fL77D47CvkW+ZMfwgmyOOBMND/WSMQ3v2yJtlRCuZVSxwkxpAvVEB6UvCJaQi6d0
         6aP74gfZTwV29YBmnS4iB4jNo2cfjkt075Y+bbtIryxSXrU6Si42Mo6tJ+20ZvpbZjDO
         7LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VlXaVjZsy1I0qUVgaE6Kn50mEaB5YYvpqIklU9ordKM=;
        b=l5TTb6lSTngeauTfoXXrNSDGUU/Gs5huTblrQlq0rYpDl32nEgggvO/L5J+EZ4pv/e
         3hOiqPzcUSyglHvH509Guyo3nHKoe6i1lyCP1KBsfUAlb0K9zvPJRy6vy6UK4JUoP0TP
         +6Ch2wUSFlXzmoXnEBX0HRXWfbScmovhv8TUciHi9UL7i7MbBWfMq4KKr5Pf6FSoCnqH
         xOOTNNTA7/zosnrJDKRnaZBky8ztCSjSObsfwIvwAO2W9JXOdh5Fj7bO95S5pRuAtGUU
         GtFrc1aWhqn9gEgHrnVLzTBrCMUX4RpX2z5q2WWQz8Xkj8QFyTC25saDGDzyvEkS0Y52
         2ECg==
X-Gm-Message-State: AOAM533RIku24DX1nAUFYmbJp8TrQeb/EA00F90Caufmc+8qw82DLClg
	3MJx3o+C4eae8XL0LASPJwhtYR7k1xqEUg==
X-Google-Smtp-Source: 
 ABdhPJx9fgNgL+xx4CQcWMLsDoCctMA4/5FjLf2Kxtvxk9DlXuJYIKFLp1HyPhD1KT6q3a0Gy8jBig==
X-Received: by 2002:a05:6214:2308:b0:435:3440:7d3c with SMTP id
 gc8-20020a056214230800b0043534407d3cmr45544qvb.65.1649085558901;
        Mon, 04 Apr 2022 08:19:18 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm8969772qtd.44.2022.04.04.08.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 08:19:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Mon,  4 Apr 2022 11:19:10 -0400
Message-Id: <cover.1649085436.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163995

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

A few aufs fixes, -stable and a configuration fixup for ARM/x86 split,
but otherwise, not a lot here.

I know the release is going to be cut shortly, so these can either be
post or in the release, obviously up to you. I'm sitting on other
changes that might cause issues, and will send them after the release.

Bruce


The following changes since commit 6459a06f2ed7d47f5df0c50d95e182e432311d53:

  unzip: fix CVE-2021-4217 (2022-04-04 13:00:16 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/5.15: update to v5.15.32
  linux-yocto/5.10: update to v5.10.109
  linux-yocto/5.15: aufs: fixes and optimization
  linux-yocto-rt/5.15: aufs: compile fix
  linux-yocto/5.15: features/security: Move x86_64 configs to separate
    file
  linux-yocto/5.10: features/security: Move x86_64 configs to separate
    file

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1


