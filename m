Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.18502.1592835560780064585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HAZ8e+2Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id jz3so8239472pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8pTjrRO4hzQohHMpMJyw3ELviIFPXxwMncup7A2DlkM=;
        b=HAZ8e+2YOPRdIoqOB06AiqH/jyaUTEE4N1ZUXj6BOZBMVifr/TMlT7ZmQjEvUNbjqk
         sonYExf5d9oAFXjez0D23Jpk9ixjSlpNFNUCdqo+DP4F3W0eObypkcu4/vMeOPfYcgkT
         sQYlXJ8uPRgfXFZvK3OjzXQ4L+uV0TaIhRhZ1naBBKV913VSUGUZTRR+t219qlWjDmXe
         sngBtl6JtavDpq61eE2jN6VV4msTQzjUQJRrlPJHSDaA4pDSinhUpWCPgELuft+H1Y+i
         EoalRBvMcZOjZ82AMnOhKItOcrIiO48ylw4mLIjxShlDW9O7Zi3EBhOmrV5JuAo3MUVO
         USyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8pTjrRO4hzQohHMpMJyw3ELviIFPXxwMncup7A2DlkM=;
        b=oJZbOqS71lWI6Cy0gJrR7Qt+7DSaf+3gshpK2vQwjlRcg1xxEnZbt5IsQvJZscfGqI
         lxRmlZ/UNNnBgsftmhY4F4LY1wOKRb5tyPW9sm+VBqY6kyUgcCB9iC5BbOcD4l7VCdED
         6Z8RgZJafwU/TN/5g1GDoslbecDtJunfYCWFdQ8GNKod2S8+h3FD1TP6NdIGCclcJheH
         4IrQvRnXGxCbMcl9/CFYvWDXiU42gkel0vTlVVHxAbzBQfYycIGcJkYItVA837Gi9iEp
         Ok9I/sCl3vz81Oyjv7kNYY1yhsDVK7SqKuyhkCodj0L/rV/ZYEoXu3NB+AC2cBjB63xK
         4v1A==
X-Gm-Message-State: AOAM533rNvUYe1Owr+guppjt2NFex4oF9YNL9mfiCQD+Srn2BISte4Sd
	MyeWjtPM3thch+pWnwc/hxqMhuVq
X-Google-Smtp-Source: ABdhPJx1CPEFeMWCemYZDeWp7EEH3/LjwkznbSFgln5PFS0QNGl2CJhn/Gz0YNTYUEVECCZvSjF63w==
X-Received: by 2002:a17:90b:11d8:: with SMTP id gv24mr19204325pjb.66.1592835560069;
        Mon, 22 Jun 2020 07:19:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] kea: Move to core
Date: Mon, 22 Jun 2020 07:19:13 -0700
Message-Id: <20200622141915.31932-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>

ISC dhcp is being retiered by kea.

Move kea from meta-oe to core

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
index 0000000000..d7ca9ff8fa
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
index 0000000000..91aa2eb14f
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
index 0000000000..b851ea71c5
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
index 0000000000..0f9f0ef8d9
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
index 0000000000..e25f8e6fb0
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

