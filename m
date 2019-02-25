Return-Path: <george.mccollister@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE50D7CAF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:12 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id s5so4025277ybp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8XEd1eWzqMbCgvL8aGIh8SwxBrvHA+jFjNg8lYmD+OM=;
	b=IGgNayBNR2zv7KhHMcvW9ra56+AjbMa6dez3bv20uYTgtMipub2x8JAzRV/FU1kb4w
	w2GBjNnnCpwjDWqaI8TC26R2hqu/xVvuPFm2H0Ycehxjx/KmViMSvGKT+s+JONNSQ1sW
	RLgfHLgj1tqkdWjRwTICvSjMtiCTHdJfAD22K3XeyCWGeR4BWUILf72NCNSi9YPPYjqt
	kHsCzUchUg4iYsr1lE1Mi0FbHHrhZn/VX4GFV8omeuJpzbbdufzWB5QaF+GRBBLxOiS1
	J0CUoRPuZhY8OfEDwpwRG+/STeOWRCpxQsjoakKfsP5Up1sTUzlABUEO5aVTJD4YlN7A
	gOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8XEd1eWzqMbCgvL8aGIh8SwxBrvHA+jFjNg8lYmD+OM=;
	b=T0TXwB17nlC45I7LDdB+FnJhfGEix80x1X2rBLifEpLkcDypOvdSdHtfbwNbd1flDw
	oE608ibuUIuIO4pbp5+AVtIb6JqRqekxVsYhfJ9GvgtTfkj0TiE8gF0qo+wbPhs+fl8j
	IQ89Kp/x2nfyv8S3h7tGv/cvlpXMlq7T/XIRnpX70gYSJv2Qg0k98cTWWb+MlC9h0C47
	P3PVio9jbouH0Jci0LrY6Ux0tvaI6iDiUrxcjRw68s+7ip2gc6OqUhyrFex71+c8ZH73
	5s0pfkQOfz0KfG/tWNPA6IBmFgyBxMieXJMPGqXJpCwE0MS/kjgWTO/lCn8ZL4/YQqLf
	ohsA==
X-Gm-Message-State: AHQUAubnVmWG2anUACXE9NjQjbECF1KUxmSacwgaJZL5DOJPIoHZ2e00
	+PqKlJWkVwHJVYTS4+HBWNmc8ig=
X-Google-Smtp-Source: AHgI3IZTtsmGAGV5XTYfeREQ4Ylb783U/MouG8WvXy+VXR4npSYHqV24uYlMXvtwLEIMMwJPLgQ9Jg==
X-Received: by 2002:a25:4e89:: with SMTP id
	c131mr14778784ybb.383.1551112693593; 
	Mon, 25 Feb 2019 08:38:13 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:12 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:11 -0600
Message-Id: <e5feafbcc15e09f02383c84a24374df31c0ca5e9.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 6/8] systemd: Security fix CVE-2018-16866
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:13 -0000

From: Marcus Cooper <marcus.cooper@axis.com>

Affects < v240

Signed-off-by: Marcus Cooper <marcusc@axis.com>

From v2 patch on openembedded-core@lists.openembedded.org
Incresed file name number from 0026 to 0027.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch | 49 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch

diff --git a/meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch b/meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
new file mode 100644
index 0000000000..3925a4abbb
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
@@ -0,0 +1,49 @@
+From ebd06c37d4311db9851f4d3fdd023de3dd590de0 Mon Sep 17 00:00:00 2001
+From: Filipe Brandenburger <filbranden@google.com>
+Date: Thu, 10 Jan 2019 14:53:33 -0800
+Subject: [PATCH] journal: fix out-of-bounds read CVE-2018-16866
+
+The original code didn't account for the fact that strchr() would match on the
+'\0' character, making it read past the end of the buffer if no non-whitespace
+character was present.
+
+This bug was introduced in commit ec5ff4445cca6a which was first released in
+systemd v221 and later fixed in commit 8595102d3ddde6 which was released in
+v240, so versions in the range [v221, v240) are affected.
+
+Patch backported from systemd-stable at f005e73d3723d62a39be661931fcb6347119b52b
+also includes a change from systemd master which removes a heap buffer overflow
+a6aadf4ae0bae185dc4c414d492a4a781c80ffe5.
+
+CVE: CVE-2018-16866
+Upstream-Status: Backport
+Signed-off-by: Marcus Cooper <marcusc@axis.com>
+---
+ src/journal/journald-syslog.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/journal/journald-syslog.c b/src/journal/journald-syslog.c
+index 9dea116722..809b318c06 100644
+--- a/src/journal/journald-syslog.c
++++ b/src/journal/journald-syslog.c
+@@ -194,7 +194,7 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
+         e = l;
+         l--;
+ 
+-        if (p[l-1] == ']') {
++        if (l > 0 && p[l-1] == ']') {
+                 size_t k = l-1;
+ 
+                 for (;;) {
+@@ -219,7 +219,7 @@ size_t syslog_parse_identifier(const char **buf, char **identifier, char **pid)
+         if (t)
+                 *identifier = t;
+ 
+-        if (strchr(WHITESPACE, p[e]))
++        if (p[e] != '\0' && strchr(WHITESPACE, p[e]))
+                 e++;
+         *buf = p + e;
+         return e;
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index e6ef385f52..b53221896f 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -60,6 +60,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            file://0025-journald-set-a-limit-on-the-number-of-fields-1k.patch \
            file://0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch \
+           file://0027-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


