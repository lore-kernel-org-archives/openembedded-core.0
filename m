Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8929C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:34:19 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.13618.1711215249671649696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=y5OFifa6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=r+0ujhStHNNZYLOd6Enkkm9IJoCe3a9A/cliQ+1JNfI=; b=y5OFifa6IokrmOXjsqki+AyDW7
	UhimBW8+64uqBvThm8WS2Y77n+ake/uMxIYYd7tTm9PPKQXOXMkDxRW0C66fNzDMFDaQjijCM/p+k
	3BEhqfi+BGwpnHuC+lWYI3xjqGW4jAqxN0S/SC4GIQw5Oaj60gM0qiR7d9hUwuBfma/mBJ2c6VL4u
	ST8m4KUNElR3fJyTPS/Gc8b7WHt5KceuhjCYJ7dhkTBay1hUT98hsR8Uj9uqN90n2Kmto1gzFPcks
	/kJlIS2toUaRAyUnPQtFTTffKp0xi53c/m+uVQlThplvVrW16B5t3CT6TKfu/ux3jrG8eZrpLTg2S
	qDTzPqsQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:58682 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ro5Fv-006c9w-1A;
	Sat, 23 Mar 2024 13:34:08 -0400
Date: Sat, 23 Mar 2024 13:34:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] is there any reason to use .ipk packaging if devs are
 using ubuntu?
In-Reply-To: <CANNYZj_U7AXtWd88nqvzr9ABvw2qZWZ5sL1ypXkCA+2faG1RQg@mail.gmail.com>
Message-ID: <f4bd7649-611-7223-6e38-1a251691e241@crashcourse.ca>
References: <28d65e80-cba-d930-736a-c55c3b9dc8d@crashcourse.ca> <CANNYZj_U7AXtWd88nqvzr9ABvw2qZWZ5sL1ypXkCA+2faG1RQg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197461

On Sat, 23 Mar 2024, Alexander Kanavin wrote:

> Packaging format of the host distribution and packaging format used
> by yocto have no relation even if there is package management on
> real targets. Why is there an assumption that matching them is going
> to help something?
>
> If anything, making them match might prompt misguided attempts to
> install Ubuntu packages in yocto systems and frustration at not
> being able to make it work.

  all of this being accurate, the one advantage i can see is that, if
developers are familiar with deb package management on their ubuntu
dev systems, then they would be familiar with having package
management on their target systems (provided, as you say, they
understand that they should work only with YP-generated packages).

rday

