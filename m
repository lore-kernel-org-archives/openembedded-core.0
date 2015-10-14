Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1B076AE2;
	Wed, 14 Oct 2015 18:48:25 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so141971466wic.1;
	Wed, 14 Oct 2015 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=7XcHurEYOYoGEy+rdon9Emd+2MT9LcW8NpGS9LW4vAk=;
	b=RAJcOIb31x/2vtBRToAOGF7J0eceSxyDGTyTrs5ykCG/hFJcuVNzAuT2DSI3rnk7Ja
	0Jt0a84FFvX6rR8kUNJ7fpho+my6qiVYuvu4boSw+ozGmgLCrIM8M5IHE+ZhxxSACkmP
	/AX4BsT1PdJQjtwZMBCpCtJiCLzKh10l8+zFltTbMajCpqLQuADlHFslPedZT5YQbEzM
	OFTkloCPFkrsfjYr3PkAx6E8ev4Lt1COYcWUEFYBZr1ZaezIY3M2lHpv1Vx4e7LnyVTB
	nQzQdN2OvQqVjR/PHxQbMfXf0KWEZwS1bV+HriwOWYMSlZxs5FEAjEVyDgAzni6wFqFX
	zbWw==
X-Received: by 10.180.211.10 with SMTP id my10mr6454053wic.84.1444848505257;
	Wed, 14 Oct 2015 11:48:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bk4sm11666693wjc.1.2015.10.14.11.48.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 11:48:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 20:48:40 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20151014184840.GF22448@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2015-10-14
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
X-List-Received-Date: Wed, 14 Oct 2015 18:48:27 -0000
X-Groupsio-MsgNum: 72181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i3lJ51RuaGWuFYNw"
Content-Disposition: inline

--i3lJ51RuaGWuFYNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 07:09:42PM +0200, Martin Jansa wrote:
> ERROR: 84 issues were found in these recipes: android-tools
> cryptodev-tests dracut initscripts ipsec-tools libauthen-sasl-perl
> libdigest-hmac-perl libio-socket-ssl-perl linux-atm lmsensors
> lttng-tools luna-sysmgr-ipc-messages netmap openlmi-networking
> openlmi-providers openlmi-storage oprofile oprofileui oprofileui-server
> packagegroup-efl-sdk phpmyadmin polkit-group-rule-datetime
> polkit-group-rule-network shr-theme-neo terminus-font tipcutils
> ttf-arphic-uming ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts
> ttf-inconsolata ttf-liberation ttf-mplus ttf-sazanami ttf-tlwg
> ttf-ubuntu-font-family ttf-wqy-zenhei xfce4-session xl2tpd
> xserver-common xserver-nodm-init zabbix

There were some fixes in jethro

ERROR: 67 issues were found in these recipes: android-tools dracut
initscripts ipsec-tools libauthen-sasl-perl libdigest-hmac-perl
libio-socket-ssl-perl linux-atm lmsensors luna-sysmgr-ipc-messages
netmap openlmi-networking openlmi-providers openlmi-storage
packagegroup-efl-sdk phpmyadmin shr-theme-neo terminus-font tipcutils
ttf-arphic-uming ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts
ttf-inconsolata ttf-liberation ttf-mplus ttf-sazanami ttf-tlwg
ttf-ubuntu-font-family ttf-wqy-zenhei xfce4-session xl2tpd
xserver-common xserver-nodm-init zabbix

Complete log is here:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.signatures.20151014_1803=
41.log/

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5.3=
9.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_=
sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.=
do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virt=
ual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cr=
oss_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_popul=
ate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenss=
l_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysr=
oot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot'] to ['autoco=
nfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1=
=2E15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.bb.do_popul=
ate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroot:virtua=
l:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.b=
b.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-conf=
iggnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-toolsipsec-=
tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroo=
t', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlinux-yocto=
_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_populate_sysroot=
', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystemd-systemctl=
-native.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43=
dd6bf3b
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6f=
a9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

ERROR: linux-atm different signature for task do_configure.sigdata between =
qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'flexflex_2.5.39.bb.do_populate_sysroot', 'flexflex_2.5.39.bb.do_populate=
_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgc=
c-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'li=
btoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.=
4.6.bb.do_populate_sysroot', 'linux-atmlinux-atm_2.5.2.bb.do_patch', 'linux=
linux-yocto_4.1.bb.do_populate_sysroot', 'pkgconfigpkgconfig_git.bb.do_popu=
late_sysroot:virtual:native'] to ['autoconfautoconf_2.69.bb.do_populate_sys=
root:virtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual=
:native', 'flexflex_2.5.39.bb.do_populate_sysroot', 'flexflex_2.5.39.bb.do_=
populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot'=
, 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_popul=
ate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:nati=
ve', 'libtoollibtool-cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-n=
ative_2.4.6.bb.do_populate_sysroot', 'linux-atmlinux-atm_2.5.2.bb.do_patch'=
, 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pkgconfigpkgconfig_git.bb=
=2Edo_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43=
dd6bf3b
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6f=
a9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

ERROR: lmsensors different signature for task do_configure.sigdata between =
qemux86copy and qemux86
basehash changed from 25ea9d362a28aa9ec283114e5793832e to c292324f876baec39=
dda79cb21ec969c
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: netmap different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
basehash changed from 748eae270193023d79f7d6a69aa1b8d2 to 9267873ef5fa4474d=
5f60fc79044ab64
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: openlmi-networking different signature for task do_configure.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-n=
ative_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroo=
t', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_po=
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
ss_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot'=
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
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 669fc52398=
649d64161a4848e6d1903f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 8bb7a9a90e=
be53c8c3d957ef7715b6e7
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_populate_sysro=
ot changed from 669fc52398649d64161a4848e6d1903f to 8bb7a9a90ebe53c8c3d957e=
f7715b6e7

ERROR: openlmi-providers different signature for task do_configure.sigdata =
between qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake-n=
ative_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysroo=
t', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_po=
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
temdsystemd-systemctl-native.bb.do_populate_sysroot', 'systemdsystemd_225.b=
b.do_populate_sysroot'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:v=
irtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:nativ=
e', 'cim-schemacim-schema-exper_2.39.0.bb.do_populate_sysroot', 'cmakecmake=
-native_3.3.1.bb.do_populate_sysroot', 'dbusdbus_1.8.20.bb.do_populate_sysr=
oot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_=
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
ystemdsystemd-systemctl-native.bb.do_populate_sysroot', 'systemdsystemd_225=
=2Ebb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_populate_sysroot with hash 54e712e3cb33bb71=
e3dffd37fef1f711
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_populate_sysroot with hash 4bb2920a72bc6dcd=
ce21bd8944a0e883
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_populate_sysroot ch=
anged from 54e712e3cb33bb71e3dffd37fef1f711 to 4bb2920a72bc6dcdce21bd8944a0=
e883

ERROR: openlmi-storage different signature for task do_configure.sigdata be=
tween qemux86copy and qemux86
runtaskdeps changed from ['cmpi-bindingscmpi-bindings_git.bb.do_populate_sy=
sroot', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.d=
o_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'openlmiopen=
lmi-providers_0.6.0.bb.do_populate_sysroot', 'openlmiopenlmi-storage_0.8.1.=
bb.do_patch', 'pythonpython-native_2.7.9.bb.do_populate_sysroot', 'pythonpy=
thon-setuptools_18.2.bb.do_populate_sysroot:virtual:native', 'pythonpython_=
2.7.9.bb.do_populate_sysroot', 'pywbempywbem_0.8.0.bb.do_populate_sysroot']=
 to ['cmpi-bindingscmpi-bindings_git.bb.do_populate_sysroot', 'gccgcc-cross=
_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', =
'glibcglibc_2.22.bb.do_populate_sysroot', 'openlmiopenlmi-providers_0.6.0.b=
b.do_populate_sysroot', 'openlmiopenlmi-storage_0.8.1.bb.do_patch', 'python=
python-native_2.7.9.bb.do_populate_sysroot', 'pythonpython-setuptools_18.2.=
bb.do_populate_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_populate_=
sysroot', 'pywbempywbem_0.8.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 669fc52398=
649d64161a4848e6d1903f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_populate_sysroot with hash 8bb7a9a90e=
be53c8c3d957ef7715b6e7
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_populate_sysro=
ot changed from 669fc52398649d64161a4848e6d1903f to 8bb7a9a90ebe53c8c3d957e=
f7715b6e7

ERROR: tipcutils different signature for task do_configure.sigdata between =
qemux86copy and qemux86
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_popu=
late_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-con=
fig_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6=
=2Ebb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sys=
root', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'tipcutilstipcutils_2=
=2E0.6.bb.do_patch'] to ['autoconfautoconf_2.69.bb.do_populate_sysroot:virt=
ual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native',=
 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_popul=
ate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'gnu-configgnu-conf=
ig_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-cross_2.4.6.=
bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroo=
t', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'tipcutilstipcutils_2.0.=
6.bb.do_patch']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43=
dd6bf3b
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6f=
a9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

ERROR: xl2tpd different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgc=
c-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pppppp_2.4.7.bb.do_po=
pulate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot', 'upda=
te-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tp=
d_1.3.6.bb.do_patch'] to ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgc=
c-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'pppppp_2.4.7.bb.do_po=
pulate_sysroot', 'update-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot', 'upda=
te-rc.dupdate-rc.d_0.7.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tp=
d_1.3.6.bb.do_patch']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 1a8aa7a50a6cf3ebf5401af43=
dd6bf3b
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_populate_sysroot with hash 143d2686a37f592891fb2aa6f=
a9b752e
Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot changed=
 from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752e

ERROR: zabbix different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
basehash changed from 2b2cdeb8b36ed130bf28374a5b6d2e4d to 624cc1888e50c4509=
679c829a906af03
Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

ERROR: 10 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1444845868/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: initscripts different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['initscriptsinitscripts_1.0.bb.do_install'] to ['=
initscriptsinitscripts_1.0.bb.do_install']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_install with hash a6c1cea4a425254e4b12ca7fcc86d0=
66
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_install with hash 320945aee8e3d13d2a5fbbeb45e546=
e6
Hash for dependent task initscriptsinitscripts_1.0.bb.do_install changed fr=
om a6c1cea4a425254e4b12ca7fcc86d066 to 320945aee8e3d13d2a5fbbeb45e546e6
ERROR: ipsec-tools different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
runtaskdeps changed from ['ipsec-toolsipsec-tools_0.8.2.bb.do_install'] to =
['ipsec-toolsipsec-tools_0.8.2.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_install with hash 1c57830a214a81=
5dab8453a7434d428c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_install with hash 9f9672bf1df783=
710a975b896b2c8dd3
Hash for dependent task ipsec-toolsipsec-tools_0.8.2.bb.do_install changed =
=66rom 1c57830a214a815dab8453a7434d428c to 9f9672bf1df783710a975b896b2c8dd3

ERROR: linux-atm different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['linux-atmlinux-atm_2.5.2.bb.do_install'] to ['li=
nux-atmlinux-atm_2.5.2.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_install with hash a6bb19858531b8f048=
f2ba7cfd9c4963
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_install with hash b21231bb84b3ff20a0=
3a906b96fc2c00
Hash for dependent task linux-atmlinux-atm_2.5.2.bb.do_install changed from=
 a6bb19858531b8f048f2ba7cfd9c4963 to b21231bb84b3ff20a03a906b96fc2c00

ERROR: lmsensors different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['lm_sensorslmsensors_3.4.0.bb.do_install'] to ['l=
m_sensorslmsensors_3.4.0.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_install with hash 63edfc459964277828a1505c2=
f0f93ea
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_install with hash 850efa141a27884f89f0ff174=
e45d8be
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_install changed fro=
m 63edfc459964277828a1505c2f0f93ea to 850efa141a27884f89f0ff174e45d8be

ERROR: netmap different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['netmapnetmap_git.bb.do_install'] to ['netmapnetm=
ap_git.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_install with hash 0cd6f6f70d36e474819e4c463d7=
821a3
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_install with hash ae72a55477cfa79752a3df5de8e=
4255e
Hash for dependent task netmapnetmap_git.bb.do_install changed from 0cd6f6f=
70d36e474819e4c463d7821a3 to ae72a55477cfa79752a3df5de8e4255e

ERROR: openlmi-networking different signature for task do_populate_sysroot.=
sigdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-networking_0.3.1.bb.do_install'] =
to ['openlmiopenlmi-networking_0.3.1.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_install with hash ca4e77e9d6ad074712=
2128967b648ec7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_install with hash 7ef3829e6e34cbbc87=
a9f6d9b464fd98
Hash for dependent task openlmiopenlmi-networking_0.3.1.bb.do_install chang=
ed from ca4e77e9d6ad0747122128967b648ec7 to 7ef3829e6e34cbbc87a9f6d9b464fd98

ERROR: openlmi-providers different signature for task do_populate_sysroot.s=
igdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-providers_0.6.0.bb.do_install'] t=
o ['openlmiopenlmi-providers_0.6.0.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_install with hash 5258c8d4d3cceb10a3b=
f9414a005bf7b
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_install with hash f7ebda83b0a1be35399=
6d64009981952
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_install change=
d from 5258c8d4d3cceb10a3bf9414a005bf7b to f7ebda83b0a1be353996d64009981952

ERROR: openlmi-storage different signature for task do_populate_sysroot.sig=
data between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-storage_0.8.1.bb.do_install'] to =
['openlmiopenlmi-storage_0.8.1.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_install with hash 2698507338bbb96a5f685=
254cfdd081b
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_install with hash d27496333e1fb2aaaae3c=
f2c1086e715
Hash for dependent task openlmiopenlmi-storage_0.8.1.bb.do_install changed =
=66rom 2698507338bbb96a5f685254cfdd081b to d27496333e1fb2aaaae3cf2c1086e715

ERROR: tipcutils different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
runtaskdeps changed from ['tipcutilstipcutils_2.0.6.bb.do_install'] to ['ti=
pcutilstipcutils_2.0.6.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_install with hash cb0751ee55714c4a6b4b57c72=
957307c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_install with hash 44a6df53305815284ea863423=
32acd9b
Hash for dependent task tipcutilstipcutils_2.0.6.bb.do_install changed from=
 cb0751ee55714c4a6b4b57c72957307c to 44a6df53305815284ea86342332acd9b

ERROR: xl2tpd different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['xl2tpdxl2tpd_1.3.6.bb.do_install'] to ['xl2tpdxl=
2tpd_1.3.6.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_1.3.6.bb.do_install with hash 8933863e556f6a9e52fd2a=
59dca55da6
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_1.3.6.bb.do_install with hash 64408a8e47ac61e250a659=
8311a599d9
Hash for dependent task xl2tpdxl2tpd_1.3.6.bb.do_install changed from 89338=
63e556f6a9e52fd2a59dca55da6 to 64408a8e47ac61e250a6598311a599d9

ERROR: zabbix different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
runtaskdeps changed from ['zabbixzabbix_2.4.5.bb.do_install'] to ['zabbixza=
bbix_2.4.5.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_install with hash c4c6ae31e0edd804b0b74e86b5b=
49325
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_install with hash 36f73bb13dc2719d30592fdf58e=
45169
Hash for dependent task zabbixzabbix_2.4.5.bb.do_install changed from c4c6a=
e31e0edd804b0b74e86b5b49325 to 36f73bb13dc2719d30592fdf58e45169

ERROR: 11 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1444845868/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: android-tools different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
runtaskdeps changed from ['android-toolsandroid-tools-conf_1.0.bb.do_packag=
edata', 'android-toolsandroid-tools_4.2.2.bb.do_package', 'android-toolsand=
roid-tools_4.2.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popula=
te_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virt=
ual:native'] to ['android-toolsandroid-tools-conf_1.0.bb.do_packagedata', '=
android-toolsandroid-tools_4.2.2.bb.do_package', 'android-toolsandroid-tool=
s_4.2.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroo=
t:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:nativ=
e']
/home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-androi=
d/android-tools/android-tools-conf_1.0.bb.do_packagedata with hash bfd6f69a=
d976d411e4a5073b55df74ad
 changed to
/home/jenkins/oe/world/shr-core/meta-smartphone/meta-android/recipes-androi=
d/android-tools/android-tools-conf_1.0.bb.do_packagedata with hash abe3c0d0=
7d6704d9693885e33eaa0fb8
Hash for dependent task android-toolsandroid-tools-conf_1.0.bb.do_packageda=
ta changed from bfd6f69ad976d411e4a5073b55df74ad to abe3c0d07d6704d9693885e=
33eaa0fb8

ERROR: dracut different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['bash-completionbash-completion_2.1.bb.do_package=
data', 'bashbash_4.3.30.bb.do_packagedata', 'busyboxbusybox_1.23.2.bb.do_pa=
ckagedata', 'coreutilscoreutils_8.24.bb.do_packagedata', 'cpiocpio_2.11.bb.=
do_packagedata', 'dracutdracut_git.bb.do_package', 'dracutdracut_git.bb.do_=
packagedata', 'findutilsfindutils_4.5.14.bb.do_packagedata', 'glibcglibc_2.=
22.bb.do_packagedata', 'linuxlinux-yocto_4.1.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudgedata', 'bus=
yboxbusybox_1.23.2.bb.do_packagedata', 'coreutilscoreutils_8.24.bb.do_packa=
gedata', 'cpiocpio_2.11.bb.do_packagedata', 'dracutdracut_git.bb.do_package=
', 'dracutdracut_git.bb.do_packagedata', 'findutilsfindutils_4.5.14.bb.do_p=
ackagedata', 'glibcglibc_2.22.bb.do_packagedata', 'linuxlinux-yocto_4.1.bb.=
do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:n=
ative', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'system=
dsystemd_225.bb.do_packagedata', 'util-linuxutil-linux_2.26.2.bb.do_package=
data']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash a98b79faed8b6633269560af1add43=
a5
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-kernel/linux=
/linux-yocto_4.1.bb.do_packagedata with hash 15962f296d6961232d7350368c6044=
64
Hash for dependent task linuxlinux-yocto_4.1.bb.do_packagedata changed from=
 a98b79faed8b6633269560af1add43a5 to 15962f296d6961232d7350368c604464

ERROR: initscripts different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
runtaskdeps changed from ['initscriptsinitscripts_1.0.bb.do_package', 'init=
scriptsinitscripts_1.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_=
populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroo=
t:virtual:native'] to ['initscriptsinitscripts_1.0.bb.do_package', 'initscr=
iptsinitscripts_1.0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_pop=
ulate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:v=
irtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_package with hash 654af23410d149e1f1b608861e4f61=
f2
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_package with hash 9b6938b605e87f341ff8a0788939a0=
2d
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_packagedata with hash a3335688723d1ed502a5b5ec00=
df699e
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/initscr=
ipts/initscripts_1.0.bb.do_packagedata with hash 1120f9c82d3013b5f5ac62ef05=
6f6ef6
Hash for dependent task initscriptsinitscripts_1.0.bb.do_packagedata change=
d from a3335688723d1ed502a5b5ec00df699e to 1120f9c82d3013b5f5ac62ef056f6ef6
Hash for dependent task initscriptsinitscripts_1.0.bb.do_package changed fr=
om 654af23410d149e1f1b608861e4f61f2 to 9b6938b605e87f341ff8a0788939a02d

ERROR: ipsec-tools different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
runtaskdeps changed from ['ipsec-toolsipsec-tools_0.8.2.bb.do_package', 'ip=
sec-toolsipsec-tools_0.8.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb=
=2Edo_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_=
sysroot:virtual:native'] to ['ipsec-toolsipsec-tools_0.8.2.bb.do_package', =
'ipsec-toolsipsec-tools_0.8.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git=
=2Ebb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_popula=
te_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_package with hash 1ae9bd105f332a=
ebc33cf4bb82e957d7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_package with hash 43bcb4ccd3b1ea=
c097adfa7e9ec4d63e
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/ipsec-tools/ipsec-tools_0.8.2.bb.do_packagils_git.bb.do_populate_sys=
root:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:na=
tive'] to ['linux-atmlinux-atm_2.5.2.bb.do_package', 'linux-atmlinux-atm_2.=
5.2.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vi=
rtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_package with hash d173f0ac7b0e588411=
88cd58b2041fb0
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_package with hash dbddd61f96edcbc3ee=
0aaa7f16c7fbdb
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_packagedata with hash 919d6988f8f0f0=
1e2cf7a6880ce1e519
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-s=
upport/linux-atm/linux-atm_2.5.2.bb.do_packagedata with hash 92a274d529bbf4=
be189a566641ed9a43
Hash for dependent task linux-atmlinux-atm_2.5.2.bb.do_package changed from=
 d173f0ac7b0e58841188cd58b2041fb0 to dbddd61f96edcbc3ee0aaa7f16c7fbdb
Hash for dependent task linux-atmlinux-atm_2.5.2.bb.do_packagedata changed =
=66rom 919d6988f8f0f01e2cf7a6880ce1e519 to 92a274d529bbf4be189a566641ed9a43

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
m_sensors/lmsensors-config_1.0.bb.do_packagedata with hash 1bb7ac3fb81f01e9=
ec519181e7cc75b2
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors-config_1.0.bb.do_packagedata with hash 7162bbbcb9a0f76e=
49d65509c0c5ec8d
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_package with hash 4a50a0f9d37a35d2f77af4cf5=
89eb1d5
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_package with hash d9a5bcc8cb14c9aa43a2e2a03=
536062d
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_packagedata with hash 59cbc2593d461ed0deb89=
14f646f7509
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/l=
m_sensors/lmsensors_3.4.0.bb.do_packagedata with hash a9f7b08f380a8e64bf497=
5d3a402e08a
Hash for dependent task lm_sensorslmsensors-config_1.0.bb.do_packagedata ch=
anged from 1bb7ac3fb81f01e9ec519181e7cc75b2 to 7162bbbcb9a0f76e49d65509c0c5=
ec8d
Hash for dependent task lm_sensorslmsensors_3.4.0.bb.do_packagedata changed=
 from 59cbc2593d461ed0deb8914f646f7509 to a9f7b08f380a8e64bf4975d3a402e08a
Hash for dependent task lm_sensorslmsensors_3.4.0.b4.bb.do_populate_sysroot=
:virtual:native'] to ['netmapnetmap_git.bb.do_package', 'netmapnetmap_git.b=
b.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual=
:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_package with hash bc463abe1568348ab7aa6680e80=
c2521
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_package with hash 7258c79f1ccf4f954fcc485a286=
80a50
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_packagedata with hash fa117a93002e321c11effcc=
b5a72e2c8
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-k=
ernel/netmap/netmap_git.bb.do_packagedata with hash d461cb1ce38d9a6310223e6=
2804f4f87
Hash for dependent task netmapnetmap_git.bb.do_packagedata changed from fa1=
17a93002e321c11effccb5a72e2c8 to d461cb1ce38d9a6310223e62804f4f87
Hash for dependent task netmapnetmap_git.bb.do_package changed from bc463ab=
e1568348ab7aa6680e80c2521 to 7258c79f1ccf4f954fcc485a28680a50

ERROR: openlmi-networking different signature for task do_package_write_ipk=
=2Esigdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-networking_0.3.1.bb.do_package', =
'openlmiopenlmi-networking_0.3.1.bb.do_packagedata', 'opkg-utilsopkg-utils_=
git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_popul=
ate_sysroot:virtual:native'] to ['openlmiopenlmi-networking_0.3.1.bb.do_pac=
kage', 'openlmiopenlmi-networking_0.3.1.bb.do_packagedata', 'opkg-utilsopkg=
-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.d=
o_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_package with hash 5214a895e72fa8a35a=
0ff85b64b37d04
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_package with hash c9f852c3550a8324f9=
6ef2eaa75df552
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_packagedata with hash 08e8113aaaa5b4=
dd7ee8165a9e25deca
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-networking_0.3.1.bb.do_packagedata with hash 8445fec2674697=
3f2c331b1bb101fc8a
Hash for dependent task openlmiopenlmi-networking_0.3.1.bb.do_packagedata c=
hanged from 08e8113aaaa5b4dd7ee8165a9e25deca to 8445fec26746973f2c331b1bb10=
1fc8a
Hash for dependent task openlmiopenlmi-networking_0.3.1.bb.do_package chang=
ed from 5214a895e72fa8a35a0ff85b64b37d04 to c9f852c3550a8324f96ef2eaa75df552

ERROR: openlmi-providers different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
runtaskdeps changed from ['openlmiopenlmi-providers_0.6.0.bb.do_package', '=
openlmiopenlmi-providers_0.6.0.bb.do_packagedata', 'opkg-utilsopkg-utils_gi=
t.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populat=
e_sysroot:virtual:native', 'pythonpython_2.7.9.bb.do_packagedata'] to ['ope=
nlmiopenlmi-providers_0.6.0.bb.do_package', 'openlmiopenlmi-providers_0.6.0=
=2Ebb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vir=
tual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', '=
pythonpython_2.7.9.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_package withdded/meta-oe/recipes-exte=
nded/openlmi/openlmi-providers_0.6.0.bb.do_packagedata with hash 27a1b366f8=
6b221d2e30debd968f56af
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-providers_0.6.0.bb.do_packagedata with hash 812f0264174bab5=
a79858276d44d94b2
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_package change=
d from cef358fda79d37140fc34ebbe8c138f4 to 1113100c3b7da9d6cbc449373ad8b01b
Hash for dependent task openlmiopenlmi-providers_0.6.0.bb.do_packagedata ch=
anged from 27a1b366f86b221d2e30debd968f56af to 812f0264174bab5a79858276d44d=
94b2
ERROR: openlmi-storage different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemux86
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'openlmiopen=
lmi-storage_0.8.1.bb.do_package', 'openlmiopenlmi-storage_0.8.1.bb.do_packa=
gedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', =
'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'pythonpython_2=
=2E7.9.bb.do_packagedata'] to ['bashbash_4.3.30.bb.do_packagedata', 'openlm=
iopenlmi-storage_0.8.1.bb.do_package', 'openlmiopenlmi-storage_0.8.1.bb.do_=
packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:nati=
ve', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'pythonpyt=
hon_2.7.9.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_package with hash 6c6baee8d844b9727b03d=
dadd182ea0e
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_package with hash 9d99fabe08257bb55e5e8=
6b76df1ff85
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_packagedata with hash 3932c332100bc708b=
34ef8717e1200e6
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
openlmi/openlmi-storage_0.8.1.bb.do_packagedata with hash 7f19059ac99550fad=
c21f01130ae67d6
Hash for dependent task openlmiopenlmi-storage_0.8.1.bb.do_package changed =
=66rom 6c6baee8d844b9727b03ddadd182ea0e to 9d99fabe08257bb55e5e86b76df1ff85
Hash for dependent task openlmiopenlmi-storage_0.8.1.bb.do_packagedata chan=
ged from 3932c332100bc708b34ef8717e1200e6 to 7f19059ac99550fadc21f01130ae67=
d6

ERROR: packagegroup-efl-sdk different signature for task do_package_write_i=
pk.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['efledbus_1.7.9.bb.do_packagedata', 'eflefl_1.15.=
1.bb.do_packagedata', 'eflelementary_1.15.1.bb.do_packagedata', 'lttnglttng=
-ust_git.bb.do_packagedata', 'luajitluajit_2.0.4.bb.do_packagedata', 'opkg-=
utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'packagegroupsp=
ackagegroup-core-sdk.bb.do_packagedata', 'packagegroupspackagegroup-efl-sdk=
=2Ebb.do_package', 'packagegroupspackagegroup-efl-sdk.bb.do_packagedata', '=
pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'valgrindvalgrin=
d_3.10.1.bb.do_packagedata'] to ['efledbus_1.7.9.bb.do_packagedata', 'eflef=
l_1.15.1.bb.do_packagedata', 'eflelementary_1.15.1.bb.do_packagedata', 'ltt=
nglttng-ust_git.bb.do_packagedata', 'luajitluajit_2.0.4.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'package=
groupspackagegroup-core-sdk.bb.do_packagedata', 'packagegroupspackagegroup-=
efl-sdk.bb.do_package', 'packagegroupspackagegroup-efl-sdk.bb.do_packagedat=
a', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'valgrindva=
lgrind_3.10.1.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/m'tipcutilstipcutils_2.0.=
6.bb.do_package', 'tipcutilstipcutils_2.0.6.bb.do_packagedata'] to ['opkg-u=
tilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.=
7.4.bb.do_populate_sysroot:virtual:native', 'tipcutilstipcutils_2.0.6.bb.do=
_package', 'tipcutilstipcutils_2.0.6.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_package with hash dbf78a72c5af88412c52c978f=
85240a6
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_package with hash 38a314837058ed465f9e3b6fe=
986e13e
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_packagedata with hash bace30cc6017e2d9776de=
d29918bef26
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
tipcutils/tipcutils_2.0.6.bb.do_packagedata with hash b69c8a13db0329a0ea22b=
dde910a120f
Hash for dependent task tipcutilstipcutils_2.0.6.bb.do_package changed from=
 dbf78a72c5af88412c52c978f85240a6 to 38a314837058ed465f9e3b6fe986e13e
Hash for dependent task tipcutilstipcutils_2.0.6.bb.do_packagedata changed =
=66rom bace30cc6017e2d9776ded29918bef26 to b69c8a13db0329a0ea22bdde910a120f

ERROR: xfce4-session different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
runtaskdeps changed from ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilso=
pkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.b=
b.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packageda=
ta', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-ses=
sion_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packag=
edata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.=
do_packagedata'] to ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilsopkg-u=
tils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_=
populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packagedata', =
'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-session_=
4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packagedata=
', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.do_pa=
ckagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/xf=
ce4-session/machine-host.bb.do_packagedata with hash 7b3f9a883729dfe908e179=
80476d10e2
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-xfce/recipes-xfce/xf=
ce4-session/machine-host.bb.do_packagedata with hash f51309cb641c82a6d8e2dc=
5387bb6484
Hash for dependent task xfce4-sessionmachine-host.bb.do_packagedata changed=
 from 7b3f9a883729dfe908e17980476d10e2 to f51309cb641c82a6d8e2dc5387bb6484
ERROR: xl2tpd different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native'=
, 'xl2tpdxl2tpd_1.3.6.bb.do_package', 'xl2tpdxl2tpd_1.3.6.bb.do_packagedata=
'] to ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'p=
seudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'xl2tpdxl2tpd_1.3=
=2E6.bb.do_package', 'xl2tpdxl2tpd_1.3.6.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_1.3.6.bb.do_package with hash 4ae65369d3d05c9ac0efb4=
19c2a6de3f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-p=
rotocols/xl2tpd/xl2tpd_1.3ackagedata changed from fa89714f0b2f4e5f3b6925332=
91a262d to 0d00e49e7a17128f9ac702f7c08beb06
Hash for dependent task xl2tpdxl2tpd_1.3.6.bb.do_package changed from 4ae65=
369d3d05c9ac0efb419c2a6de3f to c5f9a31e2776b79803ded3ad6fefc653

ERROR: zabbix different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
runtaskdeps changed from ['logrotatelogrotate_3.9.1.bb.do_packagedata', 'op=
kg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseud=
o_1.7.4.bb.do_populate_sysroot:virtual:native', 'zabbixzabbix_2.4.5.bb.do_p=
ackage', 'zabbixzabbix_2.4.5.bb.do_packagedata'] to ['logrotatelogrotate_3.=
9.1.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:vi=
rtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', =
'zabbixzabbix_2.4.5.bb.do_package', 'zabbixzabbix_2.4.5.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_package with hash 3607d76d7ff6d8bd98f08c7ef07=
68163
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_package with hash b4f7ef411d93d9a48158a228522=
0b8ee
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_packagedata with hash 4ce6ebe9bf7bac78f813b29=
f2696fb22
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-connectiv=
ity/zabbix/zabbix_2.4.5.bb.do_packagedata with hash 6bf3726df4d9dd312081bb3=
c8beda826
Hash for dependent task zabbixzabbix_2.4.5.bb.do_package changed from 3607d=
76d7ff6d8bd98f08c7ef0768163 to b4f7ef411d93d9a48158a2285220b8ee
Hash for dependent task zabbixzabbix_2.4.5.bb.do_packagedata changed from 4=
ce6ebe9bf7bac78f813b29f2696fb22 to 6bf3726df4d9dd312081bb3c8beda826

ERROR: 15 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1444845868/signatures.qemux86.do_package_write_ipk.sigdata.log


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
', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGETCH', 'TARGET_CFLAGS'=
, 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH',=
 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TAR=
GET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS'=
, 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARCH32', 'X86ARCH64', '=
base_bindir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'bas=
e_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bind=
ir', 'cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configur=
e', 'docdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_=
native', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', '=
localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincl=
udedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_qa=
_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'shareds=
tatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_in=
it', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'systemd=
_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
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
ir', 'sharedstatedir', 'sstate_add', 'sstate_cleaed from ' -m32 -march=3Di5=
86' to ' -march=3Darmv5te -mthumb  -mthumb-interwork'
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
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgc=
c-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'libauthenlibauthen-sasl-perl_2.16.bb.do_patch', 'perlperl-native_5.2=
2.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to [=
'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_popula=
te_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libauthenlibauthen-=
sasl-perl_2.16.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot=
', 'perlperl_5.22.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_5.2.bb.do_populate_sysroot with hash 6496d4375c62146d7c0063af4b3=
86d52
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_5.2.bb.do_populate_sysroot with hash 6122fc8ab74fb7855854a458f17=
af6cc
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_5.2.bb.do_populate_sysroot with hash 30baea95a6cd93b85bb73af98=
5ade681
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_5.2.bb.do_populate_sysroot with hash 79873f0dca561218ce1a8f4a6=
bda63f2
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 467aec2bee3aea4b15e1de8b0c34cc13
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash b58254263eec016f62b8245d94983aca
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 518c240274a630b9760a9a422846=
6878
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash d116d80b83736fb332556760dc7e=
5a72
Hash for dependent task gccgcc-runtime_5.2.bb.do_populate_sysroot changed f=
rom 30baea95a6cd93b85bb73af985ade681 to 79873f0dca561218ce1a8f4a6bda63f2
Hash for dependent task gccgcc-cross_5.2.bb.do_populate_sysroot changed fro=
m 6496d4375c62146d7c0063af4b386d52 to 6122fc8ab74fb7855854a458f17af6cc
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 467aec2bee3aea4b15e1de8b0c34cc13 to b58254263eec016f62b8245d94983aca
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from=
 518c240274a630b9760a9a4228466878 to d116d80b83736fb332556760dc7e5a72

ERROR: libdigest-hmac-perl different signature for task do_configure.sigdat=
a between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD=
', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPE', 'LIC_FILES_CH=
KSUM', 'LINKER_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY',=
 'OBJDUMP', 'P', 'PACKAGECONFIG', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOS=
TLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_=
DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PA=
TH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOG=
FILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE=
_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR'=
, 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LI=
BDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TA=
RGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGE=
T_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', =
'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPT=
IONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_C=
ONFIGURE_WHITELIST', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_dep_pre=
pend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suff=
ix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', '=
datadir', 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix'=
, 'get_perl_version', 'includedir', 'includedir_native', 'infodir', 'is_tar=
get', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', '=
nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_=
license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'p=
refix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'ss=
tate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars=
', 'sysconfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_=
unitdir', 'systemd_user_unitdir']
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
basehash changed from f75ef1e29ac03f43716b6298a9025e3c to d5e7d8f402af3bed9=
5faf0c91c40391d
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
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgc=
c-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'libdigestlibdigest-hmac-perl_1.03.bb.do_patch', 'perlperl-native_5.2=
2.0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to [=
'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_popula=
te_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libdigestlibdigest-=
hmac-perl_1.03.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot=
', 'perlperl_5.22.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_5.2.bb.do_populate_sysroot with hash 6496d4375c62146d7c0063af4b3=
86d52
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_5.2.bb.do_populate_sysroot with hash 6122fc8ab74fb7855854a458f17=
af6cc
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_5.2.bb.do_populate_sysroot with hash 30baea95a6cd93b85bb73af98=
5ade681
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_5.2.bb.do_populate_sysroot with hash 79873f0dca561218ce1a8f4a6=
bda63f2
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 467aec2bee3aea4b15e1de8b0c34cc13
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash b58254263eec016f62b8245d94983aca
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 518c240274a630b9760a9a422846=
6878
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash d116d80b83736fb332556760dc7e=
5a72
Hash for dependent task gccgcc-runtime_5.2.bb.do_populate_sysroot changed f=
rom 30baea95a6cd93b85bb73af985ade681 to 79873f0dca561218ce1a8f4a6bda63f2
Hash for dependent task gccgcc-cross_5.2.bb.do_populate_sysroot changed fro=
m 6496d4375c62146d7c0063af4b386d52 to 6122fc8ab74fb7855854a458f17af6cc
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 467aec2bee3aea4b15e1de8b0c34cc13 to b58254263eec016f62b8245d94983aca
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from=
 518c240274a630b9760a9a4228466878 to d116d80b83736fb332556760dc7e5a72

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
nfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir',=
 'systemd_user_unitdir']
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
C_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICE 'PN', 'PR', 'PSEUDO_DISABLE=
D', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'SPECIAL_PK=
GSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSION', 'STAGING_BASE_LIBDIR_NATIVE', =
'STAGING_DATADIR', 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NAT=
IVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_NATIVE', 'STRINGS', 'STRIP', 'T', '=
TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TARGET_=
CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARGET_L=
INK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR=
', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUNE_LD=
ARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_dep_prepend', 'b=
ase_libdir', 'base_libdir_native', 'base_prefix', 'base_prune_suffix', 'bas=
e_sbindir', 'baselib', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir',=
 'do_configure[umask]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_pe=
rl_version', 'includedir', 'includedir_native', 'infodir', 'is_target', 'li=
bdir', 'libdir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_b=
ase_libdir', 'nonarch_libdir', 'oldincludedir', 'package_qa_check_license',=
 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'prefix_nat=
ive', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clea=
n', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysco=
nfdir', 'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir',=
 'systemd_user_unitdir']
basehash changed from 420659583378ef3654158cacfe50aa76 to be004e4778dc3647c=
9c1782a5856701b
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
runtaskdeps changed from ['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgc=
c-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysr=
oot', 'libiolibio-socket-ssl-perl_1.997.bb.do_patch', 'perlperl-native_5.22=
=2E0.bb.do_populate_sysroot', 'perlperl_5.22.0.bb.do_populate_sysroot'] to =
['gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runtime_5.2.bb.do_popul=
ate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', 'libiolibio-socket-=
ssl-perl_1.997.bb.do_patch', 'perlperl-native_5.22.0.bb.do_populate_sysroot=
', 'perlperl_5.22.0.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_5.2.bb.do_populate_sysroot with hash 6496d4375c62146d7c0063af4b3=
86d52
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-cross_5.2.bb.do_populate_sysrooh hash 30baea95a6cd93b85bb73af985ade681
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/gcc=
/gcc-runtime_5.2.bb.do_populate_sysroot with hash 79873f0dca561218ce1a8f4a6=
bda63f2
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 467aec2bee3aea4b15e1de8b0c34cc13
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash b58254263eec016f62b8245d94983aca
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash 518c240274a630b9760a9a422846=
6878
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_populate_sysroot with hash d116d80b83736fb332556760dc7e=
5a72
Hash for dependent task gccgcc-runtime_5.2.bb.do_populate_sysroot changed f=
rom 30baea95a6cd93b85bb73af985ade681 to 79873f0dca561218ce1a8f4a6bda63f2
Hash for dependent task gccgcc-cross_5.2.bb.do_populate_sysroot changed fro=
m 6496d4375c62146d7c0063af4b386d52 to 6122fc8ab74fb7855854a458f17af6cc
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 467aec2bee3aea4b15e1de8b0c34cc13 to b58254263eec016f62b8245d94983aca
Hash for dependent task perlperl_5.22.0.bb.do_populate_sysroot changed from=
 518c240274a630b9760a9a4228466878 to d116d80b83736fb332556760dc7e5a72

ERROR: luna-sysmgr-ipc-messages different signature for task do_configure.s=
igdata between qemux86copy and qemuarm
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'cmake-modules-webos-nativecmake-modules-webos-native.bb.do_populate_sysr=
oot', 'cmakecmake-native_3.3.1.bb.do_populate_sysroot', 'gnu-configgnu-conf=
ig_git.bb.do_populate_sysroot:virtual:native', 'libtoollibtool-native_2.4.6=
=2Ebb.do_populate_sysroot', 'luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messag=
es.bb.do_generate_toolchain_file', 'luna-sysmgr-ipc-messagesluna-sysmgr-ipc=
-messages.bb.do_patch', 'luna-sysmgr-ipcluna-sysmgr-ipc.bb.do_populate_sysr=
oot', 'luna-webkit-apiluna-webkit-api.bb.do_populate_sysroot'] to ['autocon=
fautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.=
15.bb.do_populate_sysroot:virtual:native', 'cmake-modules-webos-nativecmake=
-modules-webos-native.bb.do_populate_sysroot', 'cmakecmake-native_3.3.1.bb.=
do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virt=
ual:native', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'luna-sy=
smgr-ipc-messagesluna-sysmgr-ipc-messages.bb.do_generate_toolchain_file', '=
luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb.do_patch', 'luna-sysmgr=
-ipcluna-sysmgr-ipc.bb.do_populate_sysroot', 'luna-webkit-apiluna-webkit-ap=
i.bb.do_populate_sysroot']
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc/luna-sysmgr-ipc.bb.do_populate_sysroot with hash cc3eba3201=
ec35b42766c06ca2bc7afe
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc/luna-sysmgr-ipc.bb.do_populate_sysroot with hash f228ab5624=
346d79f348b5ada8e493c4
Hash for dependent task luna-sysmgr-ipcluna-sysmgr-ipc.bb.do_populate_sysro=
ot changed from cc3eba3201ec35b42766c06ca2bc7afe to f228ab5624346d79f348b5a=
da8e493c4

INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
INFO: ninja-native task do_configure.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: xommonxserver-common_1.34.bb.do_patch'] to ['glibcglibc_2.22.bb.do_p=
opulate_sysroot', 'intltoolintltool_0.51.0.bb.do_populate_sysroot:virtual:n=
ative', 'xserver-commonxserver-common_1.34.bb.do_patch']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash 467aec2bee3aea4b15e1de8b0c34cc13
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-core/glibc/g=
libc_2.22.bb.do_populate_sysroot with hash b58254263eec016f62b8245d94983aca
Hash for dependent task glibcglibc_2.22.bb.do_populate_sysroot changed from=
 467aec2bee3aea4b15e1de8b0c34cc13 to b58254263eec016f62b8245d94983aca

ERROR: 5 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1444845868/signatures.qemuarm.do_configure.sigdata.log


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
ibdir_native', 'base_prefienerate_sstatefn', 'get_perl_version', 'includedi=
r', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_native',=
 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'nonarch_l=
ibdir', 'oldincludedir', 'package_qa_check_staged', 'package_qa_handle_erro=
r', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servic=
edir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manife=
st', 'sstate_init', 'sstate_install', 'sstate_package', 'sstate_state_fromv=
ars', 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot=
_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libd=
ir', 'sysroot_strip', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd=
_user_unitdir', 'to']
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
o_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[umask]', 'do_qa=
_staging', 'docdir', 'exec_prefix', 'generate_sstatefn', 'get_perl_version'=
, 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'lib=
dir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir'=
, 'nonarch_libdir', 'oldincludedir', 'package_qa_check_staged', 'package_qa=
_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbind=
ir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_=
clean_manifest', 'sstate_init', 'sstate_install', 'sstate_package', 'sstate=
_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdi=
r', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stag}
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
runtaskdeps changed from ['libauthenlibauthen-sasl-perl_2.16.bb.do_install'=
] to ['libauthenlibauthen-sasl-perl_2.16.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_install with hash 8a8e558acb2fea25ad=
8aa476c6773158
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_install with hash 71f6c7fab51360375a=
17d4f6d1c0f24e
Hash for dependent task libauthenlibauthen-sasl-perl_2.16.bb.do_install cha=
nged from 8a8e558acb2fea25ad8aa476c6773158 to 71f6c7fab51360375a17d4f6d1c0f=
24e

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
ENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS',edir=
', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oldincludedir', 'pac=
kage_qa_check_staged', 'package_qa_handle_error', 'package_qa_write_error',=
 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sst=
ate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_i=
nstall', 'sstate_package', 'sstate_state_fromvars', 'sstate_task_postfunc',=
 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot_stage_d=
ir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'sysroot_strip', 'system=
d_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir', 'to']
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
o_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[umask]', 'do_qa=
_staging', 'docdir', 'exec_prefix', 'generate_sstatefn', 'get_perl_version'=
, 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'lib=
dir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir'=
, 'nonarch_libdir', 'oldincludedir', 'package_qa_check_staged', 'package_qa=
_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbind=
ir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_=
clean_manifest', 'sstate_init', 'sstate_install', 'sstate_package', 'sstate=
_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdi=
r', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs', 'sysroo=
t_stage_libdir', 'sysroot_strip', 'systemd_system_unitdir', 'systemd_unitdi=
r', 'systemd_user_unitdir', 'to']
basehash changed from 75 value changed from '${@bb.utils.contains("TUNE_FEA=
TURES", "m32", "${X86ARCH32}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES",=
 "mx32", "${X86ARCH64}", "" ,d)}${@bb.utils.contains("TUNE_FEATURES", "m64"=
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
bdigest/libdigest-hmac-perl_1.03.bb.do_install with hash ab209a270e8c26b677=
59b1281cc26bc7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_install with hash 795215894315225ceb=
51f54aebff95a7
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_install cha=
nged from ab209a270e8c26b67759b1281cc26bc7 to 795215894315225ceb51f54aebff9=
5a7

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
', 'bin', 'sstate_clean_manifest', 'sstate_init', 'sstate_install', 'sstate=
_package', 'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_task_pr=
efunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_st=
age_dirs', 'sysroot_stage_libdir', 'sysroot_strip', 'systemd_system_unitdir=
', 'systemd_unitdir', 'systemd_user_unitdir', 'to']
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
o_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[umask]', 'do_qa=
_staging', 'docdir', 'exec_prefix', 'generate_sstatefn', 'get_perl_version'=
, 'includedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'lib=
dir_native', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir'=
, 'nonarch_libdir', 'oldincludedir', 'package_qa_check_staged', 'package_qa=
_handle_error', 'package_qa_write_error', 'prefix', 'prefix_native', 'sbind=
ir', 'servicedir', 'sharedstatedir', 'sstate_add', 'sstate_clean', 'sstate_=
clean_manifest', 'sstate_init', 'sstate_install', 'sstate_package', 'sstate=
_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefunc', 'sysconfdi=
r', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysroot_stage_dirs', 'sysroo=
t_stage_libdir', 'sysroot_strip', 'systemd_system_unitdir', 'systemd_unitdi=
r', 'systemd_user_unitdir', 'to']
basehash changed from 75863cc1a1633988c0fca405edb37440 to 1b091d5cfa20cfcde=
5ab67d7f0e01544
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was ,d)}
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
bio/libio-socket-ssl-perl_1.997.bb.do_install with hash 014fcb6be6cb1ed9314=
b6c865bec6c8f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_install with hash 5d742c5a9e5758fc415=
a74084bf8ee66
Hash for dependent task libiolibio-socket-ssl-perl_1.997.bb.do_install chan=
ged from 014fcb6be6cb1ed9314b6c865bec6c8f to 5d742c5a9e5758fc415a74084bf8ee=
66

ERROR: luna-sysmgr-ipc-messages different signature for task do_populate_sy=
sroot.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages=
=2Ebb.do_install'] to ['luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_install']
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_install with hash 8=
72b32c37111c9d8d78cc67435d73d60
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_install with hash 1=
0bf9e877a509aa07ab08bb33e7e8226
Hash for dependent task luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_install changed from 872b32c37111c9d8d78cc67435d73d60 to 10bf9e877a50=
9aa07ab08bb33e7e8226

INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: ninja-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
ERROR: xserver-common different signature for task do_populate_sysroot.sigd=
ata between qemux86copy and qemuarm
runtaskdeps changed from ['xserver-commonxserver-common_1.34.bb.do_install'=
] to ['xserver-commonxserver-common_1.34.bb.do_install']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_install with hash e795fdfc63476d59=
75bba9c088d3d341
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_install with hash 6993233cd62fef18=
419486168f121e02
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_install cha=
nged from e795fdfc63476d5975bba9c088d3d341 to 6993233cd62fef18419486168f121=
e02

ERROR: 5 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1444845868/signatures.qemuarm.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
ERROR: libauthen-sasl-perl different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
basehash changed from d0bfb3878a18a2b46bcf523bcc630871 to ce1889a655a815682=
4214c154edb93db
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libauthenlibauthen-sasl-perl_2.16.bb.do_package'=
, 'libaut:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_package with hash 2b994004259ff64376=
d6f4ad6664c536
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_package with hash 226c3480935e7a8115=
3765b3e932927d
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_packagedata with hash 18c117e7b21db1=
ea322856a3ce263054
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bauthen/libauthen-sasl-perl_2.16.bb.do_packagedata with hash f128628e8eefd7=
8ec451f963694d5349
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash e7fdd6b90869c3=
4976d065bb63197f5f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash e0bff550df79c0=
0e469046a2cdbb5c5c
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 0675accac30faeb57b8a2b79f88cf9e7
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 98244e5d3d191f3ce44248f6d132d272
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata=
 changed from e7fdd6b90869c34976d065bb63197f5f to e0bff550df79c00e469046a2c=
dbb5c5c
Hash for dependent task libauthenlibauthen-sasl-perl_2.16.bb.do_package cha=
nged from 2b994004259ff64376d6f4ad6664c536 to 226c3480935e7a81153765b3e9329=
27d
Hash for dependent task perlperl_5.22.0.bb.do_packagedata changed from 0675=
accac30faeb57b8a2b79f88cf9e7 to 98244e5d3d191f3ce44248f6d132d272
Hash for dependent task libauthenlibauthen-sasl-perl_2.16.bb.do_packagedata=
 changed from 18c117e7b21db1ea322856a3ce263054 to f128628e8eefd78ec451f9636=
94d5349

ERROR: libdigest-hmac-perl different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
basehash changed from 09c44fa709a7e9d0b60cff37ec323c91 to 0040b6f42d6644d4c=
ed67eb7017eb278
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libdigestlibdigest-hmac-perl_1.03.bb.do_package'=
, 'libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata', 'libdigestlibdiges=
t-sha1-perl_2.13.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_popula=
te_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopse=
udo_1.7.4.bb.do_populate_sysroot:virtual:native'] to ['libdigestlibdigest-h=
mac-perl_1.03.bb.do_package', 'libdigestlibdigest-hmac-perl_1.03.bb.do_pack=
agedata', 'libdigestlibdigest-sha1-perl_2.13.bb.do_packagedata', 'opkg-util=
sopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb=
=2Edo_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:nati=
ve']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_package with hash 9e504173688e489ea2=
41ea5cf0c90e10
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_package with hash feb6c83c68b3221700=
1e36a78804a7e1
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bdigest/libdigest-hmac-perl_1.03.bb.do_packagedata with hash e7fdd6b90869c3=
4976d065bb63197f5f
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perged to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 98244e5d3d191f3ce44248f6d132d272
Hash for dependent task libdigestlibdigest-sha1-perl_2.13.bb.do_packagedata=
 changed from a0554eb5cd2bc6ba77cda286185b7865 to 6676666dead4c0855b5173d0f=
30960fe
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_packagedata=
 changed from e7fdd6b90869c34976d065bb63197f5f to e0bff550df79c00e469046a2c=
dbb5c5c
Hash for dependent task libdigestlibdigest-hmac-perl_1.03.bb.do_package cha=
nged from 9e504173688e489ea241ea5cf0c90e10 to feb6c83c68b32217001e36a78804a=
7e1
Hash for dependent task perlperl_5.22.0.bb.do_packagedata changed from 0675=
accac30faeb57b8a2b79f88cf9e7 to 98244e5d3d191f3ce44248f6d132d272

ERROR: libio-socket-ssl-perl different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemuarm
basehash changed from dc84a23b559064107f78b45d3cb5991f to 57a9336dd9f0ad136=
daf9ba02b0498cb
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
runtaskdeps changed from ['libiolibio-socket-ssl-perl_1.997.bb.do_package',=
 'libiolibio-socket-ssl-perl_1.997.bb.do_packagedata', 'libnetlibnet-ssleay=
-perl_1.65.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sys=
root:virtual:native', 'perlperl_5.22.0.bb.do_packagedata', 'pseudopseudo_1.=
7.4.bb.do_populate_sysroot:virtual:native'] to ['libiolibio-socket-ssl-perl=
_1.997.bb.do_package', 'libiolibio-socket-ssl-perl_1.997.bb.do_packagedata'=
, 'libnetlibnet-ssleay-perl_1.65.bb.do_packagedata', 'opkg-utilsopkg-utils_=
git.bb.do_populate_sysroot:virtual:native', 'perlperl_5.22.0.bb.do_packaged=
ata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_package with hash 4ffebd12e23bb992712=
6c28a88e97289
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_package with hash 688f40975b16cc990c7=
e31b26041dbff
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_packagedata with hash 2ddb6078ffffebc=
24c0c6b76c2208b57
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bio/libio-socket-ssl-perl_1.997.bb.do_packagedata with hash d4bf0a33cbaca2a=
7746bfd7caa01d837
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bnet/libnet-ssleay-perl_1.65.bb.do_packagedata with hash d8abf648d86c354951=
ed3c74b05f6ba7
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-perl/recipes-perl/li=
bnet/libnet-ssleay-perl_1.65.bb.do_packagedata with hash 5c70b59ecac414436a=
d158fb5fe9f3d1
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 0675accac30faeb57b8a2b79f88cf9e7
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-devtools/per=
l/perl_5.22.0.bb.do_packagedata with hash 98244e5d3d191f3ce44248f6d132d272
Hash for dependent task libiolibio-socket-ssl-perl_1.997.bb.do_packagedata =
changed from 2ddb6078ffffebc24c0c6b76c2208b57 to d4bf0a33cbaca2a7746bfd7caa=
01d837
Hash for dependent task libnetlibnet-ssleay-perl_1.65.bb.do_packagedata cha=
nged from d8abf648d86c354951ed3c74b05f6ba7 to 5c70b59ecac414436ad158fb5fe9f=
3d1
Hash for dependent task libiolibio-socket-ssl-perl_1.997.bb.do_package chan=
ged from 4ffebd12e23bb9927126c28a88e97289 to 688f40975b16cc990c7e31b26kg-ut=
ilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7=
=2E4.bb.do_populate_sysroot:virtual:native'] to ['luna-sysmgr-ipc-messagesl=
una-sysmgr-ipc-messages.bb.do_package', 'luna-sysmgr-ipc-messagesluna-sysmg=
r-ipc-messages.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate=
_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtua=
l:native']
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_package with hash b=
6dfc04367b1be3aaa68d5defadf3f2a
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_package with hash 4=
37cbe72683d214987bfa6e708c1fb36
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_packagedata with ha=
sh 5c1359f8b308a036e64a5431375084fc
 changed to
/home/jenkins/oe/world/shr-core/meta-webos-ports/meta-luneui/recipes-webos/=
luna-sysmgr-ipc-messages/luna-sysmgr-ipc-messages.bb.do_packagedata with ha=
sh c7a2b8b8103ba74c2f9914ade498c6d2
Hash for dependent task luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_package changed from b6dfc04367b1be3aaa68d5defadf3f2a to 437cbe72683d=
214987bfa6e708c1fb36
Hash for dependent task luna-sysmgr-ipc-messagesluna-sysmgr-ipc-messages.bb=
=2Edo_packagedata changed from 5c1359f8b308a036e64a5431375084fc to c7a2b8b8=
103ba74c2f9914ade498c6d2

ERROR: phpmyadmin different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
runtaskdeps changed from ['bashbash_4.3.30.bb.do_packagedata', 'opkg-utilso=
pkg-utils_git.bb.do_populate_sysroot:virtual:native', 'phpmyadminphpmyadmin=
_4.4.9.bb.do_package', 'phpmyadminphpmyadmin_4.4.9.bb.do_packagedata', 'pse=
udopseudo_1.7.4.bb.do_populate_sysroot:virtual:native'] to ['bashbash_4.3.3=
0.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virt=
ual:native', 'phpmyadminphpmyadmin_4.4.9.bb.do_package', 'phpmyadminphpmyad=
min_4.4.9.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:vi=
rtual:native']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/bas=
h/bash_4.3.30.bb.do_packagedata with hash c08b791d0f860a835a911f5a4c9a32d9
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-extended/bas=
h/bash_4.3.30.bb.do_packagedata with hash 91674ffdfc796e4ab503093d2c8379da
Hash for dependent task bashbash_4.3.30.bb.do_packagedata changed from c08b=
791d0f860a835a911f5a4c9a32d9 to 91674ffdfc796e4ab503093d2c8379da

ERROR: shr-theme-neo different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native'=
, 'themese-wm-theme-illume-neo_git.bb.do_packagedata', 'themeselementary-th=
eme-neo_git.bb.do_packagedata', 'themesgpe-theme-neo_git.bb.do_packagedata'=
, 'themesgtk-theme-neo_git.bb.do_packagedata', 'themesicon-theme-neo_git.bb=
=2Edo_packagedata', 'themesphoneui-shr-theme-neo_git.bb.do_packagedata', 't=
hemesshr-theme-neo.bb.do_package', 'themesshr-theme-neo.bb.do_packagedata']=
 to ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pse=
udopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'themese-wm-theme-i=
llume-neo_git.bb.do_packagedata', 'themeselementary-theme-neo_git.bb.do_pac=
kagedata', 'themesgpe-theme-neo_git.bb.do_packagedata', 'themesgtk-theme-ne=
o_git.bb.do_packagedata', 'themesicon-theme-neo_git.bb.doux86copy and qemua=
rm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'terminus-fontterminus-=
font_4.38.bb.do_package', 'terminus-fontterminus-font_4.38.bb.do_packagedat=
a'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-u=
tils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_=
populate_sysroot:virtual:native', 'terminus-fontterminus-font_4.38.bb.do_pa=
ckage', 'terminus-fontterminus-font_4.38.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-arphic-uming different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-arphic-um=
ing_20080216.bb.do_package', 'ttf-fontsttf-arphic-uming_20080216.bb.do_pack=
agedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utils=
opkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.=
bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-arphic-uming_20080216=
=2Ebb.do_package', 'ttf-fontsttf-arphic-uming_20080216.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-dejavu different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-dejavu_2.=
35.bb.do_package', 'ttf-fontsttf-dejavu_2.35.bb.do_packagedata'] to ['fontc=
onfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do=
_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysro=
ot:virtual:native', 'ttf-fontsttf-dejavu_2.35.bb.do_package', 'ttf-fontsttf=
-dejavu_2.35.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-droid different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
runtaskdeps chan:native', 'ttf-fontsttf-droid_git.bb.do_package', 'ttf-font=
sttf-droid_git.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-gentium different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-gentium_1=
=2E02.bb.do_package', 'ttf-fontsttf-gentium_1.02.bb.do_packagedata'] to ['f=
ontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.b=
b.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_s=
ysroot:virtual:native', 'ttf-fontsttf-gentium_1.02.bb.do_package', 'ttf-fon=
tsttf-gentium_1.02.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-hunkyfonts different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-hunkyfont=
s_0.3.0.bb.do_package', 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_packagedata'] =
to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils=
_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_popu=
late_sysroot:virtual:native', 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_package'=
, 'ttf-fontsttf-hunkyfonts_0.3.0.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-inconsolata different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-inconsola=
ta_20100526.bb.do_package', 'ttf-fontsttf-inconsolata_20100526.bb.do_packag=
edata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsop=
kg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb=
=2Edo_populate_sysroot:virtual:native', 'ttf-fontsttf-inconsolata_20100526.=
bb.do_package', 'ure for task do_package_write_ipk.sigdata between qemux86c=
opy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-liberatio=
n_0.2.bb.do_package', 'ttf-fontsttf-liberation_0.2.bb.do_packagedata'] to [=
'fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git=
=2Ebb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_popula=
te_sysroot:virtual:native', 'ttf-fontsttf-liberation_0.2.bb.do_package', 't=
tf-fontsttf-liberation_0.2.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-mplus different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-mplus_027=
=2Ebb.do_package', 'ttf-fontsttf-mplus_027.bb.do_packagedata'] to ['fontcon=
figfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_p=
opulate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot=
:virtual:native', 'ttf-fontsttf-mplus_027.bb.do_package', 'ttf-fontsttf-mpl=
us_027.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-sazanami different signature for task do_package_write_ipk.sigda=
ta between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-sazanami_=
20040629.bb.do_package', 'ttf-fontsttf-sazanami_20040629.bb.do_packagedata'=
] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-uti=
ls_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_po=
pulate_sysroot:virtual:native', 'ttf-fontsttf-sazanami_20040629.bb.do_packa=
ge', 'ttf-fontsttf-sazanami_20040629.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-tlwg different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemuarm
runtaskdepenembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.11.=
94.bb.do_packagedata with hash 736c4f55866f0d3dc2df677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-ubuntu-font-family different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-ubuntu-fo=
nt-family_0.80.bb.do_package', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_=
packagedata'] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-u=
tilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.=
7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-ubuntu-font-famil=
y_0.80.bb.do_package', 'ttf-fontsttf-ubuntu-font-family_0.80.bb.do_packaged=
ata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: ttf-wqy-zenhei different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
runtaskdeps changed from ['fontconfigfontconfig_2.11.94.bb.do_packagedata',=
 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudop=
seudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'ttf-fontsttf-wqy-zenhe=
i_0.9.45.bb.do_package', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_packagedata'=
] to ['fontconfigfontconfig_2.11.94.bb.do_packagedata', 'opkg-utilsopkg-uti=
ls_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_po=
pulate_sysroot:virtual:native', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_packa=
ge', 'ttf-fontsttf-wqy-zenhei_0.9.45.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 736c4f55866f0d3dc2df=
677413ac50d8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/fon=
tconfig/fontconfig_2.11.94.bb.do_packagedata with hash 44d2223000ef1b272de2=
0bb6212e20e2
Hash for dependent task fontconfigfontconfig_2.11.94.bb.do_packagedata chan=
ged from 736c4f55866f0d3dc2df677413ac50d8 to 44d2223000ef1b272de20bb6212e20=
e2

ERROR: xserver-common different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
runtaskdeps changed from ['fbsetfbset_2.1.bb.do_packagedata', 'opkg-utilsop=
kg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb=
=2Edo_populate_sysroot:virtual:native', 'xinput-calibratorxinput-calibrator=
_git.bb.do_packagedata', 'xorg-appxdpyinfo_1.3.2.bb.do_packagedata', 'xorg-=
appxmodmap_1.0.9.bb.do_packagedata', 'xorg-appxrandr_1.4.3.bb.do_packagedat=
a', 'xserver-commonxserver-common_1.34.bb.do_package', 'xserver-commonxserv=
er-common_1.34.bb.do_packagedata'] to ['fbsetfbset_2.1.bb.do_packagedata', =
'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudops=
eudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'xinput-calibratorxinput=
-calibrator_git.bb.do_packagedata', 'xorg-appxdpyinfo_1.3.2.bb.do_packageda=
ta', 'xorg-appxmodmap_1.0.9.bb.do_packagedata', 'xorg-appxrandr_1.4.3.bb.do=
_packagedata', 'xserver-commonxserver-common_1.34.bb.do_package', 'xserver-=
commonxserver-common_1.34.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/f=
bset/fbset_2.1.bb.do_packagedata with hash ce7c4dca0cda8d720fd74d2bd1d66fbb
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/f=
bset/fbset_2.1.bb.do_packagedata with hash a232e1b9ce0275f2a989d74cc7053a84
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xin=
put-calibrator/xinput-calibrator_git.bb.do_packagedata with hash d688277915=
e6c9d7e41a00d941dfc590
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xin=
put-calibrator/xinput-calibrator_git.bb.do_packagedata with hash 9d440e2518=
80adaaa743aecabc86ae36
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xdpyinfo_1.3.2.bb.do_packagedata with hash 8122f0ff1b1e47cca2ddb16207=
5e7f44
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xdpyinfo_1.3.2.bb.do_packagedata with hash 4d9acf7ce5cfa462d66b04b2bf=
14b851
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xmodmap_1.0.9.bb.do_packagedata with hash 9d3e895ec99bf9e9204aa619238=
e4cc8
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xmodmap_1.0.9.bb.do_packagedata with hash f4a63b5a780ad1eee027ec5c41d=
1698b
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xrandr_1.4.3.bb.do_packagedata with hash ee29483d3bbb3d83e14898c2316c=
81ab
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xrandr_1.4.3.bb.do_packagedata with hash 0c39e999928942dfd8a7f4b8e674=
46d7
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_package with hash 1657fdd755ae7b98=
394b34c5e29e0f6c
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_package with hash df6f3388166d8338=
98c5f24024d71703
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_packagedata with hash 2794fb1e9e3f=
8dd7ce2437d5396f6d49
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_packagedata with hash 007535177f70=
ddf4efae8d117226490e
Hash for dependent task xorg-appxrandr_1.4.3.bb.do_packagedata changed from=
 ee29483d3bbb3d83e14898c2316c81ab to 0c39e999928942dfd8a7f4b8e67446d7
Hash for dependent task xinput-calibratorxinput-calibrator_git.bb.do_packag=
edata changed from d688277915e6c9d7e41a00d941dfc590 to 9d440e251880adaaa743=
aecabc86ae36
Hash for dependent task fbsetfbset_2.1.bb.do_packagedata changed from ce7c4=
dca0cda8d720fd74d2bd1d66fbb to a232e1b9ce0275f2a989d74cc7053a84
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_package cha=
nged from 1657fdd755ae7b98394b34c5e29e0f6c to df6f3388166d833898c5f24024d71=
703
Hash for dependent task xorg-appxmodmap_1.0.9.bb.do_packagedata changed fro=
m 9d3e895ec99bf9e9204aa619238e4cc8 to f4a63b5a780ad1eee027ec5c41d1698b
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_packagedata=
 changed from 2794fb1e9e3f8dd7ce2437d5396f6d49 to 007535177f70ddf4efae8d117=
226490e
Hash for dependent task xorg-appxdpyinfo_1.3.2.bb.do_packagedata changed fr=
om 8122f0ff1b1e47cca2ddb162075e7f44 to 4d9acf7ce5cfa462d66b04b2bf14b851

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
runtaskdeps changed from ['opkg-utilsopkg-utils_git.bb.do_populate_sysroot:=
virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native'=
, 'xorg-appxinit_1.3.4.bb.do_packagedata', 'xserver-commonxserver-common_1.=
34.bb.do_packagedata', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_packag=
e', 'xserver-nodm-initxserver-nodm-init_2.0.bb.do_packagedata'] to ['opkg-u=
tilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.=
7.4.bb.do_populate_sysroot:virtual:native', 'xorg-appxinit_1.3.4.bb.do_pack=
agedata', 'xserver-commonxserver-common_1.34.bb.do_packagedata', 'xserver-n=
odm-initxserver-nodm-init_2.0.bb.do_package', 'xserver-nodm-initxserver-nod=
m-init_2.0.bb.do_packagedata']
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xinit_1.3.4.bb.do_packagedata with hash 6963e42ac1053b62ce4a6570a74e2=
7bf
 changed to
/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-graphics/xor=
g-app/xinit_1.3.4.bb.do_packagedata with hash eb81dc4aa06e4a2f1fb3e76bac3d4=
d88
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_packagedata with hash 2794fb1e9e3f=
8dd7ce2437d5396f6d49
 changed to
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-graphics/=
xserver-common/xserver-common_1.34.bb.do_packagedata with hash 007535177f70=
ddf4efae8d117226490e
Hash for dependent task xorg-appxinit_1.3.4.bb.do_packagedata changed from =
6963e42ac1053b62ce4a6570a74e27bf to eb81dc4aa06e4a2f1fb3e76bac3d4d88
Hash for dependent task xserver-commonxserver-common_1.34.bb.do_packagedata=
 changed from 2794fb1e9e3f8dd7ce2437d5396f6d49 to 007535177f70ddf4efae8d117=
226490e

ERROR: 21 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1444845868/signatures.qemuarm.do_package_write_ipk.sigdata.log

--i3lJ51RuaGWuFYNw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeo4cACgkQN1Ujt2V2gBxCWwCfZuiseAtDboPLXhPSaeDx1pDo
ohIAoLvZxfYZQHuWkokUxZM1Tc76GSnj
=LfXR
-----END PGP SIGNATURE-----

--i3lJ51RuaGWuFYNw--
