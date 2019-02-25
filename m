Return-Path: <george.mccollister@gmail.com>
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
	[209.85.219.177])
	by mail.openembedded.org (Postfix) with ESMTP id D62B97CAC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:07 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id c3so1677400ybo.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h5qLHKWS1mthhihm9SVg/ZuqgUfiY+82Qq8L9tVGTCw=;
	b=J4fymNO3TeVBS740CrFx70JgAatxzD3bqrJWx+sGBEcRAp9PTlaxbv4RARpaDu36gL
	tFZEIYPuQ4ytnZ4ZDaHYNFMvqljKdU7YcUknSKj1Y81S8h0SATVTCwjAewj1qkOUCQPG
	ekzr1heT/uHVxy3JMRO+kyR+D16GVf4jkE1Gj1tyu7NIvhiIs/dCLr8POOhkLM33Itms
	pmf0Wp9W7aSYDOFEW9U62k8xCEnUgh21dGF/qcF1cgRkthgcN9ICGcY/g5BcE7/L0yIf
	YcpAT12VnYsz/DsrTh/MCg86cbWRuw62s0ZGOtUIYhh5QB0raAMj/FwkPBfMEjh5FZuJ
	0FuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h5qLHKWS1mthhihm9SVg/ZuqgUfiY+82Qq8L9tVGTCw=;
	b=EVu0XWXv5PBd7umHZZmW/fMd5SrBVs6D4UYT85IL4/hgbGffwFze5zXfz/0/5bTMn8
	9XP9BW+UGBRHPmHHmr7ZG3UrhuJ+oEfULaommql1xrgPf6nPpWIn4kUVzzf7u58s8plB
	nCx4E6wUAJDG82S8K6WGyS76kbqwtVuGncO4f9m99AFdJ1+p3zb+ySOEP4XSPWsF8bdb
	D+JpVVzlTYv8BqRd/h5L9QSKL9RpiozlJcLCcgQ00aQYQtW63gTvurDBLUSdIYVRstvz
	CJo1EKZu0X0bkHKRi4i8OL27bprBjNz/6KBxOwxgbvj3NckcBO+4N+O8fH8BInVUw3TT
	kzeg==
X-Gm-Message-State: AHQUAuYUD8pL7sy69d0IncyXWjR9nmoLcga/n8reGu/+RGPog0NLZzDq
	erBzHEIt21+eCu6ow3soT/bPs6Q=
X-Google-Smtp-Source: AHgI3IZUlIKIB/ZMhQV62JGfcMWJQ4D3l7ba8WlNzwQqi1NdZjysEpScfaeTL2Bxf33qJcmSkxF5/Q==
X-Received: by 2002:a25:a205:: with SMTP id b5mr15023533ybi.234.1551112688265; 
	Mon, 25 Feb 2019 08:38:08 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:06 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:06 -0600
Message-Id: <bb0395ed7e968dfdc588c6083fd3bb5c9de33634.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 1/8] systemd: fix CVE-2018-15686
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:08 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix the following CVE.

CVE: CVE-2018-15686

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from thud 0ef70603bc983315eb0e8a97958d995a31198c35

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...eserializing-state-always-use-read_line-L.patch | 250 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |   1 +
 2 files changed, 251 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
new file mode 100644
index 0000000000..405300148a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-core-when-deserializing-state-always-use-read_line-L.patch
@@ -0,0 +1,250 @@
+From 56f77f7fcceea2fbb3b4efb8e307dd7784c63115 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Wed, 17 Oct 2018 18:36:24 +0200
+Subject: [PATCH] =?UTF-8?q?=3D=3FUTF-8=3Fq=3Fcore:=3D20when=3D20deserializ?=
+ =?UTF-8?q?ing=3D20state=3D20always=3F=3D?=
+
+ =?UTF-8?q?=20use=20read=5Fline(=E2=80=A6,=20LONG=5FLINE=5FMAX,=20?=
+ =?UTF-8?q?=E2=80=A6)?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This should be much better than fgets(), as we can read substantially
+longer lines and overly long lines result in proper errors.
+
+Fixes a vulnerability discovered by Jann Horn at Google.
+
+CVE-2018-15686
+LP: #1796402
+https://bugzilla.redhat.com/show_bug.cgi?id=1639071
+
+(cherry picked from commit 8948b3415d762245ebf5e19d80b97d4d8cc208c1)
+
+CVE: CVE-2018-15686
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ src/core/job.c     | 19 +++++++++++--------
+ src/core/manager.c | 44 ++++++++++++++++++++------------------------
+ src/core/unit.c    | 34 ++++++++++++++++++----------------
+ src/core/unit.h    |  2 +-
+ 4 files changed, 50 insertions(+), 49 deletions(-)
+
+diff --git a/src/core/job.c b/src/core/job.c
+index c6de8d27e..e0f9cee2f 100644
+--- a/src/core/job.c
++++ b/src/core/job.c
+@@ -28,6 +28,7 @@
+ #include "dbus-job.h"
+ #include "dbus.h"
+ #include "escape.h"
++#include "fileio.h"
+ #include "job.h"
+ #include "log.h"
+ #include "macro.h"
+@@ -1067,24 +1068,26 @@ int job_serialize(Job *j, FILE *f) {
+ }
+ 
+ int job_deserialize(Job *j, FILE *f) {
++        int r;
++
+         assert(j);
+         assert(f);
+ 
+         for (;;) {
+-                char line[LINE_MAX], *l, *v;
++                _cleanup_free_ char *line = NULL;
++                char *l, *v;
+                 size_t k;
+ 
+-                if (!fgets(line, sizeof(line), f)) {
+-                        if (feof(f))
+-                                return 0;
+-                        return -errno;
+-                }
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
++                if (r == 0)
++                        return 0;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+ 
+                 /* End marker */
+-                if (l[0] == 0)
++                if (isempty(l))
+                         return 0;
+ 
+                 k = strcspn(l, "=");
+diff --git a/src/core/manager.c b/src/core/manager.c
+index e837a46f5..423f82c94 100644
+--- a/src/core/manager.c
++++ b/src/core/manager.c
+@@ -2841,22 +2841,19 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
+         m->n_reloading++;
+ 
+         for (;;) {
+-                char line[LINE_MAX];
++                _cleanup_free_ char *line = NULL;
+                 const char *val, *l;
+ 
+-                if (!fgets(line, sizeof(line), f)) {
+-                        if (feof(f))
+-                                r = 0;
+-                        else
+-                                r = -errno;
+-
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0) {
++                        log_error_errno(r, "Failed to read serialization line: %m");
+                         goto finish;
+                 }
++                if (r == 0)
++                        break;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+-
+-                if (l[0] == 0)
++                if (isempty(l)) /* end marker */
+                         break;
+ 
+                 if ((val = startswith(l, "current-job-id="))) {
+@@ -3003,29 +3000,31 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
+         }
+ 
+         for (;;) {
+-                Unit *u;
+-                char name[UNIT_NAME_MAX+2];
++                _cleanup_free_ char *line = NULL;
+                 const char* unit_name;
++                Unit *u;
+ 
+                 /* Start marker */
+-                if (!fgets(name, sizeof(name), f)) {
+-                        if (feof(f))
+-                                r = 0;
+-                        else
+-                                r = -errno;
+-
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0) {
++                        log_error_errno(r, "Failed to read serialization line: %m");
+                         goto finish;
+                 }
++                if (r == 0)
++                        break;
+ 
+-                char_array_0(name);
+-                unit_name = strstrip(name);
++                unit_name = strstrip(line);
+ 
+                 r = manager_load_unit(m, unit_name, NULL, NULL, &u);
+                 if (r < 0) {
+                         log_notice_errno(r, "Failed to load unit \"%s\", skipping deserialization: %m", unit_name);
+                         if (r == -ENOMEM)
+                                 goto finish;
+-                        unit_deserialize_skip(f);
++
++                        r = unit_deserialize_skip(f);
++                        if (r < 0)
++                                goto finish;
++
+                         continue;
+                 }
+ 
+@@ -3038,9 +3037,6 @@ int manager_deserialize(Manager *m, FILE *f, FDSet *fds) {
+         }
+ 
+ finish:
+-        if (ferror(f))
+-                r = -EIO;
+-
+         assert(m->n_reloading > 0);
+         m->n_reloading--;
+ 
+diff --git a/src/core/unit.c b/src/core/unit.c
+index 932f05baa..4c3aa8e96 100644
+--- a/src/core/unit.c
++++ b/src/core/unit.c
+@@ -3346,21 +3346,19 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
+                 rt = (ExecRuntime**) ((uint8_t*) u + offset);
+ 
+         for (;;) {
+-                char line[LINE_MAX], *l, *v;
++                _cleanup_free_ char *line = NULL;
+                 CGroupIPAccountingMetric m;
++                char *l, *v;
+                 size_t k;
+ 
+-                if (!fgets(line, sizeof(line), f)) {
+-                        if (feof(f))
+-                                return 0;
+-                        return -errno;
+-                }
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
++                if (r == 0) /* eof */
++                        break;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+-
+-                /* End marker */
+-                if (isempty(l))
++                if (isempty(l)) /* End marker */
+                         break;
+ 
+                 k = strcspn(l, "=");
+@@ -3637,23 +3635,27 @@ int unit_deserialize(Unit *u, FILE *f, FDSet *fds) {
+         return 0;
+ }
+ 
+-void unit_deserialize_skip(FILE *f) {
++int unit_deserialize_skip(FILE *f) {
++        int r;
+         assert(f);
+ 
+         /* Skip serialized data for this unit. We don't know what it is. */
+ 
+         for (;;) {
+-                char line[LINE_MAX], *l;
++                _cleanup_free_ char *line = NULL;
++                char *l;
+ 
+-                if (!fgets(line, sizeof line, f))
+-                        return;
++                r = read_line(f, LONG_LINE_MAX, &line);
++                if (r < 0)
++                        return log_error_errno(r, "Failed to read serialization line: %m");
++                if (r == 0)
++                        return 0;
+ 
+-                char_array_0(line);
+                 l = strstrip(line);
+ 
+                 /* End marker */
+                 if (isempty(l))
+-                        return;
++                        return 1;
+         }
+ }
+ 
+diff --git a/src/core/unit.h b/src/core/unit.h
+index 8c79d4ed2..08ad1c652 100644
+--- a/src/core/unit.h
++++ b/src/core/unit.h
+@@ -689,7 +689,7 @@ bool unit_can_serialize(Unit *u) _pure_;
+ 
+ int unit_serialize(Unit *u, FILE *f, FDSet *fds, bool serialize_jobs);
+ int unit_deserialize(Unit *u, FILE *f, FDSet *fds);
+-void unit_deserialize_skip(FILE *f);
++int unit_deserialize_skip(FILE *f);
+ 
+ int unit_serialize_item(Unit *u, FILE *f, const char *key, const char *value);
+ int unit_serialize_item_escaped(Unit *u, FILE *f, const char *key, const char *value);
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index a409b18297..28f3dafbb5 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -54,6 +54,7 @@ SRC_URI += "file://touchscreen.rules \
            file://libmount.patch \
            file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
+           file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


