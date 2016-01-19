Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E20A6FFE5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:38:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l65so22645914wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wrU0HNgDvK9huxoNgha255zEgiseblTKdWtTGDFaQtc=;
	b=clvGj/+0Vdn3huTvB6iPmFN0TY4X2gHA57xzTN71PJ1SCPuqLvcD0qC0DNjFCY66pg
	71Lx3rvldJZdD2m7ZYnV3xomKUjaQKjSykwxUDBT0wDOnofFfdKR5Ad1G4YEFKeDsKIW
	n4uq5KloEbemZB+5s4A6aUnejf0NYMTTnwCsMcPer/ObGC/PkBmJeNEi3BUOIoXpTkaW
	2zRnTXigH6B2RPi5q3rMCsFhxBUiLJOBQtBeUKUU6CzXsdrOlomZywBrQQ0rnLHwkuix
	t3rrYHuyqG06/7U9iNMgLs+aHojNolcpC2UYFAAciO25QRCzHTkbrcHkqDshmYL7hBvN
	8WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=wrU0HNgDvK9huxoNgha255zEgiseblTKdWtTGDFaQtc=;
	b=JPu32LgWNN7B6NchVlEijXOQJyYMx7mQePPDoPEq3JBlW0kEVfPyRmDfe8eW9TCxUo
	4ymrzm/H42y1meRFRmoaAFtqV95r6LVS22vxXK4ktkNIWslm3lek7oJkdF9XOjFeYeHg
	eH3pz+xzti2g0/zMcFEpEV8abmEJ0upWofSXarWvZ8DtwzqY4pBjOnbfZS92OLfxiESJ
	IYirZwD77SWLMjtYFv55NOhrUwJuYnsCZLAxqRnFL46B2wg7Sr9+ACJB9j7OQW+3Jelq
	MlAg/H4wfUl7FRhWA7+DW/VYbX+oKzuEEnzzZdJIHn7TKjI4DAXEkdKNMFNSTMkBU2Ve
	9MFg==
X-Gm-Message-State: ALoCoQkcNYzQxS6E5sHjshH6ZDAKZZvsYlPkHzwEgi08rpnXKUqU+Fc+/OsfFZp4kXrewXri6v6VcjY08KL60yIp/ifZ4vA1og==
X-Received: by 10.194.120.226 with SMTP id lf2mr29103460wjb.108.1453203533617; 
	Tue, 19 Jan 2016 03:38:53 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	di6sm28103176wjb.12.2016.01.19.03.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 03:38:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Jan 2016 12:40:18 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160119114018.GC2611@jama>
References: <cover.1453173729.git.liezhi.yang@windriver.com>
	<dc955f7651afe19ce915cedc95bfb9ab96d52d73.1453173729.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <dc955f7651afe19ce915cedc95bfb9ab96d52d73.1453173729.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] e2fsprogs: fix PV
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
X-List-Received-Date: Tue, 19 Jan 2016 11:38:53 -0000
X-Groupsio-MsgNum: 76390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Content-Disposition: inline

--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 18, 2016 at 07:23:03PM -0800, Robert Yang wrote:
> We had upgraded e2fsprogs from 1.42.9 to 1.43 (WIP), and used:
> PV =3D "1.42+1.43-git${SRCPV}"
> But:
> $ dpkg --compare-versions 1.42+1.43 gt 1.42.9 && echo greater || echo less
> less
>=20
> It shows that 1.42+1.43 is less than 1.42.9, so this is a downgraded. Use
> PV =3D "1.42.13+git${SRCPV}"
> to fix the problem. 1.42.13 is the latest e2fsprogs 1.42 version.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb b/meta/reci=
pes-devtools/e2fsprogs/e2fsprogs_git.bb
> index b1b7931..60b2854 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_git.bb
> @@ -9,7 +9,7 @@ SRC_URI +=3D "file://acinclude.m4 \
>  "
> =20
>  SRCREV =3D "0f26747167cc9d82df849b0aad387bf824f04544"
> -PV =3D "1.42+1.43-git${SRCPV}"
> +PV =3D "1.42.13+git${SRCPV}"

If 0f26747167cc9d82df849b0aad387bf824f04544 is going to be released as
1.43, then it would be better to use 1.42.99+1.43+git${SRCPV} to make
sure, that hypothetical 1.42.14 will also sort lower than this future
1.43.

>  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindir}=
 \
>                  --enable-elf-shlibs --disable-libuuid --disable-uuidd \
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

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaeIKEACgkQN1Ujt2V2gBzPFwCgmtEyj8vloiGofOAlpYADegpU
M5YAniIxkeQZbgvRdi16iWpcsFSE70y6
=omxP
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
