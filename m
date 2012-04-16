Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SJn8W-0007Aj-Fk
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 16:42:36 +0200
Received: by eekc1 with SMTP id c1so1083645eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 07:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7klCLLWWU6Xqoe+j9peEifVqPPYF4XwvBOuLFlw7J88=;
	b=QubD9VfIaL1+vOQcOPeOvzOqwTjvnlM/PTUv0EnYEvXi9Gu+t5Fu7mjcboXKigU4QD
	H1AToaadjNt1stvnWLtoveZuXAX5D7aDBj21UXdBqlKtyExVYRDDrS/d+3O4TzKSPkLw
	2xHLNfXPrbeR/f60fQ4mnYy1RHoiz2mBHrCNtPzX+H0yeLGOsuu0XSbAthyLsiHPfFVu
	El92qz7vQJV2aLkd80IMJRNDcaHcKRNMUm0SKvVJ8z1RFImVthsLgW6d9p45wurIhShi
	DV0RHdRjlC4fjvr6PKlF/CSPml+rnaTD4hbBS8+kKOpN47tPMZmpB0d0ieZjjNRMnZLY
	SPXQ==
Received: by 10.14.101.67 with SMTP id a43mr1684249eeg.39.1334586791130;
	Mon, 16 Apr 2012 07:33:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n55sm87843521eef.6.2012.04.16.07.33.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 07:33:10 -0700 (PDT)
Date: Mon, 16 Apr 2012 16:33:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120416143310.GH11086@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted>
	<20120323131701.GF3879@jama.jama.net>
	<20120324022639.GF4604@jama.jama.net>
	<CAMKF1souotjH46PYsQYC8LKDfa2ABD4FsrpxEUvCPqic3PnW1A@mail.gmail.com>
	<20120328143347.GF4004@jama.jama.net>
	<20120404211108.GJ4181@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120404211108.GJ4181@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: eglibc: shlib.lds:127: syntax error Was: [PATCH 1/2] eglibc-2.15: Update SRCREV
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
X-List-Received-Date: Mon, 16 Apr 2012 14:42:36 -0000
X-Groupsio-MsgNum: 20806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Content-Disposition: inline

--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2012 at 11:11:08PM +0200, Martin Jansa wrote:
> On Wed, Mar 28, 2012 at 04:33:47PM +0200, Martin Jansa wrote:
> > On Wed, Mar 28, 2012 at 07:15:32AM -0700, Khem Raj wrote:
> > > On Fri, Mar 23, 2012 at 7:26 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> > > > On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
> > > >> On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
> > > >> > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> > > >> > > Get new patches and remove the one that got merged upstream
> > > >> > >
> > > >> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> > > ---
> > > >> > > =A0.../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch =A0 =A0| =
=A0108 ++++++++++++++++++++
> > > >> > > =A0.../eglibc-2.15/armv4-eabi-compile-fix.patch =A0 =A0 =A0 | =
=A0 25 -----
> > > >> > > =A0.../eglibc/eglibc-2.15/initgroups_keys.patch =A0 =A0 =A0 | =
=A0 20 ++++
> > > >> > > =A0meta/recipes-core/eglibc/eglibc_2.15.bb =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A05 +-
> > > >> > > =A04 files changed, 131 insertions(+), 27 deletions(-)
> > > >> > > =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLR=
O_dl_debug_mask.patch
> > > >> > > =A0delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/arm=
v4-eabi-compile-fix.patch
> > > >> > > =A0create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ini=
tgroups_keys.patch
> > > >> >
> > > >> > Since 2.15 isn't the default I'm tempted to merge this despite t=
he point
> > > >> > we're at in the release cycle. I'd like to give anyone using thi=
s the
> > > >> > opportunity to comment first though.
> > > >>
> > > >> I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
> > > >> x86-64) and will report tomorrow.
> > > >
> > > > Doesn't look related to this change, but I got interesing error on =
other
> > > > buildhost (on mine everything seems fine sofar including tests on
> > > > target), I don't have log from armv4t build on mine, because it's o=
n tmpfs
> > > > and there was unexpected reboot when I wasn't home :/.
> > >=20
> > > Hi Martin
> > >=20
> > > Does it look good for your testing ?
> >=20
> > Seems fine in runtime any hint about that build issue?
> >=20
> > Today I got another one :/
> >=20
> > "build-x86_64-oe-linux/shlib.lds:127: syntax error
> > while building eglibc
> >=20
> > I had reports about this before, but wasn't able to reproduce it on my
> > machine, today I got it for first time (maybe because of building with
> > -j8 instead of -j4), so I've created simple testcase to compare interim=
=20
> > outputs from shlib.lds creation:
> > http://build.shr-project.org/tests/jama/shlib-issue/
>=20
> To follow this monolog, the problem is in file Makerules itself, gcc
> output is the same as well as output from sed, but Makerules file is
> partially rewritten during build and if shlib.lds gets generated in
> wrong time then it results in this
>=20
> touch /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/eglibc/eglibc-=
2.15-r3+svnr17386/eglibc-2_15/libc/Makerules
>=20
> after eglibc build fail is enough to recreate correct shlibs.lds

I was running core-image-minimal builds on different block devices to
provide some build time data for=20
[yocto] Build time data
thread and it seems that this bug is more likely to happen on fast host
with slow IO

I've got it 4 times today (from 4 tries) when running with tmpdir on RAID5,
and only once (from 3 tries) when running with with tmpdir on tmpfs.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+MLaYACgkQN1Ujt2V2gBz0MgCeII+0ci9qodbS+gkZywFd/6qe
bFsAoJQIDKYbTR2vtGh8wtpTgmK2CcHA
=CvIm
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
