Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E51C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 17:30:18 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.29745.1644427817944720209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=p4qzFgPs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id d7so2392977qvk.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 09:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VDJFUQXazLehgAOdXapjUQ8k7kgjyL/o9AbkiSRl13g=;
        b=p4qzFgPsx10IKBbi5mwz8HpXApsJnmUspwBi8aTUEppcgc0MqxYFZtdSJEbQ1PDhO/
         d+X757wV/Rnkb7zzTXIzo5uApAzC6GfCGSpOVR50a3zWrGc01B4FJaqyxi/7CvCbwx2w
         oRNKRpy1JxVTGJrRh2GSbwiZ8tIS51qK/fjaHqpWDA+1UiQTnpH7Ht676lfwUdNysgwA
         umTbSJRRaSEV5VYO6okFPMBEqlhojkTwWDCN6OEfqFybsOapN7+VWNhg/BjtnDvRYDI/
         G8oKIy8935RNlPDdCQGGKNQN2O6t2v8+amAWWJsav2I6NJLQkdfGbbJYOl6y/Ze8EDos
         Yxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDJFUQXazLehgAOdXapjUQ8k7kgjyL/o9AbkiSRl13g=;
        b=FW9/qQBcVJZhfzzilOl7fYeQEI0dJsHxjiwwNiURCV8e1HNhsyUYpoFWV0WTDNn3oP
         X7Zk1ZRrlT75z7KQjqd1vfzU/8u11BV+CTb3itXlH95QbGR2cpV6+NlMNZibkWGMOLQm
         5irf8NR45ed97VQhN32B29G9sT+NB26r8ULqzK334hT1bjMve79xPsGc7otIlDSIYirJ
         aet1gE0baQYhmtmwwtwdom7+1WPeBeHxZH6XicYymRz7XfUEHcb7hRhSoOc8NcQoUiTC
         1+AbiBoJ4yALSh7jIjVuAeipXadJQ+pWcfazX6cTGGAVt6dAYu1uOoDG8+mpIilngHvQ
         i8JQ==
X-Gm-Message-State: AOAM531cHxG/8+t+/mHOC6H/jzhfLe5z/JF7YzwBU97KbNS3ipquMIQp
	sBfYD+qz/OeYppYw2V5CINT2HdbME09Ezw==
X-Google-Smtp-Source: 
 ABdhPJzdxUwaWhFRWgsqjbeXVDuMWQ8VwxElMfo+xdGpqE91LHKzXSzhAr9NMgTU159rwTwQ+LxF/A==
X-Received: by 2002:a05:6214:27ce:: with SMTP id
 ge14mr1692308qvb.19.1644427816873;
        Wed, 09 Feb 2022 09:30:16 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:6f2:2f18:c3b:979f])
        by smtp.gmail.com with ESMTPSA id
 o1sm9440301qkp.49.2022.02.09.09.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:30:16 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto: Remove unnecessary commented out qemuarm
 entry
Date: Wed,  9 Feb 2022 12:30:11 -0500
Message-Id: <20220209173014.1389378-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209173014.1389378-1-jdmason@kudzu.us>
References: <20220209173014.1389378-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 17:30:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161571

The line in question is already in place in qemuarm.conf.  Remove it
from here, as it is not necessary and references an older kernel.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 3 ---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 3a0a43bc0b90..1f0f2977c06d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -25,9 +25,6 @@ SRCREV_machine:qemumips64 ?= "b668a352c94a8c29e585608e8302cacb1350f5ed"
 SRCREV_machine ?= "a1bbb29fe30c94c21309aa8b8c0d06fa12f3368d"
 SRCREV_meta ?= "7df27e6d296dfa16f289883c0661eed45059360c"
 
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index ea10de30cd2f..ce66ddc75cd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -35,9 +35,6 @@ SRCREV_machine:class-devupstream ?= "63dcc388662c3562de94d69bfa771ae4cd29b79f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-- 
2.30.2


