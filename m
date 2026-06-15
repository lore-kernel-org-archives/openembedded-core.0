Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD8CCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:08:34 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127137.1781521710807982736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LsuVCSp5;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5344; q=dns/txt;
  s=iport01; t=1781521710; x=1782731310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B8PTD8UtaFG0uuLPg/SiMTekyZQKofvlUqLyxM71nqs=;
  b=LsuVCSp54sqRYMr881a0wwrd729SlCQG6fMwjX7bQD82Q+BC8QlDteA1
   VW9WfX89ecHGZ6SIFL7MJGdHWqfSDcBQ5Y3AkUFqwywdUayZf8tPygjZb
   Eh8dFKifrDDuS7tnT9Q8uI8pHyfnjL+yFPWBeTT8s2JfkUoQXTw5laRY8
   5iECj7bm1VxwB2lHgKdPCV7+13adzwuW1cshRxZFmYaMI+wso9b4HYirj
   HLIB/rHLVuyjCJ1ZajC0VerTOtTyO2Yxjl6W8lqlUwo3SaHX7bMkxyiQp
   6WClwX14rKWl9QFC4YtwEon9WsXCF8NVOD85zgGUDj+czu86rEOQJ+b1t
   A==;
X-CSE-ConnectionGUID: RiOLS9ozRXmgb5y4aK+mHA==
X-CSE-MsgGUID: ZJBAAsoLTWiDYo4ULtuA/Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgBi3C9q/43/Ja1aglmCV3RfQkkDlkgDgROdCBSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEQEYCjUMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnMCARGzSBo3g?=
 =?us-ascii?q?XkzgQGDKAE/AkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKBFYE7gTh2gQWBX?=
 =?us-ascii?q?AKBR4ZeBIIigQyBWh6CJCaMQEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYFKgg+BBYUNIx8DOX+BcIElZ2YVMDWBAQERHwocAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeMUhcPgXgzEgFjKgEKISJjEwiBAAwRk2kCkXqhDwoog3WMIZU6GjOEB?=
 =?us-ascii?q?JQXklELmH2OCpVoaIRogWg8gVlwFTuCZwlKGQ+OKg4Lg2CFE8MKJDUCCQMwA?=
 =?us-ascii?q?QcCBw8CgXORfQEB?=
IronPort-Data: A9a23:DqDMh66E6MC8cTmf+xyDgAxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mIdDGyCbKuDYzD8c4h/OYqx905T7Z/QzIJiQFQ5qC09Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eB4w/3t0mBnN0x
 fkXIm0cMhmgxOeW6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAj3X4dTJRsl+9rqss6G+Vxwt0uFToGIaEJo3TFZ4NxC50o
 Er03U7QKwodEOCgyBa09S6RovPStGTCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:SPySkKorGEQ+SmFmRJ/r9swaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3A+HLG4mpwVB1GuVl1r9+ToVTmUfokVVnmnXDCGX+?=
 =?us-ascii?q?9Bmw0WeGcahyV2Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:zoa41Qa78hdNmOBThR3GrRh5M+NU3KWCOUdRrLEapuDDDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,206,1774310400"; 
   d="scan'208";a="494918302"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 11:08:29 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 9BF0A180005E5;
	Mon, 15 Jun 2026 11:08:29 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 41472CC12A6; Mon, 15 Jun 2026 04:08:29 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [master] [PATCH v2] libusb1: fix CVE-2026-23679 and CVE-2026-47104
Date: Mon, 15 Jun 2026 04:08:02 -0700
Message-ID: <20260615110825.230591-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612123823.1236106-1-adongare@cisco.com>
References: <20260612123823.1236106-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238834

From: Anil Dongare <adongare@cisco.com>

- Pick the upstream patch [1] as mentioned in [2] and [3].
  included in v1.0.28.

[1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231
[2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
[3] https://security-tracker.debian.org/tracker/CVE-2026-47104.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../CVE-2026-23679_CVE-2026-47104.patch       | 89 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.29.bb |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch

diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
new file mode 100644
index 0000000000..f15f089f9f
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
@@ -0,0 +1,89 @@
+From 04a9508e07582f553e9ea767f9e4a9b93839914b Mon Sep 17 00:00:00 2001
+From: MarkLee131 <kaixuan.li@ntu.edu.sg>
+Date: Sat, 25 Apr 2026 18:33:17 +0800
+Subject: [PATCH] descriptor: Fix two memory-safety bugs in malformed config
+ descriptor handling
+
+Two issues reachable from a malformed config descriptor returned by an
+attached USB device, both surfaced by the same libFuzzer + ASan run.
+
+1) parse_interface() reads bNumEndpoints from the interface descriptor and
+   increments usb_interface->num_altsetting before entering the inner loop
+   that skips class/vendor specific descriptors ahead of the endpoint
+   array. If that loop's bLength > size short-read branch fires, the
+   function returns before the endpoint array is allocated, leaving the
+   caller with bNumEndpoints > 0 and endpoint == NULL. libusb.h documents
+   endpoint as an array sized by bNumEndpoints, and the testlibusb and
+   xusb examples both iterate it accordingly, so a NULL deref follows.
+   Reset bNumEndpoints to 0 before returning so the invariant holds.
+
+2) The first-pass loop in parse_iad_array() compares header.bLength
+   against the original size argument instead of the remaining bytes,
+   so a single descriptor with bLength == size - 1 lets consumed reach
+   size - 1 and the next iteration enters with only one byte of buffer
+   left. The buf[1] read on the second line of the loop body lands one
+   byte past the malloc allocation that backs the descriptor data. The
+   sibling parsers parse_configuration() and parse_interface() in the
+   same file already use the remaining-bytes form. Switch the IAD parser
+   loop guard and bound check to match.
+
+Both code paths are reachable from public APIs (libusb_get_*_config_descriptor
+and libusb_get_*_interface_association_descriptors), with the malformed
+input supplied by the attached device. Minimal reproducers are 20 and
+9 bytes respectively.
+
+Fixes #1813
+
+CVE: CVE-2026-23679 CVE-2026-47104
+Upstream-Status: Backport [https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231]
+
+Backport Changes:
+- The upstream version_nano.h bump is omitted because this is a security
+  backport to libusb 1.0.29, not a version upgrade.
+
+Signed-off-by: MarkLee131 <kaixuan.li@ntu.edu.sg>
+(cherry picked from commit bc0886173ea15b8cc9bba2918f58a97a7f185231)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ libusb/descriptor.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/libusb/descriptor.c b/libusb/descriptor.c
+index 870883a..7d4f118 100644
+--- a/libusb/descriptor.c
++++ b/libusb/descriptor.c
+@@ -241,6 +241,10 @@ static int parse_interface(libusb_context *ctx,
+ 				usbi_warn(ctx,
+ 					  "short extra intf desc read %d/%u",
+ 					  size, header->bLength);
++				/* Keep the invariant: bNumEndpoints > 0 implies
++				 * endpoint != NULL. The endpoint array isn't
++				 * allocated yet on this early return. */
++				ifp->bNumEndpoints = 0;
+ 				return parsed;
+ 			}
+ 
+@@ -1365,7 +1369,7 @@ static int parse_iad_array(struct libusb_context *ctx,
+ 
+ 	/* First pass: Iterate through desc list, count number of IADs */
+ 	iad_array->length = 0;
+-	while (consumed < size) {
++	while (size - consumed >= DESC_HEADER_LENGTH) {
+ 		header.bLength = buf[0];
+ 		header.bDescriptorType = buf[1];
+ 		if (header.bLength < DESC_HEADER_LENGTH) {
+@@ -1373,9 +1377,9 @@ static int parse_iad_array(struct libusb_context *ctx,
+ 				 header.bLength);
+ 			return LIBUSB_ERROR_IO;
+ 		}
+-		else if (header.bLength > size) {
++		else if (header.bLength > size - consumed) {
+ 			usbi_warn(ctx, "short config descriptor read %d/%u",
+-					  size, header.bLength);
++					  size - consumed, header.bLength);
+ 			return LIBUSB_ERROR_IO;
+ 		}
+ 		if (header.bDescriptorType == LIBUSB_DT_INTERFACE_ASSOCIATION)
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.29.bb
index 856e32d1c6..d287ec171f 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -14,6 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-23679_CVE-2026-47104.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
-- 
2.51.0


