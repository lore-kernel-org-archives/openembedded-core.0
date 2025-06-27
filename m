Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA16C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 16:26:27 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.262.1751041579976365863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 09:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=gZ7ntJEO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4+BD6vS8PaZdfoprnpE83AQpgDTQinHp5KQgxbmfUeQ=; b=gZ7ntJEO4lxFWsFI4VOwxxVlmh
	RuOD8EpBCpxyX8ecuusOv+OWMGcDLCGtUhNYh4k1bfTxLJJDgf3/RmqUbEyuuRz2hNCZmWci7R56z
	QxcsjwOJo2QsS38GfPIc6CNefD+eoS6i6FoXJAxt1wvATnLyQ2th6re7Gjeff5L4ZJImbjsQDyaT7
	JDx8LIee8vzFSLUtxqkYl1zEMm3x9aYnymV0Clo4oFuDY6XjVmJCzD12jRAOlg/+Pr3DwSsaM34mo
	U1DIQNF5v1PX9LcMhFROHmNq9UhiClRekk1QEKdoKB+WQQxFO7i7TFn7VO7ZwuG5YH2UYB9o+nZPa
	YqVRp4ZQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:35972 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uVBu5-000000092Qe-33wo
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jun 2025 12:26:18 -0400
Date: Fri, 27 Jun 2025 12:26:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] local.conf.sample: drop MIPS, PPC entries; add 64-bit
 RISC-V
Message-ID: <2f67f7e4-f163-b9a8-3879-ed6ad25f3b4c@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 16:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219430


1) Drop MIPS and PPC lines since we should refer to only those arches
   tested by the autobuilder.
2) Add entry for 64-bit RISC-V.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index 3a9706c1d5..6032dbba67 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -21,11 +21,9 @@
 #
 #MACHINE ?= "qemuarm"
 #MACHINE ?= "qemuarm64"
-#MACHINE ?= "qemumips"
-#MACHINE ?= "qemumips64"
-#MACHINE ?= "qemuppc"
 #MACHINE ?= "qemux86"
 #MACHINE ?= "qemux86-64"
+#MACHINE ?= "qemuriscv64"
 #
 # This sets the default machine to be qemux86-64 if no other machine is selected:
 MACHINE ??= "qemux86-64"

