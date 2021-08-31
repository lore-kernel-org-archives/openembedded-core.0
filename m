Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.2748.1630398456828494016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 01:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56244 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKz7H-0002Q1-UD; Tue, 31 Aug 2021 04:27:35 -0400
Date: Tue, 31 Aug 2021 04:27:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why "PREFERRED_PROVIDER_udev" and not "PREFERRED_PROVIDER_virtual/udev"?
In-Reply-To: <CAMKF1sqwHvndd5ivxEgk_gV4ou6cwZ1bHhs4T6Czs6omQHYA+A@mail.gmail.com>
Message-ID: <76f5fe9-f9a2-bed4-6cd5-8d5749c95dce@crashcourse.ca>
References: <a9a5b3df-5a2c-c7c-ba3e-9e4ed712cf67@crashcourse.ca> <CAMKF1sqwHvndd5ivxEgk_gV4ou6cwZ1bHhs4T6Czs6omQHYA+A@mail.gmail.com>
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

On Mon, 30 Aug 2021, Khem Raj wrote:

> On Mon, Aug 30, 2021 at 12:52 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   i was going to extend section 3.3.17, "Using Virtual Providers",
> > with an intro example using "udev" until i realized that that example
> > doesn't use the "virtual/" notation. so ... why not? is there some
> > distinction between other components that use the "virtual/" prefix,
> > but a reason that one does not specify:
> >
> >   PROVIDES = "virtual/udev"
> >
> > rather than just:
> >
> >   PROVIDES = "udev"
> >
> > and then use the corresponding PREFERRED_PROVIDER_virtual/udev
> > notation?
>
> we also have VIRTUAL-RUNTIME_dev_manager which spans across systemd to mdev
> so I guess we could but perhaps we already have this functionality

  a followup, perhaps silly question -- is there anything special
about the "virtual/" prefix in the sense of being a provider? i mean,
other than being more aesthetically obvious?

rday
