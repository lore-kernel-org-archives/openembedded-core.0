Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081E9C001B2
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 07:46:53 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.8065.1671176811463312320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 23:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dzzcSbNq;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a9so1522122pld.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 23:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8HceQoL6r2SgYMVnQoKQx7gI34IavJikpJ9P1M1Dkw=;
        b=dzzcSbNqQRx5vCSFniVp5QYPt8C/0U61qg+tFf7Tuvi9vXvHr9Rk/4dthTY81cT5za
         7Gbgt7Ti2IADFIJPTJcE9L4pk/hR4AUJQxzS5EHtqpjMyAiXs7weASZxKhWJ3Ys88JIM
         g1LFZJwsanTar2pa7LoiyqfEi2PMv6fuk/liQYdxfHX6huvSRyK2v2sdbZRwrhAChxIk
         yT0fpbHzrK06zVdKzMtPvMmGUoMjZCy+pKHvexwGrcH2cSeCkDgpYIX/ynUrh6PItn2r
         5/uCMmYVtYtn1Vnq0aJsKJjGa5xNU1PhN7IXIXcHsN38PKOLxAzKrdkj6S/je3/xDl5E
         dUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8HceQoL6r2SgYMVnQoKQx7gI34IavJikpJ9P1M1Dkw=;
        b=790JLQe+89CPgUCHmP/D+GFXwiYNt3BOt2D7hXrjsVUYtlulxIHlg+nQYjsN0KAWE6
         QhpFkdMSqd8/h/DBb31YDkux/LMWA8/q2jOqj2YvvKHNC3GdK8CH4O2HcDCLX50a+WFi
         pbcAdhn/zRTLRfC8lTJ90qv6bBxzrUybHT8j5aiJ/7V7cVnqowYjHM0KZsaVwMV0Caqw
         1Acs6tu9VthLAiAcWved/60/GeHcikYshH3Yyr29Qq/uETR7CXsA3+dcArn4Z9OuPnqy
         h6q5ZXzgKRwUwwZcAcE49zME/grxoi4+n9P6lnSJlkOvk3HEwh46/+gQtlJlKnvy0USG
         6VJA==
X-Gm-Message-State: ANoB5pmtX4l+fjHWXceFLFEZCpC9mdQIQ1r7/KQ8IJb9sseIYhfviMud
	aK76wGtjHQuvtEAIbVlmOwnPOO7gRP8=
X-Google-Smtp-Source: AA0mqf4ksMpe8BawzjWqy5OuzpywnllhcfvOjG5v/I1IqM+RRcJMxMvSLfSePxIKClroQlTu/Y4jFA==
X-Received: by 2002:a17:902:cf0a:b0:189:5bd:10aa with SMTP id i10-20020a170902cf0a00b0018905bd10aamr33323536plg.58.1671176810776;
        Thu, 15 Dec 2022 23:46:50 -0800 (PST)
Received: from localhost.localdomain ([103.81.93.37])
        by smtp.gmail.com with ESMTPSA id n38-20020a056a000d6600b0056bfebfa6e4sm808105pfv.190.2022.12.15.23.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 23:46:50 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][langdale][kirkstone][PATCH] curl: Correct LICENSE from MIT-open-group to curl
Date: Fri, 16 Dec 2022 13:16:44 +0530
Message-Id: <20221216074644.46830-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 07:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174733

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
 meta/recipes-support/curl/curl_7.85.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index 0386052bf4..a4561494d1 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
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


