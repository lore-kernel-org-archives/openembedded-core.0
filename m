Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.766.1613428057966042501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 14:27:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:43720 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lBmLA-0002Bz-B6; Mon, 15 Feb 2021 17:27:37 -0500
Date: Mon, 15 Feb 2021 17:27:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: akuster808 <akuster808@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] upgrading pseudo on zeus branch to handle gcc 10?
In-Reply-To: <bda3e653-f49f-6464-c47e-48b58c89d07d@gmail.com>
Message-ID: <19969497-5e8a-cf53-1533-159e40f87d51@crashcourse.ca>
References: <ca75402e-b19-4796-ff75-4769e628ea2e@crashcourse.ca> <bda3e653-f49f-6464-c47e-48b58c89d07d@gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Feb 2021, akuster808 wrote:

>
>
> On 2/15/21 12:11 PM, Robert P. J. Day wrote:
> >   yes, i know fedora 33 is not a supported build distro, but in trying
> > an absolutely stock build of core-image-minimal from poky (zeus
> > branch) on my F33 system, i ran into a gcc 10-related build error for
> > which this:
> >
> > https://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?h=oe-core&id=a44361b8d3fbf5fc40cd87b599caeb380454efbe
> >
> > would appear to be just the solution. so is there a proper protocol
> > for handling this? should the zeus branch move up to the incorporate
> > that commit? or what?

> wouldn't bbappend of that patch work?

  are you suggesting i just do that locally for my own benefit, or
that that is something that can be submitted as a patch so that others
get the benefit as well? i know i can add that as a local patch, but
if the roadmap includes supporting zeus under gcc 10, then that patch
would need to be applied universally.

rday
