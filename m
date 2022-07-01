Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBD8C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:44:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.38673.1656683069271151281
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cyn+LTrF;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id k22so3306786wrd.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRzewsG/6QNlwoiOSUAoZ0slS3SmfaKi7m3akMxu0oU=;
        b=Cyn+LTrF1wP/z/sPQj7Lm8ePc/S79k+Y03BwHGCuare/iFShyGBeEn0VoO7pKq4waj
         sCWcpG+vULFhK3+DNaSwpejKC2UhVphOyIDovDB6M0ZJqRa72klvxjpr8b9+RsvhMmA0
         25ZckU+XHRL61lbI6g7l634QbkMrYn3REPrcBVLx53CkbbxwMIc0RZYH/5i5jegmFNDl
         7sfZFRxx6R07ndMToNpmDfWuW/ZECC0z/qyk8n7W24sz65TYTYVcgEG7gTnuhb28+yl5
         IIv02BgWslyBHsIMNZ4od24ERirxe1wgeGT89VlSWrJPaFkBmq9JxeRciKLYDV2K+F9e
         6Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iRzewsG/6QNlwoiOSUAoZ0slS3SmfaKi7m3akMxu0oU=;
        b=NhnkwwmutNszULXE26kRBbqkgpoYef4asyWrUeARXxD4idl9LBUlcW7hWDnarlfUKy
         C4s5sUFh3bDmBURgPWbeATGIwdkY8tbvobBdUBURqR/adQ4vEZanqtP9mJw8ev2zgNHg
         dcGf0dx58FfqYHLfnncSWr0McwaW45x+RZSAN7bdid5TBJTVim4q0ilQoVW4pT4Qqwr/
         F2mhbHHvnKJMVmHHD+CoRU27BjLR2k7GWX0XydDaE8b5GCvfth02bk1QV5PmRrMKHhwr
         xEr6N/sVVHDKxZsYwjMFs8ev8Hjc4qAl2MjFyOUw5wIlxOUalf5TMyN92JaT3sf4fbx+
         N0KQ==
X-Gm-Message-State: AJIora8R/gILE1arFWgOe9wOL3ALiuGV2hMDpmXhCKh84o7jHgWovklv
	YOTa4JBZXEDBhvJCzlgVhtISfMeaZQU=
X-Google-Smtp-Source: 
 AGRyM1tC048S0xzmid0r+CDIQdfejtLBiPmPuVkW0lSnks7+Ou5ibCoH4QFlWm10j6KLHxXcYEWBMg==
X-Received: by 2002:a5d:4c86:0:b0:21b:988f:20cf with SMTP id
 z6-20020a5d4c86000000b0021b988f20cfmr14193198wrs.299.1656683067331;
        Fri, 01 Jul 2022 06:44:27 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 k23-20020a7bc317000000b003976fbfbf00sm10889326wmj.30.2022.07.01.06.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 06:44:26 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH]] Update to 7.84.0
Date: Fri,  1 Jul 2022 14:44:13 +0100
Message-Id: <20220701134413.99129-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 13:44:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167469

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-support/curl/curl_7.84.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.83.1.bb
rename to meta/recipes-support/curl/curl_7.84.0.bb
index 1d9de29a65..ade2846a64 100644
--- a/meta/recipes-support/curl/curl_7.83.1.bb
+++ b/meta/recipes-support/curl/curl_7.84.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-open-group"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
+SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.37.0


