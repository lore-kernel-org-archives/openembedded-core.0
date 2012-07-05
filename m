Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Smofq-0001kg-Ml; Thu, 05 Jul 2012 18:12:58 +0200
Received: by weyr6 with SMTP id r6so2414545wey.6
	for <multiple recipients>; Thu, 05 Jul 2012 09:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CSZ5UUN2Wz1xiuSXahWGOAi2NL+DmefJdXoDkQhUKww=;
	b=b972HJ8UZGekL/h+fRfgx7mjAmL6mRWGvVNZPIAZYLOKXhW4MVrbm97D/LU1Na6QWe
	zQfYCsXh8CuEbdrlgTQ4YhTE0e6wMfeGjdMe+ffYnc/spXQVnIuVjRnwZEQDndVE6hMa
	Je7Zl4q+Pp/AE/Ad60/OOHhDcTOfRzuSKKb8s4xaHdrTsp2ROXFykKnc7ZwzpJ3swq1B
	UWsn1X4NU3B5JX4YZ0/Fgi0FfdN9qDzue7FSnfSCDXlQKWJjeE800hi3WbF/Es/RCWx/
	Io7fWUmvjWf0VCoooeQM1eC7E/WVjh1rsenHe/70mB3m3C8ThNYsA/p1HrnGbawWkSVN
	aYUA==
Received: by 10.180.14.193 with SMTP id r1mr506751wic.19.1341504114241;
	Thu, 05 Jul 2012 09:01:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d10sm1112062wiy.3.2012.07.05.09.01.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 09:01:53 -0700 (PDT)
Date: Thu, 5 Jul 2012 18:01:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20120705160147.GB3708@jama.jama.net>
References: <20120625153328.B76A81033A@opal>
	<20120628192018.GB5532@localhost.jama.net>
	<20120704172715.GH15100@jama.jama.net>
	<20120705155526.GF1817@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20120705155526.GF1817@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Gortmaker : linux-firmware: update to main repo on kernel.org
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
X-List-Received-Date: Thu, 05 Jul 2012 16:12:58 -0000
X-Groupsio-MsgNum: 24725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 05, 2012 at 11:55:27AM -0400, Paul Gortmaker wrote:
> [Re: [oe-commits] Paul Gortmaker : linux-firmware: update to main repo on=
 kernel.org] On 04/07/2012 (Wed 19:27) Martin Jansa wrote:
>=20
> > On Thu, Jun 28, 2012 at 09:20:18PM +0200, Martin Jansa wrote:
> > > On Mon, Jun 25, 2012 at 03:33:28PM +0000, git@git.openembedded.org wr=
ote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: b9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> > > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3D=
commit;h=3Db9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> > > >=20
> > > > Author: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > > Date:   Fri Jun 22 10:15:07 2012 -0400
> > > >=20
> > > > linux-firmware: update to main repo on kernel.org
> > > >=20
> > > > This is now the authoratative repository, taking updates.
> > > > The latest has a couple updated license files, vs. the previous
> > > > srcrev that was used.
> > > >=20
> > > > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > >=20
> > > > ---
> > > >=20
> > > >  .../linux-firmware/linux-firmware_git.bb           |   10 +++++---=
--
> > > >  1 files changed, 5 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.=
bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > > index 3675978..8aacce4 100644
> > > > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > > @@ -7,23 +7,23 @@ SECTION =3D "kernel"
> > > > =20
> > > >  LICENSE =3D "Proprietary"
> > > > =20
> > > > -LIC_FILES_CHKSUM =3D "file://LICENSE.radeon_rlc;md5=3D4c243f7854d2=
884b483abda991adef43 \
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE.radeon;md5=3De56b405656593a0c=
97e478513051ea0e \
> > > >                      file://LICENSE.dib0700;md5=3Df7411825c8a555a1a=
3e5eab9ca773431 \
> > > >                      file://LICENCE.xc5000;md5=3D1e170c13175323c32c=
7f4d0998d53f66 \
> > > >                      file://LICENCE.ralink-firmware.txt;md5=3Dab2c2=
69277c45476fb449673911a2dfd \
> > > >                      file://LICENCE.qla2xxx;md5=3D4005328a134054f0f=
a077bdc37aa64f2 \
> > > > -                    file://LICENCE.iwlwifi_firmware;md5=3D311cc823=
df5b1be4f00fbf0f17d96a6b \
> > > > +                    file://LICENCE.iwlwifi_firmware;md5=3D11545778=
abf78c43d7644d4f171ea1c7 \
> > > >                      file://LICENCE.i2400m;md5=3D14b901969e23c41881=
327c0d9e4b7d36 \
> > > >                      file://LICENCE.atheros_firmware;md5=3D30a14c78=
23beedac9fa39c64fdd01a13 \
> > > >                      file://LICENCE.agere;md5=3Daf0133de6b4a9b2522d=
efd5f188afd31 \
> > > >                      file://LICENCE.rtlwifi_firmware.txt;md5=3D00d0=
6cfd3eddd5a2698948ead2ad54a5 \
> > > >                     "
> > > > =20
> > > > -SRCREV =3D "15888a2eab052ac3d3f49334e4f6f05f347a516e"
> > > > +SRCREV =3D "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> > > >  PV =3D "0.0+git${SRCPV}"
> > > > -PR =3D "r1"
> > > > +PR =3D "r2"
> > > > =20
> > > > -SRC_URI =3D "git://git.infradead.org/users/dwmw2/linux-firmware.gi=
t;protocol=3Dgit"
> > > > +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/firmwar=
e/linux-firmware.git;protocol=3Dgit"
> > >=20
> > > changing git URL (or even just branch) in recipe with SRCPV in PV res=
ets LOCALCOUNT to zero..
> > > so breaks upgrade path.
> > >=20
> > > Bump PE or PV to fix that!
> >=20
> > Ping,
>=20
> Since the mailing list conveniently mangles the Cc: list, I never saw
> this original feedback.   I can submit a one line change for PV, but to
> be honest, I've no idea how PV is used, nor what LOCALCOUNT is.  Since
> it clearly matters to a particular workflow you use, and you understand
> how it works, I'd suggest you send the one liner, since you'll be better
> able to write a meaningful commit log than I could.

LOCALCOUNT is NNN in 1.0+gitNNN+hash
and
0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2
sorts lower then
0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1
because PR is least important part of version string

PE is most important part of version string so fixes this case when new
PV was lower then old one.

Having usable binary feeds where package versions are incrementing isn't
my particular workflow.. it's pretty much general use-case I would
expect and those errors I've pasted support that idea :).

And I've sent this oneliner just after receiving OOO reply from you,
it's even already applied..

Cheers,

> To me, it seems odd that a change in the PR thing doesn't immediately
> cause a change in whatever state the test on the PV thing is checking.
> That is probably because I've not a clear vision of how they are to be
> used and why they have overlapping roles.
>=20
> Thanks,
> Paul.
> --
>=20
> >=20
> > > NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9=
c13bf773a-r2: task do_package: Started
> > > ERROR: Package version for package linux-firmware-sd8686 went backwar=
ds which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4933=
4e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a=
-r2)
> > > ERROR: Package version for package linux-firmware-rtl8192cu went back=
wards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4=
9334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf7=
73a-r2)
> > > ERROR: Package version for package linux-firmware-rtl8192ce went back=
wards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4=
9334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf7=
73a-r2)
> > > ERROR: Package version for package linux-firmware-rtl8192su went back=
wards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4=
9334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf7=
73a-r2)
> > > ERROR: Package version for package linux-firmware-wl12xx went backwar=
ds which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4933=
4e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a=
-r2)
> > > ERROR: Package version for package linux-firmware-dbg went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > > ERROR: Package version for package linux-firmware-staticdev went back=
wards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4=
9334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf7=
73a-r2)
> > > ERROR: Package version for package linux-firmware-dev went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > > ERROR: Package version for package linux-firmware-doc went backwards =
which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4=
f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > > ERROR: Package version for package linux-firmware-locale went backwar=
ds which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f4933=
4e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a=
-r2)
> > > ERROR: Package version for package linux-firmware went backwards whic=
h would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f0=
5f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > > NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9=
c13bf773a-r2: task do_package: Succeeded
> > >=20
> > > Cheers,
> > >=20
> > > > =20
> > > >  S =3D "${WORKDIR}/git"
> > > > =20
> > > >=20
> > > >=20
> > > > _______________________________________________
> > > > Openembedded-commits mailing list
> > > > Openembedded-commits@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
mmits
> > >=20
> > > --=20
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >=20
> >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/1umsACgkQN1Ujt2V2gBxgqgCfdyM3PcSIy7avdSZEuYAIRJ8V
X8oAn0bW1qS3mo/flifpawlU3FILrNhh
=bWYU
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
