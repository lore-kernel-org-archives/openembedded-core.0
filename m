Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE1C65E94;
	Sat, 18 Oct 2014 09:21:06 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so3722321wid.4
	for <multiple recipients>; Sat, 18 Oct 2014 02:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=OsCgBUHI7mYNWFwl+4Eg9yRcmIM/DFxoI81GhR+0bmw=;
	b=JqX0UYWJULQdCYnQQzj1zGjlDLDAgnXOBoSLR6B9gYneZksc9LYKLail5jD0wk/m4a
	aKvTmiCuBCscgVKPzcLQUMemEULRP/8PI6TJb+ZWQuu0LbagAJiDpRwkOyjMiQTJ2+Bq
	cTLSPhR4Cm9EYLx+TVuNtCfHYZH2Xq7nHQsoJNLZid/5hlXSpLNfKETB5m1sJxoNYG7Q
	nENOhbK9gNw9ozhbITjo8NVXVr4bwYt+LFk8733urZyqcyC/o7rIyU8GvhaFb5M5bifX
	fC2FL0Gnhd4I1tYV7BWbgfjwSCKMBl8kEg2uEEcByfSnF875X0x+Yb76+Kl3dDMTBGCv
	y8fA==
X-Received: by 10.180.10.231 with SMTP id l7mr4820148wib.1.1413624067269;
	Sat, 18 Oct 2014 02:21:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u8sm4602486wjq.1.2014.10.18.02.21.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Oct 2014 02:21:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 18 Oct 2014 11:21:06 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141018092106.GE2437@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, wrong PACKAGE_ARCHs 2014-10-18
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
X-List-Received-Date: Sat, 18 Oct 2014 09:21:13 -0000
X-Groupsio-MsgNum: 58707
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline

--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is again including my pending fixes, reality with current
oe-core/master or poky is worse.

ERROR: 57 issues were found in these recipes: android-tools dracut
font-alias initscripts ipsec-tools libauthen-sasl-perl
libdigest-hmac-perl libio-socket-ssl-perl lmsensors oprofile oprofileui
oprofileui-server phpmyadmin polkit-group-rule-datetime
polkit-group-rule-network shr-theme-neo terminus-font tipcutils
ttf-arphic-uming ttf-dejavu ttf-droid ttf-gentium ttf-hunkyfonts
ttf-inconsolata ttf-liberation ttf-mplus ttf-sazanami
ttf-ubuntu-font-family ttf-wqy-zenhei vpnc xfce4-session xl2tpd
xserver-common xserver-nodm-init

 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemux86 =3D=3D=3D
ERROR: ipsec-tools different signature for task do_configure.sigdata betwee=
n qemux86copy and qemux86
Hash for dependent task linux-yocto_3.17.bb.do_populate_sysroot changed fro=
m 7d344dcf3a91ee4783e14064db6a6215 to 12a74a082499856e9aa0e452ef44cb6d

ERROR: oprofile different signature for task do_configure.sigdata between q=
emux86copy and qemux86
Hash for dependent task linux-yocto_3.17.bb.do_populate_sysroot changed fro=
m 7d344dcf3a91ee4783e14064db6a6215 to 12a74a082499856e9aa0e452ef44cb6d

ERROR: tipcutils different signature for task do_configure.sigdata between =
qemux86copy and qemux86
Hash for dependent task linux-yocto_3.17.bb.do_populate_sysroot changed fro=
m 7d344dcf3a91ee4783e14064db6a6215 to 12a74a082499856e9aa0e452ef44cb6d

ERROR: xl2tpd different signature for task do_configure.sigdata between qem=
ux86copy and qemux86
Hash for dependent task linux-yocto_3.17.bb.do_populate_sysroot changed fro=
m 7d344dcf3a91ee4783e14064db6a6215 to 12a74a082499856e9aa0e452ef44cb6d

ERROR: 4 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1413620426/signatures.qemux86.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemux86 =3D=3D=3D
ERROR: initscripts different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_install changed from 35a853af=
6c15189b492feb3e574c7b6e to e92ee6ef1369438b9eb43b1fe175a28c

ERROR: ipsec-tools different signature for task do_populate_sysroot.sigdata=
 between qemux86copy and qemux86
Hash for dependent task ipsec-tools_0.8.2.bb.do_install changed from 4cd514=
12769fc93a1f8342439b0e3344 to fd1accf7c0ca51a251b91c5202f61bf4

ERROR: oprofile different signature for task do_populate_sysroot.sigdata be=
tween qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_install changed from 8c66c07c6=
4b884f8726606690f1609fd to 173a176c3268c024dce6996507fc02a1

ERROR: tipcutils different signature for task do_populate_sysroot.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task tipcutils_2.0.6.bb.do_install changed from 59126969=
c258384248a304f532886765 to 40e853ec4424742ca5cd6d23b3a1cb0b

ERROR: xl2tpd different signature for task do_populate_sysroot.sigdata betw=
een qemux86copy and qemux86
Hash for dependent task xl2tpd_git.bb.do_install changed from dc55e2926dcf0=
5cd894a2e9b62ecbd51 to 4ba43fad8c7a6fdec382e20475243219

ERROR: 5 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1413620426/signatures.qemux86.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86 =3D=3D=3D
ERROR: android-tools different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task android-tools-conf_1.0.bb.do_packagedata changed fr=
om b27b671e85321b47a8b11dddc9b68819 to 5f63849b931f1a20592036566bb6a482

ERROR: dracut different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
Hash for dependent task linux-yocto_3.17.bb.do_packagedata changed from 6c6=
504d16ec2f00b531d06bfb587433e to 2c1eb9d505eb32afcd7be32912fb2904

ERROR: initscripts different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
Hash for dependent task initscripts_1.0.bb.do_packagedata changed from 728b=
9256b16e68a7f6e44c0bf64d394d to de615c845b75bbb0e82b0806c4c1592f
Hash for dependent task initscripts_1.0.bb.do_package changed from fadec05c=
a9071530c29b7a616c2e4714 to b83decde8d0da1b5a4497ffca12ae14e

ERROR: ipsec-tools different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemux86
Hash for dependent task ipsec-tools_0.8.2.bb.do_package changed from f2fc85=
4638447c5c6a463d4ebea55d65 to 3322b8d9c842c7d91d5dc84c75fe4dbc
Hash for dependent task ipsec-tools_0.8.2.bb.do_packagedata changed from 00=
a77da7cf7a3c689ee13ea443ccfcad to eed45e09d04a76dea8458a39aff91632

ERROR: lmsensors different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task lmsensors-config_1.0.bb.do_packagedata changed from=
 0fe7d86e55d89f0d0b48396a5c45a4c7 to 448288357c1b842cd342df8de148b92c

ERROR: oprofile different signature for task do_package_write_ipk.sigdata b=
etween qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_package changed from a48987974=
0b7a99cee7e3b966b77f60b to 3064a11130c786bf5b500dd8d44c429e
Hash for dependent task linux-yocto_3.17.bb.do_packagedata changed from 6c6=
504d16ec2f00b531d06bfb587433e to 2c1eb9d505eb32afcd7be32912fb2904
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from f501b=
2da287e7dccb58d210ef322006e to 694a80bc530b479faf474e976fb76d51

ERROR: oprofileui different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from f501b=
2da287e7dccb58d210ef322006e to 694a80bc530b479faf474e976fb76d51

ERROR: oprofileui-server different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemux86
Hash for dependent task oprofile_0.9.9.bb.do_packagedata changed from f501b=
2da287e7dccb58d210ef322006e to 694a80bc530b479faf474e976fb76d51

ERROR: tipcutils different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemux86
Hash for dependent task tipcutils_2.0.6.bb.do_package changed from 4193c305=
4917ef5e2c140c601e3d797f to a3958a07389b12ae813315aebdb9c598
Hash for dependent task tipcutils_2.0.6.bb.do_packagedata changed from 597d=
b44a9f280222f9424f199a42a64d to fb32c9754a309214d3096828a03e5252

ERROR: vpnc different signature for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemux86
Hash for dependent task linux-yocto_3.17.bb.do_packagedata changed from 6c6=
504d16ec2f00b531d06bfb587433e to 2c1eb9d505eb32afcd7be32912fb2904

ERROR: xfce4-session different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemux86
Hash for dependent task xfce4-session_4.10.1.bb.do_packagedata changed from=
 18126579040985c998b41d140f1b4772 to 6ce19a3f0b1f526f1208a24d8c6d456a
Hash for dependent task xfce4-session_4.10.1.bb.do_package changed from 0ea=
8699fbc4717b94ad1a94d8d3ade2a to ae965a470ce240ee44ac576def4d9c3f

ERROR: xl2tpd different signature for task do_package_write_ipk.sigdata bet=
ween qemux86copy and qemux86
Hash for dependent task xl2tpd_git.bb.do_package changed from faf809512fbec=
b56545ceff4adeace94 to ae7862184210a715617fc579b141150f
Hash for dependent task xl2tpd_git.bb.do_packagedata changed from 76f578438=
0f162e38fea6a8d0ce8673f to 707518682e10fdffcaf439bb0f79cf95

ERROR: 12 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-=
diff/1413620426/signatures.qemux86.do_package_write_ipk.sigdata.log


 =3D=3D=3D Comparing signatures for task do_configure.sigdata between qemux=
86copy and qemuarm =3D=3D=3D
INFO: grub-efi-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: libauthen-sasl-perl different signature for task do_configure.sigdat=
a between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC=
', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFL=
AGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS=
', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PR=
EFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'C=
CLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG=
_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF'=
, 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH'=
, 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HO=
ST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FIL=
ES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', =
'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISAB=
LE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROO=
T_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', '=
SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSI=
ON', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGI=
NG_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_=
NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_AR=
CH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS=
', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
, 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_AS=
ARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARC=
H32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_=
libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baseli=
b', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umas=
k]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'inclu=
dedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_nati=
ve', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'oldin=
cludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_=
qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'share=
dstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_=
init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'syste=
md_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC=
', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFL=
AGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS=
', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PR=
EFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'C=
CLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG=
_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF'=
, 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH'=
, 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HO=
ST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FIL=
ES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', =
'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISAB=
LE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROO=
T_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', '=
SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSI=
ON', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGI=
NG_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_=
NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_AR=
CH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS=
', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
, 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_AS=
ARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_b=
indir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_pref=
ix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', '=
cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'd=
ocdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native=
', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'locals=
tatedir', 'mandir', 'nonarch_base_libdir', 'oldincludedir', 'package_qa_che=
ck_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix',=
 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', =
'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromv=
ars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_unitdir']
basehash changed from 33edaa45622556ad3c40b05574b5c099 to 8388c1560b5f8e6e4=
d51176e09c78bde
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -marm -mthumb-interwork'
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
Hash for dependent task gcc-cross_4.9.bb.do_populate_sysroot changed from a=
58bebf5cc08d255adf02c4117db4d39 to 2c54a852ae9db4601d0cbcdd88d3035c
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from 2d9=
a2926959c8eff47eb790716009e5c to c29990d1a8cf99ec7154f9964275eb24
Hash for dependent task glibc_2.20.bb.do_populate_sysroot changed from 33aa=
8718e176bee8a162a0df01e4aac5 to 89de3b21f332395cab7ffbd09478d63d
Hash for dependent task gcc-runtime_4.9.bb.do_populate_sysroot changed from=
 1dfab46dee0bb88f4890fc0300debdf4 to 786ceef14496921bfaa668db246aa130

ERROR: libdigest-hmac-perl different signature for task do_configure.sigdat=
a between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC=
', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFL=
AGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS=
', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PR=
EFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'C=
CLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG=
_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF'=
, 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH'=
, 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HO=
ST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FIL=
ES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', =
'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISAB=
LE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROO=
T_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', '=
SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSI=
ON', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGI=
NG_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_=
NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_AR=
CH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS=
', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
, 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_AS=
ARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARC=
H32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_=
libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baseli=
b', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umas=
k]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'inclu=
dedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_nati=
ve', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'oldin=
cludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_=
qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'share=
dstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_=
init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'syste=
md_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC=
', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFL=
AGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS=
', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PR=
EFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'C=
CLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG=
_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF'=
, 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH'=
, 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HO=
ST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FIL=
ES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', =
'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISAB=
LE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROO=
T_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', '=
SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSI=
ON', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGI=
NG_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_=
NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_AR=
CH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS=
', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
, 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_AS=
ARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_b=
indir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_pref=
ix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', '=
cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'd=
ocdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native=
', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'locals=
tatedir', 'mandir', 'nonarch_base_libdir', 'oldincludedir', 'package_qa_che=
ck_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix',=
 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', =
'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromv=
ars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_unitdir']
basehash changed from fa6e1281b16ea3f2490298fedfec1f76 to 2bc0edc92802a4c2c=
a8f01bee1928c7b
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -marm -mthumb-interwork'
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
Hash for dependent task gcc-cross_4.9.bb.do_populate_sysroot changed from a=
58bebf5cc08d255adf02c4117db4d39 to 2c54a852ae9db4601d0cbcdd88d3035c
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from 2d9=
a2926959c8eff47eb790716009e5c to c29990d1a8cf99ec7154f9964275eb24
Hash for dependent task glibc_2.20.bb.do_populate_sysroot changed from 33aa=
8718e176bee8a162a0df01e4aac5 to 89de3b21f332395cab7ffbd09478d63d
Hash for dependent task gcc-runtime_4.9.bb.do_populate_sysroot changed from=
 1dfab46dee0bb88f4890fc0300debdf4 to 786ceef14496921bfaa668db246aa130

ERROR: libio-socket-ssl-perl different signature for task do_configure.sigd=
ata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC=
', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFL=
AGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS=
', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PR=
EFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'C=
CLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG=
_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF'=
, 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH'=
, 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HO=
ST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FIL=
ES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', =
'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISAB=
LE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROO=
T_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', '=
SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSI=
ON', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGI=
NG_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_=
NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_AR=
CH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS=
', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
, 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_AS=
ARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'X86ARC=
H32', 'X86ARCH64', 'base_bindir', 'base_dep_prepend', 'base_libdir', 'base_=
libdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baseli=
b', 'bbfatal', 'bindir', 'cpan_do_configure', 'datadir', 'do_configure[umas=
k]', 'do_qa_configure', 'docdir', 'exec_prefix', 'get_perl_version', 'inclu=
dedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_nati=
ve', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'oldin=
cludedir', 'package_qa_check_license', 'package_qa_handle_error', 'package_=
qa_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'share=
dstatedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_=
init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate', 'syste=
md_unitdir']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'B', 'BASEDEPENDS', 'BB_CURRENTTAS=
K', 'BPN', 'BUILD_AR', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC=
', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFL=
AGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS=
', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PR=
EFIX', 'BUILD_RANLIB', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'C=
CLD', 'CFLAGS', 'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEBUG_BUILD', 'DEBUG=
_FLAGS', 'DEBUG_OPTIMIZATION', 'DEPENDS', 'EXTRA_CPANFLAGS', 'EXTRA_OECONF'=
, 'EXTRA_PERLFLAGS', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH'=
, 'HOST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HO=
ST_VENDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LICENSE', 'LIC_FIL=
ES_CHKSUM', 'LINKER_HASH_STYLE', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJD=
UMP', 'P', 'PATCH_GET', 'PERLCONFIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', =
'PERL_INC', 'PERL_LIB', 'PERL_OWN_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISAB=
LE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROO=
T_DIR', 'PN', 'PR', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'S', '=
SELECTED_OPTIMIZATION', 'SPECIAL_PKGSUFFIX', 'SSTATE_SWSPEC', 'SSTATE_VERSI=
ON', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STAGI=
NG_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDIR_=
NATIVE', 'STRINGS', 'STRIP', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_AR=
CH', 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS=
', 'TARGET_LD_ARCH', 'TARGET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX'=
, 'TARGET_SYS', 'TARGET_VENDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_AS=
ARGS', 'TUNE_CCARGS', 'TUNE_LDARGS', 'UNKNOWN_CONFIGURE_WHITELIST', 'base_b=
indir', 'base_dep_prepend', 'base_libdir', 'base_libdir_native', 'base_pref=
ix', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bbfatal', 'bindir', '=
cpan_do_configure', 'datadir', 'do_configure[umask]', 'do_qa_configure', 'd=
ocdir', 'exec_prefix', 'get_perl_version', 'includedir', 'includedir_native=
', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'locals=
tatedir', 'mandir', 'nonarch_base_libdir', 'oldincludedir', 'package_qa_che=
ck_license', 'package_qa_handle_error', 'package_qa_write_error', 'prefix',=
 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', =
'sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_state_fromv=
ars', 'sysconfdir', 'sysroot_cleansstate', 'systemd_unitdir']
basehash changed from 882c0d13c7a2717b78295e668147a7ac to 16e3a49cc4659cb1f=
29e5b250a18616a
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -marm -mthumb-interwork'
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
Hash for dependent task gcc-cross_4.9.bb.do_populate_sysroot changed from a=
58bebf5cc08d255adf02c4117db4d39 to 2c54a852ae9db4601d0cbcdd88d3035c
Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed from 2d9=
a2926959c8eff47eb790716009e5c to c29990d1a8cf99ec7154f9964275eb24
Hash for dependent task glibc_2.20.bb.do_populate_sysroot changed from 33aa=
8718e176bee8a162a0df01e4aac5 to 89de3b21f332395cab7ffbd09478d63d
Hash for dependent task gcc-runtime_4.9.bb.do_populate_sysroot changed from=
 1dfab46dee0bb88f4890fc0300debdf4 to 786ceef14496921bfaa668db246aa130

INFO: makedevs-native task do_configure.sigdata doesn't exist in qemuarm
INFO: opkg-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_configure=
=2Esigdata between qemux86copy and qemuarm
Hash for dependent task polkit_0.112.bb.do_populate_sysroot changed from a4=
3c89cda578229e7133cc1e4d32ceab to 07829f025b6e7be67368b923bac582f8

ERROR: polkit-group-rule-network different signature for task do_configure.=
sigdata between qemux86copy and qemuarm
Hash for dependent task polkit_0.112.bb.do_populate_sysroot changed from a4=
3c89cda578229e7133cc1e4d32ceab to 07829f025b6e7be67368b923bac582f8

ERROR: xserver-common different signature for task do_configure.sigdata bet=
ween qemux86copy and qemuarm
Hash for dependent task glibc_2.20.bb.do_populate_sysroot changed from 33aa=
8718e176bee8a162a0df01e4aac5 to 89de3b21f332395cab7ffbd09478d63d

ERROR: 6 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1413620426/signatures.qemuarm.do_configure.sigdata.log


 =3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betwee=
n qemux86copy and qemuarm =3D=3D=3D
INFO: grub-efi-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
ERROR: libauthen-sasl-perl different signature for task do_populate_sysroot=
=2Esigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BU=
ILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', '=
BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', =
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB=
', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP=
', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG=
_OPTIMIZATION', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VE=
NDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MA=
KE', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCON=
FIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OW=
N_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', =
'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', '=
SPECIAL_PKGSUFFIX', 'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPO=
STINSTFUNCS', 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE=
_PKGARCH', 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VER=
SION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STA=
GING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDI=
R_NATIVE', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS=
', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARG=
ET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VE=
NDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_libdir', 'base_li=
bdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib'=
, 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]', 'do_populat=
e_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]', 'do_qa_staging=
', 'docdir', 'exec_prefix', 'generate_sstatefn', 'get_perl_version', 'inclu=
dedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_nati=
ve', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'oldin=
cludedir', 'package_qa_check_staged', 'package_qa_handle_error', 'package_q=
a_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'shared=
statedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_i=
nit', 'sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_=
task_postfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', '=
sysroot_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'systemd_=
unitdir', 'to']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BU=
ILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', '=
BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', =
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB=
', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP=
', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG=
_OPTIMIZATION', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VE=
NDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MA=
KE', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCON=
FIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OW=
N_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', =
'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', '=
SPECIAL_PKGSUFFIX', 'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPO=
STINSTFUNCS', 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE=
_PKGARCH', 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VER=
SION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STA=
GING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDI=
R_NATIVE', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS=
', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARG=
ET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VE=
NDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_LDARGS', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefix=
', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'do=
_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[sstate-outputdir=
s]', 'do_populate_sysroot[umask]', 'do_qa_staging', 'docdir', 'exec_prefix'=
, 'generate_sstatefn', 'get_perl_version', 'includedir', 'includedir_native=
', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'locals=
tatedir', 'mandir', 'nonarch_base_libdir', 'oldincludedir', 'package_qa_che=
ck_staged', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', =
'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', '=
sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_install', 's=
state_package', 'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_ta=
sk_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysro=
ot_stage_dirs', 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
basehash changed from a6c4e58b216e7c7698a52066a93a49a8 to fb01742400f63a4e6=
f8e9fb1812f68f7
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -marm -mthumb-interwork'
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
Hash for dependent task libauthen-sasl-perl_2.16.bb.do_install changed from=
 2cb605817e6a5c074f44324156479c2a to c901c8b0d59060abb8eb15b78b9d78f4

ERROR: libdigest-hmac-perl different signature for task do_populate_sysroot=
=2Esigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BU=
ILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', '=
BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', =
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB=
', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP=
', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG=
_OPTIMIZATION', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VE=
NDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MA=
KE', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCON=
FIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OW=
N_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', =
'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', '=
SPECIAL_PKGSUFFIX', 'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPO=
STINSTFUNCS', 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE=
_PKGARCH', 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VER=
SION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STA=
GING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDI=
R_NATIVE', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS=
', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARG=
ET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VE=
NDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_libdir', 'base_li=
bdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib'=
, 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]', 'do_populat=
e_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]', 'do_qa_staging=
', 'docdir', 'exec_prefix', 'generate_sstatefn', 'get_perl_version', 'inclu=
dedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_nati=
ve', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'oldin=
cludedir', 'package_qa_check_staged', 'package_qa_handle_error', 'package_q=
a_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'shared=
statedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_i=
nit', 'sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_=
task_postfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', '=
sysroot_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'systemd_=
unitdir', 'to']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BU=
ILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', '=
BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', =
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB=
', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP=
', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG=
_OPTIMIZATION', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VE=
NDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MA=
KE', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCON=
FIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OW=
N_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', =
'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', '=
SPECIAL_PKGSUFFIX', 'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPO=
STINSTFUNCS', 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE=
_PKGARCH', 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VER=
SION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STA=
GING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDI=
R_NATIVE', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS=
', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARG=
ET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VE=
NDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_LDARGS', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefix=
', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'do=
_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[sstate-outputdir=
s]', 'do_populate_sysroot[umask]', 'do_qa_staging', 'docdir', 'exec_prefix'=
, 'generate_sstatefn', 'get_perl_version', 'includedir', 'includedir_native=
', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'locals=
tatedir', 'mandir', 'nonarch_base_libdir', 'oldincludedir', 'package_qa_che=
ck_staged', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', =
'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', '=
sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_install', 's=
state_package', 'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_ta=
sk_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysro=
ot_stage_dirs', 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
basehash changed from a6c4e58b216e7c7698a52066a93a49a8 to fb01742400f63a4e6=
f8e9fb1812f68f7
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -marm -mthumb-interwork'
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
Hash for dependent task libdigest-hmac-perl_1.03.bb.do_install changed from=
 75bf1f72de7d2e1ece49c64035b7b3b3 to d579290591a80a43b77af758a1dfec57

ERROR: libio-socket-ssl-perl different signature for task do_populate_sysro=
ot.sigdata between qemux86copy and qemuarm
Task dependencies changed from:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BU=
ILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', '=
BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', =
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB=
', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP=
', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG=
_OPTIMIZATION', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VE=
NDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MA=
KE', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCON=
FIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OW=
N_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', =
'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', '=
SPECIAL_PKGSUFFIX', 'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPO=
STINSTFUNCS', 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE=
_PKGARCH', 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VER=
SION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STA=
GING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDI=
R_NATIVE', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS=
', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARG=
ET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VE=
NDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_LDARGS', 'X86ARCH32', 'X86ARCH64', 'base_bindir', 'base_libdir', 'base_li=
bdir_native', 'base_prefix', 'base_prune_suffix', 'base_sbindir', 'baselib'=
, 'bindir', 'datadir', 'do_populate_sysroot[sstate-inputdirs]', 'do_populat=
e_sysroot[sstate-outputdirs]', 'do_populate_sysroot[umask]', 'do_qa_staging=
', 'docdir', 'exec_prefix', 'generate_sstatefn', 'get_perl_version', 'inclu=
dedir', 'includedir_native', 'infodir', 'is_target', 'libdir', 'libdir_nati=
ve', 'libexecdir', 'localstatedir', 'mandir', 'nonarch_base_libdir', 'oldin=
cludedir', 'package_qa_check_staged', 'package_qa_handle_error', 'package_q=
a_write_error', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'shared=
statedir', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_i=
nit', 'sstate_install', 'sstate_package', 'sstate_state_fromvars', 'sstate_=
task_postfunc', 'sstate_task_prefunc', 'sysconfdir', 'sysroot_stage_all', '=
sysroot_stage_dir', 'sysroot_stage_dirs', 'sysroot_stage_libdir', 'systemd_=
unitdir', 'to']
to:
['ABIEXTENSION', 'AR', 'AS', 'ASNEEDED', 'BB_CURRENTTASK', 'BPN', 'BUILD_AR=
', 'BUILD_ARCH', 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BU=
ILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', '=
BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', =
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB=
', 'BUILD_STRIP', 'BUILD_SYS', 'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CPP=
', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'D', 'DEBUG_BUILD', 'DEBUG_FLAGS', 'DEBUG=
_OPTIMIZATION', 'FC', 'FULL_OPTIMIZATION', 'HOST_ARCH', 'HOST_AS_ARCH', 'HO=
ST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VE=
NDOR', 'LC_ALL', 'LD', 'LDFLAGS', 'LIBCEXTENSION', 'LINKER_HASH_STYLE', 'MA=
KE', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGE_ARCH', 'PATCH_GET', 'PERLCON=
FIGTARGET', 'PERLHOSTLIB', 'PERL_ARCHLIB', 'PERL_INC', 'PERL_LIB', 'PERL_OW=
N_DIR', 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIB=
DIR', 'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PR', 'PROVIDES', =
'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE', 'RANLIB', 'SELECTED_OPTIMIZATION', '=
SPECIAL_PKGSUFFIX', 'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPO=
STINSTFUNCS', 'SSTATE_EXTRAPATH', 'SSTATE_MANIFESTS', 'SSTATE_PKG', 'SSTATE=
_PKGARCH', 'SSTATE_PKGNAME', 'SSTATE_PKGSPEC', 'SSTATE_SWSPEC', 'SSTATE_VER=
SION', 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DIR', 'STA=
GING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR', 'STAGING_LIBDI=
R_NATIVE', 'STRINGS', 'STRIP', 'SYSROOT_DESTDIR', 'SYSROOT_PREPROCESS_FUNCS=
', 'TARGET_ARCH', 'TARGET_AS_ARCH', 'TARGET_CC_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LD_ARCH', 'TARG=
ET_LINK_HASH_STYLE', 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VE=
NDOR', 'TOOLCHAIN_OPTIONS', 'TUNE_ARCH', 'TUNE_ASARGS', 'TUNE_CCARGS', 'TUN=
E_LDARGS', 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefix=
', 'base_prune_suffix', 'base_sbindir', 'baselib', 'bindir', 'datadir', 'do=
_populate_sysroot[sstate-inputdirs]', 'do_populate_sysroot[sstate-outputdir=
s]', 'do_populate_sysroot[umask]', 'do_qa_staging', 'docdir', 'exec_prefix'=
, 'generate_sstatefn', 'get_perl_version', 'includedir', 'includedir_native=
', 'infodir', 'is_target', 'libdir', 'libdir_native', 'libexecdir', 'locals=
tatedir', 'mandir', 'nonarch_base_libdir', 'oldincludedir', 'package_qa_che=
ck_staged', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', =
'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'sstate_add', '=
sstate_clean', 'sstate_clean_manifest', 'sstate_init', 'sstate_install', 's=
state_package', 'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_ta=
sk_prefunc', 'sysconfdir', 'sysroot_stage_all', 'sysroot_stage_dir', 'sysro=
ot_stage_dirs', 'sysroot_stage_libdir', 'systemd_unitdir', 'to']
basehash changed from a6c4e58b216e7c7698a52066a93a49a8 to fb01742400f63a4e6=
f8e9fb1812f68f7
List of dependencies for variable TUNE_ARCH changed from 'set(['X86ARCH32',=
 'X86ARCH64'])' to 'set([])'
Dependency on Variable X86ARCH32 was removed
Dependency on Variable X86ARCH64 was removed
Variable TUNE_LDARGS value changed from ' ${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "-m elf32_x86_64", "", d)}
TUNE_FEATURES{mx32} =3D Unset' to ''
Variable TUNE_CCARGS value changed from ' -m32 -march=3Di586' to ' -march=
=3Darmv5te -marm -mthumb-interwork'
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
Hash for dependent task libio-socket-ssl-perl_1.997.bb.do_install changed f=
rom 42d869749b7a51465dd249504353a245 to 7a16fa87c70ebcfd5699c6498abdd6c6

INFO: makedevs-native task do_populate_sysroot.sigdata doesn't exist in qem=
uarm
INFO: opkg-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
ERROR: polkit-group-rule-datetime different signature for task do_populate_=
sysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-datetime.bb.do_install changed fr=
om d88d058ff77ceedd86c53fab6765a5d8 to 027d4c64a245bbedac21a5646557e781

ERROR: polkit-group-rule-network different signature for task do_populate_s=
ysroot.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-network.bb.do_install changed fro=
m cd919006302f72ba04b0f3463531bb0e to 201ad58d5d1e33ebc298eab36e0c3970

ERROR: xserver-common different signature for task do_populate_sysroot.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_install changed from d6d6=
100c995c34606f9b98bb02e6d851 to 05123f8c229789992ce754d448dea64b

ERROR: 6 errors found in /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-d=
iff/1413620426/signatures.qemuarm.do_populate_sysroot.sigdata.log


 =3D=3D=3D Comparing signatures for task do_package_write_ipk.sigdata betwe=
en qemux86copy and qemuarm =3D=3D=3D
ERROR: font-alias different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task font-util_1.3.0.bb.do_packagedata changed from baa2=
6b7b8f28f44d9b77122efc475307 to 88a0b345e7e1895d619c5bb196d0be72

ERROR: libauthen-sasl-perl different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
basehash changed from 3ee320d1b8b30ed7605b9ec47ae40492 to 51589682ad1e28974=
48deae802c71e57
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
Hash for dependent task libdigest-hmac-perl_1.03.bb.do_packagedata changed =
=66rom 4922bbff39cb88b03937bb9b511012ae to b493fbc9926ea18275a643544acb0abd
Hash for dependent task perl_5.20.0.bb.do_packagedata changed from 1a681b73=
14c70e4e3391aa7aa2713342 to d42378061fa200bcbaacf15eb5e7ee06
Hash for dependent task libauthen-sasl-perl_2.16.bb.do_package changed from=
 eec07c8c6a9c7b92740aa46bf94c751d to db9ac0da2cddf19911d6a693b24092e9
Hash for dependent task libauthen-sasl-perl_2.16.bb.do_packagedata changed =
=66rom cb63728e7254b5c55314a83d857d17da to 7c84bae1abaf8496152927cff39e42f6

ERROR: libdigest-hmac-perl different signature for task do_package_write_ip=
k.sigdata between qemux86copy and qemuarm
basehash changed from 7e6ae9145a5eea7b41bf9be1ba0ca939 to f30da12ecbd2effee=
56431a7b86dc746
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
Hash for dependent task libdigest-sha1-perl_2.13.bb.do_packagedata changed =
=66rom ecaa12bd8bc0e2a3657f6434ac58654e to d6133066445a09fd39e642a21cfef3ce
Hash for dependent task libdigest-hmac-perl_1.03.bb.do_packagedata changed =
=66rom 4922bbff39cb88b03937bb9b511012ae to b493fbc9926ea18275a643544acb0abd
Hash for dependent task libdigest-hmac-perl_1.03.bb.do_package changed from=
 7cefa26cec59b3a97c10499f761632fd to 8820f17495321f421b5f50af9efff63b
Hash for dependent task perl_5.20.0.bb.do_packagedata changed from 1a681b73=
14c70e4e3391aa7aa2713342 to d42378061fa200bcbaacf15eb5e7ee06

ERROR: libio-socket-ssl-perl different signature for task do_package_write_=
ipk.sigdata between qemux86copy and qemuarm
basehash changed from c6aeb62d6d3fda2aa4c17ff8f7bc7128 to 928d7e2d80cdad627=
7f7513dce07194f
Variable ABIEXTENSION value changed from '${@bb.utils.contains("TUNE_FEATUR=
ES", "mx32", "x32", "" ,d)}
TUNE_FEATURES{mx32} =3D Unset' to 'eabi'
Hash for dependent task libio-socket-ssl-perl_1.997.bb.do_packagedata chang=
ed from 3d46eddb054050f82776f9fff15fab2f to 49aaffab378733a0d0b8431a65d409c6
Hash for dependent task libnet-ssleay-perl_1.65.bb.do_packagedata changed f=
rom 11a038dd67354a9e987d60867c98d901 to fd8daf596df7d47b21d336ae7b6f57d9
Hash for dependent task libio-socket-ssl-perl_1.997.bb.do_package changed f=
rom fad46c08f27399792df8ac2b42e1a121 to e965cd32d1ab0c9b27062c578fd7ebe7
Hash for dependent task perl_5.20.0.bb.do_packagedata changed from 1a681b73=
14c70e4e3391aa7aa2713342 to d42378061fa200bcbaacf15eb5e7ee06

ERROR: phpmyadmin different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task bash_4.3.bb.do_packagedata changed from 0bf5a6eade2=
0ead97b2c3a5c96433650 to 83b7c127586505003bbe80d5ddde036d

ERROR: polkit-group-rule-datetime different signature for task do_package_w=
rite_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-datetime.bb.do_package changed fr=
om c510fc58b1e4f8b3d09995b39dc2ea8b to a804d1974d91b7df12395abad834611e
Hash for dependent task polkit-group-rule-datetime.bb.do_packagedata change=
d from a438cc856def4f74e9dc2b0a7bd4c08b to b5057f913c973aaca032c233d8875a61

ERROR: polkit-group-rule-network different signature for task do_package_wr=
ite_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task polkit-group-rule-network.bb.do_package changed fro=
m fa5791d93d35f6b9ab30a6be72abc487 to 484d22522ec13ce267f7c37db1fb0107
Hash for dependent task polkit-group-rule-network.bb.do_packagedata changed=
 from 3546fc3ea7eb57e6f31ef670a05a40b0 to 0b5bda89779e2e0ef289e11ec9cda5e4

ERROR: shr-theme-neo different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task icon-theme-neo_git.bb.do_packagedata changed from 1=
50f8f50e1835b8a2f522a3249cce146 to 740bb13fa35802648dcf4b6525a88158

ERROR: terminus-font different signature for task do_package_write_ipk.sigd=
ata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-arphic-uming different signature for task do_package_write_ipk.s=
igdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-dejavu different signature for task do_package_write_ipk.sigdata=
 between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-droid different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-gentium different signature for task do_package_write_ipk.sigdat=
a between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-hunkyfonts different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-inconsolata different signature for task do_package_write_ipk.si=
gdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-liberation different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-mplus different signature for task do_package_write_ipk.sigdata =
between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-sazanami different signature for task do_package_write_ipk.sigda=
ta between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-ubuntu-font-family different signature for task do_package_write=
_ipk.sigdata between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: ttf-wqy-zenhei different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task fontconfig_2.11.1.bb.do_packagedata changed from c1=
df379b1805b46f64460a78054b8334 to 008f347265657ea044c9a9615dbeb45a

ERROR: xserver-common different signature for task do_package_write_ipk.sig=
data between qemux86copy and qemuarm
Hash for dependent task xmodmap_1.0.8.bb.do_packagedata changed from 9d4701=
23561241b492f9337682ca1127 to 9a64677c276aea0cb36339bb4b4474a6
Hash for dependent task xinput-calibrator_git.bb.do_packagedata changed fro=
m 4261ce48b430f5524bcf6de0e090b4b1 to 1a8aa6b59f64246a5c96327ffc351c57
Hash for dependent task fbset_2.1.bb.do_packagedata changed from 48e69ebe40=
d8e8e360dd12a09fcc1ed1 to 7c665ef3bb17f98cedc7f5733ca27240
Hash for dependent task xserver-common_1.34.bb.do_package changed from b174=
19dd06f9cad8cb13f976c8b47a40 to af55d55a70c986ea323f2e73cd6ae2ba
Hash for dependent task xdpyinfo_1.3.1.bb.do_packagedata changed from e376a=
0cbbc148f02f13270d1a5577737 to 36c3503107e867e32b4bd237cadf2722
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
4799677586c074a9e6317bf021786b96 to da459597b7d3ea43bdf527acf2d164ba
Hash for dependent task xrandr_1.4.2.bb.do_packagedata changed from 1e0b0f0=
6260279aff45dd7a4012f9723 to cd4da1ecace28e4046ce00b5d9a5c2dc

ERROR: xserver-nodm-init different signature for task do_package_write_ipk.=
sigdata between qemux86copy and qemuarm
Hash for dependent task xserver-common_1.34.bb.do_packagedata changed from =
4799677586c074a9e6317bf021786b96 to da459597b7d3ea43bdf527acf2d164ba
Hash for dependent task xinit_1.3.3.bb.do_packagedata changed from 43aa983d=
224a6b461777bae8080ef1b4 to 0fa747406cbc6774bba1ea41da871e1a

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRCMQIACgkQN1Ujt2V2gBxvPwCggQUZxQP+VZX6/SfFGC5JPblu
qGEAniXKdYxYzV8m6Y9F6xSRIOSiNqdM
=2RwJ
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
