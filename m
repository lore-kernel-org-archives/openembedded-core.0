Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwFBh-000566-Pg
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 17:53:06 +0100
Received: by mail-pb0-f43.google.com with SMTP id jt11so762111pbb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wwJYof5GfJctzejQI9Ny0RCEYSsjYuBzQbhO4v+dxrc=;
	b=nkJ4PU1S9LEDIZZ/JPnzoajAwS0XaF/yLagEDPY7Hrg0iDsdIcWcieU/sU49hpe3CU
	cjQc4EQ6i4QWdk6BrYZJNS0kwMokCzkzJMeYKfxSH70qCWnnEbtAoq/CtFjeZTN4/3fZ
	HnsmXzzQvZyE0FB29edGjnsl/UcnB5YEuHD85GAtcKQezauuc29SFLptuOEboFUliXPB
	sGZwV+AMBeRAdMFp0KByUwU3ijT/FX1EQwCvbEQlDOCemyAKk3km97DKfxXoLLFe7IMK
	YLMVHysoBluT9+sP+kGoPU4wguTrNgmzUcPdsE591O+55Y/PWnvgi7I9DM4qP8Kd7+E9
	akDw==
X-Received: by 10.66.74.98 with SMTP id s2mr25016082pav.64.1358527060355;
	Fri, 18 Jan 2013 08:37:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rs7sm3366503pbc.2.2013.01.18.08.37.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 08:37:39 -0800 (PST)
Date: Fri, 18 Jan 2013 17:37:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Message-ID: <20130118163734.GX23233@jama.palm1.palmone.com>
References: <20130118161408.GA11224@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130118161408.GA11224@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autofs has openldap dependency issues
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
X-List-Received-Date: Fri, 18 Jan 2013 16:53:06 -0000
X-Groupsio-MsgNum: 34037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9ADF8FXzFeE7X4jE"
Content-Disposition: inline

--9ADF8FXzFeE7X4jE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 11:14:08AM -0500, Amy Fong wrote:
> commit 09947d772a36e4d2c2dc48356281bd3ce0a04b0c
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Fri Jan 18 11:10:35 2013 -0500
>=20
>     autofs: fails to compile with openldap disabled
>    =20
>     As of 5.0.6, it appears that changes were introduced so that
>     if you compile with openldap disabled and openldap headers are not
>     available, then autofs fails to build.
>    =20
>     Since autofs no longer depends on openldap, remove the dependency
>    =20
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>

I think this belongs to oe-devel ML and should be for
meta-openembedded/meta-networking not standalone meta-networking.

Cheers,

> diff --git a/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch b=
/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> new file mode 100644
> index 0000000..b62f955
> --- /dev/null
> +++ b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
> @@ -0,0 +1,40 @@
> +autofs: fails to compile with openldap disabled
> +
> +As of 5.0.6, it appears that changes were introduced so that=20
> +if you compile with openldap disabled and openldap headers are not
> +available, then autofs fails to build.
> +
> +Signed-off-by: Amy Fong <amy.fong@windriver.com>
> +--
> + lookup_ldap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +---
> + include/lookup_ldap.h |    4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +--- a/include/lookup_ldap.h
> ++++ b/include/lookup_ldap.h
> +@@ -1,7 +1,9 @@
> + #ifndef LOOKUP_LDAP_H
> + #define LOOKUP_LDAP_H
> +=20
> ++#ifdef WITH_LDAP
> + #include <ldap.h>
> ++#endif
> +=20
> + #ifdef WITH_SASL
> + #include <openssl/ssl.h>
> +@@ -109,10 +111,12 @@
> +=20
> + #define LDAP_AUTH_USESIMPLE	0x0008
> +=20
> ++#ifdef WITH_LDAP
> + /* lookup_ldap.c */
> + LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct loo=
kup_context *ctxt);
> + int unbind_ldap_connection(unsigned logopt, LDAP *ldap, struct lookup_c=
ontext *ctxt);
> + int authtype_requires_creds(const char *authtype);
> ++#endif
> +=20
> + #ifdef WITH_SASL
> + /* cyrus-sasl.c */
> diff --git a/recipes-daemons/autofs/autofs_5.0.7.bb b/recipes-daemons/aut=
ofs/autofs_5.0.7.bb
> index c1b0b46..a6683ff 100644
> --- a/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -3,7 +3,9 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> =20
> -DEPENDS +=3D "openldap libtirpc flex-native bison-native"
> +PR =3D "r1"
> +
> +DEPENDS +=3D "libtirpc flex-native bison-native"
> =20
>  inherit autotools systemd
> =20
> @@ -30,6 +32,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/daemons/autofs/v=
5/autofs-${PV}.tar.bz2 \
>             file://cross.patch \
>             file://libtirpc.patch \
>             file://libtirpc-name-clash-backout.patch \
> +           file://fix_disable_ldap.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "bc46838dece83c02d800ff144ed9f431"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9ADF8FXzFeE7X4jE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5ek4ACgkQN1Ujt2V2gBz5RwCgsdiPjiViiSqthUUrD4XtDatJ
pAoAniml+YlOdDVtph36vDhL4nGA8s3O
=Cu9W
-----END PGP SIGNATURE-----

--9ADF8FXzFeE7X4jE--
