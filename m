Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiMCx-0006aK-OW
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 10:33:00 +0100
Received: by mail-wg0-f45.google.com with SMTP id dq12so2105604wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 01:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6RKtZz1koFbgH3z7ITSjn1qxbaYUzN3tQybx2cfSmzg=;
	b=WTKBzuggvTxE1/XmafT+cdFCgGq+a8IOQcJm5+MiU+UIMy6EhAGM4sDk2QagV6NmzJ
	eM6H22Yml63RKdDzO9YQTqFzfqCkEF7nvUoSdNtj0Q+npNq3uAmMrr2aIuR8jNFk7UOO
	AwJmFjG9AkLpMr4CkglF1f3cjLrT1uhw+W7swnzpVQu88lYx/FUL0DNy5nLo7NQ59LcV
	MWU8rplvmO4srBtyRzTFNJMPlgeIEIAi+oS9Ds/LUhPQt+xiyFh0nizMpOIn+Be1vMKh
	tDWu1rX8tBTv++/rO0fxIbFB9uukteHB82PjYxKSZX7wHFq6I3GYYbsVbBKgb3AQsTIH
	GBzA==
Received: by 10.216.209.223 with SMTP id s73mr388914weo.30.1355217507571;
	Tue, 11 Dec 2012 01:18:27 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bd7sm15433842wib.8.2012.12.11.01.18.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 01:18:27 -0800 (PST)
Date: Tue, 11 Dec 2012 10:18:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ciprian Ciubotariu <cheepeero@gmx.net>
Message-ID: <20121211091841.GC11693@jama.jama.net>
References: <1354891455-6846-1-git-send-email-cheepeero@gmx.net>
MIME-Version: 1.0
In-Reply-To: <1354891455-6846-1-git-send-email-cheepeero@gmx.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagroup-base: use virtual runtime instead of keymap
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
X-List-Received-Date: Tue, 11 Dec 2012 09:33:00 -0000
X-Groupsio-MsgNum: 32490
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline

--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 07, 2012 at 04:44:15PM +0200, Ciprian Ciubotariu wrote:
> ---
>  .../packagegroups/packagegroup-base.bb             |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index 347a7e1..3e75190 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -141,7 +141,7 @@ RRECOMMENDS_packagegroup-machine-base =3D "${MACHINE_=
EXTRA_RRECOMMENDS}"
> =20
>  SUMMARY_packagegroup-base-keyboard =3D "Keyboard support"
>  RDEPENDS_packagegroup-base-keyboard =3D "\
> -    keymaps"
> +    ${VIRTUAL-RUNTIME_keymaps}"

you need to specify default value with weak assignment like
packagegroup-core-boot.bb does

Cheers,

> =20
>  SUMMARY_packagegroup-base-pci =3D "PCI bus support"
>  RDEPENDS_packagegroup-base-pci =3D "\
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDG+nEACgkQN1Ujt2V2gBzVIgCgghaFIwAIfWYcs30TjwCvj/pi
8pgAn2muluuP06EyxzsgAHCCuVNj4HzZ
=0lZG
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
