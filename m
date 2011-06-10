Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUvER-0001Sp-Vx
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 08:30:12 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2011 23:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="12490532"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 23:26:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 23:26:16 -0700
Message-Id: <79966738c56b3d8dbcb262642447f9efe7af930a.1307686610.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307686598.git.sgw@linux.intel.com>
References: <cover.1307686598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307686598.git.sgw@linux.intel.com>
References: <cover.1307686598.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 4/4] multiple recipes converted to -staticdev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 06:30:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++++-
 .../wireless-tools/wireless-tools_29.bb            |    9 +++++--
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++--
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++++------
 meta/recipes-core/glibc/glibc-package.inc          |    9 +++++--
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    2 +-
 .../meta/external-csl-toolchain_2008q3-72.bb       |    8 ++++--
 meta/recipes-core/uclibc/uclibc.inc                |   10 +++++--
 meta/recipes-core/udev/udev-new.inc                |   14 ++++++++---
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   11 +++++++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    1 -
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   24 ++++++++++++++-----
 meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |    2 +-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 ++++--
 meta/recipes-devtools/opkg/opkg_svn.bb             |    8 ++++--
 meta/recipes-devtools/python/python_2.6.6.bb       |    2 -
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 ++++++++------
 meta/recipes-extended/augeas/augeas.inc            |    4 ++-
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |    9 ++++---
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++++--
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 ++++---
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +----
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    5 ++-
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |    8 ++++--
 meta/recipes-support/curl/curl_7.21.6.bb           |    8 ++++--
 meta/recipes-support/sqlite/sqlite3.inc            |    7 +++--
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
 34 files changed, 146 insertions(+), 93 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
index 4e6d4e1..f2bbe99 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib"
 RDEPENDS_${PN} = "${PN}-ids"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
@@ -49,9 +49,12 @@ do_install () {
 	ln -s ../sbin/lspci ${D}${bindir}/lspci
 }
 
-PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg"
+PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg libpci-staticdev"
 FILES_pciutils-ids = "${datadir}/pci.ids*"
 FILES_libpci = "${libdir}/libpci.so.*"
 FILES_libpci-dbg = "${libdir}/.debug"
 FILES_libpci-dev = "${libdir}/libpci.a ${libdir}/libpci.la ${libdir}/libpci.so \
                     ${includedir}/pci ${libdir}/pkgconfig"
+FILES_libpci-staticdev = "${libdir}/libpci.a"
+DEPENDS_libpci-staticdev = "libpci-dev (= ${EXTENDPKGV})"
+
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index 70bf91b..d5b0f98 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "base"
 PRIORITY = "optional"
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
            file://man.patch;apply=yes \
@@ -41,14 +41,17 @@ do_install() {
 }
 
 PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
-libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
+libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc ifrename ${PN} ${PN}-doc"
 
 FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
 FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
 FILES_libiw = "${libdir}/*.so.*"
-FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
+FILES_libiw-dev = "${libdir}/*.so ${includedir}"
 FILES_libiw-doc = "${mandir}/man7"
+FILES_libiw-staticdev = "${libdir}/*.a"
+RDEPENDS_libiw-staticdev = "libiw-dev (= ${EXTENDPKGV})"
 FILES_ifrename = "${sbindir}/ifrename"
 FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
 FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
 FILES_${PN}-doc = "${mandir}"
+
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 76ebdc3..dca7614 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -37,7 +37,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev ${PN}-staticdev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
 
 PACKAGES_DYNAMIC = " \
 		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* \
@@ -73,6 +73,7 @@ RPROVIDES_eglibc-locale = "glibc-locale"
 RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
 RPROVIDES_eglibc-thread-db = "glibc-thread-db"
 RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
+RPROVIDES_eglibc-staticdev = "glibc-staticdev"
 RPROVIDES_eglibc-dbg = "glibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
@@ -84,8 +85,9 @@ FILES_libmemusage = "${base_libdir}/libmemusage.so"
 FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
 FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
-FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
-	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES_eglibc-dev_append += "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal"
+FILES_eglibc-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
+RDEPENDS_eglibc-staticdev = "eglibc-dev (= ${EXTENDPKGV})"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_eglibc-gconv = "${libdir}/gconv/*"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index e69cd0f..fc2811c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -2,7 +2,7 @@ require eglibc.inc
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-PR = "r14"
+PR = "r15"
 
 SRCREV = "11982"
 
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 5f5f164..923880f 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
+PR = "r1"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat git-native"
 DEPENDS_virtclass-native = "git-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -50,7 +50,7 @@ acpaths = '-I ${S}/gettext-runtime/m4 \
 # 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
 # 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
-PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
+PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-staticdev gettext-runtime-doc"
 
 FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
@@ -62,12 +62,12 @@ FILES_gettext-runtime = "${bindir}/gettext \
 FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
                                              ${libdir}/charset.alias \
                                            "
-FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
-                      ${includedir}/autosprintf.h \
-                     "
-FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
-                                                 ${includedir}/libintl.h \
-                                               "
+FILES_gettext-runtime-dev += "${includedir}/autosprintf.h"
+FILES_gettext-runtime-staticdev = "${libdir}/libasprintf.a"
+FILES_gettext-runtime-dev_append_libc-uclibc = " ${includedir}/libintl.h"
+FILES_gettext-runtime-staticdev_append_libc-uclibc = " ${libdir}/libintl.a"
+RDEPENDS_gettext-runtime-staticdev = "gettext-runtime-dev (= ${EXTENDPKGV})"
+
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${mandir}/man1/ngettext.* \
                              ${mandir}/man1/envsubst.* \
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 27dc427..b6b033d 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -37,7 +37,7 @@ PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} \
 	ldd${PKGSUFFIX} localedef${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
 	${PN}-locale libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
-	${PN}-pcprofile"
+	${PN}-pcprofile ${PN}-staticdev"
 
 PACKAGES_DYNAMIC = "glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* locale-base-* \
 	glibc-binary-localedata-*"
@@ -57,8 +57,9 @@ glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
                   ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
 glibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+                ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.o ${datadir}/aclocal"
+
+glibcstaticdev = "${libdir}/*.a ${base_libdir}/*.a"
 
 FILES_glibc = "${glibcfiles}"
 FILES_${PN} = "${glibcfiles}"
@@ -68,6 +69,8 @@ FILES_glibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_glibc-dev = "${glibcdevfiles}"
 FILES_${PN}-dev = "${glibcdevfiles}"
+FILES_glibc-staticdev = "${glibcstaticdev}"
+FILES_${PN}-staticdev = "${glibcstaticdev}"
 FILES_glibc-dbg = "${glibcdbgfiles}"
 FILES_${PN}-dbg = "${glibcdbgfiles}"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
diff --git a/meta/recipes-core/glibc/glibc_2.10.1.bb b/meta/recipes-core/glibc/glibc_2.10.1.bb
index 33ebe24..e76f3c0 100644
--- a/meta/recipes-core/glibc/glibc_2.10.1.bb
+++ b/meta/recipes-core/glibc/glibc_2.10.1.bb
@@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
 
-PR = "r6"
+PR = "r7"
 
 # the -isystem in bitbake.conf screws up glibc do_stage
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
index f714928..99988d3 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
@@ -18,7 +18,7 @@ PROVIDES = "\
 	virtual/linux-libc-headers "
 RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-PR = "r1"
+PR = "r2"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
 
@@ -42,16 +42,18 @@ GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
 
 inherit libc-package
 
-PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers"
+PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers"
 FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
 FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "${includedir}/c++/${PV} \
 	${libdir}/libstdc++.so \
 	${libdir}/libstdc++.la \
+	${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = " \
 	${libdir}/libstdc++.a \
-	${libdir}/libsupc++.la \
 	${libdir}/libsupc++.a"
+RDEPENDS_libstdc++-staticdev = "libstdc++-dev ( = ${EXTENDPKGV})"
 FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/linux \
 	${includedir}/mtd \
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c1bc422..9c59084 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -14,7 +14,7 @@ PRIORITY = "required"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r2"
+INC_PR = "r3"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -82,12 +82,16 @@ FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
 FILES_ldd = "${bindir}/ldd"
 FILES_uclibc-dev_append = "\
         ${libdir}/lib*.so \
-        ${libdir}/*_nonshared.a \
         ${libdir}/[S]*crt[1in].o \
         ${libdir}/crtreloc*.o \
-        ${libdir}/lib*.a \
         ${includedir}/*.h ${includedir}/*/*.h \
        "
+
+FILES_uclibc-staticdev_append = "\
+        ${libdir}/*_nonshared.a \
+        ${libdir}/lib*.a \
+       "
+
 FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 1b94f1b..7492bc4 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
+INC_PR = "r3"
+
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils linux-libc-headers gperf-native libxslt-native"
 RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
@@ -35,8 +37,8 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
-PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
-PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
+PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg libudev-staticdev"
+PACKAGES =+ "libgudev libgudev-dev libgudev-dbg libgudev-staticdev"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
@@ -50,11 +52,15 @@ FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
 FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
-                     ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
+                     ${libdir}/pkgconfig/libudev.pc"
+FILES_libudev-staticdev = "${libdir}/libudev.a"
+RDEPENDS_libudev-staticdev = "libudev-dev (= ${EXTENDPKGV})"
 FILES_libgudev = "${libdir}/libgudev*.so.*"
 FILES_libgudev-dbg = "${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
-                     ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
+                     ${libdir}/pkgconfig/gudev*.pc"
+FILES_libgudev-staticdev = "${libdir}/libgudev.a"
+RDEPENDS_libgudev-staticdev = "libgudev-dev (= ${EXTENDPKGV})"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
 
 do_install_append () {
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 76fd907..bee0bad 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b77266a..ed4bcdb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f
                     file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
                     file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
+INC_PR = "r0"
+
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native = " lzo-native"
@@ -28,7 +30,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
+             util-linux-libblkid-dev util-linux-libblkid-staticdev \
+             util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-staticdev \
              util-linux-uuidgen util-linux-lscpu"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
@@ -50,8 +53,12 @@ FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.a ${libdir}/libblkid.la ${includedir}/blkid"
+FILES_util-linux-libblkid-staticdev = "${libdir}/libblkid.a"
+RDEPENDS_util-linux-libblkid-staticdev = "util-linux-libblkid-dev (= ${EXTENDPKGV})"
 FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
+FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
+FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.a"
+RDEPENDS_util-linux-libuuid-staticdev = "util-linux-libuuid-dev (= ${EXTENDPKGV})"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 132f28b..3c5747c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r1"
+PR = "${INC_PR}.0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 08c14b2..82d9511 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -24,7 +24,6 @@ FILES_${PN} = " \
 
 FILES_${PN}-dev = " \
 	${includedir} \
-	${libdir}/*.a \
 	${libdir}/*.la \
 	${libdir}/libbfd.so \
 	${libdir}/libopcodes.so"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
index cb9eb8e..5db6fda 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -7,7 +7,7 @@ require gcc-common.inc
 
 require gcc-4_6-branch-backports.inc
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS =+ "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 51483f9..0109518 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -3,14 +3,19 @@ PACKAGES = "\
   libstdc++ \
   libstdc++-precompile-dev \
   libstdc++-dev \
+  libstdc++-staticdev \
   libg2c \
   libg2c-dev \
+  libg2c-staticdev \
   libssp \
   libssp-dev \
+  libssp-staticdev \
   libgfortran \
   libgfortran-dev \
+  libgfortran-staticdev \
   libmudflap \
   libmudflap-dev \
+  libmudflap-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -23,36 +28,41 @@ FILES_${PN}-dbg += "\
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
 FILES_libg2c-dev = "\
   ${libdir}/libg2c.so \
+FILES_libg2c-staticdev = "\
   ${libdir}/libg2c.a \
   ${libdir}/libfrtbegin.a"
-
+DEPENDS_libg2c-staticdev = "libg2c-dev (= ${EXTENDPKGV})"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "\
   ${includedir}/c++/ \
   ${libdir}/libstdc++.so \
   ${libdir}/libstdc++.la \
-  ${libdir}/libstdc++.a \
   ${libdir}/libsupc++.la \
+FILES_libstdc++-staticdev = " \
+  ${libdir}/libstdc++.a \
   ${libdir}/libsupc++.a"
+DEPENDS_libstdc++-staticdev = "libstdc++-dev (= ${EXTENDPKGV})"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
 
 FILES_libssp = "${libdir}/libssp.so.*"
 FILES_libssp-dev = " \
   ${libdir}/libssp*.so \
-  ${libdir}/libssp*.a \
   ${libdir}/libssp*.la \
   ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
+FILES_libssp-staticdev = "${libdir}/libssp*.a"
+DEPENDS_libssp-staticdev = "libssp-dev (= ${EXTENDPKGV})"
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = " \
+FILES_libgfortran-dev = "${libdir}/libgfortran.so"
+FILES_libgfortran-staticdev = " \
   ${libdir}/libgfortran.a \
-  ${libdir}/libgfortran.so \
   ${libdir}/libgfortranbegin.a"
+DEPENDS_libfortran-staticdev = "libfortran-dev (= ${EXTENDPKGV})"
 
 FILES_libmudflap = "${libdir}/libmudflap*.so.*"
 FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap*.a \
   ${libdir}/libmudflap*.la"
-
+FILES_libmudflap-staticdev = "${libdir}/libmudflap*.a"
+DEPENDS_libmudflap-staticdev = "libmudflap-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.0.bb b/meta/recipes-devtools/gcc/libgcc_4.6.0.bb
index b6cf268..3f7ce0a 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.0.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.0.bb
@@ -1,6 +1,6 @@
 require gcc-${PV}.inc
 
-PR = "r0"
+PR = "r1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
index 18cf042..710a61f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
@@ -13,13 +13,15 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://headerfix.patch \
 "
 
-PR = "r4"
+PR = "r5"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
 FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
+RDEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
 
 # We need to create the lock directory
 do_install_append() {
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5f07c17..934700f 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -17,12 +17,14 @@ S = "${WORKDIR}/trunk"
 
 SRCREV = "609"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
+DEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
 FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
 
 # We need to create the lock directory
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 24f1d33..db0e151 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -121,10 +121,8 @@ FILES_${PN}-dev = "\
   ${includedir} \
   ${libdir}/lib*${SOLIBSDEV} \
   ${libdir}/*.la \
-  ${libdir}/*.a \
   ${libdir}/*.o \
   ${libdir}/pkgconfig \
-  ${base_libdir}/*.a \
   ${base_libdir}/*.o \
   ${datadir}/aclocal \
   ${datadir}/pkgconfig \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 0c88f91..344c1a3 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r17"
+PR = "r18"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -166,7 +166,7 @@ EXTRA_OECONF = "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -301,26 +301,28 @@ FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
 		"
 
 FILE_${PN}-dev = "${includedir}/rpm \
-		${libdir}/librpm.a \
 		${libdir}/librpm.la \
 		${libdir}/librpm.so \
-		${libdir}/librpmconstant.a \
 		${libdir}/librpmconstant.la \
 		${libdir}/librpmconstant.so \
-		${libdir}/librpmdb.a \
 		${libdir}/librpmdb.la \
 		${libdir}/librpmdb.so \
-		${libdir}/librpmio.a \
 		${libdir}/librpmio.la \
 		${libdir}/librpmio.so \
-		${libdir}/librpmmisc.a \
 		${libdir}/librpmmisc.la \
 		${libdir}/librpmmisc.so \
-		${libdir}/librpmbuild.a \
 		${libdir}/librpmbuild.la \
 		${libdir}/librpmbuild.so \
 		${libdir}/pkgconfig/rpm.pc \
 		"
+FILE_${PN}-staticdev = " \
+		${libdir}/librpm.a \
+		${libdir}/librpmconstant.a \
+		${libdir}/librpmdb.a \
+		${libdir}/librpmio.a \
+		${libdir}/librpmmisc.a \
+		${libdir}/librpmbuild.a \
+                "
 
 ###%{_rpmhome}/lib/libxar.a
 ###%{_rpmhome}/lib/libxar.la
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 619cd20..8370340 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -15,8 +15,10 @@ PACKAGES =+ "${PN}-lenses lib${PN} lib${PN}-dev lib${PN}-dbg"
 
 FILES_${PN}-lenses = "${datadir}/augeas/lenses"
 FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.so ${libdir}/*.a ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
+FILES_lib${PN}-dev = "${libdir}/*.so ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
 FILES_lib${PN}-dbg = "${libdir}/.debug"
+FILES_lib${PN}-staticdev = "${libdir}/*.a"
+RDEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
 
 RDEPENDS_lib${PN} += "${PN}-lenses"
 RRECOMMENDS_lib${PN} += "${PN}"
diff --git a/meta/recipes-extended/augeas/augeas_0.8.1.bb b/meta/recipes-extended/augeas/augeas_0.8.1.bb
index 51eeb33..ee45098 100644
--- a/meta/recipes-extended/augeas/augeas_0.8.1.bb
+++ b/meta/recipes-extended/augeas/augeas_0.8.1.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "62d47bdc60e175f93aed3b81cb8e2785"
 SRC_URI[sha256sum] = "916fef67e8eed6d1abe02433830301bd01dfc8228e9cfffb490347545155c4d7"
diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
index b6394d2..d901f5b 100644
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ b/meta/recipes-extended/gamin/gamin_0.1.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=412a9be54757a155d0b997b52b519f62"
 
 DEPENDS = "glib-2.0"
 PROVIDES = "fam"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz \
            file://no-abstract-sockets.patch"
@@ -20,15 +20,16 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--without-python"
 
-PACKAGES += "lib${PN} lib${PN}-dev lib${PN}-dbg"
+PACKAGES += "lib${PN} lib${PN}-dev lib${PN}-dbg lib${PN}-staticdev"
 FILES_${PN} = "${libexecdir}"
 FILES_${PN}-dbg = "${libexecdir}/.debug"
 FILES_lib${PN} = "${libdir}/lib*.so.*"
-FILES_lib${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
-                      ${libdir}/lib*.a ${libdir}/lib*.so"
+FILES_lib${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la ${libdir}/lib*.so"
 FILES_lib${PN}-dbg = "${libdir}/.debug/"
+FILES_lib${PN}-staticdev = "${libdir}/lib*.a"
 
 RDEPENDS_lib${PN} = "${PN}"
+RDEPENDS_lib${PN}-staticdev = "lib${PN}-dev ( = ${EXTENDPKGV})"
 
 LEAD_SONAME = "libgamin-1.so"
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index d5e334e..f3b8576 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -6,13 +6,16 @@ SECTION = "console/network"
 
 LICENSE = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r0"
+PR ="r1"
 
 
-PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp-wrappers-doc"
+PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev \
+            tcp-wrappers tcp-wrappers-doc"
 FILES_libwrap = "${base_libdir}/lib*.so.*"
 FILES_libwrap-doc = "${mandir}/man3 ${mandir}/man5"
-FILES_libwrap-dev = "${libdir}/lib*.so ${libdir}/lib*.a ${includedir}"
+FILES_libwrap-dev = "${libdir}/lib*.so ${includedir}"
+FILES_libwrap-staticdev = "${libdir}/lib*.a"
+RDEPENDS_libwrap-staticdev = "libwrap-dev (= ${EXTENDPKGV})"
 FILES_tcp-wrappers = "${bindir}"
 FILES_tcp-wrappers-doc = "${mandir}/man8"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 572e1f6..a54412c 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
@@ -19,7 +19,7 @@ ALLOW_EMPTY = "1"
 # debian_package_name_hook. To keep backword compatibility,
 # it is necessary to explicitly name the package as libcairo2 here
 #
-PACKAGES =+ "libcairo2 libcairo2-dev libcairo2-dbg \
+PACKAGES =+ "libcairo2 libcairo2-dev libcairo2-dbg libcairo2-staticdev \
 		     libcairo-gobject2 \
 			 libcairo-script-interpreter2 \
 		     cairo-perf-utils \
@@ -45,9 +45,10 @@ to replay rendering."
 DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
 FILES_libcairo2 = "${libdir}/libcairo.so*"
-FILES_libcairo2-dev = "${includedir} ${libdir}/*.la ${libdir}/*.a \
-					   ${libdir}/*.o ${libdir}/pkgconfig"
+FILES_libcairo2-dev = "${includedir} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig"
 FILES_libcairo2-dbg = "${libdir}/.debug ${libdir}/cairo/.debug"
+FILES_libcairo2-staticdev = "${libdir}/*.a"
+RDEPENDS_libcairo2-staticdev = "libcairo2-dev ( = ${EXTENDPKGV})"
 FILES_libcairo-gobject2 = "${libdir}/libcairo-gobject.so*"
 FILES_libcairo-script-interpreter2 = "${libdir}/libcairo-script-interpreter.so*"
 FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.*"
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 1a56702..997db3e 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 DEPENDS += "libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXft"
@@ -28,10 +28,7 @@ python () {
             bb.data.setVar('PKG_${PN}', 'libxft2', d)
 }
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.a ${libdir}/pkgconfig \
-		${datadir}/aclocal ${bindir} ${sbindir}"
+FILES_${PN}-dev += "${bindir} ${sbindir}"
 
 SRC_URI[md5sum] = "cce3c327258116493b753f157e0360c7"
 SRC_URI[sha256sum] = "c8685ae56da0c1dcc2bc1e34607e7d76ae98b86a1a71baba3a6b76dbcf5ff9b2"
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 239c30a..87042e1 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
 SECTION = "libs"
 PRIORITY = "optional"
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
@@ -21,7 +21,8 @@ EXTRA_OECONF = " --enable-shared "
 PACKAGES =+ "a52dec a52dec-dbg a52dec-doc"
 
 FILES_${PN} = " ${libdir}/liba52.so.0 ${libdir}/liba52.so.0.0.0 " 
-FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la ${libdir}/liba52.a "
+#FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la "
+#FILES_${PN}-staticdev = " ${libdir}/liba52.a "
 FILES_${PN}-dbg = " ${libdir}/.debug/*"
 FILES_a52dec = " ${bindir}/* "
 FILES_a52dec-dbg = " ${bindir}/.debug/* "
diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
index 301d44a..18aac7c 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -1,6 +1,6 @@
 require acl.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index 9fef41b..fe8ab79 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -1,6 +1,6 @@
 require attr.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index afe2f1c..ed03b66 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -16,17 +16,19 @@ do_install () {
 	oe_runmake install install-lib install-dev DIST_ROOT="${D}"
 }
 
-PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc"
+PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc lib${PN}-staticdev"
 
 FILES_lib${PN} = "${base_libdir}/lib*.so.*"
 
 FILES_lib${PN}-dev = "${includedir} \
                       ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
                       ${libdir}/lib*.la \
                       ${base_libdir}/lib*.so \
-                      ${base_libdir}/lib*.a \
                       ${base_libdir}/lib*.la"
+FILES_lib${PN}-staticdev = " \
+                      ${libdir}/lib*.a \
+                      ${base_libdir}/lib*.a"
+DEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
 
 FILES_lib${PN}-doc = "${mandir}/man2 \
                       ${mandir}/man3"
diff --git a/meta/recipes-support/curl/curl_7.21.6.bb b/meta/recipes-support/curl/curl_7.21.6.bb
index 51e14f9..17da8fe 100644
--- a/meta/recipes-support/curl/curl_7.21.6.bb
+++ b/meta/recipes-support/curl/curl_7.21.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+PR = "r2"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
@@ -36,7 +36,7 @@ do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
 }
 
-PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
+PACKAGES += "${PN}-certs lib${PN} lib${PN}-dev lib${PN}-staticdev lib${PN}-doc"
 
 FILES_${PN} = "${bindir}/curl"
 
@@ -49,12 +49,14 @@ FILES_lib${PN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${PN} += "${PN}-certs"
 FILES_lib${PN}-dev = "${includedir} \
                       ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
                       ${libdir}/lib*.la \
                       ${libdir}/pkgconfig \
                       ${datadir}/aclocal \
                       ${bindir}/*-config"
 
+FILES_lib${PN}-staticdev = "${libdir}/lib*.a"
+DEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
+
 FILES_lib${PN}-doc = "${mandir}/man3 \
                       ${mandir}/man1/curl-config.1"
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 939df14..9c2b365 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -18,11 +18,12 @@ export config_TARGET_LINK = "${CCLD}"
 export config_TARGET_CFLAGS = "${CFLAGS}"
 export config_TARGET_LFLAGS = "${LDFLAGS}"
 
-PACKAGES = "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg"
+PACKAGES = "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg lib${PN}-staticdev"
 FILES_${PN} = "${bindir}/*"
 FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
-		       ${libdir}/pkgconfig ${includedir}"
+FILES_lib${PN}-dev = "${libdir}/*.la ${libdir}/*.so ${libdir}/pkgconfig ${includedir}"
+FILES_lib${PN}-staticdev = "${libdir}/*.a"
+DEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
 FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
 AUTO_LIBNAME_PKGS = "lib${PN}"
 
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
index 34d1653..a82a944 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070602.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-3070602"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "f16c08617968b4087b3d591fd575f59f"
 SRC_URI[sha256sum] = "53aa66f30d8ff87230d4173b7979814432b8084da77fba05992223f76593fc81"
-- 
1.7.3.4



