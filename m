Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.8044.1584799056495937284
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 06:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:33444 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jFed4-000vU3-TP; Sat, 21 Mar 2020 09:57:35 -0400
Date: Sat, 21 Mar 2020 09:57:32 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] recipes that don't list where their source is
In-Reply-To: <a9d007004565cf8340d048803b30379158c012c8.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2003210955170.12190@localhost.localdomain>
References: <alpine.LFD.2.21.2003210818320.7869@localhost.localdomain> <a9d007004565cf8340d048803b30379158c012c8.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Mar 2020, Richard Purdie wrote:

> On Sat, 2020-03-21 at 08:26 -0400, rpjday@crashcourse.ca wrote:
> >   not sure what the policy is but, occasionally, i run across a
> > recipe
> > that doesn't identify the location of the source code (just in case i
> > want to peruse it). case in point:  kexec-tools on master branch:
> >
> > http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb
>
> Surely the recipe doesn't work if you can't access the source code?
> The source code is clearly in the tarball.

  i realize that ... in the recipe i mentioned, that information is
already in the SRC_URI.

> > combining HOMEPAGE and SRC_URI, you get little more than the
> > directory to download versioned tarballs, but nothing about the
> > location of the source code itself, if it's available.
> >
> >   is there a protocol for identifying the (accessible) location of
> > the source code, or is that simply up to the maintainer to provide it
> > if he or she wants?
>
> Do you actually mean the upstream source control system supporting
> the source code?
>
> There is no requirement to have that. I agree its useful at times
> and its up to the maintainer. Some source code doesn't have it
> publicly available.

  i understand that as well, just wanted to clarify as to whether it's
considered a best practice to do that, and whether it's a personal
call on part of the maintainer.

rday
