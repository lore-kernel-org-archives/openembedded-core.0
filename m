Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C16FB5E82
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:32:02 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63501.1773700314609487228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 15:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XXRQXtVy;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: danismostlikely@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64ca09f2056so3857717d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 15:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700313; x=1774305113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPCIGeDoCwyCBCyNm7J6ZepVv93hXnRrVKu1O5wTYT8=;
        b=XXRQXtVy8IXheFJTIR+cvLy5I21u3ORY3gK6Q0taMEYLQ6JC/rV24QHUqRd4A2KFmr
         iE76VZtXeMMTQxWrieKXogrIv7y0OxZl2J1hf7vJNgmhO5vkC1UbAhydaMc+0FOy/u4c
         MH6r7XaMjlCFYgoaok7m4aVT15a+elvwNo8DpWE58RqybXTEGZGV7zY9aWxh36RhDsvA
         jfVl35edIhU+6yIjmGvsp3L5hRcbkX8elKnXBbYesGVIkFFzBk8C0jgWwI4He9ovOTZZ
         atZYSWF3nY4miX0ix93yuoVtO1kNSAYmiepahDZMBjL/BJAAWkKZr7pBAfPcuLeb6VeY
         rPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700313; x=1774305113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPCIGeDoCwyCBCyNm7J6ZepVv93hXnRrVKu1O5wTYT8=;
        b=N56Z4Qncxf+YQSPFWUaH1qa8xEJqX88xYQUT4ky3GtsvhADsRrDjiKbBa+2hnNSXGE
         BJHl3jYCpPQM5AGqPe0RlkTPetsOXCK6rjYaONGEVsspmMJx1B/sVXXSVsv0KCj5B8no
         2oyq1w3nfbgtKplIEtsgdvjfbWpsiLi5gdR9Q0mshoXG5Mg0X5JXg3bbC7hLbsWyrCAs
         uQL4hi/qhb0KPPVVfEbotyq0pEge3oKi5uUC4AXmWQkgSHRBqDAugZQ9I5bGR4zt6+a4
         /fHpyYlk5oDVZ+uH8AgSeubk1GFz8mkU+E+xw08HT5FuXwmgenXeMQ5IOEehzzJzpx5B
         m9qA==
X-Gm-Message-State: AOJu0YzmIby9ZnqO4PGTWPYqR+Ma+DLdlE5oawHJKBWTkzHaOHJ825hK
	OI3Uo47g67sGBl1DOiDDNlwMq6N2p/GERuqIKmgDQe8/Huqe5R8gJyl8QHe9jg==
X-Gm-Gg: ATEYQzzxZ5W8oHTsqdrgvq8+n4gz72TKpBYHPqPrL6Ztr0OzYBVnLRoa2L7pNZjyidX
	HJq0bsYPdEsEiwNS6pALZgXAyjq+suh0VEg3Us/JWp16f3XgUGkU+4Qs7LXCTkcehwnUeeqApPn
	PlYLh6sfOMdrXDGOVoKw/Bdz9lkn2XLg4IA2BcpQctiEK8qVmwcrD3pa5gfUK/1wkxQiXL9Me6n
	Y2XCqZkaBqloKwHDi7grZusCnt+HPwitL+fynjXJYtPDdwKMEBodK1oH7NHlFnRyFmXHsCfQvRc
	mHQfbgvqABPH+ce4fA0exo92XV1KhtOndMnOQB010nI9TD4reZjX2RVV1zdJSXuQrF6E/v2yBFJ
	suOgWGMsivZWpnfs5dTL7NAEj4RzLxC5+a38UAEImz96qCcA2WiQKDEFrikFqMy32/wqHzLVLOs
	3WXhDj3C9XepV81hruh9VioRCOLrbMzbb0boYJdDxKLq7I63Scp+ClmR4=
X-Received: by 2002:a05:690e:43ce:b0:649:45c2:6d62 with SMTP id 956f58d0204a3-64e62efba84mr10476634d50.5.1773700313533;
        Mon, 16 Mar 2026 15:31:53 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a511aasm6308869d50.7.2026.03.16.15.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:31:53 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <danmcgr@protonmail.com>
Subject: [PATCH v2] systemd: break circular dependency with libfido2
Date: Mon, 16 Mar 2026 16:31:47 -0600
Message-ID: <20260316223147.56500-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 22:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233272

From: Dan McGregor <danmcgr@protonmail.com>

libfido2 depends on udev, and when the fido2 feature is enabled
in systemd, systemd depends on libfido2. However, systemd really
only needs libfido2's headers at build time. It uses dlopen to
opportunistically enable the features at runtime. Break this
circular dependency by creating a recipe that provides libfido2's
headers and pkgconfig file. That allows systemd to build with
fido2 enabled and allows libfido2 do build as well.

Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
---
 ...meson-use-libfido2_cflags-dependency.patch | 54 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_259.3.bb    |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch b/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch
new file mode 100644
index 00000000000..4bc1e10ee73
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-use-libfido2_cflags-dependency.patch
@@ -0,0 +1,54 @@
+From 97142fd1db4124de5d5bdd3f49cc5a390286e522 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <danmcgr@protonmail.com>
+Date: Wed, 11 Mar 2026 18:26:05 -0600
+Subject: [PATCH] meson: use libfido2_cflags dependency
+
+Add the libfido2 dependency to cryptenroll and cryptsetup's
+meson files. If libfido2's not installed in the default path
+the build wasn't finding its headers correctly.
+
+Signed-off-by: Dan McGregor <danmcgr@protonmail.com>
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/9ce905e35f690e7a10cd286be2b50594d0857f5e]
+---
+ src/cryptenroll/meson.build                  | 1 +
+ src/cryptsetup/cryptsetup-tokens/meson.build | 2 +-
+ src/cryptsetup/meson.build                   | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/cryptenroll/meson.build b/src/cryptenroll/meson.build
+index 488ceea14d..11265c8b41 100644
+--- a/src/cryptenroll/meson.build
++++ b/src/cryptenroll/meson.build
+@@ -23,6 +23,7 @@ executables += [
+                 'dependencies' : [
+                         libcryptsetup,
+                         libdl,
++                        libfido2_cflags,
+                         libopenssl,
+                         libp11kit_cflags,
+                 ],
+diff --git a/src/cryptsetup/cryptsetup-tokens/meson.build b/src/cryptsetup/cryptsetup-tokens/meson.build
+index 804e18bc67..0fd6309201 100644
+--- a/src/cryptsetup/cryptsetup-tokens/meson.build
++++ b/src/cryptsetup/cryptsetup-tokens/meson.build
+@@ -58,7 +58,7 @@ modules += [
+                 'sources' : cryptsetup_token_systemd_fido2_sources,
+                 'dependencies' : [
+                         libcryptsetup,
+-                        libfido2,
++                        libfido2_cflags,
+                 ],
+         },
+         template + {
+diff --git a/src/cryptsetup/meson.build b/src/cryptsetup/meson.build
+index d9778259c2..b36354fb0a 100644
+--- a/src/cryptsetup/meson.build
++++ b/src/cryptsetup/meson.build
+@@ -19,6 +19,7 @@ executables += [
+                 'sources' : systemd_cryptsetup_sources,
+                 'dependencies' : [
+                         libcryptsetup,
++                        libfido2_cflags,
+                         libmount_cflags,
+                         libopenssl,
+                         libp11kit_cflags,
diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-core/systemd/systemd_259.3.bb
index b6b956933dd..aeac0379a49 100644
--- a/meta/recipes-core/systemd/systemd_259.3.bb
+++ b/meta/recipes-core/systemd/systemd_259.3.bb
@@ -33,6 +33,7 @@ SRC_URI += " \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0002-implment-systemd-sysv-install-for-OE.patch \
            file://0003-Do-not-create-var-log-README.patch \
+           file://0001-meson-use-libfido2_cflags-dependency.patch \
            "
 
 PAM_PLUGINS = " \
@@ -122,7 +123,7 @@ PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils,,libelf libdw"
-PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2"
+PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2-initial"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
 PACKAGECONFIG[homed] = "-Dhomed=enabled,-Dhomed=disabled"

