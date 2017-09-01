Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBE571DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 10:03:37 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id g16so4269583uah.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 03:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tzofCcyKxJNfaU9yXE5viC6G3R+SMyP6eDU2ZTHPEE8=;
	b=k+tmebB1mzRLwpy6OJE79YbHrN/0dYguhP1/XpZdQTZJYUZqO3qf53xskXHUb/7VAQ
	Tsto2PteBhVozs2H1rmibM/ex5L4sUs+SwGubacitDN2FQy2AQmADhhFla6UJkbcoUco
	Z0V4pi8tE7DkaOPG9Rb/DHNRKpkeK0qlw/C6GFURE17wmpMxNeLknRlx7fPOS935lMu1
	a8qgr+BAUrwSRLXBUgW+cKcU1hDaJk3/tHFJtlTI0J2EbQZyFB+9c6RgjR23qa0k8/3P
	oQ0opUeohwO+eVUjxZniVQCLvFhqlQCzl3x+XODb/rS/mhir2ItcZCXvTCpGd5TV5e4D
	6lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tzofCcyKxJNfaU9yXE5viC6G3R+SMyP6eDU2ZTHPEE8=;
	b=HCqX8sNXMfctpQSBANJetIdzMWVQirlhIFduCy4AbvWOLlUyBjCoR598rkae2IiUCd
	E3dCfVauUCPh1/kmrMJ2Muvoe0OlOVC1AqX3viJlCF+7enj7VLSGeanL2XZHorV4Hbms
	RgxC1yFJh+Yz/NEQ3XlPue76F8j0Wtd9vjkEy82wyXlMZBL1egwQEAcJkSOgx1zZ5Vm2
	IX8juJRPc6Jh9HvUUnwlW0CCWa4+QXRvFLy9BPFe+uaXGzmAISDsXxLbXudbjp3qBcWF
	xxACK1pjNRu4gpwyn4H9dmIKFjZLDD4y38YBPtfy1X2VZC7i4vhQ4XYbCzigF2dFefIp
	J/pg==
X-Gm-Message-State: AHPjjUiXHeeSkLFKHWZvSUrQGDEgFZmRxWu/H+Y9hCgXr9rF9nzO8NRc
	anXWQeeIQQ75v6/tYobp6AVxWnaR6A==
X-Google-Smtp-Source: ADKCNb4fDMxO3c3ImF4LGRNr59+ViTcM9PpJ+bJE9v5+p1Sft5LIBYUTAjAQi7dh7aOxDEWn20UNfe1Hsr4W85iz/JU=
X-Received: by 10.176.78.157 with SMTP id l29mr757040uah.2.1504260219036; Fri,
	01 Sep 2017 03:03:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Fri, 1 Sep 2017 03:03:38 -0700 (PDT)
In-Reply-To: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
References: <1504215229-79715-1-git-send-email-juro.bystricky@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Sep 2017 12:03:38 +0200
Message-ID: <CA+chaQfbZAM+mjNvZ-HYe=XZnNJz+H7Wq9z1vcEsMgDY=CUksg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Fri, 01 Sep 2017 10:03:39 -0000
Content-Type: multipart/alternative; boundary="f403043ed118016a6505581de05e"

--f403043ed118016a6505581de05e
Content-Type: text/plain; charset="UTF-8"

Is there any ticket requesting virgl support enabled in qemu-native? It
might depend on providing virglrenderer-native, libsdl2-native,
epoxy-native and maybe even mesa-native.

It was shortly enabled in Debian and Ubuntu packages, but then disabled
mostly because it requires sdl2 or gtk graphics backend and sdl2 was
missing some features and gtk was pulling so many dependencies to some
headless servers.

For OE this might be smaller issue or we can try to use spice server to
execute qemu-native on headless builders and only run spice client on
developer workstations. Or in my case qemu-native in headless chroot and
spice client in host OS.

What do you think?

Regards,

On Thu, Aug 31, 2017 at 11:33 PM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> Remove recipes for older versions.
> Remove patches no longer needed.
> Modify the patch "add-ptest-in-makefile.patch" for version 2.10.0
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  ...0001-osdep-Add-runtime-OFD-lock-detection.patch | 141 ----
>  ...e-posix-Do-runtime-check-for-ofd-lock-API.patch |  71 --
>  ...support-for-VM-suspend-resume-for-TPM-TIS.patch | 719
> ---------------------
>  .../qemu/qemu/add-ptest-in-makefile-v10.patch      |  28 +
>  .../qemu/qemu/add-ptest-in-makefile.patch          |  28 -
>  meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb      |  59 --
>  meta/recipes-devtools/qemu/qemu_2.10.0.bb          |  58 ++
>  meta/recipes-devtools/qemu/qemu_2.8.1.1.bb         |  60 --
>  8 files changed, 86 insertions(+), 1078 deletions(-)
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-
> runtime-check-for-ofd-lock-API.patch
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-
> v10.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.
> patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
>  create mode 100644 meta/recipes-devtools/qemu/qemu_2.10.0.bb
>  delete mode 100644 meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-OFD-lock-detection.patch
> b/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-
> OFD-lock-detection.patch
> deleted file mode 100644
> index f83f0d2..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-osdep-Add-runtime-
> OFD-lock-detection.patch
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -From ca749954b09b89e22cd69c4949fb7e689b057963 Mon Sep 17 00:00:00 2001
> -From: Fam Zheng <famz@redhat.com>
> -Date: Fri, 11 Aug 2017 19:44:46 +0800
> -Subject: [PATCH 1/2] osdep: Add runtime OFD lock detection
> -
> -Build time check of OFD lock is not sufficient and can cause image open
> -errors when the runtime environment doesn't support it.
> -
> -Add a helper function to probe it at runtime, additionally. Also provide
> -a qemu_has_ofd_lock() for callers to check the status.
> -
> -Signed-off-by: Fam Zheng <famz@redhat.com>
> -Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - include/qemu/osdep.h |  1 +
> - util/osdep.c         | 66 ++++++++++++++++++++++++++++++
> ++++++++++++++--------
> - 2 files changed, 57 insertions(+), 10 deletions(-)
> -
> -diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> -index 3b74f6fcb2..6855b94bbf 100644
> ---- a/include/qemu/osdep.h
> -+++ b/include/qemu/osdep.h
> -@@ -357,6 +357,7 @@ int qemu_dup(int fd);
> - int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
> - int qemu_unlock_fd(int fd, int64_t start, int64_t len);
> - int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool
> exclusive);
> -+bool qemu_has_ofd_lock(void);
> -
> - #if defined(__HAIKU__) && defined(__i386__)
> - #define FMT_pid "%ld"
> -diff --git a/util/osdep.c b/util/osdep.c
> -index a2863c8e53..a479fedc4a 100644
> ---- a/util/osdep.c
> -+++ b/util/osdep.c
> -@@ -38,14 +38,6 @@ extern int madvise(caddr_t, size_t, int);
> - #include "qemu/error-report.h"
> - #include "monitor/monitor.h"
> -
> --#ifdef F_OFD_SETLK
> --#define QEMU_SETLK F_OFD_SETLK
> --#define QEMU_GETLK F_OFD_GETLK
> --#else
> --#define QEMU_SETLK F_SETLK
> --#define QEMU_GETLK F_GETLK
> --#endif
> --
> - static bool fips_enabled = false;
> -
> - static const char *hw_version = QEMU_HW_VERSION;
> -@@ -82,6 +74,10 @@ int qemu_madvise(void *addr, size_t len, int advice)
> - }
> -
> - #ifndef _WIN32
> -+
> -+static int fcntl_op_setlk = -1;
> -+static int fcntl_op_getlk = -1;
> -+
> - /*
> -  * Dups an fd and sets the flags
> -  */
> -@@ -149,6 +145,54 @@ static int qemu_parse_fdset(const char *param)
> -     return qemu_parse_fd(param);
> - }
> -
> -+static void qemu_probe_lock_ops(void)
> -+{
> -+    if (fcntl_op_setlk == -1) {
> -+#ifdef F_OFD_SETLK
> -+        int fd;
> -+        int ret;
> -+        struct flock fl = {
> -+            .l_whence = SEEK_SET,
> -+            .l_start  = 0,
> -+            .l_len    = 0,
> -+            .l_type   = F_WRLCK,
> -+        };
> -+
> -+        fd = open("/dev/null", O_RDWR);
> -+        if (fd < 0) {
> -+            fprintf(stderr,
> -+                    "Failed to open /dev/null for OFD lock probing:
> %s\n",
> -+                    strerror(errno));
> -+            fcntl_op_setlk = F_SETLK;
> -+            fcntl_op_getlk = F_GETLK;
> -+            return;
> -+        }
> -+        ret = fcntl(fd, F_OFD_GETLK, &fl);
> -+        close(fd);
> -+        if (!ret) {
> -+            fcntl_op_setlk = F_OFD_SETLK;
> -+            fcntl_op_getlk = F_OFD_GETLK;
> -+        } else {
> -+            fcntl_op_setlk = F_SETLK;
> -+            fcntl_op_getlk = F_GETLK;
> -+        }
> -+#else
> -+        fcntl_op_setlk = F_SETLK;
> -+        fcntl_op_getlk = F_GETLK;
> -+#endif
> -+    }
> -+}
> -+
> -+bool qemu_has_ofd_lock(void)
> -+{
> -+    qemu_probe_lock_ops();
> -+#ifdef F_OFD_SETLK
> -+    return fcntl_op_setlk == F_OFD_SETLK;
> -+#else
> -+    return false;
> -+#endif
> -+}
> -+
> - static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int
> fl_type)
> - {
> -     int ret;
> -@@ -158,7 +202,8 @@ static int qemu_lock_fcntl(int fd, int64_t start,
> int64_t len, int fl_type)
> -         .l_len    = len,
> -         .l_type   = fl_type,
> -     };
> --    ret = fcntl(fd, QEMU_SETLK, &fl);
> -+    qemu_probe_lock_ops();
> -+    ret = fcntl(fd, fcntl_op_setlk, &fl);
> -     return ret == -1 ? -errno : 0;
> - }
> -
> -@@ -181,7 +226,8 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t
> len, bool exclusive)
> -         .l_len    = len,
> -         .l_type   = exclusive ? F_WRLCK : F_RDLCK,
> -     };
> --    ret = fcntl(fd, QEMU_GETLK, &fl);
> -+    qemu_probe_lock_ops();
> -+    ret = fcntl(fd, fcntl_op_getlk, &fl);
> -     if (ret == -1) {
> -         return -errno;
> -     } else {
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-
> runtime-check-for-ofd-lock-API.patch b/meta/recipes-devtools/qemu/
> qemu/0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
> deleted file mode 100644
> index 0dacde4..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0002-file-posix-Do-
> runtime-check-for-ofd-lock-API.patch
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -From 2b218f5dbcca5fe728b1852d161d7a21fd02b2f5 Mon Sep 17 00:00:00 2001
> -From: Fam Zheng <famz@redhat.com>
> -Date: Fri, 11 Aug 2017 19:44:47 +0800
> -Subject: [PATCH 2/2] file-posix: Do runtime check for ofd lock API
> -
> -It is reported that on Windows Subsystem for Linux, ofd operations fail
> -with -EINVAL. In other words, QEMU binary built with system headers that
> -exports F_OFD_SETLK doesn't necessarily run in an environment that
> -actually supports it:
> -
> -$ qemu-system-aarch64 ... -drive file=test.vhdx,if=none,id=hd0 \
> -    -device virtio-blk-pci,drive=hd0
> -qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to
> unlock byte 100
> -qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to
> unlock byte 100
> -qemu-system-aarch64: -drive file=test.vhdx,if=none,id=hd0: Failed to lock
> byte 100
> -
> -As a matter of fact this is not WSL specific. It can happen when running
> -a QEMU compiled against a newer glibc on an older kernel, such as in
> -a containerized environment.
> -
> -Let's do a runtime check to cope with that.
> -
> -Reported-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> -Reviewed-by: Eric Blake <eblake@redhat.com>
> -Signed-off-by: Fam Zheng <famz@redhat.com>
> -Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> -
> -Upstream-Status: Backport
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - block/file-posix.c | 19 ++++++++-----------
> - 1 file changed, 8 insertions(+), 11 deletions(-)
> -
> -diff --git a/block/file-posix.c b/block/file-posix.c
> -index f4de022ae0..cb3bfce147 100644
> ---- a/block/file-posix.c
> -+++ b/block/file-posix.c
> -@@ -457,22 +457,19 @@ static int raw_open_common(BlockDriverState *bs,
> QDict *options,
> -     switch (locking) {
> -     case ON_OFF_AUTO_ON:
> -         s->use_lock = true;
> --#ifndef F_OFD_SETLK
> --        fprintf(stderr,
> --                "File lock requested but OFD locking syscall is
> unavailable, "
> --                "falling back to POSIX file locks.\n"
> --                "Due to the implementation, locks can be lost
> unexpectedly.\n");
> --#endif
> -+        if (!qemu_has_ofd_lock()) {
> -+            fprintf(stderr,
> -+                    "File lock requested but OFD locking syscall is "
> -+                    "unavailable, falling back to POSIX file locks.\n"
> -+                    "Due to the implementation, locks can be lost "
> -+                    "unexpectedly.\n");
> -+        }
> -         break;
> -     case ON_OFF_AUTO_OFF:
> -         s->use_lock = false;
> -         break;
> -     case ON_OFF_AUTO_AUTO:
> --#ifdef F_OFD_SETLK
> --        s->use_lock = true;
> --#else
> --        s->use_lock = false;
> --#endif
> -+        s->use_lock = qemu_has_ofd_lock();
> -         break;
> -     default:
> -         abort();
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-
> suspend-resume-for-TPM-TIS.patch b/meta/recipes-devtools/qemu/
> qemu/0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
> deleted file mode 100644
> index b8a783d..0000000
> --- a/meta/recipes-devtools/qemu/qemu/0004-Add-support-for-VM-
> suspend-resume-for-TPM-TIS.patch
> +++ /dev/null
> @@ -1,719 +0,0 @@
> -From 5e9dd9063f514447ea4f54046793f4f01c297ed4 Mon Sep 17 00:00:00 2001
> -From: Stefan Berger <stefanb@linux.vnet.ibm.com>
> -Date: Sat, 31 Dec 2016 11:23:32 -0500
> -Subject: [PATCH 4/4] Add support for VM suspend/resume for TPM TIS
> -
> -Extend the TPM TIS code to support suspend/resume. In case a command
> -is being processed by the external TPM when suspending, wait for the
> command
> -to complete to catch the result. In case the bottom half did not run,
> -run the one function the bottom half is supposed to run. This then
> -makes the resume operation work.
> -
> -The passthrough backend does not support suspend/resume operation
> -and is therefore blocked from suspend/resume and migration.
> -
> -The CUSE TPM's supported capabilities are tested and if sufficient
> -capabilities are implemented, suspend/resume, snapshotting and
> -migration are supported by the CUSE TPM.
> -
> -Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> -
> -Upstream-Status: Pending [https://lists.nongnu.org/
> archive/html/qemu-devel/2016-06/msg00252.html]
> -Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ----
> - hw/tpm/tpm_passthrough.c     | 130 +++++++++++++++++++++++--
> - hw/tpm/tpm_tis.c             | 137 +++++++++++++++++++++++++-
> - hw/tpm/tpm_tis.h             |   2 +
> - hw/tpm/tpm_util.c            | 223 ++++++++++++++++++++++++++++++
> +++++++++++++
> - hw/tpm/tpm_util.h            |   7 ++
> - include/sysemu/tpm_backend.h |  12 +++
> - 6 files changed, 503 insertions(+), 8 deletions(-)
> -
> -diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
> -index 44739ebad2..bc8072d0bc 100644
> ---- a/hw/tpm/tpm_passthrough.c
> -+++ b/hw/tpm/tpm_passthrough.c
> -@@ -34,6 +34,8 @@
> - #include "tpm_tis.h"
> - #include "tpm_util.h"
> - #include "tpm_ioctl.h"
> -+#include "migration/migration.h"
> -+#include "qapi/error.h"
> -
> - #define DEBUG_TPM 0
> -
> -@@ -49,6 +51,7 @@
> - #define TYPE_TPM_CUSE "tpm-cuse"
> -
> - static const TPMDriverOps tpm_passthrough_driver;
> -+static const VMStateDescription vmstate_tpm_cuse;
> -
> - /* data structures */
> - typedef struct TPMPassthruThreadParams {
> -@@ -79,6 +82,10 @@ struct TPMPassthruState {
> -     QemuMutex state_lock;
> -     QemuCond cmd_complete;  /* singnaled once tpm_busy is false */
> -     bool tpm_busy;
> -+
> -+    Error *migration_blocker;
> -+
> -+    TPMBlobBuffers tpm_blobs;
> - };
> -
> - typedef struct TPMPassthruState TPMPassthruState;
> -@@ -306,6 +313,10 @@ static void tpm_passthrough_shutdown(TPMPassthruState
> *tpm_pt)
> -                          strerror(errno));
> -         }
> -     }
> -+    if (tpm_pt->migration_blocker) {
> -+        migrate_del_blocker(tpm_pt->migration_blocker);
> -+        error_free(tpm_pt->migration_blocker);
> -+    }
> - }
> -
> - /*
> -@@ -360,12 +371,14 @@ static int tpm_passthrough_cuse_check_caps(TPMPassthruState
> *tpm_pt)
> - /*
> -  * Initialize the external CUSE TPM
> -  */
> --static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt)
> -+static int tpm_passthrough_cuse_init(TPMPassthruState *tpm_pt,
> -+                                     bool is_resume)
> - {
> -     int rc = 0;
> --    ptm_init init = {
> --        .u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE,
> --    };
> -+    ptm_init init;
> -+    if (is_resume) {
> -+        init.u.req.init_flags = PTM_INIT_FLAG_DELETE_VOLATILE;
> -+    }
> -
> -     if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
> -         if (ioctl(tpm_pt->tpm_fd, PTM_INIT, &init) < 0) {
> -@@ -394,7 +407,7 @@ static int tpm_passthrough_startup_tpm(TPMBackend
> *tb)
> -                               tpm_passthrough_worker_thread,
> -                               &tpm_pt->tpm_thread_params);
> -
> --    tpm_passthrough_cuse_init(tpm_pt);
> -+    tpm_passthrough_cuse_init(tpm_pt, false);
> -
> -     return 0;
> - }
> -@@ -466,6 +479,32 @@ static int tpm_passthrough_reset_tpm_established_flag(TPMBackend
> *tb,
> -     return rc;
> - }
> -
> -+static int tpm_cuse_get_state_blobs(TPMBackend *tb,
> -+                                    bool decrypted_blobs,
> -+                                    TPMBlobBuffers *tpm_blobs)
> -+{
> -+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
> -+
> -+    assert(TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt));
> -+
> -+    return tpm_util_cuse_get_state_blobs(tpm_pt->tpm_fd,
> decrypted_blobs,
> -+                                         tpm_blobs);
> -+}
> -+
> -+static int tpm_cuse_set_state_blobs(TPMBackend *tb,
> -+                                    TPMBlobBuffers *tpm_blobs)
> -+{
> -+    TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
> -+
> -+    assert(TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt));
> -+
> -+    if (tpm_util_cuse_set_state_blobs(tpm_pt->tpm_fd, tpm_blobs)) {
> -+        return 1;
> -+    }
> -+
> -+    return tpm_passthrough_cuse_init(tpm_pt, true);
> -+}
> -+
> - static bool tpm_passthrough_get_startup_error(TPMBackend *tb)
> - {
> -     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
> -@@ -488,7 +527,7 @@ static void tpm_passthrough_deliver_request(TPMBackend
> *tb)
> - {
> -     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
> -
> --    /* TPM considered busy once TPM Request scheduled for processing */
> -+    /* TPM considered busy once TPM request scheduled for processing */
> -     qemu_mutex_lock(&tpm_pt->state_lock);
> -     tpm_pt->tpm_busy = true;
> -     qemu_mutex_unlock(&tpm_pt->state_lock);
> -@@ -601,6 +640,25 @@ static int tpm_passthrough_open_sysfs_cancel(TPMBackend
> *tb)
> -     return fd;
> - }
> -
> -+static void tpm_passthrough_block_migration(TPMPassthruState *tpm_pt)
> -+{
> -+    ptm_cap caps;
> -+
> -+    if (TPM_PASSTHROUGH_USES_CUSE_TPM(tpm_pt)) {
> -+        caps = PTM_CAP_GET_STATEBLOB | PTM_CAP_SET_STATEBLOB |
> -+               PTM_CAP_STOP;
> -+        if (!TPM_CUSE_IMPLEMENTS_ALL(tpm_pt, caps)) {
> -+            error_setg(&tpm_pt->migration_blocker,
> -+                       "Migration disabled: CUSE TPM lacks necessary
> capabilities");
> -+            migrate_add_blocker(tpm_pt->migration_blocker);
> -+        }
> -+    } else {
> -+        error_setg(&tpm_pt->migration_blocker,
> -+                   "Migration disabled: Passthrough TPM does not support
> migration");
> -+        migrate_add_blocker(tpm_pt->migration_blocker);
> -+    }
> -+}
> -+
> - static int tpm_passthrough_handle_device_opts(QemuOpts *opts,
> TPMBackend *tb)
> - {
> -     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(tb);
> -@@ -642,7 +700,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts
> *opts, TPMBackend *tb)
> -             goto err_close_tpmdev;
> -         }
> -         /* init TPM for probing */
> --        if (tpm_passthrough_cuse_init(tpm_pt)) {
> -+        if (tpm_passthrough_cuse_init(tpm_pt, false)) {
> -             goto err_close_tpmdev;
> -         }
> -     }
> -@@ -659,6 +717,7 @@ static int tpm_passthrough_handle_device_opts(QemuOpts
> *opts, TPMBackend *tb)
> -         }
> -     }
> -
> -+    tpm_passthrough_block_migration(tpm_pt);
> -
> -     return 0;
> -
> -@@ -766,10 +825,13 @@ static void tpm_passthrough_inst_init(Object *obj)
> -
> -     qemu_mutex_init(&tpm_pt->state_lock);
> -     qemu_cond_init(&tpm_pt->cmd_complete);
> -+
> -+    vmstate_register(NULL, -1, &vmstate_tpm_cuse, obj);
> - }
> -
> - static void tpm_passthrough_inst_finalize(Object *obj)
> - {
> -+    vmstate_unregister(NULL, &vmstate_tpm_cuse, obj);
> - }
> -
> - static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
> -@@ -802,6 +864,60 @@ static const char *tpm_passthrough_cuse_create_
> desc(void)
> -     return "CUSE TPM backend driver";
> - }
> -
> -+static void tpm_cuse_pre_save(void *opaque)
> -+{
> -+    TPMPassthruState *tpm_pt = opaque;
> -+    TPMBackend *tb = &tpm_pt->parent;
> -+
> -+     qemu_mutex_lock(&tpm_pt->state_lock);
> -+     /* wait for TPM to finish processing */
> -+     if (tpm_pt->tpm_busy) {
> -+        qemu_cond_wait(&tpm_pt->cmd_complete, &tpm_pt->state_lock);
> -+     }
> -+     qemu_mutex_unlock(&tpm_pt->state_lock);
> -+
> -+    /* get the decrypted state blobs from the TPM */
> -+    tpm_cuse_get_state_blobs(tb, TRUE, &tpm_pt->tpm_blobs);
> -+}
> -+
> -+static int tpm_cuse_post_load(void *opaque,
> -+                              int version_id __attribute__((unused)))
> -+{
> -+    TPMPassthruState *tpm_pt = opaque;
> -+    TPMBackend *tb = &tpm_pt->parent;
> -+
> -+    return tpm_cuse_set_state_blobs(tb, &tpm_pt->tpm_blobs);
> -+}
> -+
> -+static const VMStateDescription vmstate_tpm_cuse = {
> -+    .name = "cuse-tpm",
> -+    .version_id = 1,
> -+    .minimum_version_id = 0,
> -+    .minimum_version_id_old = 0,
> -+    .pre_save  = tpm_cuse_pre_save,
> -+    .post_load = tpm_cuse_post_load,
> -+    .fields = (VMStateField[]) {
> -+        VMSTATE_UINT32(tpm_blobs.permanent_flags, TPMPassthruState),
> -+        VMSTATE_UINT32(tpm_blobs.permanent.size, TPMPassthruState),
> -+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.permanent.buffer,
> -+                                     TPMPassthruState, 1, NULL, 0,
> -+                                     tpm_blobs.permanent.size),
> -+
> -+        VMSTATE_UINT32(tpm_blobs.volatil_flags, TPMPassthruState),
> -+        VMSTATE_UINT32(tpm_blobs.volatil.size, TPMPassthruState),
> -+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.volatil.buffer,
> -+                                     TPMPassthruState, 1, NULL, 0,
> -+                                     tpm_blobs.volatil.size),
> -+
> -+        VMSTATE_UINT32(tpm_blobs.savestate_flags, TPMPassthruState),
> -+        VMSTATE_UINT32(tpm_blobs.savestate.size, TPMPassthruState),
> -+        VMSTATE_VBUFFER_ALLOC_UINT32(tpm_blobs.savestate.buffer,
> -+                                     TPMPassthruState, 1, NULL, 0,
> -+                                     tpm_blobs.savestate.size),
> -+        VMSTATE_END_OF_LIST()
> -+    }
> -+};
> -+
> - static const TPMDriverOps tpm_cuse_driver = {
> -     .type                     = TPM_TYPE_CUSE_TPM,
> -     .opts                     = tpm_passthrough_cmdline_opts,
> -diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
> -index 14d9e83ea2..9b660cf737 100644
> ---- a/hw/tpm/tpm_tis.c
> -+++ b/hw/tpm/tpm_tis.c
> -@@ -368,6 +368,8 @@ static void tpm_tis_receive_bh(void *opaque)
> -     TPMTISEmuState *tis = &s->s.tis;
> -     uint8_t locty = s->locty_number;
> -
> -+    tis->bh_scheduled = false;
> -+
> -     qemu_mutex_lock(&s->state_lock);
> -
> -     tpm_tis_sts_set(&tis->loc[locty],
> -@@ -415,6 +417,8 @@ static void tpm_tis_receive_cb(TPMState *s, uint8_t
> locty,
> -     qemu_mutex_unlock(&s->state_lock);
> -
> -     qemu_bh_schedule(tis->bh);
> -+
> -+    tis->bh_scheduled = true;
> - }
> -
> - /*
> -@@ -1030,9 +1034,140 @@ static void tpm_tis_reset(DeviceState *dev)
> -     tpm_tis_do_startup_tpm(s);
> - }
> -
> -+
> -+/* persistent state handling */
> -+
> -+static void tpm_tis_pre_save(void *opaque)
> -+{
> -+    TPMState *s = opaque;
> -+    TPMTISEmuState *tis = &s->s.tis;
> -+    uint8_t locty = tis->active_locty;
> -+
> -+    DPRINTF("tpm_tis: suspend: locty = %d : r_offset = %d, w_offset =
> %d\n",
> -+            locty, tis->loc[0].r_offset, tis->loc[0].w_offset);
> -+#ifdef DEBUG_TIS
> -+    tpm_tis_dump_state(opaque, 0);
> -+#endif
> -+
> -+    qemu_mutex_lock(&s->state_lock);
> -+
> -+    /* wait for outstanding request to complete */
> -+    if (TPM_TIS_IS_VALID_LOCTY(locty) &&
> -+        tis->loc[locty].state == TPM_TIS_STATE_EXECUTION) {
> -+        /*
> -+         * If we get here when the bh is scheduled but did not run,
> -+         * we won't get notified...
> -+         */
> -+        if (!tis->bh_scheduled) {
> -+            /* backend thread to notify us */
> -+            qemu_cond_wait(&s->cmd_complete, &s->state_lock);
> -+        }
> -+        if (tis->loc[locty].state == TPM_TIS_STATE_EXECUTION) {
> -+            /* bottom half did not run - run its function */
> -+            qemu_mutex_unlock(&s->state_lock);
> -+            tpm_tis_receive_bh(opaque);
> -+            qemu_mutex_lock(&s->state_lock);
> -+        }
> -+    }
> -+
> -+    qemu_mutex_unlock(&s->state_lock);
> -+
> -+    /* copy current active read or write buffer into the buffer
> -+       written to disk */
> -+    if (TPM_TIS_IS_VALID_LOCTY(locty)) {
> -+        switch (tis->loc[locty].state) {
> -+        case TPM_TIS_STATE_RECEPTION:
> -+            memcpy(tis->buf,
> -+                   tis->loc[locty].w_buffer.buffer,
> -+                   MIN(sizeof(tis->buf),
> -+                       tis->loc[locty].w_buffer.size));
> -+            tis->offset = tis->loc[locty].w_offset;
> -+        break;
> -+        case TPM_TIS_STATE_COMPLETION:
> -+            memcpy(tis->buf,
> -+                   tis->loc[locty].r_buffer.buffer,
> -+                   MIN(sizeof(tis->buf),
> -+                       tis->loc[locty].r_buffer.size));
> -+            tis->offset = tis->loc[locty].r_offset;
> -+        break;
> -+        default:
> -+            /* leak nothing */
> -+            memset(tis->buf, 0x0, sizeof(tis->buf));
> -+        break;
> -+        }
> -+    }
> -+}
> -+
> -+static int tpm_tis_post_load(void *opaque,
> -+                             int version_id __attribute__((unused)))
> -+{
> -+    TPMState *s = opaque;
> -+    TPMTISEmuState *tis = &s->s.tis;
> -+
> -+    uint8_t locty = tis->active_locty;
> -+
> -+    if (TPM_TIS_IS_VALID_LOCTY(locty)) {
> -+        switch (tis->loc[locty].state) {
> -+        case TPM_TIS_STATE_RECEPTION:
> -+            memcpy(tis->loc[locty].w_buffer.buffer,
> -+                   tis->buf,
> -+                   MIN(sizeof(tis->buf),
> -+                       tis->loc[locty].w_buffer.size));
> -+            tis->loc[locty].w_offset = tis->offset;
> -+        break;
> -+        case TPM_TIS_STATE_COMPLETION:
> -+            memcpy(tis->loc[locty].r_buffer.buffer,
> -+                   tis->buf,
> -+                   MIN(sizeof(tis->buf),
> -+                       tis->loc[locty].r_buffer.size));
> -+            tis->loc[locty].r_offset = tis->offset;
> -+        break;
> -+        default:
> -+        break;
> -+        }
> -+    }
> -+
> -+    DPRINTF("tpm_tis: resume : locty = %d : r_offset = %d, w_offset =
> %d\n",
> -+            locty, tis->loc[0].r_offset, tis->loc[0].w_offset);
> -+
> -+    return 0;
> -+}
> -+
> -+static const VMStateDescription vmstate_locty = {
> -+    .name = "loc",
> -+    .version_id = 1,
> -+    .minimum_version_id = 0,
> -+    .minimum_version_id_old = 0,
> -+    .fields      = (VMStateField[]) {
> -+        VMSTATE_UINT32(state, TPMLocality),
> -+        VMSTATE_UINT32(inte, TPMLocality),
> -+        VMSTATE_UINT32(ints, TPMLocality),
> -+        VMSTATE_UINT8(access, TPMLocality),
> -+        VMSTATE_UINT32(sts, TPMLocality),
> -+        VMSTATE_UINT32(iface_id, TPMLocality),
> -+        VMSTATE_END_OF_LIST(),
> -+    }
> -+};
> -+
> - static const VMStateDescription vmstate_tpm_tis = {
> -     .name = "tpm",
> --    .unmigratable = 1,
> -+    .version_id = 1,
> -+    .minimum_version_id = 0,
> -+    .minimum_version_id_old = 0,
> -+    .pre_save  = tpm_tis_pre_save,
> -+    .post_load = tpm_tis_post_load,
> -+    .fields = (VMStateField[]) {
> -+        VMSTATE_UINT32(s.tis.offset, TPMState),
> -+        VMSTATE_BUFFER(s.tis.buf, TPMState),
> -+        VMSTATE_UINT8(s.tis.active_locty, TPMState),
> -+        VMSTATE_UINT8(s.tis.aborting_locty, TPMState),
> -+        VMSTATE_UINT8(s.tis.next_locty, TPMState),
> -+
> -+        VMSTATE_STRUCT_ARRAY(s.tis.loc, TPMState,
> TPM_TIS_NUM_LOCALITIES, 1,
> -+                             vmstate_locty, TPMLocality),
> -+
> -+        VMSTATE_END_OF_LIST()
> -+    }
> - };
> -
> - static Property tpm_tis_properties[] = {
> -diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h
> -index a1df41fa21..b7fc0ea1a9 100644
> ---- a/hw/tpm/tpm_tis.h
> -+++ b/hw/tpm/tpm_tis.h
> -@@ -54,6 +54,8 @@ typedef struct TPMLocality {
> -
> - typedef struct TPMTISEmuState {
> -     QEMUBH *bh;
> -+    bool bh_scheduled; /* bh scheduled but did not run yet */
> -+
> -     uint32_t offset;
> -     uint8_t buf[TPM_TIS_BUFFER_MAX];
> -
> -diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c
> -index 7b35429725..b6ff74d946 100644
> ---- a/hw/tpm/tpm_util.c
> -+++ b/hw/tpm/tpm_util.c
> -@@ -22,6 +22,17 @@
> - #include "qemu/osdep.h"
> - #include "tpm_util.h"
> - #include "tpm_int.h"
> -+#include "tpm_ioctl.h"
> -+#include "qemu/error-report.h"
> -+
> -+#define DEBUG_TPM 0
> -+
> -+#define DPRINTF(fmt, ...) do { \
> -+    if (DEBUG_TPM) { \
> -+        fprintf(stderr, fmt, ## __VA_ARGS__); \
> -+    } \
> -+} while (0)
> -+
> -
> - /*
> -  * A basic test of a TPM device. We expect a well formatted response
> header
> -@@ -125,3 +136,215 @@ int tpm_util_test_tpmdev(int tpm_fd, TPMVersion
> *tpm_version)
> -
> -     return 1;
> - }
> -+
> -+static void tpm_sized_buffer_reset(TPMSizedBuffer *tsb)
> -+{
> -+    g_free(tsb->buffer);
> -+    tsb->buffer = NULL;
> -+    tsb->size = 0;
> -+}
> -+
> -+/*
> -+ * Transfer a TPM state blob from the TPM into a provided buffer.
> -+ *
> -+ * @fd: file descriptor to talk to the CUSE TPM
> -+ * @type: the type of blob to transfer
> -+ * @decrypted_blob: whether we request to receive decrypted blobs
> -+ * @tsb: the TPMSizeBuffer to fill with the blob
> -+ * @flags: the flags to return to the caller
> -+ */
> -+static int tpm_util_cuse_get_state_blob(int fd,
> -+                                        uint8_t type,
> -+                                        bool decrypted_blob,
> -+                                        TPMSizedBuffer *tsb,
> -+                                        uint32_t *flags)
> -+{
> -+    ptm_getstate pgs;
> -+    uint16_t offset = 0;
> -+    ptm_res res;
> -+    ssize_t n;
> -+    size_t to_read;
> -+
> -+    tpm_sized_buffer_reset(tsb);
> -+
> -+    pgs.u.req.state_flags = (decrypted_blob) ? PTM_STATE_FLAG_DECRYPTED
> : 0;
> -+    pgs.u.req.type = type;
> -+    pgs.u.req.offset = offset;
> -+
> -+    if (ioctl(fd, PTM_GET_STATEBLOB, &pgs) < 0) {
> -+        error_report("CUSE TPM PTM_GET_STATEBLOB ioctl failed: %s",
> -+                     strerror(errno));
> -+        goto err_exit;
> -+    }
> -+    res = pgs.u.resp.tpm_result;
> -+    if (res != 0 && (res & 0x800) == 0) {
> -+        error_report("Getting the stateblob (type %d) failed with a TPM "
> -+                     "error 0x%x", type, res);
> -+        goto err_exit;
> -+    }
> -+
> -+    *flags = pgs.u.resp.state_flags;
> -+
> -+    tsb->buffer = g_malloc(pgs.u.resp.totlength);
> -+    memcpy(tsb->buffer, pgs.u.resp.data, pgs.u.resp.length);
> -+    tsb->size = pgs.u.resp.length;
> -+
> -+    /* if there are bytes left to get use read() interface */
> -+    while (tsb->size < pgs.u.resp.totlength) {
> -+        to_read = pgs.u.resp.totlength - tsb->size;
> -+        if (unlikely(to_read > SSIZE_MAX)) {
> -+            to_read = SSIZE_MAX;
> -+        }
> -+
> -+        n = read(fd, &tsb->buffer[tsb->size], to_read);
> -+        if (n != to_read) {
> -+            error_report("Could not read stateblob (type %d) : %s",
> -+                         type, strerror(errno));
> -+            goto err_exit;
> -+        }
> -+        tsb->size += to_read;
> -+    }
> -+
> -+    DPRINTF("tpm_util: got state blob type %d, %d bytes, flags 0x%08x, "
> -+            "decrypted=%d\n", type, tsb->size, *flags, decrypted_blob);
> -+
> -+    return 0;
> -+
> -+err_exit:
> -+    return 1;
> -+}
> -+
> -+int tpm_util_cuse_get_state_blobs(int tpm_fd,
> -+                                  bool decrypted_blobs,
> -+                                  TPMBlobBuffers *tpm_blobs)
> -+{
> -+    if (tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_PERMANENT,
> -+                                     decrypted_blobs,
> -+                                     &tpm_blobs->permanent,
> -+                                     &tpm_blobs->permanent_flags) ||
> -+       tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_VOLATILE,
> -+                                     decrypted_blobs,
> -+                                     &tpm_blobs->volatil,
> -+                                     &tpm_blobs->volatil_flags) ||
> -+       tpm_util_cuse_get_state_blob(tpm_fd, PTM_BLOB_TYPE_SAVESTATE,
> -+                                     decrypted_blobs,
> -+                                     &tpm_blobs->savestate,
> -+                                     &tpm_blobs->savestate_flags)) {
> -+        goto err_exit;
> -+    }
> -+
> -+    return 0;
> -+
> -+ err_exit:
> -+    tpm_sized_buffer_reset(&tpm_blobs->volatil);
> -+    tpm_sized_buffer_reset(&tpm_blobs->permanent);
> -+    tpm_sized_buffer_reset(&tpm_blobs->savestate);
> -+
> -+    return 1;
> -+}
> -+
> -+static int tpm_util_cuse_do_set_stateblob_ioctl(int fd,
> -+                                                uint32_t flags,
> -+                                                uint32_t type,
> -+                                                uint32_t length)
> -+{
> -+    ptm_setstate pss;
> -+
> -+    pss.u.req.state_flags = flags;
> -+    pss.u.req.type = type;
> -+    pss.u.req.length = length;
> -+
> -+    if (ioctl(fd, PTM_SET_STATEBLOB, &pss) < 0) {
> -+        error_report("CUSE TPM PTM_SET_STATEBLOB ioctl failed: %s",
> -+                     strerror(errno));
> -+        return 1;
> -+    }
> -+
> -+    if (pss.u.resp.tpm_result != 0) {
> -+        error_report("Setting the stateblob (type %d) failed with a TPM "
> -+                     "error 0x%x", type, pss.u.resp.tpm_result);
> -+        return 1;
> -+    }
> -+
> -+    return 0;
> -+}
> -+
> -+
> -+/*
> -+ * Transfer a TPM state blob to the CUSE TPM.
> -+ *
> -+ * @fd: file descriptor to talk to the CUSE TPM
> -+ * @type: the type of TPM state blob to transfer
> -+ * @tsb: TPMSizeBuffer containing the TPM state blob
> -+ * @flags: Flags describing the (encryption) state of the TPM state blob
> -+ */
> -+static int tpm_util_cuse_set_state_blob(int fd,
> -+                                        uint32_t type,
> -+                                        TPMSizedBuffer *tsb,
> -+                                        uint32_t flags)
> -+{
> -+    uint32_t offset = 0;
> -+    ssize_t n;
> -+    size_t to_write;
> -+
> -+    /* initiate the transfer to the CUSE TPM */
> -+    if (tpm_util_cuse_do_set_stateblob_ioctl(fd, flags, type, 0)) {
> -+        return 1;
> -+    }
> -+
> -+    /* use the write() interface for transferring the state blob */
> -+    while (offset < tsb->size) {
> -+        to_write = tsb->size - offset;
> -+        if (unlikely(to_write > SSIZE_MAX)) {
> -+            to_write = SSIZE_MAX;
> -+        }
> -+
> -+        n = write(fd, &tsb->buffer[offset], to_write);
> -+        if (n != to_write) {
> -+            error_report("Writing the stateblob (type %d) failed: %s",
> -+                         type, strerror(errno));
> -+            goto err_exit;
> -+        }
> -+        offset += to_write;
> -+    }
> -+
> -+    /* inidicate that the transfer is finished */
> -+    if (tpm_util_cuse_do_set_stateblob_ioctl(fd, flags, type, 0)) {
> -+        goto err_exit;
> -+    }
> -+
> -+    DPRINTF("tpm_util: set the state blob type %d, %d bytes, flags
> 0x%08x\n",
> -+            type, tsb->size, flags);
> -+
> -+    return 0;
> -+
> -+err_exit:
> -+    return 1;
> -+}
> -+
> -+int tpm_util_cuse_set_state_blobs(int tpm_fd,
> -+                                  TPMBlobBuffers *tpm_blobs)
> -+{
> -+    ptm_res res;
> -+
> -+    if (ioctl(tpm_fd, PTM_STOP, &res) < 0) {
> -+        error_report("tpm_passthrough: Could not stop "
> -+                     "the CUSE TPM: %s (%i)",
> -+                     strerror(errno), errno);
> -+        return 1;
> -+    }
> -+
> -+    if (tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_PERMANENT,
> -+                                     &tpm_blobs->permanent,
> -+                                     tpm_blobs->permanent_flags) ||
> -+        tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_VOLATILE,
> -+                                     &tpm_blobs->volatil,
> -+                                     tpm_blobs->volatil_flags) ||
> -+        tpm_util_cuse_set_state_blob(tpm_fd, PTM_BLOB_TYPE_SAVESTATE,
> -+                                     &tpm_blobs->savestate,
> -+                                     tpm_blobs->savestate_flags)) {
> -+        return 1;
> -+    }
> -+
> -+    return 0;
> -+}
> -diff --git a/hw/tpm/tpm_util.h b/hw/tpm/tpm_util.h
> -index df76245e6e..c24071d812 100644
> ---- a/hw/tpm/tpm_util.h
> -+++ b/hw/tpm/tpm_util.h
> -@@ -26,4 +26,11 @@
> -
> - int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);
> -
> -+int tpm_util_cuse_get_state_blobs(int tpm_fd,
> -+                                  bool decrypted_blobs,
> -+                                  TPMBlobBuffers *tpm_blobs);
> -+
> -+int tpm_util_cuse_set_state_blobs(int tpm_fd,
> -+                                  TPMBlobBuffers *tpm_blobs);
> -+
> - #endif /* TPM_TPM_UTIL_H */
> -diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
> -index b58f52d39f..3403821b9d 100644
> ---- a/include/sysemu/tpm_backend.h
> -+++ b/include/sysemu/tpm_backend.h
> -@@ -62,6 +62,18 @@ typedef struct TPMSizedBuffer {
> -     uint8_t  *buffer;
> - } TPMSizedBuffer;
> -
> -+/* blobs from the TPM; part of VM state when migrating */
> -+typedef struct TPMBlobBuffers {
> -+    uint32_t permanent_flags;
> -+    TPMSizedBuffer permanent;
> -+
> -+    uint32_t volatil_flags;
> -+    TPMSizedBuffer volatil;
> -+
> -+    uint32_t savestate_flags;
> -+    TPMSizedBuffer savestate;
> -+} TPMBlobBuffers;
> -+
> - struct TPMDriverOps {
> -     enum TpmType type;
> -     const QemuOptDesc *opts;
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
> b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
> new file mode 100644
> index 0000000..e963982
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile-v10.patch
> @@ -0,0 +1,28 @@
> +From 4201a5791fc4798a45a9b9f881602d7bacb74ed1 Mon Sep 17 00:00:00 2001
> +From: Juro Bystricky <juro.bystricky@intel.com>
> +Date: Thu, 31 Aug 2017 11:06:56 -0700
> +Subject: Add subpackage -ptest which runs all unit test cases for qemu.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> +
> +diff --git a/tests/Makefile.include b/tests/Makefile.include
> +index f08b741..3d1b3e9 100644
> +--- a/tests/Makefile.include
> ++++ b/tests/Makefile.include
> +@@ -924,4 +924,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
> + -include $(wildcard tests/*.d)
> + -include $(wildcard tests/libqos/*.d)
> +
> ++buildtest-TESTS: $(check-unit-y)
> ++
> ++runtest-TESTS:
> ++      for f in $(check-unit-y); do \
> ++              nf=$$(echo $$f | sed 's/tests\//\.\//g'); \
> ++              $$nf; \
> ++      done
> ++
> + endif
> diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
> b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
> deleted file mode 100644
> index 2ce3478..0000000
> --- a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Upstream-Status: Pending
> -
> -Add subpackage -ptest which runs all unit test cases for qemu.
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ----
> - tests/Makefile.include | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -diff --git a/tests/Makefile.include b/tests/Makefile.include
> -index 14be491..0fce37a 100644
> ---- a/tests/Makefile.include
> -+++ b/tests/Makefile.include
> -@@ -776,3 +776,11 @@ all: $(QEMU_IOTESTS_HELPERS-y)
> -
> - -include $(wildcard tests/*.d)
> - -include $(wildcard tests/libqos/*.d)
> -+
> -+buildtest-TESTS: $(check-unit-y)
> -+
> -+runtest-TESTS:
> -+      for f in $(check-unit-y); do \
> -+              nf=$$(echo $$f | sed 's/tests\//\.\//g'); \
> -+              $$nf; \
> -+      done
> ---
> -2.9.0
> -
> diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
> b/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
> deleted file mode 100644
> index 204e36f..0000000
> --- a/meta/recipes-devtools/qemu/qemu_2.10.0-rc2.bb
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -require qemu.inc
> -
> -inherit ptest
> -
> -RDEPENDS_${PN}-ptest = "bash make"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> -                    file://COPYING.LIB;endline=24;md5=
> c04def7ae38850e7d3ef548588159913"
> -
> -SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
> -           file://powerpc_rom.bin \
> -           file://disable-grabs.patch \
> -           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
> -           file://wacom.patch \
> -           file://add-ptest-in-makefile.patch \
> -           file://run-ptest \
> -           file://qemu-enlarge-env-entry-size.patch \
> -           file://no-valgrind.patch \
> -           file://pathlimit.patch \
> -           file://qemu-2.5.0-cflags.patch \
> -           file://glibc-2.25.patch \
> -           file://0001-Provide-support-for-the-CUSE-TPM.patch \
> -           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
> \
> -           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch
> \
> -           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch
> \
> -           file://apic-fixup-fallthrough-to-PIC.patch \
> -           file://0001-osdep-Add-runtime-OFD-lock-detection.patch \
> -           file://0002-file-posix-Do-runtime-check-for-ofd-lock-API.patch
> \
> -           "
> -UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
> -
> -
> -SRC_URI_append_class-native = " \
> -            file://fix-libcap-header-issue-on-some-distro.patch \
> -            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
> -            "
> -SRC_URI[md5sum] = "634c498476e4b5643cf7a89e7416d0ae"
> -SRC_URI[sha256sum] = "9f8aaa2839634a2226a49d0f305ef9
> 22a7b0bc850d343aaee41948fd6f45700a"
> -
> -COMPATIBLE_HOST_mipsarchn32 = "null"
> -COMPATIBLE_HOST_mipsarchn64 = "null"
> -
> -do_install_append() {
> -    # Prevent QA warnings about installed ${localstatedir}/run
> -    if [ -d ${D}${localstatedir}/run ]; then rmdir
> ${D}${localstatedir}/run; fi
> -    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
> -}
> -
> -do_compile_ptest() {
> -       make buildtest-TESTS
> -}
> -
> -do_install_ptest() {
> -       cp -rL ${B}/tests ${D}${PTEST_PATH}
> -       find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i
> rm -rf {}
> -
> -       cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
> -}
> -
> diff --git a/meta/recipes-devtools/qemu/qemu_2.10.0.bb
> b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
> new file mode 100644
> index 0000000..835577a
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu_2.10.0.bb
> @@ -0,0 +1,58 @@
> +require qemu.inc
> +
> +inherit ptest
> +
> +RDEPENDS_${PN}-ptest = "bash make"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> +                    file://COPYING.LIB;endline=24;md5=
> c04def7ae38850e7d3ef548588159913"
> +
> +SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
> +           file://powerpc_rom.bin \
> +           file://disable-grabs.patch \
> +           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
> +           file://wacom.patch \
> +           file://add-ptest-in-makefile-v10.patch \
> +           file://run-ptest \
> +           file://qemu-enlarge-env-entry-size.patch \
> +           file://no-valgrind.patch \
> +           file://pathlimit.patch \
> +           file://qemu-2.5.0-cflags.patch \
> +           file://glibc-2.25.patch \
> +           file://0001-Provide-support-for-the-CUSE-TPM.patch \
> +           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
> \
> +           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch
> \
> +           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS-v2.9.patch
> \
> +           file://apic-fixup-fallthrough-to-PIC.patch \
> +           "
> +UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
> +
> +
> +SRC_URI_append_class-native = " \
> +            file://fix-libcap-header-issue-on-some-distro.patch \
> +            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
> +            "
> +
> +SRC_URI[md5sum] = "ca73441de73a9b52c6c49c97190d2185"
> +SRC_URI[sha256sum] = "7e9f39e1306e6dcc595494e91c1464
> d4b03f55ddd2053183e0e1b69f7f776d48"
> +
> +COMPATIBLE_HOST_mipsarchn32 = "null"
> +COMPATIBLE_HOST_mipsarchn64 = "null"
> +
> +do_install_append() {
> +    # Prevent QA warnings about installed ${localstatedir}/run
> +    if [ -d ${D}${localstatedir}/run ]; then rmdir
> ${D}${localstatedir}/run; fi
> +    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
> +}
> +
> +do_compile_ptest() {
> +       make buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +       cp -rL ${B}/tests ${D}${PTEST_PATH}
> +       find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i
> rm -rf {}
> +
> +       cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
> +}
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
> b/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
> deleted file mode 100644
> index a4ddb7f..0000000
> --- a/meta/recipes-devtools/qemu/qemu_2.8.1.1.bb
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -require qemu.inc
> -
> -inherit ptest
> -
> -RDEPENDS_${PN}-ptest = "bash make"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> -                    file://COPYING.LIB;endline=24;md5=
> c04def7ae38850e7d3ef548588159913"
> -
> -SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
> -           file://powerpc_rom.bin \
> -           file://disable-grabs.patch \
> -           file://exclude-some-arm-EABI-obsolete-syscalls.patch \
> -           file://wacom.patch \
> -           file://add-ptest-in-makefile.patch \
> -           file://run-ptest \
> -           file://configure-fix-Darwin-target-detection.patch \
> -           file://qemu-enlarge-env-entry-size.patch \
> -           file://no-valgrind.patch \
> -           file://pathlimit.patch \
> -           file://qemu-2.5.0-cflags.patch \
> -           file://glibc-2.25.patch \
> -           file://0001-Provide-support-for-the-CUSE-TPM.patch \
> -           file://0002-Introduce-condition-to-notify-waiters-of-completed-c.patch
> \
> -           file://0003-Introduce-condition-in-TPM-backend-for-notification.patch
> \
> -           file://0004-Add-support-for-VM-suspend-resume-for-TPM-TIS.patch
> \
> -           file://CVE-2016-9908.patch \
> -           file://CVE-2016-9912.patch \
> -           file://0001-replace-struct-ucontext-with-ucontext_t-type.patch
> \
> -           file://apic-fixup-fallthrough-to-PIC.patch \
> -           "
> -
> -SRC_URI_append_class-native = " \
> -            file://fix-libcap-header-issue-on-some-distro.patch \
> -            file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
> -            "
> -
> -SRC_URI[md5sum] = "a6a23a0c59fd0f8ec564b0fb89a79954"
> -SRC_URI[sha256sum] = "f62ab18a1fb9ff5b4c81ed44becc94
> 5b11581eff777618141bdb787da55d3638"
> -
> -COMPATIBLE_HOST_mipsarchn32 = "null"
> -COMPATIBLE_HOST_mipsarchn64 = "null"
> -
> -do_install_append() {
> -    # Prevent QA warnings about installed ${localstatedir}/run
> -    if [ -d ${D}${localstatedir}/run ]; then rmdir
> ${D}${localstatedir}/run; fi
> -    install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/qemu
> -}
> -
> -do_compile_ptest() {
> -       make buildtest-TESTS
> -}
> -
> -do_install_ptest() {
> -       cp -rL ${B}/tests ${D}${PTEST_PATH}
> -       find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i
> rm -rf {}
> -
> -       cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
> -}
> -
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403043ed118016a6505581de05e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there any ticket requesting virgl support enabled in qe=
mu-native? It might depend on providing virglrenderer-native, libsdl2-nativ=
e, epoxy-native and maybe even mesa-native.<div><br></div><div>It was short=
ly enabled in Debian and Ubuntu packages, but then disabled mostly because =
it requires sdl2 or gtk graphics backend and sdl2 was missing some features=
 and gtk was pulling so many dependencies to some headless servers.</div><d=
iv><br></div><div>For OE this might be smaller issue or we can try to use s=
pice server to execute qemu-native on headless builders and only run spice =
client on developer workstations. Or in my case qemu-native in headless chr=
oot and spice client in host OS.</div><div><br></div><div>What do you think=
?</div><div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Thu, Aug 31, 2017 at 11:33 PM, Juro Bystri=
cky <span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" targe=
t=3D"_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Remove recipes for older versions.<br>
Remove patches no longer needed.<br>
Modify the patch &quot;add-ptest-in-makefile.patch&quot; for version 2.10.0=
<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0...0001-osdep-Add-runtime-OFD-<wbr>lock-detection.patch | 141 ----<br=
>
=C2=A0...e-posix-Do-runtime-check-<wbr>for-ofd-lock-API.patch |=C2=A0 71 --=
<br>
=C2=A0...support-for-VM-suspend-<wbr>resume-for-TPM-TIS.patch | 719 -------=
--------------<br>
=C2=A0.../qemu/qemu/add-ptest-in-<wbr>makefile-v10.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 28 +<br>
=C2=A0.../qemu/qemu/add-ptest-in-<wbr>makefile.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 28 -<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0-rc2.bb" rel=
=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.10.0-rc2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 59 --<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">qem<wbr>u_2.10.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 58 ++<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.8.1.1.bb" rel=3D"=
noreferrer" target=3D"_blank">qem<wbr>u_2.8.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 60 --<br>
=C2=A08 files changed, 86 insertions(+), 1078 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0001-osdep-Ad=
d-runtime-<wbr>OFD-lock-detection.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0002-file-pos=
ix-Do-<wbr>runtime-check-for-ofd-lock-<wbr>API.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0004-Add-supp=
ort-for-VM-<wbr>suspend-resume-for-TPM-TIS.<wbr>patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-=
makefile-<wbr>v10.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-=
makefile.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<a href=3D"http://qemu_=
2.10.0-rc2.bb" rel=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.10.0-rc2.bb=
</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/<a href=3D"http://qemu_=
2.10.0.bb" rel=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.10.0.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<a href=3D"http://qemu_=
2.8.1.1.bb" rel=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.8.1.1.bb</a><b=
r>
<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0001-osdep-Add-runtime-<w=
br>OFD-lock-detection.patch b/meta/recipes-devtools/qemu/<wbr>qemu/0001-osd=
ep-Add-runtime-<wbr>OFD-lock-detection.patch<br>
deleted file mode 100644<br>
index f83f0d2..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0001-osdep-Add-runtime-<wbr>OFD-=
lock-detection.patch<br>
+++ /dev/null<br>
@@ -1,141 +0,0 @@<br>
-From ca749954b09b89e22cd69c4949fb7e<wbr>689b057963 Mon Sep 17 00:00:00 200=
1<br>
-From: Fam Zheng &lt;<a href=3D"mailto:famz@redhat.com">famz@redhat.com</a>=
&gt;<br>
-Date: Fri, 11 Aug 2017 19:44:46 +0800<br>
-Subject: [PATCH 1/2] osdep: Add runtime OFD lock detection<br>
-<br>
-Build time check of OFD lock is not sufficient and can cause image open<br=
>
-errors when the runtime environment doesn&#39;t support it.<br>
-<br>
-Add a helper function to probe it at runtime, additionally. Also provide<b=
r>
-a qemu_has_ofd_lock() for callers to check the status.<br>
-<br>
-Signed-off-by: Fam Zheng &lt;<a href=3D"mailto:famz@redhat.com">famz@redha=
t.com</a>&gt;<br>
-Signed-off-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@re=
dhat.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
----<br>
- include/qemu/osdep.h |=C2=A0 1 +<br>
- util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 66 ++++++++++++++++++++++=
++++++++<wbr>++++++++++++++--------<br>
- 2 files changed, 57 insertions(+), 10 deletions(-)<br>
-<br>
-diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
-index 3b74f6fcb2..6855b94bbf 100644<br>
---- a/include/qemu/osdep.h<br>
-+++ b/include/qemu/osdep.h<br>
-@@ -357,6 +357,7 @@ int qemu_dup(int fd);<br>
- int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);<br>
- int qemu_unlock_fd(int fd, int64_t start, int64_t len);<br>
- int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive)=
;<br>
-+bool qemu_has_ofd_lock(void);<br>
-<br>
- #if defined(__HAIKU__) &amp;&amp; defined(__i386__)<br>
- #define FMT_pid &quot;%ld&quot;<br>
-diff --git a/util/osdep.c b/util/osdep.c<br>
-index a2863c8e53..a479fedc4a 100644<br>
---- a/util/osdep.c<br>
-+++ b/util/osdep.c<br>
-@@ -38,14 +38,6 @@ extern int madvise(caddr_t, size_t, int);<br>
- #include &quot;qemu/error-report.h&quot;<br>
- #include &quot;monitor/monitor.h&quot;<br>
-<br>
--#ifdef F_OFD_SETLK<br>
--#define QEMU_SETLK F_OFD_SETLK<br>
--#define QEMU_GETLK F_OFD_GETLK<br>
--#else<br>
--#define QEMU_SETLK F_SETLK<br>
--#define QEMU_GETLK F_GETLK<br>
--#endif<br>
--<br>
- static bool fips_enabled =3D false;<br>
-<br>
- static const char *hw_version =3D QEMU_HW_VERSION;<br>
-@@ -82,6 +74,10 @@ int qemu_madvise(void *addr, size_t len, int advice)<br=
>
- }<br>
-<br>
- #ifndef _WIN32<br>
-+<br>
-+static int fcntl_op_setlk =3D -1;<br>
-+static int fcntl_op_getlk =3D -1;<br>
-+<br>
- /*<br>
-=C2=A0 * Dups an fd and sets the flags<br>
-=C2=A0 */<br>
-@@ -149,6 +145,54 @@ static int qemu_parse_fdset(const char *param)<br>
-=C2=A0 =C2=A0 =C2=A0return qemu_parse_fd(param);<br>
- }<br>
-<br>
-+static void qemu_probe_lock_ops(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 if (fcntl_op_setlk =3D=3D -1) {<br>
-+#ifdef F_OFD_SETLK<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct flock fl =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .l_whence =3D SEEK_SET,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .l_start=C2=A0 =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .l_len=C2=A0 =C2=A0 =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .l_type=C2=A0 =C2=A0=3D F_WRLCK=
,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D open(&quot;/dev/null&quot;, O_RDWR);<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;Failed to open /dev/null for OFD lock probing: %s\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str=
error(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_setlk =3D F_SETLK;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_getlk =3D F_GETLK;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fcntl(fd, F_OFD_GETLK, &amp;fl);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_setlk =3D F_OFD_SETLK;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_getlk =3D F_OFD_GETLK;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_setlk =3D F_SETLK;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_getlk =3D F_GETLK;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_setlk =3D F_SETLK;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl_op_getlk =3D F_GETLK;<br>
-+#endif<br>
-+=C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
-+bool qemu_has_ofd_lock(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 qemu_probe_lock_ops();<br>
-+#ifdef F_OFD_SETLK<br>
-+=C2=A0 =C2=A0 return fcntl_op_setlk =3D=3D F_OFD_SETLK;<br>
-+#else<br>
-+=C2=A0 =C2=A0 return false;<br>
-+#endif<br>
-+}<br>
-+<br>
- static int qemu_lock_fcntl(int fd, int64_t start, int64_t len, int fl_typ=
e)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0int ret;<br>
-@@ -158,7 +202,8 @@ static int qemu_lock_fcntl(int fd, int64_t start, int6=
4_t len, int fl_type)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_len=C2=A0 =C2=A0 =3D len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type=C2=A0 =C2=A0=3D fl_type,<br>
-=C2=A0 =C2=A0 =C2=A0};<br>
--=C2=A0 =C2=A0 ret =3D fcntl(fd, QEMU_SETLK, &amp;fl);<br>
-+=C2=A0 =C2=A0 qemu_probe_lock_ops();<br>
-+=C2=A0 =C2=A0 ret =3D fcntl(fd, fcntl_op_setlk, &amp;fl);<br>
-=C2=A0 =C2=A0 =C2=A0return ret =3D=3D -1 ? -errno : 0;<br>
- }<br>
-<br>
-@@ -181,7 +226,8 @@ int qemu_lock_fd_test(int fd, int64_t start, int64_t l=
en, bool exclusive)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_len=C2=A0 =C2=A0 =3D len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_type=C2=A0 =C2=A0=3D exclusive ? F_WR=
LCK : F_RDLCK,<br>
-=C2=A0 =C2=A0 =C2=A0};<br>
--=C2=A0 =C2=A0 ret =3D fcntl(fd, QEMU_GETLK, &amp;fl);<br>
-+=C2=A0 =C2=A0 qemu_probe_lock_ops();<br>
-+=C2=A0 =C2=A0 ret =3D fcntl(fd, fcntl_op_getlk, &amp;fl);<br>
-=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -errno;<br>
-=C2=A0 =C2=A0 =C2=A0} else {<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0002-file-posix-Do-<wbr>r=
untime-check-for-ofd-lock-<wbr>API.patch b/meta/recipes-devtools/qemu/<wbr>=
qemu/0002-file-posix-Do-<wbr>runtime-check-for-ofd-lock-<wbr>API.patch<br>
deleted file mode 100644<br>
index 0dacde4..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0002-file-posix-Do-<wbr>runtime-=
check-for-ofd-lock-<wbr>API.patch<br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-From 2b218f5dbcca5fe728b1852d161d7a<wbr>21fd02b2f5 Mon Sep 17 00:00:00 200=
1<br>
-From: Fam Zheng &lt;<a href=3D"mailto:famz@redhat.com">famz@redhat.com</a>=
&gt;<br>
-Date: Fri, 11 Aug 2017 19:44:47 +0800<br>
-Subject: [PATCH 2/2] file-posix: Do runtime check for ofd lock API<br>
-<br>
-It is reported that on Windows Subsystem for Linux, ofd operations fail<br=
>
-with -EINVAL. In other words, QEMU binary built with system headers that<b=
r>
-exports F_OFD_SETLK doesn&#39;t necessarily run in an environment that<br>
-actually supports it:<br>
-<br>
-$ qemu-system-aarch64 ... -drive file=3Dtest.vhdx,if=3Dnone,id=3Dhd0 \<br>
-=C2=A0 =C2=A0 -device virtio-blk-pci,drive=3Dhd0<br>
-qemu-system-aarch64: -drive file=3Dtest.vhdx,if=3Dnone,id=3Dhd0: Failed to=
 unlock byte 100<br>
-qemu-system-aarch64: -drive file=3Dtest.vhdx,if=3Dnone,id=3Dhd0: Failed to=
 unlock byte 100<br>
-qemu-system-aarch64: -drive file=3Dtest.vhdx,if=3Dnone,id=3Dhd0: Failed to=
 lock byte 100<br>
-<br>
-As a matter of fact this is not WSL specific. It can happen when running<b=
r>
-a QEMU compiled against a newer glibc on an older kernel, such as in<br>
-a containerized environment.<br>
-<br>
-Let&#39;s do a runtime check to cope with that.<br>
-<br>
-Reported-by: Andrew Baumann &lt;<a href=3D"mailto:Andrew.Baumann@microsoft=
.com">Andrew.Baumann@microsoft.com</a>&gt;<br>
-Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@re=
dhat.com</a>&gt;<br>
-Signed-off-by: Fam Zheng &lt;<a href=3D"mailto:famz@redhat.com">famz@redha=
t.com</a>&gt;<br>
-Signed-off-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@re=
dhat.com</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
----<br>
- block/file-posix.c | 19 ++++++++-----------<br>
- 1 file changed, 8 insertions(+), 11 deletions(-)<br>
-<br>
-diff --git a/block/file-posix.c b/block/file-posix.c<br>
-index f4de022ae0..cb3bfce147 100644<br>
---- a/block/file-posix.c<br>
-+++ b/block/file-posix.c<br>
-@@ -457,22 +457,19 @@ static int raw_open_common(<wbr>BlockDriverState *bs=
, QDict *options,<br>
-=C2=A0 =C2=A0 =C2=A0switch (locking) {<br>
-=C2=A0 =C2=A0 =C2=A0case ON_OFF_AUTO_ON:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;use_lock =3D true;<br>
--#ifndef F_OFD_SETLK<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;File lock r=
equested but OFD locking syscall is unavailable, &quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;falling bac=
k to POSIX file locks.\n&quot;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Due to the =
implementation, locks can be lost unexpectedly.\n&quot;);<br>
--#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qemu_has_ofd_lock()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;File lock requested but OFD locking syscall is &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;unavailable, falling back to POSIX file locks.\n&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;Due to the implementation, locks can be lost &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;unexpectedly.\n&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0case ON_OFF_AUTO_OFF:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;use_lock =3D false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0case ON_OFF_AUTO_AUTO:<br>
--#ifdef F_OFD_SETLK<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;use_lock =3D true;<br>
--#else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;use_lock =3D false;<br>
--#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;use_lock =3D qemu_has_ofd_lock();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abort();<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0004-Add-support-for-VM-<=
wbr>suspend-resume-for-TPM-TIS.<wbr>patch b/meta/recipes-devtools/qemu/<wbr=
>qemu/0004-Add-support-for-VM-<wbr>suspend-resume-for-TPM-TIS.<wbr>patch<br=
>
deleted file mode 100644<br>
index b8a783d..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0004-Add-support-for-VM-<wbr>sus=
pend-resume-for-TPM-TIS.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,719 +0,0 @@<br>
-From 5e9dd9063f514447ea4f54046793f4<wbr>f01c297ed4 Mon Sep 17 00:00:00 200=
1<br>
-From: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.vnet.ibm.com">stef=
anb@linux.vnet.ibm.com</a>&gt;<br>
-Date: Sat, 31 Dec 2016 11:23:32 -0500<br>
-Subject: [PATCH 4/4] Add support for VM suspend/resume for TPM TIS<br>
-<br>
-Extend the TPM TIS code to support suspend/resume. In case a command<br>
-is being processed by the external TPM when suspending, wait for the comma=
nd<br>
-to complete to catch the result. In case the bottom half did not run,<br>
-run the one function the bottom half is supposed to run. This then<br>
-makes the resume operation work.<br>
-<br>
-The passthrough backend does not support suspend/resume operation<br>
-and is therefore blocked from suspend/resume and migration.<br>
-<br>
-The CUSE TPM&#39;s supported capabilities are tested and if sufficient<br>
-capabilities are implemented, suspend/resume, snapshotting and<br>
-migration are supported by the CUSE TPM.<br>
-<br>
-Signed-off-by: Stefan Berger &lt;<a href=3D"mailto:stefanb@linux.vnet.ibm.=
com">stefanb@linux.vnet.ibm.com</a>&gt;<br>
-<br>
-Upstream-Status: Pending [<a href=3D"https://lists.nongnu.org/archive/html=
/qemu-devel/2016-06/msg00252.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.nongnu.org/<wbr>archive/html/qemu-devel/2016-<wbr>06/msg00252.ht=
ml</a>]<br>
-Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">=
patrick.ohly@intel.com</a>&gt;<br>
----<br>
- hw/tpm/tpm_passthrough.c=C2=A0 =C2=A0 =C2=A0| 130 +++++++++++++++++++++++=
--<br>
- hw/tpm/tpm_tis.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 137 +++=
++++++++++++++++++++++-<br>
- hw/tpm/tpm_tis.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
- hw/tpm/tpm_util.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 223 ++++++++=
++++++++++++++++++++++<wbr>+++++++++++++<br>
- hw/tpm/tpm_util.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
7 ++<br>
- include/sysemu/tpm_backend.h |=C2=A0 12 +++<br>
- 6 files changed, 503 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c<br>
-index 44739ebad2..bc8072d0bc 100644<br>
---- a/hw/tpm/tpm_passthrough.c<br>
-+++ b/hw/tpm/tpm_passthrough.c<br>
-@@ -34,6 +34,8 @@<br>
- #include &quot;tpm_tis.h&quot;<br>
- #include &quot;tpm_util.h&quot;<br>
- #include &quot;tpm_ioctl.h&quot;<br>
-+#include &quot;migration/migration.h&quot;<br>
-+#include &quot;qapi/error.h&quot;<br>
-<br>
- #define DEBUG_TPM 0<br>
-<br>
-@@ -49,6 +51,7 @@<br>
- #define TYPE_TPM_CUSE &quot;tpm-cuse&quot;<br>
-<br>
- static const TPMDriverOps tpm_passthrough_driver;<br>
-+static const VMStateDescription vmstate_tpm_cuse;<br>
-<br>
- /* data structures */<br>
- typedef struct TPMPassthruThreadParams {<br>
-@@ -79,6 +82,10 @@ struct TPMPassthruState {<br>
-=C2=A0 =C2=A0 =C2=A0QemuMutex state_lock;<br>
-=C2=A0 =C2=A0 =C2=A0QemuCond cmd_complete;=C2=A0 /* singnaled once tpm_bus=
y is false */<br>
-=C2=A0 =C2=A0 =C2=A0bool tpm_busy;<br>
-+<br>
-+=C2=A0 =C2=A0 Error *migration_blocker;<br>
-+<br>
-+=C2=A0 =C2=A0 TPMBlobBuffers tpm_blobs;<br>
- };<br>
-<br>
- typedef struct TPMPassthruState TPMPassthruState;<br>
-@@ -306,6 +313,10 @@ static void tpm_passthrough_shutdown(<wbr>TPMPassthru=
State *tpm_pt)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 strerror(errno));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 if (tpm_pt-&gt;migration_blocker) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 migrate_del_blocker(tpm_pt-&gt;<wbr>migration=
_blocker);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_free(tpm_pt-&gt;migration_<wbr>blocker)=
;<br>
-+=C2=A0 =C2=A0 }<br>
- }<br>
-<br>
- /*<br>
-@@ -360,12 +371,14 @@ static int tpm_passthrough_cuse_check_<wbr>caps(TPMP=
assthruState *tpm_pt)<br>
- /*<br>
-=C2=A0 * Initialize the external CUSE TPM<br>
-=C2=A0 */<br>
--static int tpm_passthrough_cuse_init(<wbr>TPMPassthruState *tpm_pt)<br>
-+static int tpm_passthrough_cuse_init(<wbr>TPMPassthruState *tpm_pt,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_resume)<=
br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0int rc =3D 0;<br>
--=C2=A0 =C2=A0 ptm_init init =3D {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 .u.req.init_flags =3D PTM_INIT_FLAG_DELETE_VO=
LATILE,<br>
--=C2=A0 =C2=A0 };<br>
-+=C2=A0 =C2=A0 ptm_init init;<br>
-+=C2=A0 =C2=A0 if (is_resume) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 init.u.req.init_flags =3D PTM_INIT_FLAG_DELET=
E_VOLATILE;<br>
-+=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0if (TPM_PASSTHROUGH_USES_CUSE_<wbr>TPM(tpm_pt)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(tpm_pt-&gt;tpm_fd, PTM_INIT, &=
amp;init) &lt; 0) {<br>
-@@ -394,7 +407,7 @@ static int tpm_passthrough_startup_tpm(<wbr>TPMBackend=
 *tb)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_passthrough_worker_thread,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_pt-&gt;tpm_thread_params);<b=
r>
-<br>
--=C2=A0 =C2=A0 tpm_passthrough_cuse_init(tpm_<wbr>pt);<br>
-+=C2=A0 =C2=A0 tpm_passthrough_cuse_init(tpm_<wbr>pt, false);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
-@@ -466,6 +479,32 @@ static int tpm_passthrough_reset_tpm_<wbr>established=
_flag(TPMBackend *tb,<br>
-=C2=A0 =C2=A0 =C2=A0return rc;<br>
- }<br>
-<br>
-+static int tpm_cuse_get_state_blobs(<wbr>TPMBackend *tb,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool decrypted_blobs,<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMBlobBuffers *tpm_bl=
obs)<br>
-+{<br>
-+=C2=A0 =C2=A0 TPMPassthruState *tpm_pt =3D TPM_PASSTHROUGH(tb);<br>
-+<br>
-+=C2=A0 =C2=A0 assert(TPM_PASSTHROUGH_USES_<wbr>CUSE_TPM(tpm_pt));<br>
-+<br>
-+=C2=A0 =C2=A0 return tpm_util_cuse_get_state_blobs(<wbr>tpm_pt-&gt;tpm_fd=
, decrypted_blobs,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tp=
m_blobs);<br>
-+}<br>
-+<br>
-+static int tpm_cuse_set_state_blobs(<wbr>TPMBackend *tb,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMBlobBuffers *tpm_bl=
obs)<br>
-+{<br>
-+=C2=A0 =C2=A0 TPMPassthruState *tpm_pt =3D TPM_PASSTHROUGH(tb);<br>
-+<br>
-+=C2=A0 =C2=A0 assert(TPM_PASSTHROUGH_USES_<wbr>CUSE_TPM(tpm_pt));<br>
-+<br>
-+=C2=A0 =C2=A0 if (tpm_util_cuse_set_state_<wbr>blobs(tpm_pt-&gt;tpm_fd, t=
pm_blobs)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 return tpm_passthrough_cuse_init(tpm_<wbr>pt, true);<br>
-+}<br>
-+<br>
- static bool tpm_passthrough_get_startup_<wbr>error(TPMBackend *tb)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0TPMPassthruState *tpm_pt =3D TPM_PASSTHROUGH(tb);<br>
-@@ -488,7 +527,7 @@ static void tpm_passthrough_deliver_<wbr>request(TPMBa=
ckend *tb)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0TPMPassthruState *tpm_pt =3D TPM_PASSTHROUGH(tb);<br>
-<br>
--=C2=A0 =C2=A0 /* TPM considered busy once TPM Request scheduled for proce=
ssing */<br>
-+=C2=A0 =C2=A0 /* TPM considered busy once TPM request scheduled for proce=
ssing */<br>
-=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;tpm_pt-&gt;<wbr>state_lock);<br>
-=C2=A0 =C2=A0 =C2=A0tpm_pt-&gt;tpm_busy =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock(&amp;tpm_pt-&gt;<wbr>state_lock);<br=
>
-@@ -601,6 +640,25 @@ static int tpm_passthrough_open_sysfs_<wbr>cancel(TPM=
Backend *tb)<br>
-=C2=A0 =C2=A0 =C2=A0return fd;<br>
- }<br>
-<br>
-+static void tpm_passthrough_block_<wbr>migration(TPMPassthruState *tpm_pt=
)<br>
-+{<br>
-+=C2=A0 =C2=A0 ptm_cap caps;<br>
-+<br>
-+=C2=A0 =C2=A0 if (TPM_PASSTHROUGH_USES_CUSE_<wbr>TPM(tpm_pt)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 caps =3D PTM_CAP_GET_STATEBLOB | PTM_CAP_SET_=
STATEBLOB |<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PTM_CAP_STOP;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!TPM_CUSE_IMPLEMENTS_ALL(tpm_<wbr>pt, cap=
s)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;tpm_pt-&gt;migr=
ation_<wbr>blocker,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Migration disabled: CUSE TPM lacks necessary capabilities&q=
uot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 migrate_add_blocker(tpm_pt-&gt;=
<wbr>migration_blocker);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;tpm_pt-&gt;migration_<wbr>blo=
cker,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quo=
t;Migration disabled: Passthrough TPM does not support migration&quot;);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 migrate_add_blocker(tpm_pt-&gt;<wbr>migration=
_blocker);<br>
-+=C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
- static int tpm_passthrough_handle_device_<wbr>opts(QemuOpts *opts, TPMBac=
kend *tb)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0TPMPassthruState *tpm_pt =3D TPM_PASSTHROUGH(tb);<br>
-@@ -642,7 +700,7 @@ static int tpm_passthrough_handle_device_<wbr>opts(Qem=
uOpts *opts, TPMBackend *tb)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_close_tpmdev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* init TPM for probing */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tpm_passthrough_cuse_init(<wbr>tpm_pt)) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tpm_passthrough_cuse_init(<wbr>tpm_pt, fa=
lse)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_close_tpmdev;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-@@ -659,6 +717,7 @@ static int tpm_passthrough_handle_device_<wbr>opts(Qem=
uOpts *opts, TPMBackend *tb)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-+=C2=A0 =C2=A0 tpm_passthrough_block_<wbr>migration(tpm_pt);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0return 0;<br>
-<br>
-@@ -766,10 +825,13 @@ static void tpm_passthrough_inst_init(<wbr>Object *o=
bj)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0qemu_mutex_init(&amp;tpm_pt-&gt;<wbr>state_lock);<br>
-=C2=A0 =C2=A0 =C2=A0qemu_cond_init(&amp;tpm_pt-&gt;cmd_<wbr>complete);<br>
-+<br>
-+=C2=A0 =C2=A0 vmstate_register(NULL, -1, &amp;vmstate_tpm_cuse, obj);<br>
- }<br>
-<br>
- static void tpm_passthrough_inst_finalize(<wbr>Object *obj)<br>
- {<br>
-+=C2=A0 =C2=A0 vmstate_unregister(NULL, &amp;vmstate_tpm_cuse, obj);<br>
- }<br>
-<br>
- static void tpm_passthrough_class_init(<wbr>ObjectClass *klass, void *dat=
a)<br>
-@@ -802,6 +864,60 @@ static const char *tpm_passthrough_cuse_create_<wbr>d=
esc(void)<br>
-=C2=A0 =C2=A0 =C2=A0return &quot;CUSE TPM backend driver&quot;;<br>
- }<br>
-<br>
-+static void tpm_cuse_pre_save(void *opaque)<br>
-+{<br>
-+=C2=A0 =C2=A0 TPMPassthruState *tpm_pt =3D opaque;<br>
-+=C2=A0 =C2=A0 TPMBackend *tb =3D &amp;tpm_pt-&gt;parent;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;tpm_pt-&gt;<wbr>state_lock);<br>
-+=C2=A0 =C2=A0 =C2=A0/* wait for TPM to finish processing */<br>
-+=C2=A0 =C2=A0 =C2=A0if (tpm_pt-&gt;tpm_busy) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(&amp;tpm_pt-&gt;cmd_<wbr>compl=
ete, &amp;tpm_pt-&gt;state_lock);<br>
-+=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock(&amp;tpm_pt-&gt;<wbr>state_lock);<b=
r>
-+<br>
-+=C2=A0 =C2=A0 /* get the decrypted state blobs from the TPM */<br>
-+=C2=A0 =C2=A0 tpm_cuse_get_state_blobs(tb, TRUE, &amp;tpm_pt-&gt;tpm_blob=
s);<br>
-+}<br>
-+<br>
-+static int tpm_cuse_post_load(void *opaque,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int version_id __attribute__((unused)))<br>
-+{<br>
-+=C2=A0 =C2=A0 TPMPassthruState *tpm_pt =3D opaque;<br>
-+=C2=A0 =C2=A0 TPMBackend *tb =3D &amp;tpm_pt-&gt;parent;<br>
-+<br>
-+=C2=A0 =C2=A0 return tpm_cuse_set_state_blobs(tb, &amp;tpm_pt-&gt;tpm_blo=
bs);<br>
-+}<br>
-+<br>
-+static const VMStateDescription vmstate_tpm_cuse =3D {<br>
-+=C2=A0 =C2=A0 .name =3D &quot;cuse-tpm&quot;,<br>
-+=C2=A0 =C2=A0 .version_id =3D 1,<br>
-+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
-+=C2=A0 =C2=A0 .minimum_version_id_old =3D 0,<br>
-+=C2=A0 =C2=A0 .pre_save=C2=A0 =3D tpm_cuse_pre_save,<br>
-+=C2=A0 =C2=A0 .post_load =3D tpm_cuse_post_load,<br>
-+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tpm_blobs.<wbr>permanent_flags=
, TPMPassthruState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tpm_blobs.<wbr>permanent.size,=
 TPMPassthruState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VBUFFER_ALLOC_UINT32(<wbr>tpm_blobs.p=
ermanent.buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPMPassthruState=
, 1, NULL, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_blobs.perman=
ent.size),<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tpm_blobs.<wbr>volatil_flags, =
TPMPassthruState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tpm_blobs.<wbr>volatil.size, T=
PMPassthruState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VBUFFER_ALLOC_UINT32(<wbr>tpm_blobs.v=
olatil.buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPMPassthruState=
, 1, NULL, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_blobs.volati=
l.size),<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tpm_blobs.<wbr>savestate_flags=
, TPMPassthruState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tpm_blobs.<wbr>savestate.size,=
 TPMPassthruState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_VBUFFER_ALLOC_UINT32(<wbr>tpm_blobs.s=
avestate.buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TPMPassthruState=
, 1, NULL, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_blobs.savest=
ate.size),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
-+=C2=A0 =C2=A0 }<br>
-+};<br>
-+<br>
- static const TPMDriverOps tpm_cuse_driver =3D {<br>
-=C2=A0 =C2=A0 =C2=A0.type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TPM_TYPE_CUSE_TPM,<br>
-=C2=A0 =C2=A0 =C2=A0.opts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D tpm_passthrough_cmdline_opts,<br>
-diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c<br>
-index 14d9e83ea2..9b660cf737 100644<br>
---- a/hw/tpm/tpm_tis.c<br>
-+++ b/hw/tpm/tpm_tis.c<br>
-@@ -368,6 +368,8 @@ static void tpm_tis_receive_bh(void *opaque)<br>
-=C2=A0 =C2=A0 =C2=A0TPMTISEmuState *tis =3D &amp;s-&gt;s.tis;<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t locty =3D s-&gt;locty_number;<br>
-<br>
-+=C2=A0 =C2=A0 tis-&gt;bh_scheduled =3D false;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0qemu_mutex_lock(&amp;s-&gt;state_<wbr>lock);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0tpm_tis_sts_set(&amp;tis-&gt;loc[<wbr>locty],<br>
-@@ -415,6 +417,8 @@ static void tpm_tis_receive_cb(TPMState *s, uint8_t lo=
cty,<br>
-=C2=A0 =C2=A0 =C2=A0qemu_mutex_unlock(&amp;s-&gt;state_<wbr>lock);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0qemu_bh_schedule(tis-&gt;bh);<br>
-+<br>
-+=C2=A0 =C2=A0 tis-&gt;bh_scheduled =3D true;<br>
- }<br>
-<br>
- /*<br>
-@@ -1030,9 +1034,140 @@ static void tpm_tis_reset(DeviceState *dev)<br>
-=C2=A0 =C2=A0 =C2=A0tpm_tis_do_startup_tpm(s);<br>
- }<br>
-<br>
-+<br>
-+/* persistent state handling */<br>
-+<br>
-+static void tpm_tis_pre_save(void *opaque)<br>
-+{<br>
-+=C2=A0 =C2=A0 TPMState *s =3D opaque;<br>
-+=C2=A0 =C2=A0 TPMTISEmuState *tis =3D &amp;s-&gt;s.tis;<br>
-+=C2=A0 =C2=A0 uint8_t locty =3D tis-&gt;active_locty;<br>
-+<br>
-+=C2=A0 =C2=A0 DPRINTF(&quot;tpm_tis: suspend: locty =3D %d : r_offset =3D=
 %d, w_offset =3D %d\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locty, tis-&gt;loc[0].r_offset,=
 tis-&gt;loc[0].w_offset);<br>
-+#ifdef DEBUG_TIS<br>
-+=C2=A0 =C2=A0 tpm_tis_dump_state(opaque, 0);<br>
-+#endif<br>
-+<br>
-+=C2=A0 =C2=A0 qemu_mutex_lock(&amp;s-&gt;state_<wbr>lock);<br>
-+<br>
-+=C2=A0 =C2=A0 /* wait for outstanding request to complete */<br>
-+=C2=A0 =C2=A0 if (TPM_TIS_IS_VALID_LOCTY(locty) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tis-&gt;loc[locty].state =3D=3D TPM_TIS_STATE=
_EXECUTION) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we get here when the bh is schedul=
ed but did not run,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we won&#39;t get notified...<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tis-&gt;bh_scheduled) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* backend thread to notify us =
*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_cond_wait(&amp;s-&gt;cmd_<=
wbr>complete, &amp;s-&gt;state_lock);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tis-&gt;loc[locty].state =3D=3D TPM_TIS_S=
TATE_EXECUTION) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* bottom half did not run - ru=
n its function */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_unlock(&amp;s-&gt;st=
ate_<wbr>lock);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tpm_tis_receive_bh(opaque);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_mutex_lock(&amp;s-&gt;stat=
e_<wbr>lock);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;s-&gt;state_<wbr>lock);<br>
-+<br>
-+=C2=A0 =C2=A0 /* copy current active read or write buffer into the buffer=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0written to disk */<br>
-+=C2=A0 =C2=A0 if (TPM_TIS_IS_VALID_LOCTY(locty)<wbr>) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (tis-&gt;loc[locty].state) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TPM_TIS_STATE_RECEPTION:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(tis-&gt;buf,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tis-=
&gt;loc[locty].w_buffer.<wbr>buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIN(=
sizeof(tis-&gt;buf),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tis-&gt;loc[locty].w_buffer.size)<wbr>);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tis-&gt;offset =3D tis-&gt;loc[=
locty].w_offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TPM_TIS_STATE_COMPLETION:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(tis-&gt;buf,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tis-=
&gt;loc[locty].r_buffer.<wbr>buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIN(=
sizeof(tis-&gt;buf),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tis-&gt;loc[locty].r_buffer.size)<wbr>);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tis-&gt;offset =3D tis-&gt;loc[=
locty].r_offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* leak nothing */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(tis-&gt;buf, 0x0, sizeof=
(tis-&gt;buf));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+}<br>
-+<br>
-+static int tpm_tis_post_load(void *opaque,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int version_id __attribute__((unused)))<br>
-+{<br>
-+=C2=A0 =C2=A0 TPMState *s =3D opaque;<br>
-+=C2=A0 =C2=A0 TPMTISEmuState *tis =3D &amp;s-&gt;s.tis;<br>
-+<br>
-+=C2=A0 =C2=A0 uint8_t locty =3D tis-&gt;active_locty;<br>
-+<br>
-+=C2=A0 =C2=A0 if (TPM_TIS_IS_VALID_LOCTY(locty)<wbr>) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (tis-&gt;loc[locty].state) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TPM_TIS_STATE_RECEPTION:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(tis-&gt;loc[locty].w_<wb=
r>buffer.buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tis-=
&gt;buf,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIN(=
sizeof(tis-&gt;buf),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tis-&gt;loc[locty].w_buffer.size)<wbr>);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tis-&gt;loc[locty].w_offset =3D=
 tis-&gt;offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TPM_TIS_STATE_COMPLETION:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(tis-&gt;loc[locty].r_<wb=
r>buffer.buffer,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tis-=
&gt;buf,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIN(=
sizeof(tis-&gt;buf),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tis-&gt;loc[locty].r_buffer.size)<wbr>);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tis-&gt;loc[locty].r_offset =3D=
 tis-&gt;offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 DPRINTF(&quot;tpm_tis: resume : locty =3D %d : r_offset =3D=
 %d, w_offset =3D %d\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locty, tis-&gt;loc[0].r_offset,=
 tis-&gt;loc[0].w_offset);<br>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+static const VMStateDescription vmstate_locty =3D {<br>
-+=C2=A0 =C2=A0 .name =3D &quot;loc&quot;,<br>
-+=C2=A0 =C2=A0 .version_id =3D 1,<br>
-+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
-+=C2=A0 =C2=A0 .minimum_version_id_old =3D 0,<br>
-+=C2=A0 =C2=A0 .fields=C2=A0 =C2=A0 =C2=A0 =3D (VMStateField[]) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(state, TPMLocality),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(inte, TPMLocality),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(ints, TPMLocality),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(access, TPMLocality),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(sts, TPMLocality),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(iface_id, TPMLocality),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST(),<br>
-+=C2=A0 =C2=A0 }<br>
-+};<br>
-+<br>
- static const VMStateDescription vmstate_tpm_tis =3D {<br>
-=C2=A0 =C2=A0 =C2=A0.name =3D &quot;tpm&quot;,<br>
--=C2=A0 =C2=A0 .unmigratable =3D 1,<br>
-+=C2=A0 =C2=A0 .version_id =3D 1,<br>
-+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
-+=C2=A0 =C2=A0 .minimum_version_id_old =3D 0,<br>
-+=C2=A0 =C2=A0 .pre_save=C2=A0 =3D tpm_tis_pre_save,<br>
-+=C2=A0 =C2=A0 .post_load =3D tpm_tis_post_load,<br>
-+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(s.tis.offset, TPMState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_BUFFER(s.tis.buf, TPMState),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(s.tis.active_<wbr>locty, TPMSta=
te),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(s.tis.aborting_<wbr>locty, TPMS=
tate),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(s.tis.next_<wbr>locty, TPMState=
),<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_STRUCT_ARRAY(s.tis.<wbr>loc, TPMState=
, TPM_TIS_NUM_LOCALITIES, 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_locty, TPMLocality),<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
-+=C2=A0 =C2=A0 }<br>
- };<br>
-<br>
- static Property tpm_tis_properties[] =3D {<br>
-diff --git a/hw/tpm/tpm_tis.h b/hw/tpm/tpm_tis.h<br>
-index a1df41fa21..b7fc0ea1a9 100644<br>
---- a/hw/tpm/tpm_tis.h<br>
-+++ b/hw/tpm/tpm_tis.h<br>
-@@ -54,6 +54,8 @@ typedef struct TPMLocality {<br>
-<br>
- typedef struct TPMTISEmuState {<br>
-=C2=A0 =C2=A0 =C2=A0QEMUBH *bh;<br>
-+=C2=A0 =C2=A0 bool bh_scheduled; /* bh scheduled but did not run yet */<b=
r>
-+<br>
-=C2=A0 =C2=A0 =C2=A0uint32_t offset;<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t buf[TPM_TIS_BUFFER_MAX];<br>
-<br>
-diff --git a/hw/tpm/tpm_util.c b/hw/tpm/tpm_util.c<br>
-index 7b35429725..b6ff74d946 100644<br>
---- a/hw/tpm/tpm_util.c<br>
-+++ b/hw/tpm/tpm_util.c<br>
-@@ -22,6 +22,17 @@<br>
- #include &quot;qemu/osdep.h&quot;<br>
- #include &quot;tpm_util.h&quot;<br>
- #include &quot;tpm_int.h&quot;<br>
-+#include &quot;tpm_ioctl.h&quot;<br>
-+#include &quot;qemu/error-report.h&quot;<br>
-+<br>
-+#define DEBUG_TPM 0<br>
-+<br>
-+#define DPRINTF(fmt, ...) do { \<br>
-+=C2=A0 =C2=A0 if (DEBUG_TPM) { \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, fmt, ## __VA_ARGS__); \<br>
-+=C2=A0 =C2=A0 } \<br>
-+} while (0)<br>
-+<br>
-<br>
- /*<br>
-=C2=A0 * A basic test of a TPM device. We expect a well formatted response=
 header<br>
-@@ -125,3 +136,215 @@ int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm=
_version)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0return 1;<br>
- }<br>
-+<br>
-+static void tpm_sized_buffer_reset(<wbr>TPMSizedBuffer *tsb)<br>
-+{<br>
-+=C2=A0 =C2=A0 g_free(tsb-&gt;buffer);<br>
-+=C2=A0 =C2=A0 tsb-&gt;buffer =3D NULL;<br>
-+=C2=A0 =C2=A0 tsb-&gt;size =3D 0;<br>
-+}<br>
-+<br>
-+/*<br>
-+ * Transfer a TPM state blob from the TPM into a provided buffer.<br>
-+ *<br>
-+ * @fd: file descriptor to talk to the CUSE TPM<br>
-+ * @type: the type of blob to transfer<br>
-+ * @decrypted_blob: whether we request to receive decrypted blobs<br>
-+ * @tsb: the TPMSizeBuffer to fill with the blob<br>
-+ * @flags: the flags to return to the caller<br>
-+ */<br>
-+static int tpm_util_cuse_get_state_blob(<wbr>int fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t =
type,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool dec=
rypted_blob,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMSized=
Buffer *tsb,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 *flags)<br>
-+{<br>
-+=C2=A0 =C2=A0 ptm_getstate pgs;<br>
-+=C2=A0 =C2=A0 uint16_t offset =3D 0;<br>
-+=C2=A0 =C2=A0 ptm_res res;<br>
-+=C2=A0 =C2=A0 ssize_t n;<br>
-+=C2=A0 =C2=A0 size_t to_read;<br>
-+<br>
-+=C2=A0 =C2=A0 tpm_sized_buffer_reset(tsb);<br>
-+<br>
-+=C2=A0 =C2=A0 pgs.u.req.state_flags =3D (decrypted_blob) ? PTM_STATE_FLAG=
_DECRYPTED : 0;<br>
-+=C2=A0 =C2=A0 pgs.u.req.type =3D type;<br>
-+=C2=A0 =C2=A0 pgs.u.req.offset =3D offset;<br>
-+<br>
-+=C2=A0 =C2=A0 if (ioctl(fd, PTM_GET_STATEBLOB, &amp;pgs) &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;CUSE TPM PTM_GET_STATEBLOB=
 ioctl failed: %s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_exit;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 res =3D pgs.u.resp.tpm_result;<br>
-+=C2=A0 =C2=A0 if (res !=3D 0 &amp;&amp; (res &amp; 0x800) =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Getting the stateblob (typ=
e %d) failed with a TPM &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;error 0x%x&quot;, type, res);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_exit;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 *flags =3D pgs.u.resp.state_flags;<br>
-+<br>
-+=C2=A0 =C2=A0 tsb-&gt;buffer =3D g_malloc(pgs.u.resp.totlength)<wbr>;<br>
-+=C2=A0 =C2=A0 memcpy(tsb-&gt;buffer, pgs.u.resp.data, pgs.u.resp.length);=
<br>
-+=C2=A0 =C2=A0 tsb-&gt;size =3D pgs.u.resp.length;<br>
-+<br>
-+=C2=A0 =C2=A0 /* if there are bytes left to get use read() interface */<b=
r>
-+=C2=A0 =C2=A0 while (tsb-&gt;size &lt; pgs.u.resp.totlength) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 to_read =3D pgs.u.resp.totlength - tsb-&gt;si=
ze;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(to_read &gt; SSIZE_MAX)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_read =3D SSIZE_MAX;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D read(fd, &amp;tsb-&gt;buffer[tsb-&gt;si=
ze], to_read);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n !=3D to_read) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not re=
ad stateblob (type %d) : %s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0type, strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_exit;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tsb-&gt;size +=3D to_read;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 DPRINTF(&quot;tpm_util: got state blob type %d, %d bytes, f=
lags 0x%08x, &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;decrypted=3D%d\n&quot;, t=
ype, tsb-&gt;size, *flags, decrypted_blob);<br>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
-+<br>
-+err_exit:<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+}<br>
-+<br>
-+int tpm_util_cuse_get_state_blobs(<wbr>int tpm_fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool decrypted_blobs,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMBlobBuffers *tpm_blobs)<br=
>
-+{<br>
-+=C2=A0 =C2=A0 if (tpm_util_cuse_get_state_blob(<wbr>tpm_fd, PTM_BLOB_TYPE=
_PERMANENT,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decrypted_blobs,=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;permanent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;permanent_flags) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_util_cuse_get_state_blob(<wbr>tpm_fd, PTM_=
BLOB_TYPE_VOLATILE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decrypted_blobs,=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;volatil,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;volatil_flags) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_util_cuse_get_state_blob(<wbr>tpm_fd, PTM_=
BLOB_TYPE_SAVESTATE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decrypted_blobs,=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;savestate,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;savestate_flags)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_exit;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
-+<br>
-+ err_exit:<br>
-+=C2=A0 =C2=A0 tpm_sized_buffer_reset(&amp;tpm_<wbr>blobs-&gt;volatil);<br=
>
-+=C2=A0 =C2=A0 tpm_sized_buffer_reset(&amp;tpm_<wbr>blobs-&gt;permanent);<=
br>
-+=C2=A0 =C2=A0 tpm_sized_buffer_reset(&amp;tpm_<wbr>blobs-&gt;savestate);<=
br>
-+<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+}<br>
-+<br>
-+static int tpm_util_cuse_do_set_<wbr>stateblob_ioctl(int fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 uint32_t flags,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 uint32_t type,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 uint32_t length)<br>
-+{<br>
-+=C2=A0 =C2=A0 ptm_setstate pss;<br>
-+<br>
-+=C2=A0 =C2=A0 pss.u.req.state_flags =3D flags;<br>
-+=C2=A0 =C2=A0 pss.u.req.type =3D type;<br>
-+=C2=A0 =C2=A0 pss.u.req.length =3D length;<br>
-+<br>
-+=C2=A0 =C2=A0 if (ioctl(fd, PTM_SET_STATEBLOB, &amp;pss) &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;CUSE TPM PTM_SET_STATEBLOB=
 ioctl failed: %s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 if (pss.u.resp.tpm_result !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Setting the stateblob (typ=
e %d) failed with a TPM &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;error 0x%x&quot;, type, pss.u.resp.tpm_result);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+<br>
-+/*<br>
-+ * Transfer a TPM state blob to the CUSE TPM.<br>
-+ *<br>
-+ * @fd: file descriptor to talk to the CUSE TPM<br>
-+ * @type: the type of TPM state blob to transfer<br>
-+ * @tsb: TPMSizeBuffer containing the TPM state blob<br>
-+ * @flags: Flags describing the (encryption) state of the TPM state blob<=
br>
-+ */<br>
-+static int tpm_util_cuse_set_state_blob(<wbr>int fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 type,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMSized=
Buffer *tsb,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t=
 flags)<br>
-+{<br>
-+=C2=A0 =C2=A0 uint32_t offset =3D 0;<br>
-+=C2=A0 =C2=A0 ssize_t n;<br>
-+=C2=A0 =C2=A0 size_t to_write;<br>
-+<br>
-+=C2=A0 =C2=A0 /* initiate the transfer to the CUSE TPM */<br>
-+=C2=A0 =C2=A0 if (tpm_util_cuse_do_set_<wbr>stateblob_ioctl(fd, flags, ty=
pe, 0)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 /* use the write() interface for transferring the state blo=
b */<br>
-+=C2=A0 =C2=A0 while (offset &lt; tsb-&gt;size) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 to_write =3D tsb-&gt;size - offset;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(to_write &gt; SSIZE_MAX)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_write =3D SSIZE_MAX;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D write(fd, &amp;tsb-&gt;buffer[offset], =
to_write);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n !=3D to_write) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Writing the =
stateblob (type %d) failed: %s&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0type, strerror(errno));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_exit;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D to_write;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 /* inidicate that the transfer is finished */<br>
-+=C2=A0 =C2=A0 if (tpm_util_cuse_do_set_<wbr>stateblob_ioctl(fd, flags, ty=
pe, 0)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_exit;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 DPRINTF(&quot;tpm_util: set the state blob type %d, %d byte=
s, flags 0x%08x\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type, tsb-&gt;size, flags);<br>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
-+<br>
-+err_exit:<br>
-+=C2=A0 =C2=A0 return 1;<br>
-+}<br>
-+<br>
-+int tpm_util_cuse_set_state_blobs(<wbr>int tpm_fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMBlobBuffers *tpm_blobs)<br=
>
-+{<br>
-+=C2=A0 =C2=A0 ptm_res res;<br>
-+<br>
-+=C2=A0 =C2=A0 if (ioctl(tpm_fd, PTM_STOP, &amp;res) &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;tpm_passthrough: Could not=
 stop &quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;the CUSE TPM: %s (%i)&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0strerror(errno), errno);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 if (tpm_util_cuse_set_state_blob(<wbr>tpm_fd, PTM_BLOB_TYPE=
_PERMANENT,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;permanent,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_blobs-&gt;pe=
rmanent_flags) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tpm_util_cuse_set_state_blob(<wbr>tpm_fd, PTM=
_BLOB_TYPE_VOLATILE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;volatil,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_blobs-&gt;vo=
latil_flags) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tpm_util_cuse_set_state_blob(<wbr>tpm_fd, PTM=
_BLOB_TYPE_SAVESTATE,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tpm_blobs-&=
gt;savestate,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tpm_blobs-&gt;sa=
vestate_flags)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 return 0;<br>
-+}<br>
-diff --git a/hw/tpm/tpm_util.h b/hw/tpm/tpm_util.h<br>
-index df76245e6e..c24071d812 100644<br>
---- a/hw/tpm/tpm_util.h<br>
-+++ b/hw/tpm/tpm_util.h<br>
-@@ -26,4 +26,11 @@<br>
-<br>
- int tpm_util_test_tpmdev(int tpm_fd, TPMVersion *tpm_version);<br>
-<br>
-+int tpm_util_cuse_get_state_blobs(<wbr>int tpm_fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool decrypted_blobs,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMBlobBuffers *tpm_blobs);<b=
r>
-+<br>
-+int tpm_util_cuse_set_state_blobs(<wbr>int tpm_fd,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TPMBlobBuffers *tpm_blobs);<b=
r>
-+<br>
- #endif /* TPM_TPM_UTIL_H */<br>
-diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h<b=
r>
-index b58f52d39f..3403821b9d 100644<br>
---- a/include/sysemu/tpm_backend.h<br>
-+++ b/include/sysemu/tpm_backend.h<br>
-@@ -62,6 +62,18 @@ typedef struct TPMSizedBuffer {<br>
-=C2=A0 =C2=A0 =C2=A0uint8_t=C2=A0 *buffer;<br>
- } TPMSizedBuffer;<br>
-<br>
-+/* blobs from the TPM; part of VM state when migrating */<br>
-+typedef struct TPMBlobBuffers {<br>
-+=C2=A0 =C2=A0 uint32_t permanent_flags;<br>
-+=C2=A0 =C2=A0 TPMSizedBuffer permanent;<br>
-+<br>
-+=C2=A0 =C2=A0 uint32_t volatil_flags;<br>
-+=C2=A0 =C2=A0 TPMSizedBuffer volatil;<br>
-+<br>
-+=C2=A0 =C2=A0 uint32_t savestate_flags;<br>
-+=C2=A0 =C2=A0 TPMSizedBuffer savestate;<br>
-+} TPMBlobBuffers;<br>
-+<br>
- struct TPMDriverOps {<br>
-=C2=A0 =C2=A0 =C2=A0enum TpmType type;<br>
-=C2=A0 =C2=A0 =C2=A0const QemuOptDesc *opts;<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-makefile-<wb=
r>v10.patch b/meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-makefile-<w=
br>v10.patch<br>
new file mode 100644<br>
index 0000000..e963982<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-makefile-<wbr>v10.p=
atch<br>
@@ -0,0 +1,28 @@<br>
+From 4201a5791fc4798a45a9b9f881602d<wbr>7bacb74ed1 Mon Sep 17 00:00:00 200=
1<br>
+From: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.=
bystricky@intel.com</a>&gt;<br>
+Date: Thu, 31 Aug 2017 11:06:56 -0700<br>
+Subject: Add subpackage -ptest which runs all unit test cases for qemu.<br=
>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
+<br>
+Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.c=
om">juro.bystricky@intel.com</a>&gt;<br>
+<br>
+diff --git a/tests/Makefile.include b/tests/Makefile.include<br>
+index f08b741..3d1b3e9 100644<br>
+--- a/tests/Makefile.include<br>
++++ b/tests/Makefile.include<br>
+@@ -924,4 +924,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)<br>
+ -include $(wildcard tests/*.d)<br>
+ -include $(wildcard tests/libqos/*.d)<br>
+<br>
++buildtest-TESTS: $(check-unit-y)<br>
++<br>
++runtest-TESTS:<br>
++=C2=A0 =C2=A0 =C2=A0 for f in $(check-unit-y); do \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nf=3D$$(echo $$f | sed &=
#39;s/tests\//\.\//g&#39;); \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $$nf; \<br>
++=C2=A0 =C2=A0 =C2=A0 done<br>
++<br>
+ endif<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-makefile.<wb=
r>patch b/meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-makefile.<wbr>p=
atch<br>
deleted file mode 100644<br>
index 2ce3478..0000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/add-ptest-in-makefile.<wbr>patch=
<br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Add subpackage -ptest which runs all unit test cases for qemu.<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
----<br>
- tests/Makefile.include | 8 ++++++++<br>
- 1 file changed, 8 insertions(+)<br>
-<br>
-diff --git a/tests/Makefile.include b/tests/Makefile.include<br>
-index 14be491..0fce37a 100644<br>
---- a/tests/Makefile.include<br>
-+++ b/tests/Makefile.include<br>
-@@ -776,3 +776,11 @@ all: $(QEMU_IOTESTS_HELPERS-y)<br>
-<br>
- -include $(wildcard tests/*.d)<br>
- -include $(wildcard tests/libqos/*.d)<br>
-+<br>
-+buildtest-TESTS: $(check-unit-y)<br>
-+<br>
-+runtest-TESTS:<br>
-+=C2=A0 =C2=A0 =C2=A0 for f in $(check-unit-y); do \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nf=3D$$(echo $$f | sed &=
#39;s/tests\//\.\//g&#39;); \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $$nf; \<br>
-+=C2=A0 =C2=A0 =C2=A0 done<br>
---<br>
-2.9.0<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0-rc2.b=
b" rel=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.10.0-rc2.bb</a> b/meta/=
recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0-rc2.bb" rel=3D"noreferr=
er" target=3D"_blank">q<wbr>emu_2.10.0-rc2.bb</a><br>
deleted file mode 100644<br>
index 204e36f..0000000<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0-rc2.bb" rel=
=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.10.0-rc2.bb</a><br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-require qemu.inc<br>
-<br>
-inherit ptest<br>
-<br>
-RDEPENDS_${PN}-ptest =3D &quot;bash make&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>441c28d2cf86e15a37fa4=
7e15a72fb<wbr>ac \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LIB;endline=3D24;<wbr>md5=3D<wbr>c04def7ae38850e7d3ef5485881599<=
wbr>13&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://wiki.qemu-project.org/download/${BP}.t=
ar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.qemu-project.org/<=
wbr>download/${BP}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://powerpc_rom.bin \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-grabs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://exclude-some-arm-EABI-<wbr=
>obsolete-syscalls.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://wacom.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-ptest-in-makefile.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-enlarge-env-entry-<wb=
r>size.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-valgrind.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pathlimit.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-2.5.0-cflags.patch \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc-2.25.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Provide-support-<wbr>=
for-the-CUSE-TPM.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Introduce-<wbr>condit=
ion-to-notify-waiters-<wbr>of-completed-c.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Introduce-<wbr>condit=
ion-in-TPM-backend-for-<wbr>notification.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Add-support-for-<wbr>=
VM-suspend-resume-for-TPM-TIS-<wbr>v2.9.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://apic-fixup-fallthrough-<wb=
r>to-PIC.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-osdep-Add-runtime-<wb=
r>OFD-lock-detection.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-file-posix-Do-<wbr>ru=
ntime-check-for-ofd-lock-<wbr>API.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+\..*)\.tar&quot;<br>
-<br>
-<br>
-SRC_URI_append_class-native =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-libcap-header-<wbr>is=
sue-on-some-distro.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cpus.c-qemu_cpu_kick_<wbr=
>thread_debugging.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>634c498476e4b5643cf7a89e7416d0<wbr>ae&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>9f8aaa2839634a2226a49d0f305ef9<wbr>22a7b=
0bc850d343aaee41948fd6f45<wbr>700a&quot;<br>
-<br>
-COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
-COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
-<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 # Prevent QA warnings about installed ${localstatedir}/run<b=
r>
-=C2=A0 =C2=A0 if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localst=
atedir}/run; fi<br>
-=C2=A0 =C2=A0 install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/q=
emu<br>
-}<br>
-<br>
-do_compile_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0make buildtest-TESTS<br>
-}<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rL ${B}/tests ${D}${PTEST_PATH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests -type f -name &quo=
t;*.[Sshcod]&quot; | xargs -i rm -rf {}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/tests/Makefile.include ${D}${PTEST_PATH=
}/tests<br>
-}<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0.bb" r=
el=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.10.0.bb</a> b/meta/recipes-=
devtools/qemu/<a href=3D"http://qemu_2.10.0.bb" rel=3D"noreferrer" target=
=3D"_blank">q<wbr>emu_2.10.0.bb</a><br>
new file mode 100644<br>
index 0000000..835577a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.10.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">q<wbr>emu_2.10.0.bb</a><br>
@@ -0,0 +1,58 @@<br>
+require qemu.inc<br>
+<br>
+inherit ptest<br>
+<br>
+RDEPENDS_${PN}-ptest =3D &quot;bash make&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>441c28d2cf86e15a37fa4=
7e15a72fb<wbr>ac \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LIB;endline=3D24;<wbr>md5=3D<wbr>c04def7ae38850e7d3ef5485881599<=
wbr>13&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://wiki.qemu-project.org/download/${BP}.t=
ar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.qemu-project.org/<=
wbr>download/${BP}.tar.bz2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://powerpc_rom.bin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-grabs.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://exclude-some-arm-EABI-<wbr=
>obsolete-syscalls.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://wacom.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-ptest-in-makefile-<wbr=
>v10.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-enlarge-env-entry-<wb=
r>size.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-valgrind.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pathlimit.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-2.5.0-cflags.patch \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc-2.25.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Provide-support-<wbr>=
for-the-CUSE-TPM.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Introduce-<wbr>condit=
ion-to-notify-waiters-<wbr>of-completed-c.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Introduce-<wbr>condit=
ion-in-TPM-backend-for-<wbr>notification.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Add-support-for-<wbr>=
VM-suspend-resume-for-TPM-TIS-<wbr>v2.9.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://apic-fixup-fallthrough-<wb=
r>to-PIC.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+\..*)\.tar&quot;<br>
+<br>
+<br>
+SRC_URI_append_class-native =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-libcap-header-<wbr>is=
sue-on-some-distro.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cpus.c-qemu_cpu_kick_<wbr=
>thread_debugging.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>ca73441de73a9b52c6c49c97190d21<wbr>85&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>7e9f39e1306e6dcc595494e91c1464<wbr>d4b03=
f55ddd2053183e0e1b69f7f77<wbr>6d48&quot;<br>
+<br>
+COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
+COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 # Prevent QA warnings about installed ${localstatedir}/run<b=
r>
+=C2=A0 =C2=A0 if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localst=
atedir}/run; fi<br>
+=C2=A0 =C2=A0 install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/q=
emu<br>
+}<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0make buildtest-TESTS<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rL ${B}/tests ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests -type f -name &quo=
t;*.[Sshcod]&quot; | xargs -i rm -rf {}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/tests/Makefile.include ${D}${PTEST_PATH=
}/tests<br>
+}<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.8.1.1.bb" =
rel=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.8.1.1.bb</a> b/meta/recipe=
s-devtools/qemu/<a href=3D"http://qemu_2.8.1.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">q<wbr>emu_2.8.1.1.bb</a><br>
deleted file mode 100644<br>
index a4ddb7f..0000000<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.8.1.1.bb" rel=3D"=
noreferrer" target=3D"_blank">q<wbr>emu_2.8.1.1.bb</a><br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-require qemu.inc<br>
-<br>
-inherit ptest<br>
-<br>
-RDEPENDS_${PN}-ptest =3D &quot;bash make&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>441c28d2cf86e15a37fa4=
7e15a72fb<wbr>ac \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LIB;endline=3D24;<wbr>md5=3D<wbr>c04def7ae38850e7d3ef5485881599<=
wbr>13&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://wiki.qemu-project.org/download/${BP}.t=
ar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.qemu-project.org/<=
wbr>download/${BP}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://powerpc_rom.bin \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-grabs.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://exclude-some-arm-EABI-<wbr=
>obsolete-syscalls.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://wacom.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-ptest-in-makefile.<wbr=
>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure-fix-Darwin-<wbr>=
target-detection.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-enlarge-env-entry-<wb=
r>size.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-valgrind.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pathlimit.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-2.5.0-cflags.patch \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc-2.25.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Provide-support-<wbr>=
for-the-CUSE-TPM.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Introduce-<wbr>condit=
ion-to-notify-waiters-<wbr>of-completed-c.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Introduce-<wbr>condit=
ion-in-TPM-backend-for-<wbr>notification.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Add-support-for-<wbr>=
VM-suspend-resume-for-TPM-TIS.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-9908.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-9912.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-replace-struct-<wbr>u=
context-with-ucontext_t-type.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://apic-fixup-fallthrough-<wb=
r>to-PIC.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-SRC_URI_append_class-native =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-libcap-header-<wbr>is=
sue-on-some-distro.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cpus.c-qemu_cpu_kick_<wbr=
>thread_debugging.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<wbr>a6a23a0c59fd0f8ec564b0fb89a799<wbr>54&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>f62ab18a1fb9ff5b4c81ed44becc94<wbr>5b115=
81eff777618141bdb787da55d<wbr>3638&quot;<br>
-<br>
-COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
-COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
-<br>
-do_install_append() {<br>
-=C2=A0 =C2=A0 # Prevent QA warnings about installed ${localstatedir}/run<b=
r>
-=C2=A0 =C2=A0 if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localst=
atedir}/run; fi<br>
-=C2=A0 =C2=A0 install -Dm 0755 ${WORKDIR}/powerpc_rom.bin ${D}${datadir}/q=
emu<br>
-}<br>
-<br>
-do_compile_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0make buildtest-TESTS<br>
-}<br>
-<br>
-do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -rL ${B}/tests ${D}${PTEST_PATH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests -type f -name &quo=
t;*.[Sshcod]&quot; | xargs -i rm -rf {}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/tests/Makefile.include ${D}${PTEST_PATH=
}/tests<br>
-}<br>
-<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403043ed118016a6505581de05e--
