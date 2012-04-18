Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKXEL-0004uW-6G
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:55:41 +0200
Received: by eaae1 with SMTP id e1so1588433eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 08:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1H7Wvgw2lRdgSFniki7CwUUshLe6/KmNruTHsGzk2pw=;
	b=Py/EkcKEDpPVTaQQzqFdNLIf9M4hmAb2NKA1kOtMApWVez+m5IN4hvVuVCUdLeIvyx
	Hae43tMhTT7lKrGlO1znHBNsS4Bqj+saaPDdfCSZDHY56SM2VLx+OU65LUJntuSgf+1j
	m9Bo4FlEtIwW5Yi48Y398rYf3SpaShWZyg9J9r0ur4p0eVdlFfncbnZierAB4fJl6ZsU
	7CO+Bc4PggkeROCN5ZeSyKYUKDGNHYOta5DjP+d21F52JkAgI8/MOUWsvAifi6SL9TFj
	sQBPDqH7m4AE6aECl6YujP6LacoyonYqR8XcShKzTEG8sy8dtStpEmOmpG+MgQuJ5z5Z
	HStQ==
Received: by 10.213.3.197 with SMTP id 5mr248286ebo.93.1334763973819;
	Wed, 18 Apr 2012 08:46:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d54sm119473505eei.9.2012.04.18.08.46.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 08:46:12 -0700 (PDT)
Date: Wed, 18 Apr 2012 17:46:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120418154612.GN3635@jama.jama.net>
References: <4F8C3B19.40400@windriver.com> <4F8EA5CC.6010101@opendreambox.org>
	<1334749226.24091.67.camel@ted> <4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted> <4F8EAEAC.4080605@opendreambox.org>
	<1334753155.24091.84.camel@ted> <4F8ED1BE.8010109@opendreambox.org>
	<4F8EDC02.5040605@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4F8EDC02.5040605@windriver.com>
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
X-List-Received-Date: Wed, 18 Apr 2012 15:55:41 -0000
X-Groupsio-MsgNum: 20971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SgT04PEqo/+yUDw3"
Content-Disposition: inline

--SgT04PEqo/+yUDw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 10:21:38AM -0500, Mark Hatle wrote:
> On 4/18/12 9:37 AM, Andreas Oberritter wrote:
> > On 18.04.2012 14:45, Richard Purdie wrote:
> >> On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
> >>> On 18.04.2012 14:00, Richard Purdie wrote:
> >>>> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
> >>>>> I had a lot of those (e.g. because armv7a-vfp-neon was including 20
> >>>>> arm*feed.conf variants in /etc/opkg most of them empty - without
> >>>>> Packages.gz).
> >>>>>
> >>>>> So I've added "filter" to distro-feed-configs
> >>>>> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;=
h=3D236aa553bb0f82f741c6edb793e96f421f24f4fa
> >>>>> to add only feeds I'm generating (and I also don't want armv5* pack=
ages
> >>>>> installed on armv7a-vfp-neon target unless user explicitly adds arm=
v5*
> >>>>> feed).
> >>>>
> >>>> This is the better solution. I think we need to get a better default
> >>>> feed-config generation mechanism into the core. Distros may still ne=
ed
> >>>> to tweak it but it would be good to share some of the best practises=
=2E..
> >>>
> >>> Did you look at the patch? Which default setting of
> >>> SUPPORTED_EXTRA_ARCHS do you suggest?
> >>
> >> I did. I didn't say the above patch was a perfect solution.
> >>
> >>>   Do you think it's feasible to add
> >>> every single downloadable arch to this variable? If a user of my dist=
ro
> >>> decides to build it for some arm or x86 cpu, should he need to know
> >>> which archs to add at this place?
> >>
> >> This is a place where the build system meets and interfaces with the
> >> distro. No one policy in the build system is going to fit every distro=
's
> >> needs, not should we ever aim to so.
> >
> > At least we should have defaults that actually work for someone. Now we
> > don't and considering that distro-feed-configs.bb is the only place
> > where PACKAGE_EXTRA_ARCHS is actually used, this would be very easy to
> > accomplish. Especially because it worked well by default before Mark
> > broke it.
>=20
> PACKAGE_EXTRA_ARCHS is also used by Zypper, RPM configuration and other p=
laces.=20
>   In those cases it is a full list of all available (and compatible) pack=
age=20
> architecture types.
>=20
> Coming from the RPM world, it seems very odd to me that a set of "extra_a=
rchs"=20
> can not list well, extra compatible archs without causing an error.  I ha=
ve no=20
> idea how to reconcile this behavior, without making a package manager=20
> distro-feed specific solution.  (For RPM we absolutely want the existing =
behavior.)

The problem Andreas is seeing is not fatal AFAIK.. just couple (or a
lot) of 404 (Packages files not available) while doing opkg update is
not nice for end user.=20

Downloading many existing Packages files without any Package in it
is also suboptimal, but maybe good start.. so we can teach
meta/classes/package_ipk.bbclass:package_update_index_ipk() to create
Packages files not only for existing
ipkgarchs=3D"${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
but for all (replace "if [ -e $pkgdir/ ]; then" with something like=20
"if [ ! -e $pkgdir/ ]; then mkdir -p $pkgdir; fi")

Cheers,

> > I guess it's indeed better to just override the necessary bits in my
> > distro instead of trying to get working defaults upstream.
> >
> > Regards,
> > Andreas
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SgT04PEqo/+yUDw3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+O4cQACgkQN1Ujt2V2gBympACffU2qwSFfhrMFk7mB/85TYl+z
eDMAnjbEpEiQcfJjgK3/YVpo4M+avdDP
=FDkB
-----END PGP SIGNATURE-----

--SgT04PEqo/+yUDw3--
