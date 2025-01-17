Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79060C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 08:07:47 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web11.6351.1737101258746269754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 00:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=cfVlViH5;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1625; q=dns/txt; s=iport;
  t=1737101258; x=1738310858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cb2t7NfG/Yt5JngpQEr5vUp4QBAo1TrrLEPxp//ImmY=;
  b=cfVlViH5B0928f7Rv5NrlBe7A4FydJPsZXVsOuNQzzq7wnSynPoEhQz9
   7WLyPR4ILLVqkjAb9qGAofmD6VgFu61eSd54chIP7JfXZmFk6lsTkAK5W
   vYAVV4soasunYBOCaJqJ33OF76SSGcJnCuNk0WQZpnBi85h9gt5UO7l2u
   M=;
X-CSE-ConnectionGUID: IojwpcyzSsOG5kEQ6hS1zQ==
X-CSE-MsgGUID: 8S6YrCyyQtabfDzu0oI0/A==
X-IPAS-Result: =?us-ascii?q?A0APAABLD4pn/4v/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBAYJJdlpCSIxyiVKLdpIlgSUDVg8BAQEPOQsEA?=
 =?us-ascii?q?QGFB4p1AiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4V7DUkBDAEIAYV9NgFGgQxEgwEBgmQCARGzBYIsgQGDWgWBHNk4gW2BSAGNS?=
 =?us-ascii?q?W8BhHcnG4FJRIR9gQWBXAEBAhiBLmWFdwSDd4NujwuQJ0iBIQNZLAFVEw0KC?=
 =?us-ascii?q?wcFgXEDOAwLMBWBSkQ3gkZpSTcCDQI1gh58giuEXIRFYC8DAwMDgzaFYoIUg?=
 =?us-ascii?q?hSEb0ADCxgNSBEsNxQbBj5uB5tSATyDc4EOLCCBAIEMCxOTAZI5oQOEJYwYl?=
 =?us-ascii?q?S4aM6pTmHyOBJZDhGaBZzyBRwsHTSMVgyIJSRkPjiwMC4NYgX+7cSI1AjoCB?=
 =?us-ascii?q?wsBAQMJjUCBM4JrAQE?=
IronPort-Data: A9a23:DBqlIauOONASbaqhY/plJtmTwOfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWGAaP6JMGD9c9B1b9nkoxsC7MeAzIVhG1Q/pS9jRSkQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav656yEhjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuGYzdJ5xYuajhJs/va90s21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2+F1HnlF5
 O4jMxciMxOuvry2++upc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XaCVFs1KNpqMf6GnIxws327/oWDbQUofSGp0JwBfH+
 goq+UypOU8rLveO2AOZ+3iiqv3SxSTaAMU7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:QZa8Rq8BE32iXcL5EDZuk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:bXT3Em7dCEjQc9aeX9ss1UkWBdguY2/m11D/fkyVMDhpc+SHcArF
X-Talos-MUID: =?us-ascii?q?9a23=3AXmNrCQ2KtD8kMer5aBLALejICjUjs5/wOVomgIQ?=
 =?us-ascii?q?/p8COOwBiJm+arWzwa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,211,1732579200"; 
   d="scan'208";a="307046974"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jan 2025 08:07:37 +0000
Received: from sjc-ads-1396.cisco.com (sjc-ads-1396.cisco.com [171.70.59.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 8FE601800023A;
	Fri, 17 Jan 2025 08:07:37 +0000 (GMT)
Received: by sjc-ads-1396.cisco.com (Postfix, from userid 1839047)
	id 211BECC128E; Fri, 17 Jan 2025 00:07:37 -0800 (PST)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	spushpka@cisco.com
Subject: [OE-core] [master] [PATCH] glibc 2.40: Deferred CVE-2010-4756
Date: Fri, 17 Jan 2025 00:07:09 -0800
Message-Id: <20250117080709.3112142-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.59.88, sjc-ads-1396.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 08:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209979

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2010-4756
Type: Security Advisory
CVE: CVE-2010-4756
Score: 4.0

Analysis:
- It is a bug in network facing services if users pass
  in unsanitized inputs to glob, without using appropriate
  rlimits on memory usage. [1]
- Issue is memory exhaustion via glob() calls, e.g. from
  within an ftp server. It is not a security issue, ftp servers
  shouldn't be passing this to libc glob. [2]
- Hence skipping the CVE for now.

Reference:
[1] https://bugzilla.redhat.com/show_bug.cgi?id=681681
[2] https://github.com/openembedded/openembedded-core/commit/cf282ae03db3

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 meta/recipes-core/glibc/glibc_2.40.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-core/glibc/glibc_2.40.bb
index 3e855b19d8..3210492764 100644
--- a/meta/recipes-core/glibc/glibc_2.40.bb
+++ b/meta/recipes-core/glibc/glibc_2.40.bb
@@ -20,6 +20,12 @@ CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
 CVE_STATUS_STABLE_BACKPORTS = ""
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
+# glibc https://nvd.nist.gov/vuln/detail/CVE-2010-4756
+CVE_STATUS[CVE-2010-4756] = "upstream-wontfix: \
+Issue is memory exhaustion via glob() calls, e.g. from within an ftp server. \
+Upstream don't see it as a security issue, ftp servers shouldn't be passing this to libc glob. \
+Exclude as upstream have no plans to add BSD's GLOB_LIMIT."
+
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.35.6


