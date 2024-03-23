Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB66CC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:04:39 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.13194.1711213472980812530
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=vbm6zWt0;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o92Fkq8Mibu8vDw6stIq2dvEAiBCRw0fYsbKl9MCVh4=; b=vbm6zWt045YkLkAHINn97L3r4P
	Wo6efvw0D+iU8Fsr4s8fN/kRhjn557slRWHTIbGhjKZ/USxFEFEbX4T4u881E8JA5dZnCPTXVmbgR
	nWYyJJjrdgvI0YUaoOaP+eZrijG0L5N+mZsyM639AtwMT3D89itgZe20s70a1UB7cpAfXNAvOCzD1
	b9CfN+OTaFDdrf/HEs8EHXTm71PcG4mjI6s8klYe+DjttPKR2x7ScFGemGwO/H0gmDz9/3DJWat1l
	Nuq2118GbmLcBIFTDFNuYZTgqxpl8ZfSphvNS9wp71WyEoT29RiA55N6abt693eg9rvUerBdE4KKq
	3uiZ5LhA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:58680 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ro4nG-006ZJp-0N
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2024 13:04:30 -0400
Date: Sat, 23 Mar 2024 13:04:18 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there any reason to use .ipk packaging if devs are using
 ubuntu?
Message-ID: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197458


  yet another sophomoric question but i have inherited (and am
babysitting) a fairly extensive OE/YP build system that, for the most
part, works but i noticed early on that it selects ipk for the package
format.

  now, given that there is no package management installed in the
images, i guess it really makes no difference what the package format
is, but it just seems unnatural to use ipk given that the
corp-approved linux development system is ubuntu.

  is there any compelling argument for this? i suspect i could change
the packaging format and the developers would not even notice.

rday

