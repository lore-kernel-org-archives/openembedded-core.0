Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.1042.1588084766727003378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 07:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:56746 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jTROO-001unC-CE; Tue, 28 Apr 2020 10:39:24 -0400
Date: Tue, 28 Apr 2020 10:39:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] any value in still supporting PACKAGE_GROUP_*?
In-Reply-To: <c018a2db3552d7757712897ab012139759cd19ae.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2004281038200.925592@localhost.localdomain>
References: <alpine.LFD.2.21.2004280942150.915506@localhost.localdomain> <c018a2db3552d7757712897ab012139759cd19ae.camel@linuxfoundation.org>
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

On Tue, 28 Apr 2020, Richard Purdie wrote:

> On Tue, 2020-04-28 at 09:44 -0400, Robert P. J. Day wrote:
> >   just noticed that that variable was deprecated waaaaaay back in
> > 2014
> > in favour of FEATURE_PACKAGES, and i see no reference to it in any of
> > the numerous layers i have currently checked out.
> >
> >   if someone here wants to take it out of OE-core, i can do the
> > equivalent in the YP reference manual.
>
> That can definitely be removed, I've sent a patch which I'll queue
> for testing.

  ok, will queue up a patch to remove it from the reference manual
(other than its mention in the migration section, of course).

rday
