Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web12.31651.1610356508929970871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 01:15:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4DDp280l5pz5tlP;
	Mon, 11 Jan 2021 10:14:56 +0100 (CET)
Date: Mon, 11 Jan 2021 10:14:54 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] rxvt-unicode: use RPROVIDES instead of just PROVIDES
Message-ID: <20210111091454.jkikeoltgeo52uhb@qschulz>
References: <20201227234844.2572356-1-dmitry.baryshkov@linaro.org>
 <CAA8EJpqLeNYFs1qwEkj_L9D3e_zVVZ3M48LjpELyd0PNdmqotQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqLeNYFs1qwEkj_L9D3e_zVVZ3M48LjpELyd0PNdmqotQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

On Mon, Jan 11, 2021 at 02:24:51AM +0300, Dmitry Baryshkov wrote:
> Hello,
> 
> On Mon, 28 Dec 2020 at 02:48, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Change rxvt-unicode from using PROVIDES to RPROVIDES for
> > x-terminal-emulator, since the package provides x-terminal-emulator
> > functionality at runtime rather than at build time.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I'd like to ping for this patch. Is there something wrong with it?

Richard answered the same day you sent your patch, see:
https://lists.openembedded.org/g/openembedded-core/message/146248

Cheers,
Quentin
