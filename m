Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA5A073216
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 10:56:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r18so2491561wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HuiCM+XqSjwGGlSb/kK9yS+TECdc6iZ8gypr8/P7/R8=;
	b=Yddk3OifAHWMZZiOM3PHAYrY6cHXP49HmxCr6Ouk2/XhAVUlL/h4iJC0KhcpV+w0K/
	9D6ZMQxsg0X5+ncZlUvNcoQ3nLOXW2ZH9IGCHpBR0mg0qSSzEQVWiWJaepy34dcyVQw9
	PEcqt2i3zkTyS06ED97tlNhXNEbfV0M7CrwXzmJkdBe4wby5jk53+5opMUkgJS7MV1fK
	BC8snt1Paa7hgsYzy4UjQi82et9Yl21GIvtJAP+bpUYi/Nfd9q9DVKfjqmf6oA3dmEAp
	2EUiJXS5rRfsJ6nd05XGOakmRrQDuRrTQl0mzEVFUlPNJWWf4T/S3PQLSKhrVHwfooRJ
	TSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HuiCM+XqSjwGGlSb/kK9yS+TECdc6iZ8gypr8/P7/R8=;
	b=sTWoNkSIRpkF3w0CpUU+pt+OA2lQ0TDqeZsDsjt9AEXwLgtSw0n1B1dk8yU3HKl/f+
	0bNyqC8rrdSgv8aOA4I7eNbcGfX37ushW8h6ARok0KcihYt3EfQixdxIFkpVS4y9cKy2
	whHJihNgtkT84d/d2VPzPRy0SS3pKhOVrNfzaFvU6Er/stE8BvEpy3dKMkA7pBik/Qcq
	kSqxeAbMbh8d6qLdZCnEOJ8YXEDCKmRgVUp4PNnk8FKy2qHJuAcTs3625MwxmbQsTfrB
	QXWBokdEZNb8EKK22b1fwghLdj7DsRvmBWzj5ylryE5M8C0udkZTv7plkTbvWRwxLXmm
	OjGA==
X-Gm-Message-State: AMke39l29Xri7YhAfQ/crs7dhzTtgMwiwozrCUpmSKm6vr4X0YUgrxtASAHHm4jJuqI1Uw==
X-Received: by 10.28.158.82 with SMTP id h79mr12454724wme.30.1487242582344;
	Thu, 16 Feb 2017 02:56:22 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p49sm8533240wrb.10.2017.02.16.02.56.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Feb 2017 02:56:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Feb 2017 11:56:23 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20170216105623.GA3621@jama>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
	<5f59a24d85e3226f7fa878f3fac5b88afbe1b0fc.1487139819.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5f59a24d85e3226f7fa878f3fac5b88afbe1b0fc.1487139819.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] binconfig.bbclass: fix get_binconfig_mangle()
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
X-List-Received-Date: Thu, 16 Feb 2017 10:56:23 -0000
X-Groupsio-MsgNum: 93450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2017 at 10:25:11PM -0800, Robert Yang wrote:
> The command was:
> s +=3D " -e 's:-L${libdir}:-LOELIBDIR:;'"
> s +=3D " -e 's:-I${includedir}:-IOEINCDIR:;'"
> s +=3D " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
> s +=3D " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
> s +=3D " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
> s +=3D " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
>=20
> The STAGING_LIBDIR and STAGING_INCDIR now contains WORKDIR, so the
> result would be incorrect like:
> TCL_INCLUDE_SPEC=3D'-IFIXMESTAGINGDIRTARGET/usr/include/recipe-sysroot/us=
r/include/tcl8.6'
>=20
> Note, the "/usr/include/recipe-sysroot" is not needed. Move the last two
> sed commands ahead will fix the problem.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/binconfig.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbcl=
ass
> index 5372294..1be5fc4 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -13,14 +13,14 @@ def get_binconfig_mangle(d):
>          s +=3D " -e 's:=3D%s${exec_prefix}/:=3D\\1OEEXECPREFIX/:'" % opt=
ional_quote
>          s +=3D " -e 's:-L${libdir}:-LOELIBDIR:;'"
>          s +=3D " -e 's:-I${includedir}:-IOEINCDIR:;'"
> +        s +=3D " -e 's:-L${WORKDIR}:-LOELIBDIR:'"
> +        s +=3D " -e 's:-I${WORKDIR}:-I-IOEINCDIR:'"

Is the "-I-I" intentional?

>          s +=3D " -e 's:OEBASELIBDIR:${STAGING_BASELIBDIR}:;'"
>          s +=3D " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
>          s +=3D " -e 's:OEINCDIR:${STAGING_INCDIR}:;'"
>          s +=3D " -e 's:OEDATADIR:${STAGING_DATADIR}:'"
>          s +=3D " -e 's:OEPREFIX:${STAGING_DIR_HOST}${prefix}:'"
>          s +=3D " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
> -        s +=3D " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
> -        s +=3D " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
>          if d.getVar("OE_BINCONFIG_EXTRA_MANGLE", False):
>              s +=3D d.getVar("OE_BINCONFIG_EXTRA_MANGLE")
> =20
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKWFVgAKCRA3VSO3ZXaA
HBLwAJ4j9+dQymA0q5TuD4AO1+ElmQWLdgCglPlTIwtgm9xIbBf+H4FHjQ/e5Ts=
=Ikfy
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
