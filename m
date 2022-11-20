Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BDCC43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.13229.1668953790562462287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=USyVSx4J;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id c203so9102430pfc.11
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQYi2yccbM+r/SnZeX5MNM9dMTyKAzUECiQrvlvJeQg=;
        b=USyVSx4J7AsIyVS6gEzZnFCQX1REDNqInYUBtxRwJAO3cyd8+XfXHP39+kK3zb6oDP
         wvSLeL8GCbNPVKvOCC8ws0uZKEfD915Y2ToXhLHZzjv6lKprwcEvmK3xpABKCDmi/GJQ
         yMu8FKR2jVzrUTsQIWroxPRTP9Ii/bPQzHLOZyaHldx6WBXg8vkJWUaepGrHU3E4OnrV
         f0p80A4ToIhE/mJtrLdAcJEDT6ts2s1k+bTgp8UYN1umzlCqTpOILgP1ttbuV25EvsLu
         V52pJRYeMzfM7l4turNEdqr3xL1YNGG2nrG/XBOUDPpYLtFQ5BypYKfWmnKqwv4qInjM
         95KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQYi2yccbM+r/SnZeX5MNM9dMTyKAzUECiQrvlvJeQg=;
        b=lxB6IA7avbI/ta3e9ueMyDUPH8FYco1Dp/19ApR8i9wGgP97cbO5Yj+Cv1OU4kTCfp
         wiGLKgSJrskpcRBigY/O3anheolQH5XlFVpVSGsd9ZspAnfpKsY8GFsc7SunOfvNceNd
         5AdZh/WZuGCRovV661CTQXbqBoHxl42asKZ3sZ22+FdZIdEiMxHCN+aP6cX8P12f0UwB
         hIsvyLhUSHQ+KGA1XBj7tCbJyUW3Mndpk+TV8ZntQlqumiJjQ3fYhQn99X6W6BIVl6ch
         mvn6lLnfDMUd/HnUbXWZ8u/j347xWmKhhRnhyo3qMjBot4UivXzSuDwgqqSbj5N+40St
         oydA==
X-Gm-Message-State: ANoB5pkyQqCRl2i7FFHAXOP/eMdP1Xk8GjUzGDbGJ8K3C98Gpvln/U7b
	t3+xECvOk5vwEXroSor+e187sqwG1sj8DqWbIf0=
X-Google-Smtp-Source: AA0mqf5g13uwmHl0DnRZIakC2yGnfThsC2jCfCa0UoyVORfH+l6r2XQaq1/2BCBcjIDQa0zlqFjFng==
X-Received: by 2002:a05:6a00:24c1:b0:56e:a001:8cb0 with SMTP id d1-20020a056a0024c100b0056ea0018cb0mr16075881pfv.60.1668953789621;
        Sun, 20 Nov 2022 06:16:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/35] libuv: fixup SRC_URI
Date: Sun, 20 Nov 2022 04:15:17 -1000
Message-Id: <8e5d2044ff27b54a8013fbf2ecf1cccd2cf76871.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173628

From: Kai Kang <kai.kang@windriver.com>

Add the trailing '.git' to git repo uri in SRC_URI then it could share
source code repo on premirror with grpc which uses libuv as a git
submodule with fixed revision.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cecdf616e7cf192cdc723a446be1d14c197c980d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/libuv/libuv_1.44.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 4c1b8eed56..27e79276b5 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
 SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x;protocol=https"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


