Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC343608B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 12:49:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f75so5820326wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 05:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+HOkyIJ1hP2XZ5Y3CsMLPA9y+81lQ96TRgDC5fWSTBU=;
	b=ktMVOfXH12dnQlQbudApHKQ6Ox2yJhfRdu990g+93aACvxIIJdhte9LxN58y44j7II
	ef6Zb4IFeLYCO9MFepiSvSt7r+ar+A3X323TSzLOZWtONfvkqvG0EqHRhRBmRQgXO1kF
	s8jDSAYNqXavPkkRa3BirX7awhhQj6fIqoyYuPOLREXh+qMuDNdYg/oSzaAYEiYB7PiU
	I9J86SWsQb5uSst7XqwtF/QylcSD2AgI/ofiqcM65QQ1LWzXvtICN37kHh0Ezts2nJ4c
	c7xxwJlpRTatAqbheonqCPba+xUsNaqjHZKBAUnAO3tFni64xsY63M2+/7qgfsICfAZ3
	10Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+HOkyIJ1hP2XZ5Y3CsMLPA9y+81lQ96TRgDC5fWSTBU=;
	b=HXchHuE0O9sD8DV5/hyujKqKUGdlXV6GBYJYhNtZx0wWGwuN83f208DM2ppY5+8Ghx
	5gd2DIBOvpYtcAv7ZDPqNsU/UoRacpxsTh7eNPJiAI1IW3Seu4CEr2JJi5UCMLUCvjM8
	635GSuhu3rJnUtfUXhJ9on5ddgnhHCE1xfeJb/QLgKMOfOZIRW2w/t32Co2/sdviGndk
	e6VpV/F6fnii7+egS2z25tvDl6CxxwCMsVdarVAHaMb47W2INC/wuD0IO2gEHo5mQ5Pk
	NMInl40phlQxTeS4me2STLztZooJmP8u9uN870atCVPQP4XAs72tdJkwptJp71Si9aYj
	1mDg==
X-Gm-Message-State: ALyK8tLFHp0eqpuHM+lAmAWtr/HvkGA3/+c4/EgQS2pSjhsotWeOVQSIkhsvgmc3uC3KJg==
X-Received: by 10.194.157.36 with SMTP id wj4mr4087540wjb.139.1464094198025;
	Tue, 24 May 2016 05:49:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l74sm3576795wmb.15.2016.05.24.05.49.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 24 May 2016 05:49:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 May 2016 14:50:02 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160524125002.GA2566@jama>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<caaf69df34a94f81e3aa5f853580cc59dacd6577.1464088997.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <caaf69df34a94f81e3aa5f853580cc59dacd6577.1464088997.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/45] python3: manipulate all of the config*/Makefile files, not just config/Makefile
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
X-List-Received-Date: Tue, 24 May 2016 12:50:00 -0000
X-Groupsio-MsgNum: 82571
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 02:53:58PM +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes=
-devtools/python/python3_3.5.1.bb
> index 26d05c7..1c8fe2f 100644
> --- a/meta/recipes-devtools/python/python3_3.5.1.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.1.bb
> @@ -164,6 +164,7 @@ do_install() {
>  	rm -f ${D}/${bindir}/2to3
> =20
>  	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/=
config/Makefile
> +	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/=
config-${PYTHON_MAJMIN}m/Makefile

Shouldn't it use "PYTHON_ABI" variable instead of "m"?

>  	if [ -e ${WORKDIR}/sitecustomize.py ]; then
>  		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYT=
HON_MAJMIN}
> @@ -182,9 +183,11 @@ PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"
>  py_package_preprocess () {
>  	# copy back the old Makefile to fix target package
>  	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJ=
MIN}/config/Makefile

Shouldn't it use "PYTHON_ABI" variable instead of "m"?

> +	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJ=
MIN}/config-${PYTHON_MAJMIN}m/Makefile
>  	# Remove references to buildmachine paths in target Makefile and _sysco=
nfigdata
>  	sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-libtool=
-sysroot=3D${STAGING_DIR_TARGET}'::g \
>  		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
> +		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}m/Make=
file \

Shouldn't it use "PYTHON_ABI" variable instead of "m"?

>  		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
>  }
> =20
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldETfcACgkQN1Ujt2V2gBzMfQCfR0/GvAiAwNxZ4Qa+6LaHiLYe
cQkAnjBNy3ichwDYWrVwmLGmb/g7uVrD
=cg3L
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
