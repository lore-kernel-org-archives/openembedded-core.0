Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web12.15686.1598973761221393312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 08:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lU/tOAq3;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id l9so689166plt.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ceIEBNiPCanOPsUqDwrH1ajD9BzpvbXk1OB0sGYyos8=;
        b=lU/tOAq38gtvsjRp/ktncI712Aa5C/dURQlSVno2fQULUEHhqQRpATWNEurdsr24O+
         Q+3NXlA+lzilsX9VyTmST5tbN9LbHNyKLdflsXjB82L6x1FRQn4YNEcxmGZZCJrEkfYk
         sh5IUtNQqaw+oxiEdidDAW8ef6dsgYQm/W6fzXU+oPa/8RBFl6symTE1OPK5w/x2YD3Q
         z6pWhhh7rcISwgGRlJy+GJPcDUzr96duNWvt31VD1d+5kQKcZQaYJwmW3vlcZtEVgJpA
         cgLrVgBNOR5B10FuDBoXco+bszsvCPzFzWm+nzi6pP97SJMu2hH9H8qsOkI5NTzQ4ENP
         I2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ceIEBNiPCanOPsUqDwrH1ajD9BzpvbXk1OB0sGYyos8=;
        b=KjAhpavJS8yeca6pJnDq7suJuqBujmLJyzvwKAXPPrs7dxWBJnh4A/BLCZDopZLZa0
         MHMztpDgIoPCg+PsYccJDZ3ZF2dZWg5H6KZ7cf+0VGQjNP0I19+TRfIlvdwMJt6CdJ2k
         gn203dvdoFTe0M34TaKX7yWdmG/FrFIpDSmzgAltJO0vmfIpYZfM4TZNenH4O75JxGQO
         pICLyQVqAvEt6sBIzLlHd022zl2lQMDzD5yGaVZU1LpM/Mr3dFqKycLVuybpZf1YAGlz
         ouI1/IhX5IKeiGPT92hwx09ZC4J5ZsWWE6VFU6yUjaUSAE+El3Bek7OUZLfJXvxIijIc
         mHVQ==
X-Gm-Message-State: AOAM5310ySaUm5w0lBKdiCrT224NTZBkMqXzV4YzzKhTRNaI5T5ABS+1
	yJDrN9g0pmXH+xDEh2S808T9M01oNHo=
X-Google-Smtp-Source: ABdhPJxNtb9tVMGPemUBFam5SFVxKDZAZfC7H88y6HHj3alWZEZePGMbwNQOBYY5gI+MPB4vNnef+g==
X-Received: by 2002:a17:902:7d85:: with SMTP id a5mr1902843plm.148.1598973760323;
        Tue, 01 Sep 2020 08:22:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9dcf:ebf9:1f19:e8a8])
        by smtp.gmail.com with ESMTPSA id u5sm2217917pfm.149.2020.09.01.08.22.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 08:22:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] kea: Move from meta-networking
Date: Tue,  1 Sep 2020 08:22:30 -0700
Message-Id: <20200901152236.9377-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901152236.9377-1-akuster808@gmail.com>
References: <20200901152236.9377-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../kea/files/0001-remove-AC_TRY_RUN.patch    | 34 ++++++++++
 .../kea/files/kea-dhcp-ddns.service           | 13 ++++
 .../kea/files/kea-dhcp4.service               | 13 ++++
 .../kea/files/kea-dhcp6.service               | 13 ++++
 meta/recipes-connectivity/kea/kea_1.7.7.bb    | 67 +++++++++++++++++++
 5 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4.service
 create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6.service
 create mode 100644 meta/recipes-connectivity/kea/kea_1.7.7.bb

diff --git a/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch b/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
new file mode 100644
index 00000000000..d7ca9ff8fa5
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-remove-AC_TRY_RUN.patch
@@ -0,0 +1,34 @@
+From 9d6b8321c5b46199baca907f3d42bdcaaf1958a8 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 23 May 2019 23:59:42 -0700
+Subject: [PATCH] remove AC_TRY_RUN
+
+AC_TRY_RUN doesn't work in cross compile env,
+use AC_COMPILE_IFELSE instead to fix below configure
+error:
+ | checking for usuable C++11 regex... configure: error: in `/builddir/tmp/work/core2-64-poky-linux/kea/1.5.0-r0/build':
+ | configure: error: cannot run test program while cross compiling
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c880b77..dd40c7c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,7 +580,7 @@ AC_TRY_COMPILE([
+         AC_MSG_RESULT(no))
+ 
+ AC_MSG_CHECKING(for usuable C++11 regex)
+-AC_TRY_RUN([
++AC_COMPILE_IFELSE([
+ #include <regex>
+ #include <iostream>
+ int main() {
+-- 
+2.21.0
+
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
new file mode 100644
index 00000000000..91aa2eb14f0
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kea DHCP-DDNS Server
+Wants=network-online.target
+After=network-online.target
+After=time-sync.target
+
+[Service]
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/kea
+ExecStart=@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddns.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
new file mode 100644
index 00000000000..b851ea71c53
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kea DHCPv4 Server
+Wants=network-online.target
+After=network-online.target
+After=time-sync.target
+
+[Service]
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+ExecStart=@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
new file mode 100644
index 00000000000..0f9f0ef8d98
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Kea DHCPv6 Server
+Wants=network-online.target
+After=network-online.target
+After=time-sync.target
+
+[Service]
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
+ExecStartPre=@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
+ExecStart=@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/kea/kea_1.7.7.bb b/meta/recipes-connectivity/kea/kea_1.7.7.bb
new file mode 100644
index 00000000000..e25f8e6fb0b
--- /dev/null
+++ b/meta/recipes-connectivity/kea/kea_1.7.7.bb
@@ -0,0 +1,67 @@
+SUMMARY = "ISC Kea DHCP Server"
+DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It supports both DHCPv4 and DHCPv6 protocols along with their extensions, e.g. prefix delegation and dynamic updates to DNS."
+HOMEPAGE = "http://kea.isc.org"
+SECTION = "connectivity"
+LICENSE = "MPL-2.0 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=68d95543d2096459290a4e6b9ceccffa"
+
+DEPENDS += "kea-native"
+
+SRC_URI = "\
+    http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
+    file://0001-remove-AC_TRY_RUN.patch \
+    file://kea-dhcp4.service \
+    file://kea-dhcp6.service \
+    file://kea-dhcp-ddns.service \
+"
+SRC_URI[md5sum] = "4f8d1251fd41ef2e822a4eb3f0797d46"
+SRC_URI[sha256sum] = "0bba8b045672884a928ff4b2a8575ac5ba420eb6ba47a9338f1932bc38dcf866"
+
+inherit autotools systemd
+
+SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-ddns.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+DEBUG_OPTIMIZATION_remove_mips = " -Og"
+DEBUG_OPTIMIZATION_append_mips = " -O"
+BUILD_OPTIMIZATION_remove_mips = " -Og"
+BUILD_OPTIMIZATION_append_mips = " -O"
+
+DEBUG_OPTIMIZATION_remove_mipsel = " -Og"
+DEBUG_OPTIMIZATION_append_mipsel = " -O"
+BUILD_OPTIMIZATION_remove_mipsel = " -Og"
+BUILD_OPTIMIZATION_append_mipsel = " -O"
+
+do_configure_prepend_class-target() {
+    mkdir -p ${B}/src/lib/log/compiler/
+    ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/compiler/kea-msg-compiler
+    # replace abs_top_builddir to avoid introducing the build path
+    # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
+    find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
+    sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
+}
+
+do_install_append_class-target() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
+           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+           ${D}${systemd_system_unitdir}/kea-dhcp*service
+}
+
+do_install_append() {
+    rm -rf "${D}${localstatedir}"
+}
+
+PACKAGECONFIG ??= "openssl log4cplus boost"
+
+PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl,openssl"
+PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
+PACKAGECONFIG[boost] = "--with-boost-libs=-lboost_system,,boost,boost"
+
+FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
+FILES_${PN} += "${libdir}/hooks/*.so"
+
+BBCLASSEXTEND += "native"
+
+PARALLEL_MAKEINST = ""
-- 
2.17.1

