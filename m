Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.271.1616446649391985218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 13:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:53260 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lORc7-00CVdR-PS; Mon, 22 Mar 2021 16:57:28 -0400
Date: Mon, 22 Mar 2021 16:57:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] curious about weirdness in some FILES_${PN} settings
In-Reply-To: <CAJ86T=VmDYxS5PjHazGUZD_NXeqsJ+uo=nmveGJjJrocyPVvng@mail.gmail.com>
Message-ID: <b6804d44-b0ed-20e2-9433-26e627ec8995@crashcourse.ca>
References: <5a2c7beb-bc46-5528-c84-122ea0799c29@crashcourse.ca> <CAJ86T=VmDYxS5PjHazGUZD_NXeqsJ+uo=nmveGJjJrocyPVvng@mail.gmail.com>
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

... snipping some stuff ...

On Mon, 22 Mar 2021, Andre McCurdy wrote:

> On Mon, Mar 22, 2021 at 11:43 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   in one recipe, i see the following snippet:
> >
> >   FILES_${PN} += "/etc"
> >   FILES_${PN} += "/etc/mosquitto"
> >   FILES_${PN} += "/etc/mosquitto/config"
> >   ... etc etc ...

... snip ...

> Yes, and even beyond that, ${sysconfdir} is handled by the default
> packaging rules, so any extra packaging rules related to adding
> files from /etc to the default package are redundant.

  actually, i neglected to mention that, just before all that FILES
assignment, the recipe totally redefined the PACKAGES variable, so
even the standard packaging rules had been thrown out the window and
replaced in their entirety.

  that will be another of my "please don't do stuff like that" list i
am working on.

rday
