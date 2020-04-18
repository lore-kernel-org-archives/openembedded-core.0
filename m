Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.1393.1587228199242892317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 09:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:38404 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jPqYn-003SPm-OB; Sat, 18 Apr 2020 12:43:18 -0400
Date: Sat, 18 Apr 2020 12:43:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
In-Reply-To: <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain> <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=1.3
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

On Sat, 18 Apr 2020, Richard Purdie wrote:

> On Sat, 2020-04-18 at 12:04 -0400, Robert P. J. Day wrote:
> >   perusing the OE init scripts, and noticed this in
> > oe-buildenv-internal, line 42:
> >
> > if [ -z "$BDIR" ]; then
> >     if [ -z "$1" ]; then
> >         BDIR="build"
> >     else
> >         BDIR="$1"
> >     ... snip ...
> >
> >   i'm curious ... under what circumstances would BDIR *not* be unset
> > (or not be the empty string) at that point? i'm just puzzled as to a
> > possible flow of control that gets to that point where BDIR has a
> > non-empty value, since i've never seen any mention in the docs about
> > such a possibility.
> >
> >   doesn't hurt, of course, just not sure what that test is trying to
> > accomplish.
>
> You can do:
>
> $ source oe-init-build-env build2
>
> and if your shell supports it, build becomes build2?

  i know that -- in fact, it's the only way i use it -- the question
is the purpose for checking if $BDIR is zero length first. that is,
under what circumstances could it *not* be? even invoking the way you
demonstrate, that variable is empty when tested, and i see nothing
that could cause it to have a value before that test.

rday
