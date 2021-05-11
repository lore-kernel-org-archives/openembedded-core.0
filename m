Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.12287.1620737502787913493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P5AvIqJD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id e7so1489103wrc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1Qh8mTDeDH4ZMxdTrrRhL6G76eFCaG4vZZpAwk9lf50=;
        b=P5AvIqJDw4kAGtN8mhhLdCYEmrXE7kM1QYf61Qfa5raxLoep+leymOPNFZjDrHcJRL
         eNR1RdmoSfaTCWRov29sQQu1ZDplJuMRqMEcuwu8Kv2emdZJeDO7lkgxXsMmXyz/Nx4o
         D0e9MRHCGJePtAzCracIjLRuu0WXVRXUd8r2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Qh8mTDeDH4ZMxdTrrRhL6G76eFCaG4vZZpAwk9lf50=;
        b=BdohRu1kKvfHXVdUWTCXS7Pdf9E8tghlsO/wSeHNtux1qUiXZUBTnJiT2wS5nJVfUq
         sU70TjfemDD9XPo6/gLmsG3k8QZESD8airIvjLhLR/vApfvx6dJmPtTSWRqZLE3s/a3Y
         SAnEDsozF4qWBxQH24cCBrrQ70ZfSR219DMcy+jqA6HNjFgegW4b9tQsnhbvu+gSUK9o
         ALwCqUX7F0mEIrPigQkxfpZK5wCzRFnXWZOBdlW+GO+BuKsxVOjxxqmcz2WnhVqee3n+
         N/vE1Vuf1dkey3iutahzRzlNxSbXN6pP0R/WfE7zGPCNFpOU7f8BFjBPu/beHdrC+/Lk
         kd0A==
X-Gm-Message-State: AOAM532YCfPfZ6gLLjXhivUh1FlB/rVI29Nc+TPZ6yovxs9hBco8hqbF
	LmoXtSUVE5xUrT9pEJkRNI6dAiRDdIwTYw==
X-Google-Smtp-Source: ABdhPJzCKRSuZjOG98cEwGZW/PTlE8IlMr1I5xDAmh6p9LnWZQ5x4DteUZCwQRo9juUFVLG9TBYj/g==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr36210020wrn.180.1620737501294;
        Tue, 11 May 2021 05:51:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] unzip: Exclude CVE-2008-0888 from cve-check
Date: Tue, 11 May 2021 13:51:33 +0100
Message-Id: <20210511125138.2232637-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch mentioned as the fix for the CVE is applied to the 6.0 source
code. Zip versioning makes CPE entry changes hard.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index ec69508eea8..40f0346f8d3 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -33,6 +33,9 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
 
+# Patch from https://bugzilla.redhat.com/attachment.cgi?id=293893&action=diff applied to 6.0 source
+CVE_CHECK_WHITELIST += "CVE-2008-0888"
+
 # exclude version 5.5.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
-- 
2.30.2

