Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D55C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:11:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.37470.1710079889311658778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 07:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Tlz+3FR4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kOj6n27pyLAZBpqB4RWsIdN22TmFDKWmjSBcMmX/VEA=; b=Tlz+3FR4GxsNLxlGo1nMmc8M6k
	eTHcm/ZGSvRuVyUZL3rOp8uy4/4ujyrTttsYE6M+z+vwGaEnHbHhTru7itoKxyvf64v1NzBgybdND
	arp0v5fzzTWD/mpMOK29O1zvftpWwKfApUyyJhCQ5TsyI2S1VfGmv2CV5yLKJs4P/AmIb1P4OpGh8
	SAESAKsnrNYQdt2jjGNAZXSm26Np55F3CR1oXQs71/eYuuA1q+CUvWXlK2kJt0DF4B7qARivc1UB2
	9NAO5axj+mHiximKjjXwQdzeBxTmSh4D5UvbBfgp/6/CosBWvoyJm7KVDyfgfJafNxRv8C0rsBju7
	65SmY+aA==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49748 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rjJtf-00CZeC-0Z;
	Sun, 10 Mar 2024 10:11:27 -0400
Date: Sun, 10 Mar 2024 10:11:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ptest: test for PTEST_ENABLED instead of
 DISTRO_FEATURES
In-Reply-To: <CANNYZj_GWJDA6i6c+83RZw4nQbtYocypQ6x96y_v9-1eehPaBg@mail.gmail.com>
Message-ID: <c47f97ce-949d-45b4-7e40-e5175a3ce64@crashcourse.ca>
References: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca> <CANNYZj_GWJDA6i6c+83RZw4nQbtYocypQ6x96y_v9-1eehPaBg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 14:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196885

On Sun, 10 Mar 2024, Alexander Kanavin wrote:

> On Sat, 9 Mar 2024 at 11:29, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > As ptest.bbclass defines the more intuitive ptest-related variable:
> >
> >   PTEST_ENABLED =
> >     "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
> >
> > modify a number of obvious recipe ptest checks to use that simpler
> > form.
>
> I disagree. When someone reads a recipe, and sees a variable, the
> questions that typically come up are:
>
> - where is it set
> - how is it set
> - what needs to be done to change it.
>
> DISTRO_FEATURES wins all three, as it's commonly known and understood facility.

  then what is the point of defining PTEST_ENABLED in the first place?
and using a mixture of both throughout the code base?

rday

