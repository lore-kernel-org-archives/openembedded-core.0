Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.39.1616445698435032689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 13:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53170 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lORMm-00CSsN-Le; Mon, 22 Mar 2021 16:41:37 -0400
Date: Mon, 22 Mar 2021 16:41:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] the weirdness of bbappend'ing to stock OE images
In-Reply-To: <CAJ86T=WgUfNaN23t4VLsGQcgufqT4Hv-ccxcreELgcmz3KCn5A@mail.gmail.com>
Message-ID: <3ceff24-1ae4-a2ee-c499-2d8a673da7e2@crashcourse.ca>
References: <ef94c962-16fd-8341-70c2-e531af21b6@crashcourse.ca> <CAJ86T=WgUfNaN23t4VLsGQcgufqT4Hv-ccxcreELgcmz3KCn5A@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Mon, 22 Mar 2021, Andre McCurdy wrote:

> On Mon, Mar 22, 2021 at 12:50 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   more a style issue than anything else, but one of the other
> > oddities in this layer i've been handed is the bbappending to
> > standard OE images, so that recipes-core/images/ contains recipe
> > files like:
> >
> >   core-image-minimal.bbappend
> >   core-image-minimal-dev.bbappend
> >
> > and so on. that just creeps me out -- my plan is to forcefully
> > advise people to leave the stock images alone, and create clearly
> > internal, proprietary ones, like:
> >
> >   acme-core-image-minimal.bb
>
> A clearly internal proprietary image would remove the reference to
> oe-core from the image name, so "acme-image-minimal.bb" rather than
> "acme-core-image-minimal.bb".

  ah, quite so, that would be better.

> > that inherit or include, then do the adjusting.
> >
> >   or is that approach considered acceptable? (it just makes me cringe,
> > personally.)
>
> I don't know. Adding to the core images doesn't seem like the worst
> thing someone could do. After all, it's normal to add to or modify
> the package groups which go into the core images (either directly or
> indirectly by changing distro features).
>
> Creating your own dedicated images is cleaner and clearer though.

  my view is that i like to leave the stock images as they are for
testing purposes -- if the proprietary image has problems, you always
have a stock image to use as a baseline for testing. so that's being
added to my list of "please don't do stuff like that."

  more weirdness coming shortly ...

rday
