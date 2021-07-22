Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.446.1626989881793135315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id AE027200004;
	Thu, 22 Jul 2021 21:37:59 +0000 (UTC)
Date: Thu, 22 Jul 2021 23:37:59 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.37 branch
Message-ID: <YPnlN0HaML6IFFLy@piout.net>
References: <20210721021108.1082410-1-raj.khem@gmail.com>
 <YPkqwl0OiCwPtuer@piout.net>
 <CAMKF1soNY99BuAgNxgj7U=FukWY14VUa+_axra0zLB1bqe9u3A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soNY99BuAgNxgj7U=FukWY14VUa+_axra0zLB1bqe9u3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 22/07/2021 07:56:11-0700, Khem Raj wrote:
> On Thu, Jul 22, 2021 at 1:22 AM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> 
> > Hi Khem,
> >
> > On 20/07/2021 19:11:08-0700, Khem Raj wrote:
> > > This izOs next/latest release branch for binutils
> > > Drop backports and CVE fixes which already are applied upstream
> > >
> > > bfd_stdint.h has been removed in favor of using stdint.h
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > V2: Fixes SDK builds for mingw and glew build with GLES
> > >
> >
> > This didn't apply properly, I fixed it up, can you check
> >
> > https://git.openembedded.org/openembedded-core-contrib/commit/?h=abelloni/master-next&id=efb06e3e03c750944bfa40314dae70c054bdaed4
> >
> 
> What portion did not apply ? It looks alright to me but want to know so I
> can correct my branch since I have few other patches lined up before it I
> wonder if that’s the issue or something else

Almost none of it applied, it is most likely caused by whitespace
changes as this was the main difference between v1 and v2. What I did is
take v1 and changed the SRCREV to be the one of v2.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
