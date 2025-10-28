Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E03CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 21:27:41 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.24181.1761686855041853324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=YNUyGnYN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pP6o0w0lOReS3vgm3+gd5xGgW1tHibk/CKqJ8ful6Ds=; b=YNUyGnYNSMeusM7UPWWQyTYttX
	J6K9nEdOMZU3NVnssBom/UTKBRD4vYqqWxk+5Y6TpZbzOQNx730DP8TI89LZdxBVNAjigUMvjwQiy
	EEHgRKFxdpyA2uJldcBK0ubQ5wYky3eTOetsxEcukXHmtaFqo2suei7giUZyulzRLBHtvaEQmY4iO
	zyz0+zeDU0NK1TINoshfkLvPigBaAhM9oFpvbhN1MSBhaWyDbOaeionr4fDdnnXPGdhqUA2CEJ6q8
	XmBJCCt+3+fCMOU6mouUMVhZOFH+FguJgCInkNdEQ/ok6m9m+eDpatnw0Dz8KT2ktxXdKMnkyYB68
	rnEsOyFQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:54594 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vDrE2-0000000E0RR-2U2h
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Oct 2025 17:27:33 -0400
Date: Tue, 28 Oct 2025 17:30:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: what is the point of setting "do_fetch[number_threads]"
Message-ID: <13053c3e-d249-52a2-5186-3dd43fe8a97d@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 21:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225416


from here:

https://docs.yoctoproject.org/dev-manual/new-recipe.html#limiting-the-number-of-parallel-connections

if parallel connections are already limited, what is the value in
setting this? that should be explained in that section.

rday

