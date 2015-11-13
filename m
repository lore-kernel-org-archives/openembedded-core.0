Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 289537734A;
	Fri, 13 Nov 2015 16:48:34 +0000 (UTC)
Received: by wmec201 with SMTP id c201so90354524wme.0;
	Fri, 13 Nov 2015 08:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=yjJBohOenCppYIbB1roIeNAQnQam0aG9uGLbIF7rlKg=;
	b=hqbkBLMWHEQBgOwnzhIm6+gXC9nfYTNfEv2epWqO3nKosiLOvzDOUaJKxH+4MWYNx9
	5Qf2mWN6ar5v9vQIjQ1Jj4BR/vkuWlGp9Srfbv/j4LZjnjdw4lnion34x///5d9r2GFk
	YM+3hs77neOEYDCMHxkhgTk6l9rsXEB/y4rNLfIbUgVmV/QP0Qb2Ab0rjBL8qy1VZ7o3
	/TwGTE+NqIpgFakom00mr0WiX7AMZfXnDyqvmiPXyRrwzPjjYjHqQCqACrmGJl4pyy5M
	fTrySB6hrSxJr4paMp9Khi6/hPB7FMbhxD5Oa7mLqOBRuiXwNEc/9yzZp7hA0YwEySmG
	OXwg==
X-Received: by 10.194.71.16 with SMTP id q16mr22593836wju.49.1447433314719;
	Fri, 13 Nov 2015 08:48:34 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 77sm4730120wml.20.2015.11.13.08.48.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 08:48:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Nov 2015 17:48:56 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151113164856.GE2567@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2015-11-13
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
X-List-Received-Date: Fri, 13 Nov 2015 16:48:36 -0000
X-Groupsio-MsgNum: 73421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 03:46:13PM +0200, Martin Jansa wrote:
> On Thu, Jul 24, 2014 at 01:19:01PM +0200, Martin Jansa wrote:
> > This is new report generated with oe-core/scripts/sstate-diff-machines.=
sh
> > =20
> > To reproduce it, you need "qemux86copy" MACHINE which is the same as
> > qemux86 only with different name (to simulate 2 MACHINEs with same
> > TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
> > jansa/master branch:
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/ma=
ster
> >=20
> > Current logs:
> > http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20140724_=
010942.log/
> >=20
> > jansa/master branches are containing couple of pending changes (mostly
> > to remove allarch), so if you try it with current master branches it
> > will be (a lot) worse.
>=20
> Just for test I've just dropped these fixes, so a few more issues reporte=
d now:
>=20
> ERROR: 63 issues were found in these recipes: android-tools dracut
> font-alias initramfs-framework initscripts ipsec-tools linux-firmware
> lmsensors oprofile oprofileui oprofileui-server
> polkit-group-rule-datetime polkit-group-rule-network ppp-dialin
> qt-demo-init resolvconf run-postinsts shr-theme-neo sysvinit
> terminus-font tipcutils ttf-arphic-uming ttf-dejavu ttf-droid
> ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-mplus
> ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei usbinit vpnc
> weston-init xfce4-session xl2tpd xserver-common xserver-nodm-init
> xuser-account

With patches I've sent yesterday we get to reasonable state.
ERROR: 2 issues were found in these recipes: dracut lmsensors

Complete log:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20151113_1540=
41.log/

I've already sent v2 for dracut and another fix for lmsensors.

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: dracut different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['bash-completionbash-completion_2.1.bb.do_package=
data', 'bashbash_4.3.30.bb.do_packagedata', 'busyboxbusybox_1.23.2.bb.do_pa=
ckagedata', 'coreutilscoreutils_8.24.bb.do_packagedata', 'cpiocpio_2.11.bb.=
do_packagedata', 'dracutdracut_git.bb.do_package', 'dracutdracut_git.bb.do_=
packagedata', 'findutilsfindutils_4.5.14.bb.do_packagedata', 'glibcglibc_2.=
22.bb.do_packagedata', 'linuxlinux-yocto_4.1.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4=
=2Ebb.do_populate_sysroot:virtual:native', 'systemdsystemd_225.bb.do_packag=
edata', 'util-linuxutil-linux_2.26.2.bb.do_packagedata'] to ['bash-completi=
onbash-completion_2.1.bb.do_packagedata', 'bashbash_4.3.30.bb.do_packagedat=
a', 'busyboxbusybox_1.23.2.bb.do_packagedata', 'coreutilscoreutils_8.24.bb.=
do_packagedata', 'cpiocpio_2.11.bb.do_packagedata', 'dracutdracut_git.bb.do=
_package', 'dracutdracut_git.bb.do_packagedata', 'findutilsfindutils_4.5.14=
=2Ebb.do_packagedata', 'glibcglibc_2.22.bb.do_packagedata', 'linuxlinux-yoc=
to_4.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot=
:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native=
', 'systemdsystemd_225.bb.do_packagedata', 'util-linuxutil-linux_2.26.2.bb.=
do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash c7d89376b468c84d1beb8eab1754ee=
87
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash 456a30c47c28e7d6a848428e5f5dbb=
e2
Hash for dependent task linuxlinux-yocto_4.1.bb.do_packagedata changed from=
 c7d89376b468c84d1beb8eab1754ee87 to 456a30c47c28e7d6a848428e5f5dbbe2

ERROR: lmsensors different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'lm_sensorsl=
msensors-config_1.0.bb.do_packagedata', 'lm_sensorslmsensors_3.4.0.bb.do_pa=
ckage', 'lm_sensorslmsensors_3.4.0.bb.do_packagedata', 'opkg-utilsopkg-util=
s_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packag=
edata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'rrdtoo=
lrrdtool_1.5.4.bb.do_packagedata'] to ['bashbash_4.3.30.bb.do_packagedata',=
 'lm_sensorslmsensors-config_1.0.bb.do_packagedata', 'lm_sensorslmsensors_3=
=2E4.0.bb.do_package', 'lm_sensorslmsensors_3.4.0.bb.do_packagedata', 'opkg=
-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22=
=2E0.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual=
:native', 'rrdtoolrrdtool_1.5.4.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors-config_1.0.bb.do_packagedata with hash 26762e381db19859=
b96a0c8ce13ee808
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors-config_1.0.bb.do_packagedata with hash a94903117ba4beac=
7f22a4edd3084d9b
Hash for dependent task lm_sensorslmsensors-config_1.0.bb.do_packagedata ch=
anged from 26762e381db19859b96a0c8ce13ee808 to a94903117ba4beac7f22a4edd308=
4d9b

ERROR: 2 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1447429242/signatures.qemux86.do_package_write_ipk.sigdata.log


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
ERROR: 2 issues were found in these recipes: dracut lmsensors

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZGFHgACgkQN1Ujt2V2gByyVQCfS6XYxsvzTnDAB/aXoN4fy/vK
/yUAn10FlN4rHGt8IGuLLtsDvzOtIYKY
=PQVb
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
