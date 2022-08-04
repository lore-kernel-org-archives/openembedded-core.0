Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422F9C25B08
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:15 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web09.710.1659653884902031420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XM+1K/qF;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id h7so960513qtu.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pIuetLBRg4Lg+NuWagdF1Ok48pZms01IjQxWnbdCNvs=;
        b=XM+1K/qFZEvq7jBhgLpq3yWBsF59B5cVYD1C1Mj1PuMDAJ5Gb3mg34ksueRRjd1qIw
         vOt1U2GMxiZyn1sd+nlEJy9LI49pq0kqdJtXSBJwGAs544v8lVszejRoQVScpn/XpcXR
         rz+88mQJ5m2BDdB36VYW5NmXPLFQalndV8cZEqRcHm87fd5sNN+kLg1R+jt4O6Qopzph
         lpzYTUXx/9SOlfBdQa326V70mzxP75rUHqNjT+HljNkJ0xrfWTnbzNMrwuzjgdPKYdxk
         47Q+q9AEjM/ZtRQNf7nMR2LDvqjWn+73ezCmWVgtG/tCdRLSp/Jbm/GYHnH0hiy8JNq1
         yPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pIuetLBRg4Lg+NuWagdF1Ok48pZms01IjQxWnbdCNvs=;
        b=QHVi8SBzqiWY3dZRTre857C/PfW209nmQG8kDZCqGigTP9rCrKmmD0HM95IBP95UpM
         ncDodYBnizb7Cn9pgSjjSueui6ZHixDme12iNO9o6H3SgNrKDDXuYSV0ffzJ5tEB6inG
         o6f6ZVvLAhO28TVk/sO+3Cdi1swnDrykr0QGgqNXugt96SwMRnpF4n7wpkr/oKz5dqFp
         um0h396uZz+FaeosHVKQTE4toqKsOmHEnnpw2IPvWau8BytgEIWh1DdjXmEUmpAR4X23
         SQA7C7ySpHyW7xcvUZJcMyd8acpYLHWYivkvmrMeglrOnCAtcwzMAf5/T+038QBiXrji
         PmHA==
X-Gm-Message-State: ACgBeo3o3SJQMK4szjmBzbWXkmxgTRY7AXVqZ8JyYIcocEbv59tJhJ2C
	22P6TmhJpFpOmUJBkOg4Yl1Y32mz1rxrDw==
X-Google-Smtp-Source: 
 AA6agR49/UQYdTGaaOwpxUBHBGcfckND3O1XwcypeRj52fRecd1rQ2eGmVox7YqJWg3xHDZwJwxFAQ==
X-Received: by 2002:a05:622a:253:b0:340:75ac:63d3 with SMTP id
 c19-20020a05622a025300b0034075ac63d3mr3545205qtx.112.1659653883898;
        Thu, 04 Aug 2022 15:58:03 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:58:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/13] meta/conf: update preferred linux-yocto version to
 v5.19
Date: Thu,  4 Aug 2022 18:57:43 -0400
Message-Id: 
 <1d602045d7bd6ae501f600f39bc0f445e328ffa1.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168870

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v5.19 is the latest reference kernel, we bump our qemu machines
to use it by default.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index b70924f7d9..4052eacdb5 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.15%"
+PREFERRED_VERSION_linux-yocto ??= "5.19%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index abdae5f361..fe6c0117a8 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,5 +17,5 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-PREFERRED_VERSION_linux-yocto ??= "5.15%"
+PREFERRED_VERSION_linux-yocto ??= "5.19%"
 KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.19.1


