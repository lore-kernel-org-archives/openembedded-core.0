Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 68CC17318E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:33:48 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n186so34265986wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 08:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JoLkf7+V046HiDy4fkZ+BMZaxtc/0N9811ofi+r9FX4=;
	b=bfzIy2EbsRtKdNjNx66jtFoVTHZCh2elMDLDH2ahm2XVSkcRt8ITPGICputsVcMieZ
	I00Br6eaRwcYdjiBDL3xxc9KUg2enK7BomLkNjlL77VjPrZrF2dT9x1eAJR3/B9zqyrw
	96Q7dsf5Wm4tBHM0wpochDFI1ikxQu4/vl6Q/IoMzXSOmxEG44ni3ntPMcduVqfG7Ca5
	nB3uY8q3RQ5/fcmF7lLBy56EF0e62pkMqavo8diyJDXnb6yxml5miihxW7Mlsccz+QXb
	EPXUI/ULVCrV9SRXzQrEOERWjFR6kSVkK1ZAhvAdVxVmK2Iv3mBEKXuJ0OwmzM0QB7iS
	F+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JoLkf7+V046HiDy4fkZ+BMZaxtc/0N9811ofi+r9FX4=;
	b=JeTPq1fsu4sF9BzWN7cJKu9PvS7Luyf3fiqO3Ju1G5AXYpdobmO6vl3RuFimGqQ3+A
	8CK8AFd7zHnH1/kLdMjuCl2ciptmhDUOWMDG/LtdteEr8Jo6QMc+ZsenkrADmBIqbTVa
	faFEifVETJW4Eh0NwHZ7IXlKfbWXjdQP9X33ohTlZxdiIxa3L9ClIHA0hEYtGBPy2YCa
	fT+lT3wzTIvyozAT6OIsUR/BP/kSzD9dViDIzXVpW1WoOepRn+XY9I9Udk/PKUyEO9cO
	1RLCc66S+0BGtpCdrmvPoWXCEDHqvreSiGW+jZ+1QtYMEwrJNUWb0jM/qGYi6z+Q0YYe
	1Ukg==
X-Gm-Message-State: ALoCoQmwMWVPhAn7n9eJo6YIcdAVcrwPHFTOsNCcXmnOZRMSKLuZImI7E87qLJerIdiMMPnPNQcE0Vt8eGxLXjhhK/nybuUuxg==
X-Received: by 10.28.104.132 with SMTP id d126mr5990841wmc.30.1450197227115;
	Tue, 15 Dec 2015 08:33:47 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t3sm2120465wjz.11.2015.12.15.08.33.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 08:33:46 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Dec 2015 16:33:42 +0000
Message-Id: <1450197222-4442-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] meta: remove removals of FILES_-dbg
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
X-List-Received-Date: Tue, 15 Dec 2015 16:33:51 -0000

In some recipes overly-split -dbg packages were merged into PN-dbg.  Unless
there's a very good reason, recipes should have a single -dev and -dbg package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb                    | 1 -
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb                        | 3 +--
 meta/recipes-bsp/u-boot/u-boot.inc                                 | 2 --
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb                 | 1 -
 meta/recipes-connectivity/connman/connman.inc                      | 2 --
 meta/recipes-connectivity/iproute2/iproute2.inc                    | 2 --
 meta/recipes-connectivity/neard/neard_0.15.bb                      | 1 -
 meta/recipes-connectivity/openssl/openssl_1.0.2e.bb                | 7 +------
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb                         | 1 -
 meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb | 5 +----
 meta/recipes-core/dbus/dbus-glib.inc                               | 2 +-
 meta/recipes-core/glib-networking/glib-networking_2.46.1.bb        | 1 -
 meta/recipes-core/libcgroup/libcgroup_0.41.bb                      | 1 -
 meta/recipes-core/libxml/libxml2_2.9.3.bb                          | 1 -
 meta/recipes-core/uclibc/uclibc-package.inc                        | 3 +--
 meta/recipes-core/util-linux/util-linux.inc                        | 1 -
 meta/recipes-devtools/apt/apt.inc                                  | 2 --
 meta/recipes-devtools/binutils/binutils.inc                        | 2 --
 meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb              | 1 -
 meta/recipes-devtools/gcc/gcc-sanitizers.inc                       | 7 +------
 meta/recipes-devtools/gcc/libgcc.inc                               | 2 --
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb              | 2 --
 meta/recipes-devtools/python/python-smartpm_git.bb                 | 2 --
 meta/recipes-devtools/python/python3_3.5.0.bb                      | 3 ---
 meta/recipes-devtools/python/python_2.7.9.bb                       | 3 ---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb                           | 2 +-
 meta/recipes-devtools/ruby/ruby_2.2.2.bb                           | 5 -----
 meta/recipes-devtools/vala/vala.inc                                | 1 -
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb                  | 2 --
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb                   | 1 -
 meta/recipes-extended/gawk/gawk_3.1.5.bb                           | 1 -
 meta/recipes-extended/gawk/gawk_4.1.3.bb                           | 1 -
 meta/recipes-extended/iptables/iptables_1.4.21.bb                  | 1 -
 meta/recipes-extended/libsolv/libsolv_git.bb                       | 3 +--
 meta/recipes-extended/libuser/libuser_0.62.bb                      | 1 -
 meta/recipes-extended/mc/mc_4.7.5.2.bb                             | 2 --
 meta/recipes-extended/mc/mc_4.8.15.bb                              | 2 --
 meta/recipes-extended/newt/libnewt-python_0.52.18.bb               | 1 -
 meta/recipes-extended/slang/slang_2.2.4.bb                         | 1 -
 meta/recipes-extended/sysstat/sysstat.inc                          | 1 -
 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb                     | 1 -
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb                 | 6 ------
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                            | 1 -
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb               | 1 -
 meta/recipes-gnome/librsvg/librsvg_2.40.11.bb                      | 1 -
 meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb                   | 3 +--
 meta/recipes-graphics/piglit/piglit_git.bb                         | 2 --
 meta/recipes-graphics/tslib/tslib_1.1.bb                           | 1 -
 meta/recipes-graphics/wayland/libinput_0.21.0.bb                   | 1 -
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc           | 1 -
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc            | 1 -
 meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb               | 1 -
 meta/recipes-kernel/perf/perf.bb                                   | 1 -
 meta/recipes-kernel/systemtap/systemtap_git.bb                     | 2 --
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb                     | 2 --
 meta/recipes-support/aspell/aspell_0.60.6.1.bb                     | 1 -
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb                  | 1 -
 meta/recipes-support/nss/nss_3.19.2.bb                             | 1 -
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb                     | 2 +-
 59 files changed, 10 insertions(+), 103 deletions(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 857bd07..6a1c366 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -9,5 +9,4 @@ SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0
 
 PR = "r1"
 
-FILES_${PN}-dbg += "*/udev/.debug */*/udev/.debug"
 FILES_${PN} += "*/udev */*/udev"
diff --git a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
index 8d35187..27cb3db 100644
--- a/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
+++ b/meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb
@@ -22,5 +22,4 @@ do_configure_prepend () {
 }
 
 FILES_${PN} += "${libdir}/${BPN}/*"
-FILES_${PN}-dbg += "${libdir}/${BPN}/bin/.debug \
-		    ${datadir}/doc/pm-utils/README.debugging"
+FILES_${PN}-dbg += "${datadir}/doc/pm-utils/README.debugging"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index e66ffd1..41eb205 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -187,8 +187,6 @@ do_install () {
 }
 
 FILES_${PN} = "/boot ${sysconfdir}"
-# Ensure the split debug part of any elf files are put into dbg
-FILES_${PN}-dbg += "/boot/.debug"
 
 do_deploy () {
     if [ "x${UBOOT_CONFIG}" != "x" ]
diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index 0d42b90..604ee9e 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -26,7 +26,6 @@ S = "${WORKDIR}/avahi-${PV}"
 PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
-FILES_${PN}-dbg += "${libdir}/.debug/libavah-ui*"
 FILES_${PN}-dev += "${libdir}/libavahi-ui${SOLIBSDEV}"
 FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6324d7a..ba2ca24 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -154,8 +154,6 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
             ${datadir}/dbus-1/system-services/*"
 
-FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
-
 FILES_${PN}-dev += "${libdir}/connman/*/*.la"
 
 PACKAGES =+ "${PN}-vpn"
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 6a08114..9ce157b 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -36,8 +36,6 @@ PACKAGES =+ "${PN}-tc"
 FILES_${PN}-tc = "${base_sbindir}/tc* \
                   ${libdir}/tc/*.so"
 
-FILES_${PN}-dbg += "${libdir}/tc/.debug"
-
 ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
 ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
index f962310..93bddb3 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -43,7 +43,6 @@ do_install_append() {
 PACKAGES =+ "${PN}-tests"
 
 FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-FILES_${PN}-dbg += "${libexecdir}/nfc/.debug ${libdir}/${BPN}/*/.debug"
 
 RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
index c4e590f..d2a265a 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2e.bb
@@ -43,13 +43,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
 SRC_URI[md5sum] = "5262bfa25b60ed9de9f28d5d52d77fc5"
 SRC_URI[sha256sum] = "e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff"
 
-PACKAGES =+ " \
-	${PN}-engines \
-	${PN}-engines-dbg \
-	"
-
+PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 
 # The crypto_use_bigint patch means that perl's bignum module needs to be
 # installed, but some distributions (for example Fedora 23) don't ship it by
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index adc38e1..5f06034 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -78,7 +78,6 @@ do_install_append () {
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
-FILES_${PN}-dbg += "${libdir}/pppd/${PV}/.debug"
 FILES_${PN}-oa       = "${libdir}/pppd/${PV}/pppoatm.so"
 FILES_${PN}-oe       = "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV}/rp-pppoe.so"
 FILES_${PN}-radius   = "${libdir}/pppd/${PV}/radius.so ${libdir}/pppd/${PV}/radattr.so ${libdir}/pppd/${PV}/radrealms.so"
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
index b6f33e5..c3b8f66 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
@@ -39,11 +39,8 @@ do_install() {
 	install -m 0755 ifrename ${D}${sbindir}/ifrename
 }
 
-PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
-libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
+PACKAGES = "libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc ${PN}-dbg"
 
-FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
-FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
 FILES_libiw = "${libdir}/*.so.*"
 FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
 FILES_libiw-doc = "${mandir}/man7"
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 1c47873..f8c0ebe 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -26,7 +26,7 @@ EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-in
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_class-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
-PACKAGES += "${PN}-bash-completion ${PN}-tests-dbg ${PN}-tests"
+PACKAGES += "${PN}-bash-completion ${PN}-tests"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
index c980a09..70be87c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
@@ -25,6 +25,5 @@ EXTRA_OECONF = "--without-gnome-proxy"
 inherit gnomebase gettext upstream-version-is-even
 
 FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
-FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/"
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
diff --git a/meta/recipes-core/libcgroup/libcgroup_0.41.bb b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
index 1bbeb4a..287aecd 100644
--- a/meta/recipes-core/libcgroup/libcgroup_0.41.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_0.41.bb
@@ -21,7 +21,6 @@ EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam-mod
 
 PACKAGES =+ "cgroups-pam-plugin"
 FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
-FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 FILES_${PN}-dev += "${base_libdir}/security/*.la"
 
 do_install_append() {
diff --git a/meta/recipes-core/libxml/libxml2_2.9.3.bb b/meta/recipes-core/libxml/libxml2_2.9.3.bb
index 20bf1e0..9c9873f 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.3.bb
@@ -62,7 +62,6 @@ python populate_packages_prepend () {
 
 PACKAGES += "${PN}-utils ${PN}-python"
 
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES_${PN}-dev += "${libdir}/xml2Conf.sh ${libdir}/cmake/*"
 FILES_${PN}-utils += "${bindir}/*"
diff --git a/meta/recipes-core/uclibc/uclibc-package.inc b/meta/recipes-core/uclibc/uclibc-package.inc
index c1815f9..439f84e 100644
--- a/meta/recipes-core/uclibc/uclibc-package.inc
+++ b/meta/recipes-core/uclibc/uclibc-package.inc
@@ -1,6 +1,6 @@
 # Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
 # *_nonshared.a libraries to be packaged in the uclibc-dev package.
-PACKAGES = "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+PACKAGES = "ldd uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
 FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
 FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
@@ -14,7 +14,6 @@ FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
 
 FILES_ldd = "${bindir}/ldd"
 FILES_uclibc-utils = "${bindir} ${sbindir}"
-FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
 FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 318c74b..cf321c6 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -65,7 +65,6 @@ FILES_${PN}-bash-completion += "${datadir}/bash-completion"
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_${PN}-dev += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/pylibmount.la"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/libmount/.debug/"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
 FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 8e267c3..312c6a9 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -28,5 +28,3 @@ do_configure_prepend() {
     rm -rf ${S}/buildlib/config.sub
     rm -rf ${S}/buildlib/config.guess
 }
-
-FILES_${PN}-dbg += "${libdir}/apt/methods/.debug/"
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index a304867..79e2a12 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -61,8 +61,6 @@ python do_package_prepend() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', alt, bindir + "/" + alt)
 }
 
-# FILES_${PN}-dbg = "${prefix}/${TARGET_SYS}/bin/.debug ${prefix}/${libdir}/.debug"
-
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
index 8ca26ef..7586ff2 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.7.bb
@@ -150,7 +150,6 @@ FILES_bootchartd-stop-initscript += "${sysconfdir}/init.d ${sysconfdir}/rc*.d"
 FILES_${PN} += "${base_libdir}/bootchart/bootchart-collector"
 FILES_${PN} += "${base_libdir}/bootchart/tmpfs"
 FILES_${PN} += "${libdir}"
-FILES_${PN}-dbg += "${base_libdir}/bootchart/.debug"
 FILES_${PN}-doc += "${datadir}/docs"
 
 RCONFLICTS_${PN} = "bootchart"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index c987ccb..a7b5d71 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -58,10 +58,9 @@ DEPENDS = "gcc-runtime"
 
 BBCLASSEXTEND = "nativesdk"
 
-PACKAGES = "${PN}"
+PACKAGES = "${PN} ${PN}-dbg"
 PACKAGES += "libasan libubsan liblsan libtsan"
 PACKAGES += "libasan-dev libubsan-dev liblsan-dev libtsan-dev"
-PACKAGES += "libasan-dbg libubsan-dbg liblsan-dbg libtsan-dbg"
 PACKAGES += "libasan-staticdev libubsan-staticdev liblsan-staticdev libtsan-staticdev"
 
 RDEPENDS_libasan += "libstdc++"
@@ -84,7 +83,6 @@ do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlib
 COMPATIBLE_HOST = '(x86_64|i.86|powerpc|arm).*-linux'
 
 FILES_libasan += "${libdir}/libasan.so.*"
-FILES_libasan-dbg += "${libdir}/.debug/libasan.so.*"
 FILES_libasan-dev += "\
     ${libdir}/libasan_preinit.o \
     ${libdir}/libasan.so \
@@ -93,7 +91,6 @@ FILES_libasan-dev += "\
 FILES_libasan-staticdev += "${libdir}/libasan.a"
 
 FILES_libubsan += "${libdir}/libubsan.so.*"
-FILES_libubsan-dbg += "${libdir}/.debug/libubsan.so.*"
 FILES_libubsan-dev += "\
     ${libdir}/libubsan.so \
     ${libdir}/libubsan.la \
@@ -101,7 +98,6 @@ FILES_libubsan-dev += "\
 FILES_libubsan-staticdev += "${libdir}/libubsan.a"
 
 FILES_liblsan += "${libdir}/liblsan.so.*"
-FILES_liblsan-dbg += "${libdir}/.debug/liblsan.so.*"
 FILES_liblsan-dev += "\
     ${libdir}/liblsan.so \
     ${libdir}/liblsan.la \
@@ -109,7 +105,6 @@ FILES_liblsan-dev += "\
 FILES_liblsan-staticdev += "${libdir}/liblsan.a"
 
 FILES_libtsan += "${libdir}/libtsan.so.*"
-FILES_libtsan-dbg += "${libdir}/.debug/libtsan.so.*"
 FILES_libtsan-dev += "\
     ${libdir}/libtsan.so \
     ${libdir}/libtsan.la \
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 95fa3f4..68377869 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -21,8 +21,6 @@ FILES_${PN}-dev = "\
     ${libdir}/${TARGET_SYS}/${BINV}* \
 "
 
-FILES_${PN}-dbg += "${base_libdir}/.debug/"
-
 LIBGCCBUILDTREENAME = "gcc-build-internal-"
 
 do_package[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index 9ccd417..9561a59 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -31,7 +31,5 @@ do_compile_class-native() {
 	cpan_do_compile
 }
 
-FILES_${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/XML/Parser/Expat/.debug/"
-
 BBCLASSEXTEND="native"
 
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index d6c378b..139bfd5 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -128,8 +128,6 @@ RDEPENDS_${PN}-interface-gtk = "gtk+ ${PN}-interface-images"
 
 FILES_smartpm = "${bindir}/smart"
 
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/smart/backends/rpm/.debug"
-
 FILES_${PN}-backend-rpm = "${libdir}/python*/site-packages/smart/backends/rpm"
 
 FILES_${PN}-interface-qt4 = "${libdir}/python*/site-packages/smart/interfaces/qt4"
diff --git a/meta/recipes-devtools/python/python3_3.5.0.bb b/meta/recipes-devtools/python/python3_3.5.0.bb
index 7f6fbdb..a5663a1 100644
--- a/meta/recipes-devtools/python/python3_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3_3.5.0.bb
@@ -211,9 +211,6 @@ PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES_libpython3 = "${libdir}/libpython*.so.*"
 FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
 
-# catch debug extensions (isn't that already in python-core-dbg?)
-FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS_${PN}-misc += "${PN}-core"
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index f585a53..0287c19 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -151,9 +151,6 @@ RRECOMMENDS_${PN}-crypt = "openssl"
 PACKAGES =+ "lib${BPN}2"
 FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
 
-# catch debug extensions (isn't that already in python-core-dbg?)
-FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
-
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 0b38c3a..2747a24 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -224,7 +224,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
index 78c943c..9b807a7 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -34,9 +34,4 @@ do_install() {
 FILES_${PN} += "${datadir}/rubygems \
                 ${datadir}/ri"
 
-FILES_${PN}-dbg += "${libdir}/ruby/*/.debug \
-                    ${libdir}/ruby/*/*/.debug \
-                    ${libdir}/ruby/*/*/*/.debug \
-                    ${libdir}/ruby/*/*/*/*/.debug"
-
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index c98244b..43f9bb3 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -15,4 +15,3 @@ inherit autotools pkgconfig upstream-version-is-even
 
 FILES_${PN} += "${datadir}/${BPN}-${SHRT_VER}/vapi ${libdir}/${BPN}-${SHRT_VER}/"
 FILES_${PN}-doc += "${datadir}/devhelp"
-FILES_${PN}-dbg += "${libdir}/${BPN}-${SHRT_VER}/.debug"
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index c386a19..c38a07b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -50,8 +50,6 @@ do_install_append () {
 
 RDEPENDS_${PN} += "perl"
 
-FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
-
 # valgrind needs debug information for ld.so at runtime in order to
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
index 35817c9..8c9063e 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.5.bb
@@ -45,7 +45,6 @@ BBCLASSEXTEND = "native nativesdk"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/cracklib.py \
 	${PYTHON_SITEPACKAGES_DIR}/_cracklib.so \
     "
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/_cracklib.so"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_cracklib.a \
 	${PYTHON_SITEPACKAGES_DIR}/_cracklib.la \
     "
diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index c7af4a9..bc188fa 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -28,7 +28,6 @@ PACKAGES += "gawk-common pgawk"
 FILES_${PN} = "${bindir}/gawk* ${bindir}/igawk"
 FILES_gawk-common += "${datadir}/awk/* ${libdir}/gawk/awk/*"
 FILES_pgawk = "${bindir}/pgawk*"
-FILES_${PN}-dbg += "${libdir}/gawk/awk/.debug"
 
 ALTERNATIVE_${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb b/meta/recipes-extended/gawk/gawk_4.1.3.bb
index d1a88e4..6ca7f3e 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.3.bb
@@ -26,7 +26,6 @@ inherit autotools gettext texinfo update-alternatives
 
 FILES_${PN} += "${datadir}/awk"
 FILES_${PN}-dev += "${libdir}/${BPN}/*.la"
-FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 
 ALTERNATIVE_${PN} = "awk"
 ALTERNATIVE_TARGET[awk] = "${bindir}/gawk"
diff --git a/meta/recipes-extended/iptables/iptables_1.4.21.bb b/meta/recipes-extended/iptables/iptables_1.4.21.bb
index deea5e5..4118f54 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.21.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.21.bb
@@ -17,7 +17,6 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-nf-nat \
                      kernel-module-ipt-masquerade"
 FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
-FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
index 2011487..78a2d51 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -18,11 +18,10 @@ inherit cmake
 
 EXTRA_OECMAKE = "-DLIB=${baselib}"
 
-PACKAGES =+ "${PN}-tools ${PN}ext ${PN}ext-dbg"
+PACKAGES =+ "${PN}-tools ${PN}ext"
 
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
 FILES_${PN}-tools = "${bindir}/*"
 FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
-FILES_${PN}ext-dbg = "${libdir}/.debug/${PN}ext.so.*"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index c4ed459..4caa8a1 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -25,6 +25,5 @@ EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
 PACKAGES += "${PN}-python "
 
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 
diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index b47eb02..b38964d 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -19,8 +19,6 @@ inherit autotools gettext pkgconfig
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
 
-FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
-
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
 	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
diff --git a/meta/recipes-extended/mc/mc_4.8.15.bb b/meta/recipes-extended/mc/mc_4.8.15.bb
index ed53760..6c3a16a 100644
--- a/meta/recipes-extended/mc/mc_4.8.15.bb
+++ b/meta/recipes-extended/mc/mc_4.8.15.bb
@@ -22,8 +22,6 @@ PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
-FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
-
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
 	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
index 94a41a3..ba04757 100644
--- a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
@@ -24,6 +24,5 @@ do_install () {
 PACKAGES_remove = "whiptail"
 
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index e33e868..bfaa9a5 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -48,7 +48,6 @@ do_install() {
 }
 
 FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
-FILES_${PN}-dbg += "${libdir}/${BPN}/v2/modules/.debug"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 85be902..a954bba 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -51,7 +51,6 @@ pkg_postinst_${PN} () {
 
 
 FILES_${PN} += "${libdir}/sa"
-FILES_${PN}-dbg += "${libdir}/sa/.debug/"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 LDFLAGS_append_libc-uclibc = " -lintl"
diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
index 3ff35fc..09633a6 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
@@ -21,7 +21,6 @@ do_configure_prepend() {
 }
 
 FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
-FILES_${PN}-dbg += "${libdir}/epiphany/*/web-extensions/.debug/libephywebextension.so"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
 RRECOMMENDS_${PN} = "ca-certificates"
 
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
index dc05a03..084fe36 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
@@ -58,12 +58,6 @@ FILES_${PN}-dev += " \
 	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/*.la \
 "
 
-FILES_${PN}-dbg += " \
-	${libdir}/.debug/* \
-	${libdir}/gdk-pixbuf-2.0/.debug/* \
-	${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders/.debug/* \
-"
-
 PACKAGES_DYNAMIC += "^gdk-pixbuf-loader-.*"
 PACKAGES_DYNAMIC_class-native = ""
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 17fdafa..cd1df1a 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -54,7 +54,6 @@ FILES_${PN} += "${libdir}/GConf/* \
                 ${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/system-services/*.service \
                "
-FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index aaf8cab..c0ac911 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -24,7 +24,6 @@ RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
 
 FILES_${PN} = ""
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/engines/*.la"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/engines/.debug"
 FILES_${PN}-schemas = "${datadir}/gtk-engines/*.xml"
 
 CFLAGS_prepend = "-DHAVE_ANIMATION "
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
index 3ce1e55..d57c69d 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.11.bb
@@ -38,7 +38,6 @@ do_install_append() {
 
 PACKAGES =+ "librsvg-gtk rsvg"
 FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-dbg += "${libdir}/gdk-pixbuf-2.0/*/loaders/.debug"
 FILES_rsvg = "${bindir}/rsvg* \
 	      ${datadir}/pixmaps/svg-viewer.svg \
 	      ${datadir}/themes"
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
index f34a647..db1e578 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.1.2.bb
@@ -25,10 +25,9 @@ EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
 PACKAGECONFIG ??= "icu"
 PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
-PACKAGES =+ "${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev"
+PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
 FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
-FILES_${PN}-icu-dbg = "${libdir}/.debug/libharfbuzz-icu.so*"
 FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/libharfbuzz-icu.so \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 0d825c9..e0bd1fe 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -28,8 +28,6 @@ do_configure_prepend() {
    fi
 }
 
-FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
-
 RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess \
 	python-argparse python-importlib python-unixadmin \
 	python-multiprocessing python-textutils python-netserver python-shell \
diff --git a/meta/recipes-graphics/tslib/tslib_1.1.bb b/meta/recipes-graphics/tslib/tslib_1.1.bb
index 8e304a6..b0264c3 100644
--- a/meta/recipes-graphics/tslib/tslib_1.1.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.1.bb
@@ -46,7 +46,6 @@ DEBIAN_NOAUTONAME_tslib-calibrate = "1"
 RDEPENDS_${PN} = "tslib-conf"
 RRECOMMENDS_${PN} = "pointercal"
 
-FILES_${PN}-dbg += "${libdir}/ts/.debug*"
 FILES_${PN}-dev += "${libdir}/ts/*.la"
 FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
 FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
diff --git a/meta/recipes-graphics/wayland/libinput_0.21.0.bb b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
index ac5a249..f6c5975 100644
--- a/meta/recipes-graphics/wayland/libinput_0.21.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_0.21.0.bb
@@ -21,4 +21,3 @@ PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
 
 FILES_${PN} += "${libdir}/udev/"
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 7ddd1c7..57a4c82 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -12,7 +12,6 @@ DEPENDS = "virtual/xserver xproto randrproto util-macros"
 SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
 
 FILES_${PN} += " ${libdir}/xorg/modules/drivers/*.so"
-FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"
 
 inherit autotools pkgconfig distro_features_check
 # depends on virtual/xserver
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index 21b60c4..c4dba1b 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -10,4 +10,3 @@ PACKAGEFUNCS =+ "add_xorg_abi_depends"
 FILES_${PN} += " ${libdir}/xorg/modules/input/*.so \
                  ${datadir}/X11/xorg.conf.d \
                  "
-FILES_${PN}-dbg += " ${libdir}/xorg/modules/input/.debug"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
index be59a4a..f1ca36e 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.7.bb
@@ -19,5 +19,4 @@ do_install() {
 	oe_runmake install_tests
 }
 
-FILES_${PN}-dbg += "${bindir}/tests_cryptodev/.debug"
 FILES_${PN} = "${bindir}/tests_cryptodev/*"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 22bd3c8..33acb42 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -200,7 +200,6 @@ RSUGGESTS_SCRIPTING = "${@perf_feature_enabled('perf-scripting', '${PN}-perl ${P
 RSUGGESTS_${PN} += "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
 
 FILES_${PN} += "${libexecdir}/perf-core ${exec_prefix}/libexec/perf-core ${libdir}/traceevent"
-FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
 FILES_${PN}-archive = "${libdir}/perf/perf-core/perf-archive"
 FILES_${PN}-tests = "${libdir}/perf/perf-core/tests"
 FILES_${PN}-python = "${libdir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index d0dd42a..97064b8 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -26,5 +26,3 @@ PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 inherit autotools gettext pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
-
-FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index b1ac789..dd9a8a0 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -22,8 +22,6 @@ EXTRA_OEMAKE = "\
     NO_PYTHON=1 \
 "
 
-FILES_${PN}-dbg += "${libdir}/trace-cmd/plugins/.debug"
-
 do_compile_prepend() {
     # Make sure the recompile is OK
     rm -f ${B}/.*.d
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 7cf17d6..5a23754 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -17,7 +17,6 @@ PACKAGES += "libaspell libpspell aspell-utils"
 
 RDEPENDS_${PN}-utils += "perl"
 
-FILES_${PN}-dbg += "${libdir}/aspell-0.60/.debu*"
 FILES_libaspell = "${libdir}/libaspell.so.* ${libdir}/aspell*"
 FILES_aspell-utils = "${bindir}/word-list-compress ${bindir}/aspell-import ${bindir}/run-with-aspell ${bindir}/pre*"
 FILES_${PN} = "${bindir}/aspell"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
index a31d5dc..5715467 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
@@ -23,7 +23,6 @@ EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}
 
 PACKAGES += "${PN}-python"
 
-FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
 FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/nss/nss_3.19.2.bb b/meta/recipes-support/nss/nss_3.19.2.bb
index 65f3204..c51b056 100644
--- a/meta/recipes-support/nss/nss_3.19.2.bb
+++ b/meta/recipes-support/nss/nss_3.19.2.bb
@@ -220,7 +220,6 @@ FILES_${PN}-dev = "\
     ${libdir}/pkgconfig/* \
     ${includedir}/* \
     "
-# FILES_${PN}-dbg is populated automatically
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
index 8f15894..f501372 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -17,4 +17,4 @@ FILES_${PN}-dev += " \
     ${libdir}/pkcs11/p11-kit-trust.so \
 "
 FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
-FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
+
-- 
2.1.4


