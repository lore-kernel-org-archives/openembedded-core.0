Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id F17B660017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 12:46:59 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id n3so11568815wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0U3bwPEuXWN3C9hHmaNIeXObSOwN8RIWtThUMcmejPY=;
	b=HogzuBHMyzsuUyxCteuw7iJVwnpErdmqKO2SOEifdlPxSvRGX7TB8+BP1dCDiJCxlM
	95/Hi9XG8ciXw6HWAFn6elwIB42R3RukLxK43NL1MMpX8VrSsms5HYwF2dOl72qD1Sz0
	AQkun1ziENEfNssVFhm1AHeHXKPXW8cp3YRVi0S6Du1kAriCgL1Hq1FnQpcVG/iIT/Rn
	YjnhwYd3yHHL8PIEYGzB1kPtn3ZgdUIjbE/t2n4CvgtQnwpGu3/ON5YqSTiriOny2VE6
	AE8/xFxPRQS8Q+biO7NQSOOxBQ5TCuf553I82BjuJS1Ay20z27MsB5ZQTCiy//0BNimW
	Jpfw==
X-Received: by 10.180.107.164 with SMTP id hd4mr6856068wib.7.1422449220104;
	Wed, 28 Jan 2015 04:47:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gl1sm2680140wib.13.2015.01.28.04.46.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 04:46:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 13:47:01 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20150128124700.GH2477@jama>
References: <1422448867-9744-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1422448867-9744-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] security_flags: disable PIE on expect
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
X-List-Received-Date: Wed, 28 Jan 2015 12:47:05 -0000
X-Groupsio-MsgNum: 61776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
Content-Disposition: inline

--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2015 at 12:41:07PM +0000, Ross Burton wrote:
> Disable PIE in expect as otherwise it tries to link the shared library as=
 an
> executable.

And flac doesn't need it anymore?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/distro/include/security_flags.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dist=
ro/include/security_flags.inc
> index f996184..033638c 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -27,7 +27,7 @@ SECURITY_CFLAGS_pn-directfb =3D "${SECURITY_NO_PIE_CFLA=
GS}"
>  SECURITY_CFLAGS_pn-glibc =3D ""
>  SECURITY_CFLAGS_pn-glibc-initial =3D ""
>  SECURITY_CFLAGS_pn-enchant =3D "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-flac =3D "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-expect =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc-runtime =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc-sanitizers =3D "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gdb =3D "${SECURITY_NO_PIE_CFLAGS}"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTI2kQACgkQN1Ujt2V2gBz1aQCfVV2OEliUh2JXeeP+4YPeBWon
WZAAoKUvjp7k9wibKql/MHzfzwPurt+L
=L0ue
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--
