Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 94B7577E5F;
	Thu, 13 Apr 2017 16:35:08 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t189so51050580wmt.1;
	Thu, 13 Apr 2017 09:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=/Pi1OdNHseff1UdCygpW9TjBKwl0wIJjYEvKNYmdD74=;
	b=N2TKQkCLJloZFwhLuTZNKopQ32Q/teJ7+cpwnYunuIkoQFjQ6voNvT5xJvU6UUsGpe
	AL7VyX51SG60ocpiAH8aTIPJBKMAb6SNStaMYftTOSfVYawIbsiyIgCS6hShxMfxVWoe
	bf8IUnH9zMGUIbBRjAf4Oqa1PG9l7PgUg2Q8Yj2UKVd9uY1cEhloOrSdbTD4INUIrqNq
	E040lo7dwSgvn4wliIkQ/GIdC1RsKw251FsaAXL1+qa02BFB5I/IlP18wDOlBlweRoPX
	R6W1VX7Dgv+1N6SVC9+dR/CvpiR47izmhUv/sJmfLOYu5AZ1zVlh2Fv4vKEabOy8ZdBG
	LINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=/Pi1OdNHseff1UdCygpW9TjBKwl0wIJjYEvKNYmdD74=;
	b=MX9umuhAX1GQKydsmNwlMypUZfdwVXlMe8KRbTEGSK0r6jvS7apMizoIamdkqyLK7J
	lrXIUX2jG1dVMdldcjFjN39cWIDkHYeoTIso4XucsUjxkrK3hriO2GYijCmeM2IzG9I5
	6dPq6YDNuyEhOg64yZdXhjVtTbgrD8q1Coi0RVKzCfnzBZqIzbpaRR7wgqkSREMXrGjP
	mmE21z9skJy7C/Iv+iKApWwGPER/vwMfj0HHd38d8mBEtfZhkLAa5LN7ib+oCIhZRpr5
	8Gg2T1d1dvpG78OyWnSpa77LtBfQTe/VVfgBf4V5EYrO/l0IP4jwtcmfxG7p0w5I18pl
	gStQ==
X-Gm-Message-State: AN3rC/5Akbe86pNhldPMdG2VIfaf17GWB0snaJOe+mfY87YsYvVvNJlb
	6WGNEYnG12r2eIyU
X-Received: by 10.28.90.66 with SMTP id o63mr4224583wmb.97.1492101309594;
	Thu, 13 Apr 2017 09:35:09 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i21sm2835202wrc.50.2017.04.13.09.35.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 13 Apr 2017 09:35:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 13 Apr 2017 16:35:08 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170413143508.GA5138@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-04-12
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
X-List-Received-Date: Thu, 13 Apr 2017 16:35:10 -0000
X-Groupsio-MsgNum: 96292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=3D=3D Number of issues - stats =3D=3D
{| class=3D'wikitable'
!|Date		     !!colspan=3D'3'|Failed tasks			    !!colspan=3D'6'|Failed depe=
ncencies			 !!|Signatures		  !!colspan=3D'14'|QA !!Comment
|-
||		||qemuarm	||qemux86	||qemux86_64	||qemuarm||max||min	||qemux86||max||mi=
n	||all 	||already-stripped	||libdir	||textrel	||build-deps	||file-rdeps	||=
version-going-backwards	||host-user-contaminated	||installed-vs-shipped	||u=
nknown-configure-option	||symlink-to-sysroot	||invalid-pkgconfig	||pkgname	=
||ldflags	||compile-host-path	||=09
|-
||2017-04-12	||2	||3	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||4		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-12 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170413_063321.log

=3D=3D=3D common (1) =3D=3D=3D
    * meta-openembedded/meta-networking/recipes-support/tinyproxy/tinyproxy=
_1.8.4.bb:do_compile

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * virtual:native:meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.=
6.bb:do_install

=3D=3D=3D qemux86 (2) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-devtools/klibc/klibc_2.0.4.b=
b:do_compile
    * meta-openembedded/meta-oe/recipes-support/dstat/dstat_0.7.3.bb:do_com=
pile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (7) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170411_001604.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36038/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170411_001605.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/36040/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170412_024831.log/ || http://errors.yoctoproject.or=
g/Errors/Build/36126/
|}

=3D=3D=3D PNBLACKLISTs (442) =3D=3D=3D

=3D=3D=3D QA issues (4) =3D=3D=3D
{| class=3Dwikitable
!| Count		||Issue
|-
||0	||already-stripped
|-
||0	||build-deps
|-
||0	||compile-host-path
|-
||0	||file-rdeps
|-
||0	||host-user-contaminated
|-
||0	||installed-vs-shipped
|-
||0	||invalid-pkgconfig
|-
||0	||ldflags
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
||4	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170411_230634.log/

No issues detected

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWO+MmwAKCRA3VSO3ZXaA
HEbwAKCwD11MRg2NpM2NdbNzlG8ASwlQpwCgjGDxRXS31hNvHeZWTtC0u5WuRFQ=
=smYR
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
