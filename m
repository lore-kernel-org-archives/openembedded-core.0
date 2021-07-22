Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.1245.1626993915585253898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e3VJ8FDF;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id w12so279937wro.13
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9xM0aShwhGmuV8Zvbxc4vvP9l/TwitFT6qSNSG2i/w8=;
        b=e3VJ8FDFLraIpETOkIjzzJX+hmcH+QXYWGCAhULMJwbfviXbpi1UQVUbNSx0fc2S8S
         B8gTzNlOSavxv2V2S1uUX5KXps+5IPqsTITTGyqIvDHZaG9LS6UiorxcdGvvxQJbBXqh
         gNELK2cmhe5bGS1wFoxcmCmrwpS/7XJKRBpxPl9JFpwzZOn5Oh4Yj7pCpKj/6eyJ/wfS
         S/HUSE1xsogPgAu2fnqaiUWkEAaeGj9nZVafiguV3cotWL3vQb9URgTsDNzF0p/0+YFY
         l490bAQ4kkU7t6Ie4jmQQwrymTs1c8Z5ZzKK0d/uQKkX5669VFddOChKB+X2b5GDF8bi
         k1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9xM0aShwhGmuV8Zvbxc4vvP9l/TwitFT6qSNSG2i/w8=;
        b=tXeN4aF88tm67mg1o5AJAKmWGPhVkDwkcT1rIBdeIyJVV7gik46xd3dzmvtWroi42W
         snx/rJHjXrXUSOfd7rW4rsZFmeEIbOcm33JgPt9r/95HKsaXkWJBdV8yidioAKGLJk33
         FUvtsP1/lO4qLPIqP+z7ItPjSLyAbdtpMtVX+7RJ1vtCMqlEyi4U2QM1DhAvHFwIrS64
         PBBpK8zAp1qL7pYlIkAN7R0VuHhJBV2OyruUKDMStwdqYHb01kBwN3Id+nmNTbNp5hno
         m3UWsDdqwswune4Cm81yqy++zfmOav4mli8fW4E9LXeSwsv7+VSxUkw/NFk3TA0hqMzd
         O/rg==
X-Gm-Message-State: AOAM532Z9yBLgCyHVGznrgz2kA7/ibWA/MskadYECwa0xgvTdl+vWdX3
	pGlIcjNNXrQP30RkECPZ62YGPs/V7nQkhw==
X-Google-Smtp-Source: ABdhPJwfXw/C7GH0vouI+Wy5nsIutZ5ebNLLaSQtoYDn1nJFOXeUegVcaXAFAF/E3ffVACKDEs1sMA==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr2150582wrs.389.1626993914221;
        Thu, 22 Jul 2021 15:45:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/8] systemd: update 248.3 -> 249.1
Date: Fri, 23 Jul 2021 00:45:02 +0200
Message-Id: <20210722224508.51967-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jinja is now required:
https://github.com/systemd/systemd/commit/e0698c66f4569c91e3fdd54ca77449698ae38704

Drop 0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch as it is a backport.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...md-boot_248.3.bb => systemd-boot_249.1.bb} |  2 +-
 meta/recipes-core/systemd/systemd.inc         |  4 +-
 ...tall-dependency-links-at-install-tim.patch | 38 +++++++++---------
 ...comp-Check-for-__NR_ppoll-before-use.patch | 39 -------------------
 .../{systemd_248.3.bb => systemd_249.1.bb}    |  7 ++--
 5 files changed, 25 insertions(+), 65 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_248.3.bb => systemd-boot_249.1.bb} (98%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
 rename meta/recipes-core/systemd/{systemd_248.3.bb => systemd_249.1.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd-boot_248.3.bb b/meta/recipes-core/systemd/systemd-boot_249.1.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd-boot_248.3.bb
rename to meta/recipes-core/systemd/systemd-boot_249.1.bb
index 249e620f4e..2c0bec4eda 100644
--- a/meta/recipes-core/systemd/systemd-boot_248.3.bb
+++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
 require conf/image-uefi.conf
 
-DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
+DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native python3-jinja2-native"
 
 inherit meson pkgconfig gettext
 inherit deploy
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 0524a25008..0e92a72bb7 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
-SRCBRANCH = "v248-stable"
+SRCREV = "764b74113e36ac5219a4b82a05f311b5a92136ce"
+SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH} \
 "
 
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 8dd22eeb7b..d3af734e06 100644
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,4 +1,4 @@
-From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001
+From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 21 Feb 2019 16:23:24 +0800
 Subject: [PATCH] binfmt: Don't install dependency links at install time for
@@ -25,11 +25,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
  units/systemd-binfmt.service.in         | 4 ++++
  3 files changed, 9 insertions(+), 4 deletions(-)
 
-Index: systemd-stable/units/meson.build
-===================================================================
---- systemd-stable.orig/units/meson.build
-+++ systemd-stable/units/meson.build
-@@ -55,8 +55,7 @@ units = [
+diff --git a/units/meson.build b/units/meson.build
+index 17e9ead9c1..e5502be620 100644
+--- a/units/meson.build
++++ b/units/meson.build
+@@ -59,8 +59,7 @@ units = [
          ['poweroff.target',                     '',
           (with_runlevels ? 'runlevel0.target' : '')],
          ['printer.target',                      ''],
@@ -39,9 +39,9 @@ Index: systemd-stable/units/meson.build
          ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
          ['reboot.target',                       '',
           'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' : '')],
-@@ -166,8 +165,7 @@ in_units = [
-         ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
+@@ -178,8 +177,7 @@ in_units = [
          ['rescue.service',                       ''],
+         ['serial-getty@.service',                ''],
          ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
 -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
 -         'sysinit.target.wants/'],
@@ -49,21 +49,21 @@ Index: systemd-stable/units/meson.build
          ['systemd-bless-boot.service',           'ENABLE_EFI HAVE_BLKID'],
          ['systemd-boot-check-no-failures.service', ''],
          ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
-Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
-===================================================================
---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
-+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
-@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
+index 172c8757ab..f65d8930c6 100644
+--- a/units/proc-sys-fs-binfmt_misc.automount
++++ b/units/proc-sys-fs-binfmt_misc.automount
+@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=/proc/sys/
  
  [Automount]
  Where=/proc/sys/fs/binfmt_misc
 +
 +[Install]
 +WantedBy=sysinit.target
-Index: systemd-stable/units/systemd-binfmt.service.in
-===================================================================
---- systemd-stable.orig/units/systemd-binfmt.service.in
-+++ systemd-stable/units/systemd-binfmt.service.in
+diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
+index fdafce7ff7..4efc05e495 100644
+--- a/units/systemd-binfmt.service.in
++++ b/units/systemd-binfmt.service.in
 @@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
  Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
  DefaultDependencies=no
@@ -73,8 +73,8 @@ Index: systemd-stable/units/systemd-binfmt.service.in
  After=proc-sys-fs-binfmt_misc.mount
  Before=sysinit.target shutdown.target
 @@ -30,3 +31,6 @@ RemainAfterExit=yes
- ExecStart=@rootlibexecdir@/systemd-binfmt
- ExecStop=@rootlibexecdir@/systemd-binfmt --unregister
+ ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
+ ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
  TimeoutSec=90s
 +
 +[Install]
diff --git a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch b/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
deleted file mode 100644
index 0ba5fa2547..0000000000
--- a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 027ac2ad0695bb506460f9dd7e57149b71055887 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Jun 2021 23:21:01 -0700
-Subject: [PATCH] test-seccomp: Check for __NR_ppoll before use
-
-some newer architectures like riscv32 do not have __NR_ppoll from get go
-
-Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19858]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/test/test-seccomp.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/test/test-seccomp.c b/src/test/test-seccomp.c
-index b1f917eb54..daac0fcea8 100644
---- a/src/test/test-seccomp.c
-+++ b/src/test/test-seccomp.c
-@@ -832,7 +832,7 @@ static void test_load_syscall_filter_set_raw(void) {
-                 assert_se(s = hashmap_new(NULL));
- #if defined __NR_poll && __NR_poll >= 0
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(-1)) >= 0);
--#else
-+#elif defined __NR_ppoll
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) >= 0);
- #endif
- 
-@@ -849,7 +849,8 @@ static void test_load_syscall_filter_set_raw(void) {
-                 assert_se(s = hashmap_new(NULL));
- #if defined __NR_poll && __NR_poll >= 0
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(EILSEQ)) >= 0);
--#else
-+#elif defined __NR_ppoll
-+                assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) >= 0);
-                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(EILSEQ)) >= 0);
- #endif
- 
--- 
-2.32.0
-
diff --git a/meta/recipes-core/systemd/systemd_248.3.bb b/meta/recipes-core/systemd/systemd_249.1.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_248.3.bb
rename to meta/recipes-core/systemd/systemd_249.1.bb
index f5022a99c2..9bfb12249c 100644
--- a/meta/recipes-core/systemd/systemd_248.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.1.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux"
+DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
@@ -14,8 +14,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
 # that we don't build both udev and systemd in world builds.
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI += " \
-           file://touchscreen.rules \
+SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
            ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
@@ -26,7 +25,6 @@ SRC_URI += " \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
-           file://0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch \
            "
 
 # patches needed by musl
@@ -687,6 +685,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
                ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
                ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
+               ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
                ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
                ${rootlibexecdir}/udev/rules.d/README \
                ${sysconfdir}/udev \
-- 
2.31.1

