Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E93BC54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.30634.1710889303414744152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCRZ9weN;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-690b24973beso3501756d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889302; x=1711494102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP3iHcVK+t9dAOUSERyMJq58vfkdGpubTKb2ykuAedM=;
        b=lCRZ9weND4aPS1GAKYnM6L5EMcuURY1PxSE9Xt14MY4V+LkZItc/CGhRRJha3eiKYV
         /1XQAacXwknHix2TBwu+cHtXC88qQHTUv9O57I0BjpwkEK9HJdO+WuqPMR5dlLSWBAyp
         hHGgvE4OdCYfH0J/EHZ6iRuH511WzQEpuwlPG77S6FZg1E4PUTFogAQfK0YPSeDsp1VS
         6dprNO2fC4wrF48ogOWxmHdOFVajjHamwksKrIyjTU3fcExJqpst9Q+prdxslo9OkdJl
         h2HQaHBQMjflgJr0tdoV+q+8aQ46ij9etWldrPZzBDFXMrVgBgaxBxDC2e92xB1BpJ2e
         ZVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889302; x=1711494102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RP3iHcVK+t9dAOUSERyMJq58vfkdGpubTKb2ykuAedM=;
        b=rM5Rc7HZeaHXiAPd3lcL042SruH+9rcRywFhJPkKv+nDsfWc0jw5CFvynVmyS6BbP7
         L/nttQT+2GWPFp1tmyJaOAPYYTVVZzJoEzp4UCRYzB5OyyvaXJ9G9svNJ7RxTwWRFRQH
         BDUgpiSOUg/zh/O3mkPP/HDTFClSzx5fNxEQ6pBr2jhZ7vg31aBzxUM51x90OuquAnK6
         VsRKtbvpm773LEKEhFt85hPVz6bWNSdgX1sWfhf1mIS6RdD1Tk+tgf7lsxSi90tN+2G4
         KJanymc2zsyvTyI1fWsNHXDyb5wWABggLFFyPRHlRm40w13Q5ifkTuNMN8tK3qlX1QnP
         5QmQ==
X-Gm-Message-State: AOJu0YwQ2EL6i5FLKkm+oHU/cM/vj0/cAeD1uOmKtt+hMhNciAeVBKgJ
	GnjWHSGOFMFYJVTBUBgbpbyFzBxrWp79Uy2zGthw9AjC5imWczstpbI33RlW
X-Google-Smtp-Source: AGHT+IE/DJIz5z3maD/hnWOHmMIuZcGMSMml9ODAuku67o5qzdTU0thZGDN0mAtr/rZmtcGKh0aRTw==
X-Received: by 2002:a05:6214:17cf:b0:696:3e05:9c21 with SMTP id cu15-20020a05621417cf00b006963e059c21mr1371807qvb.18.1710889302429;
        Tue, 19 Mar 2024 16:01:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/6.6: update CVE exclusions (6.6.21)
Date: Tue, 19 Mar 2024 19:01:28 -0400
Message-Id: <8b2e7f8e29682b906ba318008426d07c7a26fc05.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197340

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 5449b7ec55..00e891fe9f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-03 16:30:03.739466+00:00 for version 6.6.20
+# Generated at 2024-03-11 03:13:59.040619+00:00 for version 6.6.21
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.20"
+    this_version = "6.6.21"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


