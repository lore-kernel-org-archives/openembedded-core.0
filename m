Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.22852.1627645515840637571
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQ2hmDzL;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id l18so10953219wrv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0kimIpljjzU7xSWfGv22U/lpOXCpEBrB44gqAKmnp8=;
        b=WQ2hmDzLtSHfV6C4wOD5H2C/hii2Her2iu70DC4e2oeq4C8oZDnc+di4GGI6qjG9fk
         Nu7A8chNlptshGpXeFVWuq2/pskHBPsk6ebPUH5PnsLI4bL+P4SrqyJ2XRnR2VMgbJRi
         uM0wvNS1pXzP4O3X43zLmpkQ5iveK0Kj3BT8DijTmk0lq5u447vv43MKjlliT1y8184S
         Ll/OdHLvaiQcIwbrbr/HFEjIxibNnIfVUFn+E6srAczzWzkB3pV0SsdqwbN9+HE2cIlp
         vj4wz8vtm8V8AlVmT/BTow9tHcf/vEz/nNG1YhwZqW8zXSH+0fSVd9NahVK/+Wo2WU3Q
         h9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0kimIpljjzU7xSWfGv22U/lpOXCpEBrB44gqAKmnp8=;
        b=jlAL6u5+kn7wOZLK6U1/kYYhpYmmNx72vq4TkE8jvSWlyYkw5elzeSINT0wg6CfimP
         fTB9e4GI6XuhchsLTBkbBksaX1HYJ6PckUgBIhDGzK4TYDXHBvhJo3XO5XF89TdIo6BV
         ElBNEfebVeC++WAJ6a+bCIW497re9IN8E0ewgrFX/Vf5QuTsm9m5oJ/C2BzNZOCJ69oP
         sdc4+Tu6MWdzYGezsPLT/9+G5afmzUyGlFsn3BZcfSZ0l5/b6HPnOZ+sjs7s5acCXlpo
         LGC15NpUqqffzKvP4xtNRRbgd7f9eK2kLxEm5hifZc3umnFPQa15uzvJqbU7zluza+hF
         fpcw==
X-Gm-Message-State: AOAM531dPDh7qw+0JNSToCB4Yw7d8WlWtUl9RWJR50+3LAwVTD+WGT0H
	ZFzAGEGBo309n0f8ex1CbJcCMREG9Cc=
X-Google-Smtp-Source: ABdhPJxsMsCL8hgvgv5NQ+Gtm3c+eqdJg8TlpfqQjrNx9xGmD9MfixKvjTAM6Ta0xUCHxru4vbIFow==
X-Received: by 2002:adf:f704:: with SMTP id r4mr2614852wrp.389.1627645514278;
        Fri, 30 Jul 2021 04:45:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/9] util-linux: update 2.37 -> 2.37.1
Date: Fri, 30 Jul 2021 13:45:01 +0200
Message-Id: <20210730114507.732448-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop backports.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d_2.37.bb => util-linux-libuuid_2.37.1.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  9 +-
 .../0001-login-fix-close_range-use.patch      | 62 -------------
 ...74160b96498d672e3652827aa7e6d7f3a120.patch | 29 ------
 .../util-linux/tests-blkdiscard.patch         | 31 -------
 .../util-linux/util-linux/tests-eject.patch   | 56 ------------
 .../util-linux/util-linux/tests-kill.patch    | 88 -------------------
 .../util-linux/util-linux/tests-lscpu.patch   | 42 ---------
 .../util-linux/util-linux/tests-ul.patch      | 35 --------
 ...til-linux_2.37.bb => util-linux_2.37.1.bb} |  0
 10 files changed, 1 insertion(+), 351 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.bb => util-linux-libuuid_2.37.1.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/tests-blkdiscard.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/tests-eject.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/tests-kill.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/tests-lscpu.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/tests-ul.patch
 rename meta/recipes-core/util-linux/{util-linux_2.37.bb => util-linux_2.37.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0648366baf..264c2e84f7 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,13 +35,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
-           file://8a3a74160b96498d672e3652827aa7e6d7f3a120.patch \
-           file://tests-kill.patch \
-           file://tests-blkdiscard.patch \
-           file://tests-ul.patch \
-           file://tests-eject.patch \
-           file://tests-lscpu.patch \
-           file://0001-login-fix-close_range-use.patch \
            "
 
-SRC_URI[sha256sum] = "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5"
+SRC_URI[sha256sum] = "8e4bd42053b726cf86eb4d13a73bc1d9225a2c2e1a2e0d2a891f1020f83e6b76"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch b/meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch
deleted file mode 100644
index 7a47597bd6..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-login-fix-close_range-use.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 76ae0badd3fd7c8653fa4d3c78d2dcfcec51d23d Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Wed, 14 Jul 2021 17:25:57 +0200
-Subject: [PATCH] login: fix close_range() use
-
-This new syscall comes with three arguments (see kernel commit
-278a5fbaed89dacd04e9d052f4594ffd0e0585de). Not sure why util-linux
-assume only two.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/b8d99a618baffb4fc03cda4c40e29778b6d77ad4]
-Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=1981729
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- include/fileutils.h | 4 ++--
- lib/fileutils.c     | 2 +-
- login-utils/login.c | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/include/fileutils.h b/include/fileutils.h
-index ad54b95..f86426b 100644
---- a/include/fileutils.h
-+++ b/include/fileutils.h
-@@ -82,9 +82,9 @@ static inline struct dirent *xreaddir(DIR *dp)
- # if defined(SYS_close_range)
- #  include <sys/types.h>
- #  ifndef HAVE_CLOSE_RANGE
--static inline int close_range(unsigned int first, unsigned int last)
-+static inline int close_range(unsigned int first, unsigned int last, int flags)
- {
--	return syscall(SYS_close_range, first, last);
-+	return syscall(SYS_close_range, first, last, flags);
- }
- #  endif
- #  define HAVE_CLOSE_RANGE 1
-diff --git a/lib/fileutils.c b/lib/fileutils.c
-index 846b718..a979b03 100644
---- a/lib/fileutils.c
-+++ b/lib/fileutils.c
-@@ -189,7 +189,7 @@ int main(int argc, char *argv[])
- 		ignore_result( dup(STDIN_FILENO) );
-
- # ifdef HAVE_CLOSE_RANGE
--		close_range(STDERR_FILENO + 1, ~0U);
-+		close_range(STDERR_FILENO + 1, ~0U, 0);
- # else
- 		ul_close_all_fds(STDERR_FILENO + 1, ~0U);
- # endif
-diff --git a/login-utils/login.c b/login-utils/login.c
-index 7fefd05..94a042d 100644
---- a/login-utils/login.c
-+++ b/login-utils/login.c
-@@ -1358,7 +1358,7 @@ static void initialize(int argc, char **argv, struct login_context *cxt)
- #endif
- 	}
- #ifdef HAVE_CLOSE_RANGE
--	close_range(STDERR_FILENO + 1, ~0U);
-+	close_range(STDERR_FILENO + 1, ~0U, 0);
- #else
- 	ul_close_all_fds(STDERR_FILENO + 1, ~0U);
- #endif
---
-2.32.0
diff --git a/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch b/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
deleted file mode 100644
index a5bb00ab65..0000000000
--- a/meta/recipes-core/util-linux/util-linux/8a3a74160b96498d672e3652827aa7e6d7f3a120.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8a3a74160b96498d672e3652827aa7e6d7f3a120 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 15 Jun 2021 12:04:43 +0200
-Subject: [PATCH] mkswap: fix holes detection (infinite loop and/or
- stack-buffer-underflow)
-
-Reported-by: Brian Lane <bcl@redhat.com>
-Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=1971877
-Fix: https://github.com/karelzak/util-linux/issues/1348
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- disk-utils/mkswap.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/disk-utils/mkswap.c b/disk-utils/mkswap.c
-index 27374fd72..c45a3a317 100644
---- a/disk-utils/mkswap.c
-+++ b/disk-utils/mkswap.c
-@@ -267,6 +267,8 @@ static void check_extents(struct mkswap_control *ctl)
- 			return;
- 
- 		n = fiemap->fm_mapped_extents;
-+		if (n == 0)
-+			break;
- 
- 		for (i = 0; i < n; i++) {
- 			struct fiemap_extent *e = &fiemap->fm_extents[i];
diff --git a/meta/recipes-core/util-linux/util-linux/tests-blkdiscard.patch b/meta/recipes-core/util-linux/util-linux/tests-blkdiscard.patch
deleted file mode 100644
index 34b07a4b2d..0000000000
--- a/meta/recipes-core/util-linux/util-linux/tests-blkdiscard.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 45fe65d934df2c938701f1c3cd3e0a6f3bdf25e6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 29 Jun 2021 18:10:40 +0100
-Subject: [PATCH] tests/blkdiscard: check correct log file for errors
-
-When checking if the discard ioctl is supported, look in stderr not stdout.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/ts/blkdiscard/offsets | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/ts/blkdiscard/offsets b/tests/ts/blkdiscard/offsets
-index 9dddc35e2..5e724d51b 100755
---- a/tests/ts/blkdiscard/offsets
-+++ b/tests/ts/blkdiscard/offsets
-@@ -48,7 +48,7 @@ ts_log "testing offsets with full block size"
- run_tscmd $TS_CMD_BLKDISCARD -v $DEVICE
- if [ "$?" != "0" ]; then
- 	# Skip the rest? For example loop backing files on NFS seem unsupported.
--	grep -q "BLKDISCARD ioctl failed: Operation not supported" "$TS_OUTPUT" \
-+	grep -q "BLKDISCARD ioctl failed: Operation not supported" "$TS_ERRLOG" \
- 		&& ts_skip "BLKDISCARD not supported"
- fi
- run_tscmd $TS_CMD_BLKDISCARD -v -o 1 $DEVICE
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/tests-eject.patch b/meta/recipes-core/util-linux/util-linux/tests-eject.patch
deleted file mode 100644
index 51e914d566..0000000000
--- a/meta/recipes-core/util-linux/util-linux/tests-eject.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Submitted [https://github.com/karelzak/util-linux/pull/1375]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dd956268ba89fc1caf83c45c3c495f34d261e0e2 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Thu, 1 Jul 2021 20:44:31 +0100
-Subject: [PATCH] test/eject: guard asan LD_PRELOAD with use-system-commands
- check
-
-This test tries to add asan to LD_PRELOAD because the just-built eject
-will call the host /bin/umount, and apparently asan doesn't like this.
-
-However, if ldd isn't present, this fails as the path to asan is the
-error message saying that ldd isn't present.
-
-As the asan workaround is only needed when executing the binaries that
-have just been built and not the system binaries, only use it if the
-test is on the built binaries.
-
-Closes #1373.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/ts/eject/umount | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/tests/ts/eject/umount b/tests/ts/eject/umount
-index a829d46c0..2be281ee3 100755
---- a/tests/ts/eject/umount
-+++ b/tests/ts/eject/umount
-@@ -60,13 +60,15 @@ function deinit_device {
- 	ts_scsi_debug_rmmod
- }
- 
--# As the eject binary execl()s an uninstrumented /bin/umount binary, we need
--# to explicitly $LD_PRELOAD the ASan's runtime DSO, otherwise ASan will complain.
--# Since all three utilities used by this test (eject, fdisk, mount) are just
--# libtool wrappers, let's check the kill binary instead, which should have
--# the needed DSO information.
--ASAN_RT_PATH="$(ts_get_asan_rt_path "$TS_CMD_KILL")"
--[ -n "$ASAN_RT_PATH" ] && export LD_PRELOAD="$ASAN_RT_PATH:$LD_PRELOAD"
-+if [ "$TS_USE_SYSTEM_COMMANDS" != "yes" ]; then
-+	# As the eject binary execl()s an uninstrumented /bin/umount binary, we need
-+	# to explicitly $LD_PRELOAD the ASan's runtime DSO, otherwise ASan will complain.
-+	# Since all three utilities used by this test (eject, fdisk, mount) are just
-+	# libtool wrappers, let's check the kill binary instead, which should have
-+	# the needed DSO information.
-+	ASAN_RT_PATH="$(ts_get_asan_rt_path "$TS_CMD_KILL")"
-+	[ -n "$ASAN_RT_PATH" ] && export LD_PRELOAD="$ASAN_RT_PATH:$LD_PRELOAD"
-+fi
- 
- ts_init_subtest "by-disk"
- init_device
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/tests-kill.patch b/meta/recipes-core/util-linux/util-linux/tests-kill.patch
deleted file mode 100644
index fa49fd4142..0000000000
--- a/meta/recipes-core/util-linux/util-linux/tests-kill.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-Don't hardcode the use of /bin/kill, as this could be kill.procps.  Instead ask
-the shell what kill binary to use, which will be the symlink in
-/usr/lib/util-linux/ptest/bin/.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/pull/1367]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e3f8a88cf688dffacb5f6033a8d24e2db40f75f6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 29 Jun 2021 16:34:20 +0100
-Subject: [PATCH] Don't hardcode /bin
-
----
- tests/ts/kill/all_processes  | 2 +-
- tests/ts/kill/name_to_number | 2 +-
- tests/ts/kill/options        | 2 +-
- tests/ts/kill/print_pid      | 2 +-
- tests/ts/kill/queue          | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tests/ts/kill/all_processes b/tests/ts/kill/all_processes
-index 0b137574d..b2280777f 100755
---- a/tests/ts/kill/all_processes
-+++ b/tests/ts/kill/all_processes
-@@ -22,7 +22,7 @@ ts_skip_nonroot
- 
- # make sure we do not use shell built-in command
- if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
--	TS_CMD_KILL="/bin/kill"
-+	TS_CMD_KILL="$(which kill)"
- fi
- 
- ts_check_test_command "$TS_CMD_KILL"
-diff --git a/tests/ts/kill/name_to_number b/tests/ts/kill/name_to_number
-index 9f4881cb7..8a7f4bef0 100755
---- a/tests/ts/kill/name_to_number
-+++ b/tests/ts/kill/name_to_number
-@@ -20,7 +20,7 @@ ts_init "$*"
- 
- # make sure we do not use shell built-in command
- if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
--	TS_CMD_KILL="/bin/kill"
-+	TS_CMD_KILL="$(which kill)"
- fi
- 
- ts_check_test_command "$TS_CMD_KILL"
-diff --git a/tests/ts/kill/options b/tests/ts/kill/options
-index 2788c70a2..10653a543 100755
---- a/tests/ts/kill/options
-+++ b/tests/ts/kill/options
-@@ -20,7 +20,7 @@ ts_init "$*"
- 
- # make sure we do not use shell built-in command
- if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
--	TS_CMD_KILL="/bin/kill"
-+	TS_CMD_KILL="$(which kill)"
- fi
- 
- ts_check_test_command "$TS_CMD_KILL"
-diff --git a/tests/ts/kill/print_pid b/tests/ts/kill/print_pid
-index 6926a3714..6e2db3711 100755
---- a/tests/ts/kill/print_pid
-+++ b/tests/ts/kill/print_pid
-@@ -20,7 +20,7 @@ ts_init "$*"
- 
- # make sure we do not use shell built-in command
- if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
--	TS_CMD_KILL="/bin/kill"
-+	TS_CMD_KILL="$(which kill)"
- fi
- 
- ts_check_test_command "$TS_CMD_KILL"
-diff --git a/tests/ts/kill/queue b/tests/ts/kill/queue
-index 18f10e8c2..6c9e9efc9 100755
---- a/tests/ts/kill/queue
-+++ b/tests/ts/kill/queue
-@@ -20,7 +20,7 @@ ts_init "$*"
- 
- # make sure we do not use shell built-in command
- if [ "$TS_USE_SYSTEM_COMMANDS" == "yes" ]; then
--	TS_CMD_KILL="/bin/kill"
-+	TS_CMD_KILL="$(which kill)"
- fi
- 
- ts_check_test_command "$TS_CMD_KILL"
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/tests-lscpu.patch b/meta/recipes-core/util-linux/util-linux/tests-lscpu.patch
deleted file mode 100644
index 36a19bd5a5..0000000000
--- a/meta/recipes-core/util-linux/util-linux/tests-lscpu.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From c2ca2837a27a3f1344904037ea691bfdbb288f02 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Fri, 2 Jul 2021 13:12:13 +0200
-Subject: [PATCH] lscpu: don't use DMI if executed with --sysroot
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- sys-utils/lscpu-arm.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/sys-utils/lscpu-arm.c b/sys-utils/lscpu-arm.c
-index d52765f9d..c7128094c 100644
---- a/sys-utils/lscpu-arm.c
-+++ b/sys-utils/lscpu-arm.c
-@@ -322,7 +322,8 @@ static void arm_decode(struct lscpu_cxt *cxt, struct lscpu_cputype *ct)
- 
- 	arm_ids_decode(ct);
- 	arm_rXpY_decode(ct);
--	if (cxt->is_cluster)
-+
-+	if (!cxt->noalive && cxt->is_cluster)
- 		ct->nr_socket_on_cluster = get_number_of_physical_sockets_from_dmi();
- }
- 
-@@ -330,8 +331,9 @@ static int is_cluster_arm(struct lscpu_cxt *cxt)
- {
- 	struct stat st;
- 
--	if (!(strcmp(cxt->arch->name, "aarch64")) &&
--	     (stat(_PATH_ACPI_PPTT, &st) < 0) && (cxt->ncputypes == 1))
-+	if (!cxt->noalive
-+	    && strcmp(cxt->arch->name, "aarch64") == 0
-+	    && stat(_PATH_ACPI_PPTT, &st) < 0 && cxt->ncputypes == 1)
- 		return 1;
- 	else
- 		return 0;
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/tests-ul.patch b/meta/recipes-core/util-linux/util-linux/tests-ul.patch
deleted file mode 100644
index 6896393105..0000000000
--- a/meta/recipes-core/util-linux/util-linux/tests-ul.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b1c71f19ea404e74d36ca5b8fbb0484043cdaef3 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 30 Jun 2021 11:25:01 +0100
-Subject: [PATCH] tests: mark ul/ul as a known failure
-
-As with ul/basic, this test produces different output when ran under
-different terminals, which isn't very useful.
-
-Set TS_KNOWN_FAIL so that these problems don't cause the test to fail.
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tests/ts/ul/ul | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/tests/ts/ul/ul b/tests/ts/ul/ul
-index b856e33db..c707658ac 100755
---- a/tests/ts/ul/ul
-+++ b/tests/ts/ul/ul
-@@ -20,6 +20,9 @@ ts_init "$*"
- 
- ts_check_test_command "$TS_CMD_UL"
- 
-+# This test provides different result on some terminals and virtual machines
-+TS_KNOWN_FAIL="yes"
-+
- printf "a\x08ab\x5F\x08c\\n\\ttab\\f\\b\\r" |
- 	$TS_CMD_UL -t xterm >> $TS_OUTPUT 2>> $TS_ERRLOG
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.bb b/meta/recipes-core/util-linux/util-linux_2.37.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.1.bb
-- 
2.31.1

