Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UDatB-0004AH-B1; Thu, 07 Mar 2013 14:29:44 +0100
Received: by mail-pa0-f51.google.com with SMTP id hz1so460646pad.24
	for <multiple recipients>; Thu, 07 Mar 2013 05:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=vZWJ1uDhR2XMCWRAdcv4X3WI5+JBltykRxwTOS/4+C8=;
	b=LfT1CpdyamfuioVYA1NxMjreg1KzuYa/E9Xwm5qTmu+Nx3oZ6UIARC6Dw4+dN6wsuM
	Wy7W6zLIrkQwvcbBz0eI8YaTnZcdLm18CmKuDClIJ+ogzaCWaltD0weeRDlihqcGgIjq
	jyTehLUSvJJ2eDqell1lc3/KWIGNz9ni9hLvr32aoLjP3u16geVlJdumhlnIV/2lIWuO
	WgQzWDYxN87dTk266tY64VcExSBElWr8KYx46zbtcSMEInwcdiD8nqpUceF+3L2Td9hU
	g5fAjAiVDJYZWL3wn5HtYa6r21d8/h7+QMZ7+C/p1gp0s045vB3VIomXElP/HLbttGBM
	RA3w==
X-Received: by 10.66.254.233 with SMTP id al9mr2837280pad.116.1362661987868;
	Thu, 07 Mar 2013 05:13:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vq9sm1669924pbc.36.2013.03.07.05.13.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 05:13:06 -0800 (PST)
Date: Thu, 7 Mar 2013 14:13:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20130307131301.GJ32228@jama.dyndns-home.com>
References: <20130307111408.E14C2503A2@opal>
MIME-Version: 1.0
In-Reply-To: <20130307111408.E14C2503A2@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : connman: upgrade to 1.12
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
X-List-Received-Date: Thu, 07 Mar 2013 13:29:47 -0000
X-Groupsio-MsgNum: 36302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0FRtVia6Q6lt+M0P"
Content-Disposition: inline

--0FRtVia6Q6lt+M0P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 11:14:08AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: bd94ab11bbb6501013ed27ecb22685664816986c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dbd94ab11bbb6501013ed27ecb22685664816986c
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Mon Mar  4 19:17:49 2013 +0200
>=20
> connman: upgrade to 1.12
>=20
> - 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch no longe=
r needed;
> fix included in package source code
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-connectivity/connman/connman.inc      |    2 +-
>  ...If-there-is-no-d_type-support-use-fstatat.patch |   55 --------------=
------
>  .../connman/{connman_1.10.bb =3D> connman_1.12.bb}   |    5 +-
>  3 files changed, 3 insertions(+), 59 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index db4d26c..04b21f7 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>              "
> =20
> -INC_PR =3D "r18"
> +INC_PR =3D "r0"

If this .inc file is reused by some other connman versions (e.g. .bb in
other layers) this will make PR going backwards for them.

It's OK to reset PR when changing PV, but please don't reset INC_PR too.

>  TIST =3D "--enable-tist"
>  TIST_powerpc =3D ""
> diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-=
there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/co=
nnman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
> deleted file mode 100644
> index 7315545..0000000
> --- a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-i=
s-no-d_type-support-use-fstatat.patch
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00 2001
> -From: Andrei Gherzan <andrei@gherzan.ro>
> -Date: Tue, 17 Jul 2012 16:07:17 +0300
> -Subject: [PATCH V3 2/2] storage.c: If there is no d_type support use
> - fstatat()
> -
> -This is useful for filesystems where d_type is always DT_UNKNOWN.
> -In this case use fstatat() function.
> -
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -Upstream-Status: Submitted
> -=20
> ----
> - src/storage.c |   19 +++++++++++++++++++
> - 1 file changed, 19 insertions(+)
> -
> -Index: git/src/storage.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/src/storage.c
> -+++ git/src/storage.c
> -@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
> -=20
> - 		switch (d->d_type) {
> - 		case DT_DIR:
> --		case DT_UNKNOWN:
> - 			/*
> - 			 * If the settings file is not found, then
> - 			 * assume this directory is not a services dir.
> -@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
> - 			ret =3D stat(str, &buf);
> - 			g_free(str);
> - 			if (ret < 0)
> -+				continue;
> -+
> -+			g_string_append_printf(result, "%s/", d->d_name);
> -+			break;
> -+		case DT_UNKNOWN:
> -+			/*
> -+			 * If there is no d_type support use fstatat()
> -+			 * to check if directory
> -+			 */
> -+			ret =3D fstatat(dirfd(dir), d->d_name, &buf, 0);
> -+			if (ret < 0)
> -+				continue;
> -+			if (!(buf.st_mode & S_IFDIR))
> -+				continue;
> -+			str =3D g_strdup_printf("%s/%s/settings", STORAGEDIR,
> -+							d->d_name);
> -+			ret =3D stat(str, &buf);
> -+			g_free(str);
> -+			if (ret < 0)
> - 				continue;
> -=20
> - 			g_string_append_printf(result, "%s/", d->d_name);
> diff --git a/meta/recipes-connectivity/connman/connman_1.10.bb b/meta/rec=
ipes-connectivity/connman/connman_1.12.bb
> similarity index 74%
> rename from meta/recipes-connectivity/connman/connman_1.10.bb
> rename to meta/recipes-connectivity/connman/connman_1.12.bb
> index 7dca1b4..5ba4032 100644
> --- a/meta/recipes-connectivity/connman/connman_1.10.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.12.bb
> @@ -1,12 +1,11 @@
>  require connman.inc
> =20
> -# 1.10 tag
> -SRCREV =3D "3bda76eb442c9395db1dba17352c3e78376671cc"
> +# 1.12 tag
> +SRCREV =3D "8397cbbc0a79d39cf3b1880f4fd3f3405b6bc6ad"
>  SRC_URI  =3D "git://git.kernel.org/pub/scm/network/connman/connman.git \
>              file://0001-plugin.h-Change-visibility-to-default-for-debug-=
symb.patch \
>              file://add_xuser_dbus_permission.patch \
>              file://connman \
> -            file://0002-storage.c-If-there-is-no-d_type-support-use-fsta=
tat.patch \
>              file://inet-fix-ip-cleanup-functions.patch \
>              file://add-in.h-for-ipv6.patch"
>  S =3D "${WORKDIR}/git"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0FRtVia6Q6lt+M0P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4kl0ACgkQN1Ujt2V2gBwSoQCfXYsfBH4lKTi81LRdnBXWYcKb
dr8An0ISKPALlHPZSaTnDGWMS1qUIPX2
=Vy5Y
-----END PGP SIGNATURE-----

--0FRtVia6Q6lt+M0P--
