Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id D5A27607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 21:29:29 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so25417136wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9KmuCwuzZjd0K8FR2qBZuxQ0CV9ngMHttZClffw3XIs=;
	b=AWk/2oXsAb+hypGcdG9b1OIuQzZOlNmA8fmRGkSLTUGGUNLSGo7y39W4vQF5MK/mq9
	qW5i8TGpSAvD4V0rwuwdHg4F/jyJUytHrXK4OpcG7c3rKefLHIo6pCQOPDFGR+5Nij4H
	lfNMD8FLYKLIKu4Ueonx8J2M8IYgr4krKgffbVNMbrZjRHiK1X9mF50Eicytnmwl1sXz
	czigaWTzsFBTP7wEktWC+tZlVw+qpAGfVhKwqrwaNP/id9vmvnEASn58frz3KBq6vUKo
	bAbEiW/vbHVz6wrRu24XYA5iX3OjgQEV6hQURmfqeNSPF4E1r8RHCZBHDFROa/QNURVQ
	sDCg==
X-Received: by 10.180.77.68 with SMTP id q4mr9943044wiw.22.1437082169080;
	Thu, 16 Jul 2015 14:29:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z9sm5209767wiv.9.2015.07.16.14.29.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 14:29:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 23:29:56 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150716212956.GA7193@jama>
References: <20150714142140.GC2184@jama>
MIME-Version: 1.0
In-Reply-To: <20150714142140.GC2184@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: dbus-test no longer built for dbus-ptest after last bitbake changes
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
X-List-Received-Date: Thu, 16 Jul 2015 21:29:30 -0000
X-Groupsio-MsgNum: 68068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2015 at 04:21:40PM +0200, Martin Jansa wrote:
> I'm not 100% sure it's related to recent bitbake variable expansion
> changes, but my recent builds are failing with errors about
> dbus-ptest cannot be installed because dbus-test-ptest doesn't exist
>=20
> ERROR:=20
> Collected errors:
>=20
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies
>  * for dbus-ptest:
>=20
>  * 	dbus-test-ptest *=20
>=20
>  * opkg_install_cmd: Cannot install package dbus-ptest.
>=20
> It's using a bit strange construct to add it to RDEPENDS:
> meta/recipes-core/dbus/dbus.inc:RDEPENDS_dbus-ptest_class-target =3D
> "dbus-test-ptest"
>=20
> but checking cooker log shows that dbus-test
> (meta/recipes-core/dbus/dbus-test_1.8.18.bb) wasn't built at all, only
> dbus-test message is from opkg error and this QA error from dbus itself:
>=20
> NOTE: recipe dbus-1.8.18-r0: task do_package_write_ipk: Started
> WARNING: QA Issue: dbus-ptest rdepends on dbus-test-ptest, but it isn't
> a build dependency? [build-deps]

Possibly other issues caused by different data expansion (because I don't r=
emember any metadata changes in this area)

Parsing of 2408 .bb files complete (0 cached, 2408 parsed). 2963 targets, 1=
25 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime opencv-samples (opencv-s=
amples, opencv)
NOTE: consider defining a PREFERRED_PROVIDER entry to match opencv-samples
ERROR: Nothing PROVIDES 'qt4-x11-free-native' (but virtual:native:/home/jen=
kins/oe/world/shr-core/meta-smartphone/meta-fso/recipes-freesmartphone/free=
smartphone/qfsodbusxml2cpp_git.bb DEPENDS on or otherwise requires it). Clo=
se matches:
  qt4-x11-free
NOTE: Runtime target 'aurora-daemon-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aurora-daemon-dev', 'libfso-=
qt', 'qfsodbusxml2cpp-native', 'qt4-x11-free-native']
NOTE: Runtime target 'aurora-daemon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aurora-daemon', 'libfso-qt',=
 'qfsodbusxml2cpp-native', 'qt4-x11-free-native']
NOTE: Runtime target 'libfso-qt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libfso-qt', 'qfsodbusxml2cpp=
-native', 'qt4-x11-free-native']
NOTE: Runtime target 'libfso-qt-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libfso-qt-dev', 'qfsodbusxml=
2cpp-native', 'qt4-x11-free-native']
ERROR: Nothing PROVIDES 'gtk+-native' (but virtual:native:/home/jenkins/oe/=
world/shr-core/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2=
=2E8.4.bb DEPENDS on or otherwise requires it). Close matches:
  tk-native
  git-native
  atk-native
NOTE: Runtime target 'abiword-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['abiword-dev', 'libwmf-native=
', 'gtk+-native']
NOTE: Runtime target 'abiword' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['abiword', 'libwmf-native', '=
gtk+-native']

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWoIlAACgkQN1Ujt2V2gBxT4wCfZJE/e2LBfalV710h1FZgKTVI
0TUAoLfPWhR4eMIuUMuBTqEZVAMoWe8m
=ugTI
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
