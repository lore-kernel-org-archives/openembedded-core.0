Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.4076.1614658340979899722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 20:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,216,1610380800"; 
   d="scan'208";a="105008196"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Mar 2021 12:12:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DC64D4CE7C1A
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Mar 2021 12:12:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Mar 2021 12:11:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libxcrypt-compat: upgrade 4.4.17 -> 4.4.18
Date: Tue, 2 Mar 2021 12:11:53 +0800
Message-ID: <1614658313-64713-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DC64D4CE7C1A.AAEC7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

When the libxcrypt version is updated, libxcrypt-compat is omitted.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{libxcrypt-compat_4.4.17.bb => libxcrypt-compat_4.4.18.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.17.bb => libxcrypt-compat_4.4.18.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.17.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.18.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.17.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.18.bb
-- 
2.25.1



