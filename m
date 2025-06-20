Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69216C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 14:24:15 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.1476.1750429448512447039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 07:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KCgxE9lY;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SRNsx1CxYuV3ZAf8XDn+/7jrmiL0qnZ/2jXWVokQPGs=; b=KCgxE9lYgGuqDK10K9xu70qLK8
	9tWj9KZa72mQCXQc45/CHiZ5WAjm8BChzBOWlY4kDhrdVaI1jgbWkx2Ju4zUQ7MsQ3OWDDkeqcW5z
	3juDxejFCQQj9w3sHI/EhtwoKEkK3cldqYkJKFJs+VVFdVIZa2ZR04Kz2Q8wLg4HfcHZMaovp+4BJ
	HoEAEHLBvy9pbDFKlxmsy/duPzfNw9PYa5d1p4VeBzWyrFJ8G1CcrdsXhD/0vQZfSEEFg8ihfRcUn
	DzhxI6uLU9kDJ6rg5FkhtndzSj0KlU8k6Aojellq36mnIRWO0WVU8c7pUYwFXXCv4W0t1B5p0tXRK
	2wEsryMQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40274 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uScey-0000000Gvru-3Mnw;
	Fri, 20 Jun 2025 10:24:07 -0400
Date: Fri, 20 Jun 2025 10:24:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Yoann Congal <yoann.congal@smile.fr>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Is there an oe-core "janitors" task list for
 newbies?
In-Reply-To: <CAMSfU+6RVpws_n8nw=CNDXJ3bG4R0_Dgojbqct0M1J1ZHC+jrQ@mail.gmail.com>
Message-ID: <b022d82f-0393-d809-6fe1-321bd00dba84@crashcourse.ca>
References: <8805c7ed-5ac7-b4a7-6c09-7194ab3cff75@crashcourse.ca> <CAMSfU+6RVpws_n8nw=CNDXJ3bG4R0_Dgojbqct0M1J1ZHC+jrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-941515773-1750429446=:2447760"
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
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 14:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219126

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-941515773-1750429446=:2447760
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Jun 2025, Yoann Congal wrote:

>
>
> Le ven. 20 juin 2025 à 15:57, Robert P. J. Day via lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org> a écrit :
>
>       I forget if there was a place that kept track of tasks that were
>       appropriate for beginners that would let them get their names into the
>       contributors' Git log by starting simple.
>
>
> Hello,
>
> The bug triage team tries to maintain a "newcomer" bugs list.
>
> You can see the list:
> * on the dashboard: https://dashboard.yoctoproject.org/bugtriage/#newcomer-container
> * with the proper search in bugzilla : https://bugzilla.yoctoproject.org/buglist.cgi?list_id=660269&query_format=advanced&resolution=---&status_whiteboard=NEWCOMER&status_whiteboard_type=allwordssubstr  (ie. the
> "NEWCOMER" whiteboard) 

  ah, thanks ... i'll submit my "bug" as a new entry and let some
newcomer tackle it.

rday
--8323329-941515773-1750429446=:2447760--

