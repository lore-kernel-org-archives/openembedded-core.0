Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 430B175A52
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:18:49 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so210708556wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VWB8xcllBQUNtThUOLE6WxouoECDIgXEJXyTVVQKfwU=;
	b=QEA1IeFO1gM38bvZAvVFLvKhQip6w2juv7In7t/Gtlm0Bxe6C1DGpF5t6RbTlUhkuA
	rTWLaSruDpy6JGcnpZQ/xkafSbR7YdAaHeBw3dNLZzCuEMJN1cWBMoAntOoccP818XMe
	ZM1IT0MbZ6sHoLBx0EvH6KLlo+oRg6Zo3rF+Ywxuu1hJE2/zfJuKESm6ufAGE31CBTMG
	dKUA/46CXzAPYIYjwc+KbQguuOHAO9SRY/fPTtILZOw2+YelDcJ8W1Vynu0Uef4YScmc
	yy18sy3sJs+BbuhxlIC6Yj1mmQlZHf7jcBfJhbpnYOVvOIKH1p6kKr3KpG4jXWE9zMe8
	umAw==
X-Received: by 10.181.29.102 with SMTP id jv6mr102816wid.59.1444771128795;
	Tue, 13 Oct 2015 14:18:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jf3sm16505985wic.8.2015.10.13.14.18.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 14:18:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2015 23:18:53 +0200
To: Jens Rehsack <rehsack@gmail.com>
Message-ID: <20151013211853.GJ2396@jama>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
MIME-Version: 1.0
In-Reply-To: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Tue, 13 Oct 2015 21:18:49 -0000
X-Groupsio-MsgNum: 72144
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8884J15jRwcBTvu"
Content-Disposition: inline

--n8884J15jRwcBTvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2015 at 10:37:47PM +0200, Jens Rehsack wrote:
>=20
> When enabling tune for arm926ejs, poky optionally appends suffixes for
> thumb and dsp support. Since sometimes arm926ejse (ARM code) and sometime
> arm926ejste (thumb code) is used in PACKAGE_ARCH, allow both.

LGTM

>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/conf/machine/include/tune-arm926ejs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/mac=
hine/include/tune-arm926ejs.inc
> index 335e4e0..a310c9d 100644
> --- a/meta/conf/machine/include/tune-arm926ejs.inc
> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
> @@ -8,4 +8,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "=
arm926ejs", " -mtune=3Darm9
>  AVAILTUNES +=3D "arm926ejs"
>  ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
>  TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ej=
s"
> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te} arm926ejste"
> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te} arm926ejste arm926ejse"
> --=20
> 1.9.1
>=20
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n8884J15jRwcBTvu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYddTwACgkQN1Ujt2V2gBzSDgCgou988ZuSHxlWBQPKkmaSZO9x
ID0AnRM5Gvr+HPbMyn87s8ruUaCYhd+5
=t2lf
-----END PGP SIGNATURE-----

--n8884J15jRwcBTvu--
