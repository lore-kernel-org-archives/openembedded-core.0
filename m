Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAA576E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 16:28:12 +0000 (UTC)
Received: by wmww144 with SMTP id w144so34017866wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0r/4Pt1r0+pqTp+O8arjahgr9F0TbIMepdgZo63Knmo=;
	b=U8lmG4IIWuO5DYbXACoawZYPoIK7rkaxrXJaFuyO+3VuUmCXY3oZxmm45cm43avyrJ
	GAysVWum5RaiMJuK2GG0yijDk2jeFGedxL7jOViJYu8KMV6bg4IQgMZwNjLGARzvEGgu
	W/gw5/Ls7lCZpSCLYDND389UvwYYWsP84uZ5qarYIHnnRWmR64zRr3yMoCGGUFpoBKhN
	v4KJp0CjVHh2m42KDXX+29yS4DzRvbm8kG76F7zpdzOwhVcXATeEQVPdWLaTH5f9yO9m
	pY9SSvdrJzmzNRTnZZQLgkek/d+H5srWMV75iKAtrz65hMFJj0zds5HibzgRScKPDePv
	YFaw==
X-Received: by 10.28.184.13 with SMTP id i13mr8182038wmf.31.1446827293041;
	Fri, 06 Nov 2015 08:28:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm885986wjx.12.2015.11.06.08.28.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 08:28:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 17:28:30 +0100
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20151106162830.GC2550@jama>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
	<20151106103004.GA7454@mcrowe.com> <20151106131831.GA2550@jama>
	<CABcZANnxTw-eAUWHtkfg3nP69aBrS2WfGJ4Zbz5g3Q=PWprz6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANnxTw-eAUWHtkfg3nP69aBrS2WfGJ4Zbz5g3Q=PWprz6w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Mike Crowe <mac@mcrowe.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 06 Nov 2015 16:28:13 -0000
X-Groupsio-MsgNum: 73020
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Content-Disposition: inline

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2015 at 07:59:32AM -0700, Christopher Larson wrote:
> On Fri, Nov 6, 2015 at 6:18 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > On Fri, Nov 06, 2015 at 10:30:04AM +0000, Mike Crowe wrote:
> > > On Friday 06 November 2015 at 01:16:46 -0800, Andre McCurdy wrote:
> > > > On Thu, Nov 5, 2015 at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > > > Give recipes and classes the ability to opt out of EXTRA_OEMAKE
> > > > > containing the legacy value without removing other recipe-specifi=
c or
> > > > > local additions.
> > > >
> > > > Isn't this possible already from within a recipe or class by using
> > > >
> > > >   EXTRA_OEMAKE =3D ...
> > > >
> > > > instead of
> > > >
> > > >   EXTRA_OEMAKE +=3D ...
> > > >
> > > > ie what autotools.bbclass, kernel.bbclass and many recipes do alrea=
dy.
> > > >
> > > > For the specific case of module.bbclass, changing the EXTRA_OEMAKE
> > > > assignment to '=3D' might require some recipes to be tweaked to so =
that
> > > > they "inherit module" before adding their own options to EXTRA_OEMA=
KE,
> > > > but it seems like a cleaner solution?
> > >
> > > It would be, but I was afraid of what I might break. I suspect that t=
here
> > > are many unseen third-party and local recipes that inherit
> > module.bbclass.
> > >
> > > It would be great to get to the point that EXTRA_OEMAKE is empty by
> > default
> > > but I imagine that the experts are already aware of the difficulties =
with
> > > doing this which is why the current value has lasted so long.
> >
> > Is it really good goal to get rid of "-e"?
> >
> > I know that the environment used in bitbake tasks is already well
> > defined and controlled, but I still find a bit more control with -e to
> > be useful in many cases.
> >
> > I know I'll be able to return -e where useful, but what's the main
> > advantage of removing it from default?
>=20
>=20
> The original goal of the default EXTRA_OEMAKE was to let us keep our
> recipes as minimal as possible and have as many "Just Work" out of the box
> as possible. It succeeded in this goal. The problem is the corner cases,
> and more importantly, it encourages people creating recipes for custom
> make-based buildsystems to just try building it and hack at it till it
> works, rather than reading the makefiles, determining which variables to
> pass in, in what form, and customizing EXTRA_OEMAKE to explicitly pass
> what's needed in the appropriate ways.
>=20
> That's my biggest concern with it, other than the aforementioned occasion=
al
> breakage. It's implicit, automatic, rather than explicit, and tacitly
> encourages ignorance of the buildsystem in question.

I'm sorry I was reading it backwards (I should never reply on e-mails
before first morning coffee).

Removing -e from default value is good goal and I like it :)

e.g. in qmake5_base.bbclass it saved me a lot of headaches with generated
Makefiles reading variables from env which were supposed to be set
correctly by qmake.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY81S0ACgkQN1Ujt2V2gBwUnACeJrfJTDRTR/bv/AXKf8X00tYw
FxIAoKaWrpUbpB0lZoMuqRQB4DUp0a0M
=TPES
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
