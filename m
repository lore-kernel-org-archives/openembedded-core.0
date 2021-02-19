Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2888.1613698647946518038
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 17:37:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,187,1610380800"; 
   d="scan'208";a="104622756"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Feb 2021 09:37:26 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 5097E4CE72FD
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:37:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Feb 2021 09:37:16 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] wordsize.h: This file should be the same under arm and aarch64, othersise the following error happens:
Date: Fri, 19 Feb 2021 09:36:47 +0800
Message-ID: <1613698607-114826-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5097E4CE72FD.A88D1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

"file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.33-r0.armv7ahf_neon and libc6-dev-2.33-r0.aarch64"

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...29-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 791029c4c0..11a77cdf93 100644
--- a/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0029-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -50,7 +50,7 @@ index 91da566b74..34fcdef1f1 100644
  /* Determine the wordsize from the preprocessor defines.
  
 -   Copyright (C) 2016-2021 Free Software Foundation, Inc.
-+   Copyright (C) 2016-2020 Free Software Foundation, Inc.
++   Copyright (C) 2016-2021 Free Software Foundation, Inc.
     This file is part of the GNU C Library.
  
     The GNU C Library is free software; you can redistribute it and/or
-- 
2.25.1



