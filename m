Return-Path: <matt@codeconstruct.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D62C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 08:36:17 +0000 (UTC)
Received: from codeconstruct.com.au (codeconstruct.com.au [203.29.241.158])
 by mx.groups.io with SMTP id smtpd.web12.6257.1632904575544760898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: codeconstruct.com.au,
 ip: 203.29.241.158, mailfrom: matt@codeconstruct.com.au)
Received: from [192.168.12.102] (unknown [159.196.94.94])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 536E52012C;
	Wed, 29 Sep 2021 16:36:10 +0800 (AWST)
Message-ID: 
 <7efc4f9ee2b26ddcae0832ff84a1105c6c62aa16.camel@codeconstruct.com.au>
Subject: Re: [OE-core] [PATCH] openssh: openssh-dev shouldn't depend on
 openssh
From: Matt Johnston <matt@codeconstruct.com.au>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Sep 2021 16:36:09 +0800
In-Reply-To: 
 <74dc59a8af928f90c54f3d175c1de1aa1012183e.camel@linuxfoundation.org>
References: <20210929031804.178714-1-matt@codeconstruct.com.au>
	 <74dc59a8af928f90c54f3d175c1de1aa1012183e.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 08:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156452

On Wed, 2021-09-29 at 09:24 +0100, Richard Purdie wrote:
> > +RDEPENDS:${PN}-dev = ""
> 
> At that point what is the point of the -dev package? I think you could make
> this argument about a lot of the -dev packages and I'm not sure I'd want to
> see every recipe doing this.
> 
> What are you using the -dev package for and do you need it at all?

The -dev package isn't needed for anything, but it gets pulled in when
"populate_sdk" is built. That does a glob over all -dev packages for
any built package.

Cheers,
Matt

> 
> [As an aside, I do think the -dev package dependencies need rethinking but
> that is a lot more work which nobody seems very interested in]
> 
> Cheers,
> 
> Richard
> 



