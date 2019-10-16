Return-Path: <misla011@fiu.edu>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B46C7F33F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 21:16:35 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 4so24199425qki.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fiu-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version:reply-to
	:content-transfer-encoding;
	bh=n2drDLm3o0OAZ/B2gI3Km+8PIQk7G5G95wji2REqTGs=;
	b=hPlEoc/uZHMQCWP0+bfcldxXVo/QHrxVm26TdvetSku28nJ/xBvUSeOdGfCN78cozH
	Arud+EZgM7uLo5LCBr+M1LdLsLsR2ipq+wa904UmqY88U2OjiM5wwrmGtAVVdEMKdhzx
	7KI4y1LNumlHFFh9YluFxaotE2r/iWqfL3AAULNiutT2Ffabc+Wwg+k596hIA/73A59R
	KKzSFchsEezu5DGXlR5CmKfOqyhpoJTrCulqqjw2cQ+JtT5tALpEZniRHMvDWkBWOiEq
	JtnhQTSrCT2hR17X0GslXZT8vIbvH7RannYA9DJ3OqMyJhG8s6jgb1gqIZKogoIrbYr5
	Kj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:reply-to:content-transfer-encoding;
	bh=n2drDLm3o0OAZ/B2gI3Km+8PIQk7G5G95wji2REqTGs=;
	b=A3xJVAxJFey441aUrQ9C4VIpj9vPLMn0EVEFjCmWd7e8iovypmFHwaAirdhOPRakNx
	JHUQcuCIS3sDPqH+/Uv26OsdGhlszpVSkrErfl8qw+0dDbZhTW3yFBAssMTQXf/Rqsey
	01uCYLg2wJu53AcPsZNKsR14xFnw0QCq8+kHOeDRLwKM+RV6oMROd8xW3cRm7nLDaRo2
	WYS37BtJeNaicGxYi3Zs3qlukuuwU0mwvQ4iwp+UfcZGLR/ghZncNC4EwZPxHEWqYoIm
	q7RehwLsAVZJPnogmLEOTlsn7ydqjMXr6RxTDBlonKu1IQegXh2FPQabiD4D1IXp7yzM
	ejSg==
X-Gm-Message-State: APjAAAWGnJ0N8UTRQg7sssJttw1pdPzbUgzDeDH0Qq3bId+axnyxBINY
	y3wBHBCiikiawJysBgZDFZaCJJT4tXY=
X-Google-Smtp-Source: APXvYqw6pTdBleEqNMdvsJtoIMbj5r4g2hxyJE8WT6OsYmRCvecho5KF8YfoneRzI6Vi+wboQFUedQ==
X-Received: by 2002:a37:444b:: with SMTP id r72mr30933963qka.320.1571260595423;
	Wed, 16 Oct 2019 14:16:35 -0700 (PDT)
Received: from
	muislam-yocto.h0ebkyng4k5ejcojahceueqbfb.cx.internal.cloudapp.net
	([40.84.59.7])
	by smtp.gmail.com with ESMTPSA id q5sm166213qte.38.2019.10.16.14.16.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 14:16:34 -0700 (PDT)
From: Muminul Islam <misla011@fiu.edu>
X-Google-Original-From: Muminul Islam <muislam@microsoft.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 21:16:17 +0000
Message-Id: <20191016211617.3326-1-muislam@microsoft.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Reply-To: muislam@microsoft.com; Content-Type: text/plain; charset="utf-8"
Subject: [thud][PATCH] systemd: Security fixes for CVE
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
X-List-Received-Date: Wed, 16 Oct 2019 21:16:36 -0000
Content-Transfer-Encoding: 8bit

CVE: CVE-2019-3842 CVE-2019-3843 CVE-2019-3844

Upstream-Status: Backport

Signed-off-by: Muminul Islam <muislam@microsoft.com>
---
 .../systemd/systemd/CVE-2019-3842.patch       |  59 +++++
 .../systemd/systemd/CVE-2019-3843_p1.patch    | 227 ++++++++++++++++++
 .../systemd/systemd/CVE-2019-3843_p2.patch    | 174 ++++++++++++++
 .../systemd/systemd/CVE-2019-3843_p3.patch    |  90 +++++++
 .../systemd/systemd/CVE-2019-3843_p4.patch    | 163 +++++++++++++
 .../systemd/systemd/CVE-2019-3844.patch       |  96 ++++++++
 meta/recipes-core/systemd/systemd_239.bb      |   6 +
 7 files changed, 815 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-3842.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-3843_p1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-3843_p2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-3843_p3.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-3843_p4.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-3844.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-3842.patch b/meta/recipes-core/systemd/systemd/CVE-2019-3842.patch
new file mode 100644
index 0000000000..c58914b5b3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-3842.patch
@@ -0,0 +1,59 @@
+From 7ee4ae8c15bd9cc3d60000f9a4b684ea608cabc6 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Mon, 4 Feb 2019 10:23:43 +0100
+Subject: [PATCH] pam-systemd: use secure_getenv() rather than getenv()
+Reply-To: muislam@microsoft.com
+
+And explain why in a comment.
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-3842
+
+Upstream-Status: Backport
+
+Upstream commit: https://github.com/systemd/systemd/commit/83d4ab55336ff8a0643c6aa627b31e351a24040a
+---
+ src/login/pam_systemd.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/login/pam_systemd.c b/src/login/pam_systemd.c
+index 1fbf6ba585..3ecb34425d 100644
+--- a/src/login/pam_systemd.c
++++ b/src/login/pam_systemd.c
+@@ -354,27 +354,27 @@ _public_ PAM_EXTERN int pam_sm_open_session(
+ 
+         seat = pam_getenv(handle, "XDG_SEAT");
+         if (isempty(seat))
+-                seat = getenv("XDG_SEAT");
++                seat = secure_getenv("XDG_SEAT");
+ 
+         cvtnr = pam_getenv(handle, "XDG_VTNR");
+         if (isempty(cvtnr))
+-                cvtnr = getenv("XDG_VTNR");
++                cvtnr = secure_getenv("XDG_VTNR");
+ 
+         type = pam_getenv(handle, "XDG_SESSION_TYPE");
+         if (isempty(type))
+-                type = getenv("XDG_SESSION_TYPE");
++                type = secure_getenv("XDG_SESSION_TYPE");
+         if (isempty(type))
+                 type = type_pam;
+ 
+         class = pam_getenv(handle, "XDG_SESSION_CLASS");
+         if (isempty(class))
+-                class = getenv("XDG_SESSION_CLASS");
++                class = secure_getenv("XDG_SESSION_CLASS");
+         if (isempty(class))
+                 class = class_pam;
+ 
+         desktop = pam_getenv(handle, "XDG_SESSION_DESKTOP");
+         if (isempty(desktop))
+-                desktop = getenv("XDG_SESSION_DESKTOP");
++                desktop = secure_getenv("XDG_SESSION_DESKTOP");
+ 
+         tty = strempty(tty);
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-3843_p1.patch b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p1.patch
new file mode 100644
index 0000000000..a0646dd54e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p1.patch
@@ -0,0 +1,227 @@
+From 63788571a48adec4a0fed9d1d8993f867d1c1a1d Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 20 Mar 2019 19:00:28 +0100
+Subject: [PATCH] seccomp: introduce seccomp_restrict_suid_sgid() for blocking
+ chmod() for suid/sgid files
+Reply-To: muislam@microsoft.com
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-3843
+Upstream-Status: Backport
+
+Upstream commit: https://github.com/systemd/systemd/commit/3c27973b13724ede05a06a5d346a569794cda433
+---
+ src/shared/seccomp-util.c | 173 ++++++++++++++++++++++++++++++++++++++
+ src/shared/seccomp-util.h |   1 +
+ 2 files changed, 174 insertions(+)
+
+diff --git a/src/shared/seccomp-util.c b/src/shared/seccomp-util.c
+index c433cb90dc..e9632d703e 100644
+--- a/src/shared/seccomp-util.c
++++ b/src/shared/seccomp-util.c
+@@ -1,12 +1,14 @@
+ /* SPDX-License-Identifier: LGPL-2.1+ */
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <linux/seccomp.h>
+ #include <seccomp.h>
+ #include <stddef.h>
+ #include <sys/mman.h>
+ #include <sys/prctl.h>
+ #include <sys/shm.h>
++#include <sys/stat.h>
+ 
+ #include "af-list.h"
+ #include "alloc-util.h"
+@@ -1742,3 +1744,174 @@ int seccomp_lock_personality(unsigned long personality) {
+ 
+         return 0;
+ }
++
++int seccomp_protect_hostname(void) {
++        uint32_t arch;
++        int r;
++
++        SECCOMP_FOREACH_LOCAL_ARCH(arch) {
++                _cleanup_(seccomp_releasep) scmp_filter_ctx seccomp = NULL;
++
++                r = seccomp_init_for_arch(&seccomp, arch, SCMP_ACT_ALLOW);
++                if (r < 0)
++                        return r;
++
++                r = seccomp_rule_add_exact(
++                                seccomp,
++                                SCMP_ACT_ERRNO(EPERM),
++                                SCMP_SYS(sethostname),
++                                0);
++                if (r < 0) {
++                        log_debug_errno(r, "Failed to add sethostname() rule for architecture %s, skipping: %m", seccomp_arch_to_string(arch));
++                        continue;
++                }
++
++                r = seccomp_rule_add_exact(
++                                seccomp,
++                                SCMP_ACT_ERRNO(EPERM),
++                                SCMP_SYS(setdomainname),
++                                0);
++                if (r < 0) {
++                        log_debug_errno(r, "Failed to add setdomainname() rule for architecture %s, skipping: %m", seccomp_arch_to_string(arch));
++                        continue;
++                }
++
++                r = seccomp_load(seccomp);
++                if (IN_SET(r, -EPERM, -EACCES))
++                        return r;
++                if (r < 0)
++                        log_debug_errno(r, "Failed to apply hostname restrictions for architecture %s, skipping: %m", seccomp_arch_to_string(arch));
++        }
++
++        return 0;
++}
++
++int seccomp_restrict_suid_sgid(void) {
++        uint32_t arch;
++        int r;
++
++        SECCOMP_FOREACH_LOCAL_ARCH(arch) {
++                _cleanup_(seccomp_releasep) scmp_filter_ctx seccomp = NULL;
++
++                r = seccomp_init_for_arch(&seccomp, arch, SCMP_ACT_ALLOW);
++                if (r < 0)
++                        return r;
++
++                /* Checks the mode_t parameter of the following system calls:
++                 *
++                 *       → chmod() + fchmod() + fchmodat()
++                 *       → open() + creat() + openat()
++                 *       → mkdir() + mkdirat()
++                 *       → mknod() + mknodat()
++                 */
++
++                for (unsigned bit = 0; bit < 2; bit ++) {
++                        /* Block S_ISUID in the first iteration, S_ISGID in the second */
++                        mode_t m = bit == 0 ? S_ISUID : S_ISGID;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(chmod),
++                                        1,
++                                        SCMP_A1(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(fchmod),
++                                        1,
++                                        SCMP_A1(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(fchmodat),
++                                        1,
++                                        SCMP_A2(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(mkdir),
++                                        1,
++                                        SCMP_A1(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(mkdirat),
++                                        1,
++                                        SCMP_A2(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(mknod),
++                                        1,
++                                        SCMP_A1(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(mknodat),
++                                        1,
++                                        SCMP_A2(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(open),
++                                        2,
++                                        SCMP_A1(SCMP_CMP_MASKED_EQ, O_CREAT, O_CREAT),
++                                        SCMP_A2(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(openat),
++                                        2,
++                                        SCMP_A2(SCMP_CMP_MASKED_EQ, O_CREAT, O_CREAT),
++                                        SCMP_A3(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++
++                        r = seccomp_rule_add_exact(
++                                        seccomp,
++                                        SCMP_ACT_ERRNO(EPERM),
++                                        SCMP_SYS(creat),
++                                        1,
++                                        SCMP_A1(SCMP_CMP_MASKED_EQ, m, m));
++                        if (r < 0)
++                                break;
++                }
++                if (r < 0) {
++                        log_debug_errno(r, "Failed to add suid/sgid rule for architecture %s, skipping: %m", seccomp_arch_to_string(arch));
++                        continue;
++                }
++
++                r = seccomp_load(seccomp);
++                if (IN_SET(r, -EPERM, -EACCES))
++                        return r;
++                if (r < 0)
++                        log_debug_errno(r, "Failed to apply suid/sgid restrictions for architecture %s, skipping: %m", seccomp_arch_to_string(arch));
++        }
++
++        return 0;
++}
+diff --git a/src/shared/seccomp-util.h b/src/shared/seccomp-util.h
+index eac857afb9..a274333450 100644
+--- a/src/shared/seccomp-util.h
++++ b/src/shared/seccomp-util.h
+@@ -85,6 +85,7 @@ int seccomp_restrict_address_families(Set *address_families, bool whitelist);
+ int seccomp_restrict_realtime(void);
+ int seccomp_memory_deny_write_execute(void);
+ int seccomp_lock_personality(unsigned long personality);
++int seccomp_restrict_suid_sgid(void);
+ 
+ extern const uint32_t seccomp_local_archs[];
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-3843_p2.patch b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p2.patch
new file mode 100644
index 0000000000..bf9e4cd641
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p2.patch
@@ -0,0 +1,174 @@
+From 8c2b92f997255296186d3986cde04de57c652b73 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 20 Mar 2019 19:09:09 +0100
+Subject: [PATCH] core: expose SUID/SGID restriction as new unit setting
+ RestrictSUIDSGID=
+Reply-To: muislam@microsoft.com
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-3843
+Upstream-Status: Backport
+Upstream Commit: https://github.com/systemd/systemd/commit/f69567cbe26d09eac9d387c0be0fc32c65a83ada
+---
+ src/core/dbus-execute.c                       |  4 ++++
+ src/core/execute.c                            | 22 +++++++++++++++++++
+ src/core/execute.h                            |  1 +
+ src/core/load-fragment-gperf.gperf.m4         |  2 ++
+ src/shared/bus-unit-util.c                    | 12 +++++-----
+ test/fuzz-corpus/unit-file/directives.service |  1 +
+ 6 files changed, 36 insertions(+), 6 deletions(-)
+
+diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
+index c44970c10c..41dfb36377 100644
+--- a/src/core/dbus-execute.c
++++ b/src/core/dbus-execute.c
+@@ -769,6 +769,7 @@ const sd_bus_vtable bus_exec_vtable[] = {
+         SD_BUS_PROPERTY("ConfigurationDirectory", "as", NULL, offsetof(ExecContext, directories[EXEC_DIRECTORY_CONFIGURATION].paths), SD_BUS_VTABLE_PROPERTY_CONST),
+         SD_BUS_PROPERTY("MemoryDenyWriteExecute", "b", bus_property_get_bool, offsetof(ExecContext, memory_deny_write_execute), SD_BUS_VTABLE_PROPERTY_CONST),
+         SD_BUS_PROPERTY("RestrictRealtime", "b", bus_property_get_bool, offsetof(ExecContext, restrict_realtime), SD_BUS_VTABLE_PROPERTY_CONST),
++        SD_BUS_PROPERTY("RestrictSUIDSGID", "b", bus_property_get_bool, offsetof(ExecContext, restrict_suid_sgid), SD_BUS_VTABLE_PROPERTY_CONST),
+         SD_BUS_PROPERTY("RestrictNamespaces", "t", bus_property_get_ulong, offsetof(ExecContext, restrict_namespaces), SD_BUS_VTABLE_PROPERTY_CONST),
+         SD_BUS_PROPERTY("BindPaths", "a(ssbt)", property_get_bind_paths, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+         SD_BUS_PROPERTY("BindReadOnlyPaths", "a(ssbt)", property_get_bind_paths, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+@@ -1127,6 +1128,9 @@ int bus_exec_context_set_transient_property(
+         if (streq(name, "RestrictRealtime"))
+                 return bus_set_transient_bool(u, name, &c->restrict_realtime, message, flags, error);
+ 
++        if (streq(name, "RestrictSUIDSGID"))
++                return bus_set_transient_bool(u, name, &c->restrict_suid_sgid, message, flags, error);
++
+         if (streq(name, "DynamicUser"))
+                 return bus_set_transient_bool(u, name, &c->dynamic_user, message, flags, error);
+ 
+diff --git a/src/core/execute.c b/src/core/execute.c
+index 8ac69d1a0f..e7f78f7f32 100644
+--- a/src/core/execute.c
++++ b/src/core/execute.c
+@@ -1366,6 +1366,7 @@ static bool context_has_no_new_privileges(const ExecContext *c) {
+         return context_has_address_families(c) ||
+                 c->memory_deny_write_execute ||
+                 c->restrict_realtime ||
++                c->restrict_suid_sgid ||
+                 exec_context_restrict_namespaces_set(c) ||
+                 c->protect_kernel_tunables ||
+                 c->protect_kernel_modules ||
+@@ -1470,6 +1471,19 @@ static int apply_restrict_realtime(const Unit* u, const ExecContext *c) {
+         return seccomp_restrict_realtime();
+ }
+ 
++static int apply_restrict_suid_sgid(const Unit* u, const ExecContext *c) {
++        assert(u);
++        assert(c);
++
++        if (!c->restrict_suid_sgid)
++                return 0;
++
++        if (skip_seccomp_unavailable(u, "RestrictSUIDSGID="))
++                return 0;
++
++        return seccomp_restrict_suid_sgid();
++}
++
+ static int apply_protect_sysctl(const Unit *u, const ExecContext *c) {
+         assert(u);
+         assert(c);
+@@ -3331,6 +3345,12 @@ static int exec_child(
+                         return log_unit_error_errno(unit, r, "Failed to apply realtime restrictions: %m");
+                 }
+ 
++                r = apply_restrict_suid_sgid(unit, context);
++                if (r < 0) {
++                        *exit_status = EXIT_SECCOMP;
++                        return log_unit_error_errno(unit, r, "Failed to apply SUID/SGID restrictions: %m");
++                }
++
+                 r = apply_restrict_namespaces(unit, context);
+                 if (r < 0) {
+                         *exit_status = EXIT_SECCOMP;
+@@ -3920,6 +3940,7 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+                 "%sIgnoreSIGPIPE: %s\n"
+                 "%sMemoryDenyWriteExecute: %s\n"
+                 "%sRestrictRealtime: %s\n"
++                "%sRestrictSUIDSGID: %s\n"
+                 "%sKeyringMode: %s\n",
+                 prefix, c->umask,
+                 prefix, c->working_directory ? c->working_directory : "/",
+@@ -3938,6 +3959,7 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
+                 prefix, yes_no(c->ignore_sigpipe),
+                 prefix, yes_no(c->memory_deny_write_execute),
+                 prefix, yes_no(c->restrict_realtime),
++                prefix, yes_no(c->restrict_suid_sgid),
+                 prefix, exec_keyring_mode_to_string(c->keyring_mode));
+ 
+         if (c->root_image)
+diff --git a/src/core/execute.h b/src/core/execute.h
+index 77ffe82323..e6319cee8a 100644
+--- a/src/core/execute.h
++++ b/src/core/execute.h
+@@ -260,6 +260,7 @@ struct ExecContext {
+ 
+         bool memory_deny_write_execute;
+         bool restrict_realtime;
++        bool restrict_suid_sgid;
+ 
+         bool oom_score_adjust_set:1;
+         bool nice_set:1;
+diff --git a/src/core/load-fragment-gperf.gperf.m4 b/src/core/load-fragment-gperf.gperf.m4
+index 15fb47838c..692edcb101 100644
+--- a/src/core/load-fragment-gperf.gperf.m4
++++ b/src/core/load-fragment-gperf.gperf.m4
+@@ -72,6 +72,7 @@ $1.SystemCallErrorNumber,        config_parse_syscall_errno,         0,
+ $1.MemoryDenyWriteExecute,       config_parse_bool,                  0,                             offsetof($1, exec_context.memory_deny_write_execute)
+ $1.RestrictNamespaces,           config_parse_restrict_namespaces,   0,                             offsetof($1, exec_context)
+ $1.RestrictRealtime,             config_parse_bool,                  0,                             offsetof($1, exec_context.restrict_realtime)
++$1.RestrictSUIDSGID,             config_parse_bool,                  0,                             offsetof($1, exec_context.restrict_suid_sgid)
+ $1.RestrictAddressFamilies,      config_parse_address_families,      0,                             offsetof($1, exec_context)
+ $1.LockPersonality,              config_parse_bool,                  0,                             offsetof($1, exec_context.lock_personality)',
+ `$1.SystemCallFilter,            config_parse_warn_compat,           DISABLED_CONFIGURATION,        0
+@@ -80,6 +81,7 @@ $1.SystemCallErrorNumber,        config_parse_warn_compat,           DISABLED_CO
+ $1.MemoryDenyWriteExecute,       config_parse_warn_compat,           DISABLED_CONFIGURATION,        0
+ $1.RestrictNamespaces,           config_parse_warn_compat,           DISABLED_CONFIGURATION,        0
+ $1.RestrictRealtime,             config_parse_warn_compat,           DISABLED_CONFIGURATION,        0
++$1.RestrictSUIDSGID,             config_parse_warn_compat,           DISABLED_CONFIGURATION,         0
+ $1.RestrictAddressFamilies,      config_parse_warn_compat,           DISABLED_CONFIGURATION,        0
+ $1.LockPersonality,              config_parse_warn_compat,           DISABLED_CONFIGURATION,        0')
+ $1.LimitCPU,                     config_parse_rlimit,                RLIMIT_CPU,                    offsetof($1, exec_context.rlimit)
+diff --git a/src/shared/bus-unit-util.c b/src/shared/bus-unit-util.c
+index 3238b442c0..c2f9720c33 100644
+--- a/src/shared/bus-unit-util.c
++++ b/src/shared/bus-unit-util.c
+@@ -692,12 +692,12 @@ static int bus_append_execute_property(sd_bus_message *m, const char *field, con
+                 return bus_append_string(m, field, eq);
+ 
+         if (STR_IN_SET(field,
+-                       "IgnoreSIGPIPE", "TTYVHangup", "TTYReset", "TTYVTDisallocate",
+-                       "PrivateTmp", "PrivateDevices", "PrivateNetwork", "PrivateUsers",
+-                       "PrivateMounts", "NoNewPrivileges", "SyslogLevelPrefix",
+-                       "MemoryDenyWriteExecute", "RestrictRealtime", "DynamicUser", "RemoveIPC",
+-                       "ProtectKernelTunables", "ProtectKernelModules", "ProtectControlGroups",
+-                       "MountAPIVFS", "CPUSchedulingResetOnFork", "LockPersonality"))
++                       "IgnoreSIGPIPE", "TTYVHangup", "TTYReset", "TTYVTDisallocate", "PrivateTmp",
++                       "PrivateDevices", "PrivateNetwork", "PrivateUsers", "PrivateMounts",
++                       "NoNewPrivileges", "SyslogLevelPrefix", "MemoryDenyWriteExecute", "RestrictRealtime",
++                       "DynamicUser", "RemoveIPC", "ProtectKernelTunables", "ProtectKernelModules",
++                       "ProtectControlGroups", "MountAPIVFS", "CPUSchedulingResetOnFork", "LockPersonality",
++                       "ProtectHostname", "RestrictSUIDSGID"))
+ 
+                 return bus_append_parse_boolean(m, field, eq);
+ 
+diff --git a/test/fuzz-corpus/unit-file/directives.service b/test/fuzz-corpus/unit-file/directives.service
+index b35325fb6f..ad6cd8d712 100644
+--- a/test/fuzz-corpus/unit-file/directives.service
++++ b/test/fuzz-corpus/unit-file/directives.service
+@@ -848,6 +848,7 @@ ReserveVT=
+ RestrictAddressFamilies=
+ RestrictNamespaces=
+ RestrictRealtime=
++RestrictSUIDSGID=
+ RuntimeDirectory=
+ RuntimeDirectoryMode=
+ RuntimeDirectoryPreserve=
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-3843_p3.patch b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p3.patch
new file mode 100644
index 0000000000..586b4118bf
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p3.patch
@@ -0,0 +1,90 @@
+From cd8496795c104c7e557f2d9207f75b896465dbee Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 20 Mar 2019 19:45:32 +0100
+Subject: [PATCH] man: document the new RestrictSUIDSGID= setting
+Reply-To: muislam@microsoft.com
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-3843
+Upstream-Status: Backport
+Upstream Commit: https://github.com/systemd/systemd/commit/7445db6eb70e8d5989f481d0c5a08ace7047ae5b
+---
+ doc/TRANSIENT-SETTINGS.md |  1 +
+ man/systemd.exec.xml      | 41 +++++++++++++++++++++++++++------------
+ 2 files changed, 30 insertions(+), 12 deletions(-)
+
+diff --git a/doc/TRANSIENT-SETTINGS.md b/doc/TRANSIENT-SETTINGS.md
+index ca9e8387b7..20c70a05f9 100644
+--- a/doc/TRANSIENT-SETTINGS.md
++++ b/doc/TRANSIENT-SETTINGS.md
+@@ -147,6 +147,7 @@ All execution-related settings are available for transient units.
+ ✓ MemoryDenyWriteExecute=
+ ✓ RestrictNamespaces=
+ ✓ RestrictRealtime=
++✓ RestrictSUIDSGID=
+ ✓ RestrictAddressFamilies=
+ ✓ LockPersonality=
+ ✓ LimitCPU=
+diff --git a/man/systemd.exec.xml b/man/systemd.exec.xml
+index 3bd790b485..2bdbc0608e 100644
+--- a/man/systemd.exec.xml
++++ b/man/systemd.exec.xml
+@@ -348,18 +348,19 @@ CapabilityBoundingSet=~CAP_B CAP_C</programlisting>
+       <varlistentry>
+         <term><varname>NoNewPrivileges=</varname></term>
+ 
+-        <listitem><para>Takes a boolean argument. If true, ensures that the service process and all its children can
+-        never gain new privileges through <function>execve()</function> (e.g. via setuid or setgid bits, or filesystem
+-        capabilities). This is the simplest and most effective way to ensure that a process and its children can never
+-        elevate privileges again. Defaults to false, but certain settings override this and ignore the value of this
+-        setting.  This is the case when <varname>SystemCallFilter=</varname>,
+-        <varname>SystemCallArchitectures=</varname>, <varname>RestrictAddressFamilies=</varname>,
+-        <varname>RestrictNamespaces=</varname>, <varname>PrivateDevices=</varname>,
+-        <varname>ProtectKernelTunables=</varname>, <varname>ProtectKernelModules=</varname>,
+-        <varname>MemoryDenyWriteExecute=</varname>, <varname>RestrictRealtime=</varname>, or
+-        <varname>LockPersonality=</varname> are specified. Note that even if this setting is overridden by them,
+-        <command>systemctl show</command> shows the original value of this setting. Also see
+-        <ulink url="https://www.kernel.org/doc/html/latest/userspace-api/no_new_privs.html">No New Privileges
++        <listitem><para>Takes a boolean argument. If true, ensures that the service process and all its
++        children can never gain new privileges through <function>execve()</function> (e.g. via setuid or
++        setgid bits, or filesystem capabilities). This is the simplest and most effective way to ensure that
++        a process and its children can never elevate privileges again. Defaults to false, but certain
++        settings override this and ignore the value of this setting.  This is the case when
++        <varname>SystemCallFilter=</varname>, <varname>SystemCallArchitectures=</varname>,
++        <varname>RestrictAddressFamilies=</varname>, <varname>RestrictNamespaces=</varname>,
++        <varname>PrivateDevices=</varname>, <varname>ProtectKernelTunables=</varname>,
++        <varname>ProtectKernelModules=</varname>, <varname>MemoryDenyWriteExecute=</varname>,
++        <varname>RestrictRealtime=</varname>, <varname>RestrictSUIDSGID=</varname> or
++        <varname>LockPersonality=</varname> are specified. Note that even if this setting is overridden by
++        them, <command>systemctl show</command> shows the original value of this setting. Also see <ulink
++        url="https://www.kernel.org/doc/html/latest/userspace-api/no_new_privs.html">No New Privileges
+         Flag</ulink>.  </para></listitem>
+       </varlistentry>
+ 
+@@ -1252,6 +1253,22 @@ RestrictNamespaces=~cgroup net</programlisting>
+         that actually require them. Defaults to off.</para></listitem>
+       </varlistentry>
+ 
++      <varlistentry>
++        <term><varname>RestrictSUIDSGID=</varname></term>
++
++        <listitem><para>Takes a boolean argument. If set, any attempts to set the set-user-ID (SUID) or
++        set-group-ID (SGID) bits on files or directories will be denied (for details on these bits see
++        <citerefentry
++        project='man-pages'><refentrytitle>inode</refentrytitle><manvolnum>7</manvolnum></citerefentry>). If
++        running in user mode, or in system mode, but without the <constant>CAP_SYS_ADMIN</constant>
++        capability (e.g. setting <varname>User=</varname>), <varname>NoNewPrivileges=yes</varname> is
++        implied. As the SUID/SGID bits are mechanisms to elevate privileges, and allows users to acquire the
++        identity of other users, it is recommended to restrict creation of SUID/SGID files to the few
++        programs that actually require them. Note that this restricts marking of any type of file system
++        object with these bits, including both regular files and directories (where the SGID is a different
++        meaning than for files, see documentation). Defaults to off.</para></listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term><varname>RemoveIPC=</varname></term>
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-3843_p4.patch b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p4.patch
new file mode 100644
index 0000000000..ae2d8f7999
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-3843_p4.patch
@@ -0,0 +1,163 @@
+From a331bccfacc286c8f8d75544548a47d098c9d580 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 20 Mar 2019 19:52:20 +0100
+Subject: [PATCH] units: turn on RestrictSUIDSGID= in most of our long-running
+ daemons
+Reply-To: muislam@microsoft.com
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+CVE: CVE-2019-3843
+Upstream-Status: Backport
+Upstream Commit: https://github.com/systemd/systemd/commit/62aa29247c3d74bcec0607c347f2be23cd90675d
+---
+ units/systemd-coredump@.service.in      | 1 +
+ units/systemd-hostnamed.service.in      | 1 +
+ units/systemd-journal-remote.service.in | 1 +
+ units/systemd-journald.service.in       | 1 +
+ units/systemd-localed.service.in        | 1 +
+ units/systemd-logind.service.in         | 1 +
+ units/systemd-networkd.service.in       | 1 +
+ units/systemd-resolved.service.in       | 1 +
+ units/systemd-timedated.service.in      | 1 +
+ units/systemd-timesyncd.service.in      | 1 +
+ units/systemd-udevd.service.in          | 3 ++-
+ 11 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/units/systemd-coredump@.service.in b/units/systemd-coredump@.service.in
+index 215696ecd1..08ecedbe56 100644
+--- a/units/systemd-coredump@.service.in
++++ b/units/systemd-coredump@.service.in
+@@ -31,6 +31,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX
+ SystemCallFilter=@system-service
+diff --git a/units/systemd-hostnamed.service.in b/units/systemd-hostnamed.service.in
+index da74b4fe8b..a6e07781ce 100644
+--- a/units/systemd-hostnamed.service.in
++++ b/units/systemd-hostnamed.service.in
+@@ -27,6 +27,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX
+ SystemCallFilter=@system-service sethostname
+diff --git a/units/systemd-journal-remote.service.in b/units/systemd-journal-remote.service.in
+index a94265f215..05a166f587 100644
+--- a/units/systemd-journal-remote.service.in
++++ b/units/systemd-journal-remote.service.in
+@@ -26,6 +26,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
+ SystemCallArchitectures=native
+diff --git a/units/systemd-journald.service.in b/units/systemd-journald.service.in
+index 52939e6820..ad7d979d1c 100644
+--- a/units/systemd-journald.service.in
++++ b/units/systemd-journald.service.in
+@@ -27,6 +27,7 @@ FileDescriptorStoreMax=4224
+ CapabilityBoundingSet=CAP_SYS_ADMIN CAP_DAC_OVERRIDE CAP_SYS_PTRACE CAP_SYSLOG CAP_AUDIT_CONTROL CAP_AUDIT_READ CAP_CHOWN CAP_DAC_READ_SEARCH CAP_FOWNER CAP_SETUID CAP_SETGID CAP_MAC_OVERRIDE
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX AF_NETLINK
+ SystemCallFilter=@system-service
+diff --git a/units/systemd-localed.service.in b/units/systemd-localed.service.in
+index a24e61a0cd..a9f3ab8c6e 100644
+--- a/units/systemd-localed.service.in
++++ b/units/systemd-localed.service.in
+@@ -27,6 +27,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX
+ SystemCallFilter=@system-service
+diff --git a/units/systemd-logind.service.in b/units/systemd-logind.service.in
+index 5e090bcf23..af28364bbf 100644
+--- a/units/systemd-logind.service.in
++++ b/units/systemd-logind.service.in
+@@ -28,6 +28,7 @@ WatchdogSec=3min
+ CapabilityBoundingSet=CAP_SYS_ADMIN CAP_MAC_ADMIN CAP_AUDIT_CONTROL CAP_CHOWN CAP_KILL CAP_DAC_READ_SEARCH CAP_DAC_OVERRIDE CAP_FOWNER CAP_SYS_TTY_CONFIG
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX AF_NETLINK
+ SystemCallFilter=@system-service
+diff --git a/units/systemd-networkd.service.in b/units/systemd-networkd.service.in
+index 371ab3a9cf..dd42baf610 100644
+--- a/units/systemd-networkd.service.in
++++ b/units/systemd-networkd.service.in
+@@ -33,6 +33,7 @@ ProtectControlGroups=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX AF_NETLINK AF_INET AF_INET6 AF_PACKET
+ SystemCallFilter=@system-service
+diff --git a/units/systemd-resolved.service.in b/units/systemd-resolved.service.in
+index 9982ecebff..49444298ee 100644
+--- a/units/systemd-resolved.service.in
++++ b/units/systemd-resolved.service.in
+@@ -36,6 +36,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX AF_NETLINK AF_INET AF_INET6
+ SystemCallFilter=@system-service
+diff --git a/units/systemd-timedated.service.in b/units/systemd-timedated.service.in
+index 906bb4326c..7c210a6b16 100644
+--- a/units/systemd-timedated.service.in
++++ b/units/systemd-timedated.service.in
+@@ -25,6 +25,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX
+ SystemCallFilter=@system-service @clock
+diff --git a/units/systemd-timesyncd.service.in b/units/systemd-timesyncd.service.in
+index 4a490b6e16..8f614193ce 100644
+--- a/units/systemd-timesyncd.service.in
++++ b/units/systemd-timesyncd.service.in
+@@ -35,6 +35,7 @@ ProtectKernelTunables=yes
+ ProtectKernelModules=yes
+ MemoryDenyWriteExecute=yes
+ RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ RestrictNamespaces=yes
+ RestrictAddressFamilies=AF_UNIX AF_INET AF_INET6
+ RuntimeDirectory=systemd/timesync
+diff --git a/units/systemd-udevd.service.in b/units/systemd-udevd.service.in
+index 6a3814e5d9..aa81dc5fbc 100644
+--- a/units/systemd-udevd.service.in
++++ b/units/systemd-udevd.service.in
+@@ -27,8 +27,9 @@ WatchdogSec=3min
+ TasksMax=infinity
+ PrivateMounts=yes
+ MemoryDenyWriteExecute=yes
+-RestrictRealtime=yes
+ RestrictAddressFamilies=AF_UNIX AF_NETLINK AF_INET AF_INET6
++RestrictRealtime=yes
++RestrictSUIDSGID=yes
+ SystemCallFilter=@system-service @module @raw-io
+ SystemCallErrorNumber=EPERM
+ SystemCallArchitectures=native
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2019-3844.patch b/meta/recipes-core/systemd/systemd/CVE-2019-3844.patch
new file mode 100644
index 0000000000..721268e741
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2019-3844.patch
@@ -0,0 +1,96 @@
+From 31bc7e4ce2ee4757663c13ed3f98f8fb90c57fd1 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 20 Mar 2019 20:19:38 +0100
+Subject: [PATCH] core: imply NNP and SUID/SGID restriction for DynamicUser=yes
+ service
+Reply-To: muislam@microsoft.com
+
+Let's be safe, rather than sorry. This way DynamicUser=yes services can
+neither take benefit of, nor create SUID/SGID binaries.
+
+Given that DynamicUser= is a recent addition only we should be able to
+get away with turning this on, even though this is strictly speaking a
+binary compatibility breakage.
+
+Signed-off-by: Muminul Islam <muislam@microsoft.com>
+
+CVE: CVE-2019-3844
+Upstream-Status: Backport
+Upstream Commit: https://github.com/systemd/systemd/commit/bf65b7e0c9fc215897b676ab9a7c9d1c688143ba
+---
+ man/systemd.exec.xml | 16 ++++++++++------
+ src/core/unit.c      | 10 ++++++++--
+ 2 files changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/man/systemd.exec.xml b/man/systemd.exec.xml
+index 2bdbc0608e..b02fff4ec8 100644
+--- a/man/systemd.exec.xml
++++ b/man/systemd.exec.xml
+@@ -229,7 +229,9 @@
+         created by the executed processes is bound to the runtime of the service, and hence the lifetime of the dynamic
+         user/group. Since <filename>/tmp</filename> and <filename>/var/tmp</filename> are usually the only
+         world-writable directories on a system this ensures that a unit making use of dynamic user/group allocation
+-        cannot leave files around after unit termination. Moreover <varname>ProtectSystem=strict</varname> and
++        cannot leave files around after unit termination. Furthermore <varname>NoNewPrivileges=</varname> and 
++        <varname>RestrictSUIDSGID=</varname> are implicitly enabled to ensure that processes invoked cannot take benefit or create SUID/SGID files
++        or directories Moreover <varname>ProtectSystem=strict</varname> and
+         <varname>ProtectHome=read-only</varname> are implied, thus prohibiting the service to write to arbitrary file
+         system locations. In order to allow the service to write to certain directories, they have to be whitelisted
+         using <varname>ReadWritePaths=</varname>, but care must be taken so that UID/GID recycling doesn't create
+@@ -357,11 +359,12 @@ CapabilityBoundingSet=~CAP_B CAP_C</programlisting>
+         <varname>RestrictAddressFamilies=</varname>, <varname>RestrictNamespaces=</varname>,
+         <varname>PrivateDevices=</varname>, <varname>ProtectKernelTunables=</varname>,
+         <varname>ProtectKernelModules=</varname>, <varname>MemoryDenyWriteExecute=</varname>,
+-        <varname>RestrictRealtime=</varname>, <varname>RestrictSUIDSGID=</varname> or
+-        <varname>LockPersonality=</varname> are specified. Note that even if this setting is overridden by
+-        them, <command>systemctl show</command> shows the original value of this setting. Also see <ulink
++        <varname>RestrictRealtime=</varname>, <varname>RestrictSUIDSGID=</varname>,
++        <varname>DynamicUser=</varname> or <varname>LockPersonality=</varname> are specified. Note that even
++        if this setting is overridden by them, <command>systemctl show</command> shows the original value of
++        this setting. Also see <ulink
+         url="https://www.kernel.org/doc/html/latest/userspace-api/no_new_privs.html">No New Privileges
+-        Flag</ulink>.  </para></listitem>
++        Flag</ulink>.</para></listitem>
+       </varlistentry>
+ 
+       <varlistentry>
+@@ -1266,7 +1269,8 @@ RestrictNamespaces=~cgroup net</programlisting>
+         identity of other users, it is recommended to restrict creation of SUID/SGID files to the few
+         programs that actually require them. Note that this restricts marking of any type of file system
+         object with these bits, including both regular files and directories (where the SGID is a different
+-        meaning than for files, see documentation). Defaults to off.</para></listitem>
++        meaning than for files, see documentation). This option is implied if <varname>DynamicUser=</varname>
++        is enabled. Defaults to off.</para></listitem>
+       </varlistentry>
+ 
+       <varlistentry>
+diff --git a/src/core/unit.c b/src/core/unit.c
+index a3556cc5ec..55b29c8447 100644
+--- a/src/core/unit.c
++++ b/src/core/unit.c
+@@ -4133,14 +4133,20 @@ int unit_patch_contexts(Unit *u) {
+                                         return -ENOMEM;
+                         }
+ 
+-                        /* If the dynamic user option is on, let's make sure that the unit can't leave its UID/GID
+-                         * around in the file system or on IPC objects. Hence enforce a strict sandbox. */
++                        /* If the dynamic user option is on, let's make sure that the unit can't leave its
++                         * UID/GID around in the file system or on IPC objects. Hence enforce a strict
++                         * sandbox. */
+ 
+                         ec->private_tmp = true;
+                         ec->remove_ipc = true;
+                         ec->protect_system = PROTECT_SYSTEM_STRICT;
+                         if (ec->protect_home == PROTECT_HOME_NO)
+                                 ec->protect_home = PROTECT_HOME_READ_ONLY;
++
++                        /* Make sure this service can neither benefit from SUID/SGID binaries nor create
++                         * them. */
++                        ec->no_new_privileges = true;
++                        ec->restrict_suid_sgid = true;
+                 }
+         }
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7fbd64ced7..2bc51cee2c 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -43,6 +43,12 @@ SRC_URI += "file://touchscreen.rules \
            file://0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
            file://CVE-2019-6454.patch \
            file://sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch \
+           file://CVE-2019-3842.patch \
+           file://CVE-2019-3843_p1.patch \
+           file://CVE-2019-3843_p2.patch \
+           file://CVE-2019-3843_p3.patch \
+           file://CVE-2019-3843_p4.patch \
+           file://CVE-2019-3842.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.23.0


