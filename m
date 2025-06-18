Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAACC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:16:16 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.5641.1750248973080991645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=ls0DTACg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A+3o22azfx9Qmxth0L7iGdQ0mrSYlwbwzqXYI3psow4=; b=ls0DTACgezgq9UaDQx7fzMWL6x
	cOc/PxCQo7VJ/gkomXAApBio8YvfjZEFfaoyE1p7ho7x2ULbdfboCtkgCAda2Ej7Eo6d2zVwep5ZB
	QK1DfJks4Oju37SAakR7P7+i+91SVGVz7HSm5hwR34e+G+heuJKin+x96ugCPr6mRa8E/HViJFawE
	2JFUfDZqLWEH1NXL/s8sSuQTZegR3eQKPv4qWuL58YIoyEk2K2w7djKwzOBXjy7ZwM5rUO9tbSyh+
	y1n2HdqbBp4wv1tPpn7zw7g+1gMmFTvcwt24qDM6auGnEGlozvaOq3obM3SgmuWVx4ndKORYw8gr8
	xvTeuszQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:59738 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRri2-00000003aDV-3Trz
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jun 2025 08:16:11 -0400
Date: Wed, 18 Jun 2025 08:16:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should any other "recipes-* directories be added to recipes.txt?
Message-ID: <57db0373-ed36-b710-f360-5575f9e92497@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218998


here:

https://git.openembedded.org/openembedded-core/tree/meta/recipes.txt

it seems like there are a few other directories that might warrant
inclusion in that file ... perhaps:

  recipes-demo
  recipes-security
  recipes-test

just a thought.

rday

