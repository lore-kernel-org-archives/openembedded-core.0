Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.6492.1622198591263118667
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 03:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:36902 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lmZxM-007X8l-VA; Fri, 28 May 2021 06:43:08 -0400
Date: Fri, 28 May 2021 06:43:04 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
    Alexander Kanavin <alex.kanavin@gmail.com>, 
    Ross Burton <ross@burtonini.com>, 
    OE-core <openembedded-core@lists.openembedded.org>, 
    YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [OE-core] [PATCH] package_rpm: pass XZ_THREADS to rpm
In-Reply-To: <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
Message-ID: <b45cfe4-de37-dacc-b613-a67ff38fb7dd@crashcourse.ca>
References: <20210526145910.3930141-1-ross.burton@arm.com> <CANNYZj_3=8Fg2pBPQt5SYVD6QZpN=UfVC1+_Ndupiuf4-Grcpw@mail.gmail.com> <f3e694df4726cc21060cb296a8c6b0848f4e6c96.camel@linuxfoundation.org> <35812cdf-2e32-6ced-dd10-068b5d61b10a@bootlin.com>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="8323328-44957508-1622198588=:58396"

--8323328-44957508-1622198588=:58396
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 28 May 2021, Michael Opdenacker wrote:

> Hello,
>
> Adding this docs@ mailing list too, because I have a documentation
> related question...
>
> On 5/26/21 7:10 PM, Richard Purdie wrote:
> > On Wed, 2021-05-26 at 18:30 +0200, Alexander Kanavin wrote:
> >> What  happens if XZ_THREADS isn't set?
> > It is given a default in bitbake.conf so you'd have to go out 
> > of your way to do it...
>
> This makes me realize that the XZ_ variables defined in bitbake.conf
> don't appear anywhere in the documentation.
>
> Would it make sense to add them to the documentation too, or would
> it be overwhelming to document all possible variables, which default
> values should just work fine?

  i've actually been pondering this for a while -- the best way to
keep the variables glossary up to date, and here's a thought.

  if one notices a single variable missing, and one has time and the
know-how to add that entry to the variables glossary, then submit a
patch (as i've done recently, all of which i apparently have to
improve. :-)

  on the other hand, if one finds a number of closely-related
variables that are all missing -- for which it would make little sense
to add just one or two without adding all the rest -- and one is
lacking either the time or the expertise to submit an all-encompassing
patch to add them all, then submit a bugzilla entry for it:

https://bugzilla.yoctoproject.org/describecomponents.cgi?product=Reference

and perhaps the person or people with the know-how can handle it. at
the very least, we'd have a list of what's missing.

  i might even add a new product category entry just for this:
"variables glossary". anyway, i think this would be useful just to
keep track of what's not there, and allow people to cherry-pick what
they'd like to work on.

rday


--8323328-44957508-1622198588=:58396--
