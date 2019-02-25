Return-Path: <george.mccollister@gmail.com>
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
	[209.85.219.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5E17C860
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:10 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id f196so4026161yba.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XGr/GSCcuON5Lv0IbapOAD+zWqq6zggZF4aJrDb//ic=;
	b=GKaTyNeOeKR6HhFD8dqUsS9gYcTeRLCEmENgKl9na5k+Ye6XDxP+r3ffaZ0fo+oHx7
	atQccFgWlDz569PP0YR0WdgyfLDMR0IKVuQwHcJZ1SAlHW70VRWHpH4khdNdQXZsiH2L
	E0YnxNlxI18a5bJAy/WnUwcrdHyzBYgo1AFjUchwXNVBqdgg6+p0B+PrCP6tpb7xVF1a
	WzzwWBcZuohCmgZLcwbfMG9NAsgOF5t1E3xoFolB46lLGQD0cjB4fgecUftNEs5teOJ1
	t/QNplxRSMnYSgc2JP5/RAF/MmvLC7CD22Qm7hot6ZQpqSoGetSb06kG8hPwxvmW1scw
	hPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XGr/GSCcuON5Lv0IbapOAD+zWqq6zggZF4aJrDb//ic=;
	b=CjWVidV1lcgaotE/LW6nWVcutn2Npu3qsW7DZ/hGKcd4WLZ2HGxUt+xVjRFTe8C0QO
	KfNO634Q0f13KHTMzvSGiFfFpBG7/8yXAuMoGJgvRRAPXj5ah7AEErNackANFOS/i1/f
	jpoNos1u6G7xvVc7mWoIDEijKozCjCAViWwt4wW7JL0mEyMnAK4zgBWMHi6n6T/dB6gC
	YuNHD3maKSGAcluhOu/5G+JCXvFApaIKg17DfBBiHx7v4VzytICOjrI7b7l3jsEnLWfl
	QmPLILpU+bK37ZiPCYZ2M1vesQ9f5g5zcIFc0fwdHAeelVhKZ3A1JENoNPeX1iVVKy68
	r8VQ==
X-Gm-Message-State: AHQUAubQwGfWRoPHanmdoOothiU9r9l6JLvg5EQ/6pvi5ucZqpKx4URK
	TNKkW+i74phjgORl9tSVdqwWYE0=
X-Google-Smtp-Source: AHgI3IZq+uDn56JCciLHaBdoO0ZSm16vpyN4FxzG51NEay5mA8EoJvK/vb324sM48FhmKHJ34smVHQ==
X-Received: by 2002:a25:e08e:: with SMTP id
	x136mr14392193ybg.326.1551112690956; 
	Mon, 25 Feb 2019 08:38:10 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:10 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:09 -0600
Message-Id: <16c6f9f02f97ede90b0b8c5af7e56d634eba266d.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 4/8] systemd: Security fix CVE-2018-16864
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:10 -0000

Affects < v240

Based on thud commit 403e74b07b6f3c4a2444e68c74a8434fb17aee49
The patch in the thud commit doesn't compile against 237. Use the
version of this patch, CVE-2018-16864.patch from
systemd_237-3ubuntu10.13.debian.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...-not-store-the-iovec-entry-for-process-co.patch | 193 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |   1 +
 2 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch

diff --git a/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
new file mode 100644
index 0000000000..c0b0667d85
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
@@ -0,0 +1,193 @@
+From c29b44cb90e2cc521533e6169cf847553ebefd81 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Wed, 5 Dec 2018 18:38:39 +0100
+Subject: [PATCH] journald: do not store the iovec entry for process
+ commandline on stack
+
+This fixes a crash where we would read the commandline, whose length is under
+control of the sending program, and then crash when trying to create a stack
+allocation for it.
+
+CVE-2018-16864
+https://bugzilla.redhat.com/show_bug.cgi?id=1653855
+
+The message actually doesn't get written to disk, because
+journal_file_append_entry() returns -E2BIG.
+
+Patch for 237 from:
+systemd_237-3ubuntu10.13.debian CVE-2018-16864.patch
+
+CVE: CVE-2018-16864
+Upstream-Status: Backport
+
+---
+ src/basic/io-util.c           | 10 ++++++++++
+ src/basic/io-util.h           |  2 ++
+ src/coredump/coredump.c       | 31 +++++++++++--------------------
+ src/journal/journald-server.c | 25 +++++++++++++++----------
+ 4 files changed, 38 insertions(+), 30 deletions(-)
+
+--- a/src/basic/io-util.c
++++ b/src/basic/io-util.c
+@@ -26,6 +26,7 @@
+ #include <unistd.h>
+ 
+ #include "io-util.h"
++#include "string-util.h"
+ #include "time-util.h"
+ 
+ int flush_fd(int fd) {
+@@ -270,3 +271,12 @@
+ 
+         return q - (const uint8_t*) p;
+ }
++
++char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value) {
++        char *x;
++
++        x = strappend(field, value);
++        if (x)
++                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
++        return x;
++}
+--- a/src/basic/io-util.h
++++ b/src/basic/io-util.h
+@@ -91,3 +91,5 @@
+ #define IOVEC_MAKE(base, len) (struct iovec) IOVEC_INIT(base, len)
+ #define IOVEC_INIT_STRING(string) IOVEC_INIT((char*) string, strlen(string))
+ #define IOVEC_MAKE_STRING(string) (struct iovec) IOVEC_INIT_STRING(string)
++
++char* set_iovec_string_field(struct iovec *iovec, size_t *n_iovec, const char *field, const char *value);
+--- a/src/coredump/coredump.c
++++ b/src/coredump/coredump.c
+@@ -1067,19 +1067,10 @@
+         return 0;
+ }
+ 
+-static char* set_iovec_field(struct iovec iovec[27], size_t *n_iovec, const char *field, const char *value) {
+-        char *x;
+-
+-        x = strappend(field, value);
+-        if (x)
+-                iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(x);
+-        return x;
+-}
+-
+ static char* set_iovec_field_free(struct iovec iovec[27], size_t *n_iovec, const char *field, char *value) {
+         char *x;
+ 
+-        x = set_iovec_field(iovec, n_iovec, field, value);
++        x = set_iovec_string_field(iovec, n_iovec, field, value);
+         free(value);
+         return x;
+ }
+@@ -1129,33 +1120,33 @@
+                         disable_coredumps();
+                 }
+ 
+-                set_iovec_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
++                set_iovec_string_field(iovec, n_iovec, "COREDUMP_UNIT=", context[CONTEXT_UNIT]);
+         }
+ 
+         if (cg_pid_get_user_unit(pid, &t) >= 0)
+                 set_iovec_field_free(iovec, n_iovec, "COREDUMP_USER_UNIT=", t);
+ 
+         /* The next few are mandatory */
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_PID=", context[CONTEXT_PID]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_UID=", context[CONTEXT_UID]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_GID=", context[CONTEXT_GID]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL=", context[CONTEXT_SIGNAL]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_RLIMIT=", context[CONTEXT_RLIMIT]))
+                 return log_oom();
+ 
+-        if (!set_iovec_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
++        if (!set_iovec_string_field(iovec, n_iovec, "COREDUMP_COMM=", context[CONTEXT_COMM]))
+                 return log_oom();
+ 
+         if (context[CONTEXT_EXE] &&
+-            !set_iovec_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
++            !set_iovec_string_field(iovec, n_iovec, "COREDUMP_EXE=", context[CONTEXT_EXE]))
+                 return log_oom();
+ 
+         if (sd_pid_get_session(pid, &t) >= 0)
+@@ -1223,7 +1214,7 @@
+                 iovec[(*n_iovec)++] = IOVEC_MAKE_STRING(t);
+ 
+         if (safe_atoi(context[CONTEXT_SIGNAL], &signo) >= 0 && SIGNAL_VALID(signo))
+-                set_iovec_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
++                set_iovec_string_field(iovec, n_iovec, "COREDUMP_SIGNAL_NAME=SIG", signal_to_string(signo));
+ 
+         return 0; /* we successfully acquired all metadata */
+ }
+--- a/src/journal/journald-server.c
++++ b/src/journal/journald-server.c
+@@ -769,6 +769,7 @@
+                 pid_t object_pid) {
+ 
+         char source_time[sizeof("_SOURCE_REALTIME_TIMESTAMP=") + DECIMAL_STR_MAX(usec_t)];
++        _cleanup_free_ char *cmdline1 = NULL, *cmdline2 = NULL;
+         uid_t journal_uid;
+         ClientContext *o;
+ 
+@@ -785,20 +786,23 @@
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->uid, uid_t, uid_is_valid, UID_FMT, "_UID");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->gid, gid_t, gid_is_valid, GID_FMT, "_GID");
+ 
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->cmdline, "_CMDLINE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE");
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->comm, "_COMM"); /* At most TASK_COMM_LENGTH (16 bytes) */
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->exe, "_EXE"); /* A path, so at most PATH_MAX (4096 bytes) */
+ 
+-                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
++                if (c->cmdline)
++                        /* At most _SC_ARG_MAX (2MB usually), which is too much to put on stack.
++                         * Let's use a heap allocation for this one. */
++                        cmdline1 = set_iovec_string_field(iovec, &n, "_CMDLINE=", c->cmdline);
+ 
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->capeff, "_CAP_EFFECTIVE"); /* Read from /proc/.../status */
++                IOVEC_ADD_SIZED_FIELD(iovec, n, c->label, c->label_size, "_SELINUX_CONTEXT");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "_AUDIT_SESSION");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->loginuid, uid_t, uid_is_valid, UID_FMT, "_AUDIT_LOGINUID");
+ 
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP");
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->cgroup, "_SYSTEMD_CGROUP"); /* A path */
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->session, "_SYSTEMD_SESSION");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, c->owner_uid, uid_t, uid_is_valid, UID_FMT, "_SYSTEMD_OWNER_UID");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT");
++                IOVEC_ADD_STRING_FIELD(iovec, n, c->unit, "_SYSTEMD_UNIT"); /* Unit names are bounded by UNIT_NAME_MAX */
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_unit, "_SYSTEMD_USER_UNIT");
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->slice, "_SYSTEMD_SLICE");
+                 IOVEC_ADD_STRING_FIELD(iovec, n, c->user_slice, "_SYSTEMD_USER_SLICE");
+@@ -819,13 +823,14 @@
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->uid, uid_t, uid_is_valid, UID_FMT, "OBJECT_UID");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->gid, gid_t, gid_is_valid, GID_FMT, "OBJECT_GID");
+ 
++                /* See above for size limits, only ->cmdline may be large, so use a heap allocation for it. */
+                 IOVEC_ADD_STRING_FIELD(iovec, n, o->comm, "OBJECT_COMM");
+                 IOVEC_ADD_STRING_FIELD(iovec, n, o->exe, "OBJECT_EXE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, o->cmdline, "OBJECT_CMDLINE");
+-                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
++                if (o->cmdline)
++                        cmdline2 = set_iovec_string_field(iovec, &n, "OBJECT_CMDLINE=", o->cmdline);
+ 
++                IOVEC_ADD_STRING_FIELD(iovec, n, o->capeff, "OBJECT_CAP_EFFECTIVE");
+                 IOVEC_ADD_SIZED_FIELD(iovec, n, o->label, o->label_size, "OBJECT_SELINUX_CONTEXT");
+-
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->auditid, uint32_t, audit_session_is_valid, "%" PRIu32, "OBJECT_AUDIT_SESSION");
+                 IOVEC_ADD_NUMERIC_FIELD(iovec, n, o->loginuid, uid_t, uid_is_valid, UID_FMT, "OBJECT_AUDIT_LOGINUID");
+ 
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 87793dd3af..0cb84c002f 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -57,6 +57,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
            file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
+           file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


