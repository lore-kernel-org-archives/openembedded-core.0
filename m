Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.405.1624812643616954121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 09:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tdz00Wdv;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id r7so11691279qta.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjfjBrOBxAAmP01g5h8PhQ8UsvfI3gUePvILuZvv6Uc=;
        b=tdz00WdvQ2kMf3Nt3KL5S2GSAyAi8QMLBDb6Utxrg0P8Rm69s9o2dEBz+4GtKeXzwZ
         lXuw+K8YYz9XL2jljcUfgW3qQquJERw0PU5O4z4krMkcpAdNexc3/IdNY17S6rIiuio5
         Pflp6cIyAljD4+TQQb3EOd5+kFOEvM8U/yJCAzouNyenR+QEpBq/sttIeo7Y7TvNP+Cg
         1DfiukWxLXzizPaJDPs5Pp/cuwMLDkjZ/FZinOiKDs7iEakKrUbsmnJPT9i0DgY/L3CZ
         qhnLLlwKXq6fQOkFsdFUiLrwhtErC7cKS8xWdJTib1gPUPqAZk3jCirSpO5izhbU7uOa
         aHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xjfjBrOBxAAmP01g5h8PhQ8UsvfI3gUePvILuZvv6Uc=;
        b=BtTv8mxjJnwDsvIIAe+Y22cSrH8CS6Vf77aMAheIwXWrOBjbgpT7K+0XD3k2zgrA6W
         tbJ2ad0MqmexM8aRt2aKn6foZARzCE2APtzMELP8ZXkrv9SgiM18BJuFB3HYCfjEeHwN
         3JXoyKKDwq3ili49kz72N7xbqL5uvGofOuN3Q61FPEBWO2SGtrX7GJxueUHMfzb6dlnk
         vaSAI7TxuJGR62uCUCHIK7o0cq6j7MB54zjylFT6L3ZG3OKv0u1Ow1lA5aXQ9GMPF/HS
         GUV6/0elpdL6X1aJ9Abgss9ZaHmpjbuQniukCUs38R+Y+jhDug0pRROYW6NAJ4hV+rWl
         LTeQ==
X-Gm-Message-State: AOAM531KOM4ABVbi6a7l4KcJhNv/dAyltQhIHUEBP+/LKRGNoLvCRiIM
	JyY11FndAymOXctbetf80wk=
X-Google-Smtp-Source: ABdhPJzfo/Ofiw8eM2WOK6N6upIQ613hz421vPDBirO2f2wh5UkUFuzEQuGoNsXKHjiEY/GQFV3O+A==
X-Received: by 2002:ac8:6f30:: with SMTP id i16mr5401409qtv.224.1624812642716;
        Sun, 27 Jun 2021 09:50:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id b8sm7150439qtr.77.2021.06.27.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 09:50:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/4] linux-yocto: consolidated pull request
Date: Sun, 27 Jun 2021 12:50:36 -0400
Message-Id: <cover.1624811389.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is v2 of the series, my update to the latest -stable ran with
the wrong arguments and I only updated the yocto-bsp bbappend. That
of course messed up the stacking of all the following SRCREV updates.

I've recreate that 5.10-stable commit, and then restacked the rest
of the changes. Everything built fine here, but let me know if you
run into issues.

---------

v1 message:

  Here are the next -stable integrations, along with some kconfig cleanup
  and a backport of the identified rcu looking issue.
  
  Next up will be libc-headers updates, along with the 5.13 reference
  kernel (and the dropping of 5.4 from active in master).
  
  Cheers,

  Bruce


The following changes since commit 2834c2f853bd0d988dd1e35d4300005be05f8b19:

  populate_sdk_ext: copy BBMULTICONFIG files (2021-06-22 15:18:11 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.46
  linux-yocto/5.4: update to v5.4.128
  linux-yocto/5.10: features/nft_tables: refresh config options
  linux-yocto/5.10: rcu: Fix stall-warning deadlock due to non-release
    of rcu_node ->lock

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 6 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.19.1

