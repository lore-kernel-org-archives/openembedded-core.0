Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB6377D7A;
	Mon, 10 Apr 2017 09:33:36 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id w64so33945465wma.0;
	Mon, 10 Apr 2017 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=jiqHKqhEQGTq426FtboZfHwS6Xm0fWUhnU9AiO7MJME=;
	b=AVMiqT9+fs/EqsBcmI29uK0qCKRYp1nAbh4ruFrleFPxUNZFjFZMWwFQvd1qEpdqEd
	7Xyq8MC15bjHkO4RdTd3WW+8amFkZXAFPck5FbwRs8Q98sQYJJOF7xvl/T+ii76onjPC
	qsHcAptvLvZRxc6GNPp8ptzNrgmHBJp/I0GJQBk/hLlRu2bjRof4KDwTK/B34WqoXoaQ
	sUwZjlIShVIu0Onh7HxgMULVvmbcJdxCgekYSC11srR/HTvFreaIGYO3aigL5Fr2FWIM
	h4bvRLh1dOj36+2e0OwPryqSqediNOeK02id0//jp5uQLXTleL4N4gt4iitSN5AKTo9Z
	oTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=jiqHKqhEQGTq426FtboZfHwS6Xm0fWUhnU9AiO7MJME=;
	b=q3n0bPYmB2yD2ZpuhJlGDy1iQUmphFJWP3TR0PRYH783YCIDQVi2aHF4lA4BSgVHRC
	KN4JXZcY8op0sRzbhM0Q9rO/XEEOJlktaTDSijg7bcgEhvFsxw3XfPgA0JTfTcocqdHn
	GAC8lF952tJqZf17DR+GSHba7e/TeGylmSy+L1RSGV/HykreKm41AHwIxKkdJPfOP56J
	jg46g5bK5SGg1wZ3vv/vQMtwWbh3dNezsb6O7EDcOix0FdBElHIefMSUbLOq3Z8NlIi0
	oRG4FhHIXebidPUo1vuVmcCQXZugqmmUPT9hzf+aKiX5qdE8uhQTSlLOpfcJs3Pdb6I8
	eS0w==
X-Gm-Message-State: AN3rC/41XVUidfc1dP74v4jWeew4A/gSy905CdthAUj9UxixqPAdLtdM
	8ZGub6y9ESlA7ir6
X-Received: by 10.28.74.147 with SMTP id n19mr9738341wmi.86.1491816816639;
	Mon, 10 Apr 2017 02:33:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	127sm9546968wmt.20.2017.04.10.02.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Apr 2017 02:33:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 10 Apr 2017 11:33:35 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170410093335.GA3020@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: State of bitbake world, Failed tasks 2017-04-09
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
X-List-Received-Date: Mon, 10 Apr 2017 09:33:37 -0000
X-Groupsio-MsgNum: 96038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline

--tThc/1wpZn/ma/RB
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
||2017-04-09	||0	||0	||0	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||3		||0		||0		||0		||1		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-09 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170409_221502.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (0) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170406_085524.log/ ||=20
|-
|| qemux86 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170406_085529.log/ ||=20
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170409_203725.log/ ||=20
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
||1	||host-user-contaminated
|-
||3	||textrel
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170407_070148.log/

No issues detected


--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOtRbgAKCRA3VSO3ZXaA
HNbeAJ9ch5nox+200HE9bJXQhlYmsd5vygCeJtYs4TJo+JHpY9jFSBsWet5y5NU=
=VW2e
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
