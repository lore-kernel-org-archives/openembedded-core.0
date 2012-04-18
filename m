Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKb9C-0006WG-1i
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 22:06:38 +0200
Received: by wibhj13 with SMTP id hj13so892302wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XGjf7xHZDb2A071Kzp2+/fxah87SlsTlnQNesUeVZLw=;
	b=SV6hMqO3UNS8pnHhIHK3fnDGU/WTlnd+JrPPP8SYePfArsquCbCrHCG726oz4utcUR
	PBbwZ830GB368ltQ1I6ok8Dx+MiBMcqJ55BAxihfzMg6HsKp34rhUlaLOyiGg7VorD5P
	0yZ2IS0FtUJue+a7dpVzn/22HCPERZw2Hs1aZ2HqzKxK5dZ/rF57jmsqUDwqEfKwEMEK
	Zv/DHr7CHFDG+/9dG5tZRsOUaosP+WoqteW7ssdX3uMwqEbwCTsiWnF86ZOB3D66R/ar
	0SfWFwVn/k5i8ebmWzj1oAeCVjospB3nvGNWH7K8mFri0Z3KF1w1rXk+4Qy3QxXesshl
	RKOw==
Received: by 10.216.134.200 with SMTP id s50mr2148548wei.116.1334779030581;
	Wed, 18 Apr 2012 12:57:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm58753752wix.10.2012.04.18.12.57.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 12:57:09 -0700 (PDT)
Date: Wed, 18 Apr 2012 21:57:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120418195710.GO3635@jama.jama.net>
References: <1334749226.24091.67.camel@ted> <4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted> <4F8EAEAC.4080605@opendreambox.org>
	<1334753155.24091.84.camel@ted> <4F8ED1BE.8010109@opendreambox.org>
	<4F8EDC02.5040605@windriver.com>
	<20120418154612.GN3635@jama.jama.net>
	<F1EB8D66-C971-4BFF-AECB-62C65E517743@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <F1EB8D66-C971-4BFF-AECB-62C65E517743@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 20:06:38 -0000
X-Groupsio-MsgNum: 20990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aTCJOP0qgkSGqHWA"
Content-Disposition: inline

--aTCJOP0qgkSGqHWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 07:01:12PM +0200, Koen Kooi wrote:
>=20
> Op 18 apr. 2012, om 17:46 heeft Martin Jansa het volgende geschreven:
>=20
> > On Wed, Apr 18, 2012 at 10:21:38AM -0500, Mark Hatle wrote:
> >> On 4/18/12 9:37 AM, Andreas Oberritter wrote:
> >>> On 18.04.2012 14:45, Richard Purdie wrote:
> >>>> On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
> >>>>> On 18.04.2012 14:00, Richard Purdie wrote:
> >>>>>> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
> >>>>>>> I had a lot of those (e.g. because armv7a-vfp-neon was including =
20
> >>>>>>> arm*feed.conf variants in /etc/opkg most of them empty - without
> >>>>>>> Packages.gz).
> >>>>>>>=20
> >>>>>>> So I've added "filter" to distro-feed-configs
> >>>>>>> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommi=
t;h=3D236aa553bb0f82f741c6edb793e96f421f24f4fa
> >>>>>>> to add only feeds I'm generating (and I also don't want armv5* pa=
ckages
> >>>>>>> installed on armv7a-vfp-neon target unless user explicitly adds a=
rmv5*
> >>>>>>> feed).
> >>>>>>=20
> >>>>>> This is the better solution. I think we need to get a better defau=
lt
> >>>>>> feed-config generation mechanism into the core. Distros may still =
need
> >>>>>> to tweak it but it would be good to share some of the best practis=
es...
> >>>>>=20
> >>>>> Did you look at the patch? Which default setting of
> >>>>> SUPPORTED_EXTRA_ARCHS do you suggest?
> >>>>=20
> >>>> I did. I didn't say the above patch was a perfect solution.
> >>>>=20
> >>>>>  Do you think it's feasible to add
> >>>>> every single downloadable arch to this variable? If a user of my di=
stro
> >>>>> decides to build it for some arm or x86 cpu, should he need to know
> >>>>> which archs to add at this place?
> >>>>=20
> >>>> This is a place where the build system meets and interfaces with the
> >>>> distro. No one policy in the build system is going to fit every dist=
ro's
> >>>> needs, not should we ever aim to so.
> >>>=20
> >>> At least we should have defaults that actually work for someone. Now =
we
> >>> don't and considering that distro-feed-configs.bb is the only place
> >>> where PACKAGE_EXTRA_ARCHS is actually used, this would be very easy to
> >>> accomplish. Especially because it worked well by default before Mark
> >>> broke it.
> >>=20
> >> PACKAGE_EXTRA_ARCHS is also used by Zypper, RPM configuration and othe=
r places.=20
> >>  In those cases it is a full list of all available (and compatible) pa=
ckage=20
> >> architecture types.
> >>=20
> >> Coming from the RPM world, it seems very odd to me that a set of "extr=
a_archs"=20
> >> can not list well, extra compatible archs without causing an error.  I=
 have no=20
> >> idea how to reconcile this behavior, without making a package manager=
=20
> >> distro-feed specific solution.  (For RPM we absolutely want the existi=
ng behavior.)
> >=20
> > The problem Andreas is seeing is not fatal AFAIK.. just couple (or a
> > lot) of 404 (Packages files not available) while doing opkg update is
> > not nice for end user.=20
> >=20
> > Downloading many existing Packages files without any Package in it
> > is also suboptimal, but maybe good start.. so we can teach
> > meta/classes/package_ipk.bbclass:package_update_index_ipk() to create
> > Packages files not only for existing
> > ipkgarchs=3D"${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
> > but for all (replace "if [ -e $pkgdir/ ]; then" with something like=20
> > "if [ ! -e $pkgdir/ ]; then mkdir -p $pkgdir; fi")
>=20
> That implies you're exposing feeds straight from OE, which is a bad, bad =
idea.

I'm rsyncing feed (whole deploy dir) to exposed location only after whole b=
uild=20
is finished and package-indexes regenerated, so I think I'm quite safe.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aTCJOP0qgkSGqHWA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+PHJUACgkQN1Ujt2V2gByKjQCfZRRjIjdoE4Z6NzsWq4rKg5n0
F84An3WX/ViZOG78Hq7JE/9KdbjXlxXn
=PsKx
-----END PGP SIGNATURE-----

--aTCJOP0qgkSGqHWA--
