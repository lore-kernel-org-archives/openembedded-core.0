Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 702667BD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f81so3433727wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oVj/GZXT/aLrfUUCdVAdlzbKi5i1TdoaDi/+4eZ82MM=;
	b=eycD81Y9srulYl83w++xC34K/RLa+/FU3DBXBjp8WqPSb5Ddeyl+PykvTUSseXE1DL
	ifu/UCJhT1f3QaSBCneottCbfFrF0YGxO2sJ0L7zW6+OFhH66+1a04TXEbRUqLR+p3dQ
	f3JqJB+ehdBc7nGlQoKgPrQMnmgzppOXrWDbRiz/3czCFLBs8diMSmcCP6wTUP7VizeC
	x4E7SA1N9O89Af+3aHUWuiV0NOigNXky5d7xu/mHXq5NU80GT/wLNSd0jSeBcZz9p6nb
	LOA0R3QWrbZUOE+6qf00JTH7gClCOEBfXKS1cnf38XGb34O0gwh7J9mGURQK7C23UcLW
	C8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oVj/GZXT/aLrfUUCdVAdlzbKi5i1TdoaDi/+4eZ82MM=;
	b=IXLC5q/3p1ZXzZPcmbGdvVz38FBYevkgUyCjyP+UeAl/moUvV9tj68O4DUHJ+uIv9y
	W0bo7jYlcuJQYeovuC+VPWkwdkO6147QwXUQHyPrkwKAdOFRZVqFr0tYrUNoKgLajhTF
	lMWMpHGZ1R5nn3aMhkHPulBRpNG3hI228zxQkL1WNl7sORQjbkym4f+onIbUaJ3yQXqr
	NJDA6zGzVU2eijdAHNd7HxKM3RT7eW8e8W75QWh5JWWxAyJL5cpIk2XJaJDxk8MyVegw
	l9gDCQwsui4xv6sFur+wo2NIgeVrhcrOBc10cMaxXnpbAivgYoL7mT2CERqQSGA6C+CJ
	WVWQ==
X-Gm-Message-State: AA+aEWbyqWG7fxnn1WKES++/5WuRimhdNkOrc9hiMUbDBUytYqwp5Edp
	ewHsQ7HrLp5EiqHqc8Pxyhbl4JQm
X-Google-Smtp-Source: AFSGD/WF0hWfWbzOrLNs2An6RSvWeOrVDjR0iE3SSF8PKnNpUVuulknQxoKDrdaQxQQgF4Ytuble7Q==
X-Received: by 2002:a1c:c707:: with SMTP id x7mr3397134wmf.120.1545150614569; 
	Tue, 18 Dec 2018 08:30:14 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:53 +0100
Message-Id: <20181218163005.1330-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/13] btrfs-tools: update to 4.19.1
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...el-lib-bitops-Fix-big-endian-compila.patch | 55 -------------------
 ...fs-tools_4.19.bb => btrfs-tools_4.19.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.19.bb => btrfs-tools_4.19.1.bb} (92%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch
deleted file mode 100644
index ad430858c9c..00000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 920c515478b441eaca31e33a18b95ceaa49ace19 Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Mon, 5 Nov 2018 11:06:41 -0800
-Subject: [PATCH] btrfs-progs: kernel-lib: bitops: Fix big endian compilation
-
-Replaced bswap with _ variants bswap_32 etc. While it's a glibc
-extension, all of the popular libc implementations (glibc, uClibc, musl,
-BIONIC) seem to support it.
-
-Added static inline to two functions to match little endian variants. This
-fixes a linking error experienced when compiling on gcc 7.3.0 with LTO,
-possibly a bug that was fixed later.
-
-Upstream-Status: Backport [https://gitlab.com/kdave/btrfs-progs/commit/ed570e2df335063280c9d3affd8bb89919a1ac0d.patch]
-Reviewed-by: Nikolay Borisov <nborisov@suse.com>
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: David Sterba <dsterba@suse.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- kernel-lib/bitops.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/kernel-lib/bitops.h b/kernel-lib/bitops.h
-index b1fd6f53..2c51a265 100644
---- a/kernel-lib/bitops.h
-+++ b/kernel-lib/bitops.h
-@@ -178,9 +178,9 @@ static inline unsigned long find_next_zero_bit(const unsigned long *addr,
- static inline unsigned long ext2_swab(const unsigned long y)
- {
- #if BITS_PER_LONG == 64
--	return (unsigned long) bswap64((u64) y);
-+	return (unsigned long) bswap_64((u64) y);
- #elif BITS_PER_LONG == 32
--	return (unsigned long) bswap32((u32) y);
-+	return (unsigned long) bswap_32((u32) y);
- #else
- #error BITS_PER_LONG not defined
- #endif
-@@ -218,14 +218,14 @@ static inline unsigned long _find_next_bit_le(const unsigned long *addr1,
- 	return min(start + __ffs(ext2_swab(tmp)), nbits);
- }
- 
--unsigned long find_next_zero_bit_le(const void *addr, unsigned long size,
-+static inline unsigned long find_next_zero_bit_le(const void *addr, unsigned long size,
- 		unsigned long offset)
- {
- 	return _find_next_bit_le(addr, NULL, size, offset, ~0UL);
- }
- 
- 
--unsigned long find_next_bit_le(const void *addr, unsigned long size,
-+static inline unsigned long find_next_bit_le(const void *addr, unsigned long size,
- 		unsigned long offset)
- {
- 	return _find_next_bit_le(addr, NULL, size, offset, 0UL);
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.1.bb
similarity index 92%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.1.bb
index f5e0f77c8a2..2f59a0c13ea 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.19.1.bb
@@ -14,12 +14,11 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl python3-setuptools-native"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "d72d913291683188ddf5d758db02f1bc3b05d2f7"
+SRCREV = "167651ca29ec522cff0d81b52dc0cc4ae4e3f535"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Makefile-build-mktables-using-native-gcc.patch \
            file://0001-Add-LDFLAGS-when-building-libbtrfsutil.so.patch \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
-           file://0001-btrfs-progs-kernel-lib-bitops-Fix-big-endian-compila.patch \
            "
 
 inherit autotools-brokensep pkgconfig manpages distutils3-base
-- 
2.17.1


