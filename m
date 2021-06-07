Received: from bsmtp1.bon.at (bsmtp1.bon.at [213.33.87.15])
 by mx.groups.io with SMTP id smtpd.web08.33257.1623055762826347230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.15, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp1.bon.at (Postfix) with ESMTPSA id 4Fz6Vk3hPJz5tlK;
	Mon,  7 Jun 2021 10:49:18 +0200 (CEST)
Date: Mon, 7 Jun 2021 10:49:17 +0200
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	"Jonas Mark (BT-FIR/ENG1-Grb)" <Mark.Jonas@de.bosch.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"ovidiu.panait@windriver.com" <ovidiu.panait@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"toertel@gmail.com" <toertel@gmail.com>,
	"RUAN Tingquan (BT-FIR/ENG1-Zhu)" <Tingquan.Ruan@cn.bosch.com>
Subject: Re: [OE-core] Request to backport KERNEL_DTC_FLAGS to Dunfell
Message-ID: <20210607084917.63p2pfevomio7maw@qschulz>
References: <d8dac798fed14554b0bfb5b7ea2daf12@de.bosch.com>
 <CAOSpxdZQBmu8Da90W2h01ZMRD+s9GVP3Lvq-xsSrSjJJRuFeNA@mail.gmail.com>
 <CADkTA4NkMjTjTJbp_6HCapzasyzrWGwQkBWuen7GWgNi4ppZbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NkMjTjTJbp_6HCapzasyzrWGwQkBWuen7GWgNi4ppZbw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

On Fri, Jun 04, 2021 at 11:25:36AM -0400, Bruce Ashfield wrote:
> On Fri, Jun 4, 2021 at 11:09 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Fri, Jun 4, 2021 at 2:45 AM Jonas Mark (BT-FIR/ENG1-Grb)
> > <Mark.Jonas@de.bosch.com> wrote:
> > >
> > > Hi,
> > >
> > > We are using DT overlays and have the need to pass the -@ parameter in DTC_FLAGS to Linux' make. The patch
> > >
> > > "kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags"
> > > https://git.openembedded.org/openembedded-core/commit/?h=hardknott&id=063b5de86624a42b0aa784db6dddc7552a6dee7f
> > >
> > > makes that possible in a nice way. Would it be reasonable to request backporting of this patch to Dunfell?
> >
> > This is sort of in the grey area between feature and bug fix.  It does
> > seem relatively safe, so I would consider taking the patch if there
> > are no objections from the community.
> >
> > Added Bruce to the cc list to get his opinion.
> 
> Good timing, I happened to notice this earlier and was thinking about it.
> 
> While I also wouldn't call it a bug, I agree it is a small/standalone
> change that shouldn't break anything.
> 
> A quick scan of the dunfell tested kernels shows unchanged Makefile
> handling of the option, so there's little risk there.
> 
> I'd say that it would be fine for backport.
> 

Please backport the documentation patch as well if you do backport the
feature, see:
https://git.yoctoproject.org/cgit.cgi/yocto-docs/commit/documentation/ref-manual/variables.rst?id=b2d5bf48fe4e76446a38762839865176294a4a3c

Cheers,
Quentin

