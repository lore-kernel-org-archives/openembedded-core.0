Return-Path: <madmarri@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7507C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 13:56:19 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.21358.1739541359991483331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 05:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=U6KRiMgo;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: madmarri@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2651; q=dns/txt; s=iport;
  t=1739541360; x=1740750960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lN1C8JH1mzpN9YQTLSOVTzQCcCmBV46Gi/Y2nwOB4Ks=;
  b=U6KRiMgo90ugLyr3cSj63pCpEHYiuxr51gZ7W5eIAvkVYLYqrjFlY3zk
   QSrUuk0q1FAbvNfOLb1QABnifZh2o33jwa4iNmks7QaozpUC9x95PV+6W
   qjifkDg1+Vt3wQy5zGvKq5wer+MUugvI0iuyl8I0sKUO/ZL9LL7E6knGK
   A=;
X-CSE-ConnectionGUID: Ibj8NOYHQP6zI6cwjzylfA==
X-CSE-MsgGUID: r6VOIJwyRmy6LQjeOhLogg==
X-IPAS-Result: =?us-ascii?q?A0AEAAAYSq9n/5X/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgX8FAQEBAQsBgkp2WUNIjHKJU5oShAWBJQNWDwEBAQ85CwQBA?=
 =?us-ascii?q?YUHiwwCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?XsNhloBAgEqCwFGLAMBAlojIYMCAYJkAxEGricaN4F5M4EBg1oFCQJDT9k4g?=
 =?us-ascii?q?WgGgUgBjUpvAYR3JxuBSUSCUIItgQWBXAEEgiqFdwSEHoM/hy6Depl8SIEhA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBcQM1DAswFYFGQzeCR2lJOgINAjWCHnyCK4RYhENeLwMDA?=
 =?us-ascii?q?wODNIVYghKCDolKgQRAAwsYDUgRLDcUGwY+bgeeaQE8hCoBgQMKASsigS9bk?=
 =?us-ascii?q?wwUEAGzL4QlhG+HKZUvGjOqUph9igeDfZZEhGaBZzyBRwsHMxoIGxWDIlIZD?=
 =?us-ascii?q?44tCwuDWIF/gxTER0YyPAIHCwEBAwmRcwEB?=
IronPort-Data: A9a23:9xefgK92IoQ87ZuAFqS/DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WMXWmHQPvjcZGOhfY8ib4vl900Bu5OGx4ViHlFvpX1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4E/rauW5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qpyyHjEAX9gWMsaDtIs//rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kXN49I3MFGIVh2q
 +45djsSbAKSg+yflefTpulE3qzPLeHxN48Z/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0wn1lQ/UPrSmM+tj3X6eidCqXqepLE85C7YywkZPL3Fa4OFIIDQHJoK9qqej
 niYwUPYIA4LDtmOlx688H+LhsvIkiyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:4Sh8rarOAQLhODIHIvfrU4EaV5ogeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080l6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycygaYvp
 0QFJSXz7bLfDxHsfo=
X-Talos-CUID: 9a23:tc2Kd22ix2pjNB4UbYwHfLxfO8onIlv6/VfpGxGqKDhiV7+HWFue0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AgTCbhw11HpENqgSdka3mRShjwzUj+fqQL2EvjoQ?=
 =?us-ascii?q?8vtjaERVyNhCdqDO4Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.13,286,1732579200"; 
   d="scan'208";a="318242177"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Feb 2025 13:55:59 +0000
Received: from sjc-ads-7373.cisco.com (sjc-ads-7373.cisco.com [10.30.220.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 1F480180001D7;
	Fri, 14 Feb 2025 13:55:59 +0000 (GMT)
Received: by sjc-ads-7373.cisco.com (Postfix, from userid 1839049)
	id A867ACC12B5; Fri, 14 Feb 2025 05:55:58 -0800 (PST)
From: Madhu Marri <madmarri@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	madmarri@cisco.com
Subject: [OE-core] [scarthgap] [PATCH] qemu 8.2.7: Fix CVE-2024-8354
Date: Fri, 14 Feb 2025 13:55:54 +0000
Message-ID: <20250214135554.1137043-1-madmarri@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.158, sjc-ads-7373.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 13:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211390

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
index 0000000000..6595803341
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch
@@ -0,0 +1,42 @@
+From f84399128601942228f3decfa4304d86c3fc1a10 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2024-8354
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


