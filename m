Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFACDC83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 20:31:50 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.23539.1752265904053954205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 13:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ROSIGYVv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eYvEleydAhg29i7RGFgEtDk19+6XVHLK5abg7wk8mzk=; b=ROSIGYVvNOTT7fWJwwcsnmR4LY
	pLwZsxTz6SE9glfUZKFLNZTsUaeNXL7JBefpUwW/WyNpZdsXL98LKtccN5illRK6IQvwTh/wGPrD5
	JUkzWxw2BH5aTXlcu+vew9vyR1vtdcT8XGK1+9vf6pkIZ/T+S9xha14KkiKnwDx7SqmTHfCaMGhnn
	WHkAZb3hL4lxm+yaK5aE71lw/ZzCYRqeVbyWX8a7H2Ncunq88nPiua4DU9bDEByUFPnhovA63gmqo
	T6JVPSzhtZUtNFlMTbHqirqN0sK71LuNKpqKpNscy4eZvjrHXQtSe9j5LxO+CpeQWhSE2lFwpZ174
	Piy/Vvzg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:36932 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uaKPC-00000001xJN-2dUn
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jul 2025 16:31:41 -0400
Date: Fri, 11 Jul 2025 16:31:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: are all of the download URL variables still valid?
Message-ID: <85e947fa-2013-1f13-e2b7-38d55bf7e3da@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 20:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220168


  was just perusing bitbake.conf, and here:

https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n693

there's a pile of alleged download URLs that may nor may not still be
valid. I picked at random "XLIBS_MIRROR" and that variable is not used
in any of the layers i have checked out. is it worth checking whether
any of those can be deleted due to obsolescence?

rday

