Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982AAC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 15:29:24 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.24002.1736954963043826401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 07:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=i+MX3ksK;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=876; q=dns/txt; s=iport;
  t=1736954963; x=1738164563;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nUuPgBvQx+9F5oz+UpGjoKWH3wMJyNB5fuRrspKtz5U=;
  b=i+MX3ksK+KIAZ+ldM/h5CH3I6BTg9rHtyPfdEsvHEeWKRu+a2BfsY5KY
   7rughmcuHYUpMsSTNp2agkBSti/LJVmSr89X570VIiLKwU/QPRXTZ7iSb
   bD/owN8zVGLZlotbOCtoiPcbaASfDjm4E2OrhvZ5vKg0ksP5AD5zvYv7i
   k=;
X-CSE-ConnectionGUID: 367+xfDpR0+/FkMq0N51fA==
X-CSE-MsgGUID: AmSM+m1GRX2Iq6W1WO/Kpg==
X-IPAS-Result: =?us-ascii?q?A0AUAAC904dnj5QQJK1aHAEBAQEBAQcBARIBAQQEAQGCA?=
 =?us-ascii?q?AYBAQsBg0BZQ0i0X4ElA1YPAQEBDzETBAEBhQeKdQImNQgOAQIEAQEBAQMCA?=
 =?us-ascii?q?wEBAQEBAQEBAQEBCwEBBQEBAQIBBwUUAQEBAQEBOQVJhgiGXTYBRoEMRIMBA?=
 =?us-ascii?q?YJkA7MRgiyBAYR72TiBbYFIAY1JhWcnG4FJRIR9hRCFdwSHZp8HSIEhA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBcgM4DAswFTSBGHuCRmlJNwINAjWCHnyCK4RchEeEVYVighSCE?=
 =?us-ascii?q?YQ9QAMLGA1IESw3FBsGPm4HmzoBPINxAYEOgUeBQ5JZa7JlhCWEb4cplS4aM?=
 =?us-ascii?q?6pTLphOpEeEZoFoATiBWzMaCBsVgyIJSRkPjjofwzJGMjwCBwsBAQMJkXEBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:778glq4RO9DuW5Q5kr7URgxRtDDHchMFZxGqfqrLsTDasY5as4F+v
 mNNCzuHOKzfambzc9h+Ydm2pkMCupTVmNYwT1dlrnhjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH1dOC89RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr+KUzBHf/g2QpajtNtvrYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZtNHufZ5LXl0r
 b9fBjMod0il2ru46efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP00n1lQ/UPrSmM+tj3X6eidCqXqepLE85C7YywkZPL3FbIOJJIzbHZwP9qqej
 kvDxEG6B0g1DuzF6CPbzSuToajshSyuDer+E5Xjq6Y12wfMroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymEzq7SpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87V6SJH6+PKCmKT2q+u9XD1FyswNDckOHYKZF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wxmSgBg3N3/auZVjM2GEUD7vt66mnTeoucICuTrsoCNs1oRiG2NPtDABb3nARBodtjxor6p5
 yRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiH4I9AAv2gmfx01b67onAMFh
 meN4Wu9A7cObROXgVNfOdvZ5zkClPK5TIq5Bpg4kPIROcYsK2drAx2ClWbLgjiyyxJz+U3OE
 Zyaas2rRW0LErhqySH+RuEWl9cWKtMWmwvuqWTA503/i9K2PSfNIZ9caQvmRr5itsus/l6Km
 +uzwuPWkH2zpsWiOXGPqeb+7DkicRAGOHwBg5UMKrXbflE+SDlJ5j246epJRrGJVp99zo/gl
 kxRkGcIoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:+hS1Ya7iqx+9N53jygPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: =?us-ascii?q?9a23=3Adh8vnGti8H8o8htDh+lbGBRA6It+LCKe3Hn8O3X?=
 =?us-ascii?q?gSiFHS5iMEXnNoa1Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARAEhRw2YkmVaMR++XOYBfmuzGTUjyqGVLQMIyLo?=
 =?us-ascii?q?8i5OlLHJPYgi6yxevTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,206,1732579200"; 
   d="scan'208";a="414689012"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jan 2025 15:29:12 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 6DD9C180001F7;
	Wed, 15 Jan 2025 15:29:12 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id 00B57CC12B5; Wed, 15 Jan 2025 07:29:12 -0800 (PST)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	madmarri@cisco.com
Subject: [OE-core] [master] [PATCH] strace: add vendor to CVE_PRODUCT to exclude false positives
Date: Wed, 15 Jan 2025 15:29:08 +0000
Message-ID: <20250115152909.2368573-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 15:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209917

- To avoid false positives such as CVE-2000-0006, add the CVE_PRODUCT
value with the vendor.
- The CVE-2000-0006 has the vendor paul_kranenburg:strace.
- This change has been verified by running do_cve_check task for
strace package.

Signed-off-by: Madhu Marri <madmarri@cisco.com>
---
 meta/recipes-devtools/strace/strace_6.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_6.12.bb b/meta/recipes-devtools/strace/strace_6.12.bb
index c16e5dc478..0cbaead216 100644
--- a/meta/recipes-devtools/strace/strace_6.12.bb
+++ b/meta/recipes-devtools/strace/strace_6.12.bb
@@ -53,3 +53,6 @@ do_install_ptest() {
 RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed locale-base-en-us"
 
 BBCLASSEXTEND = "native"
+
+# adding 'CVE_PRODUCT' to avoid false detection of CVEs
+CVE_PRODUCT = "strace:strace"
-- 
2.44.1


