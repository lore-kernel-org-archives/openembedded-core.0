Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B41DC433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:39:45 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.10889.1652193578639703129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=S3kqy0+i;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id n18so16932085plg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=R3JHZpJlRuEyZGASEG8KT7RQz8QSJmSg9Egmsfhq/Fo=;
        b=S3kqy0+i0TZHF/tbUWw+vxjKRRXDnVtkI8Z56cxvr0EVmGzLU/+zk25fHXR0adil2k
         Zw51FSeF6UwhzMVZ2QhRpYDgUL5IOP3UQITNxqYtZC8Ix5hcdAyFh7cjNjZiuNglgJEy
         0iCnzBgGMun0wmxOU7bxqr5X4fHBJ/HpPrYDEJ7R/ll7xpkuWMALjJ61HMfGL9Jt5rkS
         Hrgh+ncbodrt8hyGgPuYcy+k5UkQv+4VWMzs69Z/2lFj2s4uifYGcvsiysNcKuNIj0IX
         S6HKEF4iH89q4lfGqWzPZTo79ZXD5D+EJ1KxHBaZ2D9xjPNCFFAGXh/0r1pEeLLZjCmK
         eQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R3JHZpJlRuEyZGASEG8KT7RQz8QSJmSg9Egmsfhq/Fo=;
        b=a6MIEcFs6RGUSDVh4pqvArlz4HreAkf2Tw7+oLhjMY6O7p5mi/YZKOdR9c7RGj8zIo
         MAbQ7niDxd1S4RHSMW22hu8eb3LoBuONDLb/bnxMlGVZqDgyTABmklX7a8wl3I18GhhH
         5neBG3b16/WeWlMEo4S6IEeCHCgpE16o3NhgC9w8cwyllWfImbF9qYQtmjmmx1bnj16W
         ACZQRM5rTve0gviBhE2Y5Hx+IJ/ooqCbwm+gviAYcwrgfLWx8nb+PIiQ2M32lKYQmzJb
         8ygiFmj6qcw3afxuHj5NU8cpLILRlK4L9Ui692onYh366C+N5Yuwt9Gk7pI/51W5SKbf
         SbNQ==
X-Gm-Message-State: AOAM53322SZIrpwk75uafqHYd6FYg3MvBeSHlenQa7qDCDnVX+o6y4cf
	/sq3Dwf5RMVWZcXvf2fAPzBC2wjoYpbRvoZM
X-Google-Smtp-Source: 
 ABdhPJxIdalFSMhmt9GJ8ZQkOredgS8yAy1gFXS7aXtF/20ACKPMWzIDNVwS+ler26bWyqXyDEkGhQ==
X-Received: by 2002:a17:903:292:b0:15f:171:e794 with SMTP id
 j18-20020a170903029200b0015f0171e794mr13766748plr.107.1652193577545;
        Tue, 10 May 2022 07:39:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/40] linux-yocto: Enable powerpc-debug fragment
 for ppc64 LE
Date: Tue, 10 May 2022 04:37:04 -1000
Message-Id: 
 <fea79d18807c82e5aad3be5a4c9261c8f3ad95cd.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165442

From: Khem Raj <raj.khem@gmail.com>

qemuppc64 is LE by default, this fixes kernel build for qemuppc64 with
gcc12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1674f1aeff5d2b3b2e79cc68ce1156f79eed548)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index b60f3e0773..3d3dad99b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -52,6 +52,7 @@ KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8bada989e5..7ccb13195f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -64,6 +64,7 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
 KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
 KERNEL_FEATURES:append:powerpc =" arch/powerpc/powerpc-debug.scc"
 KERNEL_FEATURES:append:powerpc64 =" arch/powerpc/powerpc-debug.scc"
+KERNEL_FEATURES:append:powerpc64le =" arch/powerpc/powerpc-debug.scc"
 
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
 
-- 
2.25.1


