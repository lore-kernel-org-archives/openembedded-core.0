Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.275.1616683848781494853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 07:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56548 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lPRJv-008kjL-6J; Thu, 25 Mar 2021 10:50:47 -0400
Date: Thu, 25 Mar 2021 10:50:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Mike Looijmans <mike.looijmans@topic.nl>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] any *compelling* reasons to whitelist env vars for an OE build?
In-Reply-To: <dc3e6ce6-21fe-729f-63e9-c1b94819a524@topic.nl>
Message-ID: <652b28-29c5-4d79-5c77-ac98ed9bd0@crashcourse.ca>
References: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca> <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.437c1374-0ed0-4179-b9f8-331319118723@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1ce5b84f-c798-4314-b673-c5072a296141@emailsignatures365.codetwo.com> <dc3e6ce6-21fe-729f-63e9-c1b94819a524@topic.nl>
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

On Thu, 25 Mar 2021, Mike Looijmans wrote:

> I for one use a whitelist env vars daily, both hobby and work.
>
> We tend to build for multiple machines, so in general we'd have
> something like this running on the build server:
>
> for machine in mach1 mach2 mach3 mach4 ... mach40
> do
>    MACHINE=$machine bitbake image1 image2 image3
> done
>
> Being able to pass the MACHINE through the environment is a big win. We could
> alter a config file in the shell script, but that would change a file that
> we'd want under version control, and I really don't like it when builds change
> files under version control.
>
> (The "40" machines is not exaggerated, I'm really involved in projects that
> build for that many targets)
>
> Come to think of it, MACHINE is the one and only environment we ever pass to
> bitbake.
>
> For release/test/production/debug/... etcetera I tend to use a different
> image, so you'd see:
>
> MACHINE=mach1 bitbake interesting-image interesting-image-dev

  you and mark are right, i was being a bit too draconian -- being
able to select MACHINE and DISTRO on the bitbake invocation line are
obvious benefits.

  just to refresh my memory, what is it that identifies the env vars
that are by default passed through without any need for extra
whitelisting? is that BB_ENV_EXTRAWHITE? i recall that contains
MACHINE and DISTRO already, so that might be all i care about.

rday
