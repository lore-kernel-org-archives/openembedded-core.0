Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id D1BE36D824
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 14:27:10 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so269463eek.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0d5vRGqRDTvOifpfhNQAvHv64Mx/ePL04+DwAUnqTWk=;
	b=zRhWHWS3org8vBxvlpdnI0X7bH2PS85gonzOBM9TM05hzJLmcmBzrN6Ii/T9S4X7I+
	jcfN47gaqc8thfPM9aJE32FspkrzalR4OZWF4olMD2KU4TAzbXRkfTlUthK5gV1KGzEK
	Cr/Lyb1zsZL5h68FtnY/FWA4ZZKcCio096mLzlos1/Z11T2ujHgA87IxrdTnjQcAw+7s
	56jTwthaK2rok8HxDBGxFitxwJLLMz0ydebggFXBio6nnsz7ujZwy1ZVbBcUZo9duPuS
	9iB0QeSh73IbGjeDUekYG5nm46WPJzW2+QTb/rOTc+8BCwLJsqBpyYDa6VY7n3s7AmZa
	ohgw==
X-Received: by 10.15.95.72 with SMTP id bc48mr8355759eeb.49.1386858429567;
	Thu, 12 Dec 2013 06:27:09 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n1sm66677347eep.20.2013.12.12.06.27.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Dec 2013 06:27:07 -0800 (PST)
Date: Thu, 12 Dec 2013 15:27:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131212142730.GD3717@jama>
References: <cover.1386847526.git.paul.eggleton@linux.intel.com>
	<9c7ab89a1f2d3e7d20d7ba51d573482a7adf686c.1386847526.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <9c7ab89a1f2d3e7d20d7ba51d573482a7adf686c.1386847526.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] external-sourcery-toolchain: remove
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
X-List-Received-Date: Thu, 12 Dec 2013 14:27:12 -0000
X-Groupsio-MsgNum: 48155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2013 at 11:25:53AM +0000, Paul Eggleton wrote:
> As per discussion on the mailing list [1], remove this largely
> unmaintained external toolchain support in favour of the maintained
> version in meta-sourcery [2].
>=20
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2013-Decemb=
er/087133.html
> [2] https://github.com/MentorEmbedded/meta-sourcery/

Can you add links to meta-sourcery and meta-linaro external toolchains
in oe-core/meta/conf/distro/defaultsetup.conf next to:
 TCMODE ?=3D "default"
 require conf/distro/include/tcmode-${TCMODE}.inc
or local.conf.sample.extended ?

> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/conf/distro/include/csl-versions.inc          | 107 ---------
>  meta/conf/distro/include/tcmode-external-csl.inc   |   2 -
>  .../distro/include/tcmode-external-sourcery.inc    | 128 ----------
>  .../meta/external-sourcery-toolchain.bb            | 149 ------------
>  .../meta/external-sourcery-toolchain/SUPPORTED     | 257 ---------------=
------
>  5 files changed, 643 deletions(-)
>  delete mode 100644 meta/conf/distro/include/csl-versions.inc
>  delete mode 100644 meta/conf/distro/include/tcmode-external-csl.inc
>  delete mode 100644 meta/conf/distro/include/tcmode-external-sourcery.inc
>  delete mode 100644 meta/recipes-core/meta/external-sourcery-toolchain.bb
>  delete mode 100644 meta/recipes-core/meta/external-sourcery-toolchain/SU=
PPORTED
>=20
> diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro=
/include/csl-versions.inc
> deleted file mode 100644
> index 3938bf7..0000000
> --- a/meta/conf/distro/include/csl-versions.inc
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -def csl_run(d, cmd, *args):
> -	import bb.process
> -	import subprocess
> -
> -	topdir =3D d.getVar('TOPDIR', True)
> -	toolchain_path =3D d.getVar('EXTERNAL_TOOLCHAIN', True)
> -	if not toolchain_path:
> -		return 'UNKNOWN', 'UNKNOWN'
> -
> -	target_prefix =3D d.getVar('TARGET_PREFIX', True)
> -	path =3D os.path.join(toolchain_path, 'bin', target_prefix + cmd)
> -	args =3D [path] + list(args)
> -
> -	return bb.process.run(args, cwd=3Dtopdir, stderr=3Dsubprocess.PIPE)
> -
> -def csl_get_version(d):
> -        try:
> -		stdout, stderr =3D csl_run(d, 'gcc', '-v')
> -	except bb.process.CmdError as exc:
> -		bb.error('Failed to obtain CodeSourcery toolchain version: %s' % exc)
> -		bb.error('Make sure that MACHINE is set correctly in your local.conf a=
nd the toolchain supports %s.' % d.getVar("TARGET_ARCH", True))
> -		return 'UNKNOWN'
> -	else:
> -		last_line =3D stderr.splitlines()[-1]
> -		return last_line
> -
> -def csl_get_main_version(d):
> -	version =3D csl_get_version(d)
> -	if version !=3D 'UNKNOWN':
> -		return version.split()[-1].rstrip(')')
> -	else:
> -		return version
> -
> -def csl_get_gcc_version(d):
> -	version =3D csl_get_version(d)
> -	if version !=3D 'UNKNOWN':
> -		return version.split()[2]
> -	else:
> -		return version
> -
> -def csl_get_libc_version(d):
> -	syspath =3D d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
> -	if not syspath:
> -	        return 'UNKNOWN'
> -
> -	libpath =3D syspath + '/libc/lib/'
> -	if not os.path.exists(libpath):
> -		libpath =3D syspath + '/libc/sgxx-glibc/lib/'
> -
> -	if os.path.exists(libpath):
> -		for file in os.listdir(libpath):
> -			if file.find('libc-') =3D=3D 0:
> -				return file[5:-3]
> -	return 'UNKNOWN'
> -
> -def csl_get_kernel_version(d):
> -	syspath =3D d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
> -	if not syspath:
> -	        return 'UNKNOWN'
> -
> -	vf =3D syspath + '/libc/usr/include/linux/version.h'
> -	if not os.path.exists(vf):
> -		vf =3D syspath + '/libc/sgxx-glibc/usr/include/linux/version.h'
> -
> -	try:
> -		f =3D open(vf, 'r')
> -	except (OSError, IOError):
> -		return 'UNKNOWN'
> -
> -	l =3D f.readlines();
> -	f.close();
> -	for s in l:
> -		if s.find('LINUX_VERSION_CODE') > 0:
> -			ver =3D int(s.split()[2])
> -			maj =3D ver / 65536
> -			ver =3D ver % 65536
> -			min =3D ver / 256
> -			ver =3D ver % 256
> -			return str(maj)+'.'+str(min)+'.'+str(ver)
> -	return 'UNKNOWN'
> -
> -def csl_get_gdb_version(d):
> -	try:
> -		stdout, stderr =3D csl_run(d, 'gdb', '-v')
> -	except bb.process.CmdError:
> -		return 'UNKNOWN'
> -	else:
> -		first_line =3D stdout.splitlines()[0]
> -		return first_line.split()[-1]
> -
> -python csl_version_handler () {
> -    d =3D e.data
> -    ld =3D d.createCopy()
> -    ld.finalize()
> -
> -    d.setVar('CSL_VER_MAIN', csl_get_main_version(ld))
> -    d.setVar('CSL_VER_GCC', csl_get_gcc_version(ld))
> -    d.setVar('CSL_VER_LIBC', csl_get_libc_version(ld))
> -    d.setVar('CSL_VER_KERNEL', csl_get_kernel_version(ld))
> -    d.setVar('CSL_VER_GDB', csl_get_gdb_version(ld))
> -}
> -addhandler csl_version_handler
> -csl_version_handler[eventmask] =3D "bb.event.ConfigParsed"
> -
> -# Ensure that any variable which includes the --sysroot (CC, CXX, etc) a=
lso
> -# depends on the toolchain version
> -TOOLCHAIN_OPTIONS[vardeps] +=3D "CSL_VER_MAIN CSL_VER_GCC"
> diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf=
/distro/include/tcmode-external-csl.inc
> deleted file mode 100644
> index 9e530ab..0000000
> --- a/meta/conf/distro/include/tcmode-external-csl.inc
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -TCMODE =3D "external-sourcery"
> -require conf/distro/include/tcmode-${TCMODE}.inc
> diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta=
/conf/distro/include/tcmode-external-sourcery.inc
> deleted file mode 100644
> index 5590f7a..0000000
> --- a/meta/conf/distro/include/tcmode-external-sourcery.inc
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -#
> -# Configuration to use external Sourcery G++ toolchain
> -#
> -
> -EXTERNAL_TOOLCHAIN ?=3D "/usr/local/csl/${TARGET_ARCH}"
> -
> -TOOLCHAIN_PATH_ADD =3D "${EXTERNAL_TOOLCHAIN}/bin:"
> -PATH =3D. "${TOOLCHAIN_PATH_ADD}"
> -
> -CSL_TARGET_SYS_powerpc ?=3D "powerpc-linux-gnu"
> -CSL_TARGET_SYS_powerpc64 ?=3D "powerpc-linux-gnu"
> -CSL_TARGET_SYS_arm ?=3D "arm-none-linux-gnueabi"
> -CSL_TARGET_SYS_mips ?=3D "mips-linux-gnu"
> -CSL_TARGET_SYS_mipsel ?=3D "mips-linux-gnu"
> -CSL_TARGET_SYS_mips64 ?=3D "mips-linux-gnu"
> -CSL_TARGET_SYS_i686 ?=3D "i686-pc-linux-gnu"
> -CSL_TARGET_SYS_i586 ?=3D "i686-pc-linux-gnu"
> -CSL_TARGET_SYS =3D "${TARGET_SYS}"
> -
> -TARGET_PREFIX =3D "${CSL_TARGET_SYS}-"
> -
> -PREFERRED_PROVIDER_linux-libc-headers =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_linux-libc-headers-dev =3D "external-sourcery-toolcha=
in"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =3D "external-sourcery-to=
olchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial =3D "external-sou=
rcery-toolchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D "externa=
l-sourcery-toolchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D "external-sourcery-to=
olchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D "external-source=
ry-toolchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "external-so=
urcery-toolchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D "external-so=
urcery-toolchain"
> -PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs =3D "external-so=
urcery-toolchain"
> -PREFERRED_PROVIDER_libgcc =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_eglibc =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_virtual/libc =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_virtual/libintl =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_virtual/libiconv =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_glibc-thread-db =3D "external-sourcery-toolchain"
> -PREFERRED_PROVIDER_virtual/linux-libc-headers =3D "external-sourcery-too=
lchain"
> -PREFERRED_PROVIDER_virtual/linux-libc-headers-dev =3D "external-sourcery=
-toolchain"
> -PREFERRED_PROVIDER_gdbserver ??=3D "external-sourcery-toolchain"
> -
> -# No need to re-compile the locale files
> -GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "precompiled"
> -ENABLE_BINARY_LOCALE_GENERATION =3D ""
> -
> -TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_HOST}"
> -
> -# Point to the appropriate multilib sysroot from the external toolchain,=
 whose
> -# files will be extracted into the OE sysroot
> -def exttc_run(d, cmd):
> -    try:
> -        return bb.process.run(cmd, shell=3DTrue, env=3D{'PATH': d.getVar=
('PATH', True)})[0].rstrip()
> -    except (OSError, bb.process.CmdError):
> -        return ''
> -
> -EXTERNAL_TOOLCHAIN_SYSROOT_CMD =3D "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH=
} -print-sysroot"
> -EXTERNAL_TOOLCHAIN_SYSROOT ??=3D "${@exttc_run(d, EXTERNAL_TOOLCHAIN_SYS=
ROOT_CMD)}"
> -
> -# These bits are here temporarily to sidestep the need to use a separate=
 set
> -# of tune files to pass the appropriate multilib selection arguments to =
the
> -# sourcery toolchain, as is needed to extract the sysroot content.
> -TUNE_CCARGS_append_x86 =3D " -msgxx-glibc"
> -
> -CSL_MULTILIB_ARGS[ppce500] ?=3D "-te500v1"
> -CSL_MULTILIB_ARGS[ppce500mc] ?=3D "-te500mc"
> -CSL_MULTILIB_ARGS[ppce500v2] ?=3D "-te500v2"
> -CSL_MULTILIB_ARGS[ppce600] ?=3D "-te600"
> -
> -def csl_multilib_arg(d):
> -    argument =3D d.getVarFlag('CSL_MULTILIB_ARGS', d.getVar('DEFAULTTUNE=
', True) or '')
> -    if argument:
> -        return argument
> -    else:
> -        return ''
> -
> -EXTERNAL_TOOLCHAIN_SYSROOT_CMD +=3D "${@csl_multilib_arg(d)}"
> -
> -
> -# Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
> -# bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid ad=
ding
> -# this bindir to our PATH, and instead add symlinks to the prefixed bina=
ries
> -# to our staging toolchain bindir.
> -
> -python toolchain_metadata_setup () {
> -    d =3D e.data
> -
> -    l =3D d.createCopy()
> -    l.finalize()
> -    if os.path.exists(bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/gcc', l)=
):
> -        d.setVar('TOOLCHAIN_PATH_ADD', '')
> -}
> -addhandler toolchain_metadata_setup
> -toolchain_metadata_setup[eventmask] =3D "bb.event.ConfigParsed"
> -
> -python toolchain_setup () {
> -    d =3D e.data
> -
> -    if not d.getVar('TOOLCHAIN_PATH_ADD', True):
> -        populate_toolchain_links(d)
> -}
> -addhandler toolchain_setup
> -toolchain_setup[eventmask] =3D "bb.event.BuildStarted"
> -
> -def populate_toolchain_links(d):
> -    import errno
> -    from glob import glob
> -
> -    d =3D d.createCopy()
> -    d.finalize()
> -
> -    pattern =3D d.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*')
> -    files =3D glob(pattern)
> -    if not files:
> -        bb.fatal("Unable to populate toolchain binary symlinks in %s" % =
pattern)
> -
> -    bindir =3D d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
> -    bb.utils.mkdirhier(bindir)
> -    for f in files:
> -        base =3D os.path.basename(f)
> -        newpath =3D os.path.join(bindir, base)
> -        try:
> -            os.symlink(f, newpath)
> -        except OSError as exc:
> -            if exc.errno =3D=3D errno.EEXIST:
> -                break
> -            bb.fatal("Unable to populate toolchain binary symlink for %s=
: %s" % (newpath, exc))
> -
> -require conf/distro/include/csl-versions.inc
> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta=
/recipes-core/meta/external-sourcery-toolchain.bb
> deleted file mode 100644
> index 41d86d6..0000000
> --- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
> +++ /dev/null
> @@ -1,149 +0,0 @@
> -require recipes-core/eglibc/eglibc-package.inc
> -
> -INHIBIT_DEFAULT_DEPS =3D "1"
> -
> -# License applies to this recipe code, not the toolchain itself
> -SUMMARY =3D "External Sourcery G++ toolchain"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d799439710928=
5ec7b81fdeb3b58 \
> -                    file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
> -
> -PROVIDES +=3D "\
> -	linux-libc-headers \
> -	virtual/${TARGET_PREFIX}gcc \
> -	virtual/${TARGET_PREFIX}g++ \
> -	virtual/${TARGET_PREFIX}gcc-initial \
> -	virtual/${TARGET_PREFIX}gcc-intermediate \
> -	virtual/${TARGET_PREFIX}binutils \
> -	virtual/${TARGET_PREFIX}libc-for-gcc \
> -	virtual/${TARGET_PREFIX}libc-initial \
> -	virtual/${TARGET_PREFIX}compilerlibs \
> -	virtual/libc \
> -	virtual/libintl \
> -	virtual/libiconv \
> -	glibc-thread-db \
> -	libgcc \
> -	eglibc \
> -	virtual/linux-libc-headers \
> -"
> -PV =3D "${CSL_VER_MAIN}"
> -PR =3D "r7"
> -
> -#SRC_URI =3D "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TAR=
GET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
> -
> -SRC_URI =3D "file://SUPPORTED"
> -
> -do_install() {
> -	# Use optimized files if available
> -	sysroot=3D"${EXTERNAL_TOOLCHAIN_SYSROOT}"
> -
> -	cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
> -	cp -a $sysroot/etc/. ${D}${sysconfdir}
> -	cp -a $sysroot/sbin/. ${D}${base_sbindir}
> -
> -	install -d ${D}/usr
> -	for usr_element in bin libexec sbin share ${base_libdir}; do
> -		usr_path=3D$sysroot/usr/$usr_element
> -		cp -a $usr_path ${D}/usr/
> -	done
> -	for datadir_element in man info; do
> -		datadir_path=3D$sysroot/usr/$datadir_element
> -		if [ -e $datadir_path ]; then
> -			cp -a $datadir_path ${D}${datadir}/
> -		fi
> -	done
> -
> -	# Some toolchains have headers under the core specific area
> -	if [ -e $sysroot/usr/include ]; then
> -		cp -a $sysroot/usr/include/. ${D}${includedir}
> -	else
> -		cp -a $sysroot/../usr/include/. ${D}${includedir}
> -	fi
> -
> -	rm ${D}${sysconfdir}/rpc
> -	rm -r ${D}${datadir}/zoneinfo
> -
> -	mv ${D}${libdir}/bin/* ${D}${bindir}/
> -	if [ -e ${D}${libdir}/bin/.debug ]; then
> -		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
> -	fi
> -	ln -s ../../bin/gdbserver ${D}${libdir}/bin/sysroot-gdbserver
> -
> -	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/=
ubi-user.h
> -        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${li=
bdir}# .#g" ${D}${libdir}/libc.so
> -        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${li=
bdir}# .#g" ${D}${libdir}/libpthread.so
> -}
> -
> -SYSROOT_PREPROCESS_FUNCS +=3D "external_toolchain_sysroot_adjust"
> -external_toolchain_sysroot_adjust() {
> -	dest_sysroot=3D"$(${CC} -print-sysroot | sed -e's,^${STAGING_DIR_HOST},=
,; s,/$,,')"
> -	if [ -n "$dest_sysroot" ]; then
> -		rm -f ${SYSROOT_DESTDIR}/$dest_sysroot
> -		ln -s . ${SYSROOT_DESTDIR}/$dest_sysroot
> -	fi
> -
> -	# If the usr/lib directory doesn't exist, the toolchain fails to even
> -	# try to find crti.o in a completely different directory (usr/lib64)
> -	install -d ${SYSROOT_DESTDIR}/usr/lib
> -}
> -
> -PACKAGES =3D+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-stati=
cdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
> -
> -# This test should be fixed to ignore .a files in .debug dirs
> -INSANE_SKIP_${PN}-dbg =3D "staticdev"
> -
> -# We don't care about GNU_HASH in prebuilt binaries
> -INSANE_SKIP_${PN}-utils +=3D "ldflags"
> -INSANE_SKIP_libstdc++ +=3D "ldflags"
> -INSANE_SKIP_libgcc +=3D "ldflags"
> -INSANE_SKIP_gdbserver +=3D "ldflags"
> -
> -PKG_${PN} =3D "eglibc"
> -PKG_${PN}-dev =3D "eglibc-dev"
> -PKG_${PN}-staticdev =3D "eglibc-staticdev"
> -PKG_${PN}-doc =3D "eglibc-doc"
> -PKG_${PN}-dbg =3D "eglibc-dbg"
> -PKG_${PN}-pic =3D "eglibc-pic"
> -PKG_${PN}-utils =3D "eglibc-utils"
> -PKG_${PN}-gconv =3D "eglibc-gconv"
> -PKG_${PN}-extra-nss =3D "eglibc-extra-nss"
> -PKG_${PN}-thread-db =3D "eglibc-thread-db"
> -PKG_${PN}-pcprofile =3D "eglibc-pcprofile"
> -
> -PKGV =3D "${CSL_VER_LIBC}"
> -PKGV_libgcc =3D "${CSL_VER_GCC}"
> -PKGV_libgcc-dev =3D "${CSL_VER_GCC}"
> -PKGV_libstdc++ =3D "${CSL_VER_GCC}"
> -PKGV_libstdc++-dev =3D "${CSL_VER_GCC}"
> -PKGV_libstdc++-staticdev =3D "${CSL_VER_GCC}"
> -PKGV_linux-libc-headers =3D "${CSL_VER_KERNEL}"
> -PKGV_linux-libc-headers-dev =3D "${CSL_VER_KERNEL}"
> -PKGV_gdbserver =3D "${CSL_VER_GDB}"
> -PKGV_gdbserver-dbg =3D "${CSL_VER_GDB}"
> -
> -FILES_libgcc =3D "${base_libdir}/libgcc_s.so.1"
> -FILES_libgcc-dev =3D "${base_libdir}/libgcc_s.so"
> -FILES_libstdc++ =3D "${libdir}/libstdc++.so.*"
> -FILES_libstdc++-dev =3D "${includedir}/c++/${PV} \
> -	${libdir}/libstdc++.so \
> -	${libdir}/libstdc++.la \
> -	${libdir}/libsupc++.la"
> -FILES_libstdc++-staticdev =3D "${libdir}/libstdc++.a ${libdir}/libsupc++=
=2Ea"
> -FILES_linux-libc-headers =3D "${includedir}/asm* \
> -	${includedir}/linux \
> -	${includedir}/mtd \
> -	${includedir}/rdma \
> -	${includedir}/scsi \
> -	${includedir}/sound \
> -	${includedir}/video \
> -"
> -FILES_gdbserver =3D "${bindir}/gdbserver ${libdir}/bin/sysroot-gdbserver"
> -FILES_gdbserver-dbg =3D "${bindir}/.debug/gdbserver"
> -
> -CSL_VER_MAIN ??=3D ""
> -
> -python () {
> -    if not d.getVar("CSL_VER_MAIN"):
> -        raise bb.parse.SkipPackage("External CSL toolchain not configure=
d (CSL_VER_MAIN not set).")
> -}
> -
> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED=
 b/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED
> deleted file mode 100644
> index 3f74688..0000000
> --- a/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED
> +++ /dev/null
> @@ -1,257 +0,0 @@
> -aa_DJ ISO-8859-1
> -aa_ER UTF-8
> -aa_ER@saaho UTF-8
> -aa_ET UTF-8
> -af_ZA ISO-8859-1
> -am_ET UTF-8
> -an_ES ISO-8859-15
> -ar_AE ISO-8859-6
> -ar_BH ISO-8859-6
> -ar_DZ ISO-8859-6
> -ar_EG ISO-8859-6
> -ar_IN UTF-8
> -ar_IQ ISO-8859-6
> -ar_JO ISO-8859-6
> -ar_KW ISO-8859-6
> -ar_LB ISO-8859-6
> -ar_LY ISO-8859-6
> -ar_MA ISO-8859-6
> -ar_OM ISO-8859-6
> -ar_QA ISO-8859-6
> -ar_SA ISO-8859-6
> -ar_SD ISO-8859-6
> -ar_SY ISO-8859-6
> -ar_TN ISO-8859-6
> -ar_YE ISO-8859-6
> -ast_ES ISO-8859-15
> -be_BY CP1251
> -be_BY@latin UTF-8
> -ber_DZ UTF-8
> -ber_MA UTF-8
> -bg_BG CP1251
> -bn_BD UTF-8
> -bn_IN UTF-8
> -bo_CN UTF-8
> -bo_IN UTF-8
> -br_FR ISO-8859-1
> -br_FR@euro ISO-8859-15
> -bs_BA ISO-8859-2
> -byn_ER UTF-8
> -ca_AD ISO-8859-15
> -ca_ES ISO-8859-1
> -ca_ES@euro ISO-8859-15
> -ca_FR ISO-8859-15
> -ca_IT ISO-8859-15
> -crh_UA UTF-8
> -cs_CZ ISO-8859-2
> -csb_PL UTF-8
> -cy_GB ISO-8859-14
> -da_DK ISO-8859-1
> -de_AT ISO-8859-1
> -de_AT@euro ISO-8859-15
> -de_BE ISO-8859-1
> -de_BE@euro ISO-8859-15
> -de_CH ISO-8859-1
> -de_DE ISO-8859-1
> -de_DE@euro ISO-8859-15
> -de_LU ISO-8859-1
> -de_LU@euro ISO-8859-15
> -dv_MV UTF-8
> -dz_BT UTF-8
> -el_GR ISO-8859-7
> -el_CY ISO-8859-7
> -en_AG UTF-8
> -en_AU ISO-8859-1
> -en_BW ISO-8859-1
> -en_CA ISO-8859-1
> -en_DK ISO-8859-1
> -en_GB ISO-8859-1
> -en_HK ISO-8859-1
> -en_IE ISO-8859-1
> -en_IE@euro ISO-8859-15
> -en_IN UTF-8
> -en_NG UTF-8
> -en_NZ ISO-8859-1
> -en_PH ISO-8859-1
> -en_SG ISO-8859-1
> -en_US ISO-8859-1
> -en_ZA ISO-8859-1
> -en_ZW ISO-8859-1
> -es_AR ISO-8859-1
> -es_BO ISO-8859-1
> -es_CL ISO-8859-1
> -es_CO ISO-8859-1
> -es_DO ISO-8859-1
> -es_EC ISO-8859-1
> -es_ES ISO-8859-1
> -es_ES@euro ISO-8859-15
> -es_GT ISO-8859-1
> -es_HN ISO-8859-1
> -es_MX ISO-8859-1
> -es_NI ISO-8859-1
> -es_PA ISO-8859-1
> -es_PE ISO-8859-1
> -es_PR ISO-8859-1
> -es_PY ISO-8859-1
> -es_SV ISO-8859-1
> -es_US ISO-8859-1
> -es_UY ISO-8859-1
> -es_VE ISO-8859-1
> -et_EE ISO-8859-1
> -eu_ES ISO-8859-1
> -eu_ES@euro ISO-8859-15
> -fa_IR UTF-8
> -fi_FI ISO-8859-1
> -fi_FI@euro ISO-8859-15
> -fil_PH UTF-8
> -fo_FO ISO-8859-1
> -fr_BE ISO-8859-1
> -fr_BE@euro ISO-8859-15
> -fr_CA ISO-8859-1
> -fr_CH ISO-8859-1
> -fr_FR ISO-8859-1
> -fr_FR@euro ISO-8859-15
> -fr_LU ISO-8859-1
> -fr_LU@euro ISO-8859-15
> -fur_IT UTF-8
> -fy_NL UTF-8
> -fy_DE UTF-8
> -ga_IE ISO-8859-1
> -ga_IE@euro ISO-8859-15
> -gd_GB ISO-8859-15
> -gez_ER UTF-8
> -gez_ER@abegede UTF-8
> -gez_ET UTF-8
> -gez_ET@abegede UTF-8
> -gl_ES ISO-8859-1
> -gl_ES@euro ISO-8859-15
> -gu_IN UTF-8
> -gv_GB ISO-8859-1
> -ha_NG UTF-8
> -he_IL ISO-8859-8
> -hi_IN UTF-8
> -hne_IN UTF-8
> -hr_HR ISO-8859-2
> -hsb_DE ISO-8859-2
> -ht_HT UTF-8
> -hu_HU ISO-8859-2
> -hy_AM UTF-8
> -id_ID ISO-8859-1
> -ig_NG UTF-8
> -ik_CA UTF-8
> -is_IS ISO-8859-1
> -it_CH ISO-8859-1
> -it_IT ISO-8859-1
> -it_IT@euro ISO-8859-15
> -iu_CA UTF-8
> -iw_IL ISO-8859-8
> -ka_GE GEORGIAN-PS
> -kk_KZ PT154
> -kk_KZ RK1048
> -kl_GL ISO-8859-1
> -km_KH UTF-8
> -kn_IN UTF-8
> -ks_IN UTF-8
> -ks_IN@devanagari UTF-8
> -ku_TR ISO-8859-9
> -kw_GB ISO-8859-1
> -ky_KG UTF-8
> -lg_UG ISO-8859-10
> -li_BE UTF-8
> -li_NL UTF-8
> -lo_LA UTF-8
> -lt_LT ISO-8859-13
> -lv_LV ISO-8859-13
> -mai_IN UTF-8
> -mg_MG ISO-8859-15
> -mi_NZ ISO-8859-13
> -mk_MK ISO-8859-5
> -ml_IN UTF-8
> -mn_MN UTF-8
> -mr_IN UTF-8
> -ms_MY ISO-8859-1
> -mt_MT ISO-8859-3
> -my_MM UTF-8
> -nan_TW@latin UTF-8
> -nb_NO ISO-8859-1
> -nds_DE UTF-8
> -nds_NL UTF-8
> -ne_NP UTF-8
> -nl_AW UTF-8
> -nl_BE ISO-8859-1
> -nl_BE@euro ISO-8859-15
> -nl_NL ISO-8859-1
> -nl_NL@euro ISO-8859-15
> -nn_NO ISO-8859-1
> -nr_ZA UTF-8
> -nso_ZA UTF-8
> -oc_FR ISO-8859-1
> -om_ET UTF-8
> -om_KE ISO-8859-1
> -or_IN UTF-8
> -pa_IN UTF-8
> -pa_PK UTF-8
> -pap_AN UTF-8
> -pl_PL ISO-8859-2
> -ps_AF UTF-8
> -pt_BR ISO-8859-1
> -pt_PT ISO-8859-1
> -pt_PT@euro ISO-8859-15
> -ro_RO ISO-8859-2
> -ru_RU ISO-8859-5
> -ru_UA KOI8-U
> -rw_RW UTF-8
> -sa_IN UTF-8
> -sc_IT UTF-8
> -sd_IN UTF-8
> -sd_IN@devanagari UTF-8
> -se_NO UTF-8
> -shs_CA UTF-8
> -si_LK UTF-8
> -sid_ET UTF-8
> -sk_SK ISO-8859-2
> -sl_SI ISO-8859-2
> -so_DJ ISO-8859-1
> -so_ET UTF-8
> -so_KE ISO-8859-1
> -so_SO ISO-8859-1
> -sq_AL ISO-8859-1
> -sr_ME UTF-8
> -sr_RS UTF-8
> -sr_RS@latin UTF-8
> -ss_ZA UTF-8
> -st_ZA ISO-8859-1
> -sv_FI ISO-8859-1
> -sv_FI@euro ISO-8859-15
> -sv_SE ISO-8859-1
> -ta_IN UTF-8
> -te_IN UTF-8
> -tg_TJ KOI8-T
> -th_TH TIS-620
> -ti_ER UTF-8
> -ti_ET UTF-8
> -tig_ER UTF-8
> -tk_TM UTF-8
> -tl_PH ISO-8859-1
> -tn_ZA UTF-8
> -tr_CY ISO-8859-9
> -tr_TR ISO-8859-9
> -ts_ZA UTF-8
> -ug_CN UTF-8
> -uk_UA KOI8-U
> -ur_PK UTF-8
> -uz_UZ ISO-8859-1
> -uz_UZ@cyrillic UTF-8
> -ve_ZA UTF-8
> -vi_VN UTF-8
> -wa_BE ISO-8859-1
> -wa_BE@euro ISO-8859-15
> -wo_SN UTF-8
> -xh_ZA ISO-8859-1
> -yi_US CP1255
> -yo_NG UTF-8
> -zh_CN GB2312
> -zh_HK BIG5-HKSCS
> -zh_SG GB2312
> -zh_TW BIG5
> -zu_ZA ISO-8859-1
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKpx9IACgkQN1Ujt2V2gByWYwCfQafdluNwTuc4TBw4l+iAutl+
/qEAoLaCqhAzPwLusnhYB7xVbyHfpeAB
=ENby
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
