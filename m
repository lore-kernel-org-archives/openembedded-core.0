Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED53E77180
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:06:37 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.4149.1733864791300048530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+YF/bqJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-46753228bfbso24576901cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864790; x=1734469590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8X23n1vNwxsHN8S7AF6riL3X4JJyjsXwv14sOb01os=;
        b=J+YF/bqJ+iQO6Vj77Yv7lZzqCj1WAuUzeayXlFxera9KF42/KMrZD1J4l/S04+WB4q
         o1vsZ+ewCF52I23A1Oryi9RB/Y6k7AgDhA6CB0t1fbnuCSj0GgQjVMKOyU8yTBDws1Nr
         f1PKEZ7GDpRMN3Rxd5V54AdYIY0rBrxm7fC78k3egNR/1leY8d1jMqtBwdzCE0cIk8ac
         8pn/JAR6TFtPXRhizGpr/Z9R/AnEDUrimxNM+1ExAegzGc2Sa1EWI6fqvYK0w/xbrbs+
         2LB8j7qe1V7F64aTdB6XJxW3fZ9uNNF8WGjVn8nDYxMGJ4eGhBEV6vK5zH9QyDfs+t0y
         t8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864790; x=1734469590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8X23n1vNwxsHN8S7AF6riL3X4JJyjsXwv14sOb01os=;
        b=sEZPumhosQttZaV1I12uwUh9uWTiEf5kaYzvxVibIIZ4yNKF0PXRGDX7sGhROXdHUw
         oioUd8SSSY3rYzPcLplQGPM/OkZvk+SCutRiiYwePEhlFxXZGA+KIZmqcuCeIRG4gr/s
         HSwpptEtfUYQAt+xZB24DA1jeh4jaigXWDIg6O+WF879f+7eY1etSmMrAuVW0RuvDLmP
         LA8qXWqPzki6KFqMWg+leZ7jKTVqqsgUdGhE4R3T3Eb1T2YLUYiXzzuMLRyV+Pi3C7Z8
         d67319PyrnNXiWXH3hiVaG7ipHzO9kEo+KotHuOoA28rd6tXkpMPU51mpNfXy74BPbGJ
         k3Cw==
X-Gm-Message-State: AOJu0YwTcDUjykwPBHMXkawO+/TjHbVH+sNcLVO3RfDaBibxrOmB6L5/
	rTXNZhtF+aDVyT9jBY7jhKfqxJCZ8pjlN9LkG+ikysLG0fOkbCkBjjHPrNtV
X-Gm-Gg: ASbGncsjQQB7lmFIQhnUeIptmpNxm39ooWPaAXc8/3w9HWzZGnBxwDY3CBIbIVEe1W3
	h3YRlhAL/KRstLQLNBiLsNyQREVRzs5FXic8GuHfkkbm+j+J/OItIB8WFYaeR8IZY4SP2FfwRWS
	+fP6KrsNffPLDx32HkidPX+GQIPzh8ptMUBDGX5+9k8srnHHhBdIR1AjoT3GDVvJdwY+AFm1x/k
	IDQVqIsNsOVDEHXpugC5P4i+mecZdLSdj/WsD2Q5gjgmWYYEGMGJLvS85GR8AJaBTZGQlsQ/Mpu
	68EI/A70o5gLbbZXZk12JzXtNdApkDgxBNxS57V0QcbMuDa2Gfys9PU=
X-Google-Smtp-Source: AGHT+IG4KqViJkFC+N7M38Kr5rSwKPUyvSV1lNmbBYHPmLnIQFJ2luijL3Kmtiid01chEuE0mWk1BQ==
X-Received: by 2002:a05:622a:1825:b0:467:4395:2ac9 with SMTP id d75a77b69052e-4678930acf9mr5231941cf.31.1733864790195;
        Tue, 10 Dec 2024 13:06:30 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676e091d95sm18415301cf.12.2024.12.10.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:06:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] yocto-bsp: drop 6.10 bbappend
Date: Tue, 10 Dec 2024 16:06:18 -0500
Message-Id: <6b100ab4a08b463db909022b5bd2a6ac7513c29d.1733864271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1733864271.git.bruce.ashfield@gmail.com>
References: <cover.1733864271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208562

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.10 reference kernel has been removed from OE core, so
we drop our bbappend.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto_6.10.bbappend           | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.10.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.10.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.10.bbappend
deleted file mode 100644
index 5d80f9d23b..0000000000
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.10.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-# COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
-COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
-# COMPATIBLE_MACHINE:genericx86 = "genericx86"
-# COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
-
-KMACHINE:beaglebone-yocto ?= "beaglebone"
-KMACHINE:genericarm64 ?= "genericarm64"
-KMACHINE:genericx86 ?= "common-pc"
-KMACHINE:genericx86-64 ?= "common-pc-64"
-
-SRCREV_machine:beaglebone-yocto = "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:genericarm64 = "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:genericx86 = "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:genericx86-64 = "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-
-LINUX_VERSION:beaglebone-yocto = "6.10.8"
-LINUX_VERSION:genericarm64 = "6.10.8"
-LINUX_VERSION:genericx86 = "6.10.8"
-LINUX_VERSION:genericx86-64 = "6.10.8"
-- 
2.39.2


