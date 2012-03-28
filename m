Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCziz-00044g-NY
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 22:44:09 +0200
Received: by wibhj13 with SMTP id hj13so1259085wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gWRDAjJ+bEzn2/Xh/CvepjB6eJHgw6SIESoyLhHOr2Q=;
	b=TmiN2zqRECDeg5AdSvDdq0L4hKOagXR7cphnnm2q8ZLZwN2KYlJJV3ZAmXUggi0SHS
	8yfwB0Q2gMCeSBUf16DbZhhRgsMgStntWTrxrldGxCpJK2177BrWDjie9tSDYGHuTXfK
	erJTelHHSuIY5KNLshUzE330uL0Tw9TZ7MGsKlv6pJdBLbo9UhI1OV8jpzjvK30f82WJ
	o3vwF1K1+0Z2xKh8FAe4hUsKhShP6guyY16w2XJTiWzUw4IPvB0OV7iJOu34gUrTE0fi
	61zwSCsqu1UKv3x6kHm3wRxEfov3ooqw3wGW/T3/0AcbmYQiXEiimrFYCYUV1o2lUpTu
	C++g==
Received: by 10.216.136.72 with SMTP id v50mr18005634wei.73.1332966907253;
	Wed, 28 Mar 2012 13:35:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm60730862wib.4.2012.03.28.13.35.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 13:35:06 -0700 (PDT)
Date: Wed, 28 Mar 2012 22:35:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120328203505.GG4004@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted>
	<20120323131701.GF3879@jama.jama.net>
	<20120324022639.GF4604@jama.jama.net>
	<CAMKF1souotjH46PYsQYC8LKDfa2ABD4FsrpxEUvCPqic3PnW1A@mail.gmail.com>
	<20120328143347.GF4004@jama.jama.net>
	<CAMKF1sqr0RtpNny_aLEkrnLQYsCGPsZL4ZVK51tCoATHFKLKrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqr0RtpNny_aLEkrnLQYsCGPsZL4ZVK51tCoATHFKLKrQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Wed, 28 Mar 2012 20:44:09 -0000
X-Groupsio-MsgNum: 19907
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YH9Qf6Fh2G5kB/85"
Content-Disposition: inline

--YH9Qf6Fh2G5kB/85
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 09:10:57AM -0700, Khem Raj wrote:
> On Wed, Mar 28, 2012 at 7:33 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, Mar 28, 2012 at 07:15:32AM -0700, Khem Raj wrote:
> >> On Fri, Mar 23, 2012 at 7:26 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> > On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
> >> >> On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
> >> >> > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> >> >> > > Get new patches and remove the one that got merged upstream
> >> >> > >
> >> >> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> > > ---
> >> >> > > =A0.../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch =A0 =A0| =A0=
108 ++++++++++++++++++++
> >> >> > > =A0.../eglibc-2.15/armv4-eabi-compile-fix.patch =A0 =A0 =A0 | =
=A0 25 -----
> >> >> > > =A0.../eglibc/eglibc-2.15/initgroups_keys.patch =A0 =A0 =A0 | =
=A0 20 ++++
> >> >> > > =A0meta/recipes-core/eglibc/eglibc_2.15.bb =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A05 +-
> >> >> > > =A04 files changed, 131 insertions(+), 27 deletions(-)
> >> >> > > =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO=
_dl_debug_mask.patch
> >> >> > > =A0delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv=
4-eabi-compile-fix.patch
> >> >> > > =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/init=
groups_keys.patch
> >> >> >
> >> >> > Since 2.15 isn't the default I'm tempted to merge this despite th=
e point
> >> >> > we're at in the release cycle. I'd like to give anyone using this=
 the
> >> >> > opportunity to comment first though.
> >> >>
> >> >> I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
> >> >> x86-64) and will report tomorrow.
> >> >
> >> > Doesn't look related to this change, but I got interesing error on o=
ther
> >> > buildhost (on mine everything seems fine sofar including tests on
> >> > target), I don't have log from armv4t build on mine, because it's on=
 tmpfs
> >> > and there was unexpected reboot when I wasn't home :/.
> >>
> >> Hi Martin
> >>
> >> Does it look good for your testing ?
> >
> > Seems fine in runtime any hint about that build issue?
> >
> > Today I got another one :/
> >
> > "build-x86_64-oe-linux/shlib.lds:127: syntax error
> > while building eglibc
> >
> > I had reports about this before, but wasn't able to reproduce it on my
> > machine, today I got it for first time (maybe because of building with
> > -j8 instead of -j4), so I've created simple testcase to compare interim
> > outputs from shlib.lds creation:
> > http://build.shr-project.org/tests/jama/shlib-issue/
> >
>=20
> yes I am aware of this problem. Somehow tokens in linker script
> gets eaten up which results in unbalanced parens. I havent tracked
> it down. I have seen this with eglibc 2.13 as well.
>=20
> Are you using gold by any chance.

Not in that build I have seen it for first time (it was for qemux86-64
with distroless oe-core).

Cheers,

>=20
> > Cheers,
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YH9Qf6Fh2G5kB/85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9zdfkACgkQN1Ujt2V2gByLAwCcCsDkU8u7/C1DO8EUwbFmmgiv
uAYAn1AEVSdwnFSrRzcHwrTJmksIvd0C
=VfIX
-----END PGP SIGNATURE-----

--YH9Qf6Fh2G5kB/85--
