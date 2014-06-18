Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 61A556FD62;
	Wed, 18 Jun 2014 08:03:42 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so440583wes.1
	for <multiple recipients>; Wed, 18 Jun 2014 01:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d0g3kkXgi55ERlkWUGbg6dXn1rVjwmyWuZ8+2pEfueE=;
	b=NTQrd9iAqdt/IieGu69tei6lm/7EJLUdRDd0pyJoKEpf16eq5tGZeIky9GIqxQyD0N
	jNlJG6NIk67FhZTQu8OaDO+vywRaZsqtwWNGLCRog2YxsAKQGSdfbMmDotMeXrWqW3a9
	XAzX49y05cwOONWTrZPvisnmixjgG6PJeNqChDemRpYlLbx2AC4StDAbzLcODjWGvhob
	J/1MEv5PqOB+rBbPyNJJmvHWzW39y0KBYBZakVSbmHqmdeEGEPWQsBmzJFXVxyYEybBl
	kg4nb1zBywM1vVXKP6QF0UYp0Q9jeeBDLKDNrYtfhDVISz2y+EG/FoyG8aSw0+rKTbzN
	gFSQ==
X-Received: by 10.180.83.105 with SMTP id p9mr3010101wiy.8.1403078623567;
	Wed, 18 Jun 2014 01:03:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h6sm3717689eew.38.2014.06.18.01.03.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jun 2014 01:03:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Jun 2014 10:03:42 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140618080342.GF2117@jama>
References: <20140617075959.D3DE350478@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140617075959.D3DE350478@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : dbus-native: dbus-native: do_compile failed on selinux.c on CentOS 5.10
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
X-List-Received-Date: Wed, 18 Jun 2014 08:03:53 -0000
X-Groupsio-MsgNum: 54235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Content-Disposition: inline

--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 07:59:59AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 7a2d2d81d8694806060f7bccfbdba42dc356d477
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D7a2d2d81d8694806060f7bccfbdba42dc356d477
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Mon May 26 21:39:46 2014 -0400
>=20
> dbus-native: dbus-native: do_compile failed on selinux.c on CentOS 5.10
>=20
> Found this error on CentOS 5.10, other distros may also has this
> problem, I think that we can disable the selinux for dbus-native:
>=20
> bus/selinux.c:327: error: array type has incomplete element type

This actually breaks dbus-native compilation for others, because it enables=
 docs

| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| make[2]: *** [dbus-monitor.1] Error 3
| make[2]: *** Waiting for unfinished jobs....
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| make[2]: *** [dbus-faq.html] Error 3
| make[2]: *** [dbus-uuidgen.1] Error 3
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| make[2]: *** [dbus-daemon.1] Error 3
| make[2]: *** [dbus-launch.1] Error 3
| make[2]: *** [dbus-send.1] Error 3
| xmlto: Can't continue, xsltproc tool not found or not executable.
| xmlto: xmllint validation tool not found or not executable.
| xmlto: Skipping validation...  Please make sure xmllint is installed.
| xmlto: Can't continue, xsltproc tool not found or not executable.
| make[2]: *** [dbus-cleanup-sockets.1] Error 3
| make[2]: *** [dbus-run-session.1] Error 3
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/dbus-native/1.8.2-r0/build/doc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/dbus-native/1.8.2-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/dbus-native/1.8.=
2-r0/temp/log.do_compile.2550)
NOTE: recipe dbus-native-1.8.2-r0: task do_compile: Failed


>=20
> [YOCTO #6374]
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/dbus/dbus.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index 5b2a056..01108c9 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -86,6 +86,8 @@ EXTRA_OECONF =3D "--disable-tests \
>                  --disable-systemd \
>                  --without-dbus-glib"
> =20
> +EXTRA_OECONF_class-native =3D "--disable-selinux"
> +
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
>  PACKAGECONFIG_class-native =3D ""
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOhR94ACgkQN1Ujt2V2gBwpSwCeLHdxv9NZWTzELgXSmh4nbCyx
H5UAn0kXxuHWrj3UH5lG4h2j8ndGMt39
=x2Fj
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--
