Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCxuu-00019O-Vw
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 20:16:05 +0200
Received: by bke11 with SMTP id 11so7585247bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9+yrBMB3gafvD/LtFFFW3ZXn1XnX1giWoJbKBeZOl78=;
	b=gxg78fhG6HrKactaHQYM6zvyGNjzbSnMzmYuhtGBdngIaviru+waESOCVlh78034xC
	O0cNeA4EBROAE3ch+9XDs77truaBTWZ3a4Ze0ifx1ct04JLUhcRcz8z809/Ryuj71cwq
	CRYf6RGzMkh9R/4dXg5AehVjhqqhG6+E2gMtY=
Received: by 10.223.75.27 with SMTP id w27mr13453645faj.11.1318183824790;
	Sun, 09 Oct 2011 11:10:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u6sm26543712fan.17.2011.10.09.11.10.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 11:10:23 -0700 (PDT)
Date: Sun, 9 Oct 2011 20:10:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111009181016.GB3847@jama.jama.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Oct 2011 18:16:05 -0000
X-Groupsio-MsgNum: 10723
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline

--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
>=20
> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende geschreven:
>=20
> > sstate was being a little too ethusiastic about removing stamp files and
> > was removing stamp files for other machines when it shouldn't have been.
> >=20
> > This patch teaches sstate about machine specific stamp extensions and
> > allows it to only remove the current task's stampfiles.
>=20
> Not sure if it's related to this problem or not but sstate is still not w=
orking as intented for me when switching machines, it keeps rebuilding the =
toolchain when switching machine. What I did this morning:
>=20
> 1) wipe out tmp, sstate-cache, pseudodone
> 2) MACHINE=3Dbeagleboard bitbake u-boot
> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
> 4) MACHINE=3Dbrokensstate bitbake u-boot

Same here.. :/ (building 3 armv7 machines.. always "from scratch").

> And behold:
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: package gcc-cross-4.5-r43+svnr178923: task do_populate_sysroot_sets=
cene: Started
> NOTE: package mtd-utils-1.4.6-r0: task do_populate_sysroot_setscene: Star=
ted
> NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_populate_sysroot_se=
tscene: Started
> NOTE: package eglibc-2.12-r27: task do_populate_sysroot_setscene: Started
> NOTE: package mtd-utils-1.4.6-r0: task do_populate_sysroot_setscene: Succ=
eeded
> NOTE: package bash-4.1-r2: task do_populate_sysroot_setscene: Started
> NOTE: package bash-4.1-r2: task do_populate_sysroot_setscene: Succeeded
> NOTE: package gcc-cross-4.5-r43+svnr178923: task do_populate_sysroot_sets=
cene: Succeeded
> NOTE: package binutils-cross-2.20.1-r7: task do_populate_sysroot_setscene=
: Started
> NOTE: package linux-libc-headers-2.6.39-r2: task do_populate_sysroot_sets=
cene: Started
> NOTE: package eglibc-2.12-r27: task do_populate_sysroot_setscene: Succeed=
ed
> NOTE: package binutils-cross-2.20.1-r7: task do_populate_sysroot_setscene=
: Succeeded
> NOTE: package linux-libc-headers-2.6.39-r2: task do_populate_sysroot_sets=
cene: Succeeded
> NOTE: package libgcc-4.5-r43+svnr178923: task do_populate_sysroot_setscen=
e: Started
> NOTE: package gcc-runtime-4.5-r43+svnr178923: task do_populate_sysroot_se=
tscene: Succeeded
> NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_populate=
_sysroot_setscene: Started
> NOTE: package zlib-1.2.5-r0: task do_populate_sysroot_setscene: Started
> NOTE: package libgcc-4.5-r43+svnr178923: task do_populate_sysroot_setscen=
e: Succeeded
> NOTE: package lzo-2.05-r0: task do_populate_sysroot_setscene: Started
> NOTE: package zlib-1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
> NOTE: package e2fsprogs-1.41.14-r2: task do_populate_sysroot_setscene: St=
arted
> NOTE: package util-linux-2.19.1-r7: task do_populate_sysroot_setscene: St=
arted
> NOTE: package lzo-2.05-r0: task do_populate_sysroot_setscene: Succeeded
> NOTE: package e2fsprogs-1.41.14-r2: task do_populate_sysroot_setscene: Su=
cceeded
> NOTE: package libtool-cross-2.4-r4: task do_populate_sysroot_setscene: St=
arted
> NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot_setscene: Sta=
rted
> NOTE: package libtool-cross-2.4-r4: task do_populate_sysroot_setscene: Su=
cceeded
> NOTE: package util-linux-2.19.1-r7: task do_populate_sysroot_setscene: Su=
cceeded
> NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task do_populate=
_sysroot_setscene: Succeeded
> NOTE: package ncurses-5.9-r1.1: task do_populate_sysroot_setscene: Started
> NOTE: package perl-5.12.3-r5: task do_populate_sysroot_setscene: Started
> NOTE: package eglibc-initial-2.12-r27: task do_populate_sysroot_setscene:=
 Started
> NOTE: package eglibc-initial-2.12-r27: task do_populate_sysroot_setscene:=
 Succeeded
> NOTE: package ncurses-5.9-r1.1: task do_populate_sysroot_setscene: Succee=
ded
> NOTE: package db-5.1.19-r3: task do_populate_sysroot_setscene: Started
> NOTE: package expat-2.0.1-r0: task do_populate_sysroot_setscene: Started
> NOTE: package expat-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
> NOTE: package perl-5.12.3-r5: task do_populate_sysroot_setscene: Succeeded
> NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot_setscene: Suc=
ceeded
> NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot_setscene: Started
> NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_sysr=
oot_setscene: Started
> NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot_setscene: Succeeded
> NOTE: package db-5.1.19-r3: task do_populate_sysroot_setscene: Succeeded
> NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_sysr=
oot_setscene: Succeeded
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 536 of 920 (ID: 918, /OE/tentacle/sources/meta-openemb=
edded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb, do_populate_li=
c)
> NOTE: Running task 549 of 920 (ID: 452, /OE/tentacle/sources/meta-openemb=
edded/meta-oe/recipes-devtools/binutils/binutils-cross_2.20.1.bb, do_fetch)
> NOTE: Running task 553 of 920 (ID: 504, /OE/tentacle/sources/openembedded=
-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb, =
do_fetch)
> NOTE: Running task 558 of 920 (ID: 538, /OE/tentacle/sources/meta-openemb=
edded/meta-oe/recipes-devtools/gcc/gcc-cross-intermediate_4.5.bb, do_popula=
te_lic)
> NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task do_populate_lic:=
 Started
> NOTE: package binutils-cross-2.20.1-r7: task do_fetch: Started
> [..]
> NOTE: package eglibc-2.12-r27: task do_compile: Started
>=20
>=20
> What I suspect is happing is that angstrom is somehow putting $MACHINE in=
 a var that upsets the sstate logic and/or rm_work upsets sstate and/or som=
ething else is broken. The problem is that I have no idea how to debug this=
 except to ping Richard and get the magic diffsigs incantation.
>=20
> regards,
>=20
> Koen
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6R44gACgkQN1Ujt2V2gBypNwCeP9OldsCutOpLc09/7nLL9tBL
b3YAmwZ96sVPptXaAKMn++ULbWWxbajJ
=MJjO
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
