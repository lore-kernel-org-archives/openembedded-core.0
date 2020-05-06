Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.3011.1588757652443420884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 02:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=FBFhQNwC;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=fjce=6u=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49HBHh5vVsz52
	for <openembedded-core@lists.openembedded.org>; Wed,  6 May 2020 11:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588757648;
	bh=micd+Zc2P/r6xFvBSIWJ1ydQnIP5QYfTmJSSFxIVdEE=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Subject:References:
	 In-Reply-To:From;
	b=FBFhQNwCcmg5gfJ9LsgzLtGQhcM1fBQz3CS07Vwi1wYNEsxjnZi5nj5lZdonS5bey
	 GL7FJIgb3CyRlwbhnnqVV7G9T+4jtUGt/mec14M2XwYJkQDPVFaAVZfxhb8FuPZvjf
	 aqd0f56LE3EPHFpOtY24GycAeaPSUYKOPTuj3rm2tYCdrlTQcSztDyxLOW9jaChGHj
	 KB6d2FG9bzxPAMGRsKdGUF5bpol47DNxATCu5pmNxMv7S3BQZeUdOpBU4O12V+Nrqt
	 Gczb6MUhUxn/MELYeiqutIEP60yo2cYX6fOB1V1nQj70SWmEU27DG/s/eDBqeOeEsf
	 Xc6LrXJlwflJpUzs7HdumDijD6MFkl1PmH/c7Dqm/jUZ7ZKkYpBBz8vkxVGpmllwOA
	 cm9MsU8rtnuytqNZzwwAg29pNFe24gB9ICcladtkAf9551MD7Sz8Ft+TfuhQUXZY5R
	 KN4LB6WT47v6ReqBtwGKO/S7FNo3VQE8aFOq53CSOESZSb6Z6L0Hj8I5iE/d+Y9KPp
	 U0GN463BNx05p3Z9UVhD1lsX9b33jxE6T46pFPug+Lr7bYsrzvkhm2EDqZbgYki5SM
	 8IQaTMh0kJ6Y+xhAzgZnkgc/eXY4eO6Kf13zh7Q+9XlFqrDmhcpXIQpBMGA3iGhVEq
	 /hqUNCj2tXt9TUBSuFgkroak=
Resent-From: Adrian Bunk <bunk@stusta.de>
Resent-Date: Wed, 6 May 2020 12:34:05 +0300
Resent-Message-ID: <20200506093405.GA28447@localhost>
Resent-To: openembedded-core@lists.openembedded.org
Date: Wed, 6 May 2020 10:22:40 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Add -fcommon to BUILD_CFLAGS to a number of recipes
Message-ID: <20200506072240.GB31672@localhost>
References: <20200503080730.3686063-1-daniel@zonque.org>
 <CAMKF1sqCb8JhGcuyJaTwC2=AsHRGvHsQ7BXJguOVg3VTOENiNA@mail.gmail.com>
 <CAJ86T=XKmHH2geeKudRLuTox2TOz3njdic5hiBSeX8hDRxUbDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XKmHH2geeKudRLuTox2TOz3njdic5hiBSeX8hDRxUbDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 03, 2020 at 12:21:38PM -0700, Andre McCurdy wrote:
> On Sun, May 3, 2020 at 10:39 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I think add it globally to BUILD_CFLAGS perhaps is
> > Right thing to do once we upgrade to gcc10 cross compiler I have a patch to add it to gcc defaults
> 
> Adding -fcommon to CFLAGS or BUILD_CFLAGS globally could interact
> badly with components which are already setting -fno-common via their
> own internal CFLAGS. It's safer to fix selectively on a per-recipe
> basis.
>...

For master per-recipe solutions would be the best option.
And for the target side this is all that is needed.

The problematic part is the host side when building older Yocto releases 
on latest Linux distributions.

Per-recipe changes for dunfell oe-core and gazillion 3rd party 
dunfell layers are not a desirable solution.

cu
Adrian
