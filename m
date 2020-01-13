Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 29C117D265
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 07:01:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so7368317wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 23:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QXEbFfbikVN5ok64cdYv3yFhEkAUvXCjZU3WDGA245Q=;
	b=jfm881/fpXEohUqCZhV8ebw3DZsCeKoNDWW3d7wzS+NloEodTZmIezOpAo2/0ePSKh
	sIheZJ8vaCj2i+EbU8+eRjiMgS+OuXKY/Jbqks1XSmn6Vm3gy31BON5jcUBNEy7OHr+e
	Lm5QL+30S7MVbaRtWRcTNxp9myqfYmHAw5ghutG7D/MldThRehMIZO+5ysxD3T+H+kJU
	D9clGrTg+sC+Ll8vaC07krvwCmmXKMMYfZlAkuWGfjdktDC4O2isNtiEOvipGv4TjIgy
	JpKvaANNRUUpxzIRziqDAmUSWiXUQcXOi5GQWtnWZ9Omi3+CkRXXt5eiVhdwHG5NJlkl
	HpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QXEbFfbikVN5ok64cdYv3yFhEkAUvXCjZU3WDGA245Q=;
	b=exJsEisqeniC3b4Nx39HmQnf4q3EjmBk/RGTd9ODsZ2Ovc2pspdV7h/nIPRiKQ797f
	R6UZ23tUONs35AT03uZRmu3btDmDmJIqki0kqDWoxjvT3ayipxbaMXW/6+ZP/ICJ6exF
	pO60EXaUE/RDeAScPHnMat71U02/q0QtyraC4pSv6yw2lmw9y6Kse+o8lLu9tIhGjzCh
	jqZijZFzKQkSbvETbGSZCSFDBBtRQN2n97WJkWf8F391QYbBBrQGMwiULBnJ6Xh/+nh0
	3FeSY+vmVXsy4SVkGn5uk72yRwlCZhZFcTXrxeybcc41wLRzP4SjGNCMvwjeqgVWiON6
	DjsA==
X-Gm-Message-State: APjAAAUDqTkbPk47Qa+ITGh2tAti9Bp+FfbnJv0o+PixcnnfGiK69VMz
	GWhCeBHdpA0/gOvCbiRiqUL8+2a2c0I=
X-Google-Smtp-Source: APXvYqyXQPBy7rVnb6ce7E4cSJazfH2WXvKgb3zBifEbuGNkSqd7KDI17To0KZphHDqD9oeA53ZkVw==
X-Received: by 2002:adf:ea4e:: with SMTP id j14mr16995180wrn.101.1578898865252;
	Sun, 12 Jan 2020 23:01:05 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	s3sm13093138wmh.25.2020.01.12.23.01.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 23:01:04 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 07:01:01 +0000
Message-Id: <20200113070101.38347-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] u-boot: Upgrade 2020.01-rc5 -> 2020.01
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
X-List-Received-Date: Mon, 13 Jan 2020 07:01:05 -0000

Also drop unreferenced (already merged) patches.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...nclude-env.h-Ensure-ulong-is-defined.patch | 31 -------
 ...fix-ulong-definition-on-musl-targets.patch | 83 -------------------
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  5 +-
 3 files changed, 1 insertion(+), 118 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
 delete mode 100644 meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch b/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
deleted file mode 100644
index 4d623c1f3469..000000000000
--- a/meta/recipes-bsp/u-boot/files/0001-include-env.h-Ensure-ulong-is-defined.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 718170ff3a5e677db7212a86b129dacb28b1cac2 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 14 Oct 2019 17:37:30 -0700
-Subject: [PATCH] include/env.h: Ensure ulong is defined
-
-To fix these failures when building with musl:
-   include/env.h:166:1: error: unknown type name 'ulong'; did you mean 'long'?
-ensure that ulong is defined.
-
-Upstream-Status: Pending
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- include/env.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/env.h b/include/env.h
-index d6c2d751d6..6cf5053431 100644
---- a/include/env.h
-+++ b/include/env.h
-@@ -13,6 +13,8 @@
- #include <stdbool.h>
- #include <linux/types.h>
- 
-+typedef unsigned long           ulong;
-+
- struct environment_s;
- 
- /* Value for environment validity */
--- 
-2.24.1
-
diff --git a/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch b/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
deleted file mode 100644
index 0d965813b04e..000000000000
--- a/meta/recipes-bsp/u-boot/files/0002-include-fix-ulong-definition-on-musl-targets.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From dccfea2e95cd3f26d1295e02d41012d014827dd9 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Mon, 16 Dec 2019 23:36:40 +0000
-Subject: [PATCH 2/2] include: fix 'ulong' definition on musl targets
-
-The build failure was originally reported on arm64-musl
-target at https://bugs.gentoo.org/703132. Here is the amd64-musl
-variant:
-
-```
-$ LANG=C make CROSS_COMPILE=x86_64-gentoo-linux-musl- tools-only_defconfig -j$(nproc)
-$ LANG=C make CROSS_COMPILE=x86_64-gentoo-linux-musl- tools-all            -j$(nproc)
-...
-In file included from tools/env/../../env/flags.c:7,
-                 from tools/env/env_flags.c:1:
-include/env.h:159:1: error: unknown type name 'ulong'; did you mean 'long'?
-  159 | ulong env_get_ulong(const char *name, int base, ulong default_val);
-      | ^~~~~
-      | long
-```
-
-Note: 'ulong' is not defined there.
-
-On glibc 'ulong' comes from <sys/types.h>:
-
-```c
-/* Old compatibility names for C types.  */
-typedef unsigned long int ulong;
-```
-
-On musl it comes from <sys/types.h> as well but from under different guards:
-
-```c
-typedef unsigned long u_long, ulong;
-```
-
-The change inlines 'ulong' define similar to 'uint' define.
-
-Upstream-Status: Pending
-Bug: https://bugs.gentoo.org/703132
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Message-Id: <20191216233640.518168-1-slyfox@gentoo.org>
----
- include/compiler.h   | 2 +-
- include/u-boot/crc.h | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/compiler.h b/include/compiler.h
-index 29507f9840..90372f239c 100644
---- a/include/compiler.h
-+++ b/include/compiler.h
-@@ -46,7 +46,6 @@
- # include <byteswap.h>
- #elif defined(__MACH__) || defined(__FreeBSD__)
- # include <machine/endian.h>
--typedef unsigned long ulong;
- #endif
- #ifdef __FreeBSD__
- # include <sys/endian.h> /* htole32 and friends */
-@@ -66,6 +65,7 @@ typedef uint8_t __u8;
- typedef uint16_t __u16;
- typedef uint32_t __u32;
- typedef unsigned int uint;
-+typedef unsigned long ulong;
- 
- #define uswap_16(x) \
- 	((((x) & 0xff00) >> 8) | \
-diff --git a/include/u-boot/crc.h b/include/u-boot/crc.h
-index 1086d2168c..b96b50d98b 100644
---- a/include/u-boot/crc.h
-+++ b/include/u-boot/crc.h
-@@ -8,6 +8,8 @@
- #ifndef _UBOOT_CRC_H
- #define _UBOOT_CRC_H
- 
-+#include <compiler.h> /* unit definition */
-+
- /**
-  * crc8() - Calculate and return CRC-8 of the data
-  *
--- 
-2.24.1
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 4799948bb17a..ce07055f878c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -10,12 +10,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 PE = "1"
 
-# Drop this line when updating to 2020.01 final
-PV = "2020.01~rc5"
-
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
+SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
           "
-- 
2.17.1


