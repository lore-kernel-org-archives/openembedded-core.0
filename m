Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46936C54ED0
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 18:45:36 +0000 (UTC)
Received: from smarthost01c.ixn.mail.zen.net.uk (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by mx.groups.io with SMTP id smtpd.web10.14273.1748198728494922676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 11:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=mrXn31+B;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.22, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1uJGLe-00BBCr-Lk;
	Sun, 25 May 2025 18:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=XutI9FRmfxd8IUqQ5ngKujWfay/+Uioe7p9lUO74Qw8=; b=mrXn3
	1+B1z4MyRJZgeubRih2uZ/z1ne5E8CEtH5Geu3J1mfbbnhoPZhqvO2LXPj0nyf7aPXD0AOj4EnQlk
	P4E9tOQwDc0TLL2iZ76FWGO9I7SCm09m7C10DFP2NWq2eXQx7mpGIGi769BZTRed+HcbqAP8CvAez
	4S4emK8fLuDVpKombsWqWLuIxdvLlVn+kN/a8X9VGFL2lJAQ230uK0muZnhiRLkoxkzItG/l4dAFK
	dBHLng1Xi0wXWmWT4yDvZnW2pbvP3ic5a5uy3/DvOXmznOi8OxEyajXoVPvDCIrPSGL+I0IrTBXma
	Gxo9t1HqLqRgi8iCsCI9c79SZsIuA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1uJGLe-0032kK-0R;
	Sun, 25 May 2025 19:45:26 +0100
Date: Sun, 25 May 2025 19:45:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Jack Mitchell <jack@embed.me.uk>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: Cope with
 FIT_CONF_DEFAULT_DTB being empty
Message-ID: <aDNlRimrPXkm-2MS@mcrowe.com>
References: <20250523122045.3097055-1-mac@mcrowe.com>
 <DA5CTNMVP3RK.LB01EWGV6S6C@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA5CTNMVP3RK.LB01EWGV6S6C@bootlin.com>
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 18:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217250

On Sunday 25 May 2025 at 17:41:51 +0200, Mathieu Dubois-Briand wrote:
> On Fri May 23, 2025 at 2:20 PM CEST, Mike Crowe via lists.openembedded.org wrote:
> > From: Mike Crowe <mac@mcrowe.com>
> >
> > Quote both sides of the comparison of ${FIT_CONF_DEFAULT_DTB} and $DTB
> > consistently to avoid parse errors if either side is empty.
> >
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > Reviewed-by: Jack Mitchell <jack@embed.me.uk>
> > ---
> 
> Hi Mike,
> 
> Thanks for your patch.
> 
> Just a note: this patch is conflicting with the "FIT image improvements"
> series:
> https://lists.openembedded.org/g/openembedded-core/message/217192
> 
> As this series is most likely going to be merged soon, can you rewrite
> your patch on top of it?

Hi Mathieu,

I spotted that not long after I posted my patch. I replied, but somehow I
only managed to send that reply to Adrian Freihofer, the author of the
conflicting patch. Anyway, here's what I said:

> It looks like Adrian Freihofer's
> "[PATCH v5 14/17] kernel-fitimage: re-write its code in Python"
> in <20250523094152.727177-15-adrian.freihofer@siemens.com> removes this code
> and replaces it with Python which won't suffer from the problem. That's
> much better than my fix above.

So my patch can be ignored.

Thanks and sorry for the hassle.

Mike.

