Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F73C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 11:51:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.6018.1648727495909541424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=apCOM9MI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so1580647wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 04:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0ofB0lYBifFyWS9aXWlOW9L+qd5qJPCzUkx/hO0Z3A=;
        b=apCOM9MIhGXr+Q9sNWOE+s3VGdLoQYloPtTVmDxcmDDTCNwZNRfzkcg8CH1O+7f5js
         YeI+Mo05+hXT4PC8aPS2DeF8Dk5x/Obf6B14U+Xj15P+a2lIJlOrLUD5Hvc93y6u8koN
         6uc0qB/KJPY9Ifpb+JqialkFiAn2DsR82Z6kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0ofB0lYBifFyWS9aXWlOW9L+qd5qJPCzUkx/hO0Z3A=;
        b=78qtzIYP/x10ZCGMgIkpyP4pGZICPlMN8c0iAHch7aVIE1ZNxWmlj1+OceMhmJKUhb
         uGWi0W1n9OOMggNvatVxMKj+AKVxvOL4/f9cNkBL6n9vuGm1BR5LJ6Ii2kh50fl4Q9Ka
         5v2qGLFzSL+QcMAsv37djTMTxJ9R3BD3CVTBoQdFvKHKGJ54QgI1RRgEP4VlvcaNxYPR
         sM6QRbLjNbochbWo6jusOBZDjfmtSO+kfBrmeAEPWx9xOq+3IZD7Hm88Xr1u+MYfEmPW
         w0IEwjMekg+LqmRgDDh5AO0SC49MfySR+DirtsKdeSIfDXCV8Uvk0UPu0Ixf1imhL2Ug
         ESbQ==
X-Gm-Message-State: AOAM5323Z3bXbEU/9bJ0DCHFeWBo8YP4KcBa0h5FA/0aVVFVrA326IZV
	+aDv6d08gdGOBMLt6jA2LebnFb8EMN86TBg0
X-Google-Smtp-Source: 
 ABdhPJySgTextQnpJ1YC01yfKBq8CI7h6q9xJfMvlzoElj7qxVOvb30YfG3b4LYrKf2BilJM/Jlz2A==
X-Received: by 2002:a05:600c:2906:b0:38c:bed9:86c6 with SMTP id
 i6-20020a05600c290600b0038cbed986c6mr4378960wmd.184.1648727493903;
        Thu, 31 Mar 2022 04:51:33 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6605:7b3b:ef3e:a309])
        by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c354200b0038cb422e3fesm7524023wmq.32.2022.03.31.04.51.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 04:51:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] modutils-initscripts: Change license PD -> MIT
Date: Thu, 31 Mar 2022 12:51:29 +0100
Message-Id: <20220331115131.1565450-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 11:51:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163810

The file was originally added to OE here:
https://git.openembedded.org/openembedded/commit/modutils/files/modutils.sh?id=3b3989442075d0a4c6c32cb187de17d87bf65fbd

and the license added here as "PD":
https://git.openembedded.org/openembedded/commit/modutils/modutils-initscripts.oe?id=4f7d2b1b63d166e5de146d71e5c942419424446e

As "Public Domain", we can re-license it to MIT, which fits in with the rest of
our metadata and has an SPDX identifier, so lets do that and try and keep our
licenses simpler.

This also them removes the need for a weird license patch in SRC_URI.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/modutils-initscripts/files/PD.patch   | 8 --------
 .../recipes-kernel/modutils-initscripts/files/modutils.sh | 4 ++++
 .../modutils-initscripts/modutils-initscripts.bb          | 7 +++----
 3 files changed, 7 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-kernel/modutils-initscripts/files/PD.patch

diff --git a/meta/recipes-kernel/modutils-initscripts/files/PD.patch b/meta/recipes-kernel/modutils-initscripts/files/PD.patch
deleted file mode 100644
index 21ac49cbd8d..00000000000
--- a/meta/recipes-kernel/modutils-initscripts/files/PD.patch
+++ /dev/null
@@ -1,8 +0,0 @@
-Upstream-Status: Inappropriate [licensing]
-
-Index: modutils-initscripts-1.0/LICENSE
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ modutils-initscripts-1.0/LICENSE	2010-12-06 14:26:03.570339002 -0800
-@@ -0,0 +1 @@
-+Public Domain
diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
index 67e1dcd9907..e9aaa66cb71 100755
--- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
+++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
@@ -1,4 +1,8 @@
 #!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
+
 ### BEGIN INIT INFO
 # Provides:          module-init-tools
 # Required-Start:    
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index aa71309126f..8f4fdd76bfb 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -1,9 +1,8 @@
 SUMMARY = "Initscript for auto-loading kernel modules on boot"
 SECTION = "base"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
-SRC_URI = "file://modutils.sh \
-	   file://PD.patch"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://modutils.sh;beginline=3;endline=3;md5=b2dccaa94b3629a08bfb4f983cad6f89"
+SRC_URI = "file://modutils.sh"
 
 PR = "r7"
 
-- 
2.32.0


