Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F28C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 10:48:51 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9851.1652266124550855097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 03:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38792 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nojtc-0000ll-Az
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2022 06:48:43 -0400
Date: Wed, 11 May 2022 06:48:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] local.conf.sample: add comments for missing machines
Message-ID: <92f812a6-ab9b-71c-96c4-7f4ec307ddf@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 10:48:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165494


Fill out the commented list of supported machines for completeness.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index c05691de58..f0b8952947 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -20,9 +20,13 @@
 #
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemuarm64"
+#MACHINE ?= "qemuarmv5"
 #MACHINE ?= "qemumips"
 #MACHINE ?= "qemumips64"
 #MACHINE ?= "qemuppc"
+#MACHINE ?= "qemuppc64"
+#MACHINE ?= "qemuriscv32"
+#MACHINE ?= "qemuriscv64"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
 #

-- 

