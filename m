Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B710FC446
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:34:57 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117718.1775684091401396468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=hr00tiai;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=am3XGo4dNr1enmacP4LHcNd9kKpP2f1T06/SlJOdjlY=; b=hr00tiaiizpk5zZ2Fd6hGcoX3s
	gAEX+WYI7y5puUKzQzf3efssZMslojQhlw70PMc8Qx8BO1LSzKqmHyCEoy0cSuwNyL12rKKg2kTOa
	HBe8U6rrmrLe9xxL0s50+MeFkzl1KwWRce2Ncp9GD0kXA1C/u2p4gGJmp2drPLe+rhXDnTRuvzZnX
	FvjedVEtnFUrDFgtItP001BbxSnbHF8GnpyTgntipjdoj2wKzrGJoawFnQD2ARq0Si0x0ZXF4AX9Z
	fjCfBP3yR6ZxJUc5TpH4AMChlzJnu1kwuaa3M5wQzartM4BLOAm4g7vnHAd2o+lY5s+MbRCwIPHka
	ei8CyFiQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:37668 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wAaXw-00000003LnM-0tMu
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Apr 2026 17:34:49 -0400
Date: Wed, 8 Apr 2026 17:36:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: does KERNEL_MODULE_AUTOLOAD work?
Message-ID: <f97ef6fb-ed8e-e8bc-3912-32999b0b08c4@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234861


  currently have a walnascar build and i've verified that
KERNEL_MODULE_AUTOLOAD contains:

  KERNEL_MODULE_AUTOLOAD="      8733bu     rpmsg_tty "

when i do the build, but those modules are definitely not loaded after
boot. i can definitely manually load with:

  # modprobe 8733bu

but is there any reason it's not already loaded? i've tried this
several times and it seems like KERNEL_MODULE_AUTOLOAD has no effect.

rday

