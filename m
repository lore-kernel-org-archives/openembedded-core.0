Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F392C433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:49:36 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.815.1643053775385298537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jVIUr+We;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id n32so7959852pfv.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o6wknyDwMhfU4WmNFiObJ1/75EZkA8VbY2i9Hqj59aI=;
        b=jVIUr+WexPylNzMy6w+xogp21K6gP/67PSBSz2rdHLKo+o1Xd27CjeNU4YiIRmlNkw
         z7QlhmwfinjwkTYlJZywQ+voBLMOKW+EpWUL1GVVV1E+poiJliWsapi+Y8/htx5ZA1mk
         xZpeBOJ7wksrT5DegXiJsfbFO1q8tZ4vEHm39EZ/xITqpM0TCHaD1Rjv7KqDcNTGfbMv
         RX+lFQ/E6AKP7EhyLLirrWecyOhDU0aY0sizblh6nyTXlcSHMTIUUy3rjrTTGPEqyHIY
         njnGWO/CB/mwmbf9SQHGuV3zyv8GnpraYeqC+hIxGc1GODE2ITdbU+8AfUB/dGmC6UFq
         aSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o6wknyDwMhfU4WmNFiObJ1/75EZkA8VbY2i9Hqj59aI=;
        b=kpky1RionKPAxKaW1LFXTBiQVtlsmnXa+hPnjLQ6/WwlNCCKpvpCp6CXKsXxaVroRr
         SF9JDQ35YXXkqBx5PHfWnxqaQoR/zTBnU8bm1+Vgk2jcbVJ9hUHDtbUWAyHRPsfeQ6tr
         E7hZfBOKZI1dc0FECQoATyloDxm2O7PxrHWJ0ODqb4Ky6DymuzPchJFMwltS9VuaigI5
         gAG976k/0qW1WEK7M3hy4qspaLl1Rcrta6yV6ER5yxXM0ZNlSGRlHofJDwLW4Siy3/jV
         7HF2iNT7fNwmfhtOY4f/uZr3HzLMX9IE4wY8xI6jN5Op06cfRJupJkbNFazga0VQEW7+
         Z3Pw==
X-Gm-Message-State: AOAM532zWlgW6peUAtJt7yghEY7zRZtt7gi/aORnVJTCmUFyKg3dYX+P
	2V5Fb6HxIdikrLudibJqtYsWZwSGCyuXxQ==
X-Google-Smtp-Source: 
 ABdhPJwKitSynM58hI+AmLGf+qPeZi7FEAXRUht1mRqR2GRdXVNbNN8Cx/tU0ekWahaPJEBctZY78w==
X-Received: by 2002:a63:45:: with SMTP id 66mr12910768pga.607.1643053774560;
        Mon, 24 Jan 2022 11:49:34 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f265:5b05:90c1:d910])
        by smtp.gmail.com with ESMTPSA id
 t2sm17617202pfj.170.2022.01.24.11.49.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:49:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-pyparsing: upgrade 3.0.6 -> 3.0.7
Date: Mon, 24 Jan 2022 11:49:08 -0800
Message-Id: 
 <e670c56cd600bfd92d6753aeb449f2d103b688f3.1643053417.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1643053417.git.tim.orling@konsulko.com>
References: <cover.1643053417.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:49:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160901

* Update HOMEPAGE to reflect move to github (in 2018)
* Add DESCRIPTION and BUGTRACKER

This upgrade includes bug fixes and minor enhancements.

For changes, see:
https://github.com/pyparsing/pyparsing/blob/master/CHANGES

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-pyparsing_3.0.6.bb => python3-pyparsing_3.0.7.bb} | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.6.bb => python3-pyparsing_3.0.7.bb} (47%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.6.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
similarity index 47%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.6.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
index d15ff33e9b9..14faea6590b 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.6.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.7.bb
@@ -1,9 +1,16 @@
 SUMMARY = "Python parsing module"
-HOMEPAGE = "http://pyparsing.wikispaces.com/"
+DESCRIPTION = "The pyparsing module is an alternative approach to creating \
+and executing simple grammars, vs. the traditional lex/yacc approach, or \
+the use of regular expressions. The pyparsing module provides a library of \
+classes that client code uses to construct the grammar directly in Python \
+code."
+HOMEPAGE = "https://github.com/pyparsing/pyparsing/"
+BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "d9bdec0013ef1eb5a84ab39a3b3868911598afa494f5faa038647101504e2b81"
+SRC_URI[sha256sum] = "18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.30.2


