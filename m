Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6F7C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 03:49:31 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web09.3116.1644551368724841322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 19:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=P0f+Eh6B;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 8ea6b213-8aed-11ec-ac72-f8db88ea9a09;
	Fri, 11 Feb 2022 11:49:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bBOmiApFgF1S/dsSLMhPwJoAsiA1+YTbPznHar0rex8=; b=P0f+Eh6BRtD3Y/Sk6zzXDavDqR
	8wii2Seh1/+XMCZ3MuoFI1aFe23S9IT9J4QyreJiiElm5c6IQ/04O6bk7YeDAVPGKNR6WbRP9O4aP
	px0RC35opY20ceuwRqPYKWsX5YbfjHonYTAZd2TCY349zNJed1C5yFvn83/iTlnl7OH9lwj4hRv0I
	FqORncIOfLnF4JNd/t7fzhDIvm+DehtgGssY/b6g+4xmKHwVDQ86LpHZbiydCLeEcdbdctorlZ1WV
	/fQ80zlb78Ybe5ogMGvdQGyEQAoUwj5m6KOF1wIZ0AP7Hf1QfHyWewuSPv9dVJq0KyjX/9YWDAK/8
	ivilCuiA==;
Received: from [151.210.145.42] (port=33660 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1nIMvy-00ANyX-Tz; Fri, 11 Feb 2022 16:49:22 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Mikko.Rapeli@bmw.de, openembedded-core@lists.openembedded.org
Cc: sanakazisk19@gmail.com, openembedded-core@lists.openembedded.org,
 ranjitsinh.rathod@kpit.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Date: Fri, 11 Feb 2022 16:49:21 +1300
Message-ID: <1811908.CQOukoFCf9@linc>
In-Reply-To: 
 <6b2b59da15e0889c58c2a79515870994aa29a5c8.camel@linuxfoundation.org>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
 <YgPPaRecZGTG2MF9@korppu>
 <6b2b59da15e0889c58c2a79515870994aa29a5c8.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 03:49:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161633

On Thursday, 10 February 2022 04:34:16 NZDT Richard Purdie wrote:
> On Wed, 2022-02-09 at 14:27 +0000, Mikko.Rapeli@bmw.de wrote:
> > On Wed, Feb 09, 2022 at 01:40:22PM +0000, Richard Purdie wrote:
> > > On Wed, 2022-02-09 at 13:27 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Feb 09, 2022 at 12:23:39PM +0000, Richard Purdie wrote:
> > > > > People have requested changes like this before and I rejected it as
> > > > > I'm worried that allowing people to customise this code will just
> > > > > fork the project into many different directions.
> > > > 
> > > > It's the other way round. There are a lot of needs to extract metadata
> > > > from
> > > > build system into something where reports can be generated.
> > > 
> > > I don't doubt that however buildhistory was written for a specific
> > > purpose and if we start adding the ability to customise it heavily we
> > > lose the ability for comparisions to be made, or sstate reuse and so
> > > on.
> > > 
> > > I'm partly channelling the original author's views on this since they
> > > had some very specific thoughts on this change. I do sometimes wonder
> > > if I should continue doing that though :/.
> > 
> > Then how should yocto users export CVE_NAME, LICENSE, PN, PV, SRC_URI etc
> > from the build system to generate SW bill of materials (BOM) for their
> > product and track progress?
> > 
> > Yes, SPDX can be the other answer but I don't find that human readable or
> > working out of the box atm.
> 
> buildhistory was not intended for SBOM generation, that is what create-spdx
> is being developed for. They have two quite different intentions and trying
> to turn one into the other is why I have concerns about this patch.
> 
> For example, of we did go this way, next, we may need to either write a
> converter of buildhistory to SPDX format, or change buildhistory to use SPDX
> format so that it has a standard SBOM output form. This is not the
> direction we want/need to go.

FWIW I'll just chime in here as the original author[1] and say I agree with 
Richard. If folks are needing an alternative SBOM generation mechanism to 
SPDX, or have other use cases for extracting build information, then I'd 
prefer we take a step back and design such a thing properly. The original idea 
was (1) to expose changes in the output that might not readily apparent 
otherwise, and (2) expose selected "input" values that would (or could) 
materially influence the output, so you hopefully have a ready explanation for 
why an image / package increased in size or dependencies got added etc. 

I will accept that over time buildhistory has added things here and there that 
further the idea of using it for SBOM, folks no doubt have been using these 
for such purposes, and I'm not 100% opposed to making small additions where 
they make sense. However, even with this proposed extension, buildhistory is 
still not capable of recording sufficient information that (I believe) is 
expected in a modern SBOM - for example, the list of patches applied / CVEs 
resolved as a result - and I don't think it would be wise to extend it to do 
so. We certainly don't want to give folks the idea that buildhistory is good 
enough to resolve their SBOM requirements when we haven't designed it to do 
so, particularly as for many folks there are legal and regulatory concerns 
involved.

Cheers
Paul

[1] based upon the earlier testlab and packagehistory classes that were 
written by others



