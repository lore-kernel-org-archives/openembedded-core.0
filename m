Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6A5C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 11:14:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.8537.1647947656949753885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GyeG4re3;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id v4so15364146pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=y95CVS64JZOZa+f33CRYOHZZxTBHSLkyL4v5WLG3Itg=;
        b=GyeG4re3gu5n0obvUagMfBVO2tALGjJFDqK5Ly4kYnI/ghaLOibFswTKYAA7/ng/rr
         rQW5lal68QZ1QtzIVUS0nTHg3au4z0ugwmcfbVCUW1G/2q88Tb4kaBq+W+6aGTV61zAW
         jpgAz4QkURW8xQK5SXXszDI1X32w2FvGsHj+xCXCGKdnUsEyGtiFWtHBRNs+EewFgGef
         w2IYsccTO9Yhn50dyc0tVZtd6EA7xJWcUlHfqU718J11TTwHzKzR0u2spg8xtNKlwtgn
         gas+8oRUortOoqeVvR6EIIlQyxcNBFBip2c0tLpBSCFCGjvtXhlafUB4NT7o5B1s7gg5
         E/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=y95CVS64JZOZa+f33CRYOHZZxTBHSLkyL4v5WLG3Itg=;
        b=XgwuCQ2AqPh81m3yVmifJL9xL23sK8F25cSDKyxCm4411l4COhJVa+ng50/07Gxq+u
         a/UzOuWdn1TjkEPfATfjF6vf+fiTO9aMIlVmKkx9NrxWm8vzGcJ85CPog874phBDO/I0
         xcZeJqnOq1VAa9BWIsgLTKvSdqq0prnF/oo8g+8x2L/ZSsXlHbMVGxmt94iAXUTFQtVK
         yJqqvzxPUqAmcSpyGjUHfwn/LgCvpbI3RZ+ib4jiVpgEQbh3Q8zRLCJb66fbj9mFa7os
         wVWjxQg2ckENwKBOSDk+pnrRjDlH0NBK46BNw32hNaPWNdHCVmmU+zoioXbUDP236FcF
         Eoow==
X-Gm-Message-State: AOAM533O6CDd81cTY0nZFqQA8P0lCtEacM/CByayvyU/amgz0CYEH1dc
	WGxcprwUvwBFDLqy7QXO4hT8/xZ5umIZFw==
X-Google-Smtp-Source: 
 ABdhPJyRYcQx/z+OrJjekeiC10lG5m3UWBiQn2wr/3H/vZwr7d7D0pJQDMkQRYa6Ij3ZazU3QbylnQ==
X-Received: by 2002:a17:90b:1184:b0:1c7:2d83:6e03 with SMTP id
 gk4-20020a17090b118400b001c72d836e03mr4423752pjb.221.1647947656133;
        Tue, 22 Mar 2022 04:14:16 -0700 (PDT)
Received: from localhost.localdomain ([103.115.128.22])
        by smtp.gmail.com with ESMTPSA id
 2-20020a17090a034200b001bfc572d018sm2502547pjf.48.2022.03.22.04.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 04:14:15 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH] binutils: Whitelist CVEs
Date: Tue, 22 Mar 2022 16:44:02 +0530
Message-Id: <20220322111402.21283-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 11:14:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163545

CVE-2020-16590 CVE-2020-16591 CVE-2020-16599 CVE-2021-20294 does
not affect binutils_2.34 and the contents of the patch are not
present in the source code. Therefore, whitelist it.

Links:
https://nvd.nist.gov/vuln/detail/CVE-2020-16590
https://nvd.nist.gov/vuln/detail/CVE-2020-16591
https://nvd.nist.gov/vuln/detail/CVE-2020-16599
https://nvd.nist.gov/vuln/detail/CVE-2021-20294

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.34.inc | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 6a55de2d45..990c5fa8f1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -54,3 +54,18 @@ SRC_URI = "\
      file://0001-CVE-2021-45078.patch \
 "
 S  = "${WORKDIR}/git"
+
+# CVE-2020-16590 CVE-2020-16591 CVE-2020-16599 CVE-2021-20294 does not affect
+# binutils_2.34 and the contents of the patch are not
+# present in the source code. Therefore, whitelist it.
+# https://nvd.nist.gov/vuln/detail/CVE-2020-16590
+# https://nvd.nist.gov/vuln/detail/CVE-2020-16591
+# https://nvd.nist.gov/vuln/detail/CVE-2020-16599
+# https://nvd.nist.gov/vuln/detail/CVE-2021-20294
+
+CVE_CHECK_WHITELIST += " \
+    CVE-2020-16590 \
+    CVE-2020-16591 \
+    CVE-2020-16599 \
+    CVE-2021-20294 \
+"
-- 
2.17.1


