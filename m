Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0D99971DEC;
	Thu, 27 Apr 2017 09:09:02 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id z52so13324207wrc.2;
	Thu, 27 Apr 2017 02:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=S73081VS7E23rhzwp0Z1lDcdjHNgXKWxQBbrEhw8HNw=;
	b=e0xSOHWcb66PBzwkF7dtjMuEOWS6P2SkaLqCI8qMcqxOwUmPjsrpUuC35tgzL7pZwk
	P87AhDgZum+dRpBaEYJyiRGf3CYDjcqPWKYx71ju6okBu8pv+hUeWXR0mJ77m9nNREJL
	wzmyD7D/nW2mzB0W/QmoeK75PsNNV4niN+l19mbuzzEgu11BZmkytKiUpQY6doYIuGQA
	byVwTza+QyvA3hXJaRljieRICYIlPARfxF/nlLv5EjaMPqJjXQu1CCDVdWry6FF5p6O/
	MZpU1Gl8mUT6uugFpitSnNJ3KJ0426zW1mTUF1y60urfPe2JFRWYO0YqirgVNJl8k8si
	PfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=S73081VS7E23rhzwp0Z1lDcdjHNgXKWxQBbrEhw8HNw=;
	b=M8Ckp3w3V+74UVA6EjOeJEhdajGYLrptPLRre6yBwswRZ+lZN+QDo42Lho2ozCG4SO
	e1jllO4l+sdWKSizKWffXCZtFXw+znfiSOPcKP4NgCgDUx+T9P9AkUf9ozW6gGwZd2di
	04JPddqEL+wTnUMuQ7kVMmFAwp/MiRCNq5R7r5V1Kl7obK4mnlUiA0ayvpob0FdP4n6J
	bXXkOgziCXCKQGhuQtQ1SHKQzguP/u3LwTnxpUAPjChmozBPlo1XxS9CV6BweQsql9sR
	AX0bjwxaW7iPOeWtXs2Kp+fDG1C0I9VsXOkARSnkImachcUMpEMRYj9zOh0hI21o/9cw
	646A==
X-Gm-Message-State: AN3rC/428vmDgLfvzhZO9Gf0wrn8NtM3UW1mkH5+KKKDCO3LEA5N9jft
	zMFWVT7VHkhN7Y1u
X-Received: by 10.223.154.40 with SMTP id z37mr3026746wrb.136.1493284143385;
	Thu, 27 Apr 2017 02:09:03 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v27sm1186734wra.19.2017.04.27.02.09.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Apr 2017 02:09:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 27 Apr 2017 11:09:21 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20170427090921.GA3721@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: State of bitbake world, Failed tasks 2017-04-26
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
X-List-Received-Date: Thu, 27 Apr 2017 09:09:04 -0000
X-Groupsio-MsgNum: 96735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline

--M9NhX3UHpAaciwkO
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
||2017-04-26	||0	||0	||0	||N/A	||N/A	||N/A	||N/A	||N/A	||N/A	||0	||0		||0		=
||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||0		||=09
|}

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2017-04-26 =3D=3D

INFO: jenkins-job.sh-1.8.20 Complete log available at http://logs.nslu2-lin=
ux.org/buildlogs/oe/world/pyro/log.report.20170426_225925.log

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks (0) =3D=3D=3D
{| class=3Dwikitable
|-
|| qemuarm 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemuarm.20170426_081705.log/ ||=20
|-
|| qemux86 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/lo=
g.world.qemux86.20170426_081704.log/ ||=20
|-
|| qemux86_64 	|| 0	 || http://logs.nslu2-linux.org/buildlogs/oe/world/pyro=
/log.world.qemux86-64.20170426_102853.log/ ||=20
|}

=3D=3D=3D PNBLACKLISTs (433) =3D=3D=3D

=3D=3D=3D QA issues (0) =3D=3D=3D
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
||0	||textrel
|-
||0	||unknown-configure-option
|-
||0	||version-going-backwards
|}



=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D

Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.signa=
tures.20170426_102413.log/

No issues detected

QA issues by type:
count: 0	issue: already-stripped


count: 0	issue: libdir


count: 0	issue: textrel


count: 0	issue: build-deps


count: 0	issue: file-rdeps


count: 0	issue: version-going-backwards


count: 0	issue: host-user-contaminated


count: 0	issue: installed-vs-shipped


count: 0	issue: unknown-configure-option


count: 0	issue: symlink-to-sysroot


count: 0	issue: invalid-pkgconfig


count: 0	issue: pkgname


count: 0	issue: ldflags


count: 0	issue: compile-host-path



=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D
latest upstream commit:=20
21d9631 toaster: move release lookup from morty to pyro
not included in master yet:=20
c4b1613 world-image: add extra target

=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D
latest upstream commit:=20
e584be7 build-appliance-image: Update to master head revision
not included in master yet:=20
67114ad qemux86: Add identical qemux86copy variant for tests
63e9e9d sstate-sysroot-cruft.sh: Extend the whitelist
fe744e8 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
1b4ca51 buildhistory.bbclass: metadata-revs show repo parent
0b100a7 metadata-revs: provide more information
ef84c55 report-error: Allow to upload reports automatically
a43df23 Revert "mesa: Contain configure search for llvm"
d559619 sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning=
 and separated with dash
fe46c11 kernel-yocto/kern-tools: fix do_validate_branches clean stage

=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D
latest upstream commit:=20
ba89d451 hostapd: 2.5 -> 2.6
not included in master yet:=20
bf67dbb dnsmasq: disable the service by default
1a68c94 wireguard: add WireGuard kernel module and tools
9076683 strongswan: Split plugins
ba15077 opensaf: Upgrade to 5.2.0
3e445c1 openhpi: add new recipe
804160a freeradius: add new recipe
26bf7da libnet-ldap-perl: add new recipe
ff92147 libdata-hexdump-perl: add new recipe
7c4d004 libnet-telnet-perl: add new recipe
aa737b6 libauthen-radius-perl: add new recipe
1c747f9 openipmi: add new recipe
6ba3579 ipmitool: add new recipe
02b4e96 kodi: Make it build again and upgrade to 17.1

=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D
latest upstream commit:=20
5f837b4 qttools: add ptest
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D
latest upstream commit:=20
4ed7feb Merge pull request #35 from schnitzeltony/chrome-progress
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=3D
latest upstream commit:=20
c325204 packagegroup-luneos-extended: drop qtscenegraph-adaptation
not included in master yet:=20

=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D
latest upstream commit:=20
d150b0a meta-openmoko: remove fbreader bbappend to drop meta-gpe dependency
not included in master yet:=20

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQG1QAAKCRA3VSO3ZXaA
HEmhAJ4+a0reR1HNa0luQrzmVAmwh+UmawCfQ93jGnURadnc/yxcy+glYjfeNLk=
=EA8V
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
