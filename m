Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TG9DU-0003MB-6A; Mon, 24 Sep 2012 16:00:56 +0200
Received: by bkcjk7 with SMTP id jk7so543624bkc.6
	for <multiple recipients>; Mon, 24 Sep 2012 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1BxdDhJ9jgl+zxVpb6KXL9D6M8ElTryE2xT3j/LjJ4M=;
	b=BiYWVKen+EzCCJL+gIH45Kv+IxIgBO2CZpmgHX/QQNUjP7EI3i4ALquLytDKMjENd6
	lHvLRamc1s/uR54wUV0EasKxCSlprpswLY5lzuIC+MSHKVBaz8fOXyjxdQKehFPdGJzd
	XSOpQlUJEj8UQWi2BG7B92ibRAPNzS4gU+blxCQrmFaE3w2MeBz1rFrfSkGKznCXVR/T
	BUJOIaJwdIw2v6MyQ89Jdmya0Arl//Gm5DH7OWyidWVDvT7R/H4PqO0pM4N5N7tnO3xQ
	TqZJc6h36v+0V6gHCkdEHbzjli6S5u2NTk5RNgAOURynq9iD0oQ7HoAT0X7nwxkvb4br
	sfsw==
Received: by 10.204.156.208 with SMTP id y16mr4715564bkw.76.1348494488146;
	Mon, 24 Sep 2012 06:48:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p2sm10486547bkw.3.2012.09.24.06.48.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 06:48:06 -0700 (PDT)
Date: Mon, 24 Sep 2012 15:48:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: philb@gnu.org
Message-ID: <20120924134810.GC3295@jama.jama.net>
References: <20120924103553.BC0E91038B@opal>
MIME-Version: 1.0
In-Reply-To: <20120924103553.BC0E91038B@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Phil Blundell : libcap: respect ${base_sbindir}
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
X-List-Received-Date: Mon, 24 Sep 2012 14:00:56 -0000
X-Groupsio-MsgNum: 29780
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline

--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 10:35:53AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3dffb9f577b794e8b78fb884adf9a15c45965bc4
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3dffb9f577b794e8b78fb884adf9a15c45965bc4
>=20
> Author: Phil Blundell <philb@gnu.org>
> Date:   Sat Sep 22 14:25:19 2012 +0100
>=20
> libcap: respect ${base_sbindir}
>=20
> Need to pass the path explicitly to "make install" to ensure that the bin=
aries end up
> in the right locations.
>=20
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-support/libcap/libcap.inc     |    2 +-
>  meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-suppor=
t/libcap/libcap.inc
> index 5d7291e..bfaeffd 100644
> --- a/meta/recipes-support/libcap/libcap.inc
> +++ b/meta/recipes-support/libcap/libcap.inc
> @@ -43,7 +43,7 @@ do_compile() {
>  }
> =20
>  do_install() {
> -	oe_runmake install DESTDIR=3D"${D}" prefix=3D"${prefix}"
> +	oe_runmake install DESTDIR=3D"${D}" prefix=3D"${prefix}" SBINDIR=3D"${D=
}${base_sbindir}"
>  }

This breaks packaging:

/sbin/capsh /sbin/getcap /sbin/getpcaps /sbin/setcap
were moved from /usr/sbin/ and now are included in PN instead of PN-bin

As side-effect debian.bbclass does not provide libpcap2 anymore.

Here is relevant buildhistory commit:
https://github.com/shr-distribution/buildhistory/commit/5e8be2eb2984847e97e=
62bc0ca9292378fe72363

Cheers,

>  do_install_append() {
> diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-su=
pport/libcap/libcap_2.22.bb
> index b631c51..d57c102 100644
> --- a/meta/recipes-support/libcap/libcap_2.22.bb
> +++ b/meta/recipes-support/libcap/libcap_2.22.bb
> @@ -1,6 +1,6 @@
>  require libcap.inc
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  SRC_URI[md5sum] =3D "b4896816b626bea445f0b3849bdd4077"
>  SRC_URI[sha256sum] =3D "e1cae65d8febf2579be37c255d2e058715785ead481a4e6a=
4357a06aff84721f"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBgZJoACgkQN1Ujt2V2gBzedgCfaUeq0dX6gHnkug59AP+zTGGZ
7EUAnRwx2D4Hev8I/RGTODc487C/hAeP
=ik2/
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
