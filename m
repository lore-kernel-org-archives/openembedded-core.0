Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4198679023
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:01:29 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b19-v6so2467686qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1Mu9jCeM/ZyccZwQzH0XyR4aGJYsTn1f+E/CZV7JT6g=;
	b=pRmReJ5eJZi9vQDLFJqcyHl6e4yGnKHwZFaO/f7i9yjdl+I3dv17FJprxnccSHVSea
	XiC31bNcM41bjXCGudn9MnI6l/DpxSgrA8T+c9f8zr7lZqAPRIpbhB6pXoUA+1CVkhbh
	y0Mn6igrIN9oGIvcxKXw2H35sLKtTUOJiHIui6QKF1fOUA64SjBlfTLtze+ChCRzdGlM
	mbsjTN44+KX6zl7+23qaItNLx6oB36I1g43a6r+kZptXT5pMCxf1aDgiNwci8OOLvzRz
	suWuy6WstL/AQqG+fHQnyoEc9n+SaBvDkq+D34PNSF2fMRaqjcaa48AsxR8+C5+1Z/CC
	STIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1Mu9jCeM/ZyccZwQzH0XyR4aGJYsTn1f+E/CZV7JT6g=;
	b=uBP2tYy7X8sliMe60eoOeU0Y8+EMJMIt/vjfsvFsPfuJ02cvI2u2glYKcurVnATRom
	ylkkYnPPD3Ycf3xL/Kzw6UjKZkrvIZuVYSDQYCnVzWeEQF9xH/0KEkb3LooxMq7gVoH6
	CgknF1V+JpyJ53xVu1A8RrJ578mXvNpnOI54qD9fw0lLOiopKkbn2nKDYInp87M2Re1l
	D//uanewS30JrklGhN5evZEXH4hhcgGwrBfUh7bPMIczFgVBbLzVNyYQEMkCoUBj+FqV
	0RvrIlK1qLKhKBed3p8PysIs4ie5ydutwRdxNqfmY4cw/5kwjc0OLXh/7FJ/+l0ujc6h
	onvg==
X-Gm-Message-State: AOUpUlEywHu7hkjRUcWtv8zWq2FMozdb1azsO4DU2CHojSY2+SsRwi1C
	uKcdiCvveNOBkqfhi1ktw9VaKgsZl56anhc53zc=
X-Google-Smtp-Source: AA+uWPw2vzuZQWDo97nUU6Nqipxj1QYzujlPtB6by+wrGbg6nVzo+BwGdBlMMR1oD1vZTAVDYP4wW840gcpAtwKxeS8=
X-Received: by 2002:ae9:c00d:: with SMTP id
	u13-v6mr41344064qkk.290.1534784489856; 
	Mon, 20 Aug 2018 10:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534699224.git.raj.khem@gmail.com>
	<74b92c8785cfa4377a1738f28e3991d6adee321f.1534699224.git.raj.khem@gmail.com>
	<f64a8311-b32f-3074-96dd-ff7364a43b2d@windriver.com>
	<CAMKF1srgDJK9M7=y5LGxB-93FGk-dwyh0W+ALyC5a0_NidkE8Q@mail.gmail.com>
	<d7b2186dfc7f0b24fb45e779aa0086288e05080a.camel@linuxfoundation.org>
In-Reply-To: <d7b2186dfc7f0b24fb45e779aa0086288e05080a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 10:01:03 -0700
Message-ID: <CAMKF1soHKbYWJQBSo_ovgnCQaKzCeh3K5JcE--rjaXBvNn7Hkw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gdb: Upgrade to 8.1.1
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
X-List-Received-Date: Mon, 20 Aug 2018 17:01:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 3:59 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2018-08-19 at 19:41 -0700, Khem Raj wrote:
> > On Sun, Aug 19, 2018 at 7:19 PM ChenQi <Qi.Chen@windriver.com> wrote:
> > >
> > > There's a build failure on autobuilder.
> > >
> > > https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/70
> > > 0/steps/BuildImages/logs/stdio
> > >
> >
> >  I pushed a patch to pull branch which should fix it
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/
> > master&id=a05cc1ee8eb1cb05064164a9ae62db6dc78d022b
>
> I'm afraid not:
>
> https://autobuilder.yocto.io/builders/nightly-musl/builds/1252/steps/Bu
> ildImages/logs/stdio
>
> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/701/st
> eps/BuildImages/logs/stdio
>

yeah C++, how can I ignore that. Refreshed the patch to use CPPFLAGS instead
of CFLAGS, verified locally too. Give it a shot

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=dc5dd1be33265c28e0f029b12888183d554444f3


> Cheers,
>
> Richard

