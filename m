Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1642F601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 19:01:38 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so2439706wid.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VBbwWK9vlZPj5BDLA6bCG7olXjdVH+2I3yNtPUQWeME=;
	b=bfBEoEHmAhd/6Fvc81eVrKyr6+5DmyxFBGvNU2uZ67ftRECo9z3nNDYIHFgNrc6WCu
	lqKO5kYv7pZevXhGX2EMDmSLTicPZld7TTblP2M5VhF2fmNZe55MFQ4rVRaytPTtunES
	+omyi4vY6NNvqZipXAv/23lg0nvvvld0gLYAdjPpzotnQJkqZ1HkdHGiFf9jWEK2uFZS
	7n93E/ltjRhLHARQcK5L+rT/xl+U80uWCfmaV9z49wBwDILKC0X+wU8SGNCWGtE575nR
	K0okOdkDPGLGFaEE0Jf7S0c+j9q995YUfh4ZybaZL9tdWY69cr7rz9Wi04va4rMAIQRc
	5qxg==
X-Received: by 10.194.187.241 with SMTP id fv17mr947365wjc.13.1412276499267;
	Thu, 02 Oct 2014 12:01:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	am1sm5490789wjc.29.2014.10.02.12.01.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Oct 2014 12:01:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Oct 2014 21:02:34 +0200
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20141002190234.GI25706@jama>
References: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1412263157-2891-1-git-send-email-alejandro.hernandez@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto: Added bc-native as DEPENDS
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
X-List-Received-Date: Thu, 02 Oct 2014 19:01:46 -0000
X-Groupsio-MsgNum: 58332
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="csjV5iuXLa65tnQH"
Content-Disposition: inline

--csjV5iuXLa65tnQH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 10:19:17AM -0500, Alejandro Hernandez wrote:
> The makefile checks for bc during for compilation

It's needed only by 3.9 and newer, so that's why it wasn't globally
required by kernel.bbclass, but only in linux-yocto (3.10+ at that
time) and I've applied it in couple kernel recipes which were building
3.9+.

But bc-native doesn't take so long to build, so I'm not opposed to
depend on it (even when it isn't necessary in some cases).

>=20
> [YOCTO #6781]
>=20
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78b33ce..0782923 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base kernel-module-split
> =20
>  PROVIDES +=3D "virtual/kernel"
> -DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}g=
cc kmod-native depmodwrapper-cross"
> +DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}g=
cc kmod-native depmodwrapper-cross bc-native"
> =20
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS =3D "1"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--csjV5iuXLa65tnQH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQtoUoACgkQN1Ujt2V2gBwINQCgnN7WMpLZF4SEsN8BG9xkjl2k
upsAmgJSFEZPHkUXjpjuox8Q+nW+afV7
=WuUM
-----END PGP SIGNATURE-----

--csjV5iuXLa65tnQH--
