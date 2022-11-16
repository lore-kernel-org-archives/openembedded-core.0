Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2CBC43219
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 00:38:50 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.1225.1668559115558580640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 16:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mltbnQTk;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c15so9843579qtw.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 16:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClMFnYTAqF7enyf/mragzM8WNkbMjfnN92tf5plBTBE=;
        b=mltbnQTk72GvzC9iKgEbVfoy8/kjq0Pk4kl/xWWgaqL7jSStFU9o7HQcHlKCLiV/zB
         ZJfyY/pg5lIT/qBp2z1VFJy/JLRvmZp3sRPL+8nWl2NKz21hDxlAAqSBJkQLpeaWnokB
         MGJ2CTfkbmoH8jW/B0Ojnau2opkah4pfRMJL6ULX1O7UP7s5unUQ0nQQxrhtMkf44RMw
         +OcoSZKkFt9mmZKSOvpQWKJccS6Kd1HAAP4jUXn4dCl8rk8+dQC0QnBkNKZQ4S1DoD0t
         GP9lKrIzv+YDKCb4y3YxNhp2sMPBqrOdjAHhb9YJiM61xdTUr05tC/rSzXjOASEb4X6v
         9AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClMFnYTAqF7enyf/mragzM8WNkbMjfnN92tf5plBTBE=;
        b=q4z8khyYUo7jSvwT/fU1hseVr5n+Evq1Qqe654FwoOQwu8oC/tO2I6hmOo3TXnwKRe
         Gi0gKU2OrSMAcfmmECrKcvJQf12zOuCryeA1oXS9idCzIv4eHLJk+f7KAUc2O4G9bpKx
         0812t2iBqHqxK8C0VuoH9Fv/6sTh2ZVhTQ9v7ned0dLBJR6FQBzMMfVyODlSkQI0EKBK
         guUtx3MaWKRjweVHmWqAT33jZYS2SFpbm2dSDxZF9aQx0Bnxp+nypPkxJL0wDSj+7Ecp
         qym2KfzITjO3WB2Z1Z8t4YUpDAjagxlWxB/6nAQGm8OIHVbJl0uoNoqx+aaiypZRAO+k
         oyOA==
X-Gm-Message-State: ANoB5pnbTmctyWcxQoGaCJUC0HCGasAyRHtAUCukVn+WgGTpX2n0qta9
	gwog379UG78dJJ93bwwypURA2SRwxWO3lg==
X-Google-Smtp-Source: AA0mqf4V7vyKjMj+A/5DbSl97D3itQXaW+R7VgUL4qS5ptH9Ohk/Wf6u/dRlJkrnbQX/zYEEWzTMtQ==
X-Received: by 2002:ac8:7a81:0:b0:3a5:6131:6438 with SMTP id x1-20020ac87a81000000b003a561316438mr19323831qtr.164.1668559120729;
        Tue, 15 Nov 2022 16:38:40 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id z17-20020ac86b91000000b0038d9555b580sm7926243qts.44.2022.11.15.16.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 16:38:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-yocto-dev: bump to v6.1
Date: Tue, 15 Nov 2022 19:38:26 -0500
Message-Id: <f0ef5687c0599bf527a99da7af4fa2e880bb0228.1668558954.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 00:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173371

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v6.1 is available, and could likely be the next LTS kernel, so
we bump our -dev kernel to start testing with this version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index e85d2ab723..8671b3d30d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.0/standard/base"
+KBRANCH = "v6.1/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.0"
+LINUX_VERSION ?= "6.1"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


