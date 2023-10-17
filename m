Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26824CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 16:41:00 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.224376.1697560854768802468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 09:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Hm9f8Oit;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ooHymMMa/ZyYTK6Vp0BP6LuCSYZ6+btTT39tyvXjQy4=; b=Hm9f8OitbZjrdJ240Y5FwJrROj
	iR3lX9aSW39DnoVXSuZudIb16giPTtsUX765Ndk71Lp6QYG3myApz2ZgV2gLuCxdJLMXqGmVCXqXm
	8jIry/LaiUwn/2mO8hUHSUl7BjjupXzy3jTjo+1n8KRuHNBrOPnB3gzYhYIFT8pEGiyKyqjI215z6
	HlV/kvWnDSsH4vrE2lvoHaFRf+BXKnN2AeerUwECn6mi9ADLRDqaTWoCzrzxzYyexNEwXSk/kOlnw
	+qvSAwKva6kCTdOWszvaARDwSdI3vdt+WGBWlR0DlqU7zF3yZ6rq4OPvx+uBeaxIzX3gQ4+JLtqoW
	P3YiBDow==;
Received: from [::1] (port=41640 helo=cpanel10.indieserve.net)
	by cpanel10.indieserve.net with esmtpa (Exim 4.96.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1qsn7h-0024uh-1J
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Oct 2023 12:40:52 -0400
MIME-Version: 1.0
Date: Tue, 17 Oct 2023 12:40:48 -0400
From: rpjday@crashcourse.ca
To: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: doesn't seem like "PROFILE_TOOLS_X" has any value
User-Agent: Roundcube Webmail/1.6.0
Message-ID: <d7503254060b26bdd6125eaf1c202cf9@crashcourse.ca>
X-Sender: rpjday@crashcourse.ca
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 16:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189346

if you look here:

https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb#n12

it's not clear what PROFILE_TOOLS_X is doing, given that it's set to the
empty string, then conditionally set to the same thing. i don't see it 
being
referenced elsewhere.

rday

