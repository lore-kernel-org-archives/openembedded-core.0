Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.479.1586794163324658150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 09:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5956740C1E;
	Mon, 13 Apr 2020 16:09:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5jLPF7AOImG; Mon, 13 Apr 2020 16:09:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDBF340A93;
	Mon, 13 Apr 2020 16:09:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4D5D01724AB; Mon, 13 Apr 2020 12:09:17 -0400 (EDT)
Date: Mon, 13 Apr 2020 12:09:17 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Stefano Babic <sbabic@denx.de>, Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH v3] u-boot: Restore valid default environment for running system
Message-ID: <20200413160917.GF1578@denix.org>
References: <20200402001431.435999-1-otavio@ossystems.com.br>
 <20200412210715.GE1578@denix.org>
 <CAP9ODKo+r=74d1B3Nu3aX9AfT_tgo9UN8YkzRyUki82fSJZRZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo+r=74d1B3Nu3aX9AfT_tgo9UN8YkzRyUki82fSJZRZQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 08:47:21AM -0300, Otavio Salvador wrote:
> On Sun, Apr 12, 2020 at 6:07 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > +
> > > +        # Generate the uboot-initial-env
> > > +        oe_runmake -C ${S} O=${B} u-boot-initial-env
> >
> > So, why is this enabled unconditionally? Should this be in UBOOT_MAKE_TARGET?
> >
> > I use this .inc file for building different u-boot pieces by different recipes
> > (main u-boot, SPL, etc., etc.) controlling the build with UBOOT_MAKE_TARGET
> > below. Now each of those generate u-boot-initial-env and they clash in deploy.
> 
> They clash? how so? it generates different filenames so should not have a clash.

Different filenames? It's always u-boot-initial-env in deploy and /etc...
I already sent a patch last night to actually do different names...


> > > This change is late in the cycle but it is critical in my opinion.
> > >
> > > The lack of default environment as well as the configuration for the
> > > tool is a regression from the previous release and this mitigates it.
> >
> > Well, I would rather live w/o env rather than unable to build u-boot at all...
> 
> Please provide more information as I did not figure out what is not
> working by your report.
