Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.9156.1593494333148432431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 22:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pevES7N8;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id t11so6689078qvk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpmAI/N0vBwpoFsLQnkJj2ilSn1RvuME7r1FzM81knI=;
        b=pevES7N8ZOMgHD/n1P8TD0VpslQzkQTfTyCfW9u0Ja3JLwVl5kA9XpEPcSjas8rxM7
         ctaL0jrHL4EezFV2eXXwHIqGbnqO33nIPSjjtvmt0vI8OU532MYPkP/2rZXS1DpDJc4e
         BguBQPPRp0Ykv1kZuU16wGCRv77Qan23/ttWDhzUjcRd0MQB8amTScK3xPdQ+ygpMxhK
         GeZM2ittl26Ey6BEc+2Vqg5s/zzHBOK88qK957HByX5eHATG1bea5jDowvt1I3zNxicw
         XeaVdib4vh5L7n8JAyVTod+h5BredwROQVgIjYA1pz+SJVqsyRse0ybB4p/m6jFTNUlX
         FbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpmAI/N0vBwpoFsLQnkJj2ilSn1RvuME7r1FzM81knI=;
        b=ZBccOvbrhg5BlRsMjWertEQPsAQCsdd4jfeoM7PFCrW0Q71i/a0KvnbvyBTyUxPXI7
         60kG/dN+O12KMh4Hx31KMCOQEoZAk+coSjBamBaTae64HCbKb8sPKve4w4QIXDWLMZZA
         va6tPqzjIxIMsdEbusSHa4sANclgzKGCl74rHoogN+7sSMYSxPa+MOxfvgKFFbV82FQS
         BFYi71Od4ZEr0rLYdEFfL2NxTGCjEDm6IvRS8n0GEuHorkghWf7LRJPVzWoQQGUv0v2i
         jQszC9vYd5AbRj8cLWlE4XsQB0C6f5TIV7r6NsoFVX33Z2Zq62RebUG1okksSIbrBQAn
         CzRA==
X-Gm-Message-State: AOAM532nM23fQpf0R5KCSI/v1yrCIarfyTIHduaCYOg1bIKsdqjcmld6
	GNtqrjuSgPF1jMBRM0wBzAdOC8MrenLg/Q==
X-Google-Smtp-Source: ABdhPJx2rGV9XZoiHzOfYlYlsKKenKeG3Kvy6QmDJNp3HPP6tANHuCp3i0U5qr1qkOc+e4det9yyGg==
X-Received: by 2002:a0c:be08:: with SMTP id k8mr18739859qvg.123.1593494332326;
        Mon, 29 Jun 2020 22:18:52 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o10sm2163403qtq.71.2020.06.29.22.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:18:51 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto-rt/5.4: update to rt25
Date: Tue, 30 Jun 2020 01:18:43 -0400
Message-Id: <9f83640ee59df9a6e8d6b3b46b175e036a427ab8.1593494109.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1593494109.git.bruce.ashfield@gmail.com>
References: <cover.1593494109.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    46d685b7b963 Linux 5.4.43-rt25

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index c88a045dfc..d4d95204f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3401d0c3e51b083016c4c5177de686fb9606f304"
+SRCREV_machine ?= "46d685b7b96320ec6e8b2e1a1126ce02cae35865"
 SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

