Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0F570684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:53:08 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so676057wib.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ouwcq45WeDUMVQEIXPabfKMltE50lK45vlC/cNExMDQ=;
	b=LUEWWpzE48zaRsep797EhEOINLDObVuyRacE4Uw6jWMWbpd1xzxRDo38QVQMH2lU6L
	g7ltxoqdO9ynDnX4ZSMQM+GbvIMpxlcklqRkTXv5nuZdwIPkm4r00PtJab7BDy/HmdSM
	A9lR2GigGpPuWQ1EKZfnWpvzyZmKyJ9KiUFRHfnPaQM+K3MmAynDEPCJVRIBO/HISbGk
	1/KHXykQBX4c6v2iQSd/JAyKcRH/acnKosfKjpOfj4hufrzzP1g96Y72Ob70TCc78fcv
	sxGP03EpCBVZs/VP3AsZilxkudjw3UvaW3bnVH3aEq3IFJ9iSldiXXEGqyuHdY8RQMMn
	06SQ==
X-Received: by 10.180.80.70 with SMTP id p6mr3790224wix.22.1406281988522;
	Fri, 25 Jul 2014 02:53:08 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gq4sm3950518wib.8.2014.07.25.02.53.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 02:53:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 11:53:25 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140725095325.GR2492@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<67ae6f8074e50a768143cac6a40fd8d16e2f5965.1406234258.git.bruce.ashfield@windriver.com>
	<20140724220210.GO2492@jama>
	<CADkTA4MwiR8v_MAV=To-o-OPhDKT7kXESryCacathmZqNPhpEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MwiR8v_MAV=To-o-OPhDKT7kXESryCacathmZqNPhpEg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] lttng-modules: re-enable ARM builds
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
X-List-Received-Date: Fri, 25 Jul 2014 09:53:13 -0000
X-Groupsio-MsgNum: 55553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q/AGl/UrDvkbRExF"
Content-Disposition: inline

--Q/AGl/UrDvkbRExF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 11:10:50PM -0400, Bruce Ashfield wrote:
> On Thu, Jul 24, 2014 at 6:02 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Jul 24, 2014 at 04:41:52PM -0400, Bruce Ashfield wrote:
> >> With lttng 2.4.2 and gcc 4.9, we can now enable lttng-modules for ARM.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> ---
> >>  meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb | 3 +--
> >>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb b/meta/r=
ecipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> index 5a99a5adae8b..d87374163556 100644
> >> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> @@ -12,8 +12,7 @@ inherit module
> >>
> >>  SRCREV =3D "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
> >>
> >> -# lttng currently blacklists arm with gcc-4.8
> >> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> >> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips|arm).*-linux'
> >
> > Please squash this to 2/8 otherwise there is no arm version between 2/8
> > and 6/8.
>=20
> I'd rather not, since they are separate activities. I updated to 2.5,
> and then enable
> ARM. One isolated change per commit. Bisectability in a small series is o=
ne
> thing, but also is the isolation of changes.

2/8 commit message says:

We also drop the older 2.3.3 lttng-modules, since it is no longer
required to support ARM builds.

Which isn't true at that time and it means that these changes aren't
separate activities.

To keep them separate, remove 2.3.3 in this commit, not in upgrade to
2.5.0. (or with more work involved, enable arm in 2.4* together with
2.3.3 removal as someone reported arm+2.4* also working now).

> Richard can squash on merge is he wants, but I'm going to leave it as is.
>=20
> Bruce
>=20
> >
> >>  SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.=
5 \
> >>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.pat=
ch \
> >> --
> >> 1.8.1.2
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q/AGl/UrDvkbRExF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPSKRUACgkQN1Ujt2V2gBxyewCcDdRNZPTdS8hgwEe5igjyf3dC
Y4sAnjfS91unm8u3TQizyZk8zjq4tzpf
=uhAo
-----END PGP SIGNATURE-----

--Q/AGl/UrDvkbRExF--
