Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id C7A90783DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:07:10 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id x5-v6so4604322pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Aug 2018 19:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wr9gWUxko6uLq01v5vr8aAhpdiwKJ70Cm/0L92KVg0o=;
	b=bwjL7xsph64beybK2x/yJKULtgob6WSLjujaChqjkmDfuGu+wbNBBpVCeCU35PHnv9
	aTSJKvkXFL3efctzYlc+am50vYR7hPKLKn5P3kHxmKD2YZzfhgoooaFCZdppefvAVgGl
	9/WJj++4Sm3L4lFR7StLhmBNVPqubD6OaovtpXoCUT2zjq1Wc1akuFL6ONz2L7L0RZtl
	Yywx1ZfDZPGXlOY1PixBBJGFe0YPPwUhIiL5Wn+KzanLZCg2L4zckt+UWDGm1DDPeRrZ
	IGmcW3fXfJCeAwekSZR5JJ8/m3aP6rscJkHFAsOsRZf2/PCL5gxk+45yqvCNtJQaTXhx
	aY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wr9gWUxko6uLq01v5vr8aAhpdiwKJ70Cm/0L92KVg0o=;
	b=dfbVd7Fuv7UEyRWW5w0PxCLJkGrTySUuon2wmrjldAoIr7uw7XPA8s3a1cUM5UOJZE
	pzgfcmgwOM4Aj4HpZzMAyNQGLf8Nz0oP3DSQ7nEZThOoDz8NzIwVZKUpbOL9MOiQqn29
	go7VN9eouGqf2qAxjgHSvoVqtgDPB3LGPI2eD5bWnjDKx0gPo8yQQyFdqDAIHgVRIOqP
	PC4DPcVKsrD8VUShTg2jnm12sSLlTqHTXLUhkZ3ypCmof1/OOszKjzyyMnVd4UtgklTx
	70q/gVjkSGyT0VdHJXHnfrHbT94rLDFskEW5aoJ5FliQ/ZCn+l6FqX3ItG31wVlUuBGT
	hIiw==
X-Gm-Message-State: AOUpUlFqQQmJiNGMoivUrYAr49Ets/mRMOXg//o6lob6bUdwlFMHAXPj
	3GyTxpBtg7MID+O9HIx5NBNLilXl
X-Google-Smtp-Source: AAOMgpeqNEFffMZUwH4qSfcmzgtUrH/IX/YA7DWMoiUO3czh6dCmePSmVIN5dlfQDDoehCabP0rmDA==
X-Received: by 2002:a63:5350:: with SMTP id
	t16-v6mr9284803pgl.196.1533434831508; 
	Sat, 04 Aug 2018 19:07:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	b195-v6sm4486021pfb.2.2018.08.04.19.07.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 19:07:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Aug 2018 19:06:54 -0700
Message-Id: <13750489ed148df9baf77c15b2faab06683be9a2.1533434674.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
References: <cover.1533434674.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] systemd: Detect if statx struct is defined in sys/stat.h
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
X-List-Received-Date: Sun, 05 Aug 2018 02:07:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixed build with glibc 2.28+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-whether-struct-statx-is-defined-in-.patch | 109 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch

diff --git a/meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch b/meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
new file mode 100644
index 0000000000..962463f0b8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
@@ -0,0 +1,109 @@
+From 75720bff62a84896e9a0654afc7cf9408cf89a38 Mon Sep 17 00:00:00 2001
+From: Filipe Brandenburger <filbranden@google.com>
+Date: Sun, 15 Jul 2018 22:43:35 -0700
+Subject: [PATCH] build-sys: Detect whether struct statx is defined in
+ sys/stat.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Starting with glibc 2.27.9000-36.fc29, include file sys/stat.h will have a
+definition for struct statx, in which case include file linux/stat.h should be
+avoided, in order to prevent a duplicate definition.
+
+    In file included from ../src/basic/missing.h:18,
+		     from ../src/basic/util.h:28,
+		     from ../src/basic/hashmap.h:10,
+		     from ../src/shared/bus-util.h:12,
+		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
+    /usr/include/linux/stat.h:99:8: error: redefinition of ‘struct statx’
+     struct statx {
+	    ^~~~~
+    In file included from /usr/include/sys/stat.h:446,
+		     from ../src/basic/util.h:19,
+		     from ../src/basic/hashmap.h:10,
+		     from ../src/shared/bus-util.h:12,
+		     from ../src/libsystemd/sd-bus/bus-creds.c:11:
+    /usr/include/bits/statx.h:36:8: note: originally defined here
+     struct statx
+	    ^~~~~
+
+Extend our meson.build to look for struct statx when only sys/stat.h is
+included and, in that case, do not include linux/stat.h anymore.
+
+Tested that systemd builds correctly when using a glibc version that includes a
+definition for struct statx.
+
+glibc Fedora RPM update:
+https://src.fedoraproject.org/rpms/glibc/c/28cb5d31fc1e5887912283c889689c47076278ae
+
+glibc upstream commit:
+https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=fd70af45528d59a00eb3190ef6706cb299488fcd
+---
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ meson.build            | 5 +++++
+ src/basic/missing.h    | 5 ++++-
+ src/basic/xattr-util.c | 1 -
+ 3 files changed, 9 insertions(+), 2 deletions(-)
+
+Index: git/meson.build
+===================================================================
+--- git.orig/meson.build
++++ git/meson.build
+@@ -432,6 +432,7 @@ decl_headers = '''
+ #include <sys/stat.h>
+ '''
+ # FIXME: key_serial_t is only defined in keyutils.h, this is bound to fail
++# FIXME: these should use -D_GNU_SOURCE, since that is defined at build time
+ 
+ foreach decl : ['char16_t',
+                 'char32_t',
+@@ -446,6 +447,10 @@ foreach decl : ['char16_t',
+         conf.set10('HAVE_' + decl.underscorify().to_upper(), have)
+ endforeach
+ 
++conf.set10('HAVE_STRUCT_STATX_IN_SYS_STAT_H', cc.sizeof('struct statx', prefix : '''
++#include <sys/stat.h>
++''', args : '-D_GNU_SOURCE') > 0)
++
+ foreach decl : [['IFLA_INET6_ADDR_GEN_MODE',         'linux/if_link.h'],
+                 ['IN6_ADDR_GEN_MODE_STABLE_PRIVACY', 'linux/if_link.h'],
+                 ['IFLA_VRF_TABLE',                   'linux/if_link.h'],
+Index: git/src/basic/missing.h
+===================================================================
+--- git.orig/src/basic/missing.h
++++ git/src/basic/missing.h
+@@ -15,7 +15,6 @@
+ #include <linux/neighbour.h>
+ #include <linux/oom.h>
+ #include <linux/rtnetlink.h>
+-#include <linux/stat.h>
+ #include <net/ethernet.h>
+ #include <stdlib.h>
+ #include <sys/resource.h>
+@@ -25,6 +24,10 @@
+ #include <uchar.h>
+ #include <unistd.h>
+ 
++#if !HAVE_STRUCT_STATX_IN_SYS_STAT_H
++#include <linux/stat.h>
++#endif
++
+ #if HAVE_AUDIT
+ #include <libaudit.h>
+ #endif
+Index: git/src/basic/xattr-util.c
+===================================================================
+--- git.orig/src/basic/xattr-util.c
++++ git/src/basic/xattr-util.c
+@@ -2,7 +2,6 @@
+ 
+ #include <errno.h>
+ #include <fcntl.h>
+-#include <linux/stat.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 001a363444..67f6117a2a 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -28,6 +28,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
            file://0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch \
            file://0001-sd-bus-make-BUS_DEFAULT_TIMEOUT-configurable.patch \
+           file://0022-build-sys-Detect-whether-struct-statx-is-defined-in-.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.18.0


