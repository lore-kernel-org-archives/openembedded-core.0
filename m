Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SCu5J-0008LA-SH
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 16:42:49 +0200
Received: by wera1 with SMTP id a1so691198wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 07:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YK3vBy1E7WPHC6owWp3no1N+HL9bfPBZzBsZmd3/XS4=;
	b=daEQFoayFhERybKLvanBCJ+GoTCraXVufHVvuWaRuKC3htzC3AQGqp1Vl+wEFT4365
	U8rgvojRbBo9brtSJoqvwek0nmH+eRRQOB2cQY6VT8uM7eSlppDXiKoegEjtmfpDq2Wb
	lpLrfz5EOxB7tWGK/JHd6O+qscJvMjr2CM2WGt83yH9RvZ+3dkmB6LhyJRuaLAdR05yO
	KCxhPdzld1KNmqoMy1nRAkSvCO6/DFTrMc1JLrVDL17pwfpu3+mC3LcQ+SIGqWJFfCuC
	/xDtnf+ci6tVzXK/LjXV7FRO384yXWlO3iNxZk2z9jpvFJMthdup3teWGJNZh1qMUcuF
	Jfdw==
Received: by 10.216.139.129 with SMTP id c1mr17178382wej.48.1332945227891;
	Wed, 28 Mar 2012 07:33:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm2846329wiw.5.2012.03.28.07.33.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 07:33:47 -0700 (PDT)
Date: Wed, 28 Mar 2012 16:33:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120328143347.GF4004@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted>
	<20120323131701.GF3879@jama.jama.net>
	<20120324022639.GF4604@jama.jama.net>
	<CAMKF1souotjH46PYsQYC8LKDfa2ABD4FsrpxEUvCPqic3PnW1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1souotjH46PYsQYC8LKDfa2ABD4FsrpxEUvCPqic3PnW1A@mail.gmail.com>
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
X-List-Received-Date: Wed, 28 Mar 2012 14:42:50 -0000
X-Groupsio-MsgNum: 19895
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4f28nU6agdXSinmL"
Content-Disposition: inline

--4f28nU6agdXSinmL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 07:15:32AM -0700, Khem Raj wrote:
> On Fri, Mar 23, 2012 at 7:26 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
> >> On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
> >> > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> >> > > Get new patches and remove the one that got merged upstream
> >> > >
> >> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > > ---
> >> > > =A0.../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch =A0 =A0| =A0108=
 ++++++++++++++++++++
> >> > > =A0.../eglibc-2.15/armv4-eabi-compile-fix.patch =A0 =A0 =A0 | =A0 =
25 -----
> >> > > =A0.../eglibc/eglibc-2.15/initgroups_keys.patch =A0 =A0 =A0 | =A0 =
20 ++++
> >> > > =A0meta/recipes-core/eglibc/eglibc_2.15.bb =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A05 +-
> >> > > =A04 files changed, 131 insertions(+), 27 deletions(-)
> >> > > =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl=
_debug_mask.patch
> >> > > =A0delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-e=
abi-compile-fix.patch
> >> > > =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgro=
ups_keys.patch
> >> >
> >> > Since 2.15 isn't the default I'm tempted to merge this despite the p=
oint
> >> > we're at in the release cycle. I'd like to give anyone using this the
> >> > opportunity to comment first though.
> >>
> >> I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
> >> x86-64) and will report tomorrow.
> >
> > Doesn't look related to this change, but I got interesing error on other
> > buildhost (on mine everything seems fine sofar including tests on
> > target), I don't have log from armv4t build on mine, because it's on tm=
pfs
> > and there was unexpected reboot when I wasn't home :/.
>=20
> Hi Martin
>=20
> Does it look good for your testing ?

Seems fine in runtime any hint about that build issue?

Today I got another one :/

"build-x86_64-oe-linux/shlib.lds:127: syntax error
while building eglibc

I had reports about this before, but wasn't able to reproduce it on my
machine, today I got it for first time (maybe because of building with
-j8 instead of -j4), so I've created simple testcase to compare interim=20
outputs from shlib.lds creation:
http://build.shr-project.org/tests/jama/shlib-issue/

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4f28nU6agdXSinmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9zIUsACgkQN1Ujt2V2gBxWbACgmNseDCtsYMjmxuht4TwGZwOq
ogUAniKKWmzU0QjATSwZFAq6SJU+oi0p
=ZTr5
-----END PGP SIGNATURE-----

--4f28nU6agdXSinmL--
