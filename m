Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvVmu-0006vk-0o
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 17:24:41 +0100
Received: from mail-ea0-f198.google.com ([209.85.215.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 16 Jan 2013 08:09:04 -0800
Received: by mail-ea0-f198.google.com with SMTP id e10so1637022eaa.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 08:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=AJFfiH+a2nqYZxgi6HF0Ne3g9o/KikU4oAJm8o4uuds=;
	b=RTvQUl/3OtENvrGfxOFRsBjvyk65jbwumZgDGOgOwBGssG4H5zACqNkiCeYgV15Bdg
	Eq/nUPcXdBObFMss27cdaFWIchBMp1bWIu7qVsc3601FFLbNzF1BPlNU/4S3MUbtz7Ku
	BOABdGSbnt6QPIhqJ8xE9m/gwSfyxz6zZA/oDrr6gQuvsyP1fY3d4gtIL/nIgtc79UN1
	v9cS78jkEKhhEdGMnl3vgGIr9tP+IH8A6Wsl7PRUaMonvqfOz22y1DaRqM32GepjzcZP
	xmc3asfprMOjh6huqvSqIZyQi5bXS3ZSjKeVA5S4b4coJf9Rz6eOZnMOJ5wHX04d40v1
	80Ow==
X-Received: by 10.194.78.236 with SMTP id e12mr3183347wjx.32.1358352541948;
	Wed, 16 Jan 2013 08:09:01 -0800 (PST)
X-Received: by 10.194.78.236 with SMTP id e12mr3183341wjx.32.1358352541889;
	Wed, 16 Jan 2013 08:09:01 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ex6sm9768803wid.3.2013.01.16.08.09.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 16 Jan 2013 08:09:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2013 16:06:57 +0000
Message-Id: <fc3f57c26532ed19d82b99ae901aa37d4e0fa5ef.1358351050.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
In-Reply-To: <cover.1358351050.git.ross.burton@intel.com>
References: <cover.1358351050.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkO6tRS5vJ8RPl1gZ1yzC+uOBHX40Y4sUsxDqw6VXsRVsQFhO7r7C7VUgosj/FpHvM3jTxMg3i6bg6uH6170UpSkCoySsdMU/oBL/Ab8A3mrm52ER/YTrZTEB71YTnOhdXk10sDUodt2iU2/O/6dzGAkJNXNWovK9d6SgSqQAJATrODGyd8B/MaFuF2A5+NAVnSsKCZ
Subject: [PATCH 2/4] wayland: add Wayland protocol library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 16:24:42 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Wayland is a protocol for a client application to display user interface windows
through the use of a compositing window manager. This package include the
specific set of server-side and client-side C libraries that implement the
protocol.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/wayland_1.0.3.bb |   37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb

diff --git a/meta/recipes-graphics/wayland/wayland_1.0.3.bb b/meta/recipes-graphics/wayland/wayland_1.0.3.bb
new file mode 100644
index 0000000..6e01b22
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland_1.0.3.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "eebe23571fd4f9ceacc583238e5a8ae9"
+SRC_URI[sha256sum] = "f6be5ee11ba534baaa116350b5efb874bf9963bf3fb18bcf40130317e83a5913"
+
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native"
+DEPENDS = "expat wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# Wayland installs a M4 macro for other projects to use. This M4 macro includes
+# a path to a Makefile fragment to get the rules to generate stubs from protocol
+# description files.  The paths to the sysroot end up incorrect, so fix them.
+do_configure_append_class-native() {
+  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
+      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
+      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
+      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
+  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
+}
-- 
1.7.10.4



