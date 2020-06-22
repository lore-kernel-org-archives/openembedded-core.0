Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.18503.1592835562747478572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cBv7zpNy;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id ne5so8219785pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5OuJ5p9qz+hHcL1nd5uVnD5fXgGAFKCdgH7M6ofTdrM=;
        b=cBv7zpNytkcEmvPDhHJQ0C/rPnC/gxxJkmY3K8QW9YSaVeSO6jSS+kEAos0XswqJDL
         mNypx8hXLOxU4D3gLHCwaglShzn1FvDtxzuQbjc24zLvrYTBMuTlhDWTL4MfrsA2iVtv
         NsVfblpquM6hB3e9gd34VqLnqLgBbe6ploQ1X4DvU6umtB/RyirWEB+uimO2136AoVKf
         wRiiXhyKnsmhPB2gMMxHzVEpCmuWFjLjJ/OcU5sXnjAkjMK9+44kxonJVvC3GMy9sfT4
         IcqXg9kBCRc1aEQCy1JKRTDAFpFvl3PNa03lyhw9sewBWhjXy/P2csZcsuf322vcMc6S
         tE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5OuJ5p9qz+hHcL1nd5uVnD5fXgGAFKCdgH7M6ofTdrM=;
        b=eHWWT/jDs7mfWSIlTLmfuYNLJGjs+K97agQ/X9UKrTDQ/yAJAfRnP8OSxMLEOaJWur
         0+V01SXZCgdFqWyZl6vsxfW6i9IaO3PGOo7mx/ceHD9NNkCxssaYgo5NC60pBIgckP9v
         5lwcJdCknCD1o0BNAM+d+Etfv+G2umq8SQ7QwxBRfGOXeWrKWmAyUUWkXxEEdzGcXvGV
         30Zq4YwrOd4jJLbmGGywWZD1tTbcIIHxcDrrl6rSHy4Kw76AiR7jnu40aLvmbpvnEVo9
         EzN5nIRetBcF8s7AayMxdKdWk/riscVyHwP7TS21XBCwqQP9H6Wi4BmCFID3KLpg/h7E
         bA5A==
X-Gm-Message-State: AOAM530EIvSXZNIE+pYEMNum6vbjy7vFuWACNIkEuzTOOahNXgcYvksG
	1B88pxVRJKb3B9zce71ns8quf6Lc
X-Google-Smtp-Source: ABdhPJw+NYSsZnYMLZcQnc2fxDLGlMWYyBfsvaM05R5ObdFUzcNnyvCN5MUDEPZ1CrTZKshffOJZ2Q==
X-Received: by 2002:a17:90a:6304:: with SMTP id e4mr10874436pjj.22.1592835560978;
        Mon, 22 Jun 2020 07:19:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] dhcp: remove depricated package
Date: Mon, 22 Jun 2020 07:19:14 -0700
Message-Id: <20200622141915.31932-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>

replaces by kea

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc       | 149 ------------------
 ...TH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  27 ----
 ...-limitation-in-linux-dhclient-script.patch |  65 --------
 .../dhcp/dhcp/0002-dhclient-dbus.patch        | 117 --------------
 .../dhcp/dhcp/0003-link-with-lcrypto.patch    |  35 ----
 .../dhcp/0004-Fix-out-of-tree-builds.patch    |  95 -----------
 ...invoke-dhclient-script-failed-on-Rea.patch |  36 -----
 ...gument-to-make-the-libxml2-dependenc.patch |  62 --------
 ...move-dhclient-script-bash-dependency.patch |  28 ----
 ...ct-the-intention-for-xml2-lib-search.patch |  34 ----
 .../dhcp/dhcp/0013-fixup_use_libbind.patch    |  64 --------
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |  21 ---
 12 files changed, 733 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp.inc
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
deleted file mode 100644
index d46130d49b..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ /dev/null
@@ -1,149 +0,0 @@
-SECTION = "console/network"
-SUMMARY = "Internet Software Consortium DHCP package"
-DESCRIPTION = "DHCP (Dynamic Host Configuration Protocol) is a protocol \
-which allows individual devices on an IP network to get their own \
-network configuration information from a server.  DHCP helps make it \
-easier to administer devices."
-
-HOMEPAGE = "http://www.isc.org/"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
-
-DEPENDS = "openssl bind"
-
-SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
-           file://init-relay file://default-relay \
-           file://init-server file://default-server \
-           file://dhclient.conf file://dhcpd.conf \
-           file://dhclient-systemd-wrapper \
-           file://dhclient.service \
-           file://dhcpd.service file://dhcrelay.service \
-           file://dhcpd6.service \
-           "
-UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
-
-inherit autotools-brokensep systemd useradd update-rc.d
-
-USERADD_PACKAGES = "${PN}-server"
-USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
-
-SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay ${PN}-client"
-SYSTEMD_SERVICE_${PN}-server = "dhcpd.service dhcpd6.service"
-SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
-
-SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
-SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
-
-SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
-SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
-
-INITSCRIPT_PACKAGES = "dhcp-server"
-INITSCRIPT_NAME_dhcp-server = "dhcp-server"
-INITSCRIPT_PARAMS_dhcp-server = "defaults"
-
-CFLAGS += "-D_GNU_SOURCE"
-EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
-                --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
-                --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
-                --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
-                --enable-paranoia --disable-static \
-                --with-randomdev=/dev/random \
-                --with-libbind=${STAGING_DIR_HOST} \
-		--enable-libtool \
-               "
-
-#Enable shared libs per dhcp README
-do_configure_prepend () {
-	cp configure.ac+lt configure.ac
-}
-
-do_install_append () {
-	install -d ${D}${sysconfdir}/init.d
-	install -d ${D}${sysconfdir}/default
-	install -d ${D}${sysconfdir}/dhcp
-	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
-	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
-	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
-	install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dhcp-server
-
-	rm -f ${D}${sysconfdir}/dhclient.conf*
-	rm -f ${D}${sysconfdir}/dhcpd.conf*
-	install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclient.conf
-	install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.conf
-
-	install -d ${D}${base_sbindir}/
-	if [ "${sbindir}" != "${base_sbindir}" ]; then
-		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
-	fi
-	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
-
-	# Install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dhcpd6.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service ${D}${systemd_unitdir}/system/dhcrelay.service
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
-	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
-	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
-
-	install -d ${D}${base_sbindir}
-	install -m 0755 ${WORKDIR}/dhclient-systemd-wrapper ${D}${base_sbindir}/dhclient-systemd-wrapper
-	install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhclient.service
-	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/dhclient.service
-}
-
-PACKAGES += "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
-
-PACKAGES_remove = "${PN}"
-RDEPENDS_${PN}-client += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'iproute2', '', d)}"
-RDEPENDS_${PN}-dev = ""
-RDEPENDS_${PN}-staticdev = ""
-FILES_${PN}-libs = "${libdir}/libdhcpctl.so.0* ${libdir}/libomapi.so.0* ${libdir}/libdhcp.so.0*"
-
-FILES_${PN}-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
-RRECOMMENDS_${PN}-server = "dhcp-server-config"
-
-FILES_${PN}-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
-
-FILES_${PN}-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
-
-FILES_${PN}-client = "${base_sbindir}/dhclient \
-                      ${base_sbindir}/dhclient-script \
-                      ${sysconfdir}/dhcp/dhclient.conf \
-                      ${base_sbindir}/dhclient-systemd-wrapper \
-                     "
-
-FILES_${PN}-omshell = "${bindir}/omshell"
-
-pkg_postinst_dhcp-server() {
-    mkdir -p $D/${localstatedir}/lib/dhcp
-    touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
-    touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
-}
-
-pkg_postinst_dhcp-client() {
-    mkdir -p $D/${localstatedir}/lib/dhcp
-}
-
-pkg_postrm_dhcp-server() {
-    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
-    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
-
-    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
-        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
-    fi
-}
-
-pkg_postrm_dhcp-client() {
-    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
-    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
-
-    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
-        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
-    fi
-}
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
deleted file mode 100644
index d1b57f0bb4..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7cc29144535a622fc671dc86eb1da65b0473a7c4 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 16:14:22 +0800
-Subject: [PATCH 01/11] define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
-
-Upstream-Status: Inappropriate [OE specific]
-
-Rebase to 4.3.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- includes/site.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: dhcp-4.4.1/includes/site.h
-===================================================================
---- dhcp-4.4.1.orig/includes/site.h
-+++ dhcp-4.4.1/includes/site.h
-@@ -148,7 +148,8 @@
- /* Define this if you want the dhcpd.conf file to go somewhere other than
-    the default location.   By default, it goes in /etc/dhcpd.conf. */
- 
--/* #define _PATH_DHCPD_CONF	"/etc/dhcpd.conf" */
-+#define _PATH_DHCPD_CONF	"/etc/dhcp/dhcpd.conf"
-+#define _PATH_DHCLIENT_CONF	"/etc/dhcp/dhclient.conf"
- 
- /* Network API definitions.   You do not need to choose one of these - if
-    you don't choose, one will be chosen for you in your system's config
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch
deleted file mode 100644
index 2359381b93..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-workaround-busybox-limitation-in-linux-dhclient-script.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From eec0503cfc36f63d777f5cb3f2719cecedcb8468 Mon Sep 17 00:00:00 2001
-From: Haris Okanovic <haris.okanovic@ni.com>
-Date: Mon, 7 Jan 2019 13:22:09 -0600
-Subject: [PATCH] Workaround busybox limitation in Linux dhclient-script
-
-Busybox is a lightweight implementation of coreutils commonly used on
-space-constrained embedded Linux distributions. It's implementation of
-chown and chmod doesn't provide a "--reference" option added to
-client/scripts/linux as of commit 9261cb14. This change works around
-that limitation by using stat to read ownership and permissions flags
-and simple chown/chmod calls supported in both coreutils and busybox.
-
-    modified:   client/scripts/linux
-
-Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
-Upstream-Status: Pending [ISC-Bugs #48771]
----
- client/scripts/linux | 17 +++++++++++++----
- 1 file changed, 13 insertions(+), 4 deletions(-)
-
-diff --git a/client/scripts/linux b/client/scripts/linux
-index 0c429697..2435a44b 100755
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -32,6 +32,17 @@
- # if your system holds ip tool in a non-standard location.
- ip=/sbin/ip
- 
-+chown_chmod_by_reference() {
-+    local reference_file="$1"
-+    local target_file="$2"
-+
-+    local owner=$(stat -c "%u:%g" "$reference_file")
-+    local perm=$(stat -c "%a" "$reference_file")
-+
-+    chown "$owner" "$target_file"
-+    chmod "$perm" "$target_file"
-+}
-+
- # update /etc/resolv.conf based on received values
- # This updated version mostly follows Debian script by Andrew Pollock et al.
- make_resolv_conf() {
-@@ -74,8 +85,7 @@ make_resolv_conf() {
-         fi
- 
- 	if [ -f /etc/resolv.conf ]; then
--	    chown --reference=/etc/resolv.conf $new_resolv_conf
--	    chmod --reference=/etc/resolv.conf $new_resolv_conf
-+	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
- 	fi
-         mv -f $new_resolv_conf /etc/resolv.conf
-     # DHCPv6
-@@ -101,8 +111,7 @@ make_resolv_conf() {
-         fi
- 
- 	if [ -f /etc/resolv.conf ]; then
--            chown --reference=/etc/resolv.conf $new_resolv_conf
--            chmod --reference=/etc/resolv.conf $new_resolv_conf
-+	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
- 	fi
-         mv -f $new_resolv_conf /etc/resolv.conf
-     fi
--- 
-2.20.0
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
deleted file mode 100644
index 101c33f677..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From be7540d31c356e80ee02e90e8bf162b7ac6e5ba5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 14:56:56 +0800
-Subject: [PATCH 02/11] dhclient dbus
-
-Upstream-Status: Inappropriate [distribution]
-
-Rebase to 4.3.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/scripts/bsdos   | 5 +++++
- client/scripts/freebsd | 5 +++++
- client/scripts/linux   | 5 +++++
- client/scripts/netbsd  | 5 +++++
- client/scripts/openbsd | 5 +++++
- client/scripts/solaris | 5 +++++
- 6 files changed, 30 insertions(+)
-
-diff --git a/client/scripts/bsdos b/client/scripts/bsdos
-index d69d0d8..095b143 100755
---- a/client/scripts/bsdos
-+++ b/client/scripts/bsdos
-@@ -45,6 +45,11 @@ exit_with_hooks() {
-     . /etc/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
-diff --git a/client/scripts/freebsd b/client/scripts/freebsd
-index 8f3e2a2..ad7fb44 100755
---- a/client/scripts/freebsd
-+++ b/client/scripts/freebsd
-@@ -89,6 +89,11 @@ exit_with_hooks() {
-     . /etc/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
-diff --git a/client/scripts/linux b/client/scripts/linux
-index 5fb1612..3d447b6 100755
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -174,6 +174,11 @@ exit_with_hooks() {
-         exit_status=$?
-     fi
- 
-+    if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+        dbus-send --system --dest=com.redhat.dhcp \
-+           --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+           'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+    fi
-     exit $exit_status
- }
- 
-diff --git a/client/scripts/netbsd b/client/scripts/netbsd
-index 07383b7..aaba8e8 100755
---- a/client/scripts/netbsd
-+++ b/client/scripts/netbsd
-@@ -45,6 +45,11 @@ exit_with_hooks() {
-     . /etc/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
-diff --git a/client/scripts/openbsd b/client/scripts/openbsd
-index e7f4746..56b980c 100644
---- a/client/scripts/openbsd
-+++ b/client/scripts/openbsd
-@@ -45,6 +45,11 @@ exit_with_hooks() {
-     . /etc/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
-diff --git a/client/scripts/solaris b/client/scripts/solaris
-index af553b9..4a2aa69 100755
---- a/client/scripts/solaris
-+++ b/client/scripts/solaris
-@@ -26,6 +26,11 @@ exit_with_hooks() {
-     . /etc/dhclient-exit-hooks
-   fi
- # probably should do something with exit status of the local script
-+  if [ x$dhc_dbus != x -a $exit_status -eq 0 ]; then
-+    dbus-send --system --dest=com.redhat.dhcp \
-+      --type=method_call /com/redhat/dhcp/$interface com.redhat.dhcp.set \
-+      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\='`"
-+  fi
-   exit $exit_status
- }
- 
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
deleted file mode 100644
index 5b35933a54..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d80bd792323dbd56269309f85b4506eb6b1b60e9 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Tue, 15 Aug 2017 15:05:47 +0800
-Subject: [PATCH 03/11] link with lcrypto
-
-From 4.2.0 final release, -lcrypto check was removed and we compile
-static libraries
-from bind that are linked to libcrypto. This is why i added a patch in
-order to add
--lcrypto to LIBS.
-
-Upstream-Status: Pending
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Rebase to 4.3.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: dhcp-4.4.1/configure.ac
-===================================================================
---- dhcp-4.4.1.orig/configure.ac
-+++ dhcp-4.4.1/configure.ac
-@@ -612,6 +612,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]],
- # Look for optional headers.
- AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
- 
-+# find an MD5 library
-+AC_SEARCH_LIBS(MD5_Init, [crypto])
-+AC_SEARCH_LIBS(MD5Init, [crypto])
-+
- # Solaris needs some libraries for functions
- AC_SEARCH_LIBS(socket, [socket])
- AC_SEARCH_LIBS(inet_ntoa, [nsl])
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch b/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
deleted file mode 100644
index 7b57730ffb..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-builds.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From cccec0344d68dac4100b6f260ee24e7c2da9dfda Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 15:08:22 +0800
-Subject: [PATCH 04/11] Fix out of tree builds
-
-Upstream-Status: Pending
-
-RP 2013/03/21
-
-Rebase to 4.3.6
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/Makefile.am  | 4 ++--
- common/Makefile.am  | 3 ++-
- dhcpctl/Makefile.am | 2 ++
- omapip/Makefile.am  | 1 +
- relay/Makefile.am   | 2 +-
- server/Makefile.am  | 2 +-
- 6 files changed, 9 insertions(+), 5 deletions(-)
-
-Index: dhcp-4.4.1/common/Makefile.am
-===================================================================
---- dhcp-4.4.1.orig/common/Makefile.am
-+++ dhcp-4.4.1/common/Makefile.am
-@@ -1,4 +1,5 @@
--AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
-+
- AM_CFLAGS = $(LDAP_CFLAGS)
- 
- lib_LIBRARIES = libdhcp.a
-Index: dhcp-4.4.1/dhcpctl/Makefile.am
-===================================================================
---- dhcp-4.4.1.orig/dhcpctl/Makefile.am
-+++ dhcp-4.4.1/dhcpctl/Makefile.am
-@@ -3,6 +3,8 @@ BINDLIBDNSDIR=@BINDLIBDNSDIR@
- BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
- BINDLIBISCDIR=@BINDLIBISCDIR@
- 
-+AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
-+
- bin_PROGRAMS = omshell
- lib_LIBRARIES = libdhcpctl.a
- noinst_PROGRAMS = cltest
-Index: dhcp-4.4.1/server/Makefile.am
-===================================================================
---- dhcp-4.4.1.orig/server/Makefile.am
-+++ dhcp-4.4.1/server/Makefile.am
-@@ -4,7 +4,7 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
- 
--AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
- 
- dist_sysconf_DATA = dhcpd.conf.example
- sbin_PROGRAMS = dhcpd
-Index: dhcp-4.4.1/client/Makefile.am
-===================================================================
---- dhcp-4.4.1.orig/client/Makefile.am
-+++ dhcp-4.4.1/client/Makefile.am
-@@ -5,7 +5,7 @@
- SUBDIRS = . tests
- 
- AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"'
--AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"'
-+AM_CPPFLAGS += -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
- 
- dist_sysconf_DATA = dhclient.conf.example
- sbin_PROGRAMS = dhclient
-Index: dhcp-4.4.1/omapip/Makefile.am
-===================================================================
---- dhcp-4.4.1.orig/omapip/Makefile.am
-+++ dhcp-4.4.1/omapip/Makefile.am
-@@ -2,6 +2,7 @@ BINDLIBIRSDIR=@BINDLIBIRSDIR@
- BINDLIBDNSDIR=@BINDLIBDNSDIR@
- BINDLIBISCCFGDIR=@BINDLIBISCCFGDIR@
- BINDLIBISCDIR=@BINDLIBISCDIR@
-+AM_CPPFLAGS = -I$(top_srcdir)/includes
- 
- lib_LIBRARIES = libomapi.a
- noinst_PROGRAMS = svtest
-Index: dhcp-4.4.1/relay/Makefile.am
-===================================================================
---- dhcp-4.4.1.orig/relay/Makefile.am
-+++ dhcp-4.4.1/relay/Makefile.am
-@@ -1,6 +1,6 @@
- SUBDIRS = . tests
-
--AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
-+AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
-
- sbin_PROGRAMS = dhcrelay
- dhcrelay_SOURCES = dhcrelay.c
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch b/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
deleted file mode 100644
index dd56381b1d..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2e8ff0e4f6d39e346ea86b8c514ab4ccc78fa359 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 15:24:14 +0800
-Subject: [PATCH 05/11] dhcp-client: fix invoke dhclient-script failed on
- Read-only file system
-
-In read-only file system, '/etc' is on the readonly partition,
-and '/etc/resolv.conf' is symlinked to a separate writable
-partition.
-
-In this situation, we create temp files 'resolv.conf.dhclient-new'
-in /tmp dir.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/scripts/linux | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/client/scripts/linux b/client/scripts/linux
-index 3d447b6..3122a75 100755
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -40,7 +40,7 @@ make_resolv_conf() {
-     # DHCPv4
-     if [ -n "$new_domain_search" ] || [ -n "$new_domain_name" ] ||
-        [ -n "$new_domain_name_servers" ]; then
--        new_resolv_conf=/etc/resolv.conf.dhclient-new
-+        new_resolv_conf=/tmp/resolv.conf.dhclient-new
-         rm -f $new_resolv_conf
- 
-         if [ -n "$new_domain_name" ]; then
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch b/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
deleted file mode 100644
index feb0754fff..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 7107511fd209f08f9a96f8938041ae48f3295895 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 15 Aug 2017 16:17:49 +0800
-Subject: [PATCH 07/11] Add configure argument to make the libxml2 dependency
- explicit and determinisitic.
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Rebase to 4.3.6
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-Index: dhcp-4.4.1/configure.ac
-===================================================================
---- dhcp-4.4.1.orig/configure.ac
-+++ dhcp-4.4.1/configure.ac
-@@ -642,6 +642,17 @@ if test "$have_nanosleep" = "rt"; then
- 	LIBS="-lrt $LIBS"
- fi
- 
-+AC_ARG_WITH(libxml2,
-+	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
-+	with_libxml2="$withval", with_libxml2="no")
-+
-+if test x$with_libxml2 != xno; then
-+	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
-+		[if test x$with_libxml2 != xauto; then
-+			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
-+		fi])
-+fi
-+
- # check for /dev/random (declares HAVE_DEV_RANDOM)
- AC_MSG_CHECKING(for random device)
- AC_ARG_WITH(randomdev,
-Index: dhcp-4.4.1/configure.ac+lt
-===================================================================
---- dhcp-4.4.1.orig/configure.ac+lt
-+++ dhcp-4.4.1/configure.ac+lt
-@@ -909,6 +909,18 @@ elif test "$want_libtool" = "yes" -a "$u
- fi
- AM_CONDITIONAL(INSTALL_BIND, test "$want_install_bind" = "yes")
- 
-+AC_ARG_WITH(libxml2,
-+	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed if bind was built with xml2 support enabled]),
-+	with_libxml2="$withval", with_libxml2="no")
-+
-+if test x$with_libxml2 != xno; then
-+	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
-+		[if test x$with_libxml2 != xauto; then
-+			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
-+		fi])
-+fi
-+
-+
- # OpenLDAP support.
- AC_ARG_WITH(ldap,
-     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (default is no)]),
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch b/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
deleted file mode 100644
index 912b6d6312..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0009-remove-dhclient-script-bash-dependency.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f3f8b7726e50e24ef3edf5fa5a17e31d39118d7e Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 15 Aug 2017 15:49:31 +0800
-Subject: [PATCH 09/11] remove dhclient-script bash dependency
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-Rebase to 4.3.6
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- client/scripts/linux | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/client/scripts/linux b/client/scripts/linux
-index 3122a75..1712d7d 100755
---- a/client/scripts/linux
-+++ b/client/scripts/linux
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # dhclient-script for Linux. Dan Halbert, March, 1997.
- # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
- # No guarantees about this. I'm a novice at the details of Linux
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
deleted file mode 100644
index 39ba65fbc4..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 501543b3ef715488a142e3d301ff2733aa33eec7 Mon Sep 17 00:00:00 2001
-From: Awais Belal <awais_belal@mentor.com>
-Date: Wed, 25 Oct 2017 21:00:05 +0500
-Subject: [PATCH] dhcp: correct the intention for xml2 lib search
-
-A missing case breaks the build when libxml2 is
-required and found appropriately. The third argument
-to the function AC_SEARCH_LIB is action-if-found which
-was mistakenly been used for the case where the library
-is not found and hence breaks the configure phase
-where it shoud actually pass.
-We now pass on silently when action-if-found is
-executed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Awais Belal <awais_belal@mentor.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dhcp-4.4.1/configure.ac
-===================================================================
---- dhcp-4.4.1.orig/configure.ac
-+++ dhcp-4.4.1/configure.ac
-@@ -647,7 +647,7 @@ AC_ARG_WITH(libxml2,
- 	with_libxml2="$withval", with_libxml2="no")
- 
- if test x$with_libxml2 != xno; then
--	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
-+	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
- 		[if test x$with_libxml2 != xauto; then
- 			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
- 		fi])
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch b/meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
deleted file mode 100644
index fcec010bd0..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp/0013-fixup_use_libbind.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-lib and include path is hardcoded for use_libbind 
-
-use libdir and includedir vars
-
-Upstream-Status: Pending
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
-Index: dhcp-4.4.1/configure.ac+lt
-===================================================================
---- dhcp-4.4.1.orig/configure.ac+lt
-+++ dhcp-4.4.1/configure.ac+lt
-@@ -801,22 +801,22 @@ no)
- 	if test ! -d "$use_libbind"; then
- 		AC_MSG_ERROR([Cannot find bind directory at $use_libbind])
- 	fi
--	if test ! -d "$use_libbind/include" -o \
--	        ! -f "$use_libbind/include/isc/buffer.h"
-+	if test ! -d "$use_libbind/$includedir" -o \
-+	        ! -f "$use_libbind/$includedir/isc/buffer.h"
- 	then
--		AC_MSG_ERROR([Cannot find bind includes at $use_libbind/include])
-+		AC_MSG_ERROR([Cannot find bind includes at $use_libbind/$includedir])
- 	fi
--	if test	! -d "$use_libbind/lib" -o \
--	        \( ! -f "$use_libbind/lib/libisc.a" -a \
--		   ! -f	"$use_libbind/lib/libisc.la" \)
-+	if test	! -d "$use_libbind/$libdir" -o \
-+	        \( ! -f "$use_libbind/$libdir/libisc.a" -a \
-+		   ! -f	"$use_libbind/$libdir/libisc.la" \)
- 	then
--		AC_MSG_ERROR([Cannot find bind libraries at $use_libbind/lib])
-+		AC_MSG_ERROR([Cannot find bind libraries at $use_libbind/$libdir])
- 	fi
- 	BINDDIR="$use_libbind"
--	BINDLIBIRSDIR="$BINDDIR/lib"
--	BINDLIBDNSDIR="$BINDDIR/lib"
--	BINDLIBISCCFGDIR="$BINDDIR/lib"
--	BINDLIBISCDIR="$BINDDIR/lib"	
-+	BINDLIBIRSDIR="$BINDDIR/$libdir"
-+	BINDLIBDNSDIR="$BINDDIR/$libdir"
-+	BINDLIBISCCFGDIR="$BINDDIR/$libdir"
-+	BINDLIBISCDIR="$BINDDIR/$libdir"
- 	DISTCHECK_LIBBIND_CONFIGURE_FLAG="--with-libbind=$use_libbind"
- 	;;
- esac
-@@ -856,14 +856,14 @@ AC_ARG_ENABLE(libtool,
- 
- if test "$use_libbind" != "no"; then
- 	if test "$want_libtool" = "yes" -a \
--	        ! -f "$use_libbind/lib/libisc.la"
-+	        ! -f "$use_libbind/$libdir/libisc.la"
- 	then
--		AC_MSG_ERROR([Cannot find dynamic libraries at $use_libbind/lib])
-+		AC_MSG_ERROR([Cannot find dynamic libraries at $use_libbind/$libdir])
- 	fi
- 	if test "$want_libtool" = "no" -a \
--	        ! -f "$use_libbind/lib/libisc.a"
-+	        ! -f "$use_libbind/$libdir/libisc.a"
- 	then
--		AC_MSG_ERROR([Cannot find static libraries at $use_libbind/lib])
-+		AC_MSG_ERROR([Cannot find static libraries at $use_libbind/$libdir])
- 	fi
- fi
- 
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
deleted file mode 100644
index b56a204821..0000000000
--- a/meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require dhcp.inc
-
-SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch \
-            file://0002-dhclient-dbus.patch \
-            file://0003-link-with-lcrypto.patch \
-            file://0004-Fix-out-of-tree-builds.patch \
-            file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
-            file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
-            file://0009-remove-dhclient-script-bash-dependency.patch \
-            file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
-            file://0013-fixup_use_libbind.patch \
-            file://0001-workaround-busybox-limitation-in-linux-dhclient-script.patch \
-"
-
-SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
-SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
-
-LDFLAGS_append = " -pthread"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
2.17.1

