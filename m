Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 092A77D97D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 08:35:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tBch0DGjz1n;
	Tue, 23 Jul 2019 10:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563870916;
	bh=9Zi2mWxA9ZMrI2v+MH71/2sUDy7jWc+WcWo9R4CITqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKN+MBLvBBnZXf+X1r0Iqh8f7vJdaNSgGQGHr/21yggC3me8JYD2Ov7/mRJpP3ImK
	1ZsCmgglx4tfwzuAwG1UhI8Yf1gJvQqEwdK4ZxeSB/epk8DtoDxC9HsAr88Tq/nHYI
	gSHO29kdO8tOz/VumyqglvBdCN07zXP2WynzZqiIQs8SUMdJrdLZWK55UOl7KG+O7d
	/9C3FFl4gZWnWlQTiW+xrHfFItTKiBix+R4PO4zLc8yUMdBG3B/kC0D3iHV0RrLAtR
	VW4esuXlQND4aQkuIORlJfqaHg8Q5M+J7vp6opRbanReXdOSMm6v0Wu7hBLccVDluN
	gc8q2N+1mz1OazgndhDdpMVd2Je2hZx3hj5/w/ihQ5S7MK92zoEMxP+i4uO9Xkr0Ma
	imWI7Qgeii+o0GlBwEVgueQOBfAevqBVcO8Ethusxh64tmfZfiKh71b5C0ox77tC6f
	UewWQCxzOxRWhfpCROAayt+rDr3I5okj2QhJYQClMQiQUKUtlzDcoizlMSE8MZfocf
	KtdsBX6YNzEr8cGsm4QlYIgbK3XCa5i6BXTxNUXEzJzGluYrNoKIW3eN9sQ9qFflDh
	ay3U5MB9Gms4DH1W6DTor8qLI4UJUrImPkfDp7XtsCr2cyUecH6Vx61cmtwnP/1pye
	KOMuJB8fW9Eb0cNazYPeTWXQ=
Date: Tue, 23 Jul 2019 11:35:12 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190723083512.GC27144@localhost>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
	<20190723054328.GA27144@localhost>
	<CAJTo0LZDXcLhYqvgYmY4-hX4Uc+ZJniDhqWkrjtaYu_k58Fr8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZDXcLhYqvgYmY4-hX4Uc+ZJniDhqWkrjtaYu_k58Fr8w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Tue, 23 Jul 2019 08:35:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 23, 2019 at 08:47:16AM +0100, Burton, Ross wrote:
> On Tue, 23 Jul 2019 at 06:43, Adrian Bunk <bunk@stusta.de> wrote:
> > On Mon, Jul 22, 2019 at 10:51:35AM +0100, Burton, Ross wrote:
> > > Do we need the Python 2 variation of scons in oe-core, or even at all?
> >
> > Regarding the latter, do you see what is needed for making gpsd in
> > meta-oe working with the Python 3 variant?
> >
> > Upstream seems to support it, but it fails to build.
> >
> > I thought I knew what the problem was, but it turned out to be wrong.
> 
> So that's a 'yes', fair enough.  Is gpsd the only piece that needs it?

In meta-openembedded the only other recipe using scons is
PNBLACKLIST[mongodb] = "Since bbclass scons convert to python3, build mongodb failed"

So 2/2 of the scons-using recipes in meta-openembedded so not work with 
the Python 3 version right now, and there might be more in other layers.

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


