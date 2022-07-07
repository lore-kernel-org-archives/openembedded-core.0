Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3E9C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:41 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.757.1657231232065160070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I2Suyr/7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so116653pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/kRyNqe4I8uYPf2kdZ+rvZmJQ/RMHS83uJEcFvzWOFE=;
        b=I2Suyr/7y/f+/iwaWUhRWEaFpaMwgFUYb0o8FWcC/zJDtnS7EOaPO1WH0/7m4orFsf
         d0wDdFDCZsl9nbbivd7j02nPreKf+nnW50rRG0O5Dq1juOm32uCHPyGVWUXPxni8x2+c
         GMjj44xNeKRD+e1OQ1l895K/92bGBuPFSWBNEmVKzFGVqmMvmwCgqFNTvyJaV7BsTRy6
         Zw40HE6fVCmhdJ10z8OCWQ1iv8dmG8sqIoO4gkGcDH376gTMp4an0aOEWBPb9xhYobsh
         lLSnp/q4X1iYAzVK4uU6sj9PFWfdr6Lxtuv/F5CNbI8CEkpqijIkqfO+QFYLex18CAox
         CVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/kRyNqe4I8uYPf2kdZ+rvZmJQ/RMHS83uJEcFvzWOFE=;
        b=eXDQ/A66ZkPOdwgN+JzCTaV3Snh+c/k/GulS4lWAcMqyQA72dzfNzalQlJIyG455fs
         yB601Hobgh9QFOeIieKF5QyQzOzIu5zjIcop/QgKF96Zxl9nc3Zn9C3CJysbcULKcbKn
         5FzzgD+m7UV/ZFlY071MtN7WRNps+v8pSmZz0Pz0Z22Vit96OsOlBjMXMlPlVjjMko9y
         nKyHnNcxdxqHjirf+i7famgot8I0siyTZUDcxrkNiMRcXuRFQMW1eD2Cop7+sq6zFi5W
         jL4OszJTKPVBf40D6ydWyjvCGoJKbs9ccOJa+PKEAN552A2aG5K8VWWK229VUSE7nwlB
         miOg==
X-Gm-Message-State: AJIora+e5e73XNsNeWl9OeglmvWMFh9lUFMJ/fFD2Dj0J1I+hs9rx6lR
	Lzcbx+sX5DfZ8TUMEh1LLwLck/8p/j2/9V4i
X-Google-Smtp-Source: 
 AGRyM1s/NCc/YvaOTIRQJ9eOOvilRQQW3rSAB977O7I/LPadH9MUXG7+x6ji/sBroYB4dNazEg2F3g==
X-Received: by 2002:a17:90a:66c1:b0:1ed:4de4:6a57 with SMTP id
 z1-20020a17090a66c100b001ed4de46a57mr7810094pjl.84.1657231231023;
        Thu, 07 Jul 2022 15:00:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] qemu: add PACKAGECONFIG for capstone
Date: Thu,  7 Jul 2022 11:59:36 -1000
Message-Id: 
 <d358fdb9134114512ee13553762f7502c16ece71.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167812

Autobuilder workers were non-deterministically enabling capstone.

Add PACKAGECONFIG for capstone with default off.

Qemu versions in master and kirkstone have removed the capstone
submodule and configure options so this patch is not appropriate
for these branches.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 25c2cdef3a..4135619fc6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -254,6 +254,7 @@ PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
 PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
 PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
+PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.25.1


