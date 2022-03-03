Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1608DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 16:34:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.12957.1646325295564033968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eH7Pns1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id x15so8673691wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 08:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mKhJcn/nmI0kM+4ryFcJTtsaTXrmZ874U9fQuL7e2+M=;
        b=eH7Pns1JZv1e9whLlNauKRRR5CvS+xUv1KS17K/pxI6Neb2cQIoU/faoGwMLsHk9EP
         U+nn6vRb2Uq1Gz1sE9Qj76Sl1MDEBAXw5VFNq8ONv7Aeh0R/5yPHDznYhj57tyP4mVJx
         /KgD3pnITUybiusZIAfdVvYgnjNbm2L0m/NEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mKhJcn/nmI0kM+4ryFcJTtsaTXrmZ874U9fQuL7e2+M=;
        b=NkuRGbuTNd5kOl0g1RvgGaB265Db2wOa01UpGZJVam8VUHX+L0DkcuHNEn+4v7IO8z
         DVdWoanPpcXXCnwZ+ROzQrb1GxWC1H+OAWiJvURVI4gEYIUp2kSGcKvDUk6aQlvhgdOg
         ocQ55Dh3axQXyHHImCZV4j3YQaJd3Gj+Mf1ePWHs9HisoI/aQdjhR5dv5Q53y6K11LkP
         AvlXH59PDv1qHNmsMa8HxWuMNt5jklqBMmb2AR9exP0DFHTelvl3rWa3hmH5rGMtdg6B
         28MTt3wbjOwZCOU4EFe6WIMLi0iH0FH4IB/GfO0eSPcFyddWTQrE1xKxgx1KAVjoYWae
         d5bQ==
X-Gm-Message-State: AOAM530axpO+dOzUAaxdsHQWbgnC8uJFOmH8yDuRH/+WqX0npqU81C+h
	L22VIN7Ku5Stz4y9f+jS63wB3AcPVeMGAn79
X-Google-Smtp-Source: 
 ABdhPJyEuh3HZAxchqDoa0rfcSsX4hO9dqD8ljgM5RVXS2rhE9DJG8m+oYBVdJhwyKWVjm7zXwXmWw==
X-Received: by 2002:adf:fd0a:0:b0:1f0:25fd:4082 with SMTP id
 e10-20020adffd0a000000b001f025fd4082mr6832541wrr.501.1646325293765;
        Thu, 03 Mar 2022 08:34:53 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 x5-20020adfec05000000b001e58cc95affsm2436998wrn.38.2022.03.03.08.34.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 08:34:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3: Drop opt1 and opt2 pyc files from target
Date: Thu,  3 Mar 2022 16:34:51 +0000
Message-Id: <20220303163451.336518-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 16:34:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162664

These are only used with python when the -O or -OO options are passed
and I'm not aware of runtime use of that. They otherwise just waste a
ton of space.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.10.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
index 7ec443a531f..97e74ceb688 100644
--- a/meta/recipes-devtools/python/python3_3.10.2.bb
+++ b/meta/recipes-devtools/python/python3_3.10.2.bb
@@ -189,6 +189,11 @@ do_install:append() {
         # More info: http://benno.id.au/blog/2013/01/15/python-determinism
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
+
+        # Remove the opt-1.pyc and opt-2.pyc files. They effectively waste space on embedded
+        # style targets as they're only used when python is called with the -O or -OO options
+        # which is rare.
+        find ${D} -name *opt-*.pyc -delete
 }
 
 do_install:append:class-nativesdk () {
-- 
2.32.0


