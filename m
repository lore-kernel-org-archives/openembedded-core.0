Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A186ECA6002
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:56 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16183.1791192229840090796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HIbBXFGy;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4758; q=dns/txt;
  s=iport01; t=1791192229; x=1792401829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RS6467yJbRugOeSNowLLrGg5k1ipLxzkosyB7h7oeFU=;
  b=HIbBXFGypEKDmg1CAf2K3ylGa3iIO97ZoSN+1UaQnmrYud14kfO5nr1J
   gNXRxrAxEohupJFMfndYjkXaNDm+pcwaSKWdKfzMl8EozMKdL+Axh9hDH
   PrV8Tu6opsu62osdbe8FWwHOcNc/mpKpbKiFJV6L22fEKpRrch6GipuoW
   kYCeYfngyzLrDaE5J1T8UPghySrgfxa7L50X+rAxqE+S4P15ggLne4e5C
   Dd3VbjF1X/+tHXK9vaPPUSjtEDKLJ6dJ+8YTu0GYf89J6/bcMJBw02myF
   LAJijNknH2quiCrjtmcQjli8rVqyLaNIOl0pJS9ECoj1y2+SVrJgrPmV2
   Q==;
X-CSE-ConnectionGUID: WQzBg7l9SBiGPzQNI69kDg==
X-CSE-MsgGUID: faqLVf8zQDqeY/3hEDpVkA==
X-IPAS-Result: =?us-ascii?q?A0BNAgC3a8Nq/47/Ja1aglmCV3VhQkmWSgOaFoQEgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4JAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAIBEbUxgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYNpgQWBXAEBAoE2h?=
 =?us-ascii?q?m0EgiKBDIFaHpNOSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklRRJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEQXDBAYDUgRLDcVGQQ+bgeQUB6CE0wBATw+EwEqAYEFU?=
 =?us-ascii?q?IEloweCIaEPCiiDdowilToaM6pvC5h9igspg1aWUIRpgWg8gUcLB3AVgyIJS?=
 =?us-ascii?q?hkPjjmDa4F/gxTHJiQ1AgkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:3acuza4Svi7M6+XBdGSJAQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mAXCmGDaPfca2Ohc9p2bdjg/UkG6seHzddrHVRr+39nZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eArQK0OkoBTB13
 /03ECI0SDHd1uGaz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc2FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEVUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYOKIoHQH5kN9qqej
 mzP5kDHDEEIDfCGxAvCqXKBqvfxngquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:PfquHajU0XmNLLWeOj+mLZlLgnBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:tpUoqGAuVNS2/EX6ExZe5mQbRcR0SVfc40/CGmmZVzdqZLLAHA==
X-Talos-MUID: 9a23:FkzOFwrOU4Qd1hNSSgwezz9rLeNW7fS8MWwUnKRB4MmpGTROOB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="517052240"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:49 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id D842418000232;
	Mon,  5 Oct 2026 09:23:48 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 76189CC1292; Mon,  5 Oct 2026 02:23:48 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 7/8] libxml2: Fix CVE-2026-86143
Date: Mon,  5 Oct 2026 02:23:45 -0700
Message-Id: <20261005092346.1670265-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247232

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707586f68ebf35
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86143

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- limit backport changes to 80 characters
---
 .../libxml/libxml2/CVE-2026-86143.patch       | 96 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
new file mode 100644
index 0000000000..98335f88fb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86143.patch
@@ -0,0 +1,96 @@
+From 83259eee08067b547d2aaedd436504939b2c343b Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Mon, 4 May 2026 09:54:34 +0200
+Subject: [PATCH] xmlIO: Check for int overflow before calling writecallback
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1111
+
+CVE: CVE-2026-86143
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/90f293ba74d28b1d570920382e707586f68ebf35]
+
+Backport Changes:
+- Change nbchars to size_t in both Scarthgap write functions before assigning
+  the size_t result of xmlBufUse(). Add the INT_MAX guard to both
+  xmlOutputBufferWrite() callback paths. The upstream commit assumes earlier
+  refactoring that changed nbchars to size_t and routed
+  xmlOutputBufferWriteEscape() through the protected write path; the existing
+  flush guards are retained.
+
+(cherry picked from commit 90f293ba74d28b1d570920382e707586f68ebf35)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ xmlIO.c | 26 ++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/xmlIO.c b/xmlIO.c
+index 95d27157..de227d8c 100644
+--- a/xmlIO.c
++++ b/xmlIO.c
+@@ -3318,7 +3318,7 @@
+  */
+ int
+ xmlOutputBufferWrite(xmlOutputBufferPtr out, int len, const char *buf) {
+-    int nbchars = 0; /* number of chars to output to I/O */
++    size_t nbchars = 0; /* number of chars to output to I/O */
+     int ret;         /* return from function call */
+     int written = 0; /* number of char written to I/O so far */
+     int chunk;       /* number of byte current processed from buf */
+@@ -3378,6 +3378,10 @@
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3487,7 +3491,7 @@
+ int
+ xmlOutputBufferWriteEscape(xmlOutputBufferPtr out, const xmlChar *str,
+                            xmlCharEncodingOutputFunc escaping) {
+-    int nbchars = 0; /* number of chars to output to I/O */
++    size_t nbchars = 0; /* number of chars to output to I/O */
+     int ret;         /* return from function call */
+     int written = 0; /* number of char written to I/O so far */
+     int oldwritten=0;/* loop guard */
+@@ -3572,6 +3576,10 @@
+             if ((nbchars < MINLEN) && (len <= 0))
+                 goto done;
+ 
++            if (nbchars >= INT_MAX) {
++                out->error = XML_ERR_INTERNAL_ERROR;
++                return(-1);
++            }
+ 	    /*
+ 	     * second write the stuff to the I/O channel
+ 	     */
+@@ -3667,15 +3675,25 @@
+      */
+     if ((out->conv != NULL) && (out->encoder != NULL) &&
+ 	(out->writecallback != NULL)) {
++        size_t bufsize = xmlBufUse(out->conv);
++        if (bufsize >= INT_MAX) {
++            out->error = XML_ERR_INTERNAL_ERROR;
++            return(-1);
++        }
+ 	ret = out->writecallback(out->context,
+                                  (const char *)xmlBufContent(out->conv),
+-                                 xmlBufUse(out->conv));
++                                 bufsize);
+ 	if (ret >= 0)
+ 	    xmlBufShrink(out->conv, ret);
+     } else if (out->writecallback != NULL) {
++        size_t bufsize = xmlBufUse(out->buffer);
++        if (bufsize >= INT_MAX) {
++            out->error = XML_ERR_INTERNAL_ERROR;
++            return(-1);
++        }
+ 	ret = out->writecallback(out->context,
+                                  (const char *)xmlBufContent(out->buffer),
+-                                 xmlBufUse(out->buffer));
++                                 bufsize);
+ 	if (ret >= 0)
+ 	    xmlBufShrink(out->buffer, ret);
+     }
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index ec4b41bde5..1363beba7a 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -37,6 +37,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86140.patch \
            file://CVE-2026-86141.patch \
            file://CVE-2026-86142.patch \
+           file://CVE-2026-86143.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


