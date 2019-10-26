Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE6847FC03
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 20:42:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 470tFj1YMrz6W
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 22:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572122537;
	bh=Ih5p4t8M4Nrz1Sf1LaMXP1109FSReyeEY7ChpmgCjAc=;
	h=From:To:Subject:Date:From;
	b=I7KYntkbIX8oNI7pLCOmJ17g6cAn9lbuuRrB4OJnyFBZxAZ8FhbFNmPC10O5tIKv/
	m9IjvXwDnejSnQsnlI3gGPondt1mfOUtKT8K8eMmX9k2rxYRX7OUGcZ3KEtyi+oWN/
	mJlbJbvJ2euQ0175Lhkq+I+wJGdKJavcAY6gfYfPC5qkRmmLK5s4sHEMb1zx+LciFi
	dd+c1fxKoBlDIMX0iXAD2qxOOcJvjO1mC5J1GMp2otfGDg+klvJXS0QWhJS4whvgKw
	/ZB8dj+sx9k0Q8qP78YfG8Ht8XOjiiCIYwFAslGxxm+oJv1JVz5jxu/GXYxolV5yJ5
	kxe428pD9qv5SS6J0h/Iia31JZGJi5mtA5qGUwLYRJH32mHRqF4y7AeeerFijfRrzx
	CBTagZQhYuB3BvZX3gnR7vndGqh9sck6YM18+fhZfQdQTdqmicAvdFkDebZ1HRoleN
	a4/52ZgdLtdybPzaU6OvdIV6IBMWrHF21CM1hZSTp3ylMABXEmyJxSUUwf2TEVZfO2
	JBK+oOzYOffCL1R05yl5u6kUQiIT4k4xIpmFMFa3fqvE5+izjMfCqIvOevjxPcV2Z9
	e+bZ4dd/Wu207a2ekF+mZ6sk4/2KH/rjj5CEv6Um1ZBc/dV4yqwF2GyzFUtinM9xRT
	fzdfPFaNUgd2r+UzShXS0Tdo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Oct 2019 23:42:11 +0300
Message-Id: <20191026204216.9298-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnu-efi: Upgrade 3.0.9 -> 3.0.10
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
X-List-Received-Date: Sat, 26 Oct 2019 20:42:19 -0000

Part of patch fixed upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../gnu-efi/parallel-make-archives.patch       | 18 ------------------
 .../{gnu-efi_3.0.9.bb => gnu-efi_3.0.10.bb}    |  4 ++--
 2 files changed, 2 insertions(+), 20 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.9.bb => gnu-efi_3.0.10.bb} (95%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
index a9806cfdf6..8a0138bbe5 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -19,25 +19,7 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
 [Rebased for 3.0.8]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- gnuefi/Makefile | 3 ++-
- lib/Makefile    | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/gnuefi/Makefile b/gnuefi/Makefile
-index 2a61699..89b560a 100644
---- a/gnuefi/Makefile
-+++ b/gnuefi/Makefile
-@@ -54,7 +54,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
- 
- all:	$(TARGETS)
- 
--libgnuefi.a: $(patsubst %,libgnuefi.a(%),$(OBJS))
-+libgnuefi.a: $(OBJS)
-+	$(AR) $(ARFLAGS) $@ $(OBJS)
- 
- clean:
- 	rm -f $(TARGETS) *~ *.o $(OBJS)
 diff --git a/lib/Makefile b/lib/Makefile
 index 0e6410d..048751a 100644
 --- a/lib/Makefile
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
similarity index 95%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
index 6d4c303353..d4e0465890 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[md5sum] = "32af17b917545a693e549af2439c4a99"
-SRC_URI[sha256sum] = "6715ea7eae1c7e4fc5041034bd3f107ec2911962ed284a081e491646b12277f0"
+SRC_URI[md5sum] = "960a8379b6f95ee73d7778b70bf2a089"
+SRC_URI[sha256sum] = "f12082a3a5f0c3e38c67262a9f34245d139ac2cdfc0a0bdcf03c9b1f56fa4fed"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.17.1


