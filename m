Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 56D54771CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:29:02 +0000 (UTC)
Received: by wmww144 with SMTP id w144so194147236wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w/5OWSAzCbSIH7Hh43UqxuwXPX0DYu6ErZ/6RDa1yaM=;
	b=YKvk1ZEmA2HwKaT+y110AsVS/xONcsb0t/Z2qzbDZLiO7uQ83UynzaD9W4JoVygpR6
	cIMFdofV9B8sfuuRBYAbFhfoR9yYm3vacESojuOrqCnjt+yToUbamHkxsmra1kjk/JPW
	/Qtr1E9RgUI6tWCiL15nlgOslbPgPJ3imvdJL8rB3z+CbQpFgpnJ+3q0mHOuEaU0wM+/
	8k5bzT9CQl4HTIk5aAAjxkb8IthdE9guWcoHtOHJg5EGv5gc1gFAXxsHzMAW743AITDX
	ed7fRTiUNWGKyFPD5KyWqkyZKFFU25i1h2AaPXuhFCZMvsR37QJ1bfEyk5pjAFptsZyE
	6GVw==
X-Received: by 10.194.172.162 with SMTP id bd2mr14782551wjc.140.1447324142162; 
	Thu, 12 Nov 2015 02:29:02 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l81sm14280703wmb.2.2015.11.12.02.29.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 02:29:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 11:29:17 +0100
To: Joe Slater <jslater@windriver.com>
Message-ID: <20151112102917.GB2574@jama>
References: <1447194514-8949-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1447194514-8949-1-git-send-email-jslater@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libsecret: add dependency on intltool-native
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
X-List-Received-Date: Thu, 12 Nov 2015 10:29:03 -0000
X-Groupsio-MsgNum: 73289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2015 at 02:28:34PM -0800, Joe Slater wrote:
> intltoolize is needed by configure.
>=20

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

I've sent the same fix to meta-oe, before libsecret was moved to
oe-core:
http://patchwork.openembedded.org/patch/92621/
http://patchwork.openembedded.org/patch/92615/

> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-gnome/libsecret/libsecret_0.18.2.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/reci=
pes-gnome/libsecret/libsecret_0.18.2.bb
> index 8fc0018..a1dcc78 100644
> --- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
> +++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D23c2a5e0106b99=
d75238986559bb5fc6"
> =20
>  inherit gnomebase gtk-doc
> =20
> -DEPENDS =3D "glib-2.0 libgcrypt gettext-native"
> +DEPENDS =3D "glib-2.0 libgcrypt gettext-native intltool-native"
> =20
>  EXTRA_OECONF +=3D "--disable-manpages"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZEaf0ACgkQN1Ujt2V2gBw60ACgl/Q8/InteDPdUV/MeehSGrOe
hv0An0aEh+lMwshpus1zvFS6TCMhapTN
=Rg0q
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
