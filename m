Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 42A8E62136
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 22:48:05 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l68so5712214wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oJ9rBCtllZsfQZVTHJ7tMwYWA4g0rTjdDrjuVITzhBk=;
	b=gSGzK/A6gIzOSwl2YM21bz8LNaw8cRVzo4LCugnKcWXiI73+lrtkEm7hN4rVLrgrUa
	YI7hplSW4iioMEvGWoBcjzFVB1/awUwTC5gfg/3NA9PWdIDHfKOjOtQ4vpHjikNaVk46
	hWlLFU5yiYauz4sFIPpvDa2pPrn2J22ocrHQiJqTnoC4qO0oguQBIJP2k9jMra8rNbti
	cSSVGT2nmHy61l525jZZ86fmK9v2/v3l7wWptMSB8ecCQ8F+1T2SyiU1ceYlzNapIIGe
	wKZ4aj5AEuGM6gpEO4kN/iVZw0zY5cLFPRkVH9GG8w7LkeBjiPRGBn6OyIBpUJ2NvM+2
	XFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oJ9rBCtllZsfQZVTHJ7tMwYWA4g0rTjdDrjuVITzhBk=;
	b=XrkDm7kzvUVLJ/NzSBQ4TaSuYF4rb64WoPHzU2dDeOMCQmvk6c+7GIChAycibsPilV
	I9mL5cdrtCfR0cD16PgWAARM7p944R3+DFGfgv+Vt/wIOC8/Vk8F9PdqoHRobYH1FJjg
	MLWbTgF0sIBAP+rq71h8pirfKo362V9EsE5AlglWE0U3vHGXD+tm8gXgLBEiQEgaWyKI
	A6cAdKYDcvt/7m/OU0kyoci6jGvOttIxgJK51RWBGQiJ1rpeLT+tKa0I1uFffKEYMWd5
	Mb89skzC2ipy4AlUZETCTwxtomrAzYcXUITAv8hHFDtiF+hCvB8faMlDuOAPprZ2IanZ
	T1gA==
X-Gm-Message-State: AD7BkJKkYoqjlGb8GcwRYq9PsAqzffv/nd5aR0jG80mSa1xf6MjtCQt23DCdD49MprQDrQ==
X-Received: by 10.28.178.209 with SMTP id b200mr175899wmf.98.1457563686231;
	Wed, 09 Mar 2016 14:48:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id v5sm670394wmg.16.2016.03.09.14.48.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 14:48:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 23:50:58 +0100
To: "Burton, Ross" <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20160309225058.GM2542@jama>
References: <18448427.V3ACvxT67R@rjs-zotac.streifs.net>
	<CAJTo0La2CZAKw0Cd4_NpPLt=qXy3x3Arv36huhUMmCH3tV14YA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La2CZAKw0Cd4_NpPLt=qXy3x3Arv36huhUMmCH3tV14YA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Rudolf J Streif <rudolf.streif@gmail.com>
Subject: Wrong sstate signatures for cross toolchain Was: [yocto] Building gdb-7.10 for arm with master
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
X-List-Received-Date: Wed, 09 Mar 2016 22:48:07 -0000
X-Groupsio-MsgNum: 79351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sGwo475CiIwWEjLI"
Content-Disposition: inline

--sGwo475CiIwWEjLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 05, 2016 at 09:40:48PM +0000, Burton, Ross wrote:
> On 5 March 2016 at 21:19, Rudolf J Streif <rudolf.streif@gmail.com> wrote:
>=20
> > compile fails with the following error message:
> >
> > | make[2]: *** No rule to make target '../readline/libreadline.a', need=
ed
> > by 'gdb'.  Stop.
> > | make[2]: *** Waiting for unfinished jobs....
> >
> > The reason seems to be a broken path to the built-in readline in the
> > makefile as the default configuration is
> > --without-system-readline. Enabling
> >
> > PACKAGECONFIG_append_pn-dbg =3D " readline"

See http://patchwork.openembedded.org/patch/116843/ discussion, the
patch from Ross mentioned bellow fixes it better and is already merged
in master.

> The default is with system readline...
>=20
> gdb-common.inc:PACKAGECONFIG ??=3D "readline"

BTW: this is causing gdb-cross-* to depend on target readline, which may
have different signatures for different MACHINEs with the same arch.

E.g. after adding qemuarm7 MACHINE, you can easily get gdb-cross-arm
being rebuilt/extracted-from-sstate after each MACHINE change.

I'm not sure why selftest didn't catch this, but it can be seen with:
openembedded-core/scripts/sstate-diff-machines.sh --machines=3D"qemuarm qem=
uarm7" --targets=3Dgdb-cross-arm --tmpdir=3Dtmp-glibc

OE qemuarm7@ ~/build/oe-core $ ls tmp-glibc/sstate-diff/1457556601/*/*/*gdb=
-cross*/*do_configure*
tmp-glibc/sstate-diff/1457556601/qemuarm/x86_64-linux/gdb-cross-arm/7.10.1-=
r0.do_configure.sigdata.5053ae4a1b3de54b978ba7201b1dde75
tmp-glibc/sstate-diff/1457556601/qemuarm7/x86_64-linux/gdb-cross-arm/7.10.1=
-r0.do_configure.sigdata.382badde81cbf6c925f66525ae33c33a
OE qemuarm7@ ~/build/oe-core $ bitbake-diffsigs tmp-glibc/sstate-diff/14575=
56601/*/*/*gdb-cross*/*do_configure*
Task dependencies changed from:
['ABIEXTENSION', 'ACLOCALDIR', 'AR', 'ARMPKGARCH', 'ARMPKGARCH_tune-armv5te=
', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSFX_ENDIAN', 'ARMPKGSFX_FPU', =
'ARMPKGSFX_THUMB', 'ARM_INSTRUCTION_SET', 'ARM_M_OPT', 'ARM_THUMB_OPT', 'AR=
M_THUMB_SUFFIX', 'AS', 'ASNEEDED', 'AUTOTOOLS_COPYACLOCAL', 'AUTOTOOLS_SCRI=
PT_PATH', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BP', 'BPN', 'BUILD_AR', 'B=
UILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUIL=
D_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'B=
UILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BUILD_=
OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP', '=
BUILD_SYS', 'BUILD_VENDOR', 'CACHED_CONFIGUREVARS', 'CC', 'CCLD', 'CC_FOR_B=
UILD', 'CFLAGS', 'CFLAGS_FOR_BUILD', 'CLEANBROKEN', 'CONFIGUREOPTS', 'CONFI=
GUREOPT_DEPTRACK', 'CONFIGURESTAMPFILE', 'CONFIGURE_SCRIPT', 'CONFIG_SITE',=
 'CPP', 'CPPFLAGS', 'CPPFLAGS_FOR_BUILD', 'CPP_FOR_BUILD', 'CROSS_TARGET_SY=
S_DIR', 'CXX', 'CXXFLAGS', 'CXXFLAGS_FOR_BUILD', 'CXX_FOR_BUILD', 'DEBUG_BU=
ILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEFAULTTUNE', 'DEPENDS', 'DEPEN=
DS_GETTEXT', 'DISABLE_STATIC', 'EXPAT', 'EXTRA_OECONF', 'EXTRA_OEMAKE', 'FC=
', 'FULL_OPTIMIZATION', 'GDBPROPREFIX', 'HOST_ARCH', 'HOST_AS_ARCH', 'HOST_=
CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_VENDO=
R', 'INHIBIT_DEFAULT_DEPS', 'LC_ALL', 'LD', 'LDFLAGS', 'LDFLAGS_FOR_BUILD',=
 'LD_FOR_BUILD', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKER_HA=
SH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P', =
'PACKAGECONFIG', 'PACKAGECONFIG[babeltrace]', 'PACKAGECONFIG[readline]', 'P=
KG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG=
_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PKG_CONFIG_SYSTEM_INCLUDE_PATH', =
'PKG_CONFIG_SYSTEM_LIBRARY_PATH', 'PN', 'PREFERRED_ARM_INSTRUCTION_SET', 'P=
SEUDO_DISABLED', 'PV', 'PYTHON_BASEVERSION', 'PYTHON_PN', 'QA_LOGFILE', 'QA=
_SANE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'STAGING_BASE_LIBDIR_NATIVE=
', 'STAGING_BINDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'S=
TAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR=
_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_CFLAGS', 'TARGET_=
CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LINK_HASH_STYLE', '=
TARGET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TEXDEP', 'TOOLCHAIN_OPTIONS', '=
TUNE_ARCH', 'TUNE_CCARGS_MFLOAT', 'TUNE_CCARGS_MFPU', 'TUNE_FEATURES', 'TUN=
E_FEATURES_tune-armv5', 'TUNE_FEATURES_tune-armv5t', 'TUNE_FEATURES_tune-ar=
mv5te', 'TUNE_PKGARCH', 'UNKNOWN_CONFIGURE_WHITELIST', 'USE_NLS', 'append_l=
ibtool_sysroot', 'autotools_copy_aclocals', 'autotools_dep_prepend', 'autot=
ools_postconfigure', 'autotools_preconfigure', 'base_bindir', 'base_dep_pre=
pend', 'base_libdir', 'base_libdir_native', 'base_prefix', 'base_sbindir', =
'baselib', 'bbfatal', 'bbfatal_log', 'bbnote', 'bindir', 'bindir_native', '=
datadir', 'datadir_native', 'die', 'do_qa_configure', 'docdir', 'exec_prefi=
x', 'gettext_dependencies', 'gettext_oeconf', 'includedir', 'includedir_nat=
ive', 'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir', =
'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir', 'nonar=
ch_libdir', 'oe_runconf', 'oe_runmake', 'oe_runmake_call', 'oldincludedir',=
 'package_qa_check_license', 'package_qa_handle_error', 'package_qa_write_e=
rror', 'prefix', 'prefix_native', 'sbindir', 'servicedir', 'sharedstatedir'=
, 'siteinfo_data', 'siteinfo_get_files', 'sstate_add', 'sstate_clean', 'sst=
ate_clean_manifest', 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', =
'sysroot_cleansstate', 'systemd_system_unitdir', 'systemd_unitdir', 'system=
d_user_unitdir']
to:
['ABIEXTENSION', 'ACLOCALDIR', 'AR', 'ARMPKGARCH', 'ARMPKGARCH_tune-armv7a-=
neon', 'ARMPKGSFX_DSP', 'ARMPKGSFX_EABI', 'ARMPKGSFX_ENDIAN', 'ARMPKGSFX_FP=
U', 'ARMPKGSFX_THUMB', 'ARM_INSTRUCTION_SET', 'ARM_M_OPT', 'ARM_THUMB_OPT',=
 'ARM_THUMB_SUFFIX', 'AS', 'ASNEEDED', 'AUTOTOOLS_COPYACLOCAL', 'AUTOTOOLS_=
SCRIPT_PATH', 'B', 'BASEDEPENDS', 'BB_CURRENTTASK', 'BP', 'BPN', 'BUILD_AR'=
, 'BUILD_AS', 'BUILD_AS_ARCH', 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', '=
BUILD_CFLAGS', 'BUILD_CPP', 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS'=
, 'BUILD_FC', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM', 'BU=
ILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB', 'BUILD_STRIP=
', 'BUILD_SYS', 'BUILD_VENDOR', 'CACHED_CONFIGUREVARS', 'CC', 'CCLD', 'CC_F=
OR_BUILD', 'CFLAGS', 'CFLAGS_FOR_BUILD', 'CLEANBROKEN', 'CONFIGUREOPTS', 'C=
ONFIGUREOPT_DEPTRACK', 'CONFIGURESTAMPFILE', 'CONFIGURE_SCRIPT', 'CONFIG_SI=
TE', 'CPP', 'CPPFLAGS', 'CPPFLAGS_FOR_BUILD', 'CPP_FOR_BUILD', 'CROSS_TARGE=
T_SYS_DIR', 'CXX', 'CXXFLAGS', 'CXXFLAGS_FOR_BUILD', 'CXX_FOR_BUILD', 'DEBU=
G_BUILD', 'DEBUG_FLAGS', 'DEBUG_OPTIMIZATION', 'DEFAULTTUNE', 'DEPENDS', 'D=
EPENDS_GETTEXT', 'DISABLE_STATIC', 'EXPAT', 'EXTRA_OECONF', 'EXTRA_OEMAKE',=
 'FC', 'FULL_OPTIMIZATION', 'GDBPROPREFIX', 'HOST_ARCH', 'HOST_AS_ARCH', 'H=
OST_CC_ARCH', 'HOST_LD_ARCH', 'HOST_OS', 'HOST_PREFIX', 'HOST_SYS', 'HOST_V=
ENDOR', 'INHIBIT_DEFAULT_DEPS', 'LC_ALL', 'LD', 'LDFLAGS', 'LDFLAGS_FOR_BUI=
LD', 'LD_FOR_BUILD', 'LIBCEXTENSION', 'LICENSE', 'LIC_FILES_CHKSUM', 'LINKE=
R_HASH_STYLE', 'LOGFIFO', 'MAKE', 'MLPREFIX', 'NM', 'OBJCOPY', 'OBJDUMP', '=
P', 'PACKAGECONFIG', 'PACKAGECONFIG[babeltrace]', 'PACKAGECONFIG[readline]'=
, 'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', =
'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PKG_CONFIG_SYSTEM_INCLUDE_PAT=
H', 'PKG_CONFIG_SYSTEM_LIBRARY_PATH', 'PN', 'PREFERRED_ARM_INSTRUCTION_SET'=
, 'PSEUDO_DISABLED', 'PV', 'PYTHON_BASEVERSION', 'PYTHON_PN', 'QA_LOGFILE',=
 'QA_SANE', 'RANLIB', 'S', 'SELECTED_OPTIMIZATION', 'STAGING_BASE_LIBDIR_NA=
TIVE', 'STAGING_BINDIR_NATIVE', 'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE'=
, 'STAGING_DIR', 'STAGING_DIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LI=
BDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH', 'TARGET_CFLAGS', 'TAR=
GET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS', 'TARGET_LINK_HASH_STYLE=
', 'TARGET_OS', 'TARGET_SYS', 'TARGET_VENDOR', 'TEXDEP', 'TOOLCHAIN_OPTIONS=
', 'TUNE_ARCH', 'TUNE_CCARGS_MFLOAT', 'TUNE_CCARGS_MFPU', 'TUNE_FEATURES', =
'TUNE_FEATURES_tune-armv7a', 'TUNE_FEATURES_tune-armv7a-neon', 'TUNE_PKGARC=
H', 'UNKNOWN_CONFIGURE_WHITELIST', 'USE_NLS', 'append_libtool_sysroot', 'au=
totools_copy_aclocals', 'autotools_dep_prepend', 'autotools_postconfigure',=
 'autotools_preconfigure', 'base_bindir', 'base_dep_prepend', 'base_libdir'=
, 'base_libdir_native', 'base_prefix', 'base_sbindir', 'baselib', 'bbfatal'=
, 'bbfatal_log', 'bbnote', 'bindir', 'bindir_native', 'datadir', 'datadir_n=
ative', 'die', 'do_qa_configure', 'docdir', 'exec_prefix', 'gettext_depende=
ncies', 'gettext_oeconf', 'includedir', 'includedir_native', 'infodir', 'li=
bdir', 'libdir_native', 'libexecdir', 'localstatedir', 'lt_cv_sys_lib_dlsea=
rch_path_spec', 'mandir', 'nonarch_base_libdir', 'nonarch_libdir', 'oe_runc=
onf', 'oe_runmake', 'oe_runmake_call', 'oldincludedir', 'package_qa_check_l=
icense', 'package_qa_handle_error', 'package_qa_write_error', 'prefix', 'pr=
efix_native', 'sbindir', 'servicedir', 'sharedstatedir', 'siteinfo_data', '=
siteinfo_get_files', 'sstate_add', 'sstate_clean', 'sstate_clean_manifest',=
 'sstate_init', 'sstate_state_fromvars', 'sysconfdir', 'sysroot_cleansstate=
', 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir']
basehash changed from 6dae9966f8172d38f74b51b1592c6f53 to 1da8e870ad7319e1b=
f108416c3b22dd9
List of dependencies for variable TUNE_FEATURES changed from 'set(['DEFAULT=
TUNE', 'TUNE_FEATURES_tune-armv5te'])' to 'set(['TUNE_FEATURES_tune-armv7a-=
neon', 'DEFAULTTUNE'])'
changed items: set(['TUNE_FEATURES_tune-armv7a-neon', 'TUNE_FEATURES_tune-a=
rmv5te'])
List of dependencies for variable ARMPKGARCH changed from 'set(['DEFAULTTUN=
E', 'ARMPKGARCH_tune-armv5te'])' to 'set(['ARMPKGARCH_tune-armv7a-neon', 'D=
EFAULTTUNE'])'
changed items: set(['ARMPKGARCH_tune-armv7a-neon', 'ARMPKGARCH_tune-armv5te=
'])
List of dependencies for variable TUNE_CCARGS_MFPU changed from 'set([])' t=
o 'set(['TUNE_FEATURES'])'
Dependency on variable ARMPKGARCH_tune-armv7a-neon was added
Dependency on variable TUNE_FEATURES_tune-armv7a-neon was added
Dependency on variable TUNE_FEATURES_tune-armv7a was added
Dependency on Variable TUNE_FEATURES_tune-armv5t was removed
Dependency on Variable TUNE_FEATURES_tune-armv5te was removed
Dependency on Variable ARMPKGARCH_tune-armv5te was removed
Dependency on Variable TUNE_FEATURES_tune-armv5 was removed
Variable ARM_THUMB_SUFFIX value changed from '${@bb.utils.contains('TUNE_FE=
ATURES', 'armv4',  't',  '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv=
5',  't',  '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '',=
 d)}${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}${@bb.util=
s.contains('TUNE_FEATURES', 'armv7r', 't2', '', d)}${@bb.utils.contains('TU=
NE_FEATURES', 'armv7m', 't2', '', d)}${@bb.utils.contains('TUNE_FEATURES', =
'armv7ve', 't2', '', d)}
TUNE_FEATURES{armv4} =3D Unset
TUNE_FEATURES{armv5} =3D Set
TUNE_FEATURES{armv6} =3D Unset
TUNE_FEATURES{armv7a} =3D Unset
TUNE_FEATURES{armv7m} =3D Unset
TUNE_FEATURES{armv7r} =3D Unset
TUNE_FEATURES{armv7ve} =3D Unset' to '${@bb.utils.contains('TUNE_FEATURES',=
 'armv4',  't',  '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv5',  't'=
,  '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv6',  't',  '', d)}${@b=
b.utils.contains('TUNE_FEATURES', 'armv7a', 't2', '', d)}${@bb.utils.contai=
ns('TUNE_FEATURES', 'armv7r', 't2', '', d)}${@bb.utils.contains('TUNE_FEATU=
RES', 'armv7m', 't2', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'armv7ve=
', 't2', '', d)}
TUNE_FEATURES{armv4} =3D Unset
TUNE_FEATURES{armv5} =3D Unset
TUNE_FEATURES{armv6} =3D Unset
TUNE_FEATURES{armv7a} =3D Set
TUNE_FEATURES{armv7m} =3D Unset
TUNE_FEATURES{armv7r} =3D Unset
TUNE_FEATURES{armv7ve} =3D Unset'
Variable DEFAULTTUNE value changed from 'armv5te' to 'armv7a-neon'
Variable TUNE_CCARGS_MFPU value changed from '${@bb.utils.contains('TUNE_FE=
ATURES', 'vfp', ' vfp', '', d)}
TUNE_FEATURES{vfp} =3D Unset' to '${@bb.utils.contains('TUNE_FEATURES', 'vf=
p', ' vfp', '', d)}${@bb.utils.contains('TUNE_FEATURES', 'neon', ' neon', '=
', d)}${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', ' vfpv3d16', '', d)=
}${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' vfpv3', '' , d)}${@bb.uti=
ls.contains('TUNE_FEATURES', 'vfpv4', ' vfpv4', '', d)}${@bb.utils.contains=
('TUNE_FEATURES', [ 'vfpv4', 'neon' ], ' neon-vfpv4', '', d)}
TUNE_FEATURES{neon} =3D Set
TUNE_FEATURES{vfp} =3D Set
TUNE_FEATURES{vfpv3} =3D Unset
TUNE_FEATURES{vfpv3d16} =3D Unset
TUNE_FEATURES{vfpv4} =3D Unset'
Variable ARMPKGSFX_THUMB value changed from '${@bb.utils.contains('TUNE_FEA=
TURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', Tru=
e) =3D=3D 'thumb' else ''}
TUNE_FEATURES{thumb} =3D Set' to '${@bb.utils.contains('TUNE_FEATURES', 'th=
umb', '${ARM_THUMB_SUFFIX}', '', d) if d.getVar('ARM_M_OPT', True) =3D=3D '=
thumb' else ''}
TUNE_FEATURES{thumb} =3D Unset'
runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:vir=
tual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:native'=
, 'expatexpat_2.1.0.bb.do_populate_sysroot:virtual:native', 'gdbgdb-cross_7=
=2E10.1.bb.do_patch', 'gettextgettext-minimal-native_0.19.4.bb.do_populate_=
sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native',=
 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'ncursesncurses_6.0+=
20160213.bb.do_populate_sysroot:virtual:native', 'pythonpython-native_2.7.1=
1.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', '=
readlinereadline_6.3.bb.do_populate_sysroot:virtual:native', 'texinfo-dummy=
-nativetexinfo-dummy-native.bb.do_populate_sysroot'] to ['autoconfautoconf_=
2.69.bb.do_populate_sysroot:virtual:native', 'automakeautomake_1.15.bb.do_p=
opulate_sysroot:virtual:native', 'expatexpat_2.1.0.bb.do_populate_sysroot:v=
irtual:native', 'gdbgdb-cross_7.10.1.bb.do_patch', 'gettextgettext-minimal-=
native_0.19.4.bb.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_popu=
late_sysroot:virtual:native', 'libtoollibtool-native_2.4.6.bb.do_populate_s=
ysroot', 'ncursesncurses_6.0+20160213.bb.do_populate_sysroot:virtual:native=
', 'pythonpython-native_2.7.11.bb.do_populate_sysroot', 'readlinereadline_6=
=2E3.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot:=
virtual:native', 'texinfo-dummy-nativetexinfo-dummy-native.bb.do_populate_s=
ysroot']
/OE/build/oe-core/openembedded-core/meta/recipes-core/readline/readline_6.3=
=2Ebb.do_populate_sysroot with hash 323c67a8a6a66c247677ab68c85ff9fb
 changed to
/OE/build/oe-core/openembedded-core/meta/recipes-core/readline/readline_6.3=
=2Ebb.do_populate_sysroot with hash 88caa3bcf334d42e71c134af45ad5b4b
Hash for dependent task readlinereadline_6.3.bb.do_populate_sysroot changed=
 from 323c67a8a6a66c247677ab68c85ff9fb to 88caa3bcf334d42e71c134af45ad5b4b


What's even more interesting is that even gcc-cross-initial has different s=
ignatures for 2 ARM MACHINEs with different DEFAULTTUNES

OE qemuarm7@ ~/build/oe-core $ grep ^DEFAULTTUNE=3D env.gdb-cross-arm*
env.gdb-cross-arm:DEFAULTTUNE=3D"armv5te"
env.gdb-cross-arm7:DEFAULTTUNE=3D"armv7a-neon"

OE qemuarm7@ ~/build/oe-core $ ls tmp-glibc/sstate-diff/1457556601/*/*/*gcc=
-cross-initial*/*do_configure*
tmp-glibc/sstate-diff/1457556601/qemuarm/x86_64-linux/gcc-cross-initial-arm=
/5.3.0-r0.do_configure.sigdata.e54e7a04acf1029cc37463114c7e4dba
tmp-glibc/sstate-diff/1457556601/qemuarm7/x86_64-linux/gcc-cross-initial-ar=
m/5.3.0-r0.do_configure.sigdata.3496e3dde08a49b14462741cc6f8d239
OE qemuarm7@ ~/build/oe-core $ bitbake-diffsigs tmp-glibc/sstate-diff/14575=
56601/*/*/*gcc-cross-initial*/*do_configure*
basehash changed from 5848199c69eee0db746de21c5458c13d to 673cd8d19bc4cbea1=
32900a670593df6
Variable EXTRA_OECONF value changed from '--with-newlib --without-headers -=
-disable-shared --disable-threads --disable-multilib --disable-__cxa_atexit=
 --enable-languages=3Dc --program-prefix=3D${TARGET_PREFIX} --with-sysroot=
=3D/not/exist --with-build-sysroot=3D${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECON=
F_INITIAL} ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=
=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} ${EXTRA_OEC=
ONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} --with-native-system-hea=
der-dir=3D${SYSTEMHEADERS}${DISABLE_STATIC} ${@gettext_oeconf(d)}
DISTRO_FEATURES{ld-is-gold} =3D Unset' to '--with-newlib --without-headers =
--disable-shared --disable-threads --disable-multilib --disable-__cxa_atexi=
t --enable-languages=3Dc --program-prefix=3D${TARGET_PREFIX} --with-sysroot=
=3D/not/exist --with-build-sysroot=3D${GCCCROSS_BUILDSYSROOT} ${EXTRA_OECON=
F_INITIAL} ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--with-ld=
=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ld.bfd', '', d)} ${EXTRA_OEC=
ONF_GCC_FLOAT} ${@get_gcc_ppc_plt_settings(bb, d)} --with-native-system-hea=
der-dir=3D${SYSTEMHEADERS}${DISABLE_STATIC} ${@gettext_oeconf(d)} --with-ar=
ch=3Darmv7-a
DISTRO_FEATURES{ld-is-gold} =3D Unset'

>=20
> However if you do have PACKAGECONFIG set to "" for gdb for some reason th=
en
> you'll want to cherry-pick ce2542057d877044a7548f2884d192f4f672c75a
> (master-next) to fix builds with the internal readline if you've got
> no-static-libs enabled (which is true for Poky).
>=20
> Ross

> --=20
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sGwo475CiIwWEjLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgqNEACgkQN1Ujt2V2gByKYwCfTvsfbfG0ulXOUjVJtH85oc+C
dMAAmgOdQ61KwkG4Ul7h3LDIc97oW45R
=aCsM
-----END PGP SIGNATURE-----

--sGwo475CiIwWEjLI--
