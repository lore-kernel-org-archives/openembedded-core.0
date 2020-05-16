Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.11718.1589659808860763387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 13:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=CmyS4zZx;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=yivk=66=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Pbwn3D5Sz29;
	Sat, 16 May 2020 22:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589659805;
	bh=IzdeADdYXaFDc8d3GHcI3dLdDmsIHU3+kIcWTr4rQ3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmyS4zZx0boru31CiMVOe/l0NiRKOCiMYrvnnr/S88qKAFY3AiRHav655iCMC5RwP
	 5N4eOVmDrAinVRBOMMcv4GCZ1UJZo9wE7rj+Rq8lPX5QYgNkvDswta6HT2+xQpt8VK
	 qnTt0tYS1apvrPAVW7qTSFhSLmGBaJbcMtqU2zupn1DGtZXDB/WKBHFTjtNhW7C7mv
	 cFaYDvqiWv8wQIFv2RVsWfJf2Erj1p75QAclfKKcISy29p2kA4wr2E/3EcTQitFXny
	 L8X/oRfyyeMOH0p2YnDPJKiSbl8NTfMeHZSoNgeRn2uAw6XqStnsCCPSsXUJlrbO6u
	 0M3Hb3u3lEyWVI3M4PLljIsQ+XQdk9w/NNGRzS93nA0+XCBtg+2lQakSNZht7vRI0I
	 BF0m3pP8HsFNRXCNGtosUWDw0Y7ta15mTiZqRYdV6WEOQcmCIJmdTbeGD2Jvpy+oHU
	 y81l9238hfnjcaUngjWcPqoepBsiL+w2Efzh0QnJS/TaEul8FSsj1n/OOT9y3MJdla
	 r653jmVxe0qwmBi6/Tevmfi1Fb7xb3HixJxGCtsW0umbkU5OXfVT8Xn01bndRKWloV
	 O/7WPT7FCKlLE7V6c6G1Dhn4PN5UQTQRRiw6X8Xqnh6X0rIHlGnND/WnwTJB1Fz01Q
	 PK8Oj2O0NyIxMKkbVuyI6f+4=
Date: Sat, 16 May 2020 23:09:57 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Steve Sakoman <sakoman@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Joshua Watt <jpewhacker@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <20200516200957.GA8056@localhost>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost>
 <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, May 16, 2020 at 07:54:32PM +0000, Peter Kjellerstedt wrote:
> > 
> > meta-openembedded/meta-python has a higher layer priority than OE-core.
> > 
> > Adding higher upstream versions of these recipes to a lower-priority
> > layer in a stable series is a potential source for weird problems.
> 
> I would assume they'd be removed from meta-python at the same time 
> they are added to meta.

"at the same time" is complicated since OE-core has releases,
but meta-openembedded is just a branch.

I would also assume that not all users of stable series are updating
meta-openembedded to the latest on the dunfell branch at the same
time as OE-core, some users might end up updating one but never
updating the other one.

> //Peter

cu
Adrian
