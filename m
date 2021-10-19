Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E03C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:29 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.15516.1634673268496076933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cRkhMgrN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id o133so898329pfg.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pA39j1+hqpU9FgqkUN0tOt1vFXvmyia7jnyS8Mir6iw=;
        b=cRkhMgrNshYDfetQGpImPqfMRYVUROa6l5v8OousX3K2ha1521PV/CED9C6s9100VD
         9/eC5193RZZWtfGZQKo9By87xSw0MR07TKXtMyFE29XXx8632L78up8UMlSyLylAQNzn
         7Fh+5M5pY90a21GPcQhD0Yy2oS8zKfkIFQTFSqsjaBqoiIORCP2IrlwOmodPhD7Q7b17
         quZ+jv5Oo/j0622Vh3zTqY/y36oSQxWUmcsHlDDIRhtoNo+h37mggY1WRt5Xung4MzUd
         1YOTSkfHug86IMJAfPwGInnFYP2wZ9gE1WW908iRjjbkBIqojto+mHsaEKp+bfyiBw5u
         Tgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pA39j1+hqpU9FgqkUN0tOt1vFXvmyia7jnyS8Mir6iw=;
        b=g9tOnpQ+t4Nqo6MT7zM3YPSRn2EPoWqeTekKbslSMZHa270A4Gv7BA/N2tYs/oNba6
         2d4ygvlj5I3A/qqol8peeUcZ7Z55L1WaquyBtKOz3GsCN28IBBKmX+CHMFGSpnJrTKcE
         Dt7jhhcuSXc3Y5VozriLchQK7uekrK19gg8Ftui5uuFCaymp2VHcjqc4YvAkIlfZKrj+
         1HOUeHJbXqJRiCy7sTQkgbEVWigABzWwxZuoTBzut72xCgs6n894CKORuhmK+gGzmVBL
         62wXqIvdwPngloawMntfIR9eTTZatQeBeADPOW/VlRlsjlPxwmRmTUfhdj+8phC2k9Jy
         wcEw==
X-Gm-Message-State: AOAM533M3KTFdZuvcxKP4mOZWUnNhDjFed8j+4KgpydMTAmbqIJgeaeL
	VP0dpA7bAFOQyo9ztaR0JiftaWMf/hjX39P1hn8=
X-Google-Smtp-Source: 
 ABdhPJyJw7UIRVCeZ96hvz5v9kYnpRDaYqIom/XJFR7IB+5sZaWIDb3f8Tu7K7E4cmczi7FaQnL2hw==
X-Received: by 2002:a62:1887:0:b0:44c:872e:27ed with SMTP id
 129-20020a621887000000b0044c872e27edmr1731468pfy.71.1634673267497;
        Tue, 19 Oct 2021 12:54:27 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/38] oeqa/manual: Fix no longer valid URLs
Date: Tue, 19 Oct 2021 09:53:20 -1000
Message-Id: 
 <8809209c95fa185c29d11dcfc4e69cfe0efabd92.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157214

From: Jon Mason <jdmason@kudzu.us>

autobuilder.yoctoproject.org URLS no longer work.  Update them to a
working location.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 56f7bac1f0d1ced41e6908706be27149aa7b87e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/manual/eclipse-plugin.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index d77d0e673b..6c110d0656 100644
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
2.25.1


