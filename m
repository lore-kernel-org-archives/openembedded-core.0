Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1FC1F7C87C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 19:24:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45X2Rt4tsxz4X;
	Sun, 23 Jun 2019 21:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561317883;
	bh=z1plx+200hMjhO1apaGJVgw5GYS7nUwhqwTQAr0pjIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEOweBKriAtB4uYrBgBNmNVJewGqhUFnJRqsIOo+jAJZ1VMyADTvqDjLWk7rRcWCv
	An8Tq3g5QKOfwI52BpQi0xsR/fCuyrMVLRhdXyVc4+UI9u7uokMS93FTfvnuWeklwk
	CQht6+Kj+BBT2ok6pcgxbiEtTPkTLde1gc5W3EZt7dGmeDIwSSOrOPDGriIVE978mO
	81eaqzVJXR1/hNyNYS0bAc9Kmb0XCbiT5M1NCRWbOjRmJ2+fy07boI5iOS+bwyPzeP
	PEHwkM01BJaYEBK+hgErSuDLk9mCF6Pp4EcvUYJpCyf2KtybEhmv9Lgl6CDFy4gqUs
	HIscpN8rKmXgvd6gEr1L+tZqz+A0bRnE5cQ85QPzV+tLtO865fTYNqrOVkDawpiCii
	QLQqtQJM+AA+jen1FfcbXtwnNnyO8+TSAXwJtKl7+eTLqBL+NaCa+b3Q0CHgKEFZS/
	wgwSVyX32geAEspVyKOUHDpMDx517wKQBwEbfsx0Z7JD1Y5sdyzq6idiVvfXQy7Vjb
	9jCD7onBEHKSc29kDUthhZUGV/9iWlPlU4n1W/eSVuPhQ8ZtGpjI8X/plOB0l005a9
	9oD2tcHnaQqa2JaXMZhcDArrxUpTe9Jm2Mjz6cQC+iiGqxmX0ZYs0TU79TsJ76EAWi
	3p9VFnEkEx+F2fWNx/W2dh0A=
Date: Sun, 23 Jun 2019 22:24:39 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20190623192439.GA11669@localhost>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
	<20190622085840.GB9472@localhost>
	<CAMKF1sq7AwbG_pM3sivhvQjaJ_mwR6R-GDEv5J23rpEYjsMT2Q@mail.gmail.com>
	<CANx9H-C63ech2pPxYwirWJRE4-p9uQTA0zcBAzepYK0L4mth0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-C63ech2pPxYwirWJRE4-p9uQTA0zcBAzepYK0L4mth0Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Jun 2019 19:24:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jun 23, 2019 at 09:44:07AM -0700, Tim Orling wrote:
> On Sat, Jun 22, 2019 at 5:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> 
> >
> >
> > On Sat, Jun 22, 2019 at 1:58 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> >> On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:
> >> > On Thu, Jun 20, 2019 at 6:18 PM Tim Orling <ticotimo@gmail.com> wrote:
> >> >...
> >> > > Latest mongo release appears to be 4.3.0 and appears to support
> >> python3:
> >> > >
> >> > >
> >> > >
> >> https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct
> >> > >
> >> > > Is this an aceptable upgrade? I am not savvy on which versions are
> >> > > desirable.
> >> >
> >> > Yes for master this upgrade is fine
> >>
> >> Are you approving the changed licence for OE,
> >> or were you not aware that this was the question?
> >>
> >
> > What has changed between 4.0.6 and 4.3.0 w.r.t. licensing ?
> >
> 
> The Server Side License is already in 4.0.6
> https://github.com/mongodb/mongo/blob/caa42a1f75a56c7643d0b68d3880444375ec42e3/LICENSE-Community.txt
>...

Ah sorry, I missed that.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


