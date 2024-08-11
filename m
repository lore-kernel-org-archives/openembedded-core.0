Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDF0C52D7B
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 18:04:38 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.28965.1723399469084502727
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 11:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGFEy3bC;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-709485aca4bso1872902a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723399468; x=1724004268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0jToEbsKusuoXCk3fwvDeMDpxxGonzXLnwM1sSUIjE=;
        b=EGFEy3bCdTTrG3SMcTCoudW11ZgongsAQaqC8w8KIX5Cx82mDrKYltHal+VKsPDL47
         BndCZ3cRGQnHLOCey1hCkIiySyUkd/Td7rQQg/p+d6ITS0HFdo6GQNa3HIl31PM9cZqp
         p9gURRFc6TTKjujnpeZM+7IBCqF2sxfymou1HGSy5YqfOnWFNBCx9M/MoTl/EZSyR31W
         +FnXuZ8k6ebgUHCyy4Lt6I+O8Qe6qH7sjV30JW0kZHzn7Pulp5Bj69g2Dm9ScCPyO2oJ
         2tPKmic8Y+sprMoFYaw8bHnbii4ThaE9fRKinrNQ9Bw5CUu/C9E1lSLNVeH8Fe14Yidy
         dWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723399468; x=1724004268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0jToEbsKusuoXCk3fwvDeMDpxxGonzXLnwM1sSUIjE=;
        b=KWYapzwpRw+yk/cbeNWwy36ysv1hNr0mtPMC6UZMQIo/vQfGm60SLkrnDB9Ik1yN7x
         kp0AwJo5O959BzDjQLKh1zRft0XsT7pmLTcoKMf0Zew4J0Lwy4NPbvRB4i94sYvK8c4z
         vwUEbfQ5iH5524LUpz2dyXzJ/xJeh9ZRlylKrWSkGVNXdMl+iJcsoQ2hkmShCNtyChRH
         dTz4k6pGAOK5feb4w738Kzz1FsTYVZHChoh8FNx2C4IHdqfVe2GudSLgXBLxuoQEmk+r
         Drl8fWpj81j19to90L/5vmn9a75P91vvDj+gd3ItZDpDn2GZLVZhvHZwjMAjXNmi93KL
         RuyA==
X-Gm-Message-State: AOJu0YwS+dGZRdKcd5qsFKUZkIzQyFl61o5GERDLCrzZhfXFDy1AFvbL
	uvF0UxYNFTBD76uqSYhuxb67qbRuqtXMZbpwSP6C6TwsCMh1MvyNjKeyettM
X-Google-Smtp-Source: AGHT+IHsYm0dM/Xqunqe8p1yMzXboDkhFtU6PDkHf6PCAJNM2Jc9uEf4yn2zHe8DyzBrV+hxFKzg2A==
X-Received: by 2002:a05:6830:4426:b0:708:60b6:146b with SMTP id 46e09a7af769-70b746db5d4mr7875084a34.8.1723399468027;
        Sun, 11 Aug 2024 11:04:28 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf42f4276esm1383996d6.66.2024.08.11.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:04:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto-rt/6.10: update to -rt14
Date: Sun, 11 Aug 2024 14:04:20 -0400
Message-Id: <85499a783dfc9a22918bb4dd4f9d84924ba3bad9.1723399246.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723399246.git.bruce.ashfield@gmail.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 18:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203188

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.10:

    c0094e55e84db rt: fix sigtrap merge issue
    a36d03a550e68 v6.10.2-rt14
    c3413f2811925 drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates.
    cd3f2b6b09248 bpf: Remove tst_run from lwt_seg6local_prog_ops.
    42137fe6d0b42 v6.10.2-rt13
    49fdabfe4a53f tun: Add missing bpf_net_ctx_clear() in do_xdp_generic()
    3838f16f95d85 task_work: make TWA_NMI_CURRENT handling conditional on IRQ_WORK
    5e812508c93be v6.10.2-rt12

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index a060100761..cd862b8fdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "887c7d0294726a161396812dcf2088f29b522b48"
+SRCREV_machine ?= "c0094e55e84db839eb3624a2f99d826dd3cbb3e3"
 SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
-- 
2.39.2


