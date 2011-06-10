Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QV9sZ-0000mx-7i
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 00:08:35 +0200
Received: by pzk36 with SMTP id 36so1513259pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 15:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Sb5VSf/jzseZMd+96U4Eab+bztrG4Avo8JeDa8SE6sY=;
	b=bGz8biP1PsphhcrBA27VMMK4qZhBZ7pmNt112ZNLVhMFPvFd3Ji+H8uvKJ9+BAvFrw
	7BvnyytC55yFBfDuGvTFUuxR+iT4IzHEF5E4n1QLB/qwy2tM6gd6veuabZPef0DvU7xR
	sNoSr6X/yqug0F/zlTLiQQv0LgqrrUWmBSAMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=e9qEOW6wioJutsbG+dIxHlCCsGV7t38I3BxMhx+RB5eJQfFasXicsb8MXi/YLFIggJ
	Bm9ySNhigEngG0Yh2tfB3TBYbGgc0iRktdk8nMkuedXN3Ehjn89QmeUrjtiMsYhcmQby
	DcgOU/7AjV2wLNKBOcrAp9GYpSkmEbWtYqSgc=
Received: by 10.68.15.138 with SMTP id x10mr1187760pbc.437.1307743512268;
	Fri, 10 Jun 2011 15:05:12 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y2sm2637198pbi.19.2011.06.10.15.05.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 15:05:10 -0700 (PDT)
Date: Fri, 10 Jun 2011 15:04:47 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110610220447.GA19998@sakrah.homelinux.org>
References: <cover.1307686598.git.sgw@linux.intel.com>
	<79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [CONSOLIDATED PULL 4/4] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 22:08:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (09/06/11 23:26), Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++++-
>  .../wireless-tools/wireless-tools_29.bb            |    9 +++++--
>  meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++--
>  meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
>  meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++++------
>  meta/recipes-core/glibc/glibc-package.inc          |    9 +++++--
>  meta/recipes-core/glibc/glibc_2.10.1.bb            |    2 +-
>  .../meta/external-csl-toolchain_2008q3-72.bb       |    8 ++++--
>  meta/recipes-core/uclibc/uclibc.inc                |   10 +++++--
>  meta/recipes-core/udev/udev-new.inc                |   14 ++++++++---
>  meta/recipes-core/udev/udev_164.bb                 |    2 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   11 +++++++-
>  meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
>  meta/recipes-devtools/binutils/binutils.inc        |    1 -
>  meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    2 +-
>  meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   24 ++++++++++++++-----
>  meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |    2 +-
>  meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 ++++--
>  meta/recipes-devtools/opkg/opkg_svn.bb             |    8 ++++--
>  meta/recipes-devtools/python/python_2.6.6.bb       |    2 -
>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 ++++++++------
>  meta/recipes-extended/augeas/augeas.inc            |    4 ++-
>  meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
>  meta/recipes-extended/gamin/gamin_0.1.10.bb        |    9 ++++---
>  .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++++--
>  meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 ++++---
>  meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +----
>  meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    5 ++-
>  meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
>  meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
>  meta/recipes-support/attr/ea-acl.inc               |    8 ++++--
>  meta/recipes-support/curl/curl_7.21.6.bb           |    8 ++++--
>  meta/recipes-support/sqlite/sqlite3.inc            |    7 +++--
>  meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
>  34 files changed, 146 insertions(+), 93 deletions(-)
> 
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
> index 4e6d4e1..f2bbe99 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  DEPENDS = "zlib"
>  RDEPENDS_${PN} = "${PN}-ids"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
>             file://configure.patch \
> @@ -49,9 +49,12 @@ do_install () {
>  	ln -s ../sbin/lspci ${D}${bindir}/lspci
>  }
>  
> -PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg"
> +PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg libpci-staticdev"
>  FILES_pciutils-ids = "${datadir}/pci.ids*"
>  FILES_libpci = "${libdir}/libpci.so.*"
>  FILES_libpci-dbg = "${libdir}/.debug"
>  FILES_libpci-dev = "${libdir}/libpci.a ${libdir}/libpci.la ${libdir}/libpci.so \
>                      ${includedir}/pci ${libdir}/pkgconfig"
> +FILES_libpci-staticdev = "${libdir}/libpci.a"
> +DEPENDS_libpci-staticdev = "libpci-dev (= ${EXTENDPKGV})"
> +
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> index 70bf91b..d5b0f98 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  SECTION = "base"
>  PRIORITY = "optional"
>  PE = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
>             file://man.patch;apply=yes \
> @@ -41,14 +41,17 @@ do_install() {
>  }
>  
>  PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
> -libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
> +libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc ifrename ${PN} ${PN}-doc"
>  
>  FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
>  FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
>  FILES_libiw = "${libdir}/*.so.*"
> -FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
> +FILES_libiw-dev = "${libdir}/*.so ${includedir}"
>  FILES_libiw-doc = "${mandir}/man7"
> +FILES_libiw-staticdev = "${libdir}/*.a"
> +RDEPENDS_libiw-staticdev = "libiw-dev (= ${EXTENDPKGV})"
>  FILES_ifrename = "${sbindir}/ifrename"
>  FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
>  FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
>  FILES_${PN}-doc = "${mandir}"
> +
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 76ebdc3..dca7614 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -37,7 +37,7 @@ USE_LDCONFIG ?= "1"
>  PKGSUFFIX = ""
>  PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
>  
> -PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
> +PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev ${PN}-staticdev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
>  
>  PACKAGES_DYNAMIC = " \
>  		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* \
> @@ -73,6 +73,7 @@ RPROVIDES_eglibc-locale = "glibc-locale"
>  RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
>  RPROVIDES_eglibc-thread-db = "glibc-thread-db"
>  RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
> +RPROVIDES_eglibc-staticdev = "glibc-staticdev"
>  RPROVIDES_eglibc-dbg = "glibc-dbg"
>  libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>  
> @@ -84,8 +85,9 @@ FILES_libmemusage = "${base_libdir}/libmemusage.so"
>  FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
>  FILES_sln = "/sbin/sln"
>  FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
> -FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
> -	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> +FILES_eglibc-dev_append += "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal"
> +FILES_eglibc-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
> +RDEPENDS_eglibc-staticdev = "eglibc-dev (= ${EXTENDPKGV})"
>  FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
>  FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
>  FILES_eglibc-gconv = "${libdir}/gconv/*"
> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
> index e69cd0f..fc2811c 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
> @@ -2,7 +2,7 @@ require eglibc.inc
>  
>  DEPENDS += "gperf-native"
>  FILESPATHPKG =. "eglibc-svn:"
> -PR = "r14"
> +PR = "r15"
>  
>  SRCREV = "11982"
>  
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index 5f5f164..923880f 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>  
> -PR = "r0"
> +PR = "r1"
>  DEPENDS = "gettext-native virtual/libiconv ncurses expat git-native"
>  DEPENDS_virtclass-native = "git-native"
>  PROVIDES = "virtual/libintl virtual/gettext"
> @@ -50,7 +50,7 @@ acpaths = '-I ${S}/gettext-runtime/m4 \
>  # 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
>  # 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
>  # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
> -PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
> +PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-staticdev gettext-runtime-doc"
>  
>  FILES_gettext-runtime = "${bindir}/gettext \
>                           ${bindir}/ngettext \
> @@ -62,12 +62,12 @@ FILES_gettext-runtime = "${bindir}/gettext \
>  FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
>                                               ${libdir}/charset.alias \
>                                             "
> -FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
> -                      ${includedir}/autosprintf.h \
> -                     "
> -FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
> -                                                 ${includedir}/libintl.h \
> -                                               "
> +FILES_gettext-runtime-dev += "${includedir}/autosprintf.h"
> +FILES_gettext-runtime-staticdev = "${libdir}/libasprintf.a"
> +FILES_gettext-runtime-dev_append_libc-uclibc = " ${includedir}/libintl.h"
> +FILES_gettext-runtime-staticdev_append_libc-uclibc = " ${libdir}/libintl.a"
> +RDEPENDS_gettext-runtime-staticdev = "gettext-runtime-dev (= ${EXTENDPKGV})"
> +
>  FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
>                               ${mandir}/man1/ngettext.* \
>                               ${mandir}/man1/envsubst.* \
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index 27dc427..b6b033d 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -37,7 +37,7 @@ PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
>  PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} \
>  	ldd${PKGSUFFIX} localedef${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
>  	${PN}-locale libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
> -	${PN}-pcprofile"
> +	${PN}-pcprofile ${PN}-staticdev"
>  
>  PACKAGES_DYNAMIC = "glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* locale-base-* \
>  	glibc-binary-localedata-*"
> @@ -57,8 +57,9 @@ glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
>                    ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
>                    ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
>  glibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> -                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
> +                ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.o ${datadir}/aclocal"
> +
> +glibcstaticdev = "${libdir}/*.a ${base_libdir}/*.a"
>  
>  FILES_glibc = "${glibcfiles}"
>  FILES_${PN} = "${glibcfiles}"
> @@ -68,6 +69,8 @@ FILES_glibc-extra-nss = "${base_libdir}/libnss*"
>  FILES_sln = "${base_sbindir}/sln"
>  FILES_glibc-dev = "${glibcdevfiles}"
>  FILES_${PN}-dev = "${glibcdevfiles}"
> +FILES_glibc-staticdev = "${glibcstaticdev}"
> +FILES_${PN}-staticdev = "${glibcstaticdev}"
>  FILES_glibc-dbg = "${glibcdbgfiles}"
>  FILES_${PN}-dbg = "${glibcdbgfiles}"
>  FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
> diff --git a/meta/recipes-core/glibc/glibc_2.10.1.bb b/meta/recipes-core/glibc/glibc_2.10.1.bb
> index 33ebe24..e76f3c0 100644
> --- a/meta/recipes-core/glibc/glibc_2.10.1.bb
> +++ b/meta/recipes-core/glibc/glibc_2.10.1.bb
> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
>  PACKAGES_DYNAMIC = "libc6*"
>  RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  # the -isystem in bitbake.conf screws up glibc do_stage
>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> index f714928..99988d3 100644
> --- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> +++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
> @@ -18,7 +18,7 @@ PROVIDES = "\
>  	virtual/linux-libc-headers "
>  RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
>  PACKAGES_DYNAMIC = "glibc-gconv-*"
> -PR = "r1"
> +PR = "r2"
>  
>  #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
>  
> @@ -42,16 +42,18 @@ GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
>  
>  inherit libc-package
>  
> -PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers"
> +PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers"
>  FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
>  FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
>  FILES_libstdc++ = "${libdir}/libstdc++.so.*"
>  FILES_libstdc++-dev = "${includedir}/c++/${PV} \
>  	${libdir}/libstdc++.so \
>  	${libdir}/libstdc++.la \
> +	${libdir}/libsupc++.la"
> +FILES_libstdc++-staticdev = " \
>  	${libdir}/libstdc++.a \
> -	${libdir}/libsupc++.la \
>  	${libdir}/libsupc++.a"
> +RDEPENDS_libstdc++-staticdev = "libstdc++-dev ( = ${EXTENDPKGV})"
>  FILES_linux-libc-headers = "${includedir}/asm* \
>  	${includedir}/linux \
>  	${includedir}/mtd \
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
> index c1bc422..9c59084 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -14,7 +14,7 @@ PRIORITY = "required"
>  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>  		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
>  file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
> -INC_PR = "r2"
> +INC_PR = "r3"
>  
>  require uclibc-config.inc
>  STAGINGCC = "gcc-cross-intermediate"
> @@ -82,12 +82,16 @@ FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
>  FILES_ldd = "${bindir}/ldd"
>  FILES_uclibc-dev_append = "\
>          ${libdir}/lib*.so \
> -        ${libdir}/*_nonshared.a \
>          ${libdir}/[S]*crt[1in].o \
>          ${libdir}/crtreloc*.o \
> -        ${libdir}/lib*.a \
>          ${includedir}/*.h ${includedir}/*/*.h \
>         "
> +
> +FILES_uclibc-staticdev_append = "\
> +        ${libdir}/*_nonshared.a \
> +        ${libdir}/lib*.a \
> +       "
> +


Will -dev packages pull in -staticdev automatically ?
if not then above change will break shared development package
since *_nonshared.a are needed even when linking shared objects

-Khem




