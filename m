Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.3192.1616704379766483566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 13:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HbfIg8fJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id u8so2678366qtq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8UYXi2ezqGmlO7nucExACZmarTJUkUGIHeyvPCddrMc=;
        b=HbfIg8fJpo1tsWq5uWn11bMMnw4qTHHR10aatOXJ6Z6LnC/7qcxBkl2p8Ky4TeBKcp
         o/CRVeQZL2wBx4m5vMRdpivW1xGx6JlbY4MUm29wmUk4HYvVLvxmvCYLddMIcgM4xQ/C
         5ylIobsxwT0E3bLQ3LXfHXWJXUt8CGc/VR1NACKHlTIYp2wTGrpwuxnE1XjIvC00aY56
         VMTTTn2JI0g52g/bqmd9SE6zITJfLw9jGy0QxUKzlJNpV4jHbujokhUjughEpxRztmZO
         IkvOAwMt25x3iYEhoKBRrTxBJkYiFdkj8Qy78B6/DlqffVgKF4i7zbkYf2jMKWrihh3z
         mbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8UYXi2ezqGmlO7nucExACZmarTJUkUGIHeyvPCddrMc=;
        b=IB2A+xdPgJTbxgUbgQehQ/SML+dMrOyfvglFqDsc0ergHoOlxwGxx91IBdUgJlAW/x
         AYAv3c8BAZXY+hTKKNb30IQAt2riIGC6B0A2f/q+tmxdAArbYEkKr9jum797c58mKUpW
         KhN6A/LT4uG4wWsnbhfwknLhZq5bjZ+8RqRAUNMInpaoZxZfikTef6wUVrDDm/lyu3Fo
         JQ82UxcIMieYbDc3zNQ5qFm2YuYElXt499Zuv19/5hA8sMQbklnSEP0pQUbqDgNDLz4j
         3eem924Zdg+VHeJlxlBjGs7spIFv/n/H7d12YqQXAT/WDanMECoS+vbwvj4FE5HWzVGh
         aXZw==
X-Gm-Message-State: AOAM532P0V3BrpRqPawTh1Sx/Fz2WQUbnqEbZwkAtyRTGlwqy1h8S+jp
	+DqvWRnQO+4uGzY+r2SUIXg=
X-Google-Smtp-Source: ABdhPJxWBqdMIknGT1Kd/Kwd9Q8S90mAJ+fwwmHhLgKpXqGfP4YZeEjLOC+d63EIXN1tvfT+xR+uoA==
X-Received: by 2002:ac8:57c4:: with SMTP id w4mr9177996qta.281.1616704378928;
        Thu, 25 Mar 2021 13:32:58 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id z124sm5221090qke.36.2021.03.25.13.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 13:32:58 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto-rt/5.10: update to -rt34
Date: Thu, 25 Mar 2021 16:32:53 -0400
Message-Id: <a3440b0306535b19625cd2a7d27dde14da9866ba.1616704280.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616704280.git.bruce.ashfield@gmail.com>
References: <cover.1616704280.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    be2935bce35f v5.10.21-rt34
    8078987238f9 softirq: Update the softirq/tasklet patches
    0042f5e5ac7d mm: slub: Don't resize the location tracking cache on PREEMPT_RT
    69bcb4682eaa v5.10.21-rt33
    75e139bb405a v5.10.17-rt32
    209e0ad0f61d printk: Update the printk code
    f1e0daad5cd4 trace: Add the flags for need_resched_lazy()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 840cef88e2..cb34887cda 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5ae660cafcd609de82c450999487d4e6169f9f1f"
+SRCREV_machine ?= "be2935bce35f9adb6d0e735d42651e81a5094adf"
 SRCREV_meta ?= "031f6c76e488a3563f35258c72ff1de3e25a512e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

