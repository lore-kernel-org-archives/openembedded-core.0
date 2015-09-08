Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id EB58F65C8A;
	Tue,  8 Sep 2015 17:08:56 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so127977276wic.1;
	Tue, 08 Sep 2015 10:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TrpFb0uvaqJf75AnIhpIlnqxrdMyEei8MFSUbI3UVLo=;
	b=u+/jvnmvDHV/5HIWMHJYOtSs1tasLezSTGbC5qJW8dk+3NIH3u8V2X10t4b+OSH2UD
	TsPaihkBnU5MZy2DTnU+qxF5HUvMzox/HI8zlqCBF+4CZ+pAZjg4YwDWA2EhOdO43Qmx
	ZfMX5hIcRPZNK7W+6O90DjFIww/bMmqikSLEZXBm+ie1EHY5UZu38T6cwk1RVnwFr0Vg
	yFGDox9boOWdceBTM3Uo2C400GozzM1OvdkDdJac7xZGc67Yk+F3yy8ub9ddliIoccco
	2IiVr2yFzxC2HXFm2bENhHjo3ZPtZZ7Y+j7CUAC7stnIPNcM6zyRvJsBkbjBI2z+ngBc
	NlwQ==
X-Received: by 10.194.238.202 with SMTP id vm10mr40930505wjc.96.1441732136019; 
	Tue, 08 Sep 2015 10:08:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb9sm4086329wjb.49.2015.09.08.10.08.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 10:08:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 19:09:42 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20150908170942.GE2381@jama>
References: <20150908155801.GD2381@jama>
MIME-Version: 1.0
In-Reply-To: <20150908155801.GD2381@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: State of bitbake world, wrong PACKAGE_ARCHs 2015-09-08
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
X-List-Received-Date: Tue, 08 Sep 2015 17:08:58 -0000
X-Groupsio-MsgNum: 70836
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vv4Sf/kQfcwinyKX"
Content-Disposition: inline

--vv4Sf/kQfcwinyKX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 05:58:01PM +0200, Martin Jansa wrote:
> On Fri, Aug 01, 2014 at 03:46:13PM +0200, Martin Jansa wrote:
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
> ERROR: 154 issues were found in these recipes: android-tools
> cmake-modules-webos-native cpushareholder-stub cryptodev-tests dracut
> initscripts ipsec-tools libauthen-sasl-perl libdigest-hmac-perl
> libio-socket-ssl-perl libpbnjson librolegen linux-atm lmsensors
> lttng-tools luna-next luna-prefs luna-service2 luna-sysmgr-common
> luna-sysmgr-ipc luna-sysmgr-ipc-messages luna-webkit-api netmap nyx-lib
> openlmi-networking openlmi-providers openlmi-storage oprofile oprofileui
> oprofileui-server packagegroup-efl-sdk phpmyadmin pmloglib
> pmloglib-private polkit-group-rule-datetime polkit-group-rule-network
> qt5-creator qtquick1 qtwebkit qtwebkit-examples rdx-utils-stub
> serviceinstaller shr-theme-neo terminus-font tipcutils ttf-arphic-uming
> ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts ttf-inconsolata
> ttf-liberation ttf-mplus ttf-sazanami ttf-tlwg ttf-ubuntu-font-family
> ttf-wqy-zenhei xfce4-session xl2tpd xserver-common xserver-nodm-init
> zabbix
>=20
> Some of these are caused by cmake-modules-webos-native so I'll fix this
> one first and then resend hopefully nicer-looking report.
>=20
> Complete logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20150908_15=
0743.log/

With webos_cmake.bbclass fix:
ERROR: 84 issues were found in these recipes: android-tools
cryptodev-tests dracut initscripts ipsec-tools libauthen-sasl-perl
libdigest-hmac-perl libio-socket-ssl-perl linux-atm lmsensors
lttng-tools luna-sysmgr-ipc-messages netmap openlmi-networking
openlmi-providers openlmi-storage oprofile oprofileui oprofileui-server
packagegroup-efl-sdk phpmyadmin polkit-group-rule-datetime
polkit-group-rule-network shr-theme-neo terminus-font tipcutils
ttf-arphic-uming ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts
ttf-inconsolata ttf-liberation ttf-mplus ttf-sazanami ttf-tlwg
ttf-ubuntu-font-family ttf-wqy-zenhei xfce4-session xl2tpd
xserver-common xserver-nodm-init zabbix

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: cryptodev-tests different signature for task do_configure.sigdata be=
tween qemux86copy and qemux86
basehash changed from c5c8fa7297a528f71e605d1f5d89052f to 35023112732439d9d=
c2ac391d1362d6b
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.3=
9.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_4.9.bb.do_populate_=
sysroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.=
do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virt=
ual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cr=
oss_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_popul=
ate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenss=
l_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysr=
oot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot'] to ['autoco=
nfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1=
=2E15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.bb.do_popul=
ate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroot:virtua=
l:native', 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.b=
b.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-conf=
iggnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-toolsipsec-=
tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroo=
t', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto=
_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_populate_sysroot=
', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystemd-systemctl=
-native.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash facb47a19133e8eb0b584ee6d=
4d4c591
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash a38e61920c1086b5de02d3789=
1c05173
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from facb47a19133e8eb0b584ee6d4d4c591 to a38e61920c1086b5de02d37891c05173

ERROR: linux-atm different signature for task do_configure.sigdata between =
qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'flexflex_2.5.39.bb.do_populate_sysroot', 'flexflex_2.5.39.bb.do_populate=
_sysroot:virtual:native', 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgc=
c-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'li=
btoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.=
4.6.bb.do_populate_sysroot', 'linux-atmlinux-atm_2.5.2.bb.do_patch', 'linux=
linux-yocto_4.1.bb.do_populate_sysroot', 'pkgconfigpkgconfig_git.bb.do_popu=
late_sysroot:virtual:native'] to ['autoconfautoconf_2.69.bb.do_populate_sys=
root:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual=
:native', 'flexflex_2.5.39.bb.do_populate_sysroot', 'flexflex_2.5.39.bb.do_=
populate_sysroot:virtual:native', 'gccgcc-cross_4.9.bb.do_populate_sysroot'=
, 'gccgcc-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_popul=
ate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:nati=
ve', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-n=
ative_2.4.6.bb.do_populate_sysroot', 'linux-atmlinux-atm_2.5.2.bb.do_patch'=
, 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pkgconfigpkgconfig_git.bb=
=2Edo_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash facb47a19133e8eb0b584ee6d=
4d4c591
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash a38e61920c1086b5de02d3789=
1c05173
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from facb47a19133e8eb0b584ee6d4d4c591 to a38e61920c1086b5de02d37891c05173

ERROR: lmsensors different signature for task do_configure.sigdata between =
qemux86copy and qemux86
basehash changed from 277e4330f0d2cfa1aa904b22dcdb2c88 to cfdb2dd50ea79ab9c=
6feb30b3f2fe2f4
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: lttng-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
basehash changed from a076e28db005fd6980b3f3c06b3e9bd8 to 7a5cc9605e87571de=
37ece54f6708647
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: netmap different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
basehash changed from 756cf4b0206e4b9145eda901fe2f306c to fa2e5d7e5eecb52de=
1faf3970a2935b6
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: openlmi-networking different signature for task do_configure.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-n=
ative_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroo=
t', 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_po=
pulate_sysroot', 'glib-2.0glib-2.0_2.44.1.bb.do_populate_sysroot', 'glibcgl=
ibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_=
sysroot:virtual:native', 'konkretcmpikonkretcmpi_0.9.2.bb.do_populate_sysro=
ot', 'libchecklibcheck_0.10.0.bb.do_populate_sysroot', 'libtoollibtool-cros=
s_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populat=
e_sysroot', 'networkmanagernetworkmanager_1.0.4.bb.do_populate_sysroot', 'o=
penlmiopenlmi-networking_0.3.1.bb.do_generate_toolchain_file', 'openlmiopen=
lmi-networking_0.3.1.bb.do_patch', 'openlmiopenlmi-providers_0.6.0.bb.do_po=
pulate_sysroot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sys=
root'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', '=
automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'cim-schemaci=
m-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-native_3.3.1.bb.=
do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroot', 'gccgcc-cro=
ss_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot'=
, 'glib-2.0glib-2.0_2.44.1.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_=
populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual=
:native', 'konkretcmpikonkretcmpi_0.9.2.bb.do_populate_sysroot', 'libcheckl=
ibcheck_0.10.0.bb.do_populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_p=
opulate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'ne=
tworkmanagernetworkmanager_1.0.4.bb.do_populate_sysroot', 'openlmiopenlmi-n=
etworking_0.3.1.bb.do_generate_toolchain_file', 'openlmiopenlmi-networking_=
0.3.1.bb.do_patch', 'openlmiopenlmi-providers_0.6.0.bb.do_populate_sysroot'=
, 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash a8389723a6=
516a35bbb282de0cd1c1b7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash a3a15b5409=
f398a272473c28d0c5e835
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_populate_sysro=
ot changed from a8389723a6516a35bbb282de0cd1c1b7 to a3a15b5409f398a272473c2=
8d0c5e835

ERROR: openlmi-providers different signature for task do_configure.sigdata =
between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-n=
ative_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroo=
t', 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_po=
pulate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-c=
onfig_git.bb.do_populate_sysroot:virtual:native', 'konkretcmpikonkretcmpi-n=
ative_0.9.2.bb.do_populate_sysroot', 'konkretcmpikonkretcmpi_0.9.2.bb.do_po=
pulate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libt=
oollibtool-native_2.4.6.bb.do_populate_sysroot', 'libuserlibuser_0.62.bb.do=
_populate_sysroot', 'lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot', 'op=
enlmiopenlmi-providers_0.6.0.bb.do_generate_toolchain_file', 'openlmiopenlm=
i-providers_0.6.0.bb.do_patch', 'pciutilspciutils_3.3.1.bb.do_populate_sysr=
oot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot', 'sbl=
im-sfcbsblim-sfcb_1.4.8.bb.do_populate_sysroot', 'swigswig_3.0.6.bb.do_popu=
late_sysroot', 'swigswig_3.0.6.bb.do_populate_sysroot:virtual:native', 'sys=
temdsystemd-systemctl-native.bb.do_populate_sysroot', 'systemdsystemd_219.b=
b.do_populate_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:v=
irtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:nativ=
e', 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake=
-native_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysr=
oot', 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_=
populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu=
-config_git.bb.do_populate_sysroot:virtual:native', 'konkretcmpikonkretcmpi=
-native_0.9.2.bb.do_populate_sysroot', 'konkretcmpikonkretcmpi_0.9.2.bb.do_=
populate_sysroot', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'li=
btoollibtool-native_2.4.6.bb.do_populate_sysroot', 'libuserlibuser_0.62.bb.=
do_populate_sysroot', 'lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot', '=
openlmiopenlmi-providers_0.6.0.bb.do_generate_toolchain_file', 'openlmiopen=
lmi-providers_0.6.0.bb.do_patch', 'pciutilspciutils_3.3.1.bb.do_populate_sy=
sroot', 'sblim-cmpi-develsblim-cmpi-devel_2.0.3.bb.do_populate_sysroot', 's=
blim-sfcbsblim-sfcb_1.4.8.bb.do_populate_sysroot', 'swigswig_3.0.6.bb.do_po=
pulate_sysroot', 'swigswig_3.0.6.bb.do_populate_sysroot:virtual:native', 's=
ystemdsystemd-systemctl-native.bb.do_populate_sysroot', 'systemdsystemd_219=
=2Ebb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_populate_sysroot with hash 3b025a1d38f9dc63=
6d0c590129be8c0b
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_populate_sysroot with hash f4a10b6391b25f1c=
09f846619a339dfe
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot ch=
anged from 3b025a1d38f9dc636d0c590129be8c0b to f4a10b6391b25f1c09f846619a33=
9dfe

ERROR: openlmi-storage different signature for task do_configure.sigdata be=
tween qemux86copy and qemux86
runtaskdeps changed from ['cmpi-bindingscmpi-bindings_git.bb.do_populate_sy=
sroot', 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.d=
o_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'openlmiopen=
lmi-providers_0.6.0.bb.do_populate_sysroot', 'openlmiopenlmi-storage_0.8.1.=
bb.do_patch', 'pythonpython-native_2.7.9.bb.do_populate_sysroot', 'pythonpy=
thon-setuptools_18.2.bb.do_populate_sysroot:virtual:native', 'pythonpython_=
2.7.9.bb.do_populate_sysroot', 'pywbempywbem_0.8.0.bb.do_populate_sysroot']=
 to ['cmpi-bindingscmpi-bindings_git.bb.do_populate_sysroot', 'gccgcc-cross=
_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot', =
'glibcglibc_2.22.bb.do_populate_sysroot', 'openlmiopenlmi-providers_0.6.0.b=
b.do_populate_sysroot', 'openlmiopenlmi-storage_0.8.1.bb.do_patch', 'python=
python-native_2.7.9.bb.do_populate_sysroot', 'pythonpython-setuptools_18.2.=
bb.do_populate_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_populate_=
sysroot', 'pywbempywbem_0.8.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash a8389723a6=
516a35bbb282de0cd1c1b7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash a3a15b5409=
f398a272473c28d0c5e835
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_populate_sysro=
ot changed from a8389723a6516a35bbb282de0cd1c1b7 to a3a15b5409f398a272473c2=
8d0c5e835

ERROR: oprofile different signature for task do_configure.sigdata between q=
emux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'binutilsbinutils_2.25.1.bb.do_populate_sysroot', 'gccgcc-cross_4.9.bb.do=
_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot', 'glibcglib=
c_2.22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sy=
sroot:virtual:native', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot',=
 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto_4.=
1.bb.do_populate_sysroot', 'oprofileoprofile_1.1.0.bb.do_patch', 'pkgconfig=
pkgconfig_git.bb.do_populate_sysroot:virtual:native', 'poptpopt_1.16.bb.do_=
populate_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtua=
l:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', '=
binutilsbinutils_2.25.1.bb.do_populate_sysroot', 'gccgcc-cross_4.9.bb.do_po=
pulate_sysroot', 'gccgcc-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2=
=2E22.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sys=
root:virtual:native', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', =
'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto_4.1=
=2Ebb.do_populate_sysroot', 'oprofileoprofile_1.1.0.bb.do_patch', 'pkgconfi=
gpkgconfig_git.bb.do_populate_sysroot:virtual:native', 'poptpopt_1.16.bb.do=
_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash facb47a19133e8eb0b584ee6d=
4d4c591
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash a38e61920c1086b5de02d3789=
1c05173
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from facb47a19133e8eb0b584ee6d4d4c591 to a38e61920c1086b5de02d37891c05173

ERROR: tipcutils different signature for task do_configure.sigdata between =
qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_popu=
late_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-con=
fig_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6=
=2Ebb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sys=
root', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'tipcutilstipcutils_2=
=2E0.6.bb.do_patch'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virt=
ual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native',=
 'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_popul=
ate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-conf=
ig_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6.=
bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroo=
t', 'linuxlinux-yocto_4.1.bb.do_popupd different signature for task do_conf=
igure.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgc=
c-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pppppp_2.4.7.bb.do_po=
pulate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot', 'upda=
te-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tp=
d_git.bb.do_patch'] to ['gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-=
runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroo=
t', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pppppp_2.4.7.bb.do_popu=
late_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot', 'update=
-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tpd_=
git.bb.do_patch']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash facb47a19133e8eb0b584ee6d=
4d4c591
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash a38e61920c1086b5de02d3789=
1c05173
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from facb47a19133e8eb0b584ee6d4d4c591 to a38e61920c1086b5de02d37891c05173

ERROR: zabbix different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
basehash changed from 07d0167b6867f5f52bca1a6335a5935b to 9dcf0a2c57c16e425=
41df8857d9d72d9
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: 13 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1441728995/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: cryptodev-tests different signature for task do_populate_sysroot.sig=
data between qemux86copy and qemux86
runtaskdeps changed from ['cryptodevcryptodev-tests_1.7.bb.do_install'] to =
['cryptodevcryptodev-tests_1.7.bb.do_install']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/crypt=
odev/cryptodev-tests_1.7.bb.do_install with hash 354a94b2d9902ed4dcd6f754ca=
fcf984
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/crypt=
odev/cryptodev-tests_1.7.bb.do_install with hash 3643408cb4f8439065de8f39fe=
e89d00
Hash for dependent task cryptodevcryptodev-tests_1.7.bb.do_install changed =
=66rom 354a94b2d9902ed4dcd6f754cafcf984 to 3643408cb4f8439065de8f39fee89d00

ERROR: initscripts different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['initscriptsinitscripts_1.0.bb.do_install'] to ['=
initscriptsinitscripts_1.0.bb.do_install']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_install with hash b18ef649395772579c4a1eb74bf4dc=
0d
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_install with hash 90d3335cb0ca6e2c2b27beab0d9297=
da
Hash for dependent task initscriptsinitscripts_1.0.bb.do_install changed fr=
om b18ef649395772579c4a1eb74bf4dc0d to 90d3335cb0ca6e2c2b27beab0d9297da

ERROR: ipsec-tools different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['ipsec-toolsipsec-tools_0.8.2.bb.do_install'] to =
['ipsec-toolsipsec-tools_0.8.2.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_install with hash f8c55148a8aa0d=
012a451577b73ec56e
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_install with hash a57cb33e611670=
4af70697c489173b74
Hash for dependent task ipsec-toolsipsec-tools_0.8.2.bb.do_install changed =
=66rom f8c55148a8aa0d012a451577b73ec56e to a57cb33e6116704af70697c489173b74

ERROR: linux-atm different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['linux-atmlinux-atm_2.5.2.bb.do_install'] to ['li=
nux-atmlinux-atm_2.5.2.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_install with hash 9f7a78150d9600456d=
e1aee671f09869
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_install with hash 7209d021223c4a0ea7=
48e5f21a16c10f
Hash for dependent task linux-atmlinux-atm_2.5.2.bb.do_install changed from=
 9f7a78150d9600456de1aee671f09869 to 7209d021223c4a0ea748e5f21a16c10f

ERROR: lmsensors different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['lm_sensorslmsensors_3.4.0.bb.do_install'] to ['l=
m_sensorslmsensors_3.4.0.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_install with hash 519acab61a44a7a1f1046137c=
bd6a734
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_install with hash 620a56499639f849c74ca85f0=
c350fad
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_install changed fro=
m 519acab61a44a7a1f1046137cbd6a734 to 620a56499639f849c74ca85f0c350fad

ERROR: lttng-tools different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
basehash changed from 77b5b130be20179ed58ccf20cde8f384 to 183762c4324ad24ac=
cd3089576e1542e
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
runtaskdeps changed from ['lttnglttng-tools_2.6.0.bb.do_install'] to ['lttn=
glttng-tools_2.6.0.bb.do_install']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lttng=
/lttng-tools_2.6.0.bb.do_install with hash 10894ee1e655d9001c52b4beb97f07a6
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lttng=
/lttng-tools_2.6.0.bb.do_install with hash ff7f6030373384b86da24a0576e8871a
Hash for dependent task lttnglttng-tools_2.6.0.bb.do_install changed from 1=
0894ee1e655d9001c52b4beb97f07a6 to ff7f6030373384b86da24a0576e8871a

ERROR: netmap different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['netmapnetmap_git.bb.do_install'] to ['netmapnetm=
ap_git.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_install with hash e8c2c9f870f580b4905f70f4877=
429c5
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_install with hash 2816f8c844aad6595470babd28c=
ca5fa
Hash for dependent task netmapnetmap_git.bb.do_install changed from e8c2c9f=
870f580b4905f70f4877429c5 to 2816f8c844aad6595470babd28cca5fa

ERROR: openlmi-networking different signature for task do_populate_sysroot.=
sigdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-networking_0.3.1.bb.do_install'] =
to ['openlmiopenlmi-networking_0.3.1.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_install with hash 4a0667c456f400b022=
3b5e938dde7a30
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_install with hash 32ad9bf1fe24d84397=
6cdcc5a660837d
Hash for dependent task openlmiopenlmi-networking_0.3.1.bb.do_install chang=
ed from 4a0667c456f400b0223b5e938dde7a30 to 32ad9bf1fe24d843976cdcc5a660837d

ERROR: openlmi-providers different signature for task do_populate_sysroot.s=
igdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-providers_0.6.0.bb.do_install'] t=
o ['openlmiopenlmi-providers_0.6.0.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_install with hash ef421b1d28fa152741c=
70d088ec0570c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_install with hash fa9c30a9e5996ab4186=
4adb8f273c0bb
Hash for dependent task 86
runtaskdeps changed from ['openlmiopenlmi-storage_0.8.1.bb.do_install'] to =
['openlmiopenlmi-storage_0.8.1.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_install with hash caf0ed9b9560590a2fe25=
5663bc43c46
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_install with hash 4a8760daa49dbd0ea6a73=
b64f3f3046a
Hash for dependent task openlmiopenlmi-storage_0.8.1.bb.do_install changed =
=66rom caf0ed9b9560590a2fe255663bc43c46 to 4a8760daa49dbd0ea6a73b64f3f3046a

ERROR: oprofile different signature for task do_populate_sysroot.sigdata be=
tween qemux86copy and qemux86
runtaskdeps changed from ['oprofileoprofile_1.1.0.bb.do_install'] to ['opro=
fileoprofile_1.1.0.bb.do_install']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_install with hash bddc209d6d3f6053defb8cfd180bb42c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_install with hash 211170f1a3c82ea0fb7a1ab8ae15d936
Hash for dependent task oprofileoprofile_1.1.0.bb.do_install changed from b=
ddc209d6d3f6053defb8cfd180bb42c to 211170f1a3c82ea0fb7a1ab8ae15d936

ERROR: tipcutils different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['tipcutilstipcutils_2.0.6.bb.do_install'] to ['ti=
pcutilstipcutils_2.0.6.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_install with hash cadb337179d501a63315abd4a=
4cdb91e
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_install with hash 5cd78cb87c3299eefb35c2b2f=
76ffcd9
Hash for dependent task tipcutilstipcutils_2.0.6.bb.do_install changed from=
 cadb337179d501a63315abd4a4cdb91e to 5cd78cb87c3299eefb35c2b2f76ffcd9

ERROR: xl2tpd different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['xl2tpdxl2tpd_git.bb.do_install'] to ['xl2tpdxl2t=
pd_git.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_git.bb.do_install with hash 70a0a3a63536eab99b11cef1=
575b2e3b
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_git.bb.do_install with hash 3e10a4c6d299bb920ae07b1b=
d2bb5f1f
Hash for dependent task xl2tpdxl2tpd_git.bb.do_install changed from 70a0a3a=
63536eab99b11cef1575b2e3b to 3e10a4c6d299bb920ae07b1bd2bb5f1f

ERROR: zabbix different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['zabbixzabbix_2.4.5.bb.do_install'] to ['zabbixza=
bbix_2.4.5.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_install with hash 8ac859e7d7f7e5ad561800fba96=
5a3c8
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_install with hash 3e1eaab1e5e931e9817cf89f764=
05633
Hash for dependent task zabbixzabbix_2.4.5.bb.do_install changed from 8ac85=
9e7d7f7e5ad561800fba965a3c8 to 3e1eaab1e5e931e9817cf89f76405633

ERROR: 14 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1441728995/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: android-tools difpackagedata', 'opkg-utilsopkg-utils_git.bb.do_popul=
ate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:vir=
tual:native'] to ['android-toolsandroid-tools-conf_1.0.bb.do_packagedata', =
'android-toolsandroid-tools_4.2.2.bb.do_package', 'android-toolsandroid-too=
ls_4.2.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysro=
ot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:nati=
ve']
/home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-androi=
d/android-tools/android-tools-conf_1.0.bb.do_packagedata with hash ff00cc13=
7bcf384e70c015d4259413ee
 changed to
/home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-androi=
d/android-tools/android-tools-conf_1.0.bb.do_packagedata with hash 7d544275=
ae88a0276796d198ee631098
Hash for dependent task android-toolsandroid-tools-conf_1.0.bb.do_packageda=
ta changed from ff00cc137bcf384e70c015d4259413ee to 7d544275ae88a0276796d19=
8ee631098

ERROR: cryptodev-tests different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemux86
runtaskdeps changed from ['cryptodevcryptodev-tests_1.7.bb.do_package', 'cr=
yptodevcryptodev-tests_1.7.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb=
=2Edo_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_=
sysroot:virtual:native'] to ['cryptodevcryptodev-tests_1.7.bb.do_package', =
'cryptodevcryptodev-tests_1.7.bb.do_packagedata', 'opkg-utilsopkg-utils_git=
=2Ebb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_popula=
te_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/crypt=
odev/cryptodev-tests_1.7.bb.do_package with hash 2c02da55d13ad435d0b04722e1=
41bb70
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/crypt=
odev/cryptodev-tests_1.7.bb.do_package with hash 6321c61180c95cb741d79f5acc=
bd8c47
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/crypt=
odev/cryptodev-tests_1.7.bb.do_packagedata with hash 7ffdd9f29516381e43a319=
06a49c68be
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/crypt=
odev/cryptodev-tests_1.7.bb.do_packagedata with hash db931e5f6e412333f8a1fa=
8fab316fc3
Hash for dependent task cryptodevcryptodev-tests_1.7.bb.do_packagedata chan=
ged from 7ffdd9f29516381e43a31906a49c68be to db931e5f6e412333f8a1fa8fab316f=
c3
Hash for dependent task cryptodevcryptodev-tests_1.7.bb.do_package changed =
=66rom 2c02da55d13ad435d0b04722e141bb70 to 6321c61180c95cb741d79f5accbd8c47

ERROR: dracut different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['bash-completionbash-completion_2.1.bb.do_package=
data', 'bashbash_4.3.30.bb.do_packagedata', 'busyboxbusybox_1.23.2.bb.do_pa=
ckagedata', 'coreutilscoreutils_8.24.bb.do_packagedata', 'cpiocpio_2.11.bb.=
do_packagedata', 'dracutdracut_git.bb.do_package', 'dracutdracut_git.bb.do_=
packagedata', 'findutilsfindutils_4.5.14.bb.do_packagedata', 'glibcglibc_2.=
22.bb.do_packagedata', 'linuxlinux-yocto_4.1.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7=
=2Ebb.do_populate_sysroot:virtual:native', 'systemdsystemd_219.bb.do_packag=
edata', 'util-linuxutil-linux_2.26.2.bb.do_packagedata'] to ['bash-completi=
onbash-completion_2.1.bb.do_packagedata', 'bashbash_4.3.30.bb.do_packagedat=
a', 'busyboxbusybox_1.23.2.bb.do_packagedata', 'coreutilscoreutils_8.24.bb.=
do_packagedata', 'cpiocpio_2.11.bb.do_packagedata', 'dracutdracut_git.bb.do=
_package', 'dracutdracut_git.bb.do_packagedata', 'findutilsfindutils_4.5.14=
=2Ebb.do_packagedata', 'glibcglibc_2.22.bb.do_packagedata', 'linuxlinux-yoc=
to_4.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot=
:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native=
', 'systemdsystemd_219.bb.do_packagedata', 'util-linuxutil-linux_2.26.2.bb.=
do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash 91797942e4a4c052d0090804d8451a=
af
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash 6155510c8ed262a8123d60758fa5dd=
1c
Hash for dependent task linuxlinux-yocto_4.1.bb.do_packagedata changed from=
 91797942e4a4c052d0090804d8451aaf to 6155510c8ed262a8123d60758fa5dd1c

ERROR: initscripts different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
runtaskdeps changed from ['initscriptsinitscripts_1.0.bb.do_package', 'init=
scriptsinitscripts_1.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_=
populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroo=
t:virtual:native'] to ['initscriptsinitscripts_1.0.bb.do_package', 'initscr=
iptsinitscripts_1.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_pop=
ulate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:v=
irtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_package with hash ebbaaf8c3026faf1604eb07b7766a4=
df
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_package with hash c5b7c9b51994503be6e890a54b6c5c=
b0
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_packagedata with hash fe584ea53146e9a10cebd9c59c=
dbf473
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_packagedata with hash 8043c1c39c9c56309b8a0067f9=
991bb4
Hash for dependent task initscriptsinitscripts_1.0.bb.do_packagedata change=
d from fe584ea53146e9a10cebd9c59cdbf473 to 8043c1c39c9c56309b8a0067f9991bb4
Hash for dependent task initscriptsinitscripts_1.0.bb.do_package changed fr=
om ebbaaf8c3026faf1604eb07b7766a4df to c5b7c9b51994503be6e890a54b6c5cb0

ERROR: ipsec-tools different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
runtaskdeps changed from ['ipsec-toolsipsec-tools_0.8.2.bb.do_package', 'ip=
sec-toolsipsec-tools_0.8.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb=
=2Edo_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_=
sysroot:virtual:native'] to ['ipsec-toolsipsec-tools_0.8.2.bb.do_package', =
'ipsec-toolsipsec-tools_0.8.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git=
=2Ebb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_popula=
te_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_package with hash a4f078b7a756e6=
1a63d6c0b0667bfee4
 changed ackagedata with hash dc1061342a53acda8cdb80e62326c75e
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_packagedata with hash 6731552406=
3671489e4961dc5f5fba7c
Hash for dependent task ipsec-toolsipsec-tools_0.8.2.bb.do_package changed =
=66rom a4f078b7a756e61a63d6c0b0667bfee4 to 944d5bdd0e0e7beea67ad185f67d6af8
Hash for dependent task ipsec-toolsipsec-tools_0.8.2.bb.do_packagedata chan=
ged from dc1061342a53acda8cdb80e62326c75e to 67315524063671489e4961dc5f5fba=
7c

ERROR: linux-atm different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
runtaskdeps changed from ['linux-atmlinux-atm_2.5.2.bb.do_package', 'linux-=
atmlinux-atm_2.5.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popu=
late_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:vi=
rtual:native'] to ['linux-atmlinux-atm_2.5.2.bb.do_package', 'linux-atmlinu=
x-atm_2.5.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sy=
sroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:n=
ative']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_package with hash 0f651c75ca85d6204f=
a743a56632251f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_package with hash dccda0d8fe725ef1a0=
af039928b0dc17
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_packagedata with hash 73223c232e58c7=
9eeb5963bce67021cc
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_packagedata with hash c700eb96a86e99=
c6fa5f86ab99fa727c
Hash for dependent task linux-atmlinux-atm_2.5.2.bb.do_package changed from=
 0f651c75ca85d6204fa743a56632251f to dccda0d8fe725ef1a0af039928b0dc17
Hash for dependent task linux-atmlinux-atm_2.5.2.bb.do_packagedata changed =
=66rom 73223c232e58c79eeb5963bce67021cc to c700eb96a86e99c6fa5f86ab99fa727c

ERROR: lmsensors different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'lm_sensorsl=
msensors-config_1.0.bb.do_packagedata', 'lm_sensorslmsensors_3.4.0.bb.do_pa=
ckage', 'lm_sensorslmsensors_3.4.0.bb.do_packagedata', 'opkg-utilsopkg-util=
s_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packag=
edata', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'rrdtoo=
lrrdtool_1.5.4.bb.do_packagedata'] to ['bashbash_4.3.30.bb.do_packagedata',=
 'lm_sensorslmsensors-config_1.0.bb.do_packagedata', 'lm_sensorslmsensors_3=
=2E4.0.bb.do_package', 'lm_sensorslmsensors_3.4.0.bb.do_packagedata', 'opkg=
-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22=
=2E0.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual=
:native', 'rrdtoolrrdtool_1.5.4.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors-config_1.0.bb.do_packagedata with hash 2015ee673c2dc495=
c9891439565d1f23
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors-config_1.0.bb.do_packagedata with hash 66b36d099bc8800a=
fcb2691ee128bb2f
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_package with hash 2c02b4dda8ebc18e728f78294=
11cfd70
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-supes-sup=
port/lm_sensors/lmsensors_3.4.0.bb.do_packagedata with hash a6800b65a231228=
eac8cf975befb9220
Hash for dependent task lm_sensorslmsensors-config_1.0.bb.do_packagedata ch=
anged from 2015ee673c2dc495c9891439565d1f23 to 66b36d099bc8800afcb2691ee128=
bb2f
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_packagedata changed=
 from 63297e8399e7ef17dad8e221469fb78a to a6800b65a231228eac8cf975befb9220
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_package changed fro=
m 2c02b4dda8ebc18e728f7829411cfd70 to 50afce8eb97c65589a7c877d391ecd15

ERROR: lttng-tools different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
runtaskdeps changed from ['lttnglttng-tools_2.6.0.bb.do_package', 'lttngltt=
ng-tools_2.6.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate=
_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtua=
l:native'] to ['lttnglttng-tools_2.6.0.bb.do_package', 'lttnglttng-tools_2.=
6.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vi=
rtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lttng=
/lttng-tools_2.6.0.bb.do_package with hash 2d96238c74eb2e48b766be4078d59be7
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lttng=
/lttng-tools_2.6.0.bb.do_package with hash 529501681f2a5f4802a09bd3842cdf07
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lttng=
/lttng-tools_2.6.0.bb.do_packagedata with hash 17f580576ad2ca1a8c076de820c4=
9bc8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/lttng=
/lttng-tools_2.6.0.bb.do_packagedata with hash b9a4790b3197bd37d25a95c34232=
a223
Hash for dependent task lttnglttng-tools_2.6.0.bb.do_package changed from 2=
d96238c74eb2e48b766be4078d59be7 to 529501681f2a5f4802a09bd3842cdf07
Hash for dependent task lttnglttng-tools_2.6.0.bb.do_packagedata changed fr=
om 17f580576ad2ca1a8c076de820c49bc8 to b9a4790b3197bd37d25a95c34232a223

ERROR: netmap different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['netmapnetmap_git.bb.do_package', 'netmapnetmap_g=
it.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vir=
tual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native'] t=
o ['netmapnetmap_git.bb.do_package', 'netmapnetmap_git.bb.do_packagedata', =
'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudops=
eudo_1.6.7.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_package with hash feb5160071a5c5750c45325331b=
5b6af
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_package with hash 65fae6e2954cbe57c05de64ffbc=
f9080
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_packagedata with hash d7fe2a5c58f9ae91579906d=
e40098471
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_packagedata with hash 27fd0247a5b4419056d0ade=
6e48f5675
Hash for dependent task netmapnetmap_git.bb.do_packagedata changed from d7f=
e2a5c58f9ae91579906de40098471 to 27fd0247a5b4419056d0ade6e48f5675
Hash for dependent task netmapnetmap_git.bb.do_package changed from feb5160=
071a5c5750c45325331b5b6af to 65fae6e2954cbe57c05de64ffbcf9080

ERROR: openlmi-networking different signature for task do_package_write_ipk=
=2Esigdatg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pse=
udopseudo_1.6.7.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_package with hash c34a601862d40115ed=
e3774c81304fc5
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_package with hash e5c8e58879b72fe718=
373fa703c1794b
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_packagedata with hash 45cc4925b9ec50=
3ec449270e21442c3c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_packagedata with hash 78255d88117735=
0acb5e870fce639da0
Hash for dependent task openlmiopenlmi-networking_0.3.1.bb.do_packagedata c=
hanged from 45cc4925b9ec503ec449270e21442c3c to 78255d881177350acb5e870fce6=
39da0
Hash for dependent task openlmiopenlmi-networking_0.3.1.bb.do_package chang=
ed from c34a601862d40115ede3774c81304fc5 to e5c8e58879b72fe718373fa703c1794b

ERROR: openlmi-providers different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-providers_0.6.0.bb.do_package', '=
openlmiopenlmi-providers_0.6.0.bb.do_packagedata', 'opkg-utilsopkg-utils_gi=
t.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populat=
e_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_packagedata'] to ['ope=
nlmiopenlmi-providers_0.6.0.bb.do_package', 'openlmiopenlmi-providers_0.6.0=
=2Ebb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vir=
tual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', '=
pythonpython_2.7.9.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_package with hash 0d3ddfd03d4e1d3001e=
882a23092bc8d
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_package with hash 1fe655a1e671802df56=
eb2e50104e040
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_packagedata with hash ed3e78a94958176=
8c89351b5517769cd
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_packagedata with hash 8714c22d15a62a8=
7429726edead84a4f
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_package change=
d from 0d3ddfd03d4e1d3001e882a23092bc8d to 1fe655a1e671802df56eb2e50104e040
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_packagedata ch=
anged from ed3e78a949581768c89351b5517769cd to 8714c22d15a62a87429726edead8=
4a4f

ERROR: openlmi-storage different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemux86
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'openlmiopen=
lmi-storage_0.8.1.bb.do_package', 'openlmiopenlmi-storage_0.8.1.bb.do_packa=
gedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', =
'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'pythonpython_2=
=2E7.9.bb.do_packagedata'] to ['bashbash_4.3.30.bb.do_packagedata', 'openlm=
iopenlmi-storage_0.8.1.bb.do_package', 'openlmiopenlmi-storage_0.8.1.bb.do_=
packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:nati=
ve', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'pythonpyt=
hon_2.7.9.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedde61e1ce0fdef56
Hash for dependent task openlmiopenlmi-storage_0.8.1.bb.do_package changed =
=66rom 86b0d67a8b202fc26e0e0ba46f84bade to 4c5865422b3cd88dff4fb44d2ed7d077
Hash for dependent task openlmiopenlmi-storage_0.8.1.bb.do_packagedata chan=
ged from e04c5ea9c207baf546d9887d276b8c4f to 45fb3d847e0b4064bca61e1ce0fdef=
56

ERROR: oprofile different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['binutilsbinutils_2.25.1.bb.do_packagedata', 'lin=
uxlinux-yocto_4.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popul=
ate_sysroot:virtual:native', 'oprofileoprofile_1.1.0.bb.do_package', 'oprof=
ileoprofile_1.1.0.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_sy=
sroot:virtual:native'] to ['binutilsbinutils_2.25.1.bb.do_packagedata', 'li=
nuxlinux-yocto_4.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popu=
late_sysroot:virtual:native', 'oprofileoprofile_1.1.0.bb.do_package', 'opro=
fileoprofile_1.1.0.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_s=
ysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash 91797942e4a4c052d0090804d8451a=
af
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash 6155510c8ed262a8123d60758fa5dd=
1c
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_package with hash 2cb5ffc77e3cf2b03f4e8c71b0aad891
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_package with hash 8503bcc25a3e4c5d9e237eaa680bd814
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_packagedata with hash 7fbc0545f8f51d7222889aa66178=
17b1
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_packagedata with hash d53e5c9bc5357008ab4fe57b1ab3=
864e
Hash for dependent task oprofileoprofile_1.1.0.bb.do_package changed from 2=
cb5ffc77e3cf2b03f4e8c71b0aad891 to 8503bcc25a3e4c5d9e237eaa680bd814
Hash for dependent task oprofileoprofile_1.1.0.bb.do_packagedata changed fr=
om 7fbc0545f8f51d7222889aa6617817b1 to d53e5c9bc5357008ab4fe57b1ab3864e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_packagedata changed from=
 91797942e4a4c052d0090804d8451aaf to 6155510c8ed262a8123d60758fa5dd1c

ERROR: oprofileui different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'oprofileoprofile_1.1.0.bb.do_packagedata', 'oprofileoprof=
ileui_git.bb.do_package', 'oprofileoprofileui_git.bb.do_packagedata', 'pseu=
dopseudo_1.6.7.bb.do_populate_sysroot:virtual:native'] to ['opkg-utilsopkg-=
utils_git.bb.do_populate_sysroot:virtual:native', 'oprofileoprofile_1.1.0.b=
b.do_packagedata', 'oprofileoprofileui_git.bb.do_package', 'oprofileoprofil=
eui_git.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virt=
ual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_packagedata with hash 7fbc0545f8f51d7222889aa66178=
17b1
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_packagedata with hash d53e5c9bc5357008ab4fe57b1ab3=
864e
Hash for dependent task oprofileoprofile_1.1.0.bb.do_packagedata changed fr=
om 7fbc0545f8f51d7222889aa6617817b1 to d53e5c9bc5357008ab4fe57b1ab3864e

ERROR: oprofileui-server differtual:native', 'oprofileoprofile_1.1.0.bb.do_=
packagedata', 'oprofileoprofileui-server_git.bb.do_package', 'oprofileoprof=
ileui-server_git.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_sys=
root:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_packagedata with hash 7fbc0545f8f51d7222889aa66178=
17b1
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/oprof=
ile/oprofile_1.1.0.bb.do_packagedata with hash d53e5c9bc5357008ab4fe57b1ab3=
864e
Hash for dependent task oprofileoprofile_1.1.0.bb.do_packagedata changed fr=
om 7fbc0545f8f51d7222889aa6617817b1 to d53e5c9bc5357008ab4fe57b1ab3864e

ERROR: packagegroup-efl-sdk different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['efledbus_1.7.9.bb.do_packagedata', 'eflefl_1.15.=
1.bb.do_packagedata', 'eflelementary_1.15.1.bb.do_packagedata', 'lttnglttng=
-ust_git.bb.do_packagedata', 'luajitluajit_2.0.4.bb.do_packagedata', 'opkg-=
utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'packagegroupsp=
ackagegroup-core-sdk.bb.do_packagedata', 'packagegroupspackagegroup-efl-sdk=
=2Ebb.do_package', 'packagegroupspackagegroup-efl-sdk.bb.do_packagedata', '=
pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'valgrindvalgrin=
d_3.10.1.bb.do_packagedata'] to ['efledbus_1.7.9.bb.do_packagedata', 'eflef=
l_1.15.1.bb.do_packagedata', 'eflelementary_1.15.1.bb.do_packagedata', 'ltt=
nglttng-ust_git.bb.do_packagedata', 'luajitluajit_2.0.4.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'package=
groupspackagegroup-core-sdk.bb.do_packagedata', 'packagegroupspackagegroup-=
efl-sdk.bb.do_package', 'packagegroupspackagegroup-efl-sdk.bb.do_packagedat=
a', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'valgrindva=
lgrind_3.10.1.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/package=
groups/packagegroup-core-sdk.bb.do_packagedata with hash 9a73cdd01a8ab3a3f9=
c959c95cf203b5
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/package=
groups/packagegroup-core-sdk.bb.do_packagedata with hash 52830b2579d22b6d46=
0c971215d5ab94
Hash for dependent task packagegroupspackagegroup-core-sdk.bb.do_packagedat=
a changed from 9a73cdd01a8ab3a3f9c959c95cf203b5 to 52830b2579d22b6d460c9712=
15d5ab94

ERROR: tipcutils different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native'=
, 'tipcutilstipcutils_2.0.6.bb.do_package', 'tipcutilstipcutils_2.0.6.bb.do=
_packagedata'] to ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual=
:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'tipc=
utilstipcutils_2.0.6.bb.do_package', 'tipcutilstipcutils_2.0.6.bb.do_packag=
edata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_package with hash 4426725d5418af35edba86fc3=
f18f64c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_package with hash 1ea815376643420421bc91b5c=
c85348c
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_packagedata with hash 6ed31a9065fde2aa9a572=
3cd5474d572
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_packagedata with hash , 'opkg-utilsopkg-uti=
ls_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_po=
pulate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packagedata', 'x=
fce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-session_4.=
12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packagedata',=
 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.do_pack=
agedata'] to ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilsopkg-utils_gi=
t.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populat=
e_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packagedata', 'xfce4-=
sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-session_4.12.1.=
bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packagedata', 'xor=
g-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.do_packageda=
ta']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/xf=
ce4-session/machine-host.bb.do_packagedata with hash 9bb822484380ed3c1cb240=
a695a5f8af
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/xf=
ce4-session/machine-host.bb.do_packagedata with hash f070502d6f225fda153502=
b5cbf14c0f
Hash for dependent task xfce4-sessionmachine-host.bb.do_packagedata changed=
 from 9bb822484380ed3c1cb240a695a5f8af to f070502d6f225fda153502b5cbf14c0f

ERROR: xl2tpd different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native'=
, 'xl2tpdxl2tpd_git.bb.do_package', 'xl2tpdxl2tpd_git.bb.do_packagedata'] t=
o ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseud=
opseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tpd_git.bb.=
do_package', 'xl2tpdxl2tpd_git.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_git.bb.do_package with hash a60a50b979697009b243f9c8=
7bd7a373
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_git.bb.do_package with hash b3ccc780f5b51ec3d77b2bb0=
37c7a182
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_git.bb.do_packagedata with hash 406822d338bbf20af6cc=
13544961f8cc
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_git.bb.do_packagedata with hash a6d0f01932a482ae3d6a=
57a5282dc6a3
Hash for dependent task xl2tpdxl2tpd_git.bb.do_package changed from a60a50b=
979697009b243f9c87bd7a373 to b3ccc780f5b51ec3d77b2bb037c7a182
Hash for dependent task xl2tpdxl2tpd_git.bb.do_packagedata changed from 406=
822d338bbf20af6cc13544961f8cc to a6d0f01932a482ae3d6a57a5282dc6a3

ERROR: zabbix different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['logrotatelogrotate_3.9.1.bb.do_packagedata', 'op=
kg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseud=
o_1.6.7.bb.do_populate_sysroot:virtual:native', 'zabbixzabbix_2.4.5.bb.do_p=
ackage', 'zabbixzabbix_2.4.5.bb.do_packagedata'] to ['logrotatelogrotate_3.=
9.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vi=
rtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', =
'zabbixzabbix_2.4.5.bb.do_package', 'zabbixzabbix_2.4.5.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_package with hash d5024791030c6edc23Hash for =
dependent task zabbixzabbix_2.4.5.bb.do_packagedata changed from 1773162c59=
c78d403fc28a9062357c6e to 6e6aec9994fd44449636540a29a6be88

ERROR: 20 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1441728995/signatures.qemux86.do_package_write_ipk.sigdata.log


 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemuarm =3D=3D=3D
INFO: binutils-cross-i586 task do_configure.sigdata doesn't exist in qemuarm
INFO: gcc-cross-i586 task do_configure.sigdata doesn't exist in qemuarm
INFO: gcc-cross-initial-i586 task do_configure.sigdata doesn't exist in qem=
uarm
INFO: gdb-cross-i586 task do_configure.sigdata doesn't exist in qemuarm
INFO: grub-efi-native task do_configure.sigdata doesn't exist in qemuarm
INFO: libarchive-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: libauthen-sasl-perl different signature for task do_configure.sigdat=
a between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD=
', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_C=
XX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_A=
RCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_=
RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS'=
, 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBU=
G_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLF=
LAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARC=
H', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'L=
C_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'L=
INKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP=
', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'P=
ERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PK=
G_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG=
_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'R=
ANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC',=
 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGIN=
G_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'S=
TAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_A=
RCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAG=
S', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_O=
S', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'T=
UNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_=
WHITELIST', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'b=
ase_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'bas=
e_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir',=
 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_pe=
rl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'li=
bdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_b=
ase_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license',=
 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_nat=
ive', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clea=
n', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysco=
nfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systePFLAGS', 'CX=
X', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPEND=
S', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIM=
IZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOS=
T_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS',=
 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HASH_STYLE', 'LOGF=
IFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG',=
 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC'=
, 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTA=
LLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'P=
N', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_O=
PTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAG=
ING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NAT=
IVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', '=
STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', =
'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'T=
ARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TA=
RGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS'=
, 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir=
', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_prefix', =
'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_=
do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir=
', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native', 'i=
nfodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'localstated=
ir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'p=
ackage_qa_check_license', 'package_qa_handle_error', 'package_qa_write_erro=
r', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', '=
sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstat=
e_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_uni=
tdir', 'systemd_unitdir', 'systemd_user_unitdir']
basehash changed from 9f236c4a1ef1d5269fb7bafb88a3c817 to 1a6a84d5c1b3b8ec0=
a1d5b56738ba035
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -mthumb  -mthumb-interwork'
Variable TUNE_ARCH value changed from '${@bb.utils.contains("TUNE_FEATURES"=
, "m32", "${X86ARCH32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32=
", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X=
86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} =3D Set
TUNE_FEATURES{m64} =3D Unset
TUNE_FEATURES{mx32} =3D Unset' to '${@bb.utils.contains("TUNE_FEATURES", "b=
igendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} =3D Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgc=
c-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'libautme/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-de=
vtools/gcc/gcc-cross_4.9.bb.do_populate_sysroot with hash 6206c540205ceb4d6=
df52cadd11a65e8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_4.9.bb.do_populate_sysroot with hash 1aa0604691b8d5cfde8ce3272e6=
58096
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_4.9.bb.do_populate_sysroot with hash 4f160188829d0ac39510548b0=
362fbd3
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_4.9.bb.do_populate_sysroot with hash a442f592f2bc586ecc0d3b0c2=
d9722bc
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 3d8ce186c23571bafea60c87da52d82c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 07c1f5510d3bb6b5abb838be7c85f6ef
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 9fb425723a7f14f2ecaaf77985cc=
8b99
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 7f6c98ef9d3c6cfb6bd6e0fc47df=
2ca8
Hash for dependent task gccgcc-cross_4.9.bb.do_populate_sysroot changed fro=
m 6206c540205ceb4d6df52cadd11a65e8 to 1aa0604691b8d5cfde8ce3272e658096
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 3d8ce186c23571bafea60c87da52d82c to 07c1f5510d3bb6b5abb838be7c85f6ef
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from=
 9fb425723a7f14f2ecaaf77985cc8b99 to 7f6c98ef9d3c6cfb6bd6e0fc47df2ca8
Hash for dependent task gccgcc-runtime_4.9.bb.do_populate_sysroot changed f=
rom 4f160188829d0ac39510548b0362fbd3 to a442f592f2bc586ecc0d3b0c2d9722bc

ERROR: libdigest-hmac-perl different signature for task do_configure.sigdat=
a between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD=
', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_C=
XX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_A=
RCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_=
RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS'=
, 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBU=
G_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLF=
LAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARC=
H', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'L=
C_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'L=
INKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP=
', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'P=
ERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PK=
G_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG=
_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'R=
ANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC',=
 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGIN=
G_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'S=
TAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_A=
RCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFL_c=
onfigure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'incl=
udedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexec=
dir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', '=
oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'pac=
kage_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', '=
sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'ss=
tate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', '=
systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD=
', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_C=
XX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_A=
RCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_=
RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS'=
, 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBU=
G_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLF=
LAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARC=
H', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'L=
C_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'L=
INKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP=
', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'P=
ERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PK=
G_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG=
_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'R=
ANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC',=
 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGIN=
G_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'S=
TAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_A=
RCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAG=
S', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_O=
S', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'T=
UNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_=
WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_=
native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bb=
fatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'd=
o_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir',=
 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'l=
ibexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libd=
ir', 'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error'=
, 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'serviced=
ir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest=
', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleanssta=
te', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
basehash changed from 4288a4302cc972f36657e91cddc378ee to c2a885838b042684c=
72448e3d7bcac23
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
E''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgc=
c-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'libdigestlibdigest-hmac-perl_1.03.bb.do_patch', 'perlperl-native_5.2=
2.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to [=
'gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_popula=
te_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libdigestlibdigest-=
hmac-perl_1.03.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot=
', 'perlperl_5.22.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_4.9.bb.do_populate_sysroot with hash 6206c540205ceb4d6df52cadd11=
a65e8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_4.9.bb.do_populate_sysroot with hash 1aa0604691b8d5cfde8ce3272e6=
58096
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_4.9.bb.do_populate_sysroot with hash 4f160188829d0ac39510548b0=
362fbd3
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_4.9.bb.do_populate_sysroot with hash a442f592f2bc586ecc0d3b0c2=
d9722bc
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 3d8ce186c23571bafea60c87da52d82c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 07c1f5510d3bb6b5abb838be7c85f6ef
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 9fb425723a7f14f2ecaaf77985cc=
8b99
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 7f6c98ef9d3c6cfb6bd6e0fc47df=
2ca8
Hash for dependent task gccgcc-cross_4.9.bb.do_populate_sysroot changed fro=
m 6206c540205ceb4d6df52cadd11a65e8 to 1aa0604691b8d5cfde8ce3272e658096
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 3d8ce186c23571bafea60c87da52d82c to 07c1f5510d3bb6b5abb838be7c85f6ef
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from=
 9fb425723a7f14f2ecaaf77985cc8b99 to 7f6c98ef9d3c6cfb6bd6e0fc47df2ca8
Hash for dependent task gccgcc-runtime_4.9.bb.do_populate_sysroot changed f=
rom 4f160188829d0ac39510548b0362fbd3 to a442f592f2bc586ecc0d3b0c2d9722bc

ERROR: libio-socket-ssl-perl different signature for task do_configure.sigd=
ata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD=
', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_C=
XX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_A=
RCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_=
RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS'=
, 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBU=
G_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLF=
LAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARC=
H', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'L=
C_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'L=
INKER_HASH_STYLE', 'LOGFIFO'ATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', '=
STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS=
', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET=
_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_L=
D_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SY=
S', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE=
_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARCH32', 'X86AR=
CH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_nativ=
e', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal=
', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_=
configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'inc=
ludedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexe=
cdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', =
'oldincludedir', 'package_qa_check_license', 'package_qa_handle_error', 'pa=
ckage_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', =
'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 's=
state_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', =
'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD=
', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_C=
XX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_A=
RCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_=
RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS'=
, 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBU=
G_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF', 'EXTRA_PERLF=
LAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_CC_ARC=
H', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDOR', 'L=
C_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'L=
INKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP=
', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'P=
ERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PK=
G_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG=
_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'R=
ANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC',=
 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGIN=
G_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'S=
TAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_AS_A=
RCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAG=
S', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_O=
S', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'T=
UNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_=
WHITELIST', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_=
native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bb=
fatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'd=
o_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir',=
 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'l=
ibexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libd=
ir', 'oldinclu97
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -mthumb  -mthumb-interwork'
Variable TUNE_ARCH value changed from '${@bb.utils.contains("TUNE_FEATURES"=
, "m32", "${X86ARCH32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32=
", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X=
86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} =3D Set
TUNE_FEATURES{m64} =3D Unset
TUNE_FEATURES{mx32} =3D Unset' to '${@bb.utils.contains("TUNE_FEATURES", "b=
igendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} =3D Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgc=
c-runtime_4.9.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'libiolibio-socket-ssl-perl_1.997.bb.do_patch', 'perlperl-native_5.22=
=2E0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to =
['gccgcc-cross_4.9.bb.do_populate_sysroot', 'gccgcc-runtime_4.9.bb.do_popul=
ate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libiolibio-socket-=
ssl-perl_1.997.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot=
', 'perlperl_5.22.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_4.9.bb.do_populate_sysroot with hash 6206c540205ceb4d6df52cadd11=
a65e8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_4.9.bb.do_populate_sysroot with hash 1aa0604691b8d5cfde8ce3272e6=
58096
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_4.9.bb.do_populate_sysroot with hash 4f160188829d0ac39510548b0=
362fbd3
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_4.9.bb.do_populate_sysroot with hash a442f592f2bc586ecc0d3b0c2=
d9722bc
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 3d8ce186c23571bafea60c87da52d82c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 07c1f5510d3bb6b5abb838be7c85f6ef
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 9fb425723a7f14f2ecaaf77985cc=
8b99
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 7f6c98ef9d3c6cfb6bd6e0fc47df=
2ca8
Hash for dependent task gccgcc-cross_4.9.bb.do_populate_sysroot changed fro=
m 6206c540205ceb4d6df52cadd11a65e8 to 1aa0604691b8d5cfde8ce3272e658096
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 3d8ce186c23571bafea60c87da52d82c to 07c1f5510d3bb6b5abb838be7c85f6ef
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from=
 9fb425723a7f14f2ecaaf77985cc8b99 to 7f6c98ef9d3c6cfb6bd6e0fc47df2ca8
Hash for dependent task gccgcc-runtime_4.9.bb.do_populate_sysroot changed f=
rom 4f160188829d0ac39510548b0362fbd3 to a442f5pulate_sysroot:virtual:native=
', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'luna-sysmgr-ipc-m=
essagesluna-sysmgr-ipc-messages.bb.do_generate_toolchain_file', 'luna-sysmg=
r-ipc-messagesluna-sysmgr-ipc-messages.bb.do_patch', 'luna-sysmgr-ipcluna-s=
ysmgr-ipc.bb.do_populate_sysroot', 'luna-webkit-apiluna-webkit-api.bb.do_po=
pulate_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:=
native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native', 'cm=
ake-modules-webos-nativecmake-modules-webos-native.bb.do_populate_sysroot',=
 'cmakecmake-native_3.3.1.bb.do_populate_sysroot', 'gnu-configgnu-config_gi=
t.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-native_2.4.6.bb.d=
o_populate_sysroot', 'luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb.d=
o_generate_toolchain_file', 'luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messag=
es.bb.do_patch', 'luna-sysmgr-ipcluna-sysmgr-ipc.bb.do_populate_sysroot', '=
luna-webkit-apiluna-webkit-api.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc/luna-sysmgr-ipc.bb.do_populate_sysroot with hash 598e2cf96c=
7d260cf409d3f73c5876aa
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc/luna-sysmgr-ipc.bb.do_populate_sysroot with hash 498ea66977=
7e2c720f8cdfe97459aef0
Hash for dependent task luna-sysmgr-ipcluna-sysmgr-ipc.bb.do_populate_sysro=
ot changed from 598e2cf96c7d260cf409d3f73c5876aa to 498ea669777e2c720f8cdfe=
97459aef0

INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
INFO: ninja-native task do_configure.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_configure=
=2Esigdata between qemux86copy and qemuarm
runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_patch', '=
polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.do_popul=
ate_sysroot:virtual:native'] to ['polkitpolkit-group-rule-datetime.bb.do_pa=
tch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.d=
o_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea723c466e0c=
5c88a09a50
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit_0.113.bb.do_populate_sysroot with hash 06cf7139c6588d047fa114=
44d88175ab
Hash for dependent task polkitpolkit_0.113.bb.do_populate_sysroot changed f=
rom 284d6bbd28ea723c466e0c5c88a09a50 to 06cf7139c6588d047fa11444d88175ab

ERROR: polkit-group-rule-network different signature for task do_configure.=
sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['polkitpolkit-group-rule-network.bb.do_patch', 'p=
olkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.do_popula=
te_sysroot:virtual:native'] to ['polkitpolkit-group-rule-network.bb.do_patc=
h', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.do_=
populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea723c466e0c=
5c88a09a50
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit_0.113.bb.do_populate_sysroot with hash 06cf7139c6588d047fa114=
44d88175ab
Hash for dependent task polkitpolkit_0.113.bb.do_populate_sysroot changed f=
rom 284d6bbd28ea723c466e0c5c88a09a50 to 06cf7139c6588d047fa11444d88175ab

Ee/world/shr-core/openembedded-core/meta/recipes-core/glibc/glibc_2.22.bb.d=
o_populate_sysroot with hash 3d8ce186c23571bafea60c87da52d82c
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 07c1f5510d3bb6b5abb838be7c85f6ef
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 3d8ce186c23571bafea60c87da52d82c to 07c1f5510d3bb6b5abb838be7c85f6ef

ERROR: 7 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1441728995/signatures.qemuarm.do_configure.sigdata.log


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
ERROR: libauthen-sasl-perl different signature for task do_populate_sysroot=
=2Esigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', =
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS=
', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'B=
UILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRI=
P', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS',=
 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION'=
, 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST=
_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VEND=
OR', 'INHIBIT_SYSROOT_STRIP', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', '=
LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJDU=
MP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PERLCONFIGTARGET', 'PERLHOSTL=
IB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DI=
R', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH=
', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', 'PSEUDO_DISABLED', 'PV=
', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'S=
STATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTINSTFUNCS', 'SSTATE_=
EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_MANMACH', 'SSTATE_PKG', 'SSTATE_PKG=
NAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_L=
IBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STA=
GING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STAMP', 'S=
TAMPS_DIR', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNC=
S', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TA=
RGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TAR=
GET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_V=
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TU=
NE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_libdir', 'base_l=
ibdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib=
', 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]', 'do_popula=
te_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]', 'do_qa_stagin=
g', 'docdir', '', 'sstate_init', 'sstate_install', 'sstate_package', 'sstat=
e_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfd=
ir', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs', 'sysro=
ot_stage_libdir', 'sysroot_strip', 'systemd_system_unitdir', 'systemd_unitd=
ir', 'systemd_user_unitdir', 'to']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', =
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS=
', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'B=
UILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRI=
P', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS',=
 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION'=
, 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST=
_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VEND=
OR', 'INHIBIT_SYSROOT_STRIP', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', '=
LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJDU=
MP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PERLCONFIGTARGET', 'PERLHOSTL=
IB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DI=
R', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH=
', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', 'PSEUDO_DISABLED', 'PV=
', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'S=
STATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTINSTFUNCS', 'SSTATE_=
EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_MANMACH', 'SSTATE_PKG', 'SSTATE_PKG=
NAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_L=
IBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STA=
GING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STAMP', 'S=
TAMPS_DIR', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNC=
S', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TA=
RGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TAR=
GET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_V=
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TU=
NE_LDARGS', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefi=
x', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'd=
o_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[sstate-outputdi=
rs]', 'do_populate_sysroot[umask]', 'do_qa_staging', 'docdir', 'exec_prefix=
', 'generate_sstatefn', 'get_perl_version', 'includedir', 'includedir_nativ=
e', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'local=
statedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedi=
r', 'package_qa_check_staged', 'package_qa_handle_error', 'package_qa_write=
_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedi=
r', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', '=
sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_task_po=
stfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot=
_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'sysroot_strip',=
 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir', 'to']
basehash changed from bd877441f34773e74737bcc7292d467f to 57aba5ad407e69c2d=
9e7d4924d72a8ee
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Varia" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X8=
6ARCH64}", "" ,d)}
TUNE_FEATURES{m32} =3D Set
TUNE_FEATURES{m64} =3D Unset
TUNE_FEATURES{mx32} =3D Unset' to '${@bb.utils.contains("TUNE_FEATURES", "b=
igendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} =3D Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libauthenlibauthen-sasl-perl_2.16.bb.do_install'=
] to ['libauthenlibauthen-sasl-perl_2.16.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_install with hash 6454df4e8c0cb83667=
02e9e79866e753
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_install with hash fdc0ee6b03287018af=
2b9e501d3b7ae8
Hash for dependent task libauthenlibauthen-sasl-perl_2.16.bb.do_install cha=
nged from 6454df4e8c0cb8366702e9e79866e753 to fdc0ee6b03287018af2b9e501d3b7=
ae8

ERROR: libdigest-hmac-perl different signature for task do_populate_sysroot=
=2Esigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', =
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS=
', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'B=
UILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRI=
P', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS',=
 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION'=
, 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST=
_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VEND=
OR', 'INHIBIT_SYSROOT_STRIP', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', '=
LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJDU=
MP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PERLCONFIGTARGET', 'PERLHOSTL=
IB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DI=
R', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH=
', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', 'PSEUDO_DISABLED', 'PV=
', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'S=
STATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTINSTFUNCS', 'SSTATE_=
EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_MANMACH', 'SSTATE_PKG', 'SSTATE_PKG=
NAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_L=
IBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STA=
GING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STAMP', 'S=
TAMPS_DIR', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNC=
S', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TA=
RGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TAR=
GET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_V=
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TU=
NE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_libdir', 'base_l=
ibdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib=
', 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]', 'do_popula=
te_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]', 'do_qa_stagin=
g', 'docdirsstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_in=
it', 'sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_t=
ask_postfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', 's=
ysroot_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'sysroot_s=
trip', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir',=
 'to']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', =
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS=
', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'B=
UILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRI=
P', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS',=
 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION'=
, 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST=
_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VEND=
OR', 'INHIBIT_SYSROOT_STRIP', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', '=
LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJDU=
MP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PERLCONFIGTARGET', 'PERLHOSTL=
IB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DI=
R', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH=
', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', 'PSEUDO_DISABLED', 'PV=
', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'S=
STATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTINSTFUNCS', 'SSTATE_=
EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_MANMACH', 'SSTATE_PKG', 'SSTATE_PKG=
NAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_L=
IBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STA=
GING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STAMP', 'S=
TAMPS_DIR', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNC=
S', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TA=
RGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TAR=
GET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_V=
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TU=
NE_LDARGS', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefi=
x', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'd=
o_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[sstate-outputdi=
rs]', 'do_populate_sysroot[umask]', 'do_qa_staging', 'docdir', 'exec_prefix=
', 'generate_sstatefn', 'get_perl_version', 'includedir', 'includedir_nativ=
e', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'local=
statedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedi=
r', 'package_qa_check_staged', 'package_qa_handle_error', 'package_qa_write=
_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedi=
r', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', '=
sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_task_po=
stfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot=
_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'sysroot_strip',=
 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir', 'to']
basehash changed from bd877441f34773e74737bcc7292d467f to 57aba5ad407e69c2d=
9e7d4924d72a8ee
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64"=
, "${X86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} =3D Set
TUNE_FEATURES{m64} =3D Unset
TUNE_FEATURES{mx32} =3D Unset' to '${@bb.utils.contains("TUNE_FEATURES", "b=
igendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} =3D Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libdigestlibdigest-hmac-perl_1.03.bb.do_install'=
] to ['libdigestlibdigest-hmac-perl_1.03.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_install with hash b6ae66e829ef220692=
4799b428131bc1
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_install with hash 68f1beed924105ca5c=
b038e9479d9dda
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_install cha=
nged from b6ae66e829ef2206924799b428131bc1 to 68f1beed924105ca5cb038e9479d9=
dda

ERROR: libio-socket-ssl-perl different signature for task do_populate_sysro=
ot.sigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', =
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS=
', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'B=
UILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRI=
P', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS',=
 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION'=
, 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST=
_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VEND=
OR', 'INHIBIT_SYSROOT_STRIP', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', '=
LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJDU=
MP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PERLCONFIGTARGET', 'PERLHOSTL=
IB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DI=
R', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH=
', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', 'PSEUDO_DISABLED', 'PV=
', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'S=
STATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTINSTFUNCS', 'SSTATE_=
EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_MANMACH', 'SSTATE_PKG', 'SSTATE_PKG=
NAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_L=
IBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STA=
GING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STAMP', 'S=
TAMPS_DIR', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNC=
S', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TA=
RGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TAR=
GET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_V=
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TU=
NE_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_libdir', 'base_l=
ibdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib=
', 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]', 'do_popula=
te_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]', 'do_qa_stix_n=
ative', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_cl=
ean', 'sstate_clean_manifest', 'sstate_init', 'sstate_install', 'sstate_pac=
kage', 'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefun=
c', 'sysconfdir', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_=
dirs', 'sysroot_stage_libdir', 'sysroot_strip', 'systemd_system_unitdir', '=
systemd_unitdir', 'systemd_user_unitdir', 'to']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', =
'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS=
', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'B=
UILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRI=
P', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP', 'CPPFLAGS',=
 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION'=
, 'EXTENDPE', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST=
_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VEND=
OR', 'INHIBIT_SYSROOT_STRIP', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', '=
LINKER_HASH_STYLE', 'MAKE', 'MULTIMACH_TARGET_SYS', 'NM', 'OBJCOPY', 'OBJDU=
MP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PE', 'PERLCONFIGTARGET', 'PERLHOSTL=
IB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DI=
R', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH=
', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', 'PSEUDO_DISABLED', 'PV=
', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'S=
STATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTINSTFUNCS', 'SSTATE_=
EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_MANMACH', 'SSTATE_PKG', 'SSTATE_PKG=
NAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_L=
IBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STA=
GING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STAMP', 'S=
TAMPS_DIR', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNC=
S', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TA=
RGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TAR=
GET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_V=
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TU=
NE_LDARGS', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefi=
x', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'd=
o_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[sstate-outputdi=
rs]', 'do_populate_sysroot[umask]', 'do_qa_staging', 'docdir', 'exec_prefix=
', 'generate_sstatefn', 'get_perl_version', 'includedir', 'includedir_nativ=
e', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'local=
statedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedi=
r', 'package_qa_check_staged', 'package_qa_handle_error', 'package_qa_write=
_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedi=
r', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', '=
sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_task_po=
stfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot=
_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'sysroot_strip',=
 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir', 'to']
basehash changed from bd877441f34773e74737bcc7292d467f to 57aba5ad407e69c2d=
9e7d4924d72a8ee
List of dependencies for variable TUNE_ARCH changed from 'setTUNE_FEATURES"=
, "m32", "${X86ARCH32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "mx32=
", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64", "${X=
86ARCH64}", "" ,d)}
TUNE_FEATURES{m32} =3D Set
TUNE_FEATURES{m64} =3D Unset
TUNE_FEATURES{mx32} =3D Unset' to '${@bb.utils.contains("TUNE_FEATURES", "b=
igendian", "armeb", "arm", d)}
TUNE_FEATURES{bigendian} =3D Unset'
Variable TUNE_ASARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-x32", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libiolibio-socket-ssl-perl_1.997.bb.do_install']=
 to ['libiolibio-socket-ssl-perl_1.997.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_install with hash 08a00a03bc4a48a2053=
c9b31052d6102
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_install with hash 146a4b09d28e31a81df=
d7987fa82e399
Hash for dependent task libiolibio-socket-ssl-perl_1.997.bb.do_install chan=
ged from 08a00a03bc4a48a2053c9b31052d6102 to 146a4b09d28e31a81dfd7987fa82e3=
99

ERROR: luna-sysmgr-ipc-messages different signature for task do_populate_sy=
sroot.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages=
=2Ebb.do_install'] to ['luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_install']
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_install with hash 7=
9401d548e00759a82fdee60bd1aa83b
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_install with hash d=
e741adaf0ae3d6b7d044dae13368a6d
Hash for dependent task luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_install changed from 79401d548e00759a82fdee60bd1aa83b to de741adaf0ae=
3d6b7d044dae13368a6d

INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: ninja-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_populate_=
sysroot.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_install']=
 to ['polkitpolkit-group-rule-datetime.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-datetime.bb.do_install with hash 6d9df6b8189ba1be2=
608d73463191ce4
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-datetime.bb.do_install with hash 0d6ca8fe8f04937d5=
4790c921e3097ea
Hash for dependent task polkitpolkit-group-rule-datetime.bb.do_install chan=
ged from 6d9df6b8189ba1be2608d73463191ce4 to 0d6ca8fe8f04937d54790c921e3097=
ea

ERROR: polkit-group-rule-network different signature for task do_populate_s=
ysroot.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['polkitpolkit-group-rule-network.bb.do_install'] =
to ['polkitpolkit-group-rule-network.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-network.bb.do_install with hash 2af629c83226a2b798=
a9786c2be4a2b7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipesmmonxserve=
r-common_1.34.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_install with hash e7ae9dfe176d9ad9=
1d90cf1cfae78496
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_install with hash b0d12f6ea93158ae=
a2fd454100959a16
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_install cha=
nged from e7ae9dfe176d9ad91d90cf1cfae78496 to b0d12f6ea93158aea2fd454100959=
a16

ERROR: 7 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1441728995/signatures.qemuarm.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
ERROR: libauthen-sasl-perl different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
basehash changed from 7d3ce09562bdc69c7086c96503e88e80 to ebca3e0ff656fb537=
3fe58523ca7b4b2
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libauthenlibauthen-sasl-perl_2.16.bb.do_package'=
, 'libauthenlibauthen-sasl-perl_2.16.bb.do_packagedata', 'libdigestlibdiges=
t-hmac-perl_1.03.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popula=
te_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopse=
udo_1.6.7.bb.do_populate_sysroot:virtual:native'] to ['libauthenlibauthen-s=
asl-perl_2.16.bb.do_package', 'libauthenlibauthen-sasl-perl_2.16.bb.do_pack=
agedata', 'libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb=
=2Edo_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:nati=
ve']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_package with hash 8cbb74ef9bc35c6aff=
5b56f9939cafef
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_package with hash 2b4da133dbf094b487=
3c8337d0c6e8be
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_packagedata with hash c2709f9e6aada0=
f8f3b501f363692cf4
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_packagedata with hash 1661d93db6447c=
615c319c8014afec32
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash 7097bccd962f26=
a01ae904a5a2ef7b3c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash 3513c728788efd=
9a80f2fe82843dc744
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 5dba0b6db40dccadea9cd445d6ae5e87
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash aabe8ba137b1676076c76f53990f01da
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata=
 changed from 7097bccd962f26a01ae904a5a2ef7b3c to 3513c728788efd9a80f2fe828=
43dc744
Hash for dependent task libauthenlibauthen-sasl-perl_2.16.bb.do_package cha=
nged from 8cbb74ef9bc35c6aff5b56f9939cafef to 2b4da133dbf094b4873c8337d0c6e=
8be
Hash for dependent task perlperl_5.22.0.bb.do_packagedata changed from 5dba=
0b6db40dccadea9cd445d6ae5e87 tobi'
runtaskdeps changed from ['libdigestlibdigest-hmac-perl_1.03.bb.do_package'=
, 'libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata', 'libdigestlibdiges=
t-sha1-perl_2.13.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popula=
te_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopse=
udo_1.6.7.bb.do_populate_sysroot:virtual:native'] to ['libdigestlibdigest-h=
mac-perl_1.03.bb.do_package', 'libdigestlibdigest-hmac-perl_1.03.bb.do_pack=
agedata', 'libdigestlibdigest-sha1-perl_2.13.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb=
=2Edo_packagedata', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:nati=
ve']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_package with hash 7dca10dde31f1688c2=
c17298538245f8
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_package with hash 2c60284dce1caa7f52=
52cc61afb45878
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash 7097bccd962f26=
a01ae904a5a2ef7b3c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash 3513c728788efd=
9a80f2fe82843dc744
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-sha1-perl_2.13.bb.do_packagedata with hash 71b8321aa82e99=
932eea29c78db1e1ba
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-sha1-perl_2.13.bb.do_packagedata with hash f1a666fecb4f03=
ece29b375078b1c1f6
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 5dba0b6db40dccadea9cd445d6ae5e87
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash aabe8ba137b1676076c76f53990f01da
Hash for dependent task libdigestlibdigest-sha1-perl_2.13.bb.do_packagedata=
 changed from 71b8321aa82e99932eea29c78db1e1ba to f1a666fecb4f03ece29b37507=
8b1c1f6
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata=
 changed from 7097bccd962f26a01ae904a5a2ef7b3c to 3513c728788efd9a80f2fe828=
43dc744
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_package cha=
nged from 7dca10dde31f1688c2c17298538245f8 to 2c60284dce1caa7f5252cc61afb45=
878
Hash for dependent task perlperl_5.22.0.bb.do_packagedata changed from 5dba=
0b6db40dccadea9cd445d6ae5e87 to aabe8ba137b1676076c76f53990f01da

ERROR: libio-socket-ssl-perl different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemuarm
basehash changed from 00c4b5dfbdb187dc8a3f2f9631ecda57 to 7464664d0f8fb3f0a=
7c159dc1aba3cf5
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libiolibio-socket-ssl-perl_1.997.bb.do_package',=
 'libiolibio-socket-ssl-perl_1.997.bb.do_packagedata', 'libnetlibnet-ssleay=
-perl_1.65.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sys=
root:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopseudo_1.=
6.7.bb.do_populate_sysroot:virtual:native'] to ['libiolibio-socket-ssl-perl=
_1.997.bb.do_package', 'libiolibio-socket-ssl-perl_1.997.bb.do_packagedata'=
, 'libnetlibnet-ssleay-perl_1.65.bb.do_packagedata', 'opkg-utilsopkg-utils_=
git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0l_1.997.bb.do_p=
ackage with hash 821298ca0728718857cce724ac1845e7
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_packagedata with hash 9152051fb647dc7=
40cbb232f5343404b
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_packagedata with hash c5fc6f59254dfa9=
da35fba47e1e85b6c
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bnet/libnet-ssleay-perl_1.65.bb.do_packagedata with hash 65a140680fb4c7632f=
8ca46185d7beef
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bnet/libnet-ssleay-perl_1.65.bb.do_packagedata with hash 93fd4e9b22f4afcd06=
8ab0870ed4fa82
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 5dba0b6db40dccadea9cd445d6ae5e87
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash aabe8ba137b1676076c76f53990f01da
Hash for dependent task libiolibio-socket-ssl-perl_1.997.bb.do_packagedata =
changed from 9152051fb647dc740cbb232f5343404b to c5fc6f59254dfa9da35fba47e1=
e85b6c
Hash for dependent task libnetlibnet-ssleay-perl_1.65.bb.do_packagedata cha=
nged from 65a140680fb4c7632f8ca46185d7beef to 93fd4e9b22f4afcd068ab0870ed4f=
a82
Hash for dependent task perlperl_5.22.0.bb.do_packagedata changed from 5dba=
0b6db40dccadea9cd445d6ae5e87 to aabe8ba137b1676076c76f53990f01da
Hash for dependent task libiolibio-socket-ssl-perl_1.997.bb.do_package chan=
ged from 6e8c1259195b81e60d52371c5858b2a1 to 821298ca0728718857cce724ac1845=
e7

ERROR: luna-sysmgr-ipc-messages different signature for task do_package_wri=
te_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages=
=2Ebb.do_package', 'luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb.do_=
packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:nati=
ve', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native'] to ['luna-=
sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb.do_package', 'luna-sysmgr-ip=
c-messagesluna-sysmgr-ipc-messages.bb.do_packagedata', 'opkg-utilsopkg-util=
s_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_pop=
ulate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_package with hash 7=
e968f00a0bb9ab006e1701bfc2cd914
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_package with hash e=
3f11de1205e45f22d77c7ff7cc63cdd
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_packagedata with ha=
sh 017a7da00359771d4703750bc40980f9
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_packagedata with ha=
sh 9352e5b54a9824c8492522084e947802
Hash for dependent task luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_package changed from 7e968f00a0bb9ab006e1701bfc2cd914 to e3f11de1205e=
45f22d77c7ff7cc63cdd
Hash for dependent task luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_packagedata changed from 017a7da00359771d4703750bc40980f9 to 9352e5b5=
4a9824c8492522084e947802

ERROR: phpmyadmin different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
runtaskdeps changed from 7.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/bas=
h/bash_4.3.30.bb.do_packagedata with hash fe84ef3919e05139fcdac6a475b947c6
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/bas=
h/bash_4.3.30.bb.do_packagedata with hash 61ab99290a1e97f6be74c54dba5951fd
Hash for dependent task bashbash_4.3.30.bb.do_packagedata changed from fe84=
ef3919e05139fcdac6a475b947c6 to 61ab99290a1e97f6be74c54dba5951fd

ERROR: polkit-group-rule-datetime different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'polkitpolkit-group-rule-datetime.bb.do_package', 'polkitp=
olkit-group-rule-datetime.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_pop=
ulate_sysroot:virtual:native'] to ['opkg-utilsopkg-utils_git.bb.do_populate=
_sysroot:virtual:native', 'polkitpolkit-group-rule-datetime.bb.do_package',=
 'polkitpolkit-group-rule-datetime.bb.do_packagedata', 'pseudopseudo_1.6.7.=
bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-datetime.bb.do_package with hash 79900ad0192127280=
9685f0f391c11fc
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-datetime.bb.do_package with hash 3d588a8eeaa2635a3=
89af05579ee30e2
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-datetime.bb.do_packagedata with hash 403d5295a42ab=
7adbfacfdd81756f902
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-datetime.bb.do_packagedata with hash f4655b11673bc=
68bca70d1471b98236a
Hash for dependent task polkitpolkit-group-rule-datetime.bb.do_package chan=
ged from 79900ad01921272809685f0f391c11fc to 3d588a8eeaa2635a389af05579ee30=
e2
Hash for dependent task polkitpolkit-group-rule-datetime.bb.do_packagedata =
changed from 403d5295a42ab7adbfacfdd81756f902 to f4655b11673bc68bca70d1471b=
98236a

ERROR: polkit-group-rule-network different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'polkitpolkit-group-rule-network.bb.do_package', 'polkitpo=
lkit-group-rule-network.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.do_popul=
ate_sysroot:virtual:native'] to ['opkg-utilsopkg-utils_git.bb.do_populate_s=
ysroot:virtual:native', 'polkitpolkit-group-rule-network.bb.do_package', 'p=
olkitpolkit-group-rule-network.bb.do_packagedata', 'pseudopseudo_1.6.7.bb.d=
o_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-network.bb.do_package with hash 38ebd02a32e2a3c31f=
fa97d5ae3dd290
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-network.bb.do_package with hash af47b82b1253781454=
a09e3c8bffd001
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-network.bb.do_packagedata with hash a3da1f9491d3e2=
e37231ec56024ee6a0
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit-group-rule-network.bb.do_packagedata with hash 86f0217f8ec09a=
447c71888aed73a762
Hash for dependent task polkitpolkit-group-rule-network.bb.do_package chang=
ed from 38ebd02a32e2a3c31ffa97d5ae3dd290 to af47b82b1253781454a09e3c8bffd001
Hash for depend.bb.do_populate_sysroot:virtual:native', 'themese-wm-theme-i=
llume-neo_git.bb.do_packagedata', 'themeselementary-theme-neo_git.bb.do_pac=
kagedata', 'themesgpe-theme-neo_git.bb.do_packagedata', 'themesgtk-theme-ne=
o_git.bb.do_packagedata', 'themesicon-theme-neo_git.bb.do_packagedata', 'th=
emesphoneui-shr-theme-neo_git.bb.do_packagedata', 'themesshr-theme-neo.bb.d=
o_package', 'themesshr-theme-neo.bb.do_packagedata'] to ['opkg-utilsopkg-ut=
ils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_p=
opulate_sysroot:virtual:native', 'themese-wm-theme-illume-neo_git.bb.do_pac=
kagedata', 'themeselementary-theme-neo_git.bb.do_packagedata', 'themesgpe-t=
heme-neo_git.bb.do_packagedata', 'themesgtk-theme-neo_git.bb.do_packagedata=
', 'themesicon-theme-neo_git.bb.do_packagedata', 'themesphoneui-shr-theme-n=
eo_git.bb.do_packagedata', 'themesshr-theme-neo.bb.do_package', 'themesshr-=
theme-neo.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/themes=
/icon-theme-neo_git.bb.do_packagedata with hash 58d98cdfc7efa0c55bf97359016=
5a134
 changed to
/home/jenkins/oe/world/shr-core/meta-smartphone/meta-shr/recipes-shr/themes=
/icon-theme-neo_git.bb.do_packagedata with hash fb7f6b42ca4f71c8e0b8475dff6=
b0272
Hash for dependent task themesicon-theme-neo_git.bb.do_packagedata changed =
=66rom 58d98cdfc7efa0c55bf973590165a134 to fb7f6b42ca4f71c8e0b8475dff6b0272

ERROR: terminus-font different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'terminus-fontterminus-=
font_4.38.bb.do_package', 'terminus-fontterminus-font_4.38.bb.do_packagedat=
a'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-u=
tils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_=
populate_sysroot:virtual:native', 'terminus-fontterminus-font_4.38.bb.do_pa=
ckage', 'terminus-fontterminus-font_4.38.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-arphic-uming different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-arphic-um=
ing_20080216.bb.do_package', 'ttf-fontsttf-arphic-uming_20080216.bb.do_pack=
agedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utils=
opkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.=
bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-arphic-uming_20080216=
=2Ebb.do_package', 'ttf-fontsttf-arphic-uming_20080216.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata, 'pseudopseudo_1.6.7.bb.do_pop=
ulate_sysroot:virtual:native', 'ttf-fontsttf-dejavu_2.35.bb.do_package', 't=
tf-fontsttf-dejavu_2.35.bb.do_packagedata'] to ['fontconfigfontconfig_2.11.=
94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vir=
tual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', '=
ttf-fontsttf-dejavu_2.35.bb.do_package', 'ttf-fontsttf-dejavu_2.35.bb.do_pa=
ckagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-droid different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-droid_git=
=2Ebb.do_package', 'ttf-fontsttf-droid_git.bb.do_packagedata'] to ['fontcon=
figfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_p=
opulate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot=
:virtual:native', 'ttf-fontsttf-droid_git.bb.do_package', 'ttf-fontsttf-dro=
id_git.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-gentium different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-gentium_1=
=2E02.bb.do_package', 'ttf-fontsttf-gentium_1.02.bb.do_packagedata'] to ['f=
ontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.b=
b.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_s=
ysroot:virtual:native', 'ttf-fontsttf-gentium_1.02.bb.do_package', 'ttf-fon=
tsttf-gentium_1.02.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-hunkyfonts different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-hunkyfont=
s_0.3.0.bb.do_package', 's/oe/world/shr-core/openembedded-core/meta/recipes=
-graphics/fontconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4=
c0d35872d84c2e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-inconsolata different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-inconsola=
ta_20100526.bb.do_package', 'ttf-fontsttf-inconsolata_20100526.bb.do_packag=
edata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsop=
kg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb=
=2Edo_populate_sysroot:virtual:native', 'ttf-fontsttf-inconsolata_20100526.=
bb.do_package', 'ttf-fontsttf-inconsolata_20100526.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-liberation different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-liberatio=
n_0.2.bb.do_package', 'ttf-fontsttf-liberation_0.2.bb.do_packagedata'] to [=
'fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git=
=2Ebb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_popula=
te_sysroot:virtual:native', 'ttf-fontsttf-liberation_0.2.bb.do_package', 't=
tf-fontsttf-liberation_0.2.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-mplus different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-mplus_027=
=2Ebb.do_package', 'ttf-fontsttf-mplus_027.bb.do_packagedata'] to ['fontcon=
figfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_p=
opulate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot=
:virtual:native', 'ttf-fontsttf-mplus_027.bb.do_package', 'ttf-fontsttf-mpl=
us_027.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/foa=
ckage_write_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-sazanami_=
20040629.bb.do_package', 'ttf-fontsttf-sazanami_20040629.bb.do_packagedata'=
] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-uti=
ls_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_po=
pulate_sysroot:virtual:native', 'ttf-fontsttf-sazanami_20040629.bb.do_packa=
ge', 'ttf-fontsttf-sazanami_20040629.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-tlwg different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-tlwg_0.6.=
1.bb.do_package', 'ttf-fontsttf-tlwg_0.6.1.bb.do_packagedata'] to ['fontcon=
figfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_p=
opulate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot=
:virtual:native', 'ttf-fontsttf-tlwg_0.6.1.bb.do_package', 'ttf-fontsttf-tl=
wg_0.6.1.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-ubuntu-font-family different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-ubuntu-fo=
nt-family_0.80.bb.do_package', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_=
packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-u=
tilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.=
6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-ubuntu-font-famil=
y_0.80.bb.do_package', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_packaged=
ata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: ttf-wqy-zenhei different signature for task do_package_write_ipk.sig=
data betopseudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf=
-wqy-zenhei_0.9.45.bb.do_package', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_pa=
ckagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 0d0f8b4c0d35872d84c2=
e975d09137dd
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 33d43b3753a802f860eb=
a2d7676a3c9b
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 0d0f8b4c0d35872d84c2e975d09137dd to 33d43b3753a802f860eba2d7676a3c=
9b

ERROR: xserver-common different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
runtaskdeps changed from ['fbsetfbset_2.1.bb.do_packagedata', 'opkg-utilsop=
kg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.6.7.bb=
=2Edo_populate_sysroot:virtual:native', 'xinput-calibratorxinput-calibrator=
_git.bb.do_packagedata', 'xorg-appxdpyinfo_1.3.2.bb.do_packagedata', 'xorg-=
appxmodmap_1.0.9.bb.do_packagedata', 'xorg-appxrandr_1.4.3.bb.do_packagedat=
a', 'xserver-commonxserver-common_1.34.bb.do_package', 'xserver-commonxserv=
er-common_1.34.bb.do_packagedata'] to ['fbsetfbset_2.1.bb.do_packagedata', =
'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudops=
eudo_1.6.7.bb.do_populate_sysroot:virtual:native', 'xinput-calibratorxinput=
-calibrator_git.bb.do_packagedata', 'xorg-appxdpyinfo_1.3.2.bb.do_packageda=
ta', 'xorg-appxmodmap_1.0.9.bb.do_packagedata', 'xorg-appxrandr_1.4.3.bb.do=
_packagedata', 'xserver-commonxserver-common_1.34.bb.do_package', 'xserver-=
commonxserver-common_1.34.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/f=
bset/fbset_2.1.bb.do_packagedata with hash 3f19c90515922465e1492659525c86b7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/f=
bset/fbset_2.1.bb.do_packagedata with hash bd6e7a6ecf00a124b319653a90abed31
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xin=
put-calibrator/xinput-calibrator_git.bb.do_packagedata with hash c74d0ef0de=
27341140d185689414c9b9
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xin=
put-calibrator/xinput-calibrator_git.bb.do_packagedata with hash 3faae7164e=
eefafef2f8199f3edccd10
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xdpyinfo_1.3.2.bb.do_packagedata with hash 0e64173a4117cc0d748caac34c=
e012e2
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xdpyinfo_1.3.2.bb.do_packagedata with hash 03f8775ec45f47068060522f62=
635565
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xmodmap_1.0.9.bb.do_packagedata with hash 7265d634f7b866c0b7ba2ce5020=
dfc69
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xmodmap_1.0.9.bb.do_packagedata with hash e2467f6113b29c4689c6adf68b4=
01148
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xrandr_1.4.3.bb.do_packagedata with hash 7520ac9349b918dcd3719692192b=
9dd5
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xrandr_1.4.3.bb.do_packagedata with hash 72ec3d3cbc553e2f148dd30dd1ca=
3caf
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_package with hash 1151fd77988f4eb7=
03daa003bff85161
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/r changed from 75=
20ac9349b918dcd3719692192b9dd5 to 72ec3d3cbc553e2f148dd30dd1ca3caf
Hash for dependent task xinput-calibratorxinput-calibrator_git.bb.do_packag=
edata changed from c74d0ef0de27341140d185689414c9b9 to 3faae7164eeefafef2f8=
199f3edccd10
Hash for dependent task fbsetfbset_2.1.bb.do_packagedata changed from 3f19c=
90515922465e1492659525c86b7 to bd6e7a6ecf00a124b319653a90abed31
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_package cha=
nged from 1151fd77988f4eb703daa003bff85161 to 08f511afdfe8edb464a6fde2f1810=
d98
Hash for dependent task xorg-appxmodmap_1.0.9.bb.do_packagedata changed fro=
m 7265d634f7b866c0b7ba2ce5020dfc69 to e2467f6113b29c4689c6adf68b401148
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_packagedata=
 changed from 4c8813d0279a44bae4f09aff33556471 to fe9a4d0050390ead7ef218392=
b7e9d4a
Hash for dependent task xorg-appxdpyinfo_1.3.2.bb.do_packagedata changed fr=
om 0e64173a4117cc0d748caac34ce012e2 to 03f8775ec45f47068060522f62635565

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'pseudopseudo_1.6.7.bb.do_populate_sysroot:virtual:native'=
, 'xorg-appxinit_1.3.4.bb.do_packagedata', 'xserver-commonxserver-common_1.=
34.bb.do_packagedata', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_packag=
e', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_packagedata'] to ['opkg-u=
tilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.=
6.7.bb.do_populate_sysroot:virtual:native', 'xorg-appxinit_1.3.4.bb.do_pack=
agedata', 'xserver-commonxserver-common_1.34.bb.do_packagedata', 'xserver-n=
odm-initxserver-nodm-init_2.0.bb.do_package', 'xserver-nodm-initxserver-nod=
m-init_2.0.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xinit_1.3.4.bb.do_packagedata with hash 93a2646347f47cf30cf9e08b06e62=
ab2
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xinit_1.3.4.bb.do_packagedata with hash d4cc54b5743a2e0788dbc9da4b639=
3e7
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_packagedata with hash 4c8813d0279a=
44bae4f09aff33556471
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_packagedata with hash fe9a4d005039=
0ead7ef218392b7e9d4a
Hash for dependent task xorg-appxinit_1.3.4.bb.do_packagedata changed from =
93a2646347f47cf30cf9e08b06e62ab2 to d4cc54b5743a2e0788dbc9da4b6393e7
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_packagedata=
 changed from 4c8813d0279a44bae4f09aff33556471 to fe9a4d0050390ead7ef218392=
b7e9d4a

ERROR: 23 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1441728995/signatures.qemuarm.do_package_write_ipk.sigdata.log

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vv4Sf/kQfcwinyKX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXvFlUACgkQN1Ujt2V2gBynrgCgsePhGbRUhOSupkqVV/K7wt+J
vxAAoI8yXI1btgQhi4KaJkM9n6Pr8x13
=qHfM
-----END PGP SIGNATURE-----

--vv4Sf/kQfcwinyKX--
