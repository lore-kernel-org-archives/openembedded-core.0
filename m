Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0D30878396
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:05 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id i14-v6so6343411wre.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4CbbOX9kGAoPeGYgz5CLHpVRkr0EWUlbMehR/TZ9rhk=;
	b=i+515Ae+yNyoeIUiCFU6QRX2DCOkPxHqrlBRk/nWC/AlWD0U8KguqrEmAwaPGX2Zo4
	FV365xLeIhwc/UY5yeiNdh7SEzgHM8cCtQB7bG/j7TcY22A20T3i6DiBwqU3zf6WFSd6
	rX4oTHBe0Z9ip4Y1Lk3cUyr6B9NPAYYaOvmbOPeUd1aBi0OvvoM1PRGww41Mafh3iC6h
	XyuruOAfvnCniIfk/6wKftfxzMmEBhm9ctdbpolJSSB7u1SkX9FP64JKCr7BBFMLkNBm
	8Fuu4xZQsPZIzDjY81Nqg4j9NI0D+iuivowMdVqUiWzTrdK+86V5FUN72VgnTiC+HLWe
	jhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4CbbOX9kGAoPeGYgz5CLHpVRkr0EWUlbMehR/TZ9rhk=;
	b=VjE4Su/oZdTpE36+hw/s/+LU4ysWBlj1j3cQFfeAUXPjyjVh08JF6gYOO3/SdKwgfd
	8MBPo8JEtfj+k8Ptpx/CjK7m8PtlCAFtDp6AiJowfHIbM4oDUKbfyyyn4ptFFZ3cZKP+
	txPShuQT/fH9+QogXgMmdmJu971O1LkqnPQarl9orCrC2m5F5MlnCJvK+woQFeVxB+dX
	cucxNMqNl7EzoyJa5jN8rRn3SytN0S7+051cDC2lpymC6aD+wT99/7E76XmZL3KAoJ4T
	aOMtqNORtgpOqGQKvJKko/ItGkxkf8I1fnz08OjEk0mEbOTDWQbVWRNT8zZh+7Y5hU6o
	MjLA==
X-Gm-Message-State: ALKqPwfQYtmtlHik6oELvbGt9zPx1FfD2YkxTLgmWyIvwesowTz7ldpp
	doXwyGHlJSOPMvbfP46aeWYWww==
X-Google-Smtp-Source: AB8JxZo9/SxJQ5SMT1qC1anUC4oTT7Nw2K+/YN0yBPoRH8QGvGRwflEx8cCgfrDoqES+wunowtxbdA==
X-Received: by 2002:adf:b246:: with SMTP id y6-v6mr178188wra.99.1526066466370; 
	Fri, 11 May 2018 12:21:06 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y68-v6sm6350562wrb.91.2018.05.11.12.21.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:01 +0000
Message-Id: <20180511192103.7581-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192103.7581-1-Martin.Jansa@gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/5] qemu: refresh patches with devtool
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
X-List-Received-Date: Fri, 11 May 2018 19:21:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../qemu/qemu/add-ptest-in-makefile-v10.patch | 13 ++++---
 .../qemu/apic-fixup-fallthrough-to-PIC.patch  | 15 ++++----
 ...pus.c-qemu_cpu_kick_thread_debugging.patch | 12 +++----
 ...x-libcap-header-issue-on-some-distro.patch | 16 +++++----
 ...webkitgtk-hangs-on-32-bit-x86-target.patch | 10 +++---
 .../qemu/qemu/no-valgrind.patch               | 19 ++++++++--
 .../qemu/qemu/pathlimit.patch                 | 35 ++++++++++++-------
 .../qemu/qemu-enlarge-env-entry-size.patch    | 18 +++++-----
 meta/recipes-devtools/qemu/qemu/wacom.patch   | 24 ++++++++-----
 9 files changed, 100 insertions(+), 62 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
index e9639820be..3337d1c7ba 100644
--- a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
+++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
@@ -1,7 +1,8 @@
-From 4201a5791fc4798a45a9b9f881602d7bacb74ed1 Mon Sep 17 00:00:00 2001
+From 6c01c969def7adae70d7d59a40b5640454b97bdb Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Thu, 31 Aug 2017 11:06:56 -0700
-Subject: Add subpackage -ptest which runs all unit test cases for qemu.
+Subject: [PATCH] Add subpackage -ptest which runs all unit test cases for
+ qemu.
 
 Upstream-Status: Pending
 
@@ -9,11 +10,15 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 
+---
+ tests/Makefile.include | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
 diff --git a/tests/Makefile.include b/tests/Makefile.include
-index f08b741..3d1b3e9 100644
+index 3b9a5e3..dfbcd72 100644
 --- a/tests/Makefile.include
 +++ b/tests/Makefile.include
-@@ -924,4 +924,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
+@@ -972,4 +972,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
  -include $(wildcard tests/*.d)
  -include $(wildcard tests/libqos/*.d)
  
diff --git a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
index d6a3522eda..8ba507c9ff 100644
--- a/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From bef93bb81588b5323a52d2e1886f2a77b64a976b Mon Sep 17 00:00:00 2001
+From ca247c6e7ab7a0bd7b94658a726940f10a6b0559 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH 03/18] apic: fixup fallthrough to PIC
+Subject: [PATCH] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -24,15 +24,16 @@ serviced, is -1.
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg00878.html]
 Signed-off-by: He Zhe <zhe.he@windriver.com>
+
 ---
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-2.11.1/hw/intc/apic.c
-===================================================================
---- qemu-2.11.1.orig/hw/intc/apic.c
-+++ qemu-2.11.1/hw/intc/apic.c
-@@ -591,7 +591,7 @@ int apic_accept_pic_intr(DeviceState *de
+diff --git a/hw/intc/apic.c b/hw/intc/apic.c
+index 6fda52b..cd72919 100644
+--- a/hw/intc/apic.c
++++ b/hw/intc/apic.c
+@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
index 6822132541..46c82a4aea 100644
--- a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
+++ b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
@@ -1,4 +1,4 @@
-From 697a834c35d19447b7dcdb9e1d9434bc6ce17c21 Mon Sep 17 00:00:00 2001
+From a2e3ad8e3bbdea20a4c53404674dd8ae46bd2528 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Wed, 12 Aug 2015 15:11:30 -0500
 Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fails.
@@ -12,6 +12,7 @@ current cpu information.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
 ---
  cpus.c         |  5 +++++
  custom_debug.h | 24 ++++++++++++++++++++++++
@@ -19,10 +20,10 @@ Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
  create mode 100644 custom_debug.h
 
 diff --git a/cpus.c b/cpus.c
-index a822ce3..7e4786e 100644
+index 38eba8b..b84a60a 100644
 --- a/cpus.c
 +++ b/cpus.c
-@@ -1080,6 +1080,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
+@@ -1690,6 +1690,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
      return NULL;
  }
  
@@ -31,7 +32,7 @@ index a822ce3..7e4786e 100644
  static void qemu_cpu_kick_thread(CPUState *cpu)
  {
  #ifndef _WIN32
-@@ -1088,6 +1090,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
+@@ -1702,6 +1704,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
      err = pthread_kill(cpu->thread->thread, SIG_IPI);
      if (err) {
          fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
@@ -71,6 +72,3 @@ index 0000000..f029e45
 +
 +	free(symbols);
 +}
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
index cee6a676ab..a5ab6c5849 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-libcap-header-issue-on-some-distro.patch
@@ -1,4 +1,7 @@
-fix libcap header issue on some distro
+From ebcb35fc87ca201ce7e5d01e82d677498bd96aea Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 12 Mar 2013 09:54:06 +0800
+Subject: [PATCH] fix libcap header issue on some distro
 
 1, When build qemu-native on SLED 11.2, there is an error:
 ...
@@ -51,14 +54,16 @@ http://patchwork.linuxtv.org/patch/12748/
 
 Upstream-Status: Pending
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
- fsdev/virtfs-proxy-helper.c |    7 +++++--
+ fsdev/virtfs-proxy-helper.c | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
+index 6f132c5..8329950 100644
 --- a/fsdev/virtfs-proxy-helper.c
 +++ b/fsdev/virtfs-proxy-helper.c
-@@ -12,7 +12,6 @@
+@@ -13,7 +13,6 @@
  #include <sys/resource.h>
  #include <getopt.h>
  #include <syslog.h>
@@ -66,7 +71,7 @@ diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
  #include <sys/fsuid.h>
  #include <sys/vfs.h>
  #include <sys/ioctl.h>
-@@ -26,7 +25,11 @@
+@@ -27,7 +26,11 @@
  #include "9p-iov-marshal.h"
  #include "hw/9pfs/9p-proxy.h"
  #include "fsdev/9p-iov-marshal.h"
@@ -79,6 +84,3 @@ diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
  #define PROGNAME "virtfs-proxy-helper"
  
  #ifndef XFS_SUPER_MAGIC
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
index d2c52252f6..5dfd735268 100644
--- a/meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
+++ b/meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
@@ -1,4 +1,4 @@
-From 4fa4aae4176ef6d8f4d4b8323d061e2433918a26 Mon Sep 17 00:00:00 2001
+From a49987d386084515610fd40f0416a9b2f216842c Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Wed, 17 Jan 2018 10:51:49 -0800
 Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
@@ -13,15 +13,16 @@ to what it was before the problematic commit.
 
 Upstream-Status: Submitted http://lists.gnu.org/archive/html/qemu-devel/2018-01/msg04185.html
 Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+
 ---
  linux-user/main.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/linux-user/main.c b/linux-user/main.c
-index 450eb3ce65..c7cc0a184e 100644
+index 8907a84..ea42c43 100644
 --- a/linux-user/main.c
 +++ b/linux-user/main.c
-@@ -77,7 +77,7 @@ do {                                                                    \
+@@ -79,7 +79,7 @@ do {                                                                    \
        (TARGET_LONG_BITS == 32 || defined(TARGET_ABI32))
  /* There are a number of places where we assign reserved_va to a variable
     of type abi_ulong and expect it to fit.  Avoid the last page.  */
@@ -30,6 +31,3 @@ index 450eb3ce65..c7cc0a184e 100644
  #  else
  #   define MAX_RESERVED_VA  (1ul << TARGET_VIRT_ADDR_SPACE_BITS)
  #  endif
--- 
-2.14.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/no-valgrind.patch b/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
index 91f728042d..80f9ed11a6 100644
--- a/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
+++ b/meta/recipes-devtools/qemu/qemu/no-valgrind.patch
@@ -1,13 +1,25 @@
+From 4210013809605e1f3d2f4655a7f686cf103cea12 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 20 Oct 2015 22:19:08 +0100
+Subject: [PATCH] qemu: disable Valgrind
+
 There isn't an option to enable or disable valgrind support, so disable it to avoid non-deterministic builds.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ configure | 9 ---------
+ 1 file changed, 9 deletions(-)
+
 diff --git a/configure b/configure
-index b3c4f51..4d3929e 100755
+index 0a19b03..69e05fb 100755
 --- a/configure
 +++ b/configure
-@@ -4193,9 +4192,0 @@ valgrind_h=no
+@@ -4895,15 +4895,6 @@ fi
+ # check if we have valgrind/valgrind.h
+ 
+ valgrind_h=no
 -cat > $TMPC << EOF
 -#include <valgrind/valgrind.h>
 -int main(void) {
@@ -17,3 +29,6 @@ index b3c4f51..4d3929e 100755
 -if compile_prog "" "" ; then
 -    valgrind_h=yes
 -fi
+ 
+ ########################################
+ # check if environ is declared
diff --git a/meta/recipes-devtools/qemu/qemu/pathlimit.patch b/meta/recipes-devtools/qemu/qemu/pathlimit.patch
index 57ab981c61..09e98f77b4 100644
--- a/meta/recipes-devtools/qemu/qemu/pathlimit.patch
+++ b/meta/recipes-devtools/qemu/qemu/pathlimit.patch
@@ -1,3 +1,8 @@
+From a99658f1bb4bc858f67bf7032e8fe9ddd46abe66 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 9 Mar 2016 22:49:02 +0000
+Subject: [PATCH] qemu: Limit paths searched during user mode emulation
+
 By default qemu builds a complete list of directories within the user
 emulation sysroot (-L option). The OE sysroot directory is large and
 this is confusing, for example it indexes all pkgdata. In particular this
@@ -8,18 +13,22 @@ things if/as/when it needs to. This drastically reduces the files it
 reads and reduces memory usage and cleans up strace.
 
 It would also avoid the infinite directory traversal bug in [YOCTO #6996]
-although the code could still be vulnerable if it parsed those specific 
+although the code could still be vulnerable if it parsed those specific
 paths.
 
 RP
 2016/3/9
 Upstream-Status: Pending
 
-Index: qemu-2.5.0/util/path.c
-===================================================================
---- qemu-2.5.0.orig/util/path.c
-+++ qemu-2.5.0/util/path.c
-@@ -19,6 +19,7 @@ struct pathelem
+---
+ util/path.c | 44 ++++++++++++++++++++++----------------------
+ 1 file changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/util/path.c b/util/path.c
+index 7f9fc27..a416cd4 100644
+--- a/util/path.c
++++ b/util/path.c
+@@ -15,6 +15,7 @@ struct pathelem
      char *name;
      /* Full path name, eg. /usr/gnemul/x86-linux/lib. */
      char *pathname;
@@ -27,7 +36,7 @@ Index: qemu-2.5.0/util/path.c
      struct pathelem *parent;
      /* Children */
      unsigned int num_entries;
-@@ -49,6 +50,7 @@ static struct pathelem *new_entry(const
+@@ -45,6 +46,7 @@ static struct pathelem *new_entry(const char *root,
      new->name = g_strdup(name);
      new->pathname = g_strdup_printf("%s/%s", root, name);
      new->num_entries = 0;
@@ -35,7 +44,7 @@ Index: qemu-2.5.0/util/path.c
      return new;
  }
  
-@@ -57,15 +59,16 @@ static struct pathelem *new_entry(const
+@@ -53,15 +55,16 @@ static struct pathelem *new_entry(const char *root,
  /* Not all systems provide this feature */
  #if defined(DT_DIR) && defined(DT_UNKNOWN) && defined(DT_LNK)
  # define dirent_type(dirent) ((dirent)->d_type)
@@ -55,7 +64,7 @@ Index: qemu-2.5.0/util/path.c
      DIR *dir;
  
      if ((dir = opendir(path->pathname)) != NULL) {
-@@ -78,6 +81,11 @@ static struct pathelem *add_dir_maybe(st
+@@ -74,6 +77,11 @@ static struct pathelem *add_dir_maybe(struct pathelem *path)
          }
          closedir(dir);
      }
@@ -67,7 +76,7 @@ Index: qemu-2.5.0/util/path.c
      return path;
  }
  
-@@ -93,26 +101,16 @@ static struct pathelem *add_entry(struct
+@@ -89,26 +97,16 @@ static struct pathelem *add_entry(struct pathelem *root, const char *name,
      e = &root->entries[root->num_entries-1];
  
      *e = new_entry(root->pathname, root, name);
@@ -97,7 +106,7 @@ Index: qemu-2.5.0/util/path.c
  {
      unsigned int i, namelen;
  
-@@ -123,14 +121,18 @@ follow_path(const struct pathelem *curso
+@@ -119,14 +117,18 @@ follow_path(const struct pathelem *cursor, const char *name)
          return cursor->pathname;
  
      if (strneq(name, namelen, ".."))
@@ -119,7 +128,7 @@ Index: qemu-2.5.0/util/path.c
  
      /* Not found */
      return NULL;
-@@ -164,8 +166,6 @@ void init_paths(const char *prefix)
+@@ -160,8 +162,6 @@ void init_paths(const char *prefix)
          g_free(base->name);
          g_free(base);
          base = NULL;
@@ -128,7 +137,7 @@ Index: qemu-2.5.0/util/path.c
      }
  }
  
-@@ -177,5 +177,5 @@ const char *path(const char *name)
+@@ -173,5 +173,5 @@ const char *path(const char *name)
      if (!base || !name || name[0] != '/')
          return name;
  
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
index c7425ab8d4..dbe28c4c7f 100644
--- a/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
+++ b/meta/recipes-devtools/qemu/qemu/qemu-enlarge-env-entry-size.patch
@@ -1,4 +1,8 @@
-qemu: Add addition environment space to boot loader qemu-system-mips 
+From 3c1badb861c79f673503dd08c71b3c9c9ac2a8c0 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Fri, 28 Mar 2014 17:42:43 +0800
+Subject: [PATCH] qemu: Add addition environment space to boot loader
+ qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
 
@@ -9,15 +13,16 @@ to only 256 bytes. This patch expands the limit.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
 ---
- hw/mips/mips_malta.c    |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ hw/mips/mips_malta.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
-index 9d521cc..17c0391 100644
+index f6513a4..d5efafb 100644
 --- a/hw/mips/mips_malta.c
 +++ b/hw/mips/mips_malta.c
-@@ -53,7 +53,7 @@
+@@ -62,7 +62,7 @@
  
  #define ENVP_ADDR		0x80002000l
  #define ENVP_NB_ENTRIES	 	16
@@ -26,6 +31,3 @@ index 9d521cc..17c0391 100644
  
  /* Hardware addresses */
  #define FLASH_ADDRESS 0x1e000000ULL
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/wacom.patch b/meta/recipes-devtools/qemu/qemu/wacom.patch
index cd06aa4ac6..90e4b800b5 100644
--- a/meta/recipes-devtools/qemu/qemu/wacom.patch
+++ b/meta/recipes-devtools/qemu/qemu/wacom.patch
@@ -1,19 +1,27 @@
+From 41603f745caaecdc7c9d760fb7d2df01ccc60128 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 27 Nov 2014 14:04:29 +0000
+Subject: [PATCH] qemu: Add missing wacom HID descriptor
+
 The USB wacom device is missing a HID descriptor which causes it
 to fail to operate with recent kernels (e.g. 3.17).
 
-This patch adds a HID desriptor to the device, based upon one from 
+This patch adds a HID desriptor to the device, based upon one from
 real wcom device.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Submitted
 2014/11/27
+---
+ hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 93 insertions(+), 1 deletion(-)
 
-Index: qemu-2.1.0/hw/usb/dev-wacom.c
-===================================================================
---- qemu-2.1.0.orig/hw/usb/dev-wacom.c	2014-08-01 15:12:17.000000000 +0100
-+++ qemu-2.1.0/hw/usb/dev-wacom.c	2014-10-12 12:13:30.540306042 +0100
-@@ -68,6 +68,89 @@
+diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
+index bf70013059..2f6e129732 100644
+--- a/hw/usb/dev-wacom.c
++++ b/hw/usb/dev-wacom.c
+@@ -72,6 +72,89 @@ static const USBDescStrings desc_strings = {
      [STR_SERIALNUMBER]     = "1",
  };
  
@@ -103,7 +111,7 @@ Index: qemu-2.1.0/hw/usb/dev-wacom.c
  static const USBDescIface desc_iface_wacom = {
      .bInterfaceNumber              = 0,
      .bNumEndpoints                 = 1,
-@@ -85,7 +168,7 @@
+@@ -89,7 +172,7 @@ static const USBDescIface desc_iface_wacom = {
                  0x00,          /*  u8  country_code */
                  0x01,          /*  u8  num_descriptors */
                  0x22,          /*  u8  type: Report */
@@ -112,7 +120,7 @@ Index: qemu-2.1.0/hw/usb/dev-wacom.c
              },
          },
      },
-@@ -265,6 +350,15 @@
+@@ -269,6 +352,15 @@ static void usb_wacom_handle_control(USBDevice *dev, USBPacket *p,
      }
  
      switch (request) {
-- 
2.17.0


