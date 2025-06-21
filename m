Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14915C71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 11:06:13 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.5274.1750503963670679477
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 04:06:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hu+ZTBo/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oE1K3ROGLYniIq27TNGXtnV1lwfuVfvNx1Ng6x6iTd0=; b=hu+ZTBo/aRGz6g9vbM8y6D49bG
	TVi4zy6c4nfLuLuESZlBv1pksotx5Q1UnFDmeRalX9hZYdmmBJ+untV3+UclDrYH9HEJOKgZxAWXh
	ZC/I2+XiPWBq5Qe6T/pc7xj/pX+Sa18LL2QZ1cJBNAHyrM6aRtGaTreI3syeayOy/u0YfWLZhuGPU
	Vaq4cXawIecvK0MBLX0pSm3igu0OyTlz4uY0KAhtGl6ulvU3LFCkMkWnYmpp021aBkLVB8vnywOOV
	R/x2ajFMEwyNpjDqYr3qfaYqErItP3GnrvKRVF9myKzU8Stj/d+nlFss/n+8Mb7ZGUMjWeaE9aYKP
	UHPpoTOQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:50366 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSw2p-000000038GR-3NGP
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jun 2025 07:06:02 -0400
Date: Sat, 21 Jun 2025 07:05:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there a style guide for setting COMPATIBLE_MACHINE?
Message-ID: <6fa83a65-3ed0-3f4f-0227-cd360828fc38@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 11:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219154


  i ask since there's quite the variety of styles in oe-core,
involving parentheses and anchors and so on -- here's just some of
them:

COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemuriscv64|qemuriscv32|qemux86|qemux86-64"
COMPATIBLE_MACHINE = "^qemu.*$"
COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemuriscv32|qemuriscv64"
COMPATIBLE_MACHINE ?= "^$"
COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
COMPATIBLE_MACHINE  = "^(beaglebone-yocto)$"

what's the "proper" style so i can make sure it's documented
correctly.

