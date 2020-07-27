Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.57642.1595862633029178445
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=L+TG3l9b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id t10so2822600plz.10
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KsX0yT1Hh/mvNS+09IYFcqfMZ9FiM7b6VFDwb4ZdNr0=;
        b=L+TG3l9b/FLi1teQlHgaJJs1qNfuXaxmooOI3w0tN1ERwlF4ROldtT2vSg021u1wxI
         x4VjV0xgxpR93MbEKEK6IBppefCCZiYIMDmW15vK9wViYXM6IXLrOdadE1GNzFky0hDS
         ugMszgI8rsYbtRiKNLcTufHB7P7l4HaUCBqGkxpQbaCdx875oZjjvp11ctySEtUK1n4N
         5MhiVxs5oba2+8K0gwagY8FxRdHa/WSk9WOXPsY0Xg3KR+dk6H6pzlvb43yyeQtq1P+h
         k+0ugGJ6ScH5f03ELSnkR2My0hM6Uy3BgArbVjrSOkbSjnzrhrs1k+OvAaMX3INaRtD/
         xEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KsX0yT1Hh/mvNS+09IYFcqfMZ9FiM7b6VFDwb4ZdNr0=;
        b=tv4VydGCsTYp8+nG8dYu/DRuvC3to0/yVng2U5Ix8Posm4cS62KhuxBDxGKuHiNe0v
         /BjTz2zW4h6wcYe54yUMhrrfKIsPYzBryO6fWN+S4cYu44LlmR2y1ACTwYc170XTuvBP
         6DH0SjKPxFE3QQpC7bKXb8XA95W0OLrqx4r/tc9HEpXr/uxtaJntlmzEr98rk4HMM026
         zI4Jkm5GlA5hoK3O1rwkcaifc3TBT6G6+8oOosxjWSIjC/kgX2KBRGPjv1pRz8B1WXXP
         vJ34m+4lmTjnxFE3UhTFHkQuHZmU0DNp109Wh7ILlzssKqamD5nNvC3Scr6I0uHec4f6
         71Ew==
X-Gm-Message-State: AOAM532Lohksa1tKH7/r/zwsNrFS/N+EF7IppzyMQx/9sSYAaneCaQTw
	2NLB8N6GhA7Q0OEKEl4/o4t/zCddsO0=
X-Google-Smtp-Source: ABdhPJxaotz8kfwkx44oIb/QgKn9kH16qxxmuk5T4ECzp7nI73j6xxcjqRNIKKXD9s5XQqIURpQ91Q==
X-Received: by 2002:a17:90a:7103:: with SMTP id h3mr17366996pjk.34.1595862631923;
        Mon, 27 Jul 2020 08:10:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/18] linux-yocto-rt/5.4: fix mmdrop stress test issues
Date: Mon, 27 Jul 2020 05:09:47 -1000
Message-Id: <c381a58954da72c5b44b8047328c13f81f178bbf.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    508b4e6ada7f sched: Remove unexpected mmdrop on RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8500665cb8da792bb92a484e286f3935cf85e2b2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 22a0dc997e..caa5b4ef53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a1e1e3cbe42d8a08de5a3e3daaa2b389e352fe77"
+SRCREV_machine ?= "508b4e6ada7f78b3ef5a9dbdd182d13dffe00123"
 SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.17.1

