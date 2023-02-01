Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEB2C6379F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:28:33 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.28235.1675268910717558495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H635ytyr;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id z5so7912906qtn.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLwzoKm75XKdLOI5+t2kerZrRk6whSZfGZSZ4W1h8rc=;
        b=H635ytyrXEfHheleptB5L/A5QcTMqH56SnFNkKnN/veV3Gl5YCRoEYKhsFlkLP5a9g
         IgjrPyxJ5O21CazAz24F+HQvlGKcZQmf45dOFLJy4tH1rt6OBYKJr9ZK7dDxSt/XU+a3
         +nbdiZepxn+FBNOgW8j41T4crhbsX9T9pxSAFV4IiHSTbacgZDhGh+sd6VA43IVmMY8V
         RfXHYiRoJsIlDbTMRJOGzA2ddqlBD1pcYYzhWlmBwk+zhwP6ZXEOHO6SyQUVsTmvij+Z
         l/K4xUpiOsiabJG/CLGbgsZAwtiGGMb384SGgi+GoyRoUbvoTGwjWmlvgLLi7zmnj5t8
         vSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLwzoKm75XKdLOI5+t2kerZrRk6whSZfGZSZ4W1h8rc=;
        b=hu5s1Moz2wPJZOk+HYo2tJ4SHosNhHEc5oiDHF9B/rwoL+bne3bGAe05RX0NzXtfLM
         pjJy+3doqIQRMf7C/aUtmvDM/PW0XotGIZ7dTt/Mkb0+P1fXiiajqvVdjg9spakT1YZH
         3bcQG5uhNeugQcAePKvhL2eFi/MJBda7zBGtfqlvu3j5gJBDzuxJPyn+rsd/q/VWrhNU
         3IWOo66d7dsUB3feZEu74I4gffBXCxBlKWIeXt+anbMX0GyHTd9eHPcEcatD0BR6tUe0
         wDgXltevorbCseY4XTPtbEMfXXXU1XIgzNtmcvbAzLUGC37L06l4ArqLBTcq+B861IU4
         MSLg==
X-Gm-Message-State: AO0yUKVVPJJhIEo8MbFcVkCPePAFddMWbBgdE38zoGV5ukhcENJFbr0Z
	9Gt8ADa2mURkohyFAPQAoY8=
X-Google-Smtp-Source: AK7set97GsmCiYLz4Pr47MwucPzNnRnRX5HyoDZfQt1QnQVQZdQmxe8xB6gIA/wtslwXYr6MsDWeyQ==
X-Received: by 2002:a05:622a:646:b0:3b6:32ed:54e6 with SMTP id a6-20020a05622a064600b003b632ed54e6mr3352973qtb.6.1675268909709;
        Wed, 01 Feb 2023 08:28:29 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d29-20020ac8615d000000b003b856b73e8bsm7528157qtm.16.2023.02.01.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:28:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/6.1: cfg: remove depreciated configs
Date: Wed,  1 Feb 2023 11:28:22 -0500
Message-Id: <98e02f9f8c4b6f4efa8f97eea5cd70fd8c279c53.1675268720.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1675268720.git.bruce.ashfield@gmail.com>
References: <cover.1675268720.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176562

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    dcb315fe731 media/media-usb-tv: remove tm6000 config
    45a27304655 media/media-pci-capture: remove deprecated configs

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 71ffdd6a90..80f0f0e260 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "8605b6101efcfdd8dd779db4fd5aafb94727e990"
-SRCREV_meta ?= "fdad265d2bff2ddb937b3eebdabe344d1f450cf4"
+SRCREV_meta ?= "dcb315fe731825c2d2f1b443c6ee46df1afbe533"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 7cc2920bd7..318eee68a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -15,7 +15,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_meta ?= "fdad265d2bff2ddb937b3eebdabe344d1f450cf4"
+SRCREV_meta ?= "dcb315fe731825c2d2f1b443c6ee46df1afbe533"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 437a98b364..1549181b96 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -23,7 +23,7 @@ SRCREV_machine:qemux86 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
 SRCREV_machine:qemux86-64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
 SRCREV_machine:qemumips64 ?= "4bfa434ee5da72a5a8b2cb8ec799603883f5d532"
 SRCREV_machine ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
-SRCREV_meta ?= "fdad265d2bff2ddb937b3eebdabe344d1f450cf4"
+SRCREV_meta ?= "dcb315fe731825c2d2f1b443c6ee46df1afbe533"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


