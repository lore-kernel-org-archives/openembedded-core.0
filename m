Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.36900.1585516020069309885
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 14:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:57282 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jIf90-00CyTl-Cq; Sun, 29 Mar 2020 17:06:58 -0400
Date: Sun, 29 Mar 2020 17:06:55 -0400 (EDT)
From: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] can i assume the following uses of _append could use fixing?
In-Reply-To: <6ec68faae728cfcfeba133146a58765076716aa0.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.21.2003291706350.14897@localhost.localdomain>
References: <alpine.LFD.2.21.2003290853010.17224@localhost.localdomain> <6ec68faae728cfcfeba133146a58765076716aa0.camel@linuxfoundation.org>
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

On Sun, 29 Mar 2020, Richard Purdie wrote:

> On Sun, 2020-03-29 at 08:55 -0400, rpjday@crashcourse.ca wrote:
> >   all under recipes-devtools:
> >
> > file/file_5.38.bb:EXTRA_OEMAKE_append_class-target = "-e
> > FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
> > file/file_5.38.bb:EXTRA_OEMAKE_append_class-nativesdk = "-e
> > FILE_COMPILE=${STAGING_BINDIR_NATIVE}/file-native/file"
> > elfutils/elfutils_0.178.bb:EXTRA_OECONF_append_class-target += "
> > --disable-tests-rpath"
> >
> >   all three look like they could use a leading space, and the third
> > example uses the redundant "+=". or am i misreading?
>
> Worth fixing but the last one works due to the += adding a space...

  i know, but it's still weird. :-)

rday
