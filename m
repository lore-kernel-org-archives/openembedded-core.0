Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9BBC021A6
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 13:37:49 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web11.21045.1739540259490028553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 05:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=L2fGu6p3;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2653; q=dns/txt; s=iport;
  t=1739540259; x=1740749859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=37iPeb7eJNIxTldb1AEBbzs+XWDt735BbpRtrOseq7I=;
  b=L2fGu6p3d6rGvBAlS27S3wsa8Ffwj6leVxn8mu48lzpNVW1ZFw6HyzYC
   aD8tuTq1d9f+uKg79Byr44ILQuB69AUoseDyQY7oaRGZpk8DBtpK1A77V
   PquSjTosKpB9YFnEj8p5UAPbYUy+sApPFtihlkrjLW+NRi5y2fYKISuyJ
   c=;
X-CSE-ConnectionGUID: 7O9VfM5WQsmAqDR37+2umw==
X-CSE-MsgGUID: h4Ryq5E+Sj+IvtQnYFmgrw==
X-IPAS-Result: =?us-ascii?q?A0ASAADARa9n/4z/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF/BgEBAQsBAYJJdllDSIxyiVOaEoQFgSUDVg8BAQEPOQsEAQGFB4sMA?=
 =?us-ascii?q?iY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4V7DUkBD?=
 =?us-ascii?q?AGGAwECASoLAUYsAwECWiMhgwIBgmQDEQauHho3gXkzgQGDWgUJAkNP2TiBa?=
 =?us-ascii?q?AaBSAGNSm8BhHcnG4FJRIJQgi2BBYFcAQSCKoV3BIQegz+HLoN6mXxIgSEDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFxAzUMCzAVgUZDN4JHaUk6Ag0CNYIefIIrhFiEQ14vAwMDA?=
 =?us-ascii?q?4M0hViCEoIOiUqBBEADCxgNSBEsNxQbBj5uB55pATyEKgGBAwoBKyKBL1uTD?=
 =?us-ascii?q?BQQAZIroQSEJYRvhymVLxozqlKYfYoHg32WRIRmgWc8gUcLBzMaCBsVgyJSG?=
 =?us-ascii?q?Q+OLQsLg1iBf4MUxHslMjwCBwsBAQMJjUCEMwEB?=
IronPort-Data: A9a23:z8UYaq5VMksBAAnLL2mKzQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mYcWjqEaK2JNjT0cosiPNi29UhUvJbTzdZqHlY6q3o3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH1dOC89RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr+KUzBHf/g2QpajhNt/rewP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eYqpJxOhSXF537
 vkxMRw3NU/A3f+z3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAg3DzdjRCslO9rqss6G+Vxwt0uFToGIaOI4LaH5wLxy50o
 ErGo17oG0w3d+edihub7kuqt8HKkjnkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:ji0py67jhWsgK5TOlgPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:5iAn5m9+moOvCcIllYKVvxEzS/4rVyDi9WzVClaUMz02C+eITEDFrQ==
X-Talos-MUID: 9a23:83ek4gSao/i+BtWTRXTs2AtzLZpFoJ+sS2ETjawAiueBOjZvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,286,1732579200"; 
   d="scan'208";a="431682161"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Feb 2025 13:37:38 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id B18DF180001ED;
	Fri, 14 Feb 2025 13:37:38 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id 4ADEFCC12B5; Fri, 14 Feb 2025 05:37:38 -0800 (PST)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	madmarri@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
Date: Fri, 14 Feb 2025 05:37:36 -0800
Message-ID: <20250214133736.1121575-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 13:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211388

Upstream Repository: https://gitlab.com/qemu-project/qemu.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-8354
Type: Security Fix
CVE: CVE-2024-8354
Score: 5.5

Signed-off-by: Madhu Marri <madmarri@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2024-8354.patch             | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4dc6c104c7..b967b45b6b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://CVE-2024-8354.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
new file mode 100644
index 0000000000..0f64f46bac
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
@@ -0,0 +1,42 @@
+From d96e157675eace2326955921be17133c0a8b7966 Mon Sep 17 00:00:00 2001
+From: Madhu Marri <madmarri@cisco.com>
+Date: Thu, 13 Feb 2025 12:19:44 +0000
+Subject: [PATCH] usb: Check USB_TOKEN_SETUP in usb_ep_get(CVE-2024-8354)
+
+USB_TOKEN_SETUP packet not being handled in usb_ep_get function.
+This causes the program to hit the assertion that checks for only
+USB_TOKEN_IN or USB_TOKEN_OUT, leading to the failure and core
+dump when the USB_TOKEN_SETUP packet is processed.
+
+Added a check for USB_TOKEN_SETUP to avoid triggering an assertion
+failure and crash.
+
+Fixes: CVE-2024-8354
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2548
+
+Upstream-Status: Submitted [qemu-devel@nongnu.org]
+Signed-off-by: Madhu Marri <madmarri@cisco.com>
+---
+ hw/usb/core.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/usb/core.c b/hw/usb/core.c
+index 975f76250a..df2aec5aca 100644
+--- a/hw/usb/core.c
++++ b/hw/usb/core.c
+@@ -741,6 +741,12 @@ struct USBEndpoint *usb_ep_get(USBDevice *dev, int pid, int ep)
+     if (ep == 0) {
+         return &dev->ep_ctl;
+     }
++
++    if (pid == USB_TOKEN_SETUP) {
++        /* Do not handle setup packets here */
++        return &dev->ep_ctl;
++    }
++
+     assert(pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT);
+     assert(ep > 0 && ep <= USB_MAX_ENDPOINTS);
+     eps = (pid == USB_TOKEN_IN) ? dev->ep_in : dev->ep_out;
+-- 
+2.44.1
+
-- 
2.44.1


