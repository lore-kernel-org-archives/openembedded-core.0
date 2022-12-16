Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B0CC4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 07:34:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.7845.1671176060187473289
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 23:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qnqlQ1Zy;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso1590148pjh.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RtuXvBEPGx2MkcAntEY85HfbltNjtUTDYhJhTyKwKcY=;
        b=qnqlQ1Zyk3KzP1wbmw4E2V0RTI0VU5drI1sbdfeH88s9CIVn2f+i4Y2vhOa3J7//uS
         jpeVypj2hOBWseO1NM+wgiolfErUPte4VlKVzziZ53+55izwst+PEKx65E2eBt9HpHfR
         ad6iI0LS6q2V/uiON1qFaXiBMeNwU1YpT89028GjxVpUJP875IpW5V5UbSjX/z529krY
         6kBvyO0ErrHXUQ98xxeI/rKY6nrBkGFnwBSQDCbIXTaj0cCyf6O6XhjcjZJAsJo1coqJ
         n9ot4oU+iCLWfJJ/JkwtvaAvUaNXQRLZQ4rD7JassHmJu2A8E3GkF68IS7aJl6yUNC9n
         LWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtuXvBEPGx2MkcAntEY85HfbltNjtUTDYhJhTyKwKcY=;
        b=pr3aKGO/LN7zbM0wZxQZxhObK1HsU6/5hJR9uySGCx8pn08syhk1L/OgJ6VLvgmvD/
         oLCi+QOc0WiS4PboYjP/sutiQzmftbnASyBAU1vcnmKkZTNEX96AXLPB0peXX2ZXzCf9
         CuugGRSU9UgBf3RSICamPQLq2kK3BjK/7MMMTPYdtV1nMAk/Yka5NgvAaOnGUEsQgwrB
         c+zSAnh/jUTELZ/jlWagSf2TIayEPRv3nRoNzKYCyhOGr5jcH/jFdWOCpii0HQgIlHPS
         F2cOPD52W5CWKmRz6NiyLM+2lOhg1pwwMqo3TGpN4GsBBDWnIhLM9zJtCwX3VXZf2lKa
         hwuA==
X-Gm-Message-State: ANoB5pnoJKjaio62vc17JOdxOjD49lseRtTxxEPfQsc579jG4hUUzeyZ
	PttI3ujAWFkK8r3DtPS2fO/qM65mYL0=
X-Google-Smtp-Source: AA0mqf60/MoY19R9Eorn/XwngJkuDSDElre+EidGlS2oezDGyA/qeQDN5xjvrio6TH4ik/XVEUIQCQ==
X-Received: by 2002:a17:902:d352:b0:190:bf01:3a44 with SMTP id l18-20020a170902d35200b00190bf013a44mr14869739plk.63.1671176059407;
        Thu, 15 Dec 2022 23:34:19 -0800 (PST)
Received: from localhost.localdomain ([103.81.93.37])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902f69100b001895b2d48a1sm848782plg.253.2022.12.15.23.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 23:34:19 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][master][PATCH] curl: Correct LICENSE from MIT-open-group to curl
Date: Fri, 16 Dec 2022 13:03:25 +0530
Message-Id: <20221216073325.44501-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 07:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174731

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

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/curl/curl_7.86.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.86.0.bb b/meta/recipes-support/curl/curl_7.86.0.bb
index ec8ce9fd28..f5e3e7235d 100644
--- a/meta/recipes-support/curl/curl_7.86.0.bb
+++ b/meta/recipes-support/curl/curl_7.86.0.bb
@@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
-LICENSE = "MIT-open-group"
+LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
 
 SRC_URI = " \
-- 
2.25.1


