Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0A2D606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 14:14:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so13304510wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oqnTHSB0mHZU+JpcRso7kg+NczutnSuWMIXjQm8+Cz4=;
	b=hl9PruJdr13Sj0VUzMQ0EIMg35JU8d9VQTm3dp1j4vWEFjbvNCJ7mRPF+NQ9e0ipR1
	tU4S2z0FkHpFdDvaXjcrAaC2kXvqkhQe039rz4a0m/Jp2N45WbH0W3B3IL3AK/RsKiQA
	9mYY5IFIOf8Fgu7cIUP52J162+tXuPl3a+Q1FpuEGqh8RHrTP5RhDkkSfd+ztSCtpHXr
	CDKtDqSWHbBUmksfhxbpuAH/IrB6K3vdBiolOFgEAVD8yHJomIMGuwHTEFMawjEenZTb
	ltZbVEE1dpkXi9YTXsjrCVay/UJdJqU02gI5hOTYlNuoFhQ0lGvp9qIOyun0KHL0mtXB
	iZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oqnTHSB0mHZU+JpcRso7kg+NczutnSuWMIXjQm8+Cz4=;
	b=m0VnBrQsXn59W86yb1VGhBfhzKf6hgOUTiQcAFzwF382KobmlgPYYjVAjn4cT0++pe
	G1qpVrxxEREK6PzEuoOt4akKmQP2NSnkzjmWh7K0jE5/pEk3P/ma33w+KYzd1V9KgoLt
	fBXmY13JJhNCj7MjvI5JiGSb+vs+qGbE4ra1/9s3vU/aZFQ5CO/Z4Op1iT3PcBFmbJNY
	z1ezUrRw+pyUk0HQwnLT0ts95UA0z62ZpWMldWevaWLA+qW8VTattrIYwhW5f3lG3Kir
	QmzZE/NWn7j2l0JREsaBCwnzCLKVmAFrJ14VU/gKseBTeBkiRa/bHLYfczGzgl5obsjo
	n6mw==
X-Gm-Message-State: AOPr4FXyL+IqYiDSaCa3GZ7dMIk77fgQRAJmbo9t3j5OOph2rBAhdIQLn29v9GT2TdOltQ==
X-Received: by 10.28.25.129 with SMTP id 123mr29996022wmz.10.1463580854846;
	Wed, 18 May 2016 07:14:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c194sm29817567wme.9.2016.05.18.07.14.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 May 2016 07:14:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 May 2016 16:14:44 +0200
To: Herve Jourdain <herve.jourdain@neuf.fr>
Message-ID: <20160518141444.GC2579@jama>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
MIME-Version: 1.0
In-Reply-To: <1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 14:14:15 -0000
X-Groupsio-MsgNum: 82298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Content-Disposition: inline

--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 08:33:37PM +0800, Herve Jourdain wrote:
> When compiling mesa, if dri is disabled in PACKAGECONFIG, or if the list =
of DRI drivers is empty, it will cause populate_package to fail, because it=
 can't find - rightfully - the directory for the DRI drivers.
> This patch checks that the directory indeed exists before trying to get a=
 list of the files in it
>=20
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index a4e5351..0e46092 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -143,15 +143,16 @@ python mesa_populate_packages() {
> =20
>      import re
>      dri_drivers_root =3D os.path.join(d.getVar('libdir', True), "dri")
> -    dri_pkgs =3D os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
> -    lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
> -    for p in dri_pkgs:
> -        m =3D re.match('^(.*)_dri\.so$', p)
> -        if m:
> -            pkg_name =3D " ${MLPREFIX}mesa-driver-%s" % legitimize_packa=
ge_name(m.group(1))
> -            d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> -            d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> -            d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> +    if os.path.isdir(d.getVar('PKGD', True) + dri_drivers_root):

Use os.path.join instead of +

> +        dri_pkgs =3D os.listdir(d.getVar('PKGD', True) + dri_drivers_roo=
t)
> +        lib_name =3D d.expand("${MLPREFIX}mesa-megadriver")
> +        for p in dri_pkgs:
> +            m =3D re.match('^(.*)_dri\.so$', p)
> +            if m:
> +                pkg_name =3D " ${MLPREFIX}mesa-driver-%s" % legitimize_p=
ackage_name(m.group(1))
> +                d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> +                d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> +                d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> =20
>      pipe_drivers_root =3D os.path.join(d.getVar('libdir', True), "galliu=
m-pipe")
>      do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-dri=
ver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc8eNMACgkQN1Ujt2V2gBzqyACgsVGMpLC3bZHbfeNGJkR0A9Tb
IjsAoKJiM1nNSxPV0H6sj4+6kz97VQQb
=/hXV
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
