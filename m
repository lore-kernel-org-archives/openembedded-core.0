Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7C71A61614
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 07:10:13 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so669947eei.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hvBi96/0wgP2ctfUr7tJN62FoRM8BRcG3TqlyD2MwMA=;
	b=bivq76x7RImFmbVYaUMpoC/LD53PFOWD2P3XSfGytjFWGwNAIEFMWBimA4qRfM0afZ
	95/ksUe3ZVruGFGEXaotCfL5EmXnXXS9YXrKoZf2g9GqbmTZr/fSbLbAMu4aaa2T5cS+
	nAWHUN8Ij3zEfE3BN5m/x1DHPyfTZGYGjG0lRmC4xLjvm40LauGt1qaB5Chdnwt2ZFF8
	lrwiTmy2Q47t7TUZsNXZJKRtQfBbyvwyM8LMCxFogPmeycvuGy13FETtftRnIYbNmemP
	Y67t+aEntHzTfLTVEXViSYz/hc2dWLp0UX4gO4Ikxfy4ExJz2pe/m5eb9SOuZSQb4b05
	FcYg==
X-Received: by 10.15.75.73 with SMTP id k49mr11111209eey.36.1378365014440;
	Thu, 05 Sep 2013 00:10:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm46128013eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 00:10:13 -0700 (PDT)
Date: Thu, 5 Sep 2013 09:11:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20130905071133.GG11500@jama>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 07:10:15 -0000
X-Groupsio-MsgNum: 44523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline

--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2013 at 08:51:25PM -0400, Bruce Ashfield wrote:
> On Wed, Sep 4, 2013 at 6:01 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2013-09-04 at 17:22 +0100, Ross Burton wrote:
> >> Only qemumips was recommending kernel-modules which meant that the oth=
er qemu
> >> machines were missing some kernel modules, for example binfmt-misc.
> >>
> >> Move the recommends to qemu.inc so that all qemu machines pull in the =
kernel
> >> modules that have been built.
> >>
> >> [ YOCTO #4863 ]
> >>
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >>  meta/conf/machine/include/qemu.inc |    2 ++
> >>  meta/conf/machine/qemumips.conf    |    2 --
> >>  meta/conf/machine/qemumips64.conf  |    2 --
> >>  3 files changed, 2 insertions(+), 4 deletions(-)
> >
> > How many modules are built for the qemu machines? Are they all useful?
> > I'm just trying to get a feel for how much we're adding here and whether
> > this is the right thing to be doing...
>=20
> We can control the configs as tightly as we want, so if we are building t=
oo much
> for this, I'm happy to trim things down.

I don't think this is right way to do it.

It's good to have as many optional modules available in feed (so to
enable many modules in configs - you never know what obscure device
someone will try to test with qemu and one more module and package in
feed has smaller overhead then need to change configs) and install
only important modules by default in every image.

>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >>
> >> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/in=
clude/qemu.inc
> >> index 545f8d1..7baf13e 100644
> >> --- a/meta/conf/machine/include/qemu.inc
> >> +++ b/meta/conf/machine/include/qemu.inc
> >> @@ -27,3 +27,5 @@ EXTRA_IMAGEDEPENDS +=3D "qemu-native qemu-helper-nat=
ive"
> >>
> >>  # Provide the nfs server kernel module for all qemu images
> >>  KERNEL_FEATURES_append_pn-linux-yocto =3D " features/nfsd/nfsd-enable=
=2Escc"
> >> +
> >> +MACHINE_EXTRA_RRECOMMENDS =3D "kernel-modules"
> >> diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemum=
ips.conf
> >> index ce1c419..89721a6 100644
> >> --- a/meta/conf/machine/qemumips.conf
> >> +++ b/meta/conf/machine/qemumips.conf
> >> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE =3D "vmlinux"
> >>  KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
> >>
> >>  SERIAL_CONSOLE =3D "115200 ttyS0"
> >> -
> >> -MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
> >> diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qem=
umips64.conf
> >> index b2c7998..7ba98cb 100644
> >> --- a/meta/conf/machine/qemumips64.conf
> >> +++ b/meta/conf/machine/qemumips64.conf
> >> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE =3D "vmlinux"
> >>  KERNEL_ALT_IMAGETYPE =3D "vmlinux.bin"
> >>
> >>  SERIAL_CONSOLE =3D "115200 ttyS0"
> >> -
> >> -MACHINE_EXTRA_RRECOMMENDS =3D " kernel-modules"
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIoLqUACgkQN1Ujt2V2gBxi2gCfYkdhB5SRbHGImFuTjTipcsXj
0lYAoIecSz6qZU2brdnbnYOSTdLQgHvz
=5IQK
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
