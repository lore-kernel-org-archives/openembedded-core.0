Return-Path: <pooadire@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AE1C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 16:17:14 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.web10.76343.1701361025657066326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 08:17:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=XVyP278x;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: pooadire@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1205; q=dns/txt; s=iport;
  t=1701361025; x=1702570625;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+97hiZUbHnhvrxugX3o93l/ylqhr9TQnHsj6NwHGhV0=;
  b=XVyP278xsCwIxI7w+W4x2nLQrKPdXxpLoa/tNWWdDCab+gzQ7tve99sw
   REQkrfiyva+DPkKTzTR/DraLcYlliSyNRxkQHhY4GpdD24zUrBdmjqOZh
   T4/+Yhqu2CtzwTffOZrg5/UGI4R+kA1WrLBPa/g0sLXn6rW0vnC05eVq4
   4=;
X-CSE-ConnectionGUID: GXG6qY35TVaUkzW8/aB0yg==
X-CSE-MsgGUID: 49EFZqKcRFqnIhj57ORdkw==
X-IronPort-AV: E=Sophos;i="6.04,239,1695686400"; 
   d="scan'208";a="149520755"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 16:17:05 +0000
Received: from bgl-ads-5837.cisco.com (bgl-ads-5837.cisco.com [173.39.9.208])
	by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 3AUGH2Za000643
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Nov 2023 16:17:04 GMT
Received: by bgl-ads-5837.cisco.com (Postfix, from userid 1807045)
	id 98D58CC129C; Thu, 30 Nov 2023 21:47:01 +0530 (IST)
From: poojitha adireddy <pooadire@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: pooadire@cisco.com
Subject: [OE-core] [dunfell] [PATCH] binutils: Mark CVE-2022-47696 as patched
Date: Thu, 30 Nov 2023 21:46:52 +0530
Message-Id: <20231130161652.4132631-1-pooadire@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 173.39.9.208, bgl-ads-5837.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 16:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191513

CVE-2022-47696 and CVE-2023-25588 are representing similar kind
of vulnerability.

Reference:
https://ubuntu.com/security/CVE-2022-47696
https://sourceware.org/bugzilla/show_bug.cgi?id=29677

Signed-off-by: poojitha adireddy <pooadire@cisco.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch b/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
index 065d8e47f0..aa5ce5f3ff 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2023-25588.patch
@@ -13,7 +13,10 @@ anyway, so get rid of them.  Also, simplify and correct sanity checks.
 ---
 Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d12f8998d2d086f0a6606589e5aedb7147e6f2f1]
 CVE: CVE-2023-25588
+CVE: CVE-2022-47696
+
 Signed-off-by: Ashish Sharma <asharma@mvista.com>
+Signed-off-by: poojitha adireddy <pooadire@cisco.com>
 
  bfd/mach-o.c | 72 ++++++++++++++++++++++------------------------------
  1 file changed, 31 insertions(+), 41 deletions(-)
-- 
2.35.6


