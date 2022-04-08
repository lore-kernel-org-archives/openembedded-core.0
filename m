Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D326C433FE
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.1109.1649445923727088493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=H3WY/oMj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id x5so8258061qvk.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oB9GddHXWtvQyV/i8/5+jNWoH56YcPy3YCTyC3YKwGA=;
        b=H3WY/oMjiEi4WfDzeEOQY5RIGfZUrjYvrMOW/LDWdAoGvkFRSTi2vfO3X1vR01abJH
         yUlgLE93Lh0bhvrDZRKlx0jMyo1h+wmevb/D81aCvpK3Fz/0/rUqfvlpWR2GLBjF/2js
         +70+KUtUsQFgC/wa5nVrqEpEMqeR4VDOqGDAnQLWSiLRwoQIRcnqqIv2++fR28MAr2Rs
         +OLoASQWCOC4xbWp8KDMuUSXXCJSFzcefzp7jJogkTudrhaWkma5hy+X286cfiyTHPL7
         tFeJm1rB/27y+Mk/l++yhErAEGPJgW8Cs4pcl+c9OxojquXC2nEcVr9wafnqZm9eTnQ+
         hucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oB9GddHXWtvQyV/i8/5+jNWoH56YcPy3YCTyC3YKwGA=;
        b=iIh2E+3dT1ErWi8tGdtimSEzr5NLRB+4WpALHOg6P6t2lrI1/e0HDBeOtByeZTgTQe
         rFXiepi1eIL6U4nJfeSxZbRKjlpSk1+nrEM5U19XqroRT5mu7/beSYUHxsjwrXwnfqq6
         lQ7Fu2Y45QyXZXo/14cOEf/nxszjL1Zsd4/nVd8WtKE2rtzBOPAeenUHgfnXboYm9QT+
         TodRLdXyJk7Jz5FWaQ+VKIfcI9jrt/6I3T3GbPVquAgn1kwtsqEKkgQPpt76JIujX378
         1lZVEOiLXTMv3qEZHdBhhKvQwkRakBsrpIq+Pi+YD3tg8dpndPCMz84gdmGmurilqfdi
         w5IQ==
X-Gm-Message-State: AOAM530kLw7g5Jcjqp4RT8sjUdMRXWb5/393ielR5Ils1Ks27oWiW2xM
	A749rpVD1qCuWnlyME7Pvz+Rb5j+rBfenw==
X-Google-Smtp-Source: 
 ABdhPJw8EkK4GpoUilfOviQv5Jn/V/CPqW6kTJ/BRkEZ6rC7M1V3BiLgOXPucQ8weFz4vtXDYpKwEA==
X-Received: by 2002:a05:6214:4011:b0:443:e253:61fc with SMTP id
 kd17-20020a056214401100b00443e25361fcmr16940796qvb.110.1649445922768;
        Fri, 08 Apr 2022 12:25:22 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 r15-20020a05622a034f00b002ed0cc7d856sm1325945qtw.37.2022.04.08.12.25.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 12:25:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/6] linux-yocto: Remove unnecessary,
 commented out qemuarm entry
Date: Fri,  8 Apr 2022 15:25:16 -0400
Message-Id: <20220408192521.1608764-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408192521.1608764-1-jdmason@kudzu.us>
References: <20220408192521.1608764-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164163

The line in question is already in place in qemuarm.conf.  Remove it
from here, as it is not necessary and references an older kernel.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 3 ---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0cf14b748f05..06242ade6819 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -25,9 +25,6 @@ SRCREV_machine:qemumips64 ?= "279f142932679a8ba212ebae4b9db851636a1fab"
 SRCREV_machine ?= "d2f7a595bf0b752275d503046494b668549cb151"
 SRCREV_meta ?= "2278ed571c14df6e87d8e01ac26f649d98020623"
 
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 54157fd2452f..5cfa0c37d7be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -34,9 +34,6 @@ SRCREV_machine:class-devupstream ?= "e29be6724adbc9c3126d2a9550ec21f927f22f6d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-# remap qemuarm to qemuarma15 for the 5.8 kernel
-# KMACHINE:qemuarm ?= "qemuarma15"
-
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-- 
2.30.2


