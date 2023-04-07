Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E91C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 10:58:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.4528.1680865123344414458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 03:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ATrEe335;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id he13so4238783wmb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680865121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=69BXof+sOySZCB7gZ//ySMrMhTOl1mJeMjnbh25h7gg=;
        b=ATrEe335JNd+PfUM0slOHcH0vdBTj7Qa5mKHff+a41/qFSY+jWXPHAosFyOJT49jd3
         qnmkCTdeuhxe/wEU4OEkDxlrhdDmQmBojLB4HCxwTGS6935UlQGFkPBudoMqRsWQYbSl
         PmC6cCKWxjHBbeinIpqo8RyWAtDMBsjucOoCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680865121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=69BXof+sOySZCB7gZ//ySMrMhTOl1mJeMjnbh25h7gg=;
        b=qCyO7BRwmI6hStuVgUdpvN9Ad/o26BZqwf2sqKUHo5Dtsp6JgTzg9LSHSGiiP7s2fb
         Is+R55uH9bjt0qaUPijpCeeExoAG1r6T4R5iv6pLx4+0H6spuFFGM431MIY1uPHnz+wT
         zpVTipEFpedj1EoG4YS24jbNZp0oEHCd/HmfapdAAB8GwyPg85Dh6KgFath4rhCbszI+
         uoSwip0Y35fxLEiTfGhQJzkE9sEbyeLpduj6mtbF1DfHtB3LVlnb0xDWx5AHXcWrSPaO
         ZxCuTQOwILRPMa1fUEnfoR3mo8+ynYSWOd5emECfgjJrK58210MwZtvnnd9grViTx/iD
         lYWw==
X-Gm-Message-State: AAQBX9cs8ZROWfCUOIVlL+kPcqRSMfk/gyloAoCeWI37jpn0udYoHpdv
	pISevrzh/jt/LMaVGcCpU5+oQmT7by7EmFp5ld0=
X-Google-Smtp-Source: AKy350bls625xmJ+BApZk4hV9WWcbpb5zm6qmqX0rqLmMoGjY8xxME/3p3ONNL5ckEAVVoKSxTcj4w==
X-Received: by 2002:a05:600c:ac6:b0:3ed:f9d3:f95c with SMTP id c6-20020a05600c0ac600b003edf9d3f95cmr1011164wmr.19.1680865121318;
        Fri, 07 Apr 2023 03:58:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:be03:9b2d:76a:ec3b])
        by smtp.gmail.com with ESMTPSA id d9-20020adfef89000000b002d2f0e23acbsm4286748wro.12.2023.04.07.03.58.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 03:58:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-exclusions: Document some further linux-yocto CVE statuses
Date: Fri,  7 Apr 2023 11:58:40 +0100
Message-Id: <20230407105840.635561-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 10:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179817

Add some information about some further kernel CVEs which don't apply for
either linux-yocto or don't apply for linux-yocto 6.1.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/cve-extra-exclusions.inc |  7 +++++++
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc   | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 0b895985015..76dab1d630a 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -438,6 +438,13 @@ CVE_CHECK_IGNORE += "CVE-2023-1073"
 # Backported in version 6.1.9 9f08bb650078dca24a13fea1c375358ed6292df3
 CVE_CHECK_IGNORE += "CVE-2023-1074"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2023-1076
+CVE-2023-1076: linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1076 *
+# Patched in kernel v6.3 a096ccca6e503a5c575717ff8a36ace27510ab0a
+# Backported in version 6.1.16 b4ada752eaf1341f47bfa3d8ada377eca75a8d44
+# Backported in version 5.15.99 67f9f02928a34aad0a2c11dab5eea269f5ecf427
+CVE_CHECK_IGNORE += "CVE-2023-1076"
+
 # https://nvd.nist.gov/vuln/detail/CVE-2023-1077
 # Patched in kernel 6.3rc1 7c4a5b89a0b5a57a64b601775b296abf77a9fe97
 # Backported in version 5.15.99 2c36c390a74981d03f04f01fe7ee9c3ac3ea11f7
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index ec7ff9c1a7b..b74e9675e15 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -13,3 +13,16 @@ CVE_CHECK_IGNORE += "CVE-2022-3566"
 # Patched in kernel since v6.1 364f997b5cfe1db0d63a390fe7c801fa2b3115f6
 CVE_CHECK_IGNORE += "CVE-2022-3567"
 
+# https://nvd.nist.gov/vuln/detail/CVE-2022-38457
+# https://nvd.nist.gov/vuln/detail/CVE-2022-40133
+# Patched in kernel v6.2 a309c7194e8a2f8bd4539b9449917913f6c2cd50
+# Patched in kernel 6.1.7 7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
+CVE_CHECK_IGNORE += "CVE-2023-38457 CVE-2022-40133"
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


