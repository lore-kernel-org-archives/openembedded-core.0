Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D272661719
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 15:30:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s144so7359833wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 07:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g1wNtDBE3ElAbA96GnE1OWWt+2+cz71aT5ZEP+8ZhTM=;
	b=AcDA2hv4yrrATmL72Ms+9B2Gk1HGVETNNhOwOVyYdrVHxQvribUSYEsHIi6ou4Htef
	Clzd7RJUAVqIQnfQBkE7++U4n0mxn9fEaEkifbIlcf96hhqh7OQLt00oIb0mGQl6NH5I
	meNQMgZ8V4RFuLpWPR/YjPDasd9g3A46KjbwWbzA5n8QfoRWNbgYlzgdceRCp9f32kik
	q7K3b/IDMZvs3bwMu5L9YTcf6/yYlQNLBYLrCcBt3d4Fog0HKi9dByWHBGHZBQDFvpSU
	qiEv94z7Eabe+X5huXNtmVjCf9AYz1KEqfzNpWBhf3KLjtKmh4y7CiY0UxdoqHc6QYBa
	OW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g1wNtDBE3ElAbA96GnE1OWWt+2+cz71aT5ZEP+8ZhTM=;
	b=hsbHvKV8MR+dHWihvm764jEhI6TIEJXc0kqFgyupE1NdDjq1AujpJQWZG7HrOHKnAo
	791I4YAyWQsL96gVAJ7ya8A/EFmBl018/WpveDXMBGCwgo5q11UjwJ0yNrBluvxIZ5Gj
	lFTHA6gS34KCBPCntcC+BFQvbSs/BCj6jpq8eiVsHC0z2w/prsRsZ3MUbsszGcS5hxds
	AagEyREHWbVG/yitYvjihr33x08U+wrTUHpzE3VtCDUyBdub8+K0fESXm0O5YbJ8scA/
	4FcPlc2YC92JYB8TSHsbBJlt43/H5nKhY/wgYvkntuIcl2UcVUxeIjX5MeWj8O7VlyS9
	Smaw==
X-Gm-Message-State: APjAAAVq+RdhMxoJYpUqFHPBzYen0ZmwcguAKblvU6/t9HvxL2X4Rqta
	15VdeNZtzcib28m+hSUfbUrY+/iD
X-Google-Smtp-Source: APXvYqwF9yr/jeyIM9G3+eA0NKR0pqoPlK2Z06AdHxTqP+qhLiwwJR5Wdk64ZnbDQ19gjrEv8nkZUA==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr11250366wmc.9.1582385455851;
	Sat, 22 Feb 2020 07:30:55 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id a9sm8946709wmm.15.2020.02.22.07.30.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 07:30:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 16:30:18 +0100
Message-Id: <20200222153018.11874-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] wayland: add a patch to address build errors due to incorrect deps
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
X-List-Received-Date: Sat, 22 Feb 2020 15:30:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...missing-dependencies-on-protocol-hea.patch | 115 ++++++++++++++++++
 .../wayland/wayland_1.18.0.bb                 |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch b/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
new file mode 100644
index 0000000000..61de0e04e8
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
@@ -0,0 +1,115 @@
+From b2c74f6a3dbe0aee2413800837314136947a4985 Mon Sep 17 00:00:00 2001
+From: Jan Beich <jbeich@FreeBSD.org>
+Date: Sat, 15 Feb 2020 02:03:45 +0000
+Subject: [PATCH] meson/tests: add missing dependencies on protocol headers
+
+In file included from ../tests/connection-test.c:43:
+In file included from ../tests/test-compositor.h:30:
+../src/wayland-client.h:40:10: fatal error: 'wayland-client-protocol.h' file not found
+ #include "wayland-client-protocol.h"
+          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from ../tests/display-test.c:45:
+In file included from ../src/wayland-server.h:104:
+src/wayland-server-protocol.h:4454:2: error: unterminated /* comment
+        /**
+        ^
+In file included from ../tests/cpp-compile-test.cpp:2:
+In file included from src/wayland-server-protocol.h:8:
+In file included from ../src/wayland-server.h:104:
+src/wayland-server-protocol.h:3:2: error: unterminated conditional directive
+ #ifndef WAYLAND_SERVER_PROTOCOL_H
+  ^
+../tests/headers-protocol-test.c:33:2: error: including wayland-server-protocol.h did not include wayland-server.h!
+ #error including wayland-server-protocol.h did not include wayland-server.h!
+  ^
+In file included from ../tests/headers-protocol-test.c:26:
+In file included from src/wayland-client-protocol.h:8:
+In file included from ../src/wayland-client.h:40:
+src/wayland-client-protocol.h:1358:2: error: unterminated conditional directive
+ #ifndef WL_SHM_FORMAT_ENUM
+  ^
+In file included from ../tests/protocol-logger-test.c:34:
+In file included from ../src/wayland-client.h:40:
+src/wayland-client-protocol.h:2613:1: error: unterminated /* comment
+/**
+^
+../tests/resources-test.c:49:36: error: use of undeclared identifier 'wl_seat_interface'
+        res = wl_resource_create(client, &wl_seat_interface, 4, 0);
+                                          ^
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/meson.build | 26 ++++++++++++++++++--------
+ 1 file changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index c28a2a3..f1af7b4 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -69,7 +69,7 @@ test(
+ 	executable(
+ 		'cpp-compile-test',
+ 		'cpp-compile-test.cpp',
+-		wayland_server_protocol_core_h,
++		wayland_server_protocol_h,
+ 		include_directories: src_inc
+ 	)
+ )
+@@ -91,17 +91,25 @@ tests = {
+ 	'array-test': [],
+ 	'client-test': [ wayland_server_protocol_h ],
+ 	'display-test': [
++		wayland_client_protocol_h,
++		wayland_server_protocol_h,
+ 		tests_server_protocol_h,
+ 		tests_client_protocol_c,
+ 		tests_protocol_c,
+ 	],
+-	'connection-test': [ wayland_server_protocol_h ],
++	'connection-test': [
++		wayland_client_protocol_h,
++		wayland_server_protocol_h,
++	],
+ 	'event-loop-test': [ wayland_server_protocol_h ],
+ 	'fixed-test': [],
+ 	'interface-test': [ wayland_client_protocol_h ],
+ 	'list-test': [],
+ 	'map-test': [],
+-	'sanity-test' : [ wayland_server_protocol_h ],
++	'sanity-test' : [
++		wayland_client_protocol_h,
++		wayland_server_protocol_h,
++	],
+ 	'socket-test': [
+ 		wayland_client_protocol_h,
+ 		wayland_server_protocol_h,
+@@ -116,7 +124,7 @@ tests = {
+ 		files('../src/wayland-server.c'),
+ 		wayland_server_protocol_h,
+ 	],
+-	'resources-test': [ wayland_server_protocol_core_h ],
++	'resources-test': [ wayland_server_protocol_h ],
+ 	'message-test': [
+ 		wayland_client_protocol_h,
+ 		wayland_server_protocol_h,
+@@ -126,14 +134,16 @@ tests = {
+ 		wayland_server_protocol_h,
+ 	],
+ 	'protocol-logger-test': [
+-		wayland_server_protocol_core_h,
+-		wayland_client_protocol_core_h,
++		wayland_client_protocol_h,
++		wayland_server_protocol_h,
+ 	],
+ 	'headers-test': [
++		wayland_client_protocol_h,
++		wayland_server_protocol_h,
+ 		'headers-protocol-test.c',
+-		'headers-protocol-core-test.c',
+-		wayland_server_protocol_core_h,
+ 		wayland_client_protocol_core_h,
++		wayland_server_protocol_core_h,
++		'headers-protocol-core-test.c',
+ 	],
+ 	'os-wrappers-test': [],
+ }
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 6a6e7495b5..5dc31163da 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
+           file://0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch \
            "
 SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
 SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
-- 
2.25.0


