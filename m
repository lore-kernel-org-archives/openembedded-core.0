Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7F9C4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.3414.1647298152538979877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IPaP70Ry;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id p9so26285319wra.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+VBUDW7E1tz89aj0vwg5BqEpgo/fQi8IR5EKUJixDg8=;
        b=IPaP70RyQEUmtdmpRQHgKxlJx0+H2wRXLez2YO+iVYMnslxEVgbk+xz6EomOrlJsDW
         pLxQKSmW8jPIFmx9JQ6cQaCkZyIGZjft+27XlqOTdyqoY6/n/cDM9Wcij2YMwLpgOXPq
         386ztyWCk1Wd0Z8a3H2IRwg8mtyv2Q/DmYq/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+VBUDW7E1tz89aj0vwg5BqEpgo/fQi8IR5EKUJixDg8=;
        b=PFQ2jWXzOmt6/JnhiUooy0kD2Bhwci4lMg7/ZQ/tXSXc6ICpIEfIhpYVdv2SyAAK/V
         J5iP3p3piTTy/4KPhwGCuKGzd72olx3CvxcZSEix9K7kz7s99GG4si+lAlO8QgzXEn8F
         WoEwkdQcP1oDqP9ttyChcCM4g6XQpgD9whyE9XRyUtVWRlsIA0GbYCraMvKaobYtOjOg
         znJGNTRFK6uKvipl/3h/wNZklqtbpHnBwz8mxXdSmjl3wsxgxqqEj7zpL4I3JzETl7BK
         e4HLgZ04yo5SKHRH+hA/yuAVaVNzKjnZqTZqaRjyqjVXBIbqZyzGKBM3vl3EZxLTrrl+
         v5Bg==
X-Gm-Message-State: AOAM533YrjCpYHmxwKB2XLB/CM+NWudAOZ29EPi4AHtGQ5tcajYWA+Yi
	/1TSpZF7u6AU+Yo66moJtf95Z11NrltoV5DO
X-Google-Smtp-Source: 
 ABdhPJwVcyh2Xmuji7Gwjnvgw31ab9/AwjwjlhMsHey++HgO+Z0YkIDokpBk5fg47HlWIahehXy2eQ==
X-Received: by 2002:adf:ce03:0:b0:1f0:62b9:3c7a with SMTP id
 p3-20020adfce03000000b001f062b93c7amr18014706wrn.102.1647298150845;
        Mon, 14 Mar 2022 15:49:10 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:10 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 31/33] python3-cryptography: Add missing ptest tomli
 dependency
Date: Mon, 14 Mar 2022 22:48:35 +0000
Message-Id: <20220314224837.834776-31-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163197

Add missing tomli runtime dependency to allow ptests to execute.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-cryptography_36.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
index 69eeeb1e968..09f940272a4 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
@@ -101,6 +101,7 @@ RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-subtests \
     ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-tomli \
 "
 
 inherit ptest
-- 
2.32.0


