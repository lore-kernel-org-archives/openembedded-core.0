Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.14158.1630311114531165650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 01:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:37202 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mKcOW-0006ms-Tj
	for openembedded-core@lists.openembedded.org; Mon, 30 Aug 2021 04:11:53 -0400
Date: Mon, 30 Aug 2021 04:11:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] why "PREFERRED_PROVIDER_udev" and not "PREFERRED_PROVIDER_virtual/udev"?
In-Reply-To: <16A0063E8A02B067.22970@lists.openembedded.org>
Message-ID: <8a9e42cd-7cb9-cca5-3a16-d33893de5fa@crashcourse.ca>
References: <16A0063E8A02B067.22970@lists.openembedded.org>
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

On Mon, 30 Aug 2021, Robert P. J. Day wrote:

>   i was going to extend section 3.3.17, "Using Virtual Providers",
> with an intro example using "udev" until i realized that that
> example doesn't use the "virtual/" notation. so ... why not? is
> there some distinction between other components that use the
> "virtual/" prefix, but a reason that one does not specify:
>
>   PROVIDES = "virtual/udev"
>
> rather than just:
>
>   PROVIDES = "udev"
>
> and then use the corresponding PREFERRED_PROVIDER_virtual/udev
> notation?

  just to make sure folks understand what i'm getting at, the section:

https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-virtual-providers

opens with, "Prior to a build, if you know that several different
recipes provide the same functionality, you can use a virtual provider
(i.e. virtual/*) as a placeholder for the actual provider."

  except there are cases where several different recipes provide the
same functionality that *don't* incorporate the "virtual/" notation,
so which ones merit that and which ones don't? (i mentioned "udev"
being provided by both "eudev" and "systemd", for which i wrote an
utterly brilliant explanation that i now realize isn't appropriate for
that section.)

  in the simpler cases, you have recipes that have a new name that
can now be used in place of the old, such that "stress-ng" provides
"stress", so you don't have to mess with all your old images and
packagegroups. and in situations like that, the "virtual/" notation
would seem out of place.

  OTOH, well, virtual "kernel" and "bootloader" makes perfect sense as
they represent a more abstract idea. so ... thoughts? even though
"udev" does not use the "virtual/" notation, would it still fall under
the category of "virtual provider"? if not, how would one describe it?

rday
