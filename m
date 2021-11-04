Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7AFC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:48:34 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.2785.1636055314086336767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hfSgAs2O;
 spf=pass (domain: gmail.com, ip: 209.85.219.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id i13so6032105qvm.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9MGFeqe2rLf4pzLKquTmllTWCThlzEMbSMA7ACPG7YY=;
        b=hfSgAs2O2dwede5qlAOxiUM3EsoJUERFWqfsQztVLJg7BKkQIvk6Zhja7NzaWeax46
         ZiDILFNcK8s6oFYuZ4X81ZGPZC51tqKMANwJ1MQ5dFgB5TQVnXq6uTtFWl0h/t/c3xJX
         +YR7eOHEQwgPGmE6uGaxv+yeepaxuUFvzx4fc9h503+7nkmM0g6251146vB2mAV/TifG
         30O2TH4pQPAIV6oOHpo/XvixaDOOWAl+AtY1knXjYj9Qwk1P6mfDRh34VjyFSj9o3ULI
         rqzE03/zcyOGtmFdICRtjkaohqbcaQQNtYKkzUF7GVUHSTcBeQUkyBzJr2ZMYIYjvCWf
         GPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9MGFeqe2rLf4pzLKquTmllTWCThlzEMbSMA7ACPG7YY=;
        b=xQ1u0yhbgZhwU2Dlv3dUjr2+wm7DHPPdL3vMOTiT9krfGnuUvWK5KTxkIYIEoM8GSk
         CfN7OKQk342Jmqw1g2VV/VECeJuEBPQBBkh42wJrOEgAN6r01/X5BOjgkH4OKpeKy5yq
         jvws3My4D2it/V9uhRULTmU8Yo9daRdIDQloy+nVWviWNFReXieF1hKv9fKqyOPJhU08
         J7l6qxiszDvsKheenxERG/+Ftz5/0CVRYoFavfYPqYyxIjoFj+2Lh+6BpxmHDLqFoiWA
         Ij0JnpZ2pvKe77B/6/W/olNDR4/DN3tf/RSFOTNQfbRFeYISzMKgLmyvaT5amEhGKfC+
         w1qA==
X-Gm-Message-State: AOAM532IgPpI5QRYljQlTdJajL5Ujc1POCrFdFPDsKh33fe0Be88vHcn
	1yvBKDQzTjk2YV2TVsvV1RffRdbwgfi5Cw==
X-Google-Smtp-Source: 
 ABdhPJwSiPdvn/DldrO3MP5LTdwsvkupNx19a5rx9h8S6bDrJ9tCuvZWfUP+oiyN7tzuHxnagK3W8w==
X-Received: by 2002:a05:6214:4019:: with SMTP id
 kd25mr14843523qvb.27.1636055313220;
        Thu, 04 Nov 2021 12:48:33 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 br17sm4276771qkb.10.2021.11.04.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:48:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto-rt/5.10: update to -rt54
Date: Thu,  4 Nov 2021 15:48:24 -0400
Message-Id: 
 <57b664576360539320fc4ff2bf692fecbdc6a6d7.1636054726.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636054726.git.bruce.ashfield@gmail.com>
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:48:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157866

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.10:

    f01089784fd6 Linux 5.10.73-rt54
    f34df8f3c666 Linux 5.10.65-rt53
    271c5e6e4064 Linux 5.10.59-rt52
    1a4bba4bc32c locking/rwsem-rt: Remove might_sleep() in __up_read()
    ff591a2bdcfb Linux 5.10.59-rt51
    8d185ac23c11 Linux 5.10.58-rt50
    2c0fd44153f5 Linux 5.10.56-rt49
    8b083d3c993c printk: Enhance the condition check of msleep in pr_flush()
    448cd29e3bc9 Linux 5.10.56-rt48

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 34bb95e4fc..c210667350 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f7d2419be110c618b74cbaddaafbabf4a886b91b"
+SRCREV_machine ?= "f01089784fd6234111851aad756297e0f258276c"
 SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


