Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE09C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:24:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9513.1680877469927758363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M0ohu84g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d17so42423003wrb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680877468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy8fFwQUmTY7dNMnUl+pLLBOoswSD64jZGmI7nLsyBg=;
        b=M0ohu84g6kuNWqU2LYx6zLXoXXtZpe82sH137koqzvV6BnKDaXHznDeMKfuZrcGsxH
         JAU6he6QFmyI9yNmHJ2me3YXe5STkCkHPrq3bTwqO0m9JUKP5S0GsgE9YNkTlb2be2qg
         zeONcsOJv1T0Z/J4N0EshajSTkzXULPYHhPmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680877468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy8fFwQUmTY7dNMnUl+pLLBOoswSD64jZGmI7nLsyBg=;
        b=oojdbOn+mtO2dufT0MgIRUUkCyIs4CEsC1NPo3Ht/Pw4+sSKhRhA5AWmrsTa5ndeVo
         eclASh+nSV7Cty3uDmsdKQe8I3dhr5fIIc7x0Co6loZhAd85iJqaXDbBQw//XnDQfVJ7
         O14IRq5EYxJPHNq7jloDgM8kJLeNC96HRiv6WkG4FW7429tWIBjJF49DzrWRIsJ1anJn
         ZQOiiMFLTydgKSv19W+KseBvJcFxrOMgTFYnZiiVfMX0xLwcKCE6+ERz+WeF6ERDbXZM
         K43qQuv+CgoGNEmXqGjpcpAEGQEcXali8KvxrKFWdHr1FgH+DOW76kaFsNlJO1n11Eo5
         uBKQ==
X-Gm-Message-State: AAQBX9ffMUVg9cwbA8bVh4wglNVD0rOmZlMHi05k5qrp2E9H9IhyECQg
	yrsqz9+KwfRgRLYKZFvuiQQ1xyM03h4CaD7FusU=
X-Google-Smtp-Source: AKy350Z5dcXKsADo17IE2TXYd7x0Uq/8u5k4d+LWhZwbLAY+4Unnlk0OL5JCnUr81vw+7E4jasZK3Q==
X-Received: by 2002:a5d:69c8:0:b0:2ef:b341:4a2d with SMTP id s8-20020a5d69c8000000b002efb3414a2dmr1194454wrw.24.1680877468225;
        Fri, 07 Apr 2023 07:24:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:be03:9b2d:76a:ec3b])
        by smtp.gmail.com with ESMTPSA id o13-20020a5d62cd000000b002c70ce264bfsm4659806wrv.76.2023.04.07.07.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:24:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] cve-exclusions: Document some further linux-yocto CVE statuses
Date: Fri,  7 Apr 2023 15:24:27 +0100
Message-Id: <20230407142427.642876-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 14:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179822

Add some information about some further kernel CVEs which don't apply for
either linux-yocto or don't apply for linux-yocto 6.1.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 9 +++++++++
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc   | 9 ++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 439d569f7d0..8965a15b371 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -438,6 +438,15 @@ CVE_CHECK_IGNORE += "CVE-2023-1073"
 # Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
 CVE_CHECK_IGNORE += "CVE-2023-1074"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1076
+# Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
+# Backported in version v5.4.235 d92d87000eda9884d49f1acec1c1fccd63cd9b11
+# Backported in version v5.10.173 9a31af61f397500ccae49d56d809b2217d1e2178
+# Backported in version v5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf427
+# Backported in version v6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
+# Backported in version v6.2.3 4aa4b4b3b3e9551c4de2bf2987247c28805fb8f6
+CVE_CHECK_IGNORE += "CVE-2023-1076"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1077
 # Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
 # Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 8b32c2b2dfb..aeea77a2249 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -13,7 +13,6 @@ CVE_CHECK_IGNORE += "CVE-2022-3566"
 # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
 CVE_CHECK_IGNORE += "CVE-2022-3567"
 
-
 # 2023
 
 # https://nvd.nist.gov/vuln/detail/CVE-2022-38457
@@ -27,3 +26,11 @@ CVE_CHECK_IGNORE += "CVE-2022-3567"
 #  * https://www.linuxkernelcves.com/cves/CVE-2022-40133
 #  * https://lore.kernel.org/all/CAODzB9q3OBD0k6W2bcWrSZo2jC3EvV0PrLyWmO07rxR4nQgkJA@mail.gmail.com/T/
 CVE_CHECK_IGNORE += "CVE-2022-38457 CVE-2022-40133"
+
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1075
+# Introduced in v4.20 a42055e8d2c30d4decfc13ce943d09c7b9dad221
+# Patched in kernel v6.2 ffe2a22562444720b05bdfeb999c03e810d84cbb
+# Backported in version 6.1.11 37c0cdf7e4919e5f76381ac60817b67bcbdacb50
+# 5.15 still has issue, include/net/tls.h:is_tx_ready() would need patch
+CVE_CHECK_IGNORE += "CVE-2023-1075"
+
-- 
2.39.2


