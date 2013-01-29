Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U0AVa-0005VE-BE; Tue, 29 Jan 2013 13:42:01 +0100
Received: by mail-da0-f54.google.com with SMTP id n2so203124dad.13
	for <multiple recipients>; Tue, 29 Jan 2013 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wHDbKaY+RS3PkiHVKetaFcOU8lS/7tMu5Zqqo/LGKQk=;
	b=KnWQzS3R+Fnv/NKAYSNH4FHYoEl18cjl6QOPKumVXW/EWnXq8FyJqO7ucAqnfD+E1D
	PL70pOnb5/ffF8mPdkiShzxVM9SfdiMLNfvMWTz1jYWbkkin8i9XslpA6TJty6xzPQoM
	d57r/OpXjodQr/jHMEZ7odSABHAtKksnhMocGus2LPY7siEKpYiCT/4aPVGCW76f/CjG
	FI/NAmozk+3GZsgHEaOtt8b59mBT/2kIkNiWcdgMMtZAHExy4lZpd+BDsr/WSbq4mu2N
	VBwpxgSwrhIDqT7yFesPCvbGfxOxI8jAbfKwGdKoCs032afalvQjSNCuzuBv8UG6HmwY
	eLHw==
X-Received: by 10.66.74.197 with SMTP id w5mr2153567pav.60.1359462368975;
	Tue, 29 Jan 2013 04:26:08 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rv8sm8330296pbc.27.2013.01.29.04.26.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:26:07 -0800 (PST)
Date: Tue, 29 Jan 2013 13:26:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130129122603.GM16904@jama.palm1.palmone.com>
References: <20130128123711.3E37E10396@opal>
MIME-Version: 1.0
In-Reply-To: <20130128123711.3E37E10396@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Saul Wold : dhcp: Update to 4.2.5
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
X-List-Received-Date: Tue, 29 Jan 2013 12:42:03 -0000
X-Groupsio-MsgNum: 34635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ngshnjhd05HsCES+"
Content-Disposition: inline

--ngshnjhd05HsCES+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 12:37:10PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: fb1a7cf8ac1b5ab8047f47ace28775685ba28804
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dfb1a7cf8ac1b5ab8047f47ace28775685ba28804
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Wed Jan 23 13:26:11 2013 -0800
>=20
> dhcp: Update to 4.2.5
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Brings new QA warnings:
dhcp-4.2.5: dhcp: Files/directories were installed but not shipped
  /etc/dhclient.conf.example
  /etc/dhcpd.conf.example

Cheers,

>=20
> ---
>=20
>  .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
>  .../fix-client-path.patch                          |    0
>  .../fix-external-bind.patch                        |    0
>  .../fixincludes.patch                              |    0
>  .../link-with-lcrypto.patch                        |    0
>  .../{dhcp-4.2.4-P2 =3D> dhcp-4.2.5}/noattrmode.patch |    0
>  .../dhcp/{dhcp-4.2.4-P2 =3D> dhcp-4.2.5}/site.h      |    0
>  .../dhcp/{dhcp_4.2.4-P2.bb =3D> dhcp_4.2.5.bb}       |    4 ++--
>  8 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/dhcp-3.0.3-dhcl=
ient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/dhcp-3.0.3-dhcl=
ient-dbus.patch
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/dhcp-3.0.3-dhcli=
ent-dbus.patch
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/dhcp-3.0.3-dhclient-d=
bus.patch
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-client-path=
=2Epatch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-client-path.patch
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-client-path.=
patch
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-client-path.patch
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-external-bi=
nd.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-external-bind.patch
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fix-external-bin=
d.patch
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/fix-external-bind.pat=
ch
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fixincludes.pat=
ch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixincludes.patch
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/fixincludes.patch
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/fixincludes.patch
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/link-with-lcryp=
to.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/link-with-lcrypto.patch
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/link-with-lcrypt=
o.patch
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/link-with-lcrypto.pat=
ch
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/noattrmode.patc=
h b/meta/recipes-connectivity/dhcp/dhcp-4.2.5/noattrmode.patch
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/noattrmode.patch
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/noattrmode.patch
> diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/site.h b/meta/r=
ecipes-connectivity/dhcp/dhcp-4.2.5/site.h
> similarity index 100%
> rename from meta/recipes-connectivity/dhcp/dhcp-4.2.4-P2/site.h
> rename to meta/recipes-connectivity/dhcp/dhcp-4.2.5/site.h
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb b/meta/recip=
es-connectivity/dhcp/dhcp_4.2.5.bb
> similarity index 62%
> rename from meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
> rename to meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
> index c1efad1..af60763 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5.bb
> @@ -8,5 +8,5 @@ SRC_URI +=3D "file://fixincludes.patch \
>              file://link-with-lcrypto.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "fe36056f2d274fa4b82a5422f192e65f"
> -SRC_URI[sha256sum] =3D "0f75170e323cd9573e6e09a5d9236725f3e56e3cac5a70a0=
1fe2a9d76b436499"
> +SRC_URI[md5sum] =3D "6489e919ac093d17249270ee9be1020e"
> +SRC_URI[sha256sum] =3D "771a5cffb1fd1392d25926e22e1c58a006e2ad02ecd77d13=
6096e5e366a5b6bc"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ngshnjhd05HsCES+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEHv9sACgkQN1Ujt2V2gBwEvgCgs653laDzCh/N69Ojn0Jbim4v
RsQAoIMIoj8sko8RQCuDP+/7rw7FXOOX
=T7ph
-----END PGP SIGNATURE-----

--ngshnjhd05HsCES+--
