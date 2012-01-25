Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rq3Sz-0002Vj-Hx
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 15:04:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1693215eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RltqP2Ft5jADAMPq8cryqS5i6jFxZt7oPczNUvvkgtM=;
	b=WyMFq2UL9W2WjeHh5XaN9eF5KheCQAdHDtmnxJeWb7ypGIwsz/qGDwB+SkDsjwLZN4
	NGeGxJm17TTwYE8YRiVCe5cghquf+cjvFhs6jETikqqVKv2l/ec5+j6ena5eMnIJfeM0
	s2ieN4g2fO+kdJn7FbJVgOMALfqJRfzi6S+ts=
Received: by 10.14.99.71 with SMTP id w47mr5909384eef.78.1327499825261;
	Wed, 25 Jan 2012 05:57:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm1867226eeb.11.2012.01.25.05.57.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 05:57:04 -0800 (PST)
Date: Wed, 25 Jan 2012 14:57:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120125135702.GC3843@jama.jama.net>
References: <1327424970.19643.99.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1327424970.19643.99.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-cross: Don't reference machine specific variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 14:04:49 -0000
X-Groupsio-MsgNum: 16540
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline

--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 05:09:30PM +0000, Richard Purdie wrote:
> gcc-cross is installed into a package architecture specific directory
> and is not meant to be machine specific. This patch replaces MACHINE_ARCH
> with PACKAGE_ARCH to ensure this is really the case.
>=20
> This was found by examining sstate checksums.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 0b31a8c..6acf8c5 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -87,12 +87,12 @@ then
>  	exit 1
>  fi
>  	echo "lappend boards_dir [pwd]/../../.." > ${B}/site.exp
> -	echo "load_generic_config \"unix\"" > ${B}/${MACHINE_ARCH}.exp
> -	echo "set_board_info username \$user" >> ${B}/${MACHINE_ARCH}.exp
> -	echo "set_board_info rsh_prog ssh" >> ${B}/${MACHINE_ARCH}.exp
> -	echo "set_board_info rcp_prog scp" >> ${B}/${MACHINE_ARCH}.exp
> -	echo "set_board_info hostname \$target" >> ${B}/${MACHINE_ARCH}.exp
> -	DEJAGNU=3D${B}/site.exp make -k check RUNTESTFLAGS=3D"--target_board=3D=
${MACHINE_ARCH}\$@"
> +	echo "load_generic_config \"unix\"" > ${B}/${PACKAGE_ARCH}.exp
> +	echo "set_board_info username \$user" >> ${B}/${PACKAGE_ARCH}.exp
> +	echo "set_board_info rsh_prog ssh" >> ${B}/${PACKAGE_ARCH}.exp
> +	echo "set_board_info rcp_prog scp" >> ${B}/${PACKAGE_ARCH}.exp
> +	echo "set_board_info hostname \$target" >> ${B}/${PACKAGE_ARCH}.exp
> +	DEJAGNU=3D${B}/site.exp make -k check RUNTESTFLAGS=3D"--target_board=3D=
${PACKAGE_ARCH}\$@"
> =20
>  STOP
> =20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8gCi4ACgkQN1Ujt2V2gBy23wCgsvmrRXTISUfRRhVCJ2uVDDv8
/0cAnjmxbI2Xz0xBInDkF3Kn4pZMbJhn
=J+tX
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--
