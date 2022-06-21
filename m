Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F74C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:38 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.1225.1655854174070415486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RoIkak0d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id x4so8147257pfq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SqMj5yU58mpyEZwcpTPNFITuymGXTaSGK+TENz7/wPI=;
        b=RoIkak0dE9k1/JUK8A8QU23Fe12n+jiwf/dX2R9B9J3XzTiVo0KZ0bV09WYwlBZYI3
         MchY5Gpf+Gun7RCziXtjQJMaEHBy9jroCKUc45bDSCJIXV5AQKMe0AE6zSzEpBHpWfIx
         NaR68wHj3xwe/26IV0R14oevE/80EWXLQIe8psOPrmEGG+f2MExlNbRDzorK8ZsvsvuE
         tGsx75OGz8OGheACPiYpMDKCLeDRzBwlTOFASvYj1ADlnHhU9MBIwAASHQtZOBc9B2P5
         ykEfBpfgnVlrFnr8IQncRE5ElwV2qzLgu/Hu/XghSz93HKRSV2ON+F5X+Tpwv3go9G8h
         ardg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqMj5yU58mpyEZwcpTPNFITuymGXTaSGK+TENz7/wPI=;
        b=UwqKp4SNAqB7eL4K/tjHbk+kCz3t/WM/5rPrqDUqIqwIWL7qjiyqZLvU/U03P/v+vo
         air7fEyW8YwWh+Az8vKd4jIlmr0GlAxAytV8maNrYdfFaA3BS1s2oGkIOvZcAxJ5boBy
         +gQ9fR1s3T0Kj7suIqsj/Og1p/RRc5b5pZykZ52QdpMHJ3VtslY7pveHbxEG60zaOjht
         zHBWsUmX+ZtdB2v5mlpbNHnnnlWgerAFHE9xK43sTAOD/vebjzHU9qQyQ/rYySoz+ycR
         +tCvKEDvfCmaug7i+eAOv8yzrO0HmE5pgdig5cRjQNoX1M8zIsAriWfikJ8cvoSW9Pjv
         rFQA==
X-Gm-Message-State: AJIora/Kf4FXAfzA+1A4s3hmqNXcsUNFiTvTx45MTU9W8/Yhem9muiNQ
	dUVJf0s1U6TM8DixLlFAQotefCMrJ+0TPZ2/
X-Google-Smtp-Source: 
 AGRyM1vpFKEUYaqKE/MzLbYbkavwxs3lbj3IP1geAf2d1hFltTEi7H4iS7VUKGNKpfoCS05R1PK81g==
X-Received: by 2002:a05:6a00:2402:b0:4e1:46ca:68bd with SMTP id
 z2-20020a056a00240200b004e146ca68bdmr32236412pfh.70.1655854173125;
        Tue, 21 Jun 2022 16:29:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] dpkg: update to 1.19.8
Date: Tue, 21 Jun 2022 13:29:00 -1000
Message-Id: 
 <12169c1104adbfd9f5196fdbdab16536e98fd43f.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655836866.git.steve@sakoman.com>
References: <cover.1655836866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167207

From: Chee Yang Lee <chee.yang.lee@intel.com>

update include fixes for CVE-2022-1664.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb} (86%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.8.bb
similarity index 86%
rename from meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.19.8.bb
index e9dec337b3..9e6e9f2464 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.8.bb
@@ -18,5 +18,5 @@ SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
 "
 
-SRC_URI[md5sum] = "60f57c5494e6dfa177504d47bfa0e383"
-SRC_URI[sha256sum] = "4c27fededf620c0aa522fff1a48577ba08144445341257502e7730f2b1a296e8"
+SRC_URI[md5sum] = "9d170c8baa1aa36b09698c909f304508"
+SRC_URI[sha256sum] = "2632c00b0cf0ea19ed7bd6700e6ec5faca93f0045af629d356dc03ad74ae6f10"
-- 
2.25.1


