Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.7234.1622807173874828277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 04:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-52-70-26-112-209.dsl.bell.ca ([70.26.112.209]:49688 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lp8HE-00FiTG-I0; Fri, 04 Jun 2021 07:46:12 -0400
Date: Fri, 4 Jun 2021 07:46:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: Andrea Adami <andrea.adami@gmail.com>, 
    OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] want to clarify proper approach to shared lib (.so) installation
In-Reply-To: <CAJ86T=WtkkUjFHQiY1a-+4-7-JxTZcdTM+6aHJ+FYc5o1hzHzg@mail.gmail.com>
Message-ID: <e33778b2-43e-bcd5-eeb2-1f319b38c4b1@crashcourse.ca>
References: <b389383-5997-4638-97f-e6919364bda7@crashcourse.ca> <CAAQYJAveuBzyGwA4uh967Y=x0=TgFsdQzy4fnA8U64Xp2yBCLA@mail.gmail.com> <af372b1c-d83-8484-d4b0-c8d43c2375f6@crashcourse.ca> <CAJ86T=WtkkUjFHQiY1a-+4-7-JxTZcdTM+6aHJ+FYc5o1hzHzg@mail.gmail.com>
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
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jun 2021, Andre McCurdy wrote:

... big ship ...

> Just a warning, but if your Makefiles are not generating versioned
> shared libraries then they are probably not setting a soname
> either... and that really messes up OE's automatic runtime
> dependency tracking for shared libraries.
>
> If OE is your main build environment for these components it's
> usually better in the long run to just update your Makefiles to
> create versioned shared libraries (using simple version .0 and a
> single symlink is fine) and setting a soname than to use the above
> trick to force packaging of an unversioned .so and manually defining
> runtime dependencies everywhere.

  oh, i realize that ... the current build system is very
legacy-driven and i have a lengthy list of cleanups to do, this just
one of them. for now, things just have to work until i can bend things
into shape.

rday
