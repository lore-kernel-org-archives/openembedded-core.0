Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAj2i-0001v9-Ij
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:31:08 +0100
Received: by wibhj13 with SMTP id hj13so740095wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Msg1ShzjNkVs7Z7DZiOR/jND+/d1KTt8wopNAzBamg8=;
	b=b+VY2B5qq7vbR9FoEHQkgPHyoM06p/fjCJB8bJrrlvmn3CY64hhDUGYiCI4tn/pNdX
	eqxcuNmqMCNHiMx5+hJKljT734mNP8ICLTmZ5B3fDec7qYQ6fu5KNrXtGT1M3MnbNe9s
	jQl/U5yYvKsdlZg/9gfq51xvH6ZPnvfHdTgj2YMA6sHTgnS8BxAdP8u2viDB0SlhlfRP
	Zp1st0kLQ0a/uPZ6JPeL3wyYQA5onquv0iEOBih1tKQ97b3IhkbrLH9ZP+KMzf0FxApn
	H1L4qF4MrtShgVmf3rxK+AoV6KYBNEPYD9w+BkkcVq8Lk+S7Uub2ghcvichSWWMoHV+T
	rkUA==
Received: by 10.180.80.70 with SMTP id p6mr5451578wix.21.1332426133566;
	Thu, 22 Mar 2012 07:22:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm5616523wib.1.2012.03.22.07.22.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 07:22:12 -0700 (PDT)
Date: Thu, 22 Mar 2012 15:22:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120322142212.GI4010@jama.jama.net>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/7] bitbake.conf: add systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 14:31:08 -0000
X-Groupsio-MsgNum: 19427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l0l+eSofNeLXHSnY"
Content-Disposition: inline

--l0l+eSofNeLXHSnY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 12:05:56PM +0100, Andreas M=FCller wrote:
> Some of oe-core's recipes need to know where systemd units are. Since the
> directory might change in the future [1], we set the location once global=
ly to
> reduce maintenance efforts
>=20
> [1] http://www.gossamer-threads.com/lists/gentoo/dev/245758

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

for whole patchset, just lazy to reply on all :)

>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta/conf/bitbake.conf |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 07982d7..52802f6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -39,6 +39,7 @@ export libexecdir =3D "${exec_prefix}/libexec"
>  export libdir =3D "${exec_prefix}/${baselib}"
>  export includedir =3D "${exec_prefix}/include"
>  export oldincludedir =3D "${exec_prefix}/include"
> +export systemd_unitdir =3D "${base_libdir}/systemd"
> =20
>  # Linkage between native/cross/nativesdk layouts
>  base_bindir_native =3D "/bin"
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l0l+eSofNeLXHSnY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9rNZQACgkQN1Ujt2V2gBxD7ACfbZeb1R7XwGwhUXnTGWLNywjC
N5cAnj36VN+tnNs9bBuijzWsoNGJwN8f
=gu6O
-----END PGP SIGNATURE-----

--l0l+eSofNeLXHSnY--
