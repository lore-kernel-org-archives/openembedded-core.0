Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 317E07E517
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 17:53:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so2904986wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rkv56KslObqEucbTLCaoCIvEReNaZ5XGUvRRslW9Ilo=;
	b=1P1YSn5vdlbcKeK95pwXzXKX9w8WLh5jmc6LHVng3zVl8OJidRPJPq0cy3q6GUpOT6
	HV1XXrpMJHQliU/dGYvUd7uo0FQXEH+h4XOSpnuTfHPT3H6fU/xVR4p7mG6POhP0yFGH
	17xGhCZwpfXjt2qlQG7AVXtHvw6kgRYqQI1xk9OhPbGK8ILB33qFlTvsrDjeRr1SJ5/E
	CmeXHmfhhW5kWuVm5JRG8xZ3g3Ot+FdTJoNVvg44+jAZsEnGTh4NJtj7M5mxZfFAOtF8
	BM5FoT6ORD8gRJp10YsEQ9li6nvZkExfH541RxOONs+8yQEnsXhUOMGxf3hO4kB9wEeW
	y/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rkv56KslObqEucbTLCaoCIvEReNaZ5XGUvRRslW9Ilo=;
	b=FeEoQsfMHnc449U5OAVPsdy83A13O9Obz51iAxMmPLVB/KKsA62my+7/Dbdj7TF6uv
	yWiD5FYzVBlc9w6FeO4ufQGrRrdUeVxRAFznQToFuDWm5g/GXAkUxNMhMvWBa4q6cdkY
	3tObYOH8gXs+hMdslyfqxsMcLFiO4OUJQ4zO1XzncIxo+0LYGieHVyaUcWuMkplXSyMI
	cEtCpmG1ywuU1QE5usaMWmkKiS3YtFAhbdc70s/NzSs8AKAzl4DqK/zukSerzsfG8V2F
	MrRlxdTEdNEpnzQOT+9jnkXlmPqticmJWLRMRqzePYlf3zFPMFXC7o53FTqoTu18O/dg
	FFbA==
X-Gm-Message-State: APjAAAXXCA0QvLLpUY13vZcrmNy5Mb1J7g9Istk1+APMUGEaeNCwE+9A
	T4jPPLX6aFl91GVAzf4/h502D6Nxre8=
X-Google-Smtp-Source: APXvYqz9TGZllIzgn3AkVS4bId4QPL62gqohRrioYuFOzBL/DnxK16PH3KiYt2vyEh/tHdjRkP5Bcg==
X-Received: by 2002:a1c:a483:: with SMTP id n125mr4431709wme.172.1559930035282;
	Fri, 07 Jun 2019 10:53:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o13sm3495085wra.92.2019.06.07.10.53.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 10:53:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 18:53:47 +0100
Message-Id: <20190607175348.9666-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190607175348.9666-1-ross.burton@intel.com>
References: <20190607175348.9666-1-ross.burton@intel.com>
Subject: [PATCH 2/3] parted: swap patches for the commits that landed upstream
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
X-List-Received-Date: Fri, 07 Jun 2019 17:53:55 -0000

Several of the parted fixes are actually upstream in slightly different form.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-Include-fcntl.h-in-platform_defs.h.patch  | 34 +++++-----
 ...se-read-only-when-probing-devices-on-linu.patch | 44 ++++++-------
 ...x-Include-sys-sysmacros.h-for-major-macro.patch | 28 ++++++++
 .../files/fix-compile-failure-while-dis.patch      | 76 ++++++++++++++--------
 .../parted/parted/parted-3.2-sysmacros.patch       | 32 ---------
 meta/recipes-extended/parted/parted_3.2.bb         |  2 +-
 6 files changed, 119 insertions(+), 97 deletions(-)
 create mode 100644 meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch
 delete mode 100644 meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch

diff --git a/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch b/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
index b0376cefcf6..4070127d343 100644
--- a/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
+++ b/meta/recipes-extended/parted/files/0001-Include-fcntl.h-in-platform_defs.h.patch
@@ -1,29 +1,33 @@
-From d78dd087c4ec4715aab5fe115668e726046ecd76 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 18:16:05 -0700
-Subject: [PATCH] Include fcntl.h in /platform_defs.h
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-exposed when compiling using musl
+From a3877115f1956949096d77aca5a703a47ed68397 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 3 May 2015 10:33:31 +0200
+Subject: [PATCH] libparted/fs/xfs/platform_defs.h: Include <fcntl.h> for
+ loff_t
 
-Upstream-Status: Pending
+This is needed for compilation with musl libc
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Suggested-by: Travis Tilley <ttilley@gmail.com>
+
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
 ---
  libparted/fs/xfs/platform_defs.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/libparted/fs/xfs/platform_defs.h b/libparted/fs/xfs/platform_defs.h
-index 2b55752..32bd3d3 100644
+index 2b55752..a6ec8fb 100644
 --- a/libparted/fs/xfs/platform_defs.h
 +++ b/libparted/fs/xfs/platform_defs.h
-@@ -42,6 +42,7 @@
+@@ -38,6 +38,7 @@
+ #include <stdarg.h>
+ #include <assert.h>
+ #include <endian.h>
++#include <fcntl.h>
+ #include <stddef.h>
  #include <stdlib.h>
  #include <string.h>
- #include <unistd.h>
-+#include <fcntl.h>
- #include <sys/param.h>
- #include <sys/types.h>
- 
 -- 
-2.1.4
+2.11.0
 
diff --git a/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch b/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch
index e522e1c6ef1..39107620d54 100644
--- a/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch
+++ b/meta/recipes-extended/parted/files/0001-libparted-Use-read-only-when-probing-devices-on-linu.patch
@@ -1,7 +1,8 @@
-From d6e15a60e84c1511523aa81272b7db7a6ec441d0 Mon Sep 17 00:00:00 2001
-From: Ovidiu Panait <ovidiu.panait@windriver.com>
+From 843225aa9d5077bebdb08bbf9699c02aec0b83eb Mon Sep 17 00:00:00 2001
+From: "Brian C. Lane" <bcl@redhat.com>
 Date: Tue, 26 Sep 2017 08:04:58 +0000
 Subject: [PATCH] libparted: Use read only when probing devices on linux
+
  (#1245144)
 
 When a device is opened for RW closing it can trigger other actions,
@@ -25,17 +26,17 @@ Resolves: rhbz#1245144
 
 Upstream-Status: Backport
 
-Author: Brian C. Lane <bcl@redhat.com>
 Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+
 ---
  libparted/arch/linux.c | 62 +++++++++++++++++++++++++++++++++++---------------
  1 file changed, 44 insertions(+), 18 deletions(-)
 
 diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index f612617..0a06a54 100644
+index 7f12f58..4ddea58 100644
 --- a/libparted/arch/linux.c
 +++ b/libparted/arch/linux.c
-@@ -294,7 +294,9 @@ struct blkdev_ioctl_param {
+@@ -292,7 +292,9 @@ struct blkdev_ioctl_param {
  static char* _device_get_part_path (PedDevice const *dev, int num);
  static int _partition_is_mounted_by_path (const char* path);
  static unsigned int _device_get_partition_range(PedDevice const* dev);
@@ -46,7 +47,7 @@ index f612617..0a06a54 100644
  
  static int
  _read_fd (int fd, char **buf)
-@@ -913,7 +915,7 @@ init_ide (PedDevice* dev)
+@@ -911,7 +913,7 @@ init_ide (PedDevice* dev)
          if (!_device_stat (dev, &dev_stat))
                  goto error;
  
@@ -55,7 +56,7 @@ index f612617..0a06a54 100644
                  goto error;
  
          if (ioctl (arch_specific->fd, HDIO_GET_IDENTITY, &hdi)) {
-@@ -982,11 +984,11 @@ init_ide (PedDevice* dev)
+@@ -980,11 +982,11 @@ init_ide (PedDevice* dev)
          if (!_device_probe_geometry (dev))
                  goto error_close_dev;
  
@@ -69,7 +70,7 @@ index f612617..0a06a54 100644
  error:
          return 0;
  }
-@@ -1119,7 +1121,7 @@ init_scsi (PedDevice* dev)
+@@ -1117,7 +1119,7 @@ init_scsi (PedDevice* dev)
          char* vendor;
          char* product;
  
@@ -78,7 +79,7 @@ index f612617..0a06a54 100644
                  goto error;
  
          if (ioctl (arch_specific->fd, SCSI_IOCTL_GET_IDLUN, &idlun) < 0) {
-@@ -1133,7 +1135,7 @@ init_scsi (PedDevice* dev)
+@@ -1131,7 +1133,7 @@ init_scsi (PedDevice* dev)
                          goto error_close_dev;
                  if (!_device_probe_geometry (dev))
                          goto error_close_dev;
@@ -87,7 +88,7 @@ index f612617..0a06a54 100644
                  return 1;
          }
  
-@@ -1155,11 +1157,11 @@ init_scsi (PedDevice* dev)
+@@ -1153,11 +1155,11 @@ init_scsi (PedDevice* dev)
          if (!_device_probe_geometry (dev))
                  goto error_close_dev;
  
@@ -101,7 +102,7 @@ index f612617..0a06a54 100644
  error:
          return 0;
  }
-@@ -1171,7 +1173,7 @@ init_file (PedDevice* dev)
+@@ -1169,7 +1171,7 @@ init_file (PedDevice* dev)
  
          if (!_device_stat (dev, &dev_stat))
                  goto error;
@@ -110,7 +111,7 @@ index f612617..0a06a54 100644
                  goto error;
  
          dev->sector_size = PED_SECTOR_SIZE_DEFAULT;
-@@ -1198,7 +1200,7 @@ init_file (PedDevice* dev)
+@@ -1196,7 +1198,7 @@ init_file (PedDevice* dev)
                  goto error_close_dev;
          }
  
@@ -119,7 +120,7 @@ index f612617..0a06a54 100644
  
          dev->bios_geom.cylinders = dev->length / 4 / 32;
          dev->bios_geom.heads = 4;
-@@ -1209,7 +1211,7 @@ init_file (PedDevice* dev)
+@@ -1207,7 +1209,7 @@ init_file (PedDevice* dev)
          return 1;
  
  error_close_dev:
@@ -128,7 +129,7 @@ index f612617..0a06a54 100644
  error:
          return 0;
  }
-@@ -1225,7 +1227,7 @@ init_dasd (PedDevice* dev, const char* model_name)
+@@ -1223,7 +1225,7 @@ init_dasd (PedDevice* dev, const char* model_name)
          if (!_device_stat (dev, &dev_stat))
                  goto error;
  
@@ -137,7 +138,7 @@ index f612617..0a06a54 100644
                  goto error;
  
          LinuxSpecific* arch_specific = LINUX_SPECIFIC (dev);
-@@ -1265,11 +1267,11 @@ init_dasd (PedDevice* dev, const char* model_name)
+@@ -1263,11 +1265,11 @@ init_dasd (PedDevice* dev, const char* model_name)
  
          dev->model = strdup (model_name);
  
@@ -151,7 +152,7 @@ index f612617..0a06a54 100644
  error:
          return 0;
  }
-@@ -1284,7 +1286,7 @@ init_generic (PedDevice* dev, const char* model_name)
+@@ -1282,7 +1284,7 @@ init_generic (PedDevice* dev, const char* model_name)
          if (!_device_stat (dev, &dev_stat))
                  goto error;
  
@@ -160,7 +161,7 @@ index f612617..0a06a54 100644
                  goto error;
  
          ped_exception_fetch_all ();
-@@ -1332,11 +1334,11 @@ init_generic (PedDevice* dev, const char* model_name)
+@@ -1330,11 +1332,11 @@ init_generic (PedDevice* dev, const char* model_name)
  
          dev->model = strdup (model_name);
  
@@ -174,7 +175,7 @@ index f612617..0a06a54 100644
  error:
          return 0;
  }
-@@ -1623,12 +1625,27 @@ retry:
+@@ -1621,12 +1623,27 @@ retry:
  }
  
  static int
@@ -203,7 +204,7 @@ index f612617..0a06a54 100644
  
          if (arch_specific->fd == -1) {
                  char*   rw_error_msg = strerror (errno);
-@@ -1697,6 +1714,15 @@ linux_refresh_close (PedDevice* dev)
+@@ -1695,6 +1712,15 @@ linux_refresh_close (PedDevice* dev)
          return 1;
  }
  
@@ -218,7 +219,4 @@ index f612617..0a06a54 100644
 +
  #if SIZEOF_OFF_T < 8
  
- #if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,20)
--- 
-2.11.0
-
+ static _syscall5(int,_llseek,
diff --git a/meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch b/meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch
new file mode 100644
index 00000000000..01262e5452a
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-linux-Include-sys-sysmacros.h-for-major-macro.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 0b72b8eb41438b62eeb9e3548b0b8f3094a78681 Mon Sep 17 00:00:00 2001
+From: "Richard W.M. Jones" <rjones@redhat.com>
+Date: Sat, 24 Mar 2018 17:37:02 +0000
+Subject: [PATCH] linux: Include <sys/sysmacros.h> for major() macro.
+
+Since glibc 2.27 this header is required.
+---
+ libparted/arch/linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 0f18904..a15854f 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -41,6 +41,7 @@
+ #include <sys/utsname.h>        /* for uname() */
+ #include <scsi/scsi.h>
+ #include <assert.h>
++#include <sys/sysmacros.h>
+ #ifdef ENABLE_DEVICE_MAPPER
+ #include <libdevmapper.h>
+ #endif
+-- 
+2.11.0
+
diff --git a/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
index 68ab715f326..8c4d2ae66d1 100644
--- a/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
+++ b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
@@ -1,44 +1,68 @@
-From 060e74354774d36d2c11ef08e3e7ea9b9b6e23fb Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 13 Nov 2014 11:29:33 +0800
-Subject: [PATCH] libparted/arch/linux.c: fix compile failure while
- --disable-device-mapper
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-While --disable-device-mapper, the MACRO ENABLE_DEVICE_MAPPER is
-undef, but it missed to scope some device mapper functions.
+From da3f129710929abe9a403901fa7d168355b0e95a Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Sun, 3 May 2015 10:33:15 +0200
+Subject: [PATCH] libparted/arch/linux.c: Compile without ENABLE_DEVICE_MAPPER
 
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
 ---
- libparted/arch/linux.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
+ libparted/arch/linux.c | 21 +++++++++++++++++----
+ 1 file changed, 17 insertions(+), 4 deletions(-)
 
 diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 6fd73c5..2afa479 100644
+index a15854f..7f12f58 100644
 --- a/libparted/arch/linux.c
 +++ b/libparted/arch/linux.c
-@@ -2320,6 +2320,7 @@ zasprintf (const char *format, ...)
+@@ -2305,6 +2305,7 @@ zasprintf (const char *format, ...)
+   return r < 0 ? NULL : resultp;
+ }
+ 
++#ifdef ENABLE_DEVICE_MAPPER
  static char *
  dm_canonical_path (PedDevice const *dev)
  {
-+#ifdef ENABLE_DEVICE_MAPPER
-         LinuxSpecific const *arch_specific = LINUX_SPECIFIC (dev);
- 
-         /* Get map name from devicemapper */
-@@ -2337,6 +2338,7 @@ dm_canonical_path (PedDevice const *dev)
-         dm_task_destroy (task);
-         return dev_name;
+@@ -2327,14 +2328,21 @@ dm_canonical_path (PedDevice const *dev)
  err:
-+#endif
          return NULL;
  }
++#endif
+ 
+ static char*
+ _device_get_part_path (PedDevice const *dev, int num)
+ {
+-        char *devpath = (dev->type == PED_DEVICE_DM
+-                         ? dm_canonical_path (dev) : dev->path);
+-        size_t path_len = strlen (devpath);
++        char *devpath;
++        size_t path_len;
+         char *result;
++#ifdef ENABLE_DEVICE_MAPPER
++        devpath = (dev->type == PED_DEVICE_DM
++                         ? dm_canonical_path (dev) : dev->path);
++#else
++        devpath = dev->path;
++#endif
++        path_len = strlen (devpath);
+         /* Check for devfs-style /disc => /partN transformation
+            unconditionally; the system might be using udev with devfs rules,
+            and if not the test is harmless. */
+@@ -2350,8 +2358,10 @@ _device_get_part_path (PedDevice const *dev, int num)
+                                  ? "p" : "");
+                 result = zasprintf ("%s%s%d", devpath, p, num);
+         }
++#ifdef ENABLE_DEVICE_MAPPER
+         if (dev->type == PED_DEVICE_DM)
+                 free (devpath);
++#endif
+         return result;
+ }
  
-@@ -2957,13 +2959,15 @@ _disk_sync_part_table (PedDisk* disk)
-                                                unsigned long long *start,
+@@ -2946,12 +2956,15 @@ _disk_sync_part_table (PedDisk* disk)
                                                 unsigned long long *length);
  
--
+ 
 +#ifdef ENABLE_DEVICE_MAPPER
          if (disk->dev->type == PED_DEVICE_DM) {
                  add_partition = _dm_add_partition;
@@ -53,5 +77,5 @@ index 6fd73c5..2afa479 100644
                  remove_partition = _blkpg_remove_partition;
  #ifdef BLKPG_RESIZE_PARTITION
 -- 
-1.9.1
+2.11.0
 
diff --git a/meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch b/meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch
deleted file mode 100644
index 211e6c73400..00000000000
--- a/meta/recipes-extended/parted/parted/parted-3.2-sysmacros.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-https://bugs.gentoo.org/580022
-
-From dec8995fe80508374beba6356f6ecbba8ef6b18b Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Tue, 21 Jun 2016 15:01:08 -0400
-Subject: [PATCH] include sysmacros.h for major/minor/makedev
-
-Linux C libs are moving away from including this header implicitly via
-sys/types.h, so include it explicitly.
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- libparted/arch/linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
-index 326b95619d31..e5c168be3c68 100644
---- a/libparted/arch/linux.c
-+++ b/libparted/arch/linux.c
-@@ -37,6 +37,7 @@
- #include <dirent.h>
- #include <sys/ioctl.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/utsname.h>        /* for uname() */
- #include <scsi/scsi.h>
--- 
-2.8.2
-
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index ceac52892db..63f9f204e73 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-libparted_fs_resize-link-against-libuuid-explicitly-.patch \
            file://0001-Move-python-helper-scripts-used-only-in-tests-to-Pyt.patch \
-	   file://parted-3.2-sysmacros.patch \
+	   file://0001-linux-Include-sys-sysmacros.h-for-major-macro.patch \
            file://run-ptest \
            file://Makefile \
            file://0001-libparted-Use-read-only-when-probing-devices-on-linu.patch \
-- 
2.11.0


