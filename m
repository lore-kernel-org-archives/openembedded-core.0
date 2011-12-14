Received: from e06smtp13.uk.ibm.com ([195.75.94.109])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1Ray3L-000753-9V
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 00:15:59 +0100
Received: from /spool/local
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <openembedded-core@lists.openembedded.org> from
	<ken.werner@linaro.org>; Wed, 14 Dec 2011 22:58:50 -0000
Received: from d06nrmr1307.portsmouth.uk.ibm.com ([9.149.38.129])
	by e06smtp13.uk.ibm.com ([192.168.101.143]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Wed, 14 Dec 2011 22:58:48 -0000
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id pBEMwlIV2670812
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 22:58:47 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost.localdomain
	[127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id pBEMwlTZ024446
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 15:58:47 -0700
Received: from bolide.boeblingen.de.ibm.com
	(dyn-9-152-224-84.boeblingen.de.ibm.com [9.152.224.84])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id pBEMwkDr024425; Wed, 14 Dec 2011 15:58:47 -0700
From: Ken Werner <ken.werner@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 23:58:32 +0100
Message-Id: <1323903512-7344-4-git-send-email-ken.werner@linaro.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
References: <1323903512-7344-1-git-send-email-ken.werner@linaro.org>
x-cbid: 11121422-2966-0000-0000-000002A1006E
Subject: [PATCH 3/3] Add the Sourcery G++ Lite 2011.03 external toolchain for ARM
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
X-List-Received-Date: Wed, 14 Dec 2011 23:15:59 -0000

This adds initial support for using the Sourcery G++ Lite 2011.03 for
ARM GNU/Linux as an external toolchain.

Signed-off-by: Ken Werner <ken.werner@linaro.org>
---
 .../include/tcmode-external-csl-arm-2011.03.inc    |   33 +++++
 .../meta/external-csl-toolchain_arm-2011.03.bb     |  137 ++++++++++++++++++++
 2 files changed, 170 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/distro/include/tcmode-external-csl-arm-2011.03.inc
 create mode 100644 meta/recipes-core/meta/external-csl-toolchain_arm-2011.03.bb

diff --git a/meta/conf/distro/include/tcmode-external-csl-arm-2011.03.inc b/meta/conf/distro/include/tcmode-external-csl-arm-2011.03.inc
new file mode 100644
index 0000000..9958034
--- /dev/null
+++ b/meta/conf/distro/include/tcmode-external-csl-arm-2011.03.inc
@@ -0,0 +1,33 @@
+#
+# Configuration to use an external CSL arm-2011.03 toolchain (ARM GNUEABI).
+#
+
+TARGET_VENDOR = "-none"
+
+EXTERNAL_TOOLCHAIN = "/usr/local/csl/arm-2011.03"
+
+PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
+
+PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/libc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/libintl = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
+PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
+PREFERRED_PROVIDER_glibc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "external-csl-toolchain"
+PREFERRED_PROVIDER_libgcc = "external-csl-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-csl-toolchain"
+
+PREFERRED_VERSION_external-csl-toolchain = "arm-2011.03"
+
+TARGET_CPPFLAGS_prepend = "-isystem${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/include "
+TARGET_LDFLAGS_prepend = "-L${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib -Wl,-rpath-link,${EXTERNAL_TOOLCHAIN}/${TARGET_SYS}/lib "
+
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
diff --git a/meta/recipes-core/meta/external-csl-toolchain_arm-2011.03.bb b/meta/recipes-core/meta/external-csl-toolchain_arm-2011.03.bb
new file mode 100644
index 0000000..b982255
--- /dev/null
+++ b/meta/recipes-core/meta/external-csl-toolchain_arm-2011.03.bb
@@ -0,0 +1,137 @@
+# License applies to this recipe code, not the toolchain itself
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${EXTERNAL_TOOLCHAIN}/share/doc/arm-arm-none-linux-gnueabi/LICENSE.txt;md5=405379e879c6c5934ff23d52201f2855"
+PROVIDES = "libgcc \
+    linux-libc-headers \
+    virtual/${TARGET_PREFIX}gcc \
+    virtual/${TARGET_PREFIX}g++ \
+    virtual/${TARGET_PREFIX}gcc-initial \
+    virtual/${TARGET_PREFIX}gcc-intermediate \
+    virtual/${TARGET_PREFIX}binutils \
+    virtual/${TARGET_PREFIX}libc-for-gcc \
+    virtual/${TARGET_PREFIX}libc-initial \
+    virtual/libc \
+    virtual/libintl \
+    virtual/libiconv \
+    glibc-thread-db \
+    virtual/linux-libc-headers \
+    virtual/${TARGET_PREFIX}compilerlibs"
+PR = "r0"
+
+SRC_URI = "file://SUPPORTED"
+
+inherit libc-common
+inherit libc-package
+
+do_install() {
+    echo "EXTERNAL_TOOLCHAIN is ${EXTERNAL_TOOLCHAIN}"
+    install -d ${D}${sysconfdir}
+    install -d ${D}${base_sbindir}
+    install -d ${D}${base_libdir}
+    install -d ${D}${bindir}
+    install -d ${D}${sbindir}
+    install -d ${D}${libdir}
+    install -d ${D}${libexecdir}
+    install -d ${D}${datadir}
+    install -d ${D}${includedir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/etc/*  ${D}${sysconfdir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/sbin/* ${D}${base_sbindir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/lib/*  ${D}${base_libdir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/bin/*  ${D}${bindir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/sbin/*  ${D}${sbindir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/lib/*  ${D}${libdir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/libexec/*  ${D}${libexecdir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/share/*  ${D}${datadir}
+    cp -a ${EXTERNAL_TOOLCHAIN}/arm-none-linux-gnueabi/libc/usr/include/*  ${D}${includedir}
+    sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
+    sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libpthread.so
+}
+
+PACKAGES_DYNAMIC = "glibc-gconv-*"
+PACKAGES += "libgcc \
+    libgcc-dev \
+    libstdc++ \
+    libstdc++-dev \
+    linux-libc-headers"
+
+RPROVIDES = "glibc-utils \
+    libsegfault \
+    glibc-thread-db \
+    glibc \
+    linux-libc-headers-dev"
+
+FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
+FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
+FILES_libstdc++ = "${libdir}/libstdc++.so.*"
+FILES_libstdc++-dev = "${includedir}/c++/4.2.3 \
+    ${libdir}/libstdc++.so \
+    ${libdir}/libstdc++.la \
+    ${libdir}/libstdc++.a \
+    ${libdir}/libsupc++.la \
+    ${libdir}/libsupc++.a"
+FILES_linux-libc-headers = "${includedir}/asm* \
+    ${includedir}/linux \
+    ${includedir}/mtd \
+    ${includedir}/rdma \
+    ${includedir}/scsi \
+    ${includedir}/sound \
+    ${includedir}/video"
+FILES_${PN}-dbg += "${libdir}/bin/.debug \
+    ${libdir}/gconv/.debug \
+    ${libexecdir}/getconf/.debug"
+FILES_${PN} += "${libdir}/bin \
+    ${libdir}/locale \
+    ${libdir}/gconv/gconv-modules \
+    ${datadir}/zoneinfo \
+    ${base_libdir}/libcrypt*.so.* \
+    ${base_libdir}/libcrypt-*.so \
+    ${base_libdir}/libc.so.* \
+    ${base_libdir}/libc-*.so \
+    ${base_libdir}/libm*.so.* \
+    ${base_libdir}/libm-*.so \
+    ${base_libdir}/ld*.so.* \
+    ${base_libdir}/ld-*.so \
+    ${base_libdir}/libpthread*.so.* \
+    ${base_libdir}/libpthread-*.so \
+    ${base_libdir}/libresolv*.so.* \
+    ${base_libdir}/libresolv-*.so \
+    ${base_libdir}/librt*.so.* \
+    ${base_libdir}/librt-*.so \
+    ${base_libdir}/libutil*.so.* \
+    ${base_libdir}/libutil-*.so \
+    ${base_libdir}/libnsl*.so.* \
+    ${base_libdir}/libnsl-*.so \
+    ${base_libdir}/libnss_files*.so.* \
+    ${base_libdir}/libnss_files-*.so \
+    ${base_libdir}/libnss_compat*.so.* \
+    ${base_libdir}/libnss_compat-*.so \
+    ${base_libdir}/libnss_dns*.so.* \
+    ${base_libdir}/libnss_dns-*.so \
+    ${base_libdir}/libnss_nis*.so.* \
+    ${base_libdir}/libnss_nisplus-*.so \
+    ${base_libdir}/libnss_nisplus*.so.* \
+    ${base_libdir}/libnss_nis-*.so \
+    ${base_libdir}/libnss_hesiod*.so.* \
+    ${base_libdir}/libnss_hesiod-*.so \
+    ${base_libdir}/libdl*.so.* \
+    ${base_libdir}/libdl-*.so \
+    ${base_libdir}/libanl*.so.* \
+    ${base_libdir}/libanl-*.so \
+    ${base_libdir}/libBrokenLocale*.so.* \
+    ${base_libdir}/libBrokenLocale-*.so \
+    ${base_libdir}/libcidn*.so.* \
+    ${base_libdir}/libcidn-*.so \
+    ${base_libdir}/libthread_db*.so.* \
+    ${base_libdir}/libthread_db-*.so \
+    ${base_libdir}/libmemusage.so \
+    ${base_libdir}/libSegFault.so \
+    ${base_libdir}/libpcprofile.so"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Prevent the do_pre_configure task of libc-package.bbclass from running
+do_pre_configure() {
+    :
+}
+
+GLIBC_INTERNAL_USE_BINARY_LOCALE = "disable"
-- 
1.7.5.4



