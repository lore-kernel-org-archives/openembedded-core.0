Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE4777321;
	Sat, 14 Nov 2015 09:07:19 +0000 (UTC)
Received: by wmww144 with SMTP id w144so55687174wmw.1;
	Sat, 14 Nov 2015 01:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v0HeNCduGUleDTWbdDGDA09P6Ktdg52kSVgwFENZPfw=;
	b=qPzwli7G+aKQUcdTsoyzeE5Dbia20trPKQlEczmuPvbKo7OHxIBv16+kKUozcsY4EO
	aXygRIR2oi8NS3slC5AoDGhIegWlZJuAggMc3lJanPzF17u7XB2K8ApXfZt2gBnhDD5L
	L/YT+2+zWkRId8bZ7e3TTg/5fWpIvE1RyLckrVi3tHcQmC3R6qmOSey58K8eWgbrG+gX
	MolNkM5+KTeEcooQsl5glMZBTwSs37KXXJ+kFR2UXlZPq90O90F37ebY6zqQg6QBx6WA
	Vj6ZEf/Nje2Bt2btTsU4Zl7Sw8zX/dLRMG3KNbERibhfA5RJfOF4jdZSGGSc44PFXkiH
	9VWg==
X-Received: by 10.28.173.76 with SMTP id w73mr8923350wme.62.1447492038975;
	Sat, 14 Nov 2015 01:07:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm16782937wjd.17.2015.11.14.01.07.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 01:07:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 14 Nov 2015 10:07:51 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151114090751.GA2564@jama>
References: <20151113164856.GE2567@jama>
MIME-Version: 1.0
In-Reply-To: <20151113164856.GE2567@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, wrong PACKAGE_ARCHs 2015-11-13
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
X-List-Received-Date: Sat, 14 Nov 2015 09:07:23 -0000
X-Groupsio-MsgNum: 73443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 05:48:56PM +0100, Martin Jansa wrote:
> On Fri, Aug 01, 2014 at 03:46:13PM +0200, Martin Jansa wrote:
> > On Thu, Jul 24, 2014 at 01:19:01PM +0200, Martin Jansa wrote:
> > > This is new report generated with oe-core/scripts/sstate-diff-machine=
s.sh
> > > =20
> > > To reproduce it, you need "qemux86copy" MACHINE which is the same as
> > > qemux86 only with different name (to simulate 2 MACHINEs with same
> > > TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
> > > jansa/master branch:
> > > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/=
master
> > >=20
> > > Current logs:
> > > http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.2014072=
4_010942.log/
> > >=20
> > > jansa/master branches are containing couple of pending changes (mostly
> > > to remove allarch), so if you try it with current master branches it
> > > will be (a lot) worse.
> >=20
> > Just for test I've just dropped these fixes, so a few more issues repor=
ted now:
> >=20
> > ERROR: 63 issues were found in these recipes: android-tools dracut
> > font-alias initramfs-framework initscripts ipsec-tools linux-firmware
> > lmsensors oprofile oprofileui oprofileui-server
> > polkit-group-rule-datetime polkit-group-rule-network ppp-dialin
> > qt-demo-init resolvconf run-postinsts shr-theme-neo sysvinit
> > terminus-font tipcutils ttf-arphic-uming ttf-dejavu ttf-droid
> > ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-mplus
> > ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei usbinit vpnc
> > weston-init xfce4-session xl2tpd xserver-common xserver-nodm-init
> > xuser-account
>=20
> With patches I've sent yesterday we get to reasonable state.
> ERROR: 2 issues were found in these recipes: dracut lmsensors
>=20
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20151113_15=
4041.log/
>=20
> I've already sent v2 for dracut and another fix for lmsensors.

And they worked, so now we have clean report:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20151114_0349=
19.log/

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D


 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemuarm =3D=3D=3D
INFO: binutils-cross-i586 task do_configure.sigdata doesn't exist in qemuarm
INFO: gcc-cross-i586 task do_configure.sigdata doesn't exist in qemuarm
INFO: gcc-cross-initial-i586 task do_configure.sigdata doesn't exist in qem=
uarm
INFO: gdb-cross-i586 task do_configure.sigdata doesn't exist in qemuarm
INFO: grub-efi-native task do_configure.sigdata doesn't exist in qemuarm
INFO: libarchive-native task do_configure.sigdata doesn't exist in qemuarm
INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
INFO: ninja-native task do_configure.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemuarm =3D=3D=3D
INFO: binutils-cross-i586 task do_populate_sysroot.sigdata doesn't exist in=
 qemuarm
INFO: gcc-cross-i586 task do_populate_sysroot.sigdata doesn't exist in qemu=
arm
INFO: gcc-cross-initial-i586 task do_populate_sysroot.sigdata doesn't exist=
 in qemuarm
INFO: gdb-cross-i586 task do_populate_sysroot.sigdata doesn't exist in qemu=
arm
INFO: grub-efi-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: libarchive-native task do_populate_sysroot.sigdata doesn't exist in q=
emuarm
INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: ninja-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
INFO: Output written in: /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1447472959

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZG+eUACgkQN1Ujt2V2gBz8dACeL+ui8d9Q0gsU7LvbmBsc4rmH
+XQAoK5Qfx9L1dSvSg8yc1mo77/3hpKM
=Igz9
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
