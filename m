Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86230C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9304.1647518251378269705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kbe03YUK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id b19so6985963wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MGwtZpfLJE0Q5DCW64z3ukK4Ww8RHAbhPjEqzdLep8k=;
        b=Kbe03YUKaY20ELe0uaOJ7xmvwcxK6zWDSKG9v+ZCa8AgE2RR+evzHojC7fhIOO2w1I
         t0FWodrJZcIXj8IgCLGx3aJimDfWLVUlYs78pzs+lDRTNft1AzHtE7iFhgQZ5Qt1UMbx
         P2ii9MTAT/o77/ODACggVMzF8Xdr+61fc9tfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGwtZpfLJE0Q5DCW64z3ukK4Ww8RHAbhPjEqzdLep8k=;
        b=ZMNEEJ9azMX6Yeg/mdS2hJBnvlHxGFMno0ESL8ujD0yw2B6lIof0jKuNhYyIWptDdV
         bkOeUW3dGOFX6anAJiyOW8rvUhQzvueEnSzlY9voJGBndvAhKXn6NF49cV5yT8xGJq1x
         dTap591kv3EzG7ZvBDfX70V6RTIewqR4WqaeYKDvcSYDSI63ozNjSxzsLJWZMopNfbrS
         7QjMuBtiCf7McvqaGEWd0aCGB4C21n6yCsqe2/AMu4M1bkeaiBZe6+2D8aNPR+6bO94K
         oUFL3v7lK7fMU1/66IQumQWrwekirUwynV/zodbFtjqIU0UoThYP2qqFmuHAnXv0uSTH
         twHg==
X-Gm-Message-State: AOAM530y/YQca9opYvmJ+5KAE44Nk3T4LWpkJLcdRWqIyDAk6S6KrSZo
	FiP52E89T7OwsMnhoBvrMMzK52c88HsFCsvQ
X-Google-Smtp-Source: 
 ABdhPJxJ5h1YIGXGQcHZCxZTSN9FQUkLQcpph9Y65T+GWhLD7oVRmTB3TC7G3+ap1mqmRcfNXNcW/A==
X-Received: by 2002:a05:6000:1ace:b0:203:d45b:fbce with SMTP id
 i14-20020a0560001ace00b00203d45bfbcemr3648184wry.673.1647518249680;
        Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/26] python3: Add missing HOMEPAGE entries
Date: Thu, 17 Mar 2022 11:56:57 +0000
Message-Id: <20220317115700.993924-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163409

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-chardet_4.0.0.bb       | 1 +
 meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-chardet_4.0.0.bb b/meta/recipes-devtools/python/python3-chardet_4.0.0.bb
index 75fe4df8d77..f53bdc974ad 100644
--- a/meta/recipes-devtools/python/python3-chardet_4.0.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_4.0.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Universal encoding detector for Python 2 and 3"
+HOMEPAGE = "https://pypi.org/project/chardet/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
diff --git a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb b/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
index fed2d91140f..0748886609d 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Invoke py.test as distutils command with dependency resolution"
+HOMEPAGE = "https://pypi.org/project/pytest-runner/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-- 
2.32.0


