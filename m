Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9076D6BA93
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 11:38:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so2964244wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aNym53Od2UdG4ATR2doZsGZZpL1XqUXVE8NiEh735w0=;
	b=ifWfWADq2Z0+eJY9fJQFyn2Jj8LxIBHQLV9kEfonPPGzK8lCACOO16ICJAyHFaVnt1
	xJT+rocCMB2SAlOrX24EzZfkq4093GMFJcH+sNOD9OsQDtcpnP6UQhOUglJ3OlpiH9vR
	kSG7ZZ9GxERp0JU74az22cSjHT6kNIfC2yrttQm03XKW3vlmIIyQoidFNDcm+gHR1dik
	Zv4tUmTKILNc3zKtBigNYU8ILgaTN7BIPSUbZmP59N2MCuSUtJdbXX6MGlq737x8nJ6C
	PUZIwhdB6cpL//wJ7EYyH6fkbBSWLG+ANGq/htVTZcwfagsWIcAzgULeAKPdLdtBn5QA
	ZNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aNym53Od2UdG4ATR2doZsGZZpL1XqUXVE8NiEh735w0=;
	b=Zq39KocrTDUKIjWeYD48QcNZTp0QPitx2z58Dm+8tqVUGPCptalMxCHiUYsaw2Umy7
	GgmwoFzfjQ8gzLfXqXAVKlGBwHPI9VfeTtQIcBuo0y5VPjy4Dbg4M6htva70NO554Jj2
	GAQBOaX4+OWVqdL4b1uSK++/cNvUvlDWpvqyWMVxA2r5Enfs8z6unOqyTQm0SnRxS4Gx
	KcKSupuvJ+Y1kdKqaq2wolZb6WmNrj65/hNBN1YdQrKVsJByKhq6VXn/rjRHnW3do5++
	tz0EeBvIpU1TPcz/Sf/eUeHNUQCLigazjm4prwZH36g/irO/aH7nevElcZ1qO4KYMx4+
	4Zcw==
X-Gm-Message-State: AA+aEWY3FHYxQ1Jl54gnsb6gopK+SfJsWSHfdgsKw/IhYqocxanbwz0l
	H++TK2NUVTm8BHVWSstgR52/0XzC
X-Google-Smtp-Source: AFSGD/WN0yim+pDoJzo2s+bsncxgtUYUcPAwunof4qcDnzgU0RmhCwd40E41cgENrxMgAcpfJPQpFw==
X-Received: by 2002:a1c:307:: with SMTP id 7-v6mr4680406wmd.146.1543750689603; 
	Sun, 02 Dec 2018 03:38:09 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	g201sm3375340wme.43.2018.12.02.03.38.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 03:38:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2018 12:38:04 +0100
Message-Id: <20181202113804.71223-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] btrfs-tools: update to 4.19
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
X-List-Received-Date: Sun, 02 Dec 2018 11:38:10 -0000

Add a backported patch to fix big endian compilation.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...el-lib-bitops-Fix-big-endian-compila.patch | 55 +++++++++++++++++++
 ...fs-tools_4.17.1.bb => btrfs-tools_4.19.bb} |  3 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.17.1.bb => btrfs-tools_4.19.bb} (92%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch
new file mode 100644
index 00000000000..ad430858c9c
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch
@@ -0,0 +1,55 @@
+From 920c515478b441eaca31e33a18b95ceaa49ace19 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Mon, 5 Nov 2018 11:06:41 -0800
+Subject: [PATCH] btrfs-progs: kernel-lib: bitops: Fix big endian compilation
+
+Replaced bswap with _ variants bswap_32 etc. While it's a glibc
+extension, all of the popular libc implementations (glibc, uClibc, musl,
+BIONIC) seem to support it.
+
+Added static inline to two functions to match little endian variants. This
+fixes a linking error experienced when compiling on gcc 7.3.0 with LTO,
+possibly a bug that was fixed later.
+
+Upstream-Status: Backport [https://gitlab.com/kdave/btrfs-progs/commit/ed570e2df335063280c9d3affd8bb89919a1ac0d.patch]
+Reviewed-by: Nikolay Borisov <nborisov@suse.com>
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+Signed-off-by: David Sterba <dsterba@suse.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ kernel-lib/bitops.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/kernel-lib/bitops.h b/kernel-lib/bitops.h
+index b1fd6f53..2c51a265 100644
+--- a/kernel-lib/bitops.h
++++ b/kernel-lib/bitops.h
+@@ -178,9 +178,9 @@ static inline unsigned long find_next_zero_bit(const unsigned long *addr,
+ static inline unsigned long ext2_swab(const unsigned long y)
+ {
+ #if BITS_PER_LONG == 64
+-	return (unsigned long) bswap64((u64) y);
++	return (unsigned long) bswap_64((u64) y);
+ #elif BITS_PER_LONG == 32
+-	return (unsigned long) bswap32((u32) y);
++	return (unsigned long) bswap_32((u32) y);
+ #else
+ #error BITS_PER_LONG not defined
+ #endif
+@@ -218,14 +218,14 @@ static inline unsigned long _find_next_bit_le(const unsigned long *addr1,
+ 	return min(start + __ffs(ext2_swab(tmp)), nbits);
+ }
+ 
+-unsigned long find_next_zero_bit_le(const void *addr, unsigned long size,
++static inline unsigned long find_next_zero_bit_le(const void *addr, unsigned long size,
+ 		unsigned long offset)
+ {
+ 	return _find_next_bit_le(addr, NULL, size, offset, ~0UL);
+ }
+ 
+ 
+-unsigned long find_next_bit_le(const void *addr, unsigned long size,
++static inline unsigned long find_next_bit_le(const void *addr, unsigned long size,
+ 		unsigned long offset)
+ {
+ 	return _find_next_bit_le(addr, NULL, size, offset, 0UL);
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
similarity index 92%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
index 6b53fbcd7fe..f5e0f77c8a2 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.17.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
@@ -14,11 +14,12 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "7faaca0d9f78f7162ae603231f693dd8e1af2a41"
+SRCREV = "d72d913291683188ddf5d758db02f1bc3b05d2f7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages distutils3-base
-- 
2.17.1


