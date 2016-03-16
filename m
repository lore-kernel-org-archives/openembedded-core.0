Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B756260053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 09:49:09 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so63766121wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=edhuI8CM6fcwPFMD1O61TOeBTfPr3nZ7sCBRo+c82OU=;
	b=JzxGA9C9UYoWudqbHm46UgNky4pHfZDE5TOPLnoQAy4OcJcAUKRcG9gOu5JNQOY89s
	2Ez2OMC5I8+njbMDJtFWLRcj3t69wVTxucpDL6yC3YtG6cRzPJpuNKc4LJtwfRDO5KwY
	CwFCDqdkcfTCyZOBavFSrr3uH+E+zXi+zyjW7Y3+h50iffzKG0rSlWmcee/hEWYYXeHg
	KiGKjhxUK9z9CRpBinoFbslMFEit5osJrscD0DNgnGkhUUC7FSQ7LtXaHMjNAo0XqA0v
	jJCyUmg0P+64CP43DmfIXzGpaE2iTAlfkDOUZqjfagif6rcVTExUYqCc3YB6+UANj5CT
	R+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=edhuI8CM6fcwPFMD1O61TOeBTfPr3nZ7sCBRo+c82OU=;
	b=Hy/UaI0h8PZeQ4Gnlrk2Yg5VFqGIGZ4D4wXzAX7w4j7j4zEbPHX8JgOCulOTYhoqsJ
	26D+f7z6Ywgj1kL9WX9cvW852oozHIsRlehv7UYcbLlzSADohOEE4P5tyUwg7zalFtz3
	1LSqX98hKrvY1K0sRJcndOLTemP8JQQmKvjfzQuCXbZLpoMiHdApRXNudj/aauT3FzBY
	f2r71whEd1VcSKoqoFeyLMCaKXyEb9bwekCG3WjhWuz17di0LrSsoN4bXwVjqjcF+qjV
	cwwGksEysOPGctvbCRu09bXa5nTpBApi/gTaoQTrN4YJtg7OHebv+j5dgPQIMbPf8OLo
	4DeQ==
X-Gm-Message-State: AD7BkJKqBsTwFRjm9hAnWgcdJ8TfdRwL5z9JGzXhPGCcaGN3LJ4om4iSuwn+VuTMpGBYvw==
X-Received: by 10.28.226.212 with SMTP id z203mr29381087wmg.73.1458121750231; 
	Wed, 16 Mar 2016 02:49:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s66sm24851597wmb.6.2016.03.16.02.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Mar 2016 02:49:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Mar 2016 10:52:40 +0100
To: Jens Rehsack <rehsack@gmail.com>
Message-ID: <20160316095240.GB2551@jama>
References: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
MIME-Version: 1.0
In-Reply-To: <E262EC7C-008A-421F-894E-40BED850BDEB@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND 1/4] ARM: handle missing thumb suffix
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
X-List-Received-Date: Wed, 16 Mar 2016 09:49:10 -0000
X-Groupsio-MsgNum: 79682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2016 at 10:34:22AM +0100, Jens Rehsack wrote:
> When enabling tune for arm926ejs, poky optionally appends suffixes for

tune files, not poky appends them.

Other than that.

Acked-By: Martin Jansa <Martin.Jansa@gmail.com>

> thumb and dsp support. Since sometimes arm926ejse (ARM code) and sometime
> arm926ejste (thumb code) is used in PACKAGE_ARCH, allow both.
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/conf/machine/include/tune-arm926ejs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/mac=
hine/include/tune-arm926ejs.inc
> index 4f4d7dc..81bcda3 100644
> --- a/meta/conf/machine/include/tune-arm926ejs.inc
> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
> @@ -8,4 +8,4 @@ TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', '=
arm926ejs', ' -mcpu=3Darm92
>  AVAILTUNES +=3D "arm926ejs"
>  ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
>  TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} arm926ej=
s"
> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te} arm926ejste"
> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D "${PACKAGE_EXTRA_ARCHS_tune-armv5=
te} arm926ejste arm926ejse"
> --
> 2.6.3
>=20
> Please apply this one to OE-Core - it has been discussed completely (see =
http://patchwork.openembedded.org/patch/105231/).
> @Otavio: Ross gave me the hint to ask you for ACK'ing - if possible (plea=
se don't, if it hurts).
>=20
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbpLOcACgkQN1Ujt2V2gBwk+wCgmtXXlbuACwLrX553WvjQKlHY
JRgAoLVwZXWrMcGza2VuJKZ1XWY7CHsR
=sN8c
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
