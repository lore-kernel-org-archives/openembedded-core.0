Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F277F7FA44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d73so3424650wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=++DFh/IpjBG4EQ40Bq/lthJRPSL00NWMdgXSGjhXlHU=;
	b=V7lS4QZ4UGYHp2DZraJ9T7e3s2WuaKaAGCiswsFj0YwWzWWYskKGqk++ixIani8qrm
	A/lcvS3a1v8JyyEcWWoyZTE3q2bPOeDE61CAChGGtD52N6M8Y3XkAGcO4ATwxXm27C4q
	t1rdLiF3AkHTKoB+VdVoIq29WNjG7PGdSn046+12tRa74vwl4EaSnqHYkkOW9pkjDdEZ
	4MMmc8H7v21XCB+dm+9bOCn7wNrlP0yM0+/VNG6vzS091ToIZAAs8lCiuYuAn+JNgXIQ
	P/YiUYHfN7/OMPJ1P/S+ZM5eZv65XbBfXg+NL3VPNZSMqaC90oRLZSTeY3ZEMLws68Mf
	0K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=++DFh/IpjBG4EQ40Bq/lthJRPSL00NWMdgXSGjhXlHU=;
	b=AVZo6KrmEX79ISDjW1lDeGabfFTGL0Mk/1XTuUkVVzz3koKduv5WQfXhzLoNQd/XKE
	S9fdg3Uz5zti1pb3zt3ye1bmIyeuGsX93cDDfKjKWy2DAbWujfqSfSefhkn6F+h4/b2j
	B9lF/9cz3YT9srK3cZE0CHDX/5x9Nql5MirqVP7D77/Vw11tUDZl4jdtf7Cl9BS5c0rF
	afHdmxz9lElKdb1K9dppXEgLxYNrHFfTNkf6eppgi43OMdwN8G7zRivSqO6gR4c4cNPL
	/bQRnI6LHQWZFJmaojnJI8LminjPQcZapfF9cAd9GacinWW/edEXcXS4CvBu8vbmDrpP
	evBg==
X-Gm-Message-State: APjAAAU4eQjj28ngv1K7oqlIg5KqRCU2VXcMTipKM5hbbcLz/nYOUJ1I
	h0xpZjhHjt52Gg/3JtWc/8eWrTBq
X-Google-Smtp-Source: APXvYqz1jJ4NMsrmGXsCOZbGEVTxGuze0kSHmOscU1nqoEwfycyDj8+hcjr/7p7LZvbk8/64CIsdgw==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr7837312wmk.175.1576174500722; 
	Thu, 12 Dec 2019 10:15:00 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:24 +0100
Message-Id: <20191212181436.1322-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/30] parted: update 3.2->3.3
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:01 -0000

0001-Unset-need_charset_alias-when-building-for-musl.patch is no longer
necessary as upstream has removed the code.

dm_check.patch is replaced with 0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch

Rework ptests, in particular remove the generated Makefile
from the layer, and use the upstream Makefile.

Ptest pass rate is 100%.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-Include-fcntl.h-in-platform_defs.h.patch |  33 --
 ...er-scripts-used-only-in-tests-to-Pyt.patch |  23 +-
 ...charset_alias-when-building-for-musl.patch |  33 --
 ...ad-only-when-probing-devices-on-linu.patch | 222 --------------
 ...s-add-sourcedir-lib-to-include-paths.patch |  26 ++
 ...lude-sys-sysmacros.h-for-major-macro.patch |  28 --
 ...rather-than-skip_test_-which-is-unde.patch |  66 ++++
 meta/recipes-extended/parted/files/Makefile   | 285 ------------------
 .../parted/files/dm_check.patch               |  22 --
 .../files/fix-compile-failure-while-dis.patch |  81 -----
 meta/recipes-extended/parted/files/run-ptest  |   2 +-
 .../parted/{parted_3.2.bb => parted_3.3.bb}   |  33 +-
 12 files changed, 117 insertions(+), 737 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
 delete mode 100644 meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch
 create mode 100644 meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
 delete mode 100644 meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch
 create mode 100644 meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
 delete mode 100644 meta/recipes-extended/parted/files/Makefile
 delete mode 100644 meta/recipes-extended/parted/files/dm_check.patch
 delete mode 100644 meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
 rename meta/recipes-extended/parted/{parted_3.2.bb => parted_3.3.bb} (61%)

diff --git a/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch b/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
deleted file mode 100644
index 4070127d343..00000000000
--- a/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From a3877115f1956949096d77aca5a703a47ed68397 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sun, 3 May 2015 10:33:31 +0200
-Subject: [PATCH] libparted/fs/xfs/platform_defs.h: Include <fcntl.h> for
- loff_t
-
-This is needed for compilation with musl libc
-
-Suggested-by: Travis Tilley <ttilley@gmail.com>
-
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
----
- libparted/fs/xfs/platform_defs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libparted/fs/xfs/platform_defs.h b/libparted/fs/xfs/platform_defs.h
-index 2b55752..a6ec8fb 100644
---- a/libparted/fs/xfs/platform_defs.h
-+++ b/libparted/fs/xfs/platform_defs.h
-@@ -38,6 +38,7 @@
- #include <stdarg.h>
- #include <assert.h>
- #include <endian.h>
-+#include <fcntl.h>
- #include <stddef.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch b/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
index 428b14ed5e0..829c0c8b78d 100644
--- a/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
+++ b/meta/recipes-extended/parted/files/0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch
@@ -1,17 +1,18 @@
-From 6e82af54714392dcdf74a8aedaae7de7d0af1080 Mon Sep 17 00:00:00 2001
+From ddbefd80d74c3baaae328332458db447e1666240 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 27 Apr 2017 16:37:24 +0300
 Subject: [PATCH] Move python helper scripts (used only in tests) to Python 3
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  tests/gpt-header-move | 2 +-
- tests/msdos-overlap   | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ tests/msdos-overlap   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/gpt-header-move b/tests/gpt-header-move
-index 05cdc65..3cbcb7e 100755
+index 3dda5cb..a2b9508 100755
 --- a/tests/gpt-header-move
 +++ b/tests/gpt-header-move
 @@ -1,4 +1,4 @@
@@ -21,7 +22,7 @@ index 05cdc65..3cbcb7e 100755
  # open img file, subtract 33 from altlba address, and move the last 33 sectors
  # back by 33 sectors
 diff --git a/tests/msdos-overlap b/tests/msdos-overlap
-index 5bddfb0..3de7d2e 100755
+index d6ae8d6..2c6747b 100755
 --- a/tests/msdos-overlap
 +++ b/tests/msdos-overlap
 @@ -1,4 +1,4 @@
@@ -30,15 +31,3 @@ index 5bddfb0..3de7d2e 100755
  """
      Write an overlapping partition to a msdos disk
  
-@@ -14,7 +14,7 @@ BAD_ENTRY = (0x72, 0xf5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- OFFSET = 0x1b8
- 
- if len(sys.argv) < 2:
--    print "%s: <image or device>"
-+    print("%s: <image or device>")
-     sys.exit(1)
- 
- data = "".join(chr(c) for c in BAD_ENTRY)
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index ba1a4bab4c1..00000000000
--- a/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gnulib.mk b/lib/gnulib.mk
-index e1d74db..c0e92dd 100644
---- a/lib/gnulib.mk
-+++ b/lib/gnulib.mk
-@@ -1882,7 +1882,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch b/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch
deleted file mode 100644
index 39107620d54..00000000000
--- a/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-From 843225aa9d5077bebdb08bbf9699c02aec0b83eb Mon Sep 17 00:00:00 2001
-From: "Brian C. Lane" <bcl@redhat.com>
-Date: Tue, 26 Sep 2017 08:04:58 +0000
-Subject: [PATCH] libparted: Use read only when probing devices on linux
-
- (#1245144)
-
-When a device is opened for RW closing it can trigger other actions,
-like udev scanning it for partition changes. Use read only for the
-init_* methods and RW for actual changes to the device.
-
-This adds _device_open which takes mode flags as an argument and turns
-linux_open into a wrapper for it with RW_MODE.
-
-_device_open_ro is added to open the device with RD_MODE and increment
-the open_counter. This is used in the init_* functions.
-
-_device_close is a wrapper around linux_close that decrements the
-open_counter and is used in the init_* functions.
-
-All of these changes are self-contained with no external API changes.
-The only visible change in behavior is that when a new PedDevice is
-created the device is opened in RO_MODE instead of RW_MODE.
-
-Resolves: rhbz#1245144
-
-Upstream-Status: Backport
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
-
----
- libparted/arch/linux.c | 62 +++++++++++++++++++++++++++++++++++---------------
- 1 file changed, 44 insertions(+), 18 deletions(-)
-
-diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 7f12f58..4ddea58 100644
---- a/libparted/arch/linux.c
-+++ b/libparted/arch/linux.c
-@@ -292,7 +292,9 @@ struct blkdev_ioctl_param {
- static char* _device_get_part_path (PedDevice const *dev, int num);
- static int _partition_is_mounted_by_path (const char* path);
- static unsigned int _device_get_partition_range(PedDevice const* dev);
--
-+static int _device_open (PedDevice* dev, int flags);
-+static int _device_open_ro (PedDevice* dev);
-+static int _device_close (PedDevice* dev);
- 
- static int
- _read_fd (int fd, char **buf)
-@@ -911,7 +913,7 @@ init_ide (PedDevice* dev)
-         if (!_device_stat (dev, &dev_stat))
-                 goto error;
- 
--        if (!ped_device_open (dev))
-+        if (!_device_open_ro (dev))
-                 goto error;
- 
-         if (ioctl (arch_specific->fd, HDIO_GET_IDENTITY, &hdi)) {
-@@ -980,11 +982,11 @@ init_ide (PedDevice* dev)
-         if (!_device_probe_geometry (dev))
-                 goto error_close_dev;
- 
--        ped_device_close (dev);
-+        _device_close (dev);
-         return 1;
- 
- error_close_dev:
--        ped_device_close (dev);
-+        _device_close (dev);
- error:
-         return 0;
- }
-@@ -1117,7 +1119,7 @@ init_scsi (PedDevice* dev)
-         char* vendor;
-         char* product;
- 
--        if (!ped_device_open (dev))
-+        if (!_device_open_ro (dev))
-                 goto error;
- 
-         if (ioctl (arch_specific->fd, SCSI_IOCTL_GET_IDLUN, &idlun) < 0) {
-@@ -1131,7 +1133,7 @@ init_scsi (PedDevice* dev)
-                         goto error_close_dev;
-                 if (!_device_probe_geometry (dev))
-                         goto error_close_dev;
--                ped_device_close (dev);
-+                _device_close (dev);
-                 return 1;
-         }
- 
-@@ -1153,11 +1155,11 @@ init_scsi (PedDevice* dev)
-         if (!_device_probe_geometry (dev))
-                 goto error_close_dev;
- 
--        ped_device_close (dev);
-+        _device_close (dev);
-         return 1;
- 
- error_close_dev:
--        ped_device_close (dev);
-+        _device_close (dev);
- error:
-         return 0;
- }
-@@ -1169,7 +1171,7 @@ init_file (PedDevice* dev)
- 
-         if (!_device_stat (dev, &dev_stat))
-                 goto error;
--        if (!ped_device_open (dev))
-+        if (!_device_open_ro (dev))
-                 goto error;
- 
-         dev->sector_size = PED_SECTOR_SIZE_DEFAULT;
-@@ -1196,7 +1198,7 @@ init_file (PedDevice* dev)
-                 goto error_close_dev;
-         }
- 
--        ped_device_close (dev);
-+        _device_close (dev);
- 
-         dev->bios_geom.cylinders = dev->length / 4 / 32;
-         dev->bios_geom.heads = 4;
-@@ -1207,7 +1209,7 @@ init_file (PedDevice* dev)
-         return 1;
- 
- error_close_dev:
--        ped_device_close (dev);
-+        _device_close (dev);
- error:
-         return 0;
- }
-@@ -1223,7 +1225,7 @@ init_dasd (PedDevice* dev, const char* model_name)
-         if (!_device_stat (dev, &dev_stat))
-                 goto error;
- 
--        if (!ped_device_open (dev))
-+        if (!_device_open_ro (dev))
-                 goto error;
- 
-         LinuxSpecific* arch_specific = LINUX_SPECIFIC (dev);
-@@ -1263,11 +1265,11 @@ init_dasd (PedDevice* dev, const char* model_name)
- 
-         dev->model = strdup (model_name);
- 
--        ped_device_close (dev);
-+        _device_close (dev);
-         return 1;
- 
- error_close_dev:
--        ped_device_close (dev);
-+        _device_close (dev);
- error:
-         return 0;
- }
-@@ -1282,7 +1284,7 @@ init_generic (PedDevice* dev, const char* model_name)
-         if (!_device_stat (dev, &dev_stat))
-                 goto error;
- 
--        if (!ped_device_open (dev))
-+        if (!_device_open_ro (dev))
-                 goto error;
- 
-         ped_exception_fetch_all ();
-@@ -1330,11 +1332,11 @@ init_generic (PedDevice* dev, const char* model_name)
- 
-         dev->model = strdup (model_name);
- 
--        ped_device_close (dev);
-+        _device_close (dev);
-         return 1;
- 
- error_close_dev:
--        ped_device_close (dev);
-+        _device_close (dev);
- error:
-         return 0;
- }
-@@ -1621,12 +1623,27 @@ retry:
- }
- 
- static int
-+_device_open_ro (PedDevice* dev)
-+{
-+    int rc = _device_open (dev, RD_MODE);
-+    if (rc)
-+        dev->open_count++;
-+    return rc;
-+}
-+
-+static int
- linux_open (PedDevice* dev)
- {
-+    return _device_open (dev, RW_MODE);
-+}
-+
-+static int
-+_device_open (PedDevice* dev, int flags)
-+{
-         LinuxSpecific*  arch_specific = LINUX_SPECIFIC (dev);
- 
- retry:
--        arch_specific->fd = open (dev->path, RW_MODE);
-+        arch_specific->fd = open (dev->path, flags);
- 
-         if (arch_specific->fd == -1) {
-                 char*   rw_error_msg = strerror (errno);
-@@ -1695,6 +1712,15 @@ linux_refresh_close (PedDevice* dev)
-         return 1;
- }
- 
-+static int
-+_device_close (PedDevice* dev)
-+{
-+    int rc = linux_close (dev);
-+    if (dev->open_count > 0)
-+        dev->open_count--;
-+    return rc;
-+}
-+
- #if SIZEOF_OFF_T < 8
- 
- static _syscall5(int,_llseek,
diff --git a/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch b/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
new file mode 100644
index 00000000000..4dc2ab259d4
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch
@@ -0,0 +1,26 @@
+From d60a8a86f6593738b5324ccd8fe3e6d84a1fe7bc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 11 Dec 2019 14:18:36 +0100
+Subject: [PATCH] libparted/fs: add $sourcedir/lib to include paths
+
+Otherwise, getopt-pfx-core.h won't be found.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libparted/fs/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
+index 286bff6..65f45d3 100644
+--- a/libparted/fs/Makefile.am
++++ b/libparted/fs/Makefile.am
+@@ -3,7 +3,7 @@
+ #
+ # This file may be modified and/or distributed without restriction.
+ 
+-partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include
++partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include -I$(top_srcdir)/lib
+ 
+ AM_CFLAGS = $(WARN_CFLAGS)
+ 
diff --git a/meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch b/meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch
deleted file mode 100644
index 01262e5452a..00000000000
--- a/meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 0b72b8eb41438b62eeb9e3548b0b8f3094a78681 Mon Sep 17 00:00:00 2001
-From: "Richard W.M. Jones" <rjones@redhat.com>
-Date: Sat, 24 Mar 2018 17:37:02 +0000
-Subject: [PATCH] linux: Include <sys/sysmacros.h> for major() macro.
-
-Since glibc 2.27 this header is required.
----
- libparted/arch/linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 0f18904..a15854f 100644
---- a/libparted/arch/linux.c
-+++ b/libparted/arch/linux.c
-@@ -41,6 +41,7 @@
- #include <sys/utsname.h>        /* for uname() */
- #include <scsi/scsi.h>
- #include <assert.h>
-+#include <sys/sysmacros.h>
- #ifdef ENABLE_DEVICE_MAPPER
- #include <libdevmapper.h>
- #endif
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch b/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
new file mode 100644
index 00000000000..9524adf7b82
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch
@@ -0,0 +1,66 @@
+From 9f844484cedb39e301b016e9da7852c1a0fb6eea Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 11 Dec 2019 16:27:48 +0100
+Subject: [PATCH] tests: use skip_ rather than skip_test_ (which is undefined)
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/t6001-psep.sh               | 2 +-
+ tests/t6004-dm-many-partitions.sh | 2 +-
+ tests/t6005-dm-uuid.sh            | 2 +-
+ tests/t6006-dm-512b-sectors.sh    | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/t6001-psep.sh b/tests/t6001-psep.sh
+index e350bd2..67014a0 100644
+--- a/tests/t6001-psep.sh
++++ b/tests/t6001-psep.sh
+@@ -21,7 +21,7 @@
+ require_root_
+ require_udevadm_settle_
+ 
+-(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
++(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
+ 
+ # Device maps names - should be random to not conflict with existing ones on
+ # the system
+diff --git a/tests/t6004-dm-many-partitions.sh b/tests/t6004-dm-many-partitions.sh
+index b4be975..7214f60 100755
+--- a/tests/t6004-dm-many-partitions.sh
++++ b/tests/t6004-dm-many-partitions.sh
+@@ -21,7 +21,7 @@
+ 
+ require_root_
+ require_udevadm_settle_
+-(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
++(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
+ 
+ ss=$sector_size_
+ ns=300
+diff --git a/tests/t6005-dm-uuid.sh b/tests/t6005-dm-uuid.sh
+index 4266747..4790a8b 100755
+--- a/tests/t6005-dm-uuid.sh
++++ b/tests/t6005-dm-uuid.sh
+@@ -21,7 +21,7 @@
+ 
+ require_root_
+ require_udevadm_settle_
+-(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
++(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
+ 
+ ss=$sector_size_
+ ns=300
+diff --git a/tests/t6006-dm-512b-sectors.sh b/tests/t6006-dm-512b-sectors.sh
+index bf32135..b679adb 100644
+--- a/tests/t6006-dm-512b-sectors.sh
++++ b/tests/t6006-dm-512b-sectors.sh
+@@ -25,7 +25,7 @@ require_scsi_debug_module_
+ grep '^#define USE_BLKID 1' "$CONFIG_HEADER" > /dev/null ||
+   skip_ 'this system lacks a new-enough libblkid'
+ 
+-(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
++(dmsetup --help) > /dev/null 2>&1 || skip_ "No dmsetup installed"
+ 
+ # Device maps names - should be random to not conflict with existing ones on
+ # the system
diff --git a/meta/recipes-extended/parted/files/Makefile b/meta/recipes-extended/parted/files/Makefile
deleted file mode 100644
index ee90be0814b..00000000000
--- a/meta/recipes-extended/parted/files/Makefile
+++ /dev/null
@@ -1,285 +0,0 @@
-am__tty_colors_dummy = \
-  mgn= red= grn= lgn= blu= brg= std=; \
-  am__color_tests=no
-
-am__tty_colors = \
-$(am__tty_colors_dummy); \
-test "X$(AM_COLOR_TESTS)" != Xno \
-&& test "X$$TERM" != Xdumb \
-&& { test "X$(AM_COLOR_TESTS)" = Xalways || test -t 1 2>/dev/null; } \
-&& { \
-  am__color_tests=yes; \
-  red='[0;31m'; \
-  grn='[0;32m'; \
-  lgn='[1;32m'; \
-  blu='[1;34m'; \
-  mgn='[0;35m'; \
-  brg='[1m'; \
-  std='[m'; \
-}
-
-am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
-am__vpath_adj = case $$p in \
-    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
-    *) f=$$p;; \
-  esac;
-am__rst_title = { sed 's/.*/   &   /;h;s/./=/g;p;x;s/ *$$//;p;g' && echo; }
-am__rst_section = { sed 'p;s/./=/g;' && echo; }
-am__sh_e_setup = case $$- in *e*) set +e;; esac
-
-am__common_driver_flags = \
-  --color-tests "$$am__color_tests" \
-  --enable-hard-errors "$$am__enable_hard_errors" \
-  --expect-failure "$$am__expect_failure"
-am__check_pre = \
-$(am__sh_e_setup);					\
-$(am__vpath_adj_setup) $(am__vpath_adj)			\
-$(am__tty_colors);					\
-srcdir=$(srcdir); export srcdir;			\
-am__odir=`echo "./$@" | sed 's|/[^/]*$$||'`;		\
-test "x$$am__odir" = x. || $(MKDIR_P) "$$am__odir" || exit $$?;	\
-if test -f "./$$f"; then dir=./;			\
-elif test -f "$$f"; then dir=;				\
-else dir="$(srcdir)/"; fi;				\
-tst=$$dir$$f; log='$@'; 				\
-if test -n '$(DISABLE_HARD_ERRORS)'; then		\
-  am__enable_hard_errors=no; 				\
-else							\
-  am__enable_hard_errors=yes; 				\
-fi; 							\
-$(AM_TESTS_ENVIRONMENT) $(TESTS_ENVIRONMENT)
-
-am__set_TESTS_bases = \
-  bases='$(TEST_LOGS)'; \
-  bases=`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; \
-  bases=`echo $$bases`
-
-RECHECK_LOGS = $(TEST_LOGS)
-TEST_SUITE_LOG = test-suite.log
-am__test_logs1 = $(TESTS:=.log)
-am__test_logs2 = $(am__test_logs1:.log=.log)
-TEST_LOGS = $(am__test_logs2:.sh.log=.log)
-SH_LOG_DRIVER = $(SHELL) $(top_srcdir)/build-aux/test-driver
-SH_LOG_COMPILE = $(SH_LOG_COMPILER)
-
-am__set_b = \
-  case '$@' in \
-    */*) \
-      case '$*' in \
-        */*) b='$*';; \
-          *) b=`echo '$@' | sed 's/\.log$$//'`; \
-       esac;; \
-    *) \
-      b='$*';; \
-  esac
-
-MKDIR_P = /bin/mkdir -p
-SHELL = /bin/bash
-VERSION = 3.1
-PACKAGE_STRING = GNU parted 3.1
-PACKAGE_BUGREPORT = bug-parted@gnu.org
-abs_srcdir = $(PWD)
-abs_top_builddir = $(PWD)/..
-abs_top_srcdir = $(PWD)/..
-srcdir = .
-top_srcdir = ..
-subdir = tests
-SH_LOG_COMPILER = $(SHELL)
-
-TESTS = \
-  help-version.sh \
-  t0000-basic.sh \
-  t0001-tiny.sh \
-  t0010-script-no-ctrl-chars.sh \
-  t0100-print.sh \
-  t0101-print-empty.sh \
-  t0200-gpt.sh \
-  t0201-gpt.sh \
-  t0202-gpt-pmbr.sh \
-  t0203-gpt-tiny-device-abort.sh \
-  t0203-gpt-shortened-device-primary-valid.sh \
-  t0205-gpt-list-clobbers-pmbr.sh \
-  t0206-gpt-print-with-corrupt-primary-clobbers-pmbr.sh \
-  t0207-IEC-binary-notation.sh \
-  t0208-mkpart-end-in-IEC.sh \
-  t0209-gpt-pmbr_boot.sh \
-  t0210-gpt-resized-partition-entry-array.sh \
-  t0211-gpt-rewrite-header.sh \
-  t0212-gpt-many-partitions.sh \
-  t0220-gpt-msftres.sh \
-  t0250-gpt.sh \
-  t0280-gpt-corrupt.sh \
-  t0300-dos-on-gpt.sh \
-  t0400-loop-clobber-infloop.sh \
-  t0500-dup-clobber.sh \
-  t0501-duplicate.sh \
-  t1100-busy-label.sh \
-  t1101-busy-partition.sh \
-  t1700-probe-fs.sh \
-  t2200-dos-label-recog.sh \
-  t2201-pc98-label-recog.sh \
-  t2300-dos-label-extended-bootcode.sh \
-  t2310-dos-extended-2-sector-min-offset.sh \
-  t2400-dos-hfs-partition-type.sh \
-  t2500-probe-corrupt-hfs.sh \
-  t3000-resize-fs.sh \
-  t3200-type-change.sh \
-  t3300-palo-prep.sh \
-  t3310-flags.sh \
-  t3400-whole-disk-FAT-partition.sh \
-  t4000-sun-raid-type.sh \
-  t4001-sun-vtoc.sh \
-  t4100-msdos-partition-limits.sh \
-  t4100-dvh-partition-limits.sh \
-  t4100-msdos-starting-sector.sh \
-  t4200-partprobe.sh \
-  t4300-nilfs2-tiny.sh \
-  t5000-tags.sh \
-  t6000-dm.sh \
-  t6001-psep.sh \
-  t6100-mdraid-partitions.sh \
-  t7000-scripting.sh \
-  t8000-loop.sh \
-  t8001-loop-blkpg.sh \
-  t9010-big-sector.sh \
-  t9020-alignment.sh \
-  t9021-maxima.sh \
-  t9022-one-unit-snap.sh \
-  t9023-value-lt-one.sh \
-  t9030-align-check.sh \
-  t9040-many-partitions.sh \
-  t9041-undetected-in-use-16th-partition.sh \
-  t9042-dos-partition-limit.sh \
-  t9050-partition-table-types.sh
-
-TESTS_ENVIRONMENT = \
-  export					\
-  abs_top_builddir='$(abs_top_builddir)'	\
-  abs_top_srcdir='$(abs_top_srcdir)'		\
-  abs_srcdir='$(abs_srcdir)'			\
-  built_programs=parted				\
-  srcdir='$(srcdir)'				\
-  top_srcdir='$(top_srcdir)'			\
-  VERSION=$(VERSION)				\
-  ; 9>&2
-
-.SUFFIXES: .log
-
-$(TEST_SUITE_LOG): $(TEST_LOGS)
-	@$(am__sh_e_setup); $(am__tty_colors); $(am__set_TESTS_bases); \
-	ws='[ 	]'; \
-	results=`for b in $$bases; do echo $$b.trs; done`; \
-	test -n "$$results" || results=/dev/null; \
-	all=`  grep "^$$ws*:test-result:"           $$results | wc -l`; \
-	pass=` grep "^$$ws*:test-result:$$ws*PASS"  $$results | wc -l`; \
-	fail=` grep "^$$ws*:test-result:$$ws*FAIL"  $$results | wc -l`; \
-	skip=` grep "^$$ws*:test-result:$$ws*SKIP"  $$results | wc -l`; \
-	xfail=`grep "^$$ws*:test-result:$$ws*XFAIL" $$results | wc -l`; \
-	xpass=`grep "^$$ws*:test-result:$$ws*XPASS" $$results | wc -l`; \
-	error=`grep "^$$ws*:test-result:$$ws*ERROR" $$results | wc -l`; \
-	if test `expr $$fail + $$xpass + $$error` -eq 0; then \
-	  success=true; \
-	else \
-	  success=false; \
-	fi; \
-	br='==================='; br=$$br$$br$$br$$br; \
-	result_count () \
-	{ \
-	    if test x"$$1" = x"--maybe-color"; then \
-	      maybe_colorize=yes; \
-	    elif test x"$$1" = x"--no-color"; then \
-	      maybe_colorize=no; \
-	    else \
-	      echo "$@: invalid 'result_count' usage" >&2; exit 4; \
-	    fi; \
-	    shift; \
-	    desc=$$1 count=$$2; \
-	    if test $$maybe_colorize = yes && test $$count -gt 0; then \
-	      color_start=$$3 color_end=$$std; \
-	    else \
-	      color_start= color_end=; \
-	    fi; \
-	    echo "$${color_start}# $$desc $$count$${color_end}"; \
-	}; \
-	create_testsuite_report () \
-	{ \
-	  result_count $$1 "TOTAL:" $$all   "$$brg"; \
-	  result_count $$1 "PASS: " $$pass  "$$grn"; \
-	  result_count $$1 "SKIP: " $$skip  "$$blu"; \
-	  result_count $$1 "XFAIL:" $$xfail "$$lgn"; \
-	  result_count $$1 "FAIL: " $$fail  "$$red"; \
-	  result_count $$1 "XPASS:" $$xpass "$$red"; \
-	  result_count $$1 "ERROR:" $$error "$$mgn"; \
-	}; \
-	{								\
-	  echo "$(PACKAGE_STRING): $(subdir)/$(TEST_SUITE_LOG)" |	\
-	    $(am__rst_title);						\
-	  create_testsuite_report --no-color;				\
-	  echo;								\
-	  echo ".. contents:: :depth: 2";				\
-	  echo;								\
-	  for i in $$bases; do						\
-	    if grep "^$$ws*:copy-in-global-log:$$ws*no$$ws*$$" $$i.trs \
-	         >/dev/null; then continue; \
-	    fi; \
-	    glob_res=`sed -n -e "s/$$ws*$$//" \
-	                     -e "s/^$$ws*:global-test-result:$$ws*//p" \
-		        $$i.trs`; \
-	    test -n "$$glob_res" || glob_res=RUN; \
-	    echo "$$glob_res: $$i" | $(am__rst_section); \
-	    if test ! -r $$i.log; then \
-	      echo "fatal: making $@: $$i.log is unreadable" >&2; \
-	      exit 1; \
-	    fi; \
-	    cat $$i.log; echo; \
-	  done;	\
-	} >$(TEST_SUITE_LOG).tmp;					\
-	mv $(TEST_SUITE_LOG).tmp $(TEST_SUITE_LOG);			\
-	if $$success; then						\
-	  col="$$grn";							\
-	 else								\
-	  col="$$red";							\
-	  test x"$$VERBOSE" = x || cat $(TEST_SUITE_LOG);		\
-	fi;								\
-	echo "$${col}$$br$${std}"; 					\
-	echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";	\
-	echo "$${col}$$br$${std}"; 					\
-	create_testsuite_report --maybe-color;				\
-	echo "$$col$$br$$std";						\
-	if $$success; then :; else					\
-	  echo "$${col}See $(subdir)/$(TEST_SUITE_LOG)$${std}";		\
-	  if test -n "$(PACKAGE_BUGREPORT)"; then			\
-	    echo "$${col}Please report to $(PACKAGE_BUGREPORT)$${std}";	\
-	  fi;								\
-	  echo "$$col$$br$$std";					\
-	fi;								\
-	$$success || exit 1
-
-check-TESTS:
-	@if test $@ != recheck; then \
-	   list='$(RECHECK_LOGS)'; \
-	   test -z "$$list" || rm -f $$list; \
-	 fi
-	@test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
-	@ws='[ 	]'; \
-	log_list='' trs_list=''; $(am__set_TESTS_bases); \
-	for i in $$bases; do \
-	  if test -z "$$log_list"; then \
-	    log_list="$$i.log"; \
-	  else \
-	    log_list="$$log_list $$i.log"; \
-	  fi; \
-	  if test -z "$$trs_list"; then \
-	    trs_list="$$i.trs"; \
-	  else \
-	    trs_list="$$trs_list $$i.trs"; \
-	  fi; \
-	done; \
-	$(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS="$$log_list"
-
-.sh.log:
-	@p='$<'; \
-	$(am__set_b); \
-	$(am__check_pre) $(SH_LOG_DRIVER) --test-name "$$f" \
-	--log-file $$b.log --trs-file $$b.trs \
-	$(am__common_driver_flags) -- $(SH_LOG_COMPILE) "$$tst"
diff --git a/meta/recipes-extended/parted/files/dm_check.patch b/meta/recipes-extended/parted/files/dm_check.patch
deleted file mode 100644
index 5f3c4ddae8b..00000000000
--- a/meta/recipes-extended/parted/files/dm_check.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-parted: change check for device-manager
-
-Other ptests use this method.
-
-Upstream-Status: Submitted [bug-parted@gnu.org]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
---- a/tests/t6001-psep.sh
-+++ b/tests/t6001-psep.sh
-@@ -19,7 +19,9 @@
- . "${srcdir=.}/init.sh"; path_prepend_ ../parted
- 
- require_root_
--(dmsetup --help) > /dev/null 2>&1 || skip_test_ "No dmsetup installed"
-+
-+test "x$ENABLE_DEVICE_MAPPER" = xyes \
-+  || skip_ "no device-mapper support"
- 
- # Device maps names - should be random to not conflict with existing ones on
- # the system
diff --git a/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
deleted file mode 100644
index 8c4d2ae66d1..00000000000
--- a/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From da3f129710929abe9a403901fa7d168355b0e95a Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sun, 3 May 2015 10:33:15 +0200
-Subject: [PATCH] libparted/arch/linux.c: Compile without ENABLE_DEVICE_MAPPER
-
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
----
- libparted/arch/linux.c | 21 +++++++++++++++++----
- 1 file changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index a15854f..7f12f58 100644
---- a/libparted/arch/linux.c
-+++ b/libparted/arch/linux.c
-@@ -2305,6 +2305,7 @@ zasprintf (const char *format, ...)
-   return r < 0 ? NULL : resultp;
- }
- 
-+#ifdef ENABLE_DEVICE_MAPPER
- static char *
- dm_canonical_path (PedDevice const *dev)
- {
-@@ -2327,14 +2328,21 @@ dm_canonical_path (PedDevice const *dev)
- err:
-         return NULL;
- }
-+#endif
- 
- static char*
- _device_get_part_path (PedDevice const *dev, int num)
- {
--        char *devpath = (dev->type == PED_DEVICE_DM
--                         ? dm_canonical_path (dev) : dev->path);
--        size_t path_len = strlen (devpath);
-+        char *devpath;
-+        size_t path_len;
-         char *result;
-+#ifdef ENABLE_DEVICE_MAPPER
-+        devpath = (dev->type == PED_DEVICE_DM
-+                         ? dm_canonical_path (dev) : dev->path);
-+#else
-+        devpath = dev->path;
-+#endif
-+        path_len = strlen (devpath);
-         /* Check for devfs-style /disc => /partN transformation
-            unconditionally; the system might be using udev with devfs rules,
-            and if not the test is harmless. */
-@@ -2350,8 +2358,10 @@ _device_get_part_path (PedDevice const *dev, int num)
-                                  ? "p" : "");
-                 result = zasprintf ("%s%s%d", devpath, p, num);
-         }
-+#ifdef ENABLE_DEVICE_MAPPER
-         if (dev->type == PED_DEVICE_DM)
-                 free (devpath);
-+#endif
-         return result;
- }
- 
-@@ -2946,12 +2956,15 @@ _disk_sync_part_table (PedDisk* disk)
-                                                unsigned long long *length);
- 
- 
-+#ifdef ENABLE_DEVICE_MAPPER
-         if (disk->dev->type == PED_DEVICE_DM) {
-                 add_partition = _dm_add_partition;
-                 remove_partition = _dm_remove_partition;
-                 resize_partition = _dm_resize_partition;
-                 get_partition_start_and_length = _dm_get_partition_start_and_length;
--        } else {
-+        } else
-+#endif
-+        {
-                 add_partition = _blkpg_add_partition;
-                 remove_partition = _blkpg_remove_partition;
- #ifdef BLKPG_RESIZE_PARTITION
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
index 695c5e8a7bb..b57c29400ab 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-make -C tests check-TESTS
+make -C tests test-suite.log
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.3.bb
similarity index 61%
rename from meta/recipes-extended/parted/parted_3.2.bb
rename to meta/recipes-extended/parted/parted_3.3.bb
index 21a815345a9..1cfd9ec2648 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -4,25 +4,19 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
 DEPENDS = "ncurses readline util-linux virtual/libiconv"
-PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
            file://fix-doc-mandir.patch \
-           file://fix-compile-failure-while-dis.patch \
-           file://0001-Include-fcntl.h-in-platform_defs.h.patch \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
            file://0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch \
-	   file://0001-linux-Include-sys-sysmacros.h-for-major-macro.patch \
            file://run-ptest \
-           file://Makefile \
-           file://0001-libparted-Use-read-only-when-probing-devices-on-linu.patch \
-           file://dm_check.patch \
-"
+           file://0001-libparted-fs-add-sourcedir-lib-to-include-paths.patch \
+           file://0002-tests-use-skip_-rather-than-skip_test_-which-is-unde.patch \
+           "
 
-SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
-SRC_URI[sha256sum] = "858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
+SRC_URI[md5sum] = "090655d05f3c471aa8e15a27536889ec"
+SRC_URI[sha256sum] = "57e2b4bd87018625c515421d4524f6e3b55175b472302056391c5f7eccb83d44"
 
 EXTRA_OECONF = "--disable-device-mapper"
 
@@ -31,7 +25,7 @@ inherit autotools pkgconfig gettext texinfo ptest
 BBCLASSEXTEND = "native"
 
 do_compile_ptest() {
-	oe_runmake -C tests print-align print-max dup-clobber duplicate fs-resize
+	oe_runmake -C tests print-align print-max dup-clobber duplicate fs-resize print-flags
 }
 
 do_install_ptest() {
@@ -39,15 +33,24 @@ do_install_ptest() {
 	mkdir $t/build-aux
 	cp ${S}/build-aux/test-driver $t/build-aux/
 	cp -r ${S}/tests $t
-	cp ${WORKDIR}/Makefile $t/tests/
+	cp ${B}/tests/Makefile $t/tests/
 	sed -i "s|^VERSION.*|VERSION = ${PV}|g" $t/tests/Makefile
-	for i in print-align print-max dup-clobber duplicate fs-resize; \
+	sed -i "s|^srcdir =.*|srcdir = \.|g" $t/tests/Makefile
+	sed -i "s|^abs_srcdir =.*|abs_srcdir = \.|g" $t/tests/Makefile
+	sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = \.\.|g" $t/tests/Makefile
+	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
+	for i in print-align print-max print-flags dup-clobber duplicate fs-resize; \
 	  do cp ${B}/tests/.libs/$i $t/tests/; \
 	done
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make gawk e2fsprogs-mke2fs"
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+        glibc-utils \
+        locale-base-en-us \
+        "
 
 inherit update-alternatives
 
-- 
2.17.1


