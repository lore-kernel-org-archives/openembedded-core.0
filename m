Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272B3C54E76
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:06 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.15990.1672594683438499771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JkuF5g1y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso16677952pjc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltF2NaZ4/3BzZM70/UYYysf1Ew47vplqTWF5kp2zY2Y=;
        b=JkuF5g1yrd/i7MXQvONqbPeMiZ/Y1ros1EKrYvb1xOmXo4PwZ/tZCaMJPbRAGtGZqy
         6rHPlYLb384y134Y8necwuT+B7RB4X0kyippMfSW6C9fXOQBhIiYSiX2aVoPJ3NsGq5s
         +efK7O/2KPgRAEJnAWA3t7YZcTI8PjYVAerhf+Zy7EI9thoWr4o8s//b5GJHFhPbHmqn
         VcxQrcS2MbP2cp6LY2NY4mBjt1DBc3KKXg8eDRHtsVorZ8k1C8yBGquTAG5DKVTlhxJq
         owlK+lJReLy7JdPiBeVgi4s2Yo8/KxYWRD3Bk7fYuorY9s48QoDTKTBFs4wX8lYFMQbX
         BEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltF2NaZ4/3BzZM70/UYYysf1Ew47vplqTWF5kp2zY2Y=;
        b=Sf6+ORpFCE5Rpx3rtGSfSw9ZCYSZo2RctGLlYupXQtHUmV41LJhC7ZeYofTHLvhUdS
         ib6ysgfB+jDjXrDmYRjosd2YM9gFNX8K3H2SCsxIeo14Ye7J8e3KFhgJT0lPtiCufV2I
         y01MEDVIYKr6smoRDjFMF+dpuCk/Bqpli18AVE2bgMEXitH3YfdGTczrfC1BMhdM3hRQ
         fj9jeYHB9u7op+P8d2G37K3u5nUHqVFqLilBX0secDR2K1F43lH/cpIAYCRnURx5f7lN
         B12JKMrZybi9BAMtR4/U0JNG2hXOCvZ2by97CojktO1BCkdQwk8U9ldDZljcAacHKQAo
         fP5g==
X-Gm-Message-State: AFqh2koPUSYyFZI3tjrb5lMuJxkebr1T4nEYnYWblYLzlnLgSCO46zoo
	CS9I5x7IDZqdj4ijrzWCGULv+z0Q9t4vNpiauKo=
X-Google-Smtp-Source: AMrXdXuLIJbeAtx/fUzilaTUZMS3L94N0YYddoYZi7yT5JngEDIWWEZ/mPheKjuVA51iZ2rHCW9yDA==
X-Received: by 2002:a05:6a20:7d85:b0:a4:6eeb:91ae with SMTP id v5-20020a056a207d8500b000a46eeb91aemr60334697pzj.49.1672594682051;
        Sun, 01 Jan 2023 09:38:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/29] curl: Correct LICENSE from MIT-open-group to curl
Date: Sun,  1 Jan 2023 07:37:25 -1000
Message-Id: <b91e23577f1060a556f6ae1a42fc5fc024b88514.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175191

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

LICENSE for curl is set to MIT-open-group which is wrong and proper
license is 'curl'

I check below link and the line "Curl and libcurl are licensed under
the license below, which is inspired by MIT/X, but not identical." says
that the license is identical to MIT but actual license is identical
from the file "meta/files/common-licenses/curl"
Link: https://curl.se/docs/copyright.html

Also, I do not find the MIT-open-group license text in the entire
source-code

(From OE-Core rev: 34b228bd3a80a74bf4d84ef7ee362f4ab1e3a466)

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a246e06cb62efff8bfd20cdf3dde31e24f9b711)
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 87f4cd13aa..4774ae7f2b 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
-LICENSE = "MIT-open-group"
+LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = "https://curl.se/download/${BP}.tar.xz \
-- 
2.25.1


