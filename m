Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id EFBE965C68;
	Tue,  1 Jul 2014 10:58:05 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id u56so9574496wes.7
	for <multiple recipients>; Tue, 01 Jul 2014 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=logznd2anjiyqr5iSvEHrdTwT4O+NwYGloWr203q0Qs=;
	b=IaJ4t+dty06dDnCY7e9g+dq3tAxtJLox0OtJZ3z1DG5CTQ0Xvs1sMH+UuUQuTXZjfR
	YbB4HIBcfOrsyfaf3xrEcZ9p3OAaJq/E/gv3m3Kv17pweCYpYUN2V33SRxEwz+yj/DkW
	i70fMLxoPPfXrxwgSUWRkotAHydo7JfaNIGjGVd2rWqX90o9ASzlFFeoVdqq1qeCyNT6
	TktoAPjUW7a330JyLLpyovZTal9RcS52PvK8AkZkKCSgjFs5corSYIq8rkC/ULMD4Vfx
	udrahEIEKKSJ+3S4eN6kNTkb8seSR7SqcJYTKDMr512p6OP93YN/IgR+lF+7q4b1falb
	Bc0A==
X-Received: by 10.180.9.71 with SMTP id x7mr35183796wia.61.1404212286479;
	Tue, 01 Jul 2014 03:58:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fn1sm42045852wib.18.2014.07.01.03.58.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 03:58:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Jul 2014 12:58:15 +0200
To: Tom King <ka6sox@gmail.com>
Message-ID: <20140701105815.GF2437@jama>
References: <20140619113451.GO2117@jama> <20140624101443.GO2437@jama>
	<CAHQecY6eQfhY4hY_EEUmXd5MEA2_fDb5yfj7YP0i1gg=dKFQ7Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHQecY6eQfhY4hY_EEUmXd5MEA2_fDb5yfj7YP0i1gg=dKFQ7Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Few archives to add on sources.oe.org
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
X-List-Received-Date: Tue, 01 Jul 2014 10:58:08 -0000
X-Groupsio-MsgNum: 54506
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gVeFDRGtAQ0W7qcm"
Content-Disposition: inline

--gVeFDRGtAQ0W7qcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2014 at 07:36:59AM -0700, Tom King wrote:
> done

Thanks,

I've found another one in daisy:

barnyard2-1.8.tar.gz

I've verified that
wget http://ftp.psu.ac.th/pub/snort/barnyard2-1.8.tar.gz
provides correct checksum or you can fetch it from aruba
(/home/jenkins/oe/world/downloads-missing).

SRC_URI[md5sum] =3D "72fc6c490db6ea6a0f46c27d24998067"
SRC_URI[sha256sum] =3D "1abfe6530d721debd98921421722b02c844c289564730b1e857=
29e4915b2bb7a"

> On Tue, Jun 24, 2014 at 3:14 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Thu, Jun 19, 2014 at 01:34:51PM +0200, Martin Jansa wrote:
> > > Hi Tom,
> > >
> > > can you please add:
> > > IO-Tty-1.10.tar.gz
> > > SQLAlchemy-0.7.9.tar.gz
> > > fetchmail-6.3.26.tar.xz
> > > usb-modeswitch-2.0.1.tar.bz2
> > > usb-modeswitch-data-20130807.tar.bz2
> > >
> > > to sources.oe.org? I can send you tarballs (or fetch them from
> > > /home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)
> > >
> > > The most annoying is fetchmail which is now fetching HTML page from
> > > berlios (so checksum check fails instead of showing 404) :/. And user
> > > needs to download it manually or use sources.oe.org as PREMIRROR, but
> > > still better than nothing.
> >
> > I've found only one more missing in upstream sites and used from dora
> > branch
> >
> > daq-2.0.1.tar.gz
> >
> > I've verified that
> > http://download.lunar-linux.org/lunar/mirrors/daq-2.0.1.tar.gz
> > provides correct checksum or you can fetch it from aruba as before.
> >
> > SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
> > SRC_URI[sha256sum] =3D
> > "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
> >
> > Thanks
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gVeFDRGtAQ0W7qcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOylEcACgkQN1Ujt2V2gBxbHgCbBmcd4ec3WEIikui1doMI2oip
zgoAnjM9sX47f0tTXvpEGsonjy65SnUu
=8jTS
-----END PGP SIGNATURE-----

--gVeFDRGtAQ0W7qcm--
