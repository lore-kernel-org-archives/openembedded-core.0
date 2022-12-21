Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4EDC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 07:09:31 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.13374.1671606562339730566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 23:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KvMXQvoC;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id b2so1987738pld.7
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 23:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3vI4PXBn9kUuYtrjTFtWB3WvJ2BwnJNkIfBylu+T40=;
        b=KvMXQvoC5ZbFB72XPxZUgS8XPNh2L73UTe3Fkjg4A3uOWrQUCZVsFnW4p6G/JDROPT
         aKQtIBrYqh87N7xgHZNLbY2bED/55nmlcwcoDSY3W90yCiEPMAo38JLlUSmvmCLBGd4F
         HFHQkYZnPqNBr0o6ee3PtH16/LdbGFopmKWQvIZiSQrl1s2rCR1O05HjK0g0BfiXIom6
         j+YdnoOzWmYvYrnOt5tEn+Sha80u5iwjnPdaXBVcD9YeT71nNoVAAnaHBI1VIqm7T/zN
         Sg1lazTbGdEjR7hzFFZ/j/YOSTl0ms12k9YLkUAKHdXJF/VITMCBngynZvBWL0LvbyMZ
         FZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3vI4PXBn9kUuYtrjTFtWB3WvJ2BwnJNkIfBylu+T40=;
        b=Ph/YPu3FxX3unWLEB5Eopoglc94NO8kH4Y0OSwUZJeVSvSOztZN6JO0uQObQXo1jJn
         WpzbjdHhz60p91p2mfBACDdkye0ACiAAvJsO5dIV+wX2Fb2Znf61YZkCJgh6UAsELvUi
         3qc9PPQYiTLNPFrIi7LuHJbD+mNwFvkoLBtyR4Njcb1KTfg0cAQNf1H+MYPkwBtuem0w
         pICZ5MZoGwScw8KfpQ0N6q5x7D+rbw4mMfBpbOVQQbmiLGD/lMpqzhAw+qN+2k11EVu4
         ABGcPAnnJrccfICZiV1DklEBxxrqFdbg2P8TgUwXU0UsnMAqa3Zr3u6NiPqmrViinHTK
         xypg==
X-Gm-Message-State: AFqh2kpDq8UBrKkrLU6zc4lgFV9ezyvTM4USQxLKMbfyuNa/vcW375q2
	pDArBEooUz1VI3x9l8V8Q+ChcQzbY7I=
X-Google-Smtp-Source: AMrXdXtFi1eYd624LGp8acN7o41xs4zh0sRgbHOHcY/IfcbTWltqOAU4R5HGOQ/uaNvaBhUcmZtQpg==
X-Received: by 2002:a17:902:7b94:b0:191:3ebd:c3a5 with SMTP id w20-20020a1709027b9400b001913ebdc3a5mr942616pll.17.1671606561090;
        Tue, 20 Dec 2022 23:09:21 -0800 (PST)
Received: from localhost.localdomain ([103.81.94.150])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b00188ef3ea2b6sm10595761plr.262.2022.12.20.23.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 23:09:20 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-Core][dunfell][PATCH] curl: Correct LICENSE from MIT to curl
Date: Wed, 21 Dec 2022 12:39:14 +0530
Message-Id: <20221221070914.20166-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 07:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174901

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

LICENSE for curl is set to MIT which is wrong and proper license is
'curl'

I check below link and the line "Curl and libcurl are licensed under
the license below, which is inspired by MIT/X, but not identical." says
that the license is identical to MIT but actual license is identical
from the file "meta/files/common-licenses/curl"
Link: https://curl.se/docs/copyright.html

Also, I do not find the MIT license text in the entire source-code

(From OE-Core rev: 34b228bd3a80a74bf4d84ef7ee362f4ab1e3a466)

Conflicts:
meta/recipes-support/curl/curl_7.86.0.bb
This is due to version change of curl and also due to MIT and
MIT-open-group license variant

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4a246e06cb62efff8bfd20cdf3dde31e24f9b711)
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 31aa9d7185..49287b2e3d 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
 HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
-LICENSE = "MIT"
+LICENSE = "curl"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-- 
2.25.1


