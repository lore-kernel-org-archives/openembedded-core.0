Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1THLGl-0001uQ-4v; Thu, 27 Sep 2012 23:05:15 +0200
Received: by wibhj13 with SMTP id hj13so688238wib.6
	for <multiple recipients>; Thu, 27 Sep 2012 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wjJeaJ+qlwhpotxfrtdX7Q/1nORJi8iZ66TUdVZCx54=;
	b=uT+dpJ55JqLfzq+ERmYV2arbI4f6GsImEBQ+4pZm7q5K5019lsIxTrsNaSOoG6R+ds
	E34OUc4Xk/2tAFCfBvBHa2GHjxkUioGo1hS70MwP2jwyQ0fB3LWdzMKxBM+bnFoYNxeH
	9QVes75jA50aa6GkYO/Zh0akwwUvGrnzXlQlx0G0SNTitMba2WwApZuRXIMqClno2ITS
	vDSF4TEYGeM+C/bLhK49GMX+hmjIVKhlvUY5CKETharmBW1yxHQwLq1VkoT4XyLmY7X/
	Ak0t0upRGQdDMWQ27gBx9jm4xTh5izZ425QcgBneDTr1D6Nxfu97od1C0fz0A6QYG/hY
	wfIw==
Received: by 10.180.73.76 with SMTP id j12mr10734304wiv.11.1348779142878;
	Thu, 27 Sep 2012 13:52:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm33062194wib.6.2012.09.27.13.52.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 13:52:21 -0700 (PDT)
Date: Thu, 27 Sep 2012 22:52:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <20120927205231.GJ3454@jama.jama.net>
References: <20120817170934.A810F1032B@opal>
MIME-Version: 1.0
In-Reply-To: <20120817170934.A810F1032B@opal>
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
X-List-Received-Date: Thu, 27 Sep 2012 21:05:15 -0000
X-Groupsio-MsgNum: 30032
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Content-Disposition: inline

--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 05:09:34PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b97e37e1444ef32e7837dcc79e3fad36c4284b65
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db97e37e1444ef32e7837dcc79e3fad36c4284b65
>=20
> Author: Andrei Gherzan <andrei@gherzan.ro>
> Date:   Fri Aug 17 00:15:15 2012 +0300
>=20
> busybox: Package hwclock.sh initscript separately
>=20
> We package this separately to be able to pull this in only if this makes
> sense for the MACHINE.
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-core/busybox/busybox.inc |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 78239a2..5a5b383 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -14,15 +14,16 @@ SECTION =3D "base"
>  export EXTRA_CFLAGS =3D "${CFLAGS}"
>  export EXTRA_LDFLAGS =3D "${LDFLAGS}"
> =20
> -PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-=
mdev"
> +PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-=
mdev ${PN}-hwclock"
> =20
>  FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
>  FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslo=
g-startup.conf*"
>  FILES_${PN}-mdev =3D "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
>  FILES_${PN}-udhcpd =3D "${sysconfdir}/init.d/busybox-udhcpd"
>  FILES_${PN}-udhcpc =3D "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> +FILES_${PN}-hwclock =3D "${sysconfdir}/init.d/hwclock.sh"
> =20
> -INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mde=
v"
> +INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mde=
v ${PN}-hwclock""
> =20
>  INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
>  INITSCRIPT_NAME_${PN}-syslog =3D "syslog"

Missing=20
INITSCRIPT_NAME_${PN}-hwclock =3D "hwclock.sh"
?

Did you test it?=20

Here it fails like this:
Configuring busybox-hwclock.
usage: update-rc.d [-n] [-f] [-r <root>] <basename> remove
       update-rc.d [-n] [-r <root>] [-s] <basename> defaults [NN | sNN kNN]
       update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl [r=
unlvl] [...] .
                -n: not really
                -f: force
                -v: verbose
                -r: alternate root path (default is /)
                -s: invoke start methods if appropriate to current runlevel
Collected errors:
 * pkg_run_script: package "busybox-hwclock" postinst script returned statu=
s 1.
 * opkg_configure: busybox-hwclock.postinst returned 1.

And indeed it's broken:
SHR root@qemux86-64 ~ $ cat /var/lib/opkg/info/busybox-hwclock.postinst
#!/bin/sh
if test "x$D" !=3D "x"; then
        OPT=3D"-r $D"
else
        OPT=3D"-s"
fi
update-rc.d $OPT ${INITSCRIPT_NAME} defaults

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBkvI8ACgkQN1Ujt2V2gBzV9QCghF+vQ5D89f6qtZ/z6JdjqnBd
KiYAn2N0nnavphLvxaHD5qmHDNen7Vy7
=uGRl
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--
