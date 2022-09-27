Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8967EC6FA94
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:25 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.14130.1664301258640933864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dHd+xV89;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id z20so2875679plb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kOL90zB3XrcSHsSWp0TLp0NhFAGud9HaO4F5WS+ilY4=;
        b=dHd+xV892On5wq1R5WF/qhcaD3ZUgRLDWYEhyDGNn9Pv8F5WeA85dwzT9Rr5qK1QED
         y0QbhPkZryC7Si253APpDYO/KIQ5gKWvi/N1ck3WSHNPni3ZFDFyDOGBGKdbMEKhrCgs
         UZSATpZGZhzEjq8GOxt4Po1giTuhK5nE0d2rKtdhRzUFSvaRSGM0BGOSayGp/s0c5PC0
         JqP6y7GqqRtYwKuK93GE787wd+y0bn2ha4Ml9iYqGLwbUzHxFDmARrglucZSSdzf2na7
         IBvKma70ZIkWdGZe9/qmaH3XbhNeRuQgxmGBq6SGieTxpMOGzMSGl6SoaSLVCz5gofHy
         rgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kOL90zB3XrcSHsSWp0TLp0NhFAGud9HaO4F5WS+ilY4=;
        b=GMMFBZCjMwmWHFdZtIo/QdunS3odczeq14Jbcg2w1ADSUKI6XEnh/NoMgc7c+mMril
         8GIAYWEsrUHE1oxNjAVvJE0D7DwahuSfEdjacnMQa42ItS/GLAxa7VUDoL/3rEQfZmtM
         pHlG+7sgcL04LuKUo0Rf9Icc8ChV0JFJAHDga+bgDgsqNdl8wqDdRqEWVdYi4SAL6iSO
         KoOfrM9gZ7jNAEcQ86ZjS9kM3b7tucRjYMhAmctVfLtRKu5iB9bHplL8upIjjcnPBrxA
         IB4TSY36UhDj5kgsErM1Taa3OOwplMUplTXJbLMG2bpfPH7QlCEosn3bQq/fX+kD10E7
         r5tw==
X-Gm-Message-State: ACrzQf1NEG+knKYJREe8jksWfOh96dQ9KNUPy8SML8iyQk+Jk+u1WzH4
	D3mUaB0UKPgxNDhpGsHAE6DpmRtihdE78VsR
X-Google-Smtp-Source: 
 AMsMyM4gZmLOfheGuAmqCrOblB17olclhBxhBJjtxgZZ+wTAh5DPNpya+sUWv0lrMxqqzKO/hzxMeA==
X-Received: by 2002:a17:90b:19ce:b0:203:182d:2c77 with SMTP id
 nm14-20020a17090b19ce00b00203182d2c77mr5852689pjb.45.1664301257656;
        Tue, 27 Sep 2022 10:54:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] vim: Upgrade 9.0.453 -> 9.0.541
Date: Tue, 27 Sep 2022 07:53:55 -1000
Message-Id: 
 <dabda290f3d40a9ef4f2b5720634280f712f554d.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664301116.git.steve@sakoman.com>
References: <cover.1664301116.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171118

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2022-3234.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6b54f37aa4db1457296b8981b630a49d251ceb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 94f8ba7cbf..8a914ae524 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0453"
-SRCREV = "83a19c5fda0556330860899bfb484addf9178cd0"
+PV .= ".0541"
+SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


