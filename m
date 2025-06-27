Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A10C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 15:50:18 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.17143.1751039416589772141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 08:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=H3QWMYxb;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uycB5dIrSdgIAJwslOPAtUfKEZApu687GBIO9xQQ2Ww=; b=H3QWMYxblE5jn+ngPiWJ+Y9fXj
	a92yp52U2tE0Xama9cHXBrFwDEkSl0BnxszbTGJbRV8UyEY6hBLctY1+M5a1K1yUreBzD7Dgde6cd
	KVIjNY9q5vm5xIVdlyq1h2Y5bCNUWqY9Hw/+1t9r6iV4BrJTDybn5Skp0wzkmt+yMWZdN11sVBOVb
	/CxLSTIhswIGtI+zMb1gr1ayyQIupf+Wads+eTKRx13gmOKjTynCeFF8P5HXU7go8zMjGlqK+scza
	eG8TCbThE+BcbJuqYsdIiNjsuz0hVzJQu/BH6+/678Ws3pXuQqndV8fow8UgRdQ/+8T7zZxqWthvq
	Z4x4pFzQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:46358 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uVBL8-00000008wRb-2tYE
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jun 2025 11:50:13 -0400
Date: Fri, 27 Jun 2025 11:50:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] local.conf.sample: drop MIPS/PPC, add RISC-V entries
Message-ID: <35468b8f-96e3-ce30-2365-9d72342407f1@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 15:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219426


1) Drop MIPS and PPC lines since we should refer to only those arches
   tested by the autobuilder.
2) Add entries for both 32-bit and 64-bit RISC-V machines.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index 3a9706c1d5..749bab9883 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -21,11 +21,10 @@
 #
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemuarm64"
-#MACHINE ?= "qemumips"
-#MACHINE ?= "qemumips64"
-#MACHINE ?= "qemuppc"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
+#MACHINE ?= "qemuriscv32"
+#MACHINE ?= "qemuriscv64"
 #
 # This sets the default machine to be qemux86-64 if no other machine is selected:
 MACHINE ??= "qemux86-64"

