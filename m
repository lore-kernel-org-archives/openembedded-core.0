Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA74C52D7B
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 18:04:28 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.29115.1723399467729403535
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 11:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAwn0qnY;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6b78c3670d0so23172086d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723399467; x=1724004267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j+5Nqr2GhoJjYr72Qoh49B4f555vX2wcFN1Gc39IpM=;
        b=lAwn0qnYrmsryjlNrs7L4PlxQYZ6wOpWrG9WBlMRuDngJXD8mYhclgZ6w4PkY85+At
         6pJGyEbA6Ak65sqmbkuLQw54zRn8qZhQvd1+hqsiSnnqZc76QAVbyigSHBK9Kf3LmLV6
         iigfCuSk2nWx0ZINtyVNaB5Yf+r94P7ODYTd9gFxPdpfdera9yYLIw5/+GkVEKf2oUw0
         ayZb03ClKOrlbCkO4drRCbYVaTGYS/S76gNGsKTv2ahfR8WT8Ms0mHTumA1rc7X3oXBU
         vaiSaNcxyzFLJ+ieyKebO17CnDBDNNtVEeoQCftOvNleKZd5J4mM0KRcIJo7do2kqPE+
         mIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723399467; x=1724004267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5j+5Nqr2GhoJjYr72Qoh49B4f555vX2wcFN1Gc39IpM=;
        b=AvPjudJtuQ8DS+0c45aqT+7813/+i+SpRrO8DQdKIpv7OCQIoc0MKewWZze8FmuOJx
         WXCdCe8oQNn114jFYpRBy4pFhoW4dcMjbIsyU5FBCawKY32h5ugASYvu67lbad6GsjX8
         RIo8lKdTfL8cc1iwZC9AucX1WL8vmiage6tiU7trhhweJ0BfKVjYQjCf1GM6VekjfH9b
         opqiaFDAXjzQZsYE0CEpW5MegZ0d7osILeHkHVjdaFz//2g+4uQUJf68hO9CowPF+ndm
         M1JXtJ8SHdSCACLpMRLNC19NOLYBgmdECpeZ0bICdrJThhVAAuTSEkwhhMnl3qQ7eXRv
         XtXQ==
X-Gm-Message-State: AOJu0Yx3nMH+VnZYXdFPOdFlMFm7Vjpojp2wmCwC8Y2bYHKmh79ns95Y
	lNGzWEAfGifIgYQV3rAG+dK+HU8BuGkFtxCqLKB1aM+1r+DjeeAQ
X-Google-Smtp-Source: AGHT+IHjWGbi5Kgb1I1xEwm+jUGO7z1KTn0uiiA/bf5bypW+BGx8KcnG+dOUr5zy9CggHAoEqRVMnw==
X-Received: by 2002:a05:6214:570d:b0:6bb:9e88:c101 with SMTP id 6a1803df08f44-6bd78ebfb63mr67320366d6.50.1723399466588;
        Sun, 11 Aug 2024 11:04:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf42f4276esm1383996d6.66.2024.08.11.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:04:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto-dev: bump to v6.11
Date: Sun, 11 Aug 2024 14:04:19 -0400
Message-Id: <e1eea6c3ea87aebfdaabf5a987a7290d7e9a4485.1723399246.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723399246.git.bruce.ashfield@gmail.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 18:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203187

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 0097fec7b2..292897ce43 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.10/standard/base"
+KBRANCH = "v6.11/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.10"
+LINUX_VERSION ?= "6.11"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


