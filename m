Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 05A2D7095B;
	Fri,  1 Aug 2014 13:45:49 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id w61so4399504wes.39
	for <multiple recipients>; Fri, 01 Aug 2014 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=yOaIysNHOmY/K+AA3Jg7G+WoOzV3JvWMausTL5vV9gY=;
	b=J36Sum3A2au8qCHSVuKgoNS7h16wuzKPUrsCnKg20dsUAhyDwvq1Bb5bze9h7X8MGW
	mRjI//QJJdiSS13YlX0+x0Kcn57CGHr0HAuSow1eb3tuTZmSLqLPs6+b12CYHp9DI2Kn
	/m/LhcK5A/u/MA31hHqk+Fs/L9k6YxfRR+eVZw0ajJuGzbsrq+8kLitA0F+I7SL+XOh2
	zua/eNFWb8Jz2+fOmuMO2Zr2u0zdaRyUbIicZjVKybcXuiWemSKiXgR/92eEgr/CB7Sr
	i0EzZEe4gJyh3QwCDsHeodgk5oMlK7tSD0nzOLMhIxea2eXlEfByFSi3pT3q/VlQouH7
	et7A==
X-Received: by 10.194.92.196 with SMTP id co4mr8263800wjb.4.1406900749772;
	Fri, 01 Aug 2014 06:45:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb12sm21054840wjc.43.2014.08.01.06.45.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Aug 2014 06:45:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Aug 2014 15:46:13 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140801134613.GE16445@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2014-08-01
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
X-List-Received-Date: Fri, 01 Aug 2014 13:45:52 -0000
X-Groupsio-MsgNum: 55843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z3SYAdNKCFJcUCPa"
Content-Disposition: inline

--z3SYAdNKCFJcUCPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 01:19:01PM +0200, Martin Jansa wrote:
> This is new report generated with oe-core/scripts/sstate-diff-machines.sh
> =20
> To reproduce it, you need "qemux86copy" MACHINE which is the same as
> qemux86 only with different name (to simulate 2 MACHINEs with same
> TUNE_PKGARCH in oe-core). You can find commit adding "qemux86copy" in
> jansa/master branch:
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/mast=
er
>=20
> Current logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20140724_01=
0942.log/
>=20
> jansa/master branches are containing couple of pending changes (mostly
> to remove allarch), so if you try it with current master branches it
> will be (a lot) worse.

Just for test I've just dropped these fixes, so a few more issues reported =
now:

ERROR: 63 issues were found in these recipes: android-tools dracut
font-alias initramfs-framework initscripts ipsec-tools linux-firmware
lmsensors oprofile oprofileui oprofileui-server
polkit-group-rule-datetime polkit-group-rule-network ppp-dialin
qt-demo-init resolvconf run-postinsts shr-theme-neo sysvinit
terminus-font tipcutils ttf-arphic-uming ttf-dejavu ttf-droid
ttf-gentium ttf-hunkyfonts ttf-inconsolata ttf-liberation ttf-mplus
ttf-sazanami ttf-ubuntu-font-family ttf-wqy-zenhei usbinit vpnc
weston-init xfce4-session xl2tpd xserver-common xserver-nodm-init
xuser-account

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 3e8511843eaec4de4d852bc3b386a55d to f18a23b247fc3189a3081e2dc04d0e3d

ERROR: oprofile different signature for task do_configure.sigdata between q=
emux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 3e8511843eaec4de4d852bc3b386a55d to f18a23b247fc3189a3081e2dc04d0e3d

ERROR: tipcutils different signature for task do_configure.sigdata between =
qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 3e8511843eaec4de4d852bc3b386a55d to f18a23b247fc3189a3081e2dc04d0e3d

ERROR: xl2tpd different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_populate_sysroot changed fro=
m 3e8511843eaec4de4d852bc3b386a55d to f18a23b247fc3189a3081e2dc04d0e3d

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406898142/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: initscripts different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_install changed from 72b0e3d2=
d0e2654ed6a9ff3dd3a2838b to 73f2ed4eac64af9a683aed0e5688dceb

ERROR: ipsec-tools different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
Hash for dependent task ipsec-tools_0.8.1.bb.do_install changed from f650c7=
6d114b302c12b94303c399d602 to 0faea78007ca49ea62a6627ce7edf381

ERROR: oprofile different signature for task do_populate_sysroot.sigdata be=
tween qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_install changed from e412b1370=
559b3fc32e9a910e38782ea to a092cf59553a026e6d855b6ba803b688

ERROR: tipcutils different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task tipcutils_2.0.6.bb.do_install changed from 1c938f40=
a33d4922188d722e847984a5 to 699f37d4ec6702e00dd93c3aad21936f

ERROR: xl2tpd different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
Hash for dependent task xl2tpd_git.bb.do_install changed from ad2f820cf91b8=
27dde15f5f0f77ca7a5 to 4710be85cf0be21111180c78d8f9bf45

ERROR: 5 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406898142/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: android-tools different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task android-tools-conf_1.0.bb.do_packagedata changed fr=
om e8e310154675159d2956e4a053105c0b to 37b4ca4c3e9a285eb86f73174ae0dbf3

ERROR: dracut different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from a4c=
1b4251533f148c52cb8005b6b25fd to bd6f3aab0a9fc649dc001f6f0af025c0

ERROR: initscripts different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_packagedata changed from 921c=
404b9096426b955823a07de48410 to 093e98928260f8c9763ba7a0b2d96ad0
Hash for dependent task initscripts_1.0.bb.do_package changed from c2071b8b=
86229d0b565b4ee11aea57d1 to 62321fe22c9108cfe0f16edd7cb1e89c

ERROR: ipsec-tools different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
Hash for dependent task ipsec-tools_0.8.1.bb.do_packagedata changed from fa=
9cdaa575083faabcc069a9cfe09bf9 to fc5805b77e77047d9008c2442c0acf63
Hash for dependent task ipsec-tools_0.8.1.bb.do_package changed from 0cfc15=
fa3734cf2deba43ff9932050e0 to b59e19423613be11805788cf0d7a6ce4

ERROR: lmsensors different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task lmsensors-config_1.0.bb.do_packagedata changed from=
 8ed0720ff28b05589b76689b3c647a33 to 4bb4279ffd941faff7a7e77e7360ddac

ERROR: oprofile different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_package changed from aed2c449d=
d1a8d4dd72e1c6a45d0536d to 25b52378620a04e0d5b5fcee6f5a225c
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from a4c=
1b4251533f148c52cb8005b6b25fd to bd6f3aab0a9fc649dc001f6f0af025c0
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from 2ab5e=
ad045e88721f2538893f16398d6 to ccef749493b4bfd56b5b45be994cdd4a

ERROR: oprofileui different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from 2ab5e=
ad045e88721f2538893f16398d6 to ccef749493b4bfd56b5b45be994cdd4a

ERROR: oprofileui-server different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from 2ab5e=
ad045e88721f2538893f16398d6 to ccef749493b4bfd56b5b45be994cdd4a

ERROR: sysvinit different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_packagedata changed from 921c=
404b9096426b955823a07de48410 to 093e98928260f8c9763ba7a0b2d96ad0

ERROR: tipcutils different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task tipcutils_2.0.6.bb.do_package changed from 6ba8b746=
84acf1a9efb4d37e341a9732 to c01aa78dba9d5d5def2bf8ab2ce8c42e
Hash for dependent task tipcutils_2.0.6.bb.do_packagedata changed from b1d1=
2435221273d360f7993ecdbf27ab to 19edad69e59359ba89c41ffdd03e7ae8

ERROR: vpnc different signature for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86
Hash for dependent task linux-yocto_3.14.bb.do_packagedata changed from a4c=
1b4251533f148c52cb8005b6b25fd to bd6f3aab0a9fc649dc001f6f0af025c0

ERROR: xfce4-session different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task xfce4-session_4.10.1.bb.do_packagedata changed from=
 0a977e36d057bf2bfa43b8f71f4a3888 to 089b8291b0c6c532cf8bc30bc5314f40
Hash for dependent task xfce4-session_4.10.1.bb.do_package changed from 817=
336503562f84f94c52a3e7b950cc3 to 37e23054abf7ff5e8329580c86a5e901

ERROR: xl2tpd different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
Hash for dependent task xl2tpd_git.bb.do_package changed from 4e1728ea06b0d=
f315011046518f0fe9e to af7b7b78775ddddf3023f9d5e78c9e72
Hash for dependent task xl2tpd_git.bb.do_packagedata changed from 605437ee2=
e5e761ff5b1787d73e53f10 to deebc161f5bfbd85a91d87f2f9f7fd85

ERROR: 13 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate=
-diff/1406898142/signatures.qemux86.do_package_write_ipk.sigdata.log


 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemuarm =3D=3D=3D
INFO: grub-efi-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: linux-firmware different signature for task do_configure.sigdata bet=
ween qemux86copy and qemuarm
Hash for dependent task opkg-utils_git.bb.do_populate_sysroot changed from =
22a102dad1985239799f76e82dd2f9ff to 4f34f6bddcbc08a621f91d6fe7c2e1be

INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_configure=
=2Esigdata between qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from 24=
137e78fec55fa53223165dbc676af6 to 0de22aaac38816a1657f1007bc6ba6e4
Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from 79=
f626d44390f073697a2fb58013061f to 55928efb7b53785d275dfbb47d5e9b2c
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 3fdc1e98b53d3c3aa1377b7dd48de1d3 to 2171ce9d585ed2c92327069195578849
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from a81c9ed6d1dba70d846a8cb0709318f0 to b243df66fd4a21129899020138b59172

ERROR: polkit-group-rule-network different signature for task do_configure.=
sigdata between qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from 24=
137e78fec55fa53223165dbc676af6 to 0de22aaac38816a1657f1007bc6ba6e4
Hash for dependent task polkit_0.111.bb.do_populate_sysroot changed from 79=
f626d44390f073697a2fb58013061f to 55928efb7b53785d275dfbb47d5e9b2c
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 3fdc1e98b53d3c3aa1377b7dd48de1d3 to 2171ce9d585ed2c92327069195578849
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from a81c9ed6d1dba70d846a8cb0709318f0 to b243df66fd4a21129899020138b59172

ERROR: ppp-dialin different signature for task do_configure.sigdata between=
 qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from 24=
137e78fec55fa53223165dbc676af6 to 0de22aaac38816a1657f1007bc6ba6e4
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 3fdc1e98b53d3c3aa1377b7dd48de1d3 to 2171ce9d585ed2c92327069195578849
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from a81c9ed6d1dba70d846a8cb0709318f0 to b243df66fd4a21129899020138b59172
Hash for dependent task ppp_2.4.6.bb.do_populate_sysroot changed from c0de0=
6d23e85e6270c441c4738fe737f to a1b7479b2defb6e60d9d47d151c3e720

ERROR: xserver-common different signature for task do_configure.sigdata bet=
ween qemux86copy and qemuarm
Hash for dependent task eglibc_2.19.bb.do_populate_sysroot changed from 51d=
0ec7e204bb57ed76e31233ede0218 to b2ef3db111e72612d0fc2f91197965dd

ERROR: xuser-account different signature for task do_configure.sigdata betw=
een qemux86copy and qemuarm
Hash for dependent task shadow_4.2.1.bb.do_populate_sysroot changed from 24=
137e78fec55fa53223165dbc676af6 to 0de22aaac38816a1657f1007bc6ba6e4
Hash for dependent task base-passwd_3.5.29.bb.do_populate_sysroot changed f=
rom 3fdc1e98b53d3c3aa1377b7dd48de1d3 to 2171ce9d585ed2c92327069195578849
Hash for dependent task shadow-sysroot_4.2.1.bb.do_populate_sysroot changed=
 from a81c9ed6d1dba70d846a8cb0709318f0 to b243df66fd4a21129899020138b59172

ERROR: 6 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406898142/signatures.qemuarm.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemuarm =3D=3D=3D
INFO: grub-efi-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
ERROR: linux-firmware different signature for task do_populate_sysroot.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task linux-firmware_git.bb.do_install changed from a7a16=
0288757fac03a8e2d3e3106b8f3 to 369c884d145b20983ed3026407bcff24

INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_populate_=
sysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-datetime.bb.do_install changed fr=
om 317f46839cfc68608efd44ccf8f3e21f to c6476f74ba37c4da1d99b9b3b31a31d5

ERROR: polkit-group-rule-network different signature for task do_populate_s=
ysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-network.bb.do_install changed fro=
m 9bec2939ed86f20222b621c22a92d829 to d90337ef72722970b24147d6fa8b03e1

ERROR: ppp-dialin different signature for task do_populate_sysroot.sigdata =
between qemux86copy and qemuarm
Hash for dependent task ppp-dialin_0.1.bb.do_install changed from eea685ef7=
789b4d4892c27b03307568f to 27663d210790da3ca2ecc73bbb3b2cdb

ERROR: xserver-common different signature for task do_populate_sysroot.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_install changed from 9066=
53a09ef7b3bda8f752815db42ed0 to f6d0b302d2e8b047cbdf893a3cc5ccf2

ERROR: xuser-account different signature for task do_populate_sysroot.sigda=
ta between qemux86copy and qemuarm
Hash for dependent task xuser-account_0.1.bb.do_install changed from 1b2161=
9dc4209442a12c6accbfb0e465 to 85efa71c73665ac93b2a1540e67e5e2c

ERROR: 6 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate-=
diff/1406898142/signatures.qemuarm.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
ERROR: font-alias different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task font-util_1.3.0.bb.do_packagedata changed from 2dbf=
0f870a8c94990be987d367aa8472 to 08b1d19de966eb466f91319f7410e5b0

ERROR: initramfs-framework different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
Hash for dependent task systemd_213.bb.do_packagedata changed from 5ff6759f=
e5db7d3212dd97ea638c324d to 3f52ae772e470076e59122bb83dbe012
Hash for dependent task busybox_1.22.1.bb.do_packagedata changed from 24ab9=
01bf1966e21249ed01764d2ccbd to c7b78e5c404995865c4ae8c4f4484eea

ERROR: linux-firmware different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task linux-firmware_git.bb.do_package changed from fc027=
6595b20aecaa5cb406a217b53c7 to edb9f2ec653ff14a66a0f631cf769cfc
Hash for dependent task linux-firmware_git.bb.do_packagedata changed from 6=
1b325e9f1da954c61ca03882b81a21c to dc4727479d5883b2706df55350fcec14

ERROR: polkit-group-rule-datetime different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-datetime.bb.do_package changed fr=
om 4a6b11e3197ff193aaf4caeaecbd1232 to abb00295c24d91d780675e12c2aa17c5
Hash for dependent task polkit-group-rule-datetime.bb.do_packagedata change=
d from f9e63f7543f01fabdaf5bc23ae807b42 to 082566d57276c4161883a98e1072fca5

ERROR: polkit-group-rule-network different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-network.bb.do_package changed fro=
m e6748fb7605b742addcf3fa9dd5bb2b6 to 524ad2d098d25c069c5490490524f7ce
Hash for dependent task polkit-group-rule-network.bb.do_packagedata changed=
 from fdb9bc093fd71129f831566ac22ae4a3 to 028820e9bcff0672b92015d5ed816ade

ERROR: ppp-dialin different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task ppp_2.4.6.bb.do_packagedata changed from 42f19c67e5=
2c996930d793514f36f364 to 8954284def8f598031b3d35cebaa3a9f
Hash for dependent task ppp-dialin_0.1.bb.do_packagedata changed from e9660=
57b2bd7a443e8637eab8e97694d to e1b6517f3cb540f0d0e36b1936619796
Hash for dependent task ppp-dialin_0.1.bb.do_package changed from 1cad4edd0=
e898b42c484577f9a8e67bb to 3bf94bb8487878ec87d5a25e3196c556

ERROR: qt-demo-init different signature for task do_package_write_ipk.sigda=
ta between qemux86copy and qemuarm
Hash for dependent task qt-demo-init_0.1.bb.do_packagedata changed from 86c=
7bd70f6bbb6c6511ffed83bad998e to 3b4daf50b5467826229fd8a5444e0f05
Hash for dependent task qt-demo-init_0.1.bb.do_package changed from 346333e=
c598ba5b90fc41a55efa5ef8d to 9333417f43007ba8df84106bf17ca515

ERROR: resolvconf different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task bash_4.3.bb.do_packagedata changed from cceda8626a1=
3e078220f076dfcb0cfbb to 32cd7ae25be44e6573b7f82265d2560c

ERROR: run-postinsts different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task run-postinsts_1.0.bb.do_package changed from 164b2e=
5134f4e3de9350bb6decfcd6a3 to 34593e4b49b9cb3b62cc070653cd610e
Hash for dependent task run-postinsts_1.0.bb.do_packagedata changed from c4=
5c971c3214e940b354bc3fe828aa7a to 25007c34e7918d58f647feaa5d857502

ERROR: shr-theme-neo different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task icon-theme-neo_git.bb.do_packagedata changed from 2=
15df2a4874a88a6cebd80fb32700cf5 to 990b5324ed192b6dc6efd7c2b727ff86

ERROR: terminus-font different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-arphic-uming different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-dejavu different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-droid different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-gentium different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-hunkyfonts different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-inconsolata different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-liberation different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-mplus different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-sazanami different signature for task do_package_write_ipk.sigda=
ta between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-ubuntu-font-family different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: ttf-wqy-zenhei different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from 4f=
71a0a7e854ca69da65c26fcd98a91b to 91cd49c0802ce78acc8b4ec001546c00

ERROR: usbinit different signature for task do_package_write_ipk.sigdata be=
tween qemux86copy and qemuarm
Hash for dependent task usbinit.bb.do_package changed from 9a21d6f1d49a1cd2=
9959e982eeda1211 to c1b6b877835f8bb6aacb32666d1b6b7c
Hash for dependent task usbinit.bb.do_packagedata changed from fa57ceb0bcaa=
715f76fd37bf50462020 to fc01b9489528908449fa09937e3126ef

ERROR: weston-init different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemuarm
Hash for dependent task kbd_2.0.2.bb.do_packagedata changed from 0bd6d92aa1=
b95d791a37b3d9c3617c18 to 7c1465bf38f0912efe488e5c3c3b4220
Hash for dependent task weston-init.bb.do_package changed from 61811c9d5539=
f5c25eb32b695169ffde to 69fd9ca85ffcd5bd88f9a36a2120b1eb
Hash for dependent task weston_1.5.0.bb.do_packagedata changed from 16cc30f=
1d817ab46c0c0784019167f14 to 864eff363bd55bb0e21b3d0c13943c09
Hash for dependent task weston-init.bb.do_packagedata changed from 2e6941b3=
38d4df24cde50437f8080166 to aa18e8ec3b9b707dd5b790ff32f8ab19

ERROR: xserver-common different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task xmodmap_1.0.8.bb.do_packagedata changed from e56777=
32b0f50d8b520e959a7cc2909a to c6448f0723bdb5bddd72364adab45c8f
Hash for dependent task xinput-calibrator_git.bb.do_packagedata changed fro=
m c5e00459883d68f080f48a50b00f4d47 to 044b597fe6ec91d4818cf97fead31f35
Hash for dependent task fbset_2.1.bb.do_packagedata changed from f92f42f442=
b6ace2774fdc17dc4eff48 to 1bfcc774a86125426b28c493754cdcfe
Hash for dependent task xserver-common_1.34.bb.do_package changed from 976a=
e86fe61ccfdabb4b49a037ac240c to 89c0a715e9a71743708a0fdcad9617b3
Hash for dependent task xdpyinfo_1.3.1.bb.do_packagedata changed from 93307=
a0445f65a509c8c9e4ea43491e7 to dbf828e629648b39701d401883889cac
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
b530af73b51509a768e45bc0ffded93f to a87d6bfdfa13db4a949ee0c42747b251
Hash for dependent task xrandr_1.4.2.bb.do_packagedata changed from ad2d5f3=
a4136e9ac3c4ff127cbe56fbf to a0deb74ceb3e115932c5826c4d8a6030

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
b530af73b51509a768e45bc0ffded93f to a87d6bfdfa13db4a949ee0c42747b251
Hash for dependent task xserver-nodm-init_2.0.bb.do_packagedata changed fro=
m 7b6b825e1e673a316adc4b38ce92282f to 3f9fcb75cbc02ecf9579a82825a35d1d
Hash for dependent task xinit_1.3.3.bb.do_packagedata changed from f6478b26=
b9dfb195fb038f8fb15ec887 to 835d26afbb5bcabe26fdf86eab2c4891
Hash for dependent task xserver-nodm-init_2.0.bb.do_package changed from cf=
f9777739918bf6eb66a26c3a961a29 to 120f7fb851bf426716aa73a642b9184b

ERROR: xuser-account different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task xuser-account_0.1.bb.do_packagedata changed from 34=
d7012d85fab9acdc3fac24d87dadfe to 7381885fbd715ef84c11b8466495ac36
Hash for dependent task xuser-account_0.1.bb.do_package changed from 3a0e03=
fb6d75b3bfd9fe3f0b930cdd1c to c21a29c9d84fc8e7ed911999cab635b4

ERROR: 27 errors found in /home/jenkins/oe/world/shr-core/tmp-eglibc/sstate=
-diff/1406898142/signatures.qemuarm.do_package_write_ipk.sigdata.log

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z3SYAdNKCFJcUCPa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPbmiUACgkQN1Ujt2V2gBwLJACfRWFA3Rc4jYe+0vP+kyDP4jUE
sKMAnRn3AtgIkdqQaA+PLCxsKFSTY2wG
=tuz9
-----END PGP SIGNATURE-----

--z3SYAdNKCFJcUCPa--
