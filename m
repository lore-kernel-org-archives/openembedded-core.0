Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.22377.1589721772133291877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 06:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=hOEnIgbd;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=5ztw=67=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Q2rR0qLJz1n;
	Sun, 17 May 2020 15:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589721770;
	bh=TVSNjdIrrxSwbLQwjecm+LElQ2hhHc2COx3biFD3L4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOEnIgbdKfAKpwkPH3Af14/KMGa17L/RJvPn9f0jNTII/tC4DeqgkmqMIjwp3BFmC
	 Tc9iMRYmlMLcu215ST1wIW0UJp+HChZKhWpbdY3wIzdmPWLMoWc//Uorp0DqQrZTbu
	 +CTxApfjtlYvwXzGJvkUkrAP/41PsN8zC+4sIHfXtfizPAknILsQOCHV5JCWQPShGw
	 AxBaJD71n4EmkSRag++SkfUhgtNw3iolf3+ZsjfZI4b9YtpAPMcM7KU2Xkxh6MYnvp
	 xWSTyOl3+abvGmZSaMFAuxJDz4ysXbnKbovvyLXGhIvH6l3fi1AW6h9++v15ENqbiW
	 SSZbsDArFfrRDOQlwk0Vn97+Ss6P8hzfqz5wabzeAgXjWTpKr27dA4o1kllmleihPF
	 YVwQ/nwu4SIGXcmj6Y/rVAgrbs+Kh3jZSMXHjGrZGW2XXX4QMczn0rluL45QVvB3zD
	 b+JGbsNj/IrOGYWmUfMNGyND5UUNWfX8QJB8qY/88GQo0rakQLFWQZ1Tv0rmLs7O4U
	 OiZlfmnI3namADzDLisSDCPUfK5DoRYamuXQdDmjC1qy9xG5caYoKpnfqID8FC3vck
	 Tapnrx3I5ztMCTjzpD1Xr87coLr4qKdR0iKE47pTzkRhIRH68rqr0cxpYGVEGhyr2+
	 PYi+3JTrQleJAyXBBD4czsm4=
Date: Sun, 17 May 2020 16:22:45 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Steve Sakoman <sakoman@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Joshua Watt <jpewhacker@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <20200517132245.GA9940@localhost>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost>
 <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 16, 2020 at 10:24:04PM +0200, Andrey Zhizhikin wrote:
> On Sat, May 16, 2020 at 10:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
> > > >
> > > > meta-openembedded/meta-python has a higher layer priority than OE-core.
> > > >
> > > > Adding higher upstream versions of these recipes to a lower-priority
> > > > layer in a stable series is a potential source for weird problems.
> > >
> > > I would assume they'd be removed from meta-python at the same time
> > > they are added to meta.
> >
> > "at the same time" is complicated since OE-core has releases,
> > but meta-openembedded is just a branch.
> >
> > I would also assume that not all users of stable series are updating
> > meta-openembedded to the latest on the dunfell branch at the same
> > time as OE-core, some users might end up updating one but never
> > updating the other one.
> 
> That I believe would be a terrible mistake when people opt-in to take
> a layer, but never care about updating it... :(

The typical Yocto user starts with whatever prehistoric Yocto release 
came with the BSP distribution for the reference hardware, and then 
develops a new product on top of that.

I would not be surprised if someone will have the initial Yocto 2.7
release, but uses the latest from the corresponding  meta-openembedded 
branch on top.

> On the contrary, a quick run of "bitbake-layers show-overlayed"
> exhibits the following on the [master] of both OE-Core and

Thanks a lot for this.

> meta-openembedded:
> =================
> python3-cython:
>   meta-python          0.29.14
>   meta                 0.29.16
> python3-dbusmock:
>   meta-python          0.16.7
>   meta                 0.19
> python3-docutils:
>   meta-python          0.15.2
>   meta                 0.16
> python3-pyparsing:
>   meta-python          2.4.6
>   meta                 2.4.7
> =================

I'll take care of getting these removed from meta-openembedded.

> Judging be versions, it looks like OE-Core recipes are maintained, but
> in meta-openembedded they are left on the side...

python3-docutils is ouch, since this problem is also in dunfell.

On a more positive note 0.16 is already in OE-core in the initial
Yocto 3.1 release, so removing it from meta-openembedded will only
be like a 0.15.2 -> 0.16 upgrade for some users but cannot result
in losing the recipe in weird layer combinations.

> Regards,
> Andrey.

cu
Adrian
