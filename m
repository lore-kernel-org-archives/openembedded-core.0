Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BF4C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 05:38:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.43923.1671514716351638739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 21:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zqn7ToIm;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id s7so11216562plk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 21:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4h+mHPwLDnsoWypAN+2lJXp3Qls6KHx2ymvih9t7xmc=;
        b=Zqn7ToImSvdj5Iu/z0YmeBrcyhX8yKoZr9Grbx+347kmfBiMslVsjv+pg24oEs2whc
         UiLDSVx8Ds7Om8fJ1yNOTUSq5AvDmGpNishsjbwnyDTvVjn4YqeN0RW7Csk35vq4nNcn
         n6L2yJ2HnRXHyx+OzENr+Rs4WisE1FfTM5PjcIAagsSeCJqOOG4H7JbLCXr2otkWhplw
         efMxNQIvw2IGYJydbBQ4ush3syApZsaKhhkkbrTEcX2d/ooZAxzReQatZTdpipgTL7SU
         97GWQ/KM4TUScaFu1QTGjCfO7W368iHvE0BEYq1Oa1CZSzGmzTqWNyHtzCT1V/jXdZpP
         m36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h+mHPwLDnsoWypAN+2lJXp3Qls6KHx2ymvih9t7xmc=;
        b=SgWuwgNssRCNduzSlafdZ9UZwUT1wsdaTAqUBstqRlVYz5qD01O2OzHL6LVLxjnVt7
         pBcaSMYogp188WIARXmYc8gJoChjSB2amw6wa0F0PZSxHx1dmyIkjD5qV9QBL6tG4pAQ
         cjDICnAVq/ORzinkW4LrNCxNS0pWDs9qVAMCSwVNlmhAwHeGiBczomrxDVZnDYxd2VT5
         YCFHcDGmg6xv1u79h+P1QSVVgcpxdem1KuYJ5c1ynqd9X6Dh+zLvttbHRYRUjwXwGMzc
         JmiSZRRtpaX3zlLJPpfGWa/9JVYQgYVYAXW/SEqZ9w2XmOqcu0XVMKnxi68/BIT8Wrht
         Xs5g==
X-Gm-Message-State: ANoB5pmCrhUDELyJbNXpfJ839XEwVj4MxpbLYXk/TNzp+hKs7dLQcPn6
	x4zKoHWs0jPspOwseQC8lwYRli5agc4=
X-Google-Smtp-Source: AA0mqf40NXaFl0I8GbnRn/r0ChVUVt0jkkyC5SigvCUGtCe2PHQZz8QYQI0Ndl0MIGXcU1NtVfPpSA==
X-Received: by 2002:a05:6a20:9c89:b0:9d:efbf:7876 with SMTP id mj9-20020a056a209c8900b0009defbf7876mr55153657pzb.43.1671514715345;
        Mon, 19 Dec 2022 21:38:35 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c8c1:b77c:227:2a0:4a:4e67])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902ed8b00b00191152c4c6esm4918998plj.152.2022.12.19.21.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 21:38:35 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-Core][langdale][kirkstone][PATCH] curl: Correct LICENSE from MIT-open-group to curl
Date: Tue, 20 Dec 2022 11:08:04 +0530
Message-Id: <20221220053804.26740-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 05:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174840

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


