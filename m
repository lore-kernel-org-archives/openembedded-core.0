Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TJ5iC-0006jl-9q; Tue, 02 Oct 2012 18:52:48 +0200
Received: by wgbdq11 with SMTP id dq11so4252816wgb.24
	for <multiple recipients>; Tue, 02 Oct 2012 09:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c/g6wswWqSA62wroXEpJkqM7YL33aPeTauNHmJb9EXQ=;
	b=iYWlP+qmbNKJANNMNxr4Vkz4Qp6ZxRNzfvCWt934WhW+OPVsSP6CChCZHHnVuLFZ7l
	B9avj4eSGzH7w5CtSO3vg6bmjgJQXXivm+W5QdBeJ1D0e7I2dW5zP/ykk4bXRl9zPdPJ
	hR3+2n+hmj/SFWyswFoUlcb5lLKgMQ8L5Bpri3zd4EoAHCY5HmMmRAM6IAl8forhAr3a
	q60Ew8lY9efM8PlHFIblAsBmv3ZXAOIvhaPMmCsFTdBrXhh5AIaAglhqTpZKWGf3q2ia
	+sM161KjURpdiJSdzV7uj2VoFxuvQUdlarSVoJtcai3DIWJDNuDGrJxlogPdQVT9NgOv
	reQg==
Received: by 10.216.145.88 with SMTP id o66mr10349287wej.169.1349195989765;
	Tue, 02 Oct 2012 09:39:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg4sm3222349wib.6.2012.10.02.09.39.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Oct 2012 09:39:48 -0700 (PDT)
Date: Tue, 2 Oct 2012 18:39:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <20121002163947.GA15881@jama.jama.net>
References: <20120817170934.A810F1032B@opal>
	<20120927205231.GJ3454@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120927205231.GJ3454@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : busybox: Package hwclock.sh initscript separately
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Oct 2012 16:52:48 -0000
X-Groupsio-MsgNum: 30250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 10:52:31PM +0200, Martin Jansa wrote:
> On Fri, Aug 17, 2012 at 05:09:34PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: b97e37e1444ef32e7837dcc79e3fad36c4284b65
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3Db97e37e1444ef32e7837dcc79e3fad36c4284b65
> >=20
> > Author: Andrei Gherzan <andrei@gherzan.ro>
> > Date:   Fri Aug 17 00:15:15 2012 +0300
> >=20
> > busybox: Package hwclock.sh initscript separately
> >=20
> > We package this separately to be able to pull this in only if this makes
> > sense for the MACHINE.
> >=20
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >=20
> > ---
> >=20
> >  meta/recipes-core/busybox/busybox.inc |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/=
busybox/busybox.inc
> > index 78239a2..5a5b383 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -14,15 +14,16 @@ SECTION =3D "base"
> >  export EXTRA_CFLAGS =3D "${CFLAGS}"
> >  export EXTRA_LDFLAGS =3D "${LDFLAGS}"
> > =20
> > -PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN=
}-mdev"
> > +PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN=
}-mdev ${PN}-hwclock"
> > =20
> >  FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
> >  FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog* ${sysconfdir}/sys=
log-startup.conf*"
> >  FILES_${PN}-mdev =3D "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.con=
f"
> >  FILES_${PN}-udhcpd =3D "${sysconfdir}/init.d/busybox-udhcpd"
> >  FILES_${PN}-udhcpc =3D "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> > +FILES_${PN}-hwclock =3D "${sysconfdir}/init.d/hwclock.sh"
> > =20
> > -INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-m=
dev"
> > +INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-m=
dev ${PN}-hwclock""
> > =20
> >  INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
> >  INITSCRIPT_NAME_${PN}-syslog =3D "syslog"
>=20
> Missing=20
> INITSCRIPT_NAME_${PN}-hwclock =3D "hwclock.sh"
> ?
>=20
> Did you test it?=20
>=20
> Here it fails like this:
> Configuring busybox-hwclock.
> usage: update-rc.d [-n] [-f] [-r <root>] <basename> remove
>        update-rc.d [-n] [-r <root>] [-s] <basename> defaults [NN | sNN kN=
N]
>        update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl =
[runlvl] [...] .
>                 -n: not really
>                 -f: force
>                 -v: verbose
>                 -r: alternate root path (default is /)
>                 -s: invoke start methods if appropriate to current runlev=
el
> Collected errors:
>  * pkg_run_script: package "busybox-hwclock" postinst script returned sta=
tus 1.
>  * opkg_configure: busybox-hwclock.postinst returned 1.
>=20
> And indeed it's broken:
> SHR root@qemux86-64 ~ $ cat /var/lib/opkg/info/busybox-hwclock.postinst
> #!/bin/sh
> if test "x$D" !=3D "x"; then
>         OPT=3D"-r $D"
> else
>         OPT=3D"-s"
> fi
> update-rc.d $OPT ${INITSCRIPT_NAME} defaults
>=20
> Cheers,

Fixed now in master
Module: openembedded-core.git                                              =
                                                        =20
Branch: master                                                             =
                                                        =20
Commit: 43b4ffc11874803db37c43b521ce27c51c677c8b                           =
                                                                           =
       =20
URL:
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3D43b4f=
fc11874803db37c43b521ce27c51c677c8b                   =20
                                                                           =
                                  =20
Author: Richard Purdie <richard.purdie@linuxfoundation.org>                =
                                  =20
Date:   Tue Oct  2 17:24:08 2012 +0100                                     =
                                  =20


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBrGNMACgkQN1Ujt2V2gBxSbgCgh5ctvjNL2YC+g3NvWF230B9J
G2UAnjoinXvSkmXl4sVfx25zjx7rn11W
=+O6X
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
