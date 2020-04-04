Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.6214.1585995292875172903
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 03:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:51252 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jKfpD-002H6p-DE; Sat, 04 Apr 2020 06:14:51 -0400
Date: Sat, 4 Apr 2020 06:14:48 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] trivial(?) question about post-installation scripts
In-Reply-To: <5d2d70a05eeb516678cf3b11abd7b948d197e341.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2004040613160.7363@localhost.localdomain>
References: <alpine.LFD.2.21.2004040549380.6252@localhost.localdomain> <5d2d70a05eeb516678cf3b11abd7b948d197e341.camel@linuxfoundation.org>
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

On Sat, 4 Apr 2020, Richard Purdie wrote:

> On Sat, 2020-04-04 at 05:52 -0400, rpjday@crashcourse.ca wrote:
> >   still working my way through the YP docs and, in dev manual,
> > 3.3.19,
> > "Post-Installation Scripts", one reads the final note:
> >
> > "Equivalent support for pre-install, pre-uninstall, and post-
> > uninstall
> > scripts exist by way of pkg_preinst, pkg_prerm, and pkg_postrm,
> > respectively. These scrips work in exactly the same way as does
> > pkg_postinst with the exception that they run at different times.
> > Also, because of when they run, they are not applicable to being run
> > at image creation time like pkg_postinst."
> >
> >   i'm confused ... why would a pkg_preinst script not be applicable
> > to
> > being run at image creation time? or am i misreading that?
> >
> >   i'll probably have more questions about these scripts as i dig
> > further into them.
>
> I think however wrote it misunderstood. prerm and postrm are unlikely
> to run at image install time (but can if packages are removed). preinst
> will run.

  i assumed as much (that preinst is perfectly capable of running at
image creation time). i may rewrite that section once i actually
understand it in its entirety -- it's definitely a bit confusing at
the moment.

rday
