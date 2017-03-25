Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCA971E52;
	Sat, 25 Mar 2017 08:08:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t189so7150626wmt.1;
	Sat, 25 Mar 2017 01:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=rHHm5kCEudnfqAoV1IVylhchv4uKDHYap1vF+BPdZuw=;
	b=TEZTYjw7ruzBAai9iH7OkwrhqCAXdwc9X9bkE89yUXEStqbeJSjnx13wPtVXR+gdMb
	IKtHtF4h3MBCnBA53QD2BC5Q+ZE6AdfgIIcsnkmkkjQ6brmIR2k95BKZKkAxQgxNzbO3
	Il1D5fdP9M4fP0sg/nlxoT82d1CigHVUOa9oMXVJSvthc76eMHwTJ45OTmnDEaorwJYn
	6lgyqnDMXKP3J9kW0iz766RyLZgyYTlSEE5vsfbvSGmAtCQc0KU537wviJ+9AgLsnFwC
	RFAPKC7TCoahfgpsYriw3L/NkKB6S5RXqnr/YLXiyuELGS/UeEZth0ouEtYdj5A+ETgl
	gxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=rHHm5kCEudnfqAoV1IVylhchv4uKDHYap1vF+BPdZuw=;
	b=mp8XQ3/pXdnpgWabKLW0blnFeGGi4P7unmABKRh+XkJ+YAI8zUp+HeJrrZrrGGoo18
	WtGUiwZbMI2GZf6UnImNgUK/hEjC3zSMjdTP9pUTHr1RBz3z4NPB8Bk3Qlo5P6aCHchu
	6YVsWIZwsJdl5b54QIeWwx3u/fNSZw4q6EjqEytMQIylJLLfJCGZ8t0nn7QEUDViiuzA
	RD3yeF2hwesvb4g75iC3oYMb809tDf8fxAXvLCforlZUo99oyWyNPI3VIY6+wpsYkNX2
	46kyZ4TJMrUS1zVa3V5/PBhRCV1Te7aCt98T0YFWvO+3zyjODsYX8VLT4QkhsXaFoKRc
	+2zw==
X-Gm-Message-State: AFeK/H3UM1y+BajaRaonCT5dfyd/ARhnLRpR0TdBB+NWrul558JrRwDEhuoYET/L5F8uOg==
X-Received: by 10.28.6.6 with SMTP id 6mr1099533wmg.111.1490429311999;
	Sat, 25 Mar 2017 01:08:31 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r17sm5952460wrc.47.2017.03.25.01.08.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 Mar 2017 01:08:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 25 Mar 2017 09:08:41 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170325080841.GD3293@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-03-22
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
X-List-Received-Date: Sat, 25 Mar 2017 08:08:33 -0000
X-Groupsio-MsgNum: 95240
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Content-Disposition: inline

--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
||2017-03-22	||15	||21	||20	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||=
0		||1		||0		||0		||0		||1		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-03-22 =3D=3D

INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170324_220429.log

=3D=3D=3D common (15) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/alsa-equal/alsa-=
equal_0.6.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.7.bb:d=
o_compile
    * meta-openembedded/meta-oe/recipes-extended/libexecinfo/libexecinfo_1.=
1.bb:do_compile
    * meta-openembedded/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb:do_f=
etch
    * meta-openembedded/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb:do_co=
mpile
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-abyssinica_1=
=2E500.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-s=
ans-narrow_1.07.4.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/atop/atop_git.bb:do_fetch
    * meta-openembedded/meta-oe/recipes-support/gpm/gpm_git.bb:do_install
    * meta-openembedded/meta-oe/recipes-support/hwdata/hwdata_0.291.bb:do_f=
etch
    * meta-openembedded/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb:d=
o_fetch
    * meta-openembedded/meta-oe/recipes-support/zile/zile_2.4.11.bb:do_inst=
all
    * meta-openembedded/meta-python/recipes-devtools/python/python-slip-dbu=
s_0.6.1.bb:do_fetch
    * openembedded-core/meta/recipes-graphics/mesa/mesa_17.0.1.bb:do_config=
ure
    * virtual:native:meta-openembedded/meta-efl/recipes-efl/efl/efl_1.15.1.=
bb:do_compile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/vboxguestdrivers/vboxguestd=
rivers_5.1.14.bb:do_install
    * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-support/dstat/dstat_0.7.3.bb:do_com=
pile
    * virtual:native:meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.=
6.bb:do_install

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-smartphone/meta-shr/recipes-shr/shr/libshr-glib_git.bb:do_compile

=3D=3D=3D Number of failed tasks (56) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 15	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemuarm.20170322_025058.log/ || http://errors.yoctoproject.org/Err=
ors/Build/34831/
|-
|| qemux86 	|| 21	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/l=
og.world.qemux86.20170322_041911.log/ || http://errors.yoctoproject.org/Err=
ors/Build/34767/
http://errors.yoctoproject.org/Errors/Build/34768/
http://errors.yoctoproject.org/Errors/Build/34832/
|-
|| qemux86_64 	|| 20	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.world.qemux86-64.20170322_221011.log/ || http://errors.yoctoproject.o=
rg/Errors/Build/34833/
http://errors.yoctoproject.org/Errors/Build/34834/
http://errors.yoctoproject.org/Errors/Build/34851/
|}

=3D=3D=3D PNBLACKLISTs (350) =3D=3D=3D

=3D=3D=3D QA issues (2) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||file-rdeps
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
||0	||version-going-backwards
|-
||1	||host-user-contaminated
|-
||1	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170322_204049.log/

No issues detected



--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNYlDwAKCRA3VSO3ZXaA
HFEYAKCT2KXv6BlZ4AVY1gP85UoByBEBVgCbBVapW1xofYoOedTHlqRP9ZkeTHk=
=DJU4
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
