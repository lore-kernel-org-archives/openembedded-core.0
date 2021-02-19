Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web08.449.1613772050318167084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 14:00:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=W4h+YLUu;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id c8so29246373ljd.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 14:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRxfzC/8T4LtMBF1jEnGCMuuUC3/8fBlH7xZ4kPhVXM=;
        b=W4h+YLUuqRRTgLPJ9zlHzNaxNAt5GK8hYKMggebbme95PoT93tFaHyasM1FTflQ9Nu
         Y4CCwiOHti2BI1fkvlKVdwPecn9WG8Vf9lxy5q9ROXFXhIOWR4+YdSIcrUJumwPD4Kve
         W71JmFUWsbg5hh8b90l8bOYoa3AXvWOCuMJiQwyLxG8MPVaba4NgvxwNSOBJaBaErULH
         nzQBdyN0wN7fvjc/VtAOwyschZ9uHAAL2TymHdosP0e2fv1kDJ8WPY18LI5IBW89YgJU
         kIDipqF1P0dGKLwpnRBJmmx1ASxHNAOvp5To7JjGI34t2bKCIjz7brq5bgbFh0Ti8W8h
         k+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRxfzC/8T4LtMBF1jEnGCMuuUC3/8fBlH7xZ4kPhVXM=;
        b=Nv3GiPWlH/3dvlktIouWn5B408b9+gfNIhBDfdZ7T+tHo3pcyyreSgI30H+S3j8Pk7
         8Oom1ZZRwcNIAHpf0zJV9BgOBkHrU8VTNKbIKxhu6hXdR6UhxHGzwCihcrY1egoRI5Z2
         aXml2amM+FKeMFhKjx2zs0Bdi/yRSZD0Prm46veevWL2j25LtzgFfc4pMcJEs8GXCcHJ
         exsyuefVSi1yluVNCMu7EVMh4/eVhydF/F+1tjmF1hWC8JxYTwsRbVaNh5yaNmZYinaI
         f+GnXYDUPVsm/EWPX2TMyhNEwANWRZOQqRRW14Ta10YNP8TLss/B6JZZ9zjDb2Ev0WD8
         UdLw==
X-Gm-Message-State: AOAM532+aSpaExR/GDeEf7hGH7vBfNzDjBOncgFyVQtq8zFI1K35RXpc
	WTc5/5ENOgwyZ2rYUPmCN5KC8eD3oQYO1QaJ
X-Google-Smtp-Source: ABdhPJw5tPn9q460LfJYw++SVJafK6Z8F2fEXVlX4cmbzxrblMwyAsTVxlGRJF/jl/H/A01QuC7P4w==
X-Received: by 2002:a05:6512:11e2:: with SMTP id p2mr6664898lfs.321.1613772048009;
        Fri, 19 Feb 2021 14:00:48 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id x14sm1043229lfg.165.2021.02.19.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 14:00:45 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] busybox: update 1.33.0
Date: Fri, 19 Feb 2021 23:00:42 +0100
Message-Id: <20210219220042.2384431-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed upstreamed patch.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...1-hwclock-make-glibc-2.31-compatible.patch | 83 -------------------
 .../{busybox_1.32.0.bb => busybox_1.33.0.bb}  |  4 +-
 2 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
 rename meta/recipes-core/busybox/{busybox_1.32.0.bb => busybox_1.33.0.bb} (90%)

diff --git a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch b/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
deleted file mode 100644
index 8d1f272120..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-hwclock-make-glibc-2.31-compatible.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 5b2fc5746c352eb2b27bfc9fb224580d9852d0fa Mon Sep 17 00:00:00 2001
-From: Sakib Sajal <sakib.sajal@windriver.com>
-Date: Fri, 17 Jul 2020 17:27:21 +0000
-Subject: [PATCH] hwclock: make glibc 2.31 compatible
-
-NEWS for glibc version 2.31
-===========================
-
-Deprecated and removed features, and other changes affecting compatibility:
-
-* The settimeofday function can still be used to set a system-wide
-  time zone when the operating system supports it.  This is because
-  the Linux kernel reused the API, on some architectures, to describe
-  a system-wide time-zone-like offset between the software clock
-  maintained by the kernel, and the "RTC" clock that keeps time when
-  the system is shut down.
-
-  However, to reduce the odds of this offset being set by accident,
-  settimeofday can no longer be used to set the time and the offset
-  simultaneously.  If both of its two arguments are non-null, the call
-  will fail (setting errno to EINVAL).
-
-  Callers attempting to set this offset should also be prepared for
-  the call to fail and set errno to ENOSYS; this already happens on
-  the Hurd and on some Linux architectures.  The Linux kernel
-  maintainers are discussing a more principled replacement for the
-  reused API.  After a replacement becomes available, we will change
-  settimeofday to fail with ENOSYS on all platforms when its 'tzp'
-  argument is not a null pointer.
-
-  settimeofday itself is obsolescent according to POSIX.  Programs
-  that set the system time should use clock_settime and/or the adjtime
-  family of functions instead.  We may cease to make settimeofday
-  available to newly linked binaries after there is a replacement for
-  Linux's time-zone-like offset API.
-
-hwclock had two calls to settimeofday, in functions to_sys_clock and
-set_system_clock_timezone, where both the arguments to settimeofday
-were valid (non-null).
-Therefore, split the call, once for timezone and once for timeval.
-
-Fixes #12756
-
-Upstream-Status: Pending
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- util-linux/hwclock.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
-index dc97d8f..cf346e8 100644
---- a/util-linux/hwclock.c
-+++ b/util-linux/hwclock.c
-@@ -131,8 +131,10 @@ static void to_sys_clock(const char **pp_rtcname, int utc)
- 
- 	tv.tv_sec = read_rtc(pp_rtcname, NULL, utc);
- 	tv.tv_usec = 0;
--	if (settimeofday(&tv, &tz))
--		bb_simple_perror_msg_and_die("settimeofday");
-+	if (settimeofday(NULL, &tz))
-+		bb_simple_perror_msg_and_die("settimeofday: timezone");
-+	if (settimeofday(&tv, NULL))
-+		bb_simple_perror_msg_and_die("settimeofday: timeval");
- }
- 
- static void from_sys_clock(const char **pp_rtcname, int utc)
-@@ -283,8 +285,10 @@ static void set_system_clock_timezone(int utc)
- 	gettimeofday(&tv, NULL);
- 	if (!utc)
- 		tv.tv_sec += tz.tz_minuteswest * 60;
--	if (settimeofday(&tv, &tz))
--		bb_simple_perror_msg_and_die("settimeofday");
-+	if (settimeofday(NULL, &tz))
-+		bb_simple_perror_msg_and_die("settimeofday: timezone");
-+	if (settimeofday(&tv, NULL))
-+		bb_simple_perror_msg_and_die("settimeofday: timeval");
- }
- 
- //usage:#define hwclock_trivial_usage
--- 
-2.24.1
-
diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
similarity index 90%
rename from meta/recipes-core/busybox/busybox_1.32.0.bb
rename to meta/recipes-core/busybox/busybox_1.33.0.bb
index 3a669444dd..1a3f218bca 100644
--- a/meta/recipes-core/busybox/busybox_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -44,11 +44,9 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
-           file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://rev.cfg \
            file://pgrep.cfg \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.md5sum] = "9576986f1a960da471d03b72a62f13c7"
-SRC_URI[tarball.sha256sum] = "c35d87f1d04b2b153d33c275c2632e40d388a88f19a9e71727e0bbbff51fe689"
+SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
-- 
2.25.1

