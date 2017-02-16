Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0243071A8C;
	Thu, 16 Feb 2017 12:44:14 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r141so14209397wmg.1;
	Thu, 16 Feb 2017 04:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=JwC7UazrPzb4IECvyBnk1ylYduIaGjvnNGDLwODTzmk=;
	b=qQTl/XFSuDpO5YBrr1aW5RhSvVZF2z0DaI68T87POEQ4jB+Cum2eUKi4TzhQHqIhVP
	E0RacplEdQ2VOQVO+Q5D3G0AZL3GVfjaH6ziddQ+qR7fon0LSUl1RNMh3+4CF1wzDhAz
	zBhZHy0mJPj7pSY6XePd0qxT+Vhz2n2Wd6DB35EiPv6x5+WjXuLDokB1taLmnJ2LyOIs
	XD7rMf7q/RSe41fHStw6gV/qc+c5OvAX2su/N+urApiVV+u7WJcSL21uzr54SKea/LdG
	qLCLeor/y05+l5rU8CsDD9zbr+rLKTcGh9877P6/5qT/GxpFW1Gwc7Dr4BljCWOJIx6K
	zu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=JwC7UazrPzb4IECvyBnk1ylYduIaGjvnNGDLwODTzmk=;
	b=d3+KTf2oXDUbGjhxtdE5T/uE36f4YQSog9wH8IvWWJRiWUarirlVm2djEff0UAMNUZ
	h/AizM+lrtYeJgK0LvHUsdUFkOhHj9A6Mq5Xq9Af5MrQfgDI6YhkBHx5VcTvJfvxfEC0
	Ax0oXm0xXJVKQwgFVsixQKdNKjqS6U+zYqOKMOCHCIVChSlNBN5gOqA23ok7ufsY2AW+
	vxClUYChqmSwQf57MHyNdlR3q4D0o44IiMJn9qogcAakTaQ80NpBd8yBNPV4IVAOZCZd
	53fSX+VVRNepQPFPcTiPPDQgSXBroSu/P6Rz+l+F2HDBcfIy6Y1IfBqfhVKabVOPaAmD
	7ZVg==
X-Gm-Message-State: AMke39l4LLCpYSRIU/jJifXmPtVxCR27HHR30N25tgJRxOU3m82GLNz2I41LqGIPyotFdQ==
X-Received: by 10.28.69.194 with SMTP id l63mr2217987wmi.23.1487249054451;
	Thu, 16 Feb 2017 04:44:14 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o42sm8873617wrb.18.2017.02.16.04.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Feb 2017 04:44:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Feb 2017 13:44:15 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20170216124415.GC3621@jama>
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
X-List-Received-Date: Thu, 16 Feb 2017 12:44:15 -0000
X-Groupsio-MsgNum: 93453
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another run with couple unblacklists

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
||0		||0		||0		||198		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-14 =3D=3D

INFO: jenkins-job.sh-1.8.17 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170214_164708.log

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
g.world.qemuarm.20170214_135645.log/ ||=20
|-
|| qemux86 	|| 1	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170214_135710.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32480/
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170214_151408.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (445) =3D=3D=3D

=3D=3D=3D QA issues (198) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||198	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170214_151247.log/

No issues detected

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKWenQAKCRA3VSO3ZXaA
HLeiAJoD/CzkPaHYd2Ag6e05BtII/Lgl4ACglyAfNVOo6ugCbbWp9w9OB4gWl/0=
=YPh9
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
