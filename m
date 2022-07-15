Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD59AC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:38:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1383.1657903132380458117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KN4kzQ3v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id q9so7445310wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R5Ibz8Dzp92YZaLX3YRkKkwM1u9YckfDb1d3nCC0yRw=;
        b=KN4kzQ3vcQ/ay1XzNJhD5q6W1ncMexJyBYR40f9ZzTcb27hi9yZZE6CeN8/SdD3hV4
         CuUQ8XVlgSUb2CYpz/ZJr2dG4QiWwz8iqb5NanyS1VY5kuurZLzXl7u9/cNPHQ8grNw9
         lD6vct9mID4JEjpj6eeiT51ULBGHzo/GlM26o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R5Ibz8Dzp92YZaLX3YRkKkwM1u9YckfDb1d3nCC0yRw=;
        b=1PlgywwFVNzuNI0+77MEJE39Pa2jrS9PfhfKEU5wV0mjH7lx/Bw5rffOglVF7+n3ws
         taqyZdMiGAwonWXGKTSdJZ0jI0RuqheBqkI+0FQdLSOPFtt8EFiEcx3JV/BGXbkPE6GV
         05JM9tLEBdMnjogqVK27Nt8U/67E4gZT6BqztoV/8jrgCiTFA2vz3But/HOesw+wmqO7
         hb+ruJN+S5eC7MnPI565wzxlNpSDueoCbkYEaVweE0ia1QXHdvNiNH9W9gkCthv9Ffrn
         5O13HkMclHk+0E7vTGFUdI1pAcn8sV9oz2oaFehPRuWEg7rTTgwrWpDQ6a0i8wbGlyA7
         F8jg==
X-Gm-Message-State: AJIora9bm8L4FhJMBnn2klk2CJXWOV4CwOax4MAVu/LuddrxVy6OTiMg
	AN89vQHD7dqoYak/Aq21BliMiVyGqV6b3Q==
X-Google-Smtp-Source: 
 AGRyM1uHV/lAcivv6rNrfg65BmTiYmPTCwqjVsruQWeckbipppN1xoChMkHJ1o+xq5MUt/kVIdQo+A==
X-Received: by 2002:adf:f5c7:0:b0:21d:7f20:7508 with SMTP id
 k7-20020adff5c7000000b0021d7f207508mr13325993wrp.458.1657903130441;
        Fri, 15 Jul 2022 09:38:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a7bcb86000000b003a2d6f26babsm5796898wmi.3.2022.07.15.09.38.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 09:38:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] local.conf.sample: Mention other MACHINE options may exist
Date: Fri, 15 Jul 2022 17:38:49 +0100
Message-Id: <20220715163849.676819-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:38:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168127

Mention other MACHINE options exist and where to look for them. Based
on an idea from Robert P. J. Day but adjusted not to use urls but to
refer to the local metadata.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/local.conf.sample | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index c05691de581..589ee32665b 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -29,6 +29,10 @@
 # This sets the default machine to be qemux86-64 if no other machine is selected:
 MACHINE ??= "qemux86-64"
 
+# These are some of the more commonly used values. Looking at the files in the
+# meta/conf/machine directory, or the conf/machine directory of any additional layers
+# you add in will show all the available machines.
+
 #
 # Where to place downloads
 #
-- 
2.34.1


