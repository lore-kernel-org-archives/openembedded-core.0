Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE1F6D75A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 08:12:32 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so28986eak.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 00:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F/VLqN+2xORNGAm9d+0OHVGAnvfl/KYM1P4X/NhOrB4=;
	b=DBgaYSyYXZ87z9XZpnRuPTSY1kCNyWi8Lo9PcQizVVoUmyY7o9NpEsJMF1hYIVgnSr
	a5ydzZ8JVn4mPqSALfXEOhlmNFkkOFDVIw/7jZZbVFwPF1ix1a/D3Ec97FoyU4pBvura
	2X8JA7pqBFXddFSB+xXh/U9H2x4DTkLDWlianyh7i4s1ZNlq1YU9Pd8g43sryjNfTr9U
	4vj3ZlmiRxv7I4cqEo9FLGCMuKupx3s8Mkeq1MAdDHjAQOQrTgGVmwU5aVTNd3hvZBop
	iRyZPWCDlf4qitDJg0LWHlUmtE4hxSfPw61/XkXYbEgQiE4DlAgJmJXvPWjmjExqHPT0
	QFNw==
X-Received: by 10.15.76.8 with SMTP id m8mr935587eey.86.1384330353545;
	Wed, 13 Nov 2013 00:12:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w6sm85466126eeo.12.2013.11.13.00.12.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Nov 2013 00:12:32 -0800 (PST)
Date: Wed, 13 Nov 2013 09:12:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20131113081253.GB3663@jama>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<20f7dafc5f5948e7954203a0d57c25b68a419568.1384305535.git.mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20f7dafc5f5948e7954203a0d57c25b68a419568.1384305535.git.mark.hatle@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] binutils: Ensure old -symlinks packages get removed
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
X-List-Received-Date: Wed, 13 Nov 2013 08:12:33 -0000
X-Groupsio-MsgNum: 46965
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2013 at 07:23:22PM -0600, Mark Hatle wrote:
> When the -symlinks package was removed and an RPROVIDES was added, nothing
> was put in to cause the removal of the older package in an upgrade.
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 17c66bc..ea2383e 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -21,6 +21,7 @@ FILES_${PN} =3D " \
>  	${prefix}/${TARGET_SYS}/bin/*"
> =20
>  RPROVIDES_${PN} +=3D "${PN}-symlinks"
> +RREPLACES_${PN} +=3D "${PN}-symlinks"

IIRC for opkg backend you need also RCONFLICTS for opkg to really remove
old ${PN}-symlinks.
> =20
>  FILES_${PN}-dev =3D " \
>  	${includedir} \
> --=20
> 1.8.1.2.545.g2f19ada
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKDNIUACgkQN1Ujt2V2gBzDlQCfdwbrVO3pSOU5K+rxMSLv1PaD
I14AnjPoVdlqPT09U8fOl/w2cl3HGwn2
=uRX9
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
