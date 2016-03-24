Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 141E07709E;
	Thu, 24 Mar 2016 21:45:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s187so597652wme.2;
	Thu, 24 Mar 2016 14:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=OD/K/qsEgSaC0T002gdeb9QfYSM6qnl/tpJQpiZKYoI=;
	b=M+ZIQZn5kj+nlwJZcnksF3nqOBUkTEsS8Nt4qbXMx5jHNRVhAYJXr6PFAN8XCrigfV
	jRbB0veZszM1VtJvqb+g6/fxAyhLAflqxBICHTeAjbnL3RUMHvMfyes3H1MsMe1tmtQc
	WBQuaiVTCq4PwzoyA2MhLfH7HGOte6uKrQgm3eir4ufz0S9Z/1CuCORVJ07I1o6Gcu74
	rWUfXtoFgrnz8F/8sF3aQJlplwWza2DobW9c0cHtZri6hWe6R43PMwkFZ0dtf4cHbzgV
	a8yPuZUWPNlEHtNNZGy5S5R9Z6r1QAsJXAp/1lzFZLkjBq8Qt6KINBJceKdvoSdC1Wnq
	Hhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=OD/K/qsEgSaC0T002gdeb9QfYSM6qnl/tpJQpiZKYoI=;
	b=CFe5MeKk6PF3NJKg9Anhlrx0tX3XSHxClnhBWgVB83k/7MBoAHwqxjnL/5W9V3r9p3
	T8ZGB6RazEy6zqSVUkHNCAe9T9/SY/OWQsffZZ7D9LhR+zQIyO4/mo5aszAJnnAF2ODv
	seUEztccYFXYCLYvUNFJAVv14Bj4f6y+3MaSIDsVctVteYIjAcNywYWv0C94XbT1IfN4
	WZ/+8PMElK4o5hQse9WLWuzqlvSGzIMnwsa6UvpG3TUHjNn5rhqfGi+L8Ao49w32bhb8
	fIB4lvfPjZVCJMNwdMavjAydbgdF2+HCeQ4XSL5hMZovyYKiDWcDXBt79hQ/ZCWSjNJF
	OpWg==
X-Gm-Message-State: AD7BkJKQQefw49jnrVzyofpS8i5T8G1PUzvEQ81xiA+ywmr5Soe1Niq2GL7PQiXx6kr4uA==
X-Received: by 10.194.227.1 with SMTP id rw1mr11747202wjc.62.1458855928038;
	Thu, 24 Mar 2016 14:45:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm9170408wjz.4.2016.03.24.14.45.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 14:45:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Mar 2016 22:50:06 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160324215006.GE2518@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, test-dependencies 2016-03-24
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
X-List-Received-Date: Thu, 24 Mar 2016 21:45:29 -0000
X-Groupsio-MsgNum: 80114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="imjhCm/Pyz7Rq5F2"
Content-Disposition: inline

--imjhCm/Pyz7Rq5F2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've fixed what I could, I've tried to fix samba but after multiple
attempts it still fails or autodetects pam :/.

This time I did qemuarm and qemux86 testing with the same metadata.

Next time I'll let test-dependencies to run over all recipes, because now I
can run it on separate build server without blocking normal verification
builds for OE layers.

qemuarm:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160324_06=
1458.log/
ERROR: 12 issues were found in these recipes:
chkconfig-alternatives-native core-image-sato-dev core-image-sato-sdk
dfu-util-native opencv proxy-libintl remake samba

WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
WARN: opencv: libopencv-dnn rdepends on protobuf, but it isn't a build depe=
ndency?

qemux86:

Failing recipes
2_max/failed/chkconfig-alternatives-native.log
  /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/u=
pdate-alternatives
  Matched in manifest-x86_64-opkg-utils-native.populate_sysroot
2_max/failed/core-image-sato-dev.log
  ${PN}-dev depending on ${PN} pulls 2 conflicting packages into the image
     * check_conflicts_for: The following packages conflict with alsa-state:
     * check_conflicts_for: 	fsoaudiod *=20
     * opkg_install: Cannot install package alsa-state-dev.
2_max/failed/core-image-sato-sdk.log
  the same as core-image-sato-dev.log
2_max/failed/dfu-util-native.log
  | /usr/bin/ld: cannot find -lusb-1.0
  | collect2: error: ld returned 1 exit status
  I'll check this one (it was working fine when I was upgrading it and fixi=
ng previous issue)
2_max/failed/proxy-libintl.log
  /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/li=
bintl.h
  Matched in manifest-qemuarm-glibc.populate_sysroot
2_max/failed/remake.log
  /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/sysroot-provid=
ers/make
  Matched in manifest-qemuarm-make.populate_sysroot
  manifest-qemuarm-makedevs.populate_sysroot
  manifest-qemuarm-makedepend.populate_sysroot
  /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/include/gn=
umake.h
  Matched in manifest-qemuarm-make.populate_sysroot

3_min/failed/core-image-sato-dev.log
  same as in maximal build
3_min/failed/core-image-sato-sdk.log
  same as in maximal build
3_min/failed/dfu-util-native.log
  same as in maximal build
3_min/failed/proxy-libintl.log
  same as in maximal build

Additional issues shown only in qemux86 builds:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20160324_06=
1457.log/

ERROR: 24 issues were found in these recipes: chkconfig-alternatives-native=
 core-image-rt core-image-rt-sdk core-image-sato-dev core-image-sato-sdk df=
u-util-native jasper perf proxy-libintl remake samba vboxguestdrivers

WARN: jasper: jasper-bin rdepends on libgl-mesa, but it isn't a build depen=
dency?
WARN: jasper: jasper-bin rdepends on libglu, but it isn't a build dependenc=
y?
WARN: jasper: jasper-bin rdepends on mesa-glut, but it isn't a build depend=
ency?

2_max/failed/core-image-rt-sdk.log
  ERROR: Nothing PROVIDES 'linux-yocto-rt' (but /home/jenkins/oe/world/shr-=
core/openembedded-core/meta/recipes-rt/images/core-image-rt.bb DEPENDS on o=
r otherwise requires it)
  ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set =
to linux-yocto, not linux-yocto-rt
2_max/failed/core-image-rt.log
  ERROR: Nothing PROVIDES 'linux-yocto-rt' (but /home/jenkins/oe/world/shr-=
core/openembedded-core/meta/recipes-rt/images/core-image-rt.bb DEPENDS on o=
r otherwise requires it)
  ERROR: linux-yocto-rt was skipped: PREFERRED_PROVIDER_virtual/kernel set =
to linux-yocto, not linux-yocto-rt
2_max/failed/vboxguestdrivers.log
  | make[1]: *** No rule to make target `include/config/auto.conf', needed =
by `scripts'.  Stop.
  | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/w=
ork-shared/qemux86/kernel-build-artifacts'

3_min/failed/core-image-rt-sdk.log
  Same as in maximal build
3_min/failed/core-image-rt.log
  Same as in maximal build
3_min/failed/perf.log
  perf-1.0: Package version for package perf went backwards which would bre=
ak package feeds from (0:None-r9.1 to 0:4.4.3-r9.1) [version-going-backward=
s]
  None is interesting, the version is fscked in the maximal build.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--imjhCm/Pyz7Rq5F2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb0YQ0ACgkQN1Ujt2V2gBwPOgCdHjvSYsMJNtBcavNlzGzcFP6K
UlgAmgJxWvQxQYmEx2VjYpmIiMJmq237
=22iN
-----END PGP SIGNATURE-----

--imjhCm/Pyz7Rq5F2--
