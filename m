Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.58313.1584983200510991623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:50174 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jGQX9-00789w-6D; Mon, 23 Mar 2020 13:06:39 -0400
Date: Mon, 23 Mar 2020 13:06:37 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Adrian Bunk <bunk@stusta.de>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] wanting to clarify variables related to using host tools
In-Reply-To: <20200323170422.GA10964@localhost>
Message-ID: <alpine.LFD.2.21.2003231306070.43469@localhost.localdomain>
References: <alpine.LFD.2.21.2003231207540.20339@localhost.localdomain> <20200323170422.GA10964@localhost>
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

On Mon, 23 Mar 2020, Adrian Bunk wrote:

> On Mon, Mar 23, 2020 at 12:26:04PM -0400, rpjday@crashcourse.ca wrote:
> >...
> >   in that case, i notice this line from bitbake.conf regarding
> > ASSUME_PROVIDED:
> >
> >   # gzip-native should be listed above?
> >
> > which seems like a reasonable question since both gzip and gunzip are
> > listed in HOSTTOOLS, so why would gzip-native *not* be in
> > ASSUME_PROVIDED?
> >...
>
> meta/conf/distro/include/default-providers.inc:
> PREFERRED_PROVIDER_gzip-native ?= "pigz-native"

  ah, thanks, must remember to take that file into account.

rday
