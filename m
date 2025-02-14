Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4012C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 11:07:48 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.18592.1739531258850961157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 03:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=KFVgh3bb;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2653; q=dns/txt; s=iport;
  t=1739531258; x=1740740858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ywko0KVHj3QLmK/cAOJsH8AWW3WRATua/snuuOfvPFc=;
  b=KFVgh3bbmxpxJc8IYLD86UPGwIl8UNhPj3yxsvUqQf6Jj/taf2ByD2Qc
   iGIerq5uKdYb1DFitwpSizGC8bL5CflKEfGNUT51CtDfrwtiH5i+HPZ0N
   V21lbHeIez/ysz8eZXgkxBwspi9s2lEJ+NrGqA38TdIL+VZKdUNw9IK3K
   4=;
X-CSE-ConnectionGUID: qc+vWnEHTtywkfVhfsVfDQ==
X-CSE-MsgGUID: jCPLgLV4TyesymDspLi9jQ==
X-IPAS-Result: =?us-ascii?q?A0ASAAAiI69n/4z/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF/BgEBAQsBAYJJdllDSIxyiVOaEoQFgSUDVg8BAQEPOQsEAQGFB4sMA?=
 =?us-ascii?q?iY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4V7DUkBD?=
 =?us-ascii?q?AGGAwECASoLAUYsAwECWiMhgwIBgmQDEQauKRo3gXkzgQGDWgUJAkNP2TiBa?=
 =?us-ascii?q?AaBSAGNSm8BhHcnG4FJRIJQgi2BBYFcAQSCKoV3BIQegz+HLoN6mXxIgSEDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFxAzUMCzAVgUZDN4JHaUk6Ag0CNYIefIIrhFiEQ14vAwMDA?=
 =?us-ascii?q?4M0hViCEoIOiUqBBEADCxgNSBEsNxQbBj5uB55pATyEKgGBAwoBKyKBL1uTD?=
 =?us-ascii?q?BQQAZIroQSEJYRvhymVLxozqlKYfYoHg32WRIRmgWc8gUcLBzMaCBsVgyJSG?=
 =?us-ascii?q?Q+OLQsLg1iBf4MUxH4lMjwCBwsBAQMJjUCEMwEB?=
IronPort-Data: A9a23:d1X8rKvqchSXjvWGR92FEDPAI+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWrSMv7YZTekf4tzPYy/ph8PvcDVx4djTAc4qH8xFCwWgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav656yEhjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuGYzdJ5xYuajhJs/ja9Esz1BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw4+00H15I2
 NwkNCESbR69h+yt/ryXc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XdjRUrVuPv6sf6GnIxws327/oWDbQUoDRHJgJzxfA+
 Aoq+Uz7KSk+O/ihlQaU/2m9g8PUhQf6CYArQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:3CkQj65igehhCpB+tgPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:TnXfUm5/w1LCeImRltss7UVXBP8jX13h0GbPIEGGCWhydrO5cArF
X-Talos-MUID: 9a23:Cuko9wQLhar0UcUHRXTurwlGO+NWv5i/BVsclLkdo+2FZC5JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,285,1732579200"; 
   d="scan'208";a="431549906"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Feb 2025 11:07:38 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 08328180001EC;
	Fri, 14 Feb 2025 11:07:38 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id 852C1CC12B5; Fri, 14 Feb 2025 03:07:37 -0800 (PST)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	madmarri@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
Date: Fri, 14 Feb 2025 03:07:27 -0800
Message-ID: <20250214110728.966806-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 11:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211385

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
index 4dc6c104c7..8ab8adca9e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,6 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-8354.patch \
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


