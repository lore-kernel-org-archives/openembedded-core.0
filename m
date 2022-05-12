Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA90C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:46:12 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.1877.1652345161657802251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 May 2022 01:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38814 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1np4SP-0002vw-Q4
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2022 04:46:00 -0400
Date: Thu, 12 May 2022 04:45:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sanity.bbclass: grammar/typo fixes re: Python install
Message-ID: <49c3457d-897a-cca5-ec91-c442be9ea18@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 08:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165538


Clean up various spelling/grammar oopsies in a small section of
sanity.bbclass.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b416918013..491a3bac6f 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -631,11 +631,14 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
 def check_sanity_version_change(status, d):
     # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING changes
     # In other words, these tests run once in a given build directory and then
-    # never again until the sanity version or host distrubution id/version changes.
+    # never again until the sanity version or host distribution id/version changes.
+
+    # Verify that the python install is complete. Examples that are often removed in
+    # minimal installations:
+    #
+    #   glib-2.0-native requires xml.parsers.expat
+    #   icu requires distutils.sysconfig

-    # Check the python install is complete. Examples that are often removed in
-    # minimal installations: glib-2.0-natives requries # xml.parsers.expat and icu
-    # requires distutils.sysconfig.
     try:
         import xml.parsers.expat
         import distutils.sysconfig

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

