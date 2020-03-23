Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.56622.1584979622973274614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 09:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:49782 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jGPbR-006zfv-Bt; Mon, 23 Mar 2020 12:07:01 -0400
Date: Mon, 23 Mar 2020 12:06:59 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] what is the current purpose of PRIORITY variable?
In-Reply-To: <89ed530a5dc904f8ea677e2633f3732b59b3bbc8.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2003231206180.20339@localhost.localdomain>
References: <alpine.LFD.2.21.2003230924440.14394@localhost.localdomain> <89ed530a5dc904f8ea677e2633f3732b59b3bbc8.camel@linuxfoundation.org>
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

On Mon, 23 Mar 2020, Richard Purdie wrote:

> On Mon, 2020-03-23 at 09:28 -0400, rpjday@crashcourse.ca wrote:
> >   continuing my travels, ran across "PRIORITY" variable that i was
> > not
> > aware of, was introduced in bitbake.conf way back in 2005 in
> > oelint.bbclass, but there are only a few lonely references to it
> > these days:
> >
> > meta/conf/documentation.conf:PRIORITY[doc] = "Indicates the
> > importance
> > of a package.  The default value is 'optional'.  Other standard
> > values
> > are 'required', 'standard' and 'extra'."
> >
> > meta/conf/bitbake.conf:PRIORITY = "optional"
> >
> > meta/classes/package_ipk.bbclass:        fields.append(["Priority:
> > %s\n", ['PRIORITY']])
> >
> > meta/classes/package_ipk.bbclass:IPKEXTRAVARS = "PRIORITY MAINTAINER
> > PACKAGE_ARCH HOMEPAGE"
> >
> > meta/classes/package_deb.bbclass:        fields.append(["Priority:
> > %s\n", ['PRIORITY']])
> >
> > meta/classes/package_deb.bbclass:do_package_write_deb[vardeps] +=
> > "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH PN
> > HOMEPAGE"
> >
> >   is this doing anything useful these days?
>
> Not really, no.

  any objection to my submitting a patch to remove it?

rday
