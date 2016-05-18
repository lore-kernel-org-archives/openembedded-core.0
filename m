Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 728CA73199
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:20:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id n129so11201330wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 02:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9jA41ETkWpFB0QMTXRelv8IB3QvbDotuNUAZczVmx/4=;
	b=g73eAPuWFdHzoe6TTixr8HN1S/6QHOHCWGTo0iiZExNZGmktxgguZknF6ixSDLhp5l
	MMvYTbMH3sOsXWrF3qLEeCjYqA0KlzjG7nTPXSeVF/ooiyuDoBmaLuWP5ATndZi5yF+V
	PeRP6kg5jYruXyjLY24Z74SDaBC5w3jgsAoMgwPW/4uqWDsdoit6bvbjM6fnfkZMuGQy
	4a7FJmqHjE2CIJQoVw7nvtdieob5SleJAZHAY2WWDJ3wKxSGy0IWhePgo9+7ps+T/U6s
	0sc39AAd9LrZhtr3/cGnYjRwLdCyBReqiKgG9wySW41z93bHs2CDGY3FTzIk/B5lvRi2
	WzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9jA41ETkWpFB0QMTXRelv8IB3QvbDotuNUAZczVmx/4=;
	b=mZMHedV5wC+x2H2JnmlqH5ZXbEEehh+zW7imBTVtmCf0o3hVLxgsD2had9f5rRNQGj
	ulAP2sUMdQUZnEppSPnbYreQ8eM03kkr1+yWWlAMjmeD2QbFx2Y2sy3BYZXDaI6C7e3J
	8BOn1BJ21oO4zvTK0NBMIc9mDEO/o9TuNuiSTAB6xOrGs3Yjrm+HYFvNct+TS641whYj
	isaymxekB02TJtWpAwqVFn9D9MZOyvzLGWmRL6+6lywVQYrVRPrGMNM3elW2Co4dEtwV
	QxYSjX5mfijqfRpxznxAUx07O1WsPXPqYMhdmQe+XbeKH5/i/zlRYYytnTI1+u5L1d+l
	hN5Q==
X-Gm-Message-State: AOPr4FVisWmzuEdIX7vknBt9IMkmwuNaFoVPyXNyPc62URr/0A7ibfmuPPBzTIrXsYI0lw==
X-Received: by 10.28.54.69 with SMTP id d66mr30342765wma.94.1463563200564;
	Wed, 18 May 2016 02:20:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r8sm8081769wme.14.2016.05.18.02.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 02:19:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 11:20:29 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160518092029.GA2579@jama>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com>
MIME-Version: 1.0
In-Reply-To: <573C21EE.8040104@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Wed, 18 May 2016 09:20:03 -0000
X-Groupsio-MsgNum: 82280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang wrote:
> Hi Martin,
>=20
> On 05/18/2016 03:39 PM, Martin Jansa wrote:
> > See:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5970
> >
> > Just using recipe checksum wont work, because the main reason for PR bu=
mps is to
> > automatically upgrade the packages when one of the dependencies changes=
 .so
> > version, which you won't detect from recipe checksum of the app which i=
s just
> > using the library.
>=20
> For the development branch like master, yes, that would happen. But for
> the stable release like jethro and krogoth, it is unlikely that would
> happen, and if if does, the user can manually bump the impacted recipe's
> PR to fix the problem. The current problem is that when *all* recipes'
> PR are bumped, there is no way to fix the problem.

You can still stop using PR service and start doing manual PR bumps, but
it's quite annoying if you need to bump a lot of recipes you don't
control :).

> > On Wed, May 18, 2016 at 8:09 AM, Robert Yang <liezhi.yang@windriver.com
> > <mailto:liezhi.yang@windriver.com>> wrote:
> >
> >     The PRServer bumps PR according to do_package's task hash, that
> >     causes it bumps *all* packages' PR when recipes like pseudo-native
> >     and rpm-native is changed. It is a very bad user experience when we
> >     run "smart/opkg upgrade" on running target, for example, when we ap=
ply
> >     a CVE patch to pseudo-native or rpm-native, or do some slight chang=
es
> >     in their do_compile, "smart/opkg upgrade" will download/install *al=
l*
> >     the packages since all of the packages' PR are bumped.
> >
> >     Here are some rough suggestions to fix this problem, and please feel
> >     free to give your suggestions.
> >     1) Do not use do_package's task for bumping PR, the easiest way
> >         is simulate manually bump PR -- only bump PR when the recipe
> >         itself's checksum is changed.
> >
> >     2) Add a new task for PRServer, redefine its task hash for bumping
> >         PR, for example, this task hash only considers RDEPENDS (no
> >         DEPENDS), and drop any native dependencies.
> >
> >     I prefer the first way, and an alternative way maybe add a var so t=
hat
> >     the user can configure it:
> >     PR_CHECKSUM =3D "${BB_TASKHASH}" (current way)
> >     Or
> >     PR_CHECKSUM =3D "<recipe checksum>"
> >
> >     --
> >     Thanks
> >
> >     Robert
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc8M9wACgkQN1Ujt2V2gBwUQACdHcLOJcWP9y0QwxHbCvc5xDQ9
3vAAmgNueUEyq3VblfJxSCzRhSdiLZiG
=O0M3
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
