Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0677722D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:48:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y134so944888pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=cxJ1pnNg6KZlbYr4v7QcLRrkkr1AzC3Bgizvc+vhyZc=;
	b=nS2yYcno/SvlCVSQsj+73ezfVvwSH9EC5CYFsyskIk4h2pkPcFMulIhs4uUMIO5286
	vFoAZ5kySLS/BzsPbKZihTFTHFzsAWy9aWj2uC3szO0DRd0leyDngkU2BGeWVBgYsLGU
	wYykNYt0P2oXQpTLHrhKaFb5oqLgQtIVEdMIXDPX13T5EnJiMabRyifUyYEw+3SolhRY
	wgtF9OdOPTPrCF2IWqCD60n5s0MB5/gSXTMBEg+ufECdAYeFT1PQiHi7gTSfRbaCtAd+
	S0sgUbq05hrUMzHEfUao8B3AGx8at5xzbcSps/gjtRcNAlAfV3ExoZEikxXarhGZz9uM
	fBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=cxJ1pnNg6KZlbYr4v7QcLRrkkr1AzC3Bgizvc+vhyZc=;
	b=Dj6DodeEdi7oFS9jCIi42jZotreQauYg92WfxQNl45is2j61zBejQ1qtD5WKlNRzbw
	q9ozNKf+env0kVgez8xkoY4s8zMCsSKkGX+JtH/SDQLu+d0XqJT4Iv0eSga9EgsGLO88
	SMpuSb4YmN+zShcYuRcP/9hIMEqS4WnA7K9UfxH3RvmzwAVdgTZSgxi2slm3eoMczhzU
	Cfsee3QtZCRUkUCoKl8gNjIue3SUuUFUd9cT89z6b6ktHQxdrt53Bpk01Rh/v3o8Gq3r
	RyrOlFePefUR6OqGsW0/uu1M6TUgoXPvTJWtdQJXcdrOCYbPEI0SpJUWkCsAgQ2+pSn1
	7/Vw==
X-Gm-Message-State: AEkoouvalsvh7b33/UOvJFgfEaTV/4tZYl9dZj5b8hL/YBqTYiJ07OSWOnTnZw1q4lEZRA==
X-Received: by 10.98.93.25 with SMTP id r25mr24243243pfb.122.1470980891837;
	Thu, 11 Aug 2016 22:48:11 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:5ca7:11cd:bb8a:7702?
	([2601:646:8882:b8c:5ca7:11cd:bb8a:7702])
	by smtp.gmail.com with ESMTPSA id
	ps2sm9393056pab.10.2016.08.11.22.48.10
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 22:48:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470909853-22262-2-git-send-email-clemens.lang@bmw-carit.de>
Date: Thu, 11 Aug 2016 22:49:02 -0700
Message-Id: <C48DE607-9EB8-48E1-9421-EBB46F94AFAA@gmail.com>
References: <1470909853-22262-1-git-send-email-clemens.lang@bmw-carit.de>
	<1470909853-22262-2-git-send-email-clemens.lang@bmw-carit.de>
To: Clemens Lang <Clemens.Lang@bmw-carit.de>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gitpkgv: Fix $GITPKV for a single named git source
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
X-List-Received-Date: Fri, 12 Aug 2016 05:48:11 -0000
X-Groupsio-MsgNum: 85693
Content-Type: multipart/signed;
	boundary="Apple-Mail=_65454FBE-AEA4-4FD3-90BB-429D72A386AA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_65454FBE-AEA4-4FD3-90BB-429D72A386AA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2016, at 3:04 AM, Clemens Lang <Clemens.Lang@bmw-carit.de> =
wrote:
>=20
> Recipes that fetch from a single git source, assign a name to this
> source and do not set SRCREV_FORMAT to this name will always get
> a GITPKGV value of "default", which causes version-going-backwards QA
> errors.
>=20
> Fix this by automatically determining a suitable SRCREV_FORMAT from =
the
> SRC_URI if none is set explicitly. This code does not run for multiple
> git sources, because bitbake's fetcher enforces setting SRCREV_FORMAT
> when multiple version-controlled sources are used.

looks good.

>=20
> Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>
> ---
> meta-oe/classes/gitpkgv.bbclass | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/classes/gitpkgv.bbclass =
b/meta-oe/classes/gitpkgv.bbclass
> index 1cba00c..f73304a 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -61,7 +61,14 @@ def get_git_pkgv(d, use_tags):
>     #
>     format =3D d.getVar('SRCREV_FORMAT', True)
>     if not format:
> -        format =3D 'default'
> +        names =3D []
> +        for url in ud.values():
> +            if url.type =3D=3D 'git' or url.type =3D=3D 'gitsm':
> +                names.extend(url.revisions.keys())
> +        if len(names) > 0:
> +            format =3D '_'.join(names)
> +        else:
> +            format =3D 'default'
>=20
>     found =3D False
>     for url in ud.values():
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_65454FBE-AEA4-4FD3-90BB-429D72A386AA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAletY04ACgkQuwUzVZGdMxSyUwCgiSeylMOfgN742+VEQ0yRZeWb
XiEAniUa705xMWx+nJkiX+CCx5TwRADu
=fkmE
-----END PGP SIGNATURE-----

--Apple-Mail=_65454FBE-AEA4-4FD3-90BB-429D72A386AA--
