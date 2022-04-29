Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD33C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.12122.1651248093305392512
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=V9jA8epD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id h1so7258721pfv.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sZrynQimcVbDU57isDkApeqyIv/o9gHAW6T1W/3bTsA=;
        b=V9jA8epD5bm5LDZYa3Mrma+dOcQ7Kd2C+nXT5JRWTrh2beDADr+7QiEjfwWj0jbODF
         RAJfX18zxPw04Yy0GpGXAojhkMPIiOeUuGUpT/WSjJfbDK9NriXpNuz6NtJjygTorzqu
         zSIdIVgxMBCvVwjqCFRDB6lWwBDdSlrl8hZrkt6BzGx9MeX4lWnOFhRnVXKjZQtBQ9DS
         T7h3xwVETbl0dFbxjMnOh6RLQY80/Sw0VXVDQ2d+0bXjZtAd5n0ikSQqhiDAwufY49Sr
         MPkhWf/aK0jsYQp7dcGcKXHSz+t6vXBpzYrtEmX/LkfiAp+KVzk82XLuRuLTTm3o80fp
         H5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sZrynQimcVbDU57isDkApeqyIv/o9gHAW6T1W/3bTsA=;
        b=UOoQQtEZsoouZ3rMuEYHghbXIxzUxaJ5tM/yWQSwkBzLZ5W1Np8PK6z+EhLJeeHkpc
         2IxzjnCMX4J2xMnBoo0Q/3g3af+NL505+nQ6LBiNO2Qp6K7cFgBWuqPRgJue5C16xu1t
         VHYR9cx5/D1TjI9P3u0zleCwxAUT4j9PtMRVhhTFa4YqCMUUwg+xiZoiHPF5Qzl5UnVZ
         sUiFL+lMDx0OHAMl5oiE/PT+KL4/6QS5zcqTNpumQpA28WokCt0V5dMJtVtqP+DwaHan
         nhhyat/ZBZxUzvUNMXHRTMzGhN0VEdnXTyFHKi19VQF2LNrOUefCpxHyvdTW8EJRcQEj
         qylw==
X-Gm-Message-State: AOAM530UU8fLD5ORrcP+KkHtayfmn6vhT66b0Jl6YlETpTTYUjZ2Wnc7
	mZ6wI9w41FEr1NpH1pWZAmAUEuWde1jw4SSoRt4=
X-Google-Smtp-Source: 
 ABdhPJzvuWa8M7Fow+s3Rib/0c04oUsVC8UGIC0w9V8v8bTrD13dy/q5SHV9BURU5UVyYnkldMSW/g==
X-Received: by 2002:a05:6a00:2187:b0:50c:ef4d:ef3b with SMTP id
 h7-20020a056a00218700b0050cef4def3bmr37583746pfi.83.1651248089971;
        Fri, 29 Apr 2022 09:01:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/34] apt: upgrade 2.4.4 -> 2.4.5
Date: Fri, 29 Apr 2022 06:00:23 -1000
Message-Id: 
 <76f4471a26bf457d1f0816b2b5ba92d0d6474e14.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165023

From: wangmy <wangmy@fujitsu.com>

apt (2.4.5) release notes:

  * Only protect two kernels, not last installed one (LP: #1968154)
  * Fix segfault in CacheSetHelperAPTGet::tryVirtualPackage()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a6462fd0ab140b554f4bda260e26b938cd44dc2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt_2.4.4.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.4.bb
rename to meta/recipes-devtools/apt/apt_2.4.5.bb
index 9faf1e7ea9..95c25e3036 100644
--- a/meta/recipes-devtools/apt/apt_2.4.4.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "d6d83d122ddd7cc83b2c2f839a55940c13ab93e5cf6024a010d6a6b4110dcf0e"
+SRC_URI[sha256sum] = "5552f175c3a3924f5cda0c079b821b30f68a2521959f2c30ab164d2ec7993ecf"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.25.1


