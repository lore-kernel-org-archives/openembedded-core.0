Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A022C7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:31:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.13810.1751031099809331019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=JMUlxszW;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Zi/0GPa7rrGZTiKwDHB13SF0wmtY1q45SSWczmwzewY=; b=JMUlxszWm5pj+WUnKcbNfXMKhw
	ZWbJBQcjw6v8MHrwORI1pjQ9eLFteIipSyxnio81bzlR3tn3KDRafh/UxpWTSgq+19Y3WPzS774S3
	m+vedlAGhPCPTff6SDdSN69Df5ib77WmgRuv/bQjgZUCX2qpR4XyrF7ohn4/rNx4Vv/nhJBqQHlTi
	CHZMNILEGvnle2K0vngq9DrwipS6rDBxyx2FsG9w6umVBRJAr+jP5cmVEjwDoK4uAtWFQG5HzI7B8
	kZIgivF9sooiWmnehcKwZ2jELSWsqLJ/pZ+9AnncMZpvLCW2Sex4kgoSdlAsXvnUcl9+mRA0k2cKz
	p5+n6f6Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:47894 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uV9B3-00000008ax4-1Hb5
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jun 2025 09:31:38 -0400
Date: Fri, 27 Jun 2025 09:31:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should local.conf.sample include qemuriscv* machine conf files?
Message-ID: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219411


  i forget if i've asked this before, but should OE's
local.conf.sample be extended to include all of the machines defined
by the OE-core layer? particularly the two qemuriscv*.conf entries?

rday

