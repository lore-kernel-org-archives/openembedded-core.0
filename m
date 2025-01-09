Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182F6E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 10:21:08 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.web11.44954.1736418065985275646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 02:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=acooruax;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=823; q=dns/txt; s=iport;
  t=1736418066; x=1737627666;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z0RaR05zvow00TuvwFwVH2ZHGR2W/vBVfGN/SEGfPKk=;
  b=acooruax/3linqWc6YFpOxRqXzF/fjKsNfg6DpKS0PsvnsAf98Lj+ZiG
   h3cA1+fMgyhDWCbqb+Y/7uY8EtZmX2EKzQqcOx1Mv9AaXqyWL6a0MC+0v
   se8TV490+4Xz8nKdB02GkKR1NNxS/dJmZb/hgC3QywiuVwNCrz40rWLLy
   0=;
X-CSE-ConnectionGUID: 1LPkj0ciSyeipHVv2LYrsg==
X-CSE-MsgGUID: seWNpHxGRqqokiR8JKVpGg==
X-IPAS-Result: =?us-ascii?q?A0A3AADPoX9n/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?wcBAQsBAYJJdllDSIxyp2yBJQNWDwEBAQ8xEwQBAYUHinYCJjQJDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThghJAQwBhgY2AUaBDESDA?=
 =?us-ascii?q?QGCZAOyboIsgQGEe9k4gW2BSAGNSYVnJxuBSUSEfYUQhXcEh2meMEiBIQNZL?=
 =?us-ascii?q?AFVEw0KCwcFgXMDOAwLMBU1gRt7gkZpSTcCDQI1gh58giuEXoRHhFiFZ4IXg?=
 =?us-ascii?q?hSDQ0ADCxgNSBEsNxQbBj5uB5sJATyDbwGBDoFHgUOSWWuRYqEDhCWEb4cpl?=
 =?us-ascii?q?S4aM6pTLphOpEeEZoFnPIFZMxoIGxWDIglJGQ+OWbsdJTI8AgcLAQEDCY1Ag?=
 =?us-ascii?q?2MBAQ?=
IronPort-Data: A9a23:5sIdWqtfHeahafpq6T8brkzcK+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKTjVb6mIa2enKdAga9/k80IGsZLVz4drSgNrr3s8F3wagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav656yEhjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuGYjdJ5xYuajhJs/vb+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwo8JPAmMW/
 v0jOT0MdjC9mbiS8aigRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XdjRUrVuPv6sf6GnIxws327/oWDbQUofSGZkPwhfD+
 goq+UziDy48LPyP5gCc63Wvh9WfvwDFQK0dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:IJJrQq/1uYXNk8I6y0luk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:FsypXGFHJM6ZO7+yqmI+0HYXGJguc0bMwXbIA3GmU0JYUqaaHAo=
X-Talos-MUID: 9a23:8a6oqwqoOiHibcJPon4ezypvC+Fww7SBMlkUlpYHgZmmFhJoFDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.12,301,1728950400"; 
   d="scan'208";a="304424934"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Jan 2025 10:21:04 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id C441E18000344;
	Thu,  9 Jan 2025 10:21:04 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id 4A0A8CC12B5; Thu,  9 Jan 2025 02:21:04 -0800 (PST)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	spushpka@cisco.com,
	Madhu Marri <madmarri@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] strace: add vendor to CVE_PRODUCT to exclude false positives
Date: Thu,  9 Jan 2025 02:20:51 -0800
Message-ID: <20250109102051.3685800-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 10:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209625

- To avoid false positives such as CVE-2000-0006, add the CVE_PRODUCT
value with the vendor.
- The CVE-2000-0006 has the vendor paul_kranenburg:strace.
- This change has been verified by running do_cve_check task for
strace package.

Signed-off-by: Madhu Marri <madmarri@cisco.com>
---
 meta/recipes-devtools/strace/strace_6.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_6.7.bb b/meta/recipes-devtools/strace/strace_6.7.bb
index c8c83cdf7c..30ac31ee69 100644
--- a/meta/recipes-devtools/strace/strace_6.7.bb
+++ b/meta/recipes-devtools/strace/strace_6.7.bb
@@ -54,3 +54,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
 "
 
 BBCLASSEXTEND = "native"
+
+# adding 'CVE_PRODUCT' to avoid false detection of CVEs
+CVE_PRODUCT = "strace:strace"
-- 
2.44.1


