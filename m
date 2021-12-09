Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131F2C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 00:12:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.4673.1639008775031658547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 16:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gF7S4Wq5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j3so6962657wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 16:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AR0w3XW2G0fyTK0OQBUBrnePbOcPKtj6EpW6W8Z9A6w=;
        b=gF7S4Wq50+tdz/VcljAcn1AtOACalYHESbaWlSs3X60JFjvxRpVVUIsibuH1K/yjjk
         jtyx+YiC+43Vrdb/LHBcmIC7tSYGjs35z8kTXLQw4ew+1pSZU1dcgNqXBk9d/pAGo+3h
         cLtkWmqdEzA1K//PlUdpiKC/ehrvahziIqaZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AR0w3XW2G0fyTK0OQBUBrnePbOcPKtj6EpW6W8Z9A6w=;
        b=ZHBk4ZpgC2arMkFUUNPnLJLCIkyVwzAqb3mBfVdnFb3D51Idmv2/dzt/4/xh2HdWVL
         gGhvzmFEpdP5s0VatrnjYZvxaiPz5YIKMUlDC9kh7HnspzwriK2pmkg9VzV/4GEAeI1B
         8GPqeM98vCjwoP2JmAjx4nHf2BB0VuQLo4CxkdxnGncQym/t3QcQRwXvHVvVtJFYA7hF
         MEpPv+hukG++07dh5PHtW376+g6cjZPae6IjxIhRPbfKkYImOBe84HjEgDrg45BTbSsP
         +UvAPzeE1aadgQBf57/OFOCQM8A8u5rD0wZPGNF/Yayyq2hyWFdnaPg+An6eqi0F9TPS
         T/pQ==
X-Gm-Message-State: AOAM531WTlTtI2A93fUQq7opAeKa1C+W3YEEwMCw/sijpocUwxh1evGu
	Gm+2kyOw8Bt+rV80euaI5wfrJW+k4Z5lzw==
X-Google-Smtp-Source: 
 ABdhPJxhFEbMSfLsMhHvY/l4p0CzpbyP+Ft0ySTeaFfjPF7hzpvmqc0U/ivXaaCSTSRQ6Uu2AjtPBA==
X-Received: by 2002:a5d:4889:: with SMTP id g9mr2296300wrq.455.1639008773282;
        Wed, 08 Dec 2021 16:12:53 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed])
        by smtp.gmail.com with ESMTPSA id
 bd18sm4162794wmb.43.2021.12.08.16.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 16:12:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Add CVE-2021-37322 to the list of CVEs to ignore
Date: Thu,  9 Dec 2021 00:12:52 +0000
Message-Id: <20211209001252.602517-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 00:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159399

The CVE applies to binutils 2.26 and not to gcc so ignore there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-source_11.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source_11.2.bb b/meta/recipes-devtools/gcc/gcc-source_11.2.bb
index b890fa33ea5..40ab315e2fe 100644
--- a/meta/recipes-devtools/gcc/gcc-source_11.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-source_11.2.bb
@@ -2,3 +2,6 @@ require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-source.inc
 
 EXCLUDE_FROM_WORLD = "1"
+
+# Is a binutils 2.26 issue, not gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
-- 
2.32.0


