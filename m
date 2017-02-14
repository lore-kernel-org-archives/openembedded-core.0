Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7519971CA5;
	Tue, 14 Feb 2017 23:48:38 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id o16so180768253wra.1;
	Tue, 14 Feb 2017 15:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ujslJjJ+vI7jhB2mAKewtMNYtAAMnwdl5QLEYXO4M+c=;
	b=aM0kI+hhaexrtXi5q1YMcP5W9FxgDcBrSA/dSOD5ilj3aEreTAQji3yK0t3H87DvVx
	K5eYJgH28r6hlKkzBpsDidRO5bUNy4h1eX+52rpWUIaCXyanNJZHwj5N0SccKg/RNfo4
	qqvaQ2ktuWJd0pzWX3l1DUGKjCclmuh7d01BIhzWrpfVBgheauewIL/QPTeABQXUducR
	UD7CxHUX4sz5CHSb9l84kDh3VnGPKVVg1lvknouNpJAeunjn0X4FvPstd3wkxFE7Np05
	UFApjHH99GfdDpnuqNQt5CNO0b+0Q9hSX0tvvhljnZLXKd+3ZSuk5uhd3dcsVYMU/PE4
	ATlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ujslJjJ+vI7jhB2mAKewtMNYtAAMnwdl5QLEYXO4M+c=;
	b=W/bSgJ5pYrpn01M+A7w7gBuL89gAc2OlvTTLAYEdx5PHixwazS5lpINeRmSoLsS2pr
	z02D5P3zcquKxfO4Kq1zjX3TcnGMWf3Ilz1dY5Bg+m4vXg2FnnzcLour6bNFeJNiwfhH
	WVIL8cKaaOsohfx3Shn+8MdZb543fHIar+Yn3Wi93q09M5wJSuloLcVlh6etxgPaJeWA
	0e8FCj0jIeEK4PHVn0NYisCNVeuiK3BNIWrzf+2QUf6B3ntCdjBciScIhTACerncRQFi
	qy1ZDE4DJsaGmFxSv0yyagmHXN/Iww+sz1Hg87U8i/KkRhcckUSLj+J4RLE1uK7IqHpb
	eEvw==
X-Gm-Message-State: AMke39nVoDrC/eXbof9aoCtZ3v1LKryH3eugqbTtNLbAUd8ghdEMBsP/wtrFctRbxXab9A==
X-Received: by 10.223.170.154 with SMTP id h26mr26570896wrc.29.1487116117986; 
	Tue, 14 Feb 2017 15:48:37 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e6sm2620436wrc.30.2017.02.14.15.48.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Feb 2017 15:48:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Feb 2017 00:48:38 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170214234838.GB3023@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-14
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
X-List-Received-Date: Tue, 14 Feb 2017 23:48:39 -0000
X-Groupsio-MsgNum: 93366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Finally something short again.

Now someone should really notice that chromium-wayland got broken again sho=
rtly after Trevor fixed it in:
https://github.com/OSSystems/meta-browser/commit/22bc9604102f177a46230ddebd=
582158dd67239d
but it could be different issue this time, my guess is that disabling gener=
ate_character_data as in qtwebengine
https://github.com/meta-qt5/meta-qt5/commit/aa6551d14987e10d9c49b0d04f55294=
01e3cb936
would be enough to work around this.

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'12'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||=09
|-
||2017-02-14	||0	||1	||0	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||1		||0		||0		||8		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-14 =3D=3D

INFO: jenkins-job.sh-1.8.17 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170214_134258.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (1) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170213_095743.log/ ||=20
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170213_110945.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32356/
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170214_123631.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (463) =3D=3D=3D

=3D=3D=3D QA issues (9) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||libdir
|-
||0	||pkgname
|-
||0	||symlink-to-sysroot
|-
||0	||unknown-configure-option
|-
||1	||textrel
|-
||8	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170213_110747.log/

No issues detected

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKOXVgAKCRA3VSO3ZXaA
HAq2AKCI/38BeQL87msDrnxtsjx1+fVkWACeJrT2B4Lab60nCzMlcN049cGWbWo=
=jKVH
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
