Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB16C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:23:49 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.11183.1642184628616713972
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HaG56biX;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id s12so7233108qkg.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c5fGwWnSfW+hKQtfaOU5K1LFARrGNa0wE4nsUvhH6q4=;
        b=HaG56biXJj2gqpdZtW976BpymUzKvigM/TG8fCrGtqqJpiIt7mdjYuqChn5E6KP4cQ
         IbTTG938TP93pfZ8oXEYAS8sKO36I7Sadb/2Ruxgef7OAXpcU9eSBsoY3KkfLJhL4/RU
         L3KbIZt/1iYizBEH5sGxGK9gfHg2UPUoRTXIG8V+Eo/bY9cVdv8nTjswFpSnEltbBX6O
         6Wml6Jx14UhGsbPOxBivSUSlnqu6NsBiCmlTWxqSZ0n25Uzn2AMgaVCdpjLKGwiCKbi2
         LbdvUtprIKnZkfzDYFDacysm4HsPBYJjtPtzH6D92Rk/p51TxpEh6O9q/Lgk2GnB/UFo
         eM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c5fGwWnSfW+hKQtfaOU5K1LFARrGNa0wE4nsUvhH6q4=;
        b=DNPWDvTd2O3mIMtHpRbc2vHPP2NzAMDp018Ajf8t9JBgHRc5ZZ1Y/NTRhOEySkqWSP
         dI03b2tUx+d2iP6Svtj4fIrarhHujRFlzN5waqnPqS3aC0pRHnMD0JePrAKQFBTV/jS7
         S7zrXNKLeDQ0hZgMa11tnUUk7kGhFo7z5OhJe/2r5tNtTYQgjy3qWPc6Dw4r9srAyTJe
         4GBuTaNHl+Dcz2w/yJooggFxM9NJkhnj9OZMt+PqKsEnYxhlwYWYcqDpxcycj7MGWJml
         7L6YfHxYzUar+0ycGH2mCZS2wHLb7Yb05E5a4Cph4uREMPAohD9Lil99u7GLR10jYQ0y
         M/cQ==
X-Gm-Message-State: AOAM530BPy/cKpLvEEAc62WDlUGcr/WojavsNgy6enwBYrsheoFRR+4B
	XN5/dgf0p/f+WG8Nks/ktzQ6/UWrwCfC4Q==
X-Google-Smtp-Source: 
 ABdhPJyKG7BiSGG/wLlqRzU5IGlrTpnvCD7mswAQGMwBHZt4BO5ZrtiGs8tfnAz07VdCjOrMklUFpg==
X-Received: by 2002:a05:620a:4006:: with SMTP id
 h6mr7223086qko.45.1642184627733;
        Fri, 14 Jan 2022 10:23:47 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z14sm4448995qtw.59.2022.01.14.10.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:23:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto-rt/5.15: update to -rt22
Date: Fri, 14 Jan 2022 13:23:39 -0500
Message-Id: 
 <d15ee9787197df959ec2753f114cfe47d96cdad8.1642184457.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1642184457.git.bruce.ashfield@gmail.com>
References: <cover.1642184457.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160590

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.15:

    799919ec2113 v5.15.5-rt22
    4745560a36e7 v5.15.3-rt21
    9b4d36e0fbeb v5.15.2-rt20
    d156320aca54 net: sched: gred: dynamically allocate tc_gred_qopt_offload
    d36603e0d213 v5.15.2-rt19
    7ddf3a205fa3 mm/vmalloc: Remove unused `cpu' variable.
    3f8e7f777049 v5.15.2-rt18
    7b0fd383bb9a printk: fixup -stable merge to -rt

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8659c606a8..4713e45c2f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4903bb17bd48345aa95509e33f0d3aabb782f328"
+SRCREV_machine ?= "799919ec2113ffcec02207ea67abdc629f3bbebe"
 SRCREV_meta ?= "72e4eafb6b3c999aefc56e1c1b9dfa0c94ae2fbb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


