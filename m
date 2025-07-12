Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6438C83F21
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 09:24:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.32952.1752312258621058165
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 02:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=D1rlm3BB;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QXE96VCPW8XKRueEWXsbjCE0H/Csl64O5wO+fBBoSRs=; b=D1rlm3BBYfVJ4QojcQ/0Z9htht
	CIlaE3XYO76uy6Yh32/fECSl95CVTANl6YN+saRCwS3KkOIKy6oa0hK8Z1sc2o2XGlTWWWYU2lsvN
	bgeriyzQInFSlDdufnoZnul4Enz0JT+S6JksSoO3NvjRvUUdgL+p16ffDe9V2jtJ+eCGjIElmGlos
	P05hH9EHoumcRWJgg5qs8TfbqS3YO+DA3gx3OcNkUtpvpw43smQXwsJbp0etdTcMFr+gfAV+3xFtr
	g+by+vQ0ZOVu1gcXtUM/KPa2q+QFn3zzVkNnHupL+nvF9JMj5DFrA9NdyeQffcgtSw4V9PiOaAXV4
	z8uzcI0Q==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39290 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uaWSl-000000043ez-1QgO;
	Sat, 12 Jul 2025 05:24:16 -0400
Date: Sat, 12 Jul 2025 05:23:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] are all of the download URL variables still valid?
In-Reply-To: <500d60d8e1c98dee239ad1ccc372bcd85b1dda95.camel@linuxfoundation.org>
Message-ID: <fa496dee-edf4-1d73-e84f-d97bd3e4180b@crashcourse.ca>
References: <85e947fa-2013-1f13-e2b7-38d55bf7e3da@crashcourse.ca> <500d60d8e1c98dee239ad1ccc372bcd85b1dda95.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1321179516-1752312250=:1345133"
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
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 09:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220173

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1321179516-1752312250=:1345133
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 11 Jul 2025, Richard Purdie wrote:

> On Fri, 2025-07-11 at 16:31 -0400, Robert P. J. Day via lists.openembedded.org wrote:
> >
> >   was just perusing bitbake.conf, and here:
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n693
> >
> > there's a pile of alleged download URLs that may nor may not still be
> > valid. I picked at random "XLIBS_MIRROR" and that variable is not used
> > in any of the layers i have checked out. is it worth checking whether
> > any of those can be deleted due to obsolescence?
>
> I'd love a patch!

  Well, if anyone on this list can definitively identify any of those
entries that are clearly obsolete, point them out.

rday
--8323329-1321179516-1752312250=:1345133--

