Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E06EC25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:05 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.706.1659653880108677436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=meuUFbYg;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id d1so731462qvs.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XvfHkZJ6EZ3dQIYpFGXUryLpUu+aBeSAE0FOnih+9JQ=;
        b=meuUFbYgtmpdVRX74U20ZRwujSJxPlbxb8EkV578/CMght8djMOsd4RkkgUmgwtBCa
         yFWfV0LmAZSubr2Z5w0Arw91e/PJIPOasTUhxMr/+20BXsw8Yu05r9Mrj/UmSlcmIjun
         pVk4cNmUaQI9B1+Ql4PKgLxJ9FxsUpmgWa5duxTYQzgMzOs43vQU0MAFx2IHETiujCQl
         w10oPBXevRG7GrYIJO4cBNQidHSUgRbjIRGg/wplECB2iFgZ7XFy06UApdKAvqWQauiu
         CYg8aMkwgxrhVwg7Dd+5+cAfib5NV6IdOuMJx7V9ZDk1Tw3thVfwaRe9jbf1dDLm7emh
         VueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XvfHkZJ6EZ3dQIYpFGXUryLpUu+aBeSAE0FOnih+9JQ=;
        b=fREL5Bt4t8TCN2UlbIVG0pSo1aeTpjnkgIncbwOaWvGalVag08gcGtlwQomlI8BEoU
         /9iPk0ORwFhBwgh2uPEH18xeI26BdK8uCqddAHQFkf08ar8xtsP3YzTJrmDvyFDwMApM
         I4Mk00RH2l1M3c/I+hXk+LY61GZwvRVoWwSUqfJgvbry7qFrzjvIjMaXhUdwQff+iWUH
         YqXSr48FcMJpvG0XyE7/N10x+lwm5BVCVhbnCdBsC30ESOlEZpYKIyI98/oHqQH0j2A5
         PYsrUWu7wRwgnHYkEA6nbjJDxGjegE70xDOiq6M0jGKB9edimfN61FGXXVFFeGDKAYlR
         bdag==
X-Gm-Message-State: ACgBeo1+bSyBYrKSzhAbgamwrwLZIiHWSoRey7DREHEcLE5J+x4Yolvh
	pvD8wqqf8pW7YksVwZKxU6TJYTcFj0NzLg==
X-Google-Smtp-Source: 
 AA6agR4Wqb5HCOaOFr5KHGoToaFMhSNvGvfxz6FMrGZBnhn7jegPMZLSTTg6Uz21DUhq/hO/k6F6PQ==
X-Received: by 2002:a05:6214:761:b0:472:f5f3:5139 with SMTP id
 f1-20020a056214076100b00472f5f35139mr3556543qvz.48.1659653879155;
        Thu, 04 Aug 2022 15:57:59 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:57:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/13] linux-libc-headers: update to v5.19
Date: Thu,  4 Aug 2022 18:57:41 -0400
Message-Id: 
 <62216f7a22127842d1527c81ed635bb4d682774d.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168868

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to v5.19 to match the latest reference kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                   | 2 +-
 ...{linux-libc-headers_5.16.bb => linux-libc-headers_5.19.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.16.bb => linux-libc-headers_5.19.bb} (81%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4477689157..d92f4e81bc 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.38%"
 GDBVERSION ?= "12.%"
 GLIBCVERSION ?= "2.35"
-LINUXLIBCVERSION ?= "5.16%"
+LINUXLIBCVERSION ?= "5.19%"
 QEMUVERSION ?= "7.0%"
 GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
similarity index 81%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
index c64629d094..528e1d3379 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb
@@ -14,7 +14,7 @@ SRC_URI:append = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[md5sum] = "e6680ce7c989a3efe58b51e3f3f0bf93"
-SRC_URI[sha256sum] = "027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb"
+SRC_URI[md5sum] = "f91bfe133d2cb1692f705947282e123a"
+SRC_URI[sha256sum] = "ff240c579b9ee1affc318917de07394fc1c3bb49dac25ec1287370c2e15005a8"
 
 
-- 
2.19.1


