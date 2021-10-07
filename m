Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C84DC4332F
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 15:06:34 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.13415.1633619192935747694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YEEVzklo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id e16so6380941qte.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x9cuHv7Fj2OqQQXCVbBBvdzv8/qh7TsiT1FJbCqesuo=;
        b=YEEVzkloMz7BhSadoJk/mRBAbn7Bbfkw13GVKG0qDCiLvBEe4OuAgumbla+F3I9/Co
         WMgZrrqy7NLaIXMglX912pxg4nEGxn1XuDt+dPdk95ihOCEYwvl6FEHgGhmNQfHq+Rfk
         M8Mcd7JMVYRIqRBnHiqIi8b7VAvr4a4JvV6y23VZqUvJaI7eQhH5jKAQmP1uJhn/lcb0
         hDTRuQJsKSwEPScKbAUEjD6pqq9d2ZncaNj931O5Gg0yDl4UCvhhPwQ/cAlxXuL/nZzY
         X1Z9RxGeKeJ38WrLIFiQkLzomaKjIJ9z75JIcimRQUhqoo9kMR7x/W8fqPYKtt3eHGkR
         imIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x9cuHv7Fj2OqQQXCVbBBvdzv8/qh7TsiT1FJbCqesuo=;
        b=WtQGpBmjE5oEGXR1CLke0IVued4WaNm/87B/X4Sn3guXKdhQ6msfvHtWcL5l33XZZD
         jtC8jKowD+eXIgIQ/H8JKn6MHLJtcItAzJWlYuUWstWzzv+NDRi/naxjJLb3Px9l1/AM
         kLCCPiMqYMuNfNfMx+DY59UlknocypjurqSQuQnUL4b/pCplyLUTTmJmEGgIYyTP9Msj
         POrD2PjkK5W9NvT6eF/nyiNY8FsnGc/WNUsEJTV+o3PDNWPmgwtPLLby3BU6ItC+ykga
         6O2YYr4b2h/+RdhEnqVjmIVZM4OphgoJmeDMl/zVvu8T3JDEDOidD6aEtKyoyj7TN2kL
         9AIw==
X-Gm-Message-State: AOAM533H9z1csTVaUCEmb4qxVr2P5Sy9eCYg7nQH3+Qkha3MMdFMJNvl
	ObEJNbFVGPEFQB6q3Q6jnY58RoOpaXQYqQ==
X-Google-Smtp-Source: 
 ABdhPJyfM7P+XmkwBISByUKk93hJwfUuu9MluUWPHfIUs3MghwppIzydzsl+4OoDlYSUSDa8BEHCGw==
X-Received: by 2002:ac8:1c6:: with SMTP id b6mr5429589qtg.221.1633619191921;
        Thu, 07 Oct 2021 08:06:31 -0700 (PDT)
Received: from localhost ([2605:a601:a650:b700:9937:f30b:7d2e:fddf])
        by smtp.gmail.com with ESMTPSA id
 v22sm161261qkf.79.2021.10.07.08.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 08:06:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org,
	bitbake-devel@lists.openembedded.org
Subject: [PATCH 1/8] oeqa/manual: Fix no longer valid URLs
Date: Thu,  7 Oct 2021 11:06:23 -0400
Message-Id: <20211007150630.22138-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211007150630.22138-1-jdmason@kudzu.us>
References: <20211007150630.22138-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 15:06:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156729

autobuilder.yoctoproject.org URLS no longer work.  Update them to a
working location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/lib/oeqa/manual/eclipse-plugin.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index d77d0e673b8b..6c110d0656ec 100644
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -44,7 +44,7 @@
                     "expected_results": ""
                 },
                 "2": {
-                    "action": "wget  autobuilder.yoctoproject.org/pub/releases//machines/qemu/qemux86/qemu (ex:core-image-sato-sdk-qemux86-date-rootfs-tar-bz2) \nsource /opt/poky/version/environment-setup-i585-poky-linux  \n\nExtract qemu with runqemu-extract-sdk /home/user/file(ex.core-image-sato-sdk-qemux86.bz2) \n/home/user/qemux86-sato-sdk  \n\n",
+                    "action": "wget  https://downloads.yoctoproject.org/releases/yocto/yocto-$VERSION/machines/qemu/qemux86/ (ex:core-image-sato-sdk-qemux86-date-rootfs-tar-bz2) \nsource /opt/poky/version/environment-setup-i585-poky-linux  \n\nExtract qemu with runqemu-extract-sdk /home/user/file(ex.core-image-sato-sdk-qemux86.bz2) \n/home/user/qemux86-sato-sdk  \n\n",
                     "expected_results": " Qemu can be lauched normally."
                 },
                 "3": {
@@ -60,7 +60,7 @@
                     "expected_results": ""
                 },
                 "6": {
-                    "action": "(d) QEMU: \nSelect this option if you will be using the QEMU emulator. Specify the Kernel matching the QEMU architecture you are using. \n      wget  autobuilder.yoctoproject.org/pub/releases//machines/qemu/qemux86/bzImage-qemux86.bin \n      e.g: /home/$USER/yocto/adt-installer/download_image/bzImage-qemux86.bin  \n\n",
+                    "action": "(d) QEMU: \nSelect this option if you will be using the QEMU emulator. Specify the Kernel matching the QEMU architecture you are using. \n      wget  https://downloads.yoctoproject.org/releases/yocto/yocto-$VERSION/machines/qemu/qemux86/bzImage-qemux86.bin \n      e.g: /home/$USER/yocto/adt-installer/download_image/bzImage-qemux86.bin  \n\n",
                     "expected_results": ""
                 },	
                 "7": {
@@ -247,7 +247,7 @@
             "execution": {
                 "1": {
                     "action": "Clone eclipse-poky source.   \n    \n    - git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
-                    "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   http://autobuilder.yoctoproject.org/pub/releases/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
+                    "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
                 },
                 "2": {
                     "action": "Checkout correct tag.  \n\n    - git checkout <eclipse-version>/<yocto-version> \n\n",
-- 
2.20.1


