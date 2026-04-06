Return-Path: <pahaditechie@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FE8F46C53
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:32:59 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57731.1775489569682987404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: ashissh7@cisco.com)
X-CSE-ConnectionGUID: jND/Qo8IQZ6KQtBYGlAWRg==
X-CSE-MsgGUID: K0puAWCvQfulR/o9qnOSEw==
X-IPAS-Result: =?us-ascii?q?A0B9AwBrztNp/47/Ja1agjQQGoJTcV5DSZZLgxWIYpImg?=
 =?us-ascii?q?g4BAQEPRA0EAQE/AgSRbgImNgcOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBLQsBGAEQHSYGAwECTwIJIyGDAgGCOQEDNgMRt?=
 =?us-ascii?q?CmBeRYFAhaBAYMoAYFTsV4KGSgNcYFhAQsUAYE4hHgpHUEBgjeFI1sYAYR6J?=
 =?us-ascii?q?xt9gRCEfYEFgRqIaASDHBSBYR6BaQaMLAgHHxIIARwGCgJIFRIDBAMEBAECC?=
 =?us-ascii?q?xMJAwMCDgIIAwIIBhkBPxIEEwoDCgsHBR8KAgwUCigiEisKAzUSDxsVAQgGA?=
 =?us-ascii?q?gIEBAIEDAIJAgIFBwIRAwQBAQgCAi0DAQMZCAkIAgsFERgMCwcxAxAJAx8XG?=
 =?us-ascii?q?ggBRQgGFgEaBwUGCzgVBQwRAQECRwIUAgQEAhIDAwQDEAMBAikDAwcIAwIHB?=
 =?us-ascii?q?BYKGQQFAgEuAwUHAgQBBwEDAwcDAgwCAhEFBAYCAQMMAwQDBQULLREHEwoGB?=
 =?us-ascii?q?AcFAgICFAYCEBIDAwQEAgECAgI6BA4aDgQIBwMHARgFAgMCBQEDAQcHEgIKC?=
 =?us-ascii?q?AMOAR0CAgQCCQEBCg4CAgYCAgEDCBgDBB8EAwMHAgIMCQMEDQISChIbAw4DD?=
 =?us-ascii?q?Q8CBAMMCjAQBAIHEAIJCAYKGAICAgYCAwMDBAkBAgEBAQEBAQECBwMDAwIDB?=
 =?us-ascii?q?gMXAwUHBgMEBgEEBAMDBgMDBQUBAwMFBQUHAgMGAwYHBwQIAwcLAQEBAQEDA?=
 =?us-ascii?q?gIJAQMIAwwJBAMFAyQPAwsJCAcMATwMBwooBDYBFBQHBCUZZwcHiyEngjaBD?=
 =?us-ascii?q?gEFJQGCJwsIA5MmgyuPEqAdcWiDPowejz6FfBozqmuZBo4JhAmRd1CEaDaBO?=
 =?us-ascii?q?AE1gVkzGiOBAYI2CUkZD444iHzBLSYyAgEIMgEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:V03qha3CmMwt1cEY9fbD5Y9wkn2cJEfYwER7XKvMYLTBsI5bpzEBz
 GYbWWmOMq2CZmX9edtxbYu0oUkF6JLVzdc1TQdu3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ev9bNANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 rsen+WFYAX7g2IsbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauG4ycbjG
 o4vZJnglo/o109F5uGNy94XQWVWKlLmBjViv1INM0SUbreukQRpukozHKJ0hU66EFxllfgpo
 DlGncTYpQvEosQglcxFOyS0HR2SMoVE3pOAGH/vkPWhkW7/b1Hd7PFHM3s5aNhwFuZfWQmi9
 NQCIzwLKxTGjOWszffjF69nh98oK4/gO4Z3VnNIlG6CS615B8qeHuOTuYUwMDQY3qiiGd7Xf
 MoYciFvMzzLYgZEPREcD5dWcOKA2SOhI2cG9wvLzUYxy0uL1BFY75PzCdTIfubNQpRMmGGji
 32TqgwVBTlfbrRz0wGt6nusj+POgS7wWIMfPLK9//9uxlaUwwQ7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:uTOTkKtPLXlrcwk9r3SF9ZYx7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: 9a23:NMFPkm87Lqf8mwX5vkKVv0wyNoccdS389UWOAHakI1dGTJSqc1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AxAR7+Q4HoYlyXD8exkPI/ML9xoxLu7yzIX8mj6w?=
 =?us-ascii?q?Ips2+cishIjG6txmoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,163,1770595200"; 
   d="scan'208";a="726826716"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Apr 2026 15:32:48 +0000
Received: from sjc-ads-21720.cisco.com (sjc-ads-21720.cisco.com [10.128.165.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id A49D818000204;
	Mon,  6 Apr 2026 15:32:48 +0000 (GMT)
Received: by sjc-ads-21720.cisco.com (Postfix, from userid 1869324)
	id 51C3BCC1288; Mon,  6 Apr 2026 08:32:48 -0700 (PDT)
From: Ashish Sharma <pahaditechie@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ashissh7@cisco.com,
	Ashish Sharma <pahaditechie@gmail.com>
Subject: [OE-core][scarthgap][PATCH] libsoup: Fix CVE-2026-5119
Date: Mon,  6 Apr 2026 08:32:47 -0700
Message-Id: <20260406153247.660851-1-pahaditechie@gmail.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21720.cisco.com [10.128.165.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.165.208, sjc-ads-21720.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 15:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234684

The msg_starting_cb() function in libsoup/soup-cookie-jar.c added
cookies to all outgoing messages unconditionally, including HTTP
CONNECT requests used for proxy tunnel establishment. Since CONNECT
messages are sent in cleartext to the proxy, this exposed session
cookies (including Secure-flagged cookies) to the proxy, enabling
potential session hijacking.

Fix by adding an early return in msg_starting_cb() when the request
method is SOUP_METHOD_CONNECT, preventing cookies from being sent
to an HTTP proxy during HTTPS tunnel setup.

Backport of commit 781b08c1b9093626dda077450c46d07d7220984e from
libsoup 3.x.

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/781b08c1b9093626dda077450c46d07d7220984e]
CVE: CVE-2026-5119
Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-5119.patch   | 37 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
new file mode 100644
index 0000000000..311380bfff
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
@@ -0,0 +1,37 @@
+From 781b08c1b9093626dda077450c46d07d7220984e Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <carlosgc@gnome.org>
+Date: Thu, 27 Feb 2026 11:05:00 +0000
+Subject: [PATCH] cookies: do not send cookies to a HTTP proxy for a HTTPS request
+
+When tunneling HTTPS through an HTTP proxy, libsoup's cookie jar
+attaches cookies to the initial HTTP CONNECT request sent to the proxy.
+This leaks session cookies (including Secure-flagged cookies) in
+cleartext to the proxy, enabling session hijacking.
+
+The fix skips cookie injection for CONNECT-method messages, which are
+only used for proxy tunnel establishment to HTTPS destinations.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/781b08c1b9093626dda077450c46d07d7220984e]
+CVE: CVE-2026-5119
+Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
+---
+ libsoup/soup-cookie-jar.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
+--- a/libsoup/soup-cookie-jar.c
++++ b/libsoup/soup-cookie-jar.c
+@@ -824,6 +824,10 @@
+ 	SoupCookieJar *jar = SOUP_COOKIE_JAR (feature);
+ 	GSList *cookies;
+ 
++	/* Do not send cookies to a HTTP proxy for a HTTPS request */
++	if (msg->method == SOUP_METHOD_CONNECT)
++		return;
++
+ 	cookies = soup_cookie_jar_get_cookie_list_with_same_site_info (jar, soup_message_get_uri (msg),
+ 	                                                               soup_message_get_first_party (msg),
+							               soup_message_get_site_for_cookies (msg),
+								       TRUE,
+-- 
+2.25.1
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..364e8ec391 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2026-5119.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.35.6


