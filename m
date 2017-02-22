Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id BEC3E730E0;
	Wed, 22 Feb 2017 13:17:45 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id 97so1742242wrb.0;
	Wed, 22 Feb 2017 05:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=lXPZnRH5dTGjUKwabWjiwpl97NSh+OMLX8vqUDmIZSk=;
	b=CoJ+3fpKfk0Phz3W1G4KmIUVq3PPvVFJrBqDA6XLFPhbHbpQg6GyZoCRcaPFS/+FTh
	YY3vstcSVx+v2r+9LzzGi+d0Mz2MMhjyS8InmRaqXExAcQq2yi1pElRfTKEXWhaLhKxU
	LAmV9wjN3M8wnoQ1hSCUDqIGt7vfu85KusQ47LgC4io8BQzXZcf1dgWNE6VQwamzM+KD
	92VpLm82pRyLijobuGlptSAzbyS+Krzy+UBzJjIE0gJDsqKocox7LT1K8UneyTdvMOxy
	k92YOlJ980FkbJ1mngxvtH2gW2x28rOyT6kAns7iz9XBS10aAoSwSVv4t3cQBCni3o5g
	oc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=lXPZnRH5dTGjUKwabWjiwpl97NSh+OMLX8vqUDmIZSk=;
	b=VisYKdaS1YNQ9fIPVjBiSbZjUrD+2oeNTeuLASJKqY4OiBjYtb3hdpRvv94wwuGOdj
	yiycpfIkItyLDkREclzeg8O2Y5uU/eYcngHoarH6O9bCwpYuXXgWyVQGtS/H/lD/koLR
	fUWgH1Q/ikX5Z0XsPs9eEQ/AF5PWsbbxrucDC79VVxGAlxSmUiWeX7HQLo7dUfIMxr3s
	xHkSiz6sQSUxgxtkRL8u2uKjvqOITsSM8VJWgIoBn2aaelu/O28RUXqxxUipY4ee0LhC
	4ME9Y8VMoOLad9IPtG/vDgKUe9ixZTCQn6b0L8D/WRn8SYI4k7bwpSp6Z3a9qJw7BOSg
	4diw==
X-Gm-Message-State: AMke39nl+3LgQ3u7gUaqKsndUdOhhUvrdCjldjO7lcYF4zFs/V+3llNL5ojCkhIvrputIg==
X-Received: by 10.223.129.4 with SMTP id 4mr28300514wrm.27.1487769465828;
	Wed, 22 Feb 2017 05:17:45 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 36sm1709617wrk.57.2017.02.22.05.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Feb 2017 05:17:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Feb 2017 14:17:45 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170222131745.GC3283@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: State of bitbake world, Failed tasks 2017-02-22
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
X-List-Received-Date: Wed, 22 Feb 2017 13:17:46 -0000
X-Groupsio-MsgNum: 93815
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PuGuTyElPB9bOcsM"
Content-Disposition: inline

--PuGuTyElPB9bOcsM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Big thanks to Andreas who sent most of the fixes!

I've dropped only the last unblacklist for mpd which is still failing,
will try it now with unblacklist, but without the version upgrade.

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
||2017-02-22	||4	||3	||2	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||112		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-02-22 =3D=3D

INFO: jenkins-job.sh-1.8.18 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170222_030938.log

=3D=3D=3D common (2) =3D=3D=3D
    * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:do_compi=
le_ptest_base
    * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_pt=
est_base

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (2) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20=
=2E4.bb:do_compile
    * meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tool=
s_5.1.1.r37.bb:do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (9) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 4	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170222_001759.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32807/
|-
|| qemux86 	|| 3	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170222_001805.log/ || http://errors.yoctoproject.org/Erro=
rs/Build/32808/
|-
|| qemux86_64 	|| 2	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170222_014051.log/ || http://errors.yoctoproject.or=
g/Errors/Build/32809/
|}

=3D=3D=3D PNBLACKLISTs (381) =3D=3D=3D

=3D=3D=3D QA issues (112) =3D=3D=3D
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
||112	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170222_013010.log/

No issues detected

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PuGuTyElPB9bOcsM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWK2PeAAKCRA3VSO3ZXaA
HOsGAJ9YdsrIV3UIws0DirOpTuYSmDi8wACglP5XvJgMOkfb8wZGgbq3kMvGHJ0=
=cdVj
-----END PGP SIGNATURE-----

--PuGuTyElPB9bOcsM--
