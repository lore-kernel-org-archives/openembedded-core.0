Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CBE8A75129
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 08:53:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j26-v6so6767398wre.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=r0iZtTjEtF8dTswv9ENDFKAkncu39a3CwmFeKnqWBJI=;
	b=Kfodbc7UY3dz43Jw+sehE6tqAfnu5GNPqabv2T5WQGvzc/I20+VvTTLYQ++GJ2v2HY
	fxSzwRTJRVLEY8rQNKzMsVNH6HlllC+pWs9Mg7+EQAznDE9JkK9WNShjH3BcVKwG/mnu
	+eZzaR1xGHSDLs3STjy+MxTNfzG5+F8UuThp6tE+0bmTRBy1P3VnpmroaqQ7lI7UnzH3
	vsOxFlTyoCFCVzahKSaF276S8ygI74RI0ym4YEJ0zbFarR1xHXCQEUoYMgoBmVF+2g+R
	AgL8Q0pMHpFnxbnUReBFe8HgJfVFYazigiIfQffX6EaHGCYlSeKQbeyJWUjCixsvsJN6
	/moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=r0iZtTjEtF8dTswv9ENDFKAkncu39a3CwmFeKnqWBJI=;
	b=suPhnMH2WdwuxN2P6uXInI8dfZ/nB4RF5ecgNjvM0zI5sVYxShiOuzxAyURc7bK2DS
	A5a9OKnJcuf1GB35jrRh2T1wZH9FRlPts6hpjhiIANxDikPCcs966hK4GUo0E6T22tTR
	HSJO98EbkX0XOG4wDYiptL0wD7Jy7Ljvj18SmpKkUFN8+j5T4jtysymRLZYCkzYl9Xmb
	rKfex7KB7TqBTWF9hGe3tdmtv9WlArGcwu9GPPKaDjpHvve+aaUCTYkRi8/lwmsCWDef
	u0Jofg9qzKnLPiaE8lTM9c94kVDqHgN9DhBpBtyiJLk6dWk3ut8bYJ0LGVFV7o1PDZOr
	s7BQ==
X-Gm-Message-State: APzg51AtiCu5hIxXNxqB+SZL54hb03ngTaT6qDs57HV41VBY2nFkV+3/
	L0W6miVpn61kZiKoUgXKI4s=
X-Google-Smtp-Source: ANB0VdbvcHBcwm+OZWfPGV2kGIj1T8l4a5yELzSObet8ijwFSC0JV1XbrlU4aP6YSqjVP4doJ9WRrg==
X-Received: by 2002:adf:9306:: with SMTP id
	6-v6mr26580048wro.211.1536137600540; 
	Wed, 05 Sep 2018 01:53:20 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c19-v6sm1078162wre.86.2018.09.05.01.53.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 01:53:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Sep 2018 10:53:22 +0200
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20180905085322.GA1795@jama>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 08:53:20 -0000
X-Groupsio-MsgNum: 115836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 05, 2018 at 09:14:21AM +0200, Alexander Kanavin wrote:
> I am also disappointed to see that openssl10 does not help much,
> however, I do not believe we should wait another year, and hope the
> problem would take care of itself - this clearly did not happen over
> the past year. Let's just look at failing recipes one by one and
> investigate what needs to be done for them. I've done this for
> everything in oe-core, and so it does not need openssl10 anymore
> (except one issue with openssh on arm64). It might be that much of the
> failing stuff is simply out of date.

Here is the thread from last year with a bit more details:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg10=
0353.html

oe-core is just very small core, fixing it there doesn't prove anything

> Making 1.0 and 1.0 coexist in a sysroot means one of them has to be
> renamed into, say, libssl10.so, and everything that is using it
> patched accordingly. Not really possible. Yes, upstream has botched
> this transition badly. If you have better ideas, let me know please.

But patching the components to use libssl10 might actually work (unlike
just changing DEPENDS to openssl10).

It's not only conflicting in build-time in RSS, but it will conflict on
target as well. You either need to migrate all components included in
image to 1.1 or all stay on 1.0.

The 15 failures I've mentioned before were all in our internal
components (e.g. whole nodejs-* world is botched if you use openssl10 in
nodejs DEPENDS).

In a bit smaller world builds than what Khem is now testing I'm seeing
also around 40 recipes failing (and nobody knows how many are "hidding"
behind them).

I'm not against openssl-1.1 upgrade when it's ready, but saying in
commit message that incompatibilities are easily solved by using
openssl10 in DEPENDS just isn't true as proven a year ago and it still
isn't.

Regards,

> 2018-09-05 6:54 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> > On Tue, Sep 4, 2018 at 9:08 PM Andre McCurdy <armccurdy@gmail.com> wrot=
e:
> >>
> >> On Tue, Sep 4, 2018 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Tue, Sep 4, 2018 at 3:58 PM <richard.purdie@linuxfoundation.org> =
wrote:
> >> >>
> >> >> On Tue, 2018-09-04 at 13:43 -0700, Khem Raj wrote:
> >> >> > I pointed this earlier before merge as well
> >> >> > meta-openembedded has 40 odd recipes failing due to openssl 1.1
> >> >> > upgrade
> >> >>
> >> >> Sorry, I think I missed something somewhere as I thought the
> >> >> indications were the bigger problems like qt5 were working now :/.
> >> >>
> >> >> > http://errors.yoctoproject.org/Errors/Build/67457/?page=3D2&limit=
=3D50
> >> >> >
> >> >> > so obvious fix was to keep them pinned to openssl10 and i created
> >> >> > couple of fixes
> >> >> > to start
> >> >> >
> >> >> > https://patchwork.openembedded.org/patch/154517/
> >> >> > https://patchwork.openembedded.org/patch/154516/
> >> >> >
> >> >> > and the effects are showing up where sysroot task now starts to f=
ail
> >> >> > for dependent
> >> >> > recipes here
> >> >> >
> >> >> > http://errors.yoctoproject.org/Errors/Details/190427/
> >> >> > http://errors.yoctoproject.org/Errors/Details/190433/
> >> >> >
> >> >> > in meta-oe certain recipes can be upgraded and we can get openssl=
 1.1
> >> >> > support
> >> >> > but others like the two examples I cited above do not have openSSL
> >> >> > 1.1 port.
> >> >> > so I think we can not live without openSSL 1.0 and OpenSSL 2.0 be=
ing
> >> >> > able to
> >> >> > co-exist.
> >> >>
> >> >> The latter link is php 7.2 which should have openssl 1.1 support
> >> >> (https://bugs.php.net/bug.php?id=3D72360).
> >> >>
> >> >> For the former, libgdata doesn't have an openssl depends so I guess=
ed
> >> >> at liboauth pulling it in which does have an openssl 1.1 patch at:
> >> >> https://github.com/x42/liboauth/issues/9
> >> >>
> >> >
> >> > Thanks for pointers and they do help. However IMO the problem that
> >> > Martin decribed
> >> > is going to be a real blocker. Unless we can provide a solution to l=
et
> >> > both openssl versions
> >> > coexist, this change is going to be problematic since we maintain
> >> > several old recipes which
> >> > would have to be fixed for openssl 1.1 and this can take time, right
> >> > now we are only seeing
> >> > meta-openembedded layers, we don't even know all other layers which
> >> > might get into similar
> >> > issues.
> >>
> >> To be clear, the issue is ( foo depends on openssl 1.1 and bar ) and (
> >> bar depends on openssl 1.0 ), right?
> >
> > yes.
> >
> >>
> >> Anyway, just for reference, it looks like Debian is packaging both
> >> openssl 1.0 and 1.1:
> >>
> >>   https://packages.debian.org/source/sid/openssl1.0
> >>   https://packages.debian.org/source/sid/openssl
> >>
> >> In the case of liboauth, they avoid to need to patch by configuring
> >> liboauth to build with nss instead of openssl.
> >
> > this is already taken care see
> > http://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dkraj/=
master&id=3Db1f87edc4202d6238c469dde358819c534b35751
> >
> > but thats just one case.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW4+ZgAAKCRA3VSO3ZXaA
HNx5AJ0RmQWhuhQXjic/gkfb7lu/JOnq0ACcC3k3EnPfgj/X5Y7We58vMw7a1vo=
=4ALK
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
