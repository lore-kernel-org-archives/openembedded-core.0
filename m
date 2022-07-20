Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A89CCA487
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.51645.1658306708330039184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oZYYMQFd;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id tk8so20447532ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrThsa29GvviKiAiqfklnBQBLlq9WT/XRO8AiYz1y+U=;
        b=oZYYMQFdYIhXp3XmFrps6NNYmQGpA/Xkl/c3ieJ16ECBSOqY61pH+2DDhS46WaF/CO
         Z22NzCQrzdpylnLsDl3+SsOPv3ZeLIF1CAVoChvRDvo0NO/SYH9ysyMP5o/X9GoC1cpj
         xMhVRURw6hn9B+w+XDdUUHWGv52abNMH6Gney/tHOTQouCQOjus5vZH/e447BwzXFsyz
         /r7/BindItohPJFCo1rYUXq2xmgth4UDh6fG7CBI15QSlJX9DCQ1X1TSYETtzaGVvkpI
         MZcW2OiSLApnvvb0lNh0+UCLYvpv2uyboCxYRipoVK2/JeGedsubwzvGwzUvPgvozasE
         6D9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrThsa29GvviKiAiqfklnBQBLlq9WT/XRO8AiYz1y+U=;
        b=Ggtv+HFWrtGJidbyf3b6v02Dgp4B5P4p1kBsrEswJ3LB4SwrtnvyZJDtYJGMlvTQhF
         BwIMiCXu7LwNxugMLxgz1hMc1CPw3vxgOq1Fpma4C844S+LWpV8F32bkkTQzaXrW3+Ij
         uMMcbbA25yXzDTcnZ0g3ZVXITpf5e8l8Ge2iaiiW0sNBEkk3l+2/vK6WVYHxGBiunwzG
         uvuzddJnO6vRz9qED0v2WbJPOnfJ2zl/MkWQtR/yVTWy8wVm5SO2BGRMLX3Ld2QL1c1p
         tDC8eq24Y56zaZ6Kt0YLNfFsnG+ahjri4HKvu/8P9Uobz/HUZNeF1URrPqOIV3JK5yIr
         Ov5w==
X-Gm-Message-State: AJIora+SK36wkyK79RJA1uJMaMYifS25gXyXJ/kOINrj4C4O24sla8Nb
	jXSkhVKp9f7sTv3XD4FUKKsf+pwyT18=
X-Google-Smtp-Source: 
 AGRyM1vs40awWfO6Lk2rORZyXAlCoxGg0y8J9Hu4FTseojigho093kRMyL9/ziRsN+IU5ZPrMHOvlw==
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr32078916ejc.49.1658306706779;
        Wed, 20 Jul 2022 01:45:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/51] libgit2: update 1.4.3 -> 1.5.0
Date: Wed, 20 Jul 2022 10:44:08 +0200
Message-Id: <20220720084442.2940187-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168312

License-Update: added sha256 support under bsd-3-clause:
https://github.com/libgit2/libgit2/commit/b900981cf7f6499b99cf83f77f73cf5fc436653b

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.4.3.bb => libgit2_1.5.0.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.3.bb => libgit2_1.5.0.bb} (56%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.3.bb b/meta/recipes-support/libgit2/libgit2_1.5.0.bb
similarity index 56%
rename from meta/recipes-support/libgit2/libgit2_1.4.3.bb
rename to meta/recipes-support/libgit2/libgit2_1.5.0.bb
index 7e27b5b018..ee4d79b11a 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.3.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
+LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "465bbf88ea939a965fbcbade72870c61f815e457"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
+SRCREV = "fbea439d4b6fc91c6b619d01b85ab3b7746e4c19"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


