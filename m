Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 83ECB7F2E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 14:22:16 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u13so2662969lfm.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 07:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8wofca/GUXdI5LoibFH3nXHBMbFS/RQGga10ijzZpEE=;
	b=hLCYZ9T5Dp0bwXBdU4CisfQWv/7vM/3/VwXemTIay3u8mgXnb7Y4oYk3mZP3O9uZKf
	rj1GZcv4i2b2VY8VXbR3O3y1imZGyJxBXabpOryUEEbuKZ0Ve6UxVk64hEACmHpPkRpk
	qZZ8re+s202siRlgW58xyz2naDLIjW2XWRl39wq/DM/dPvDr2xFx6EOGm4del51nYYwL
	L9hHm//6g6YMRrfq8rMqyDARWiUhnC4wgh6agT3uUqYHi8bRZPLF+VWBAA9/pb5/0C6a
	KXKYAwPd/CoFMjcZa+f2mplUtkiwBQbDEi7BMo/oLoeY2t4rJb02/PjLIExW3n3RLz4G
	a/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8wofca/GUXdI5LoibFH3nXHBMbFS/RQGga10ijzZpEE=;
	b=bHQoWobzuw3lzLBB6nTqTIL9821GOftGvFFo4I76v6MI2CFxtuFSnY5HRjPdF+94N2
	Jahm7QHkto4830DoYLeCuvhSioJv/79f4rbqZQ3v0xHWWHmt5qDxvFptMUEJUSbKv+iY
	nybO6hC2M0q3X55mD/yCKroqEYFLdxMmkg8h7gN4AnwU+4h7D1ZTyDr6c/1urapSKUwC
	Zib0T9LjOP2s/Dy4BZnYeupebMbFXAKMMToQf/CnjNxnu2O/cbczPhTQjb9RMvJFvvZn
	CT9KxPEfGQ2PPU5dBMyulbRIn7cNC/MbcKBWPA0ztU7GgS0haJ0VB4yLr2HuvaGIb9oV
	oYag==
X-Gm-Message-State: APjAAAUoCXsbxNnl6kIg3Yl7bSjrXS0biyV7YkATdza+8kOnuL4nS5as
	Ayf0mtuQKoQalCGAykPXJ/rtLbJ1
X-Google-Smtp-Source: APXvYqzBKYyVzFEisX6flbRyWhkeriCCBaL79JG8zeMq5E1oMQ5dowqaSEvySLi1Nd/2gH9+wtIpMw==
X-Received: by 2002:ac2:4474:: with SMTP id y20mr5838755lfl.31.1567088536536; 
	Thu, 29 Aug 2019 07:22:16 -0700 (PDT)
Received: from manatarms-greyskull.lan.mikrodidakt.se ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id v7sm374377ljc.46.2019.08.29.07.22.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 07:22:15 -0700 (PDT)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2019 16:22:02 +0200
Message-Id: <20190829142202.6028-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] btrfs-tools: Add PACKAGECONFIG knob for controlling python support
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
X-List-Received-Date: Thu, 29 Aug 2019 14:22:16 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../btrfs-tools/btrfs-tools_5.2.1.bb            | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
index 647516cf92..a364cf53ed 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
+DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
@@ -19,13 +19,16 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
 
-inherit autotools-brokensep pkgconfig manpages distutils3-base
-
-CLEANBROKEN = "1"
-
+PACKAGECONFIG ??= "python"
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-setuptools-native"
 PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 
+inherit autotools-brokensep pkgconfig manpages
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base', '', d)}
+
+CLEANBROKEN = "1"
+
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
 EXTRA_PYTHON_CFLAGS_class-native = ""
@@ -41,7 +44,9 @@ do_configure_prepend() {
 S = "${WORKDIR}/git"
 
 do_install_append() {
-    oe_runmake 'DESTDIR=${D}' 'PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}' install_python
+    if [ "${@bb.utils.filter('PACKAGECONFIG', 'python', d)}" ]; then
+        oe_runmake 'DESTDIR=${D}' 'PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}' install_python
+    fi
 }
 
 BBCLASSEXTEND = "native"
-- 
2.21.0


