Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3725.1793405748023250408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=H5PqKBCq;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7670825e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405746; x=1794010546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3d8e1J0kLtWJ5JU8A/W7Dm2rw4lhderkEP3c8nbb9/c=;
        b=H5PqKBCqagqTet9JjqGbJtOHTreq7N/j0DCEdNKsLEgW/26Fn23GkYgmnVUUmcQ63p
         m8utK3xp68njWPRXq1IYggUaEl3XemJVDneYpaGlu8HVEmiHHVfXDbRoqQHgItBiEi6v
         OZ4cxQ6SoOmVhGOdOQuHufrCCiC+0jMeL4Y7Hh1/4bGY0C7PgY0leV9cgR57+QHPUY6r
         Vw5ZHuQGXp3QodIH+PLZUptC4yg/MO4gjNcLzAIlIJWI2vU7h80KrYC71bOIDhSn3CU2
         re2xoi71xK5mwfAVLzXgn3kFddvLw3zsXrzdoGPwJE9YwAutTwPa+hKvnWSloLsMUKZ+
         TnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405746; x=1794010546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3d8e1J0kLtWJ5JU8A/W7Dm2rw4lhderkEP3c8nbb9/c=;
        b=LvOYjJEg9u50hjS0k+nu/Lxl3+J338J8gGpoHjfAxKyqMq7qoRwDo3hNfvyx7XH80l
         jSYm5yKa5m26PMt0J+lA9THQc2ZxSvxB83vkXroJE1U7LmVcLdj6dhJR6ToNqozjP070
         UrNoxkwV1kPNAkeAwcAqIR4L0RE35E8vGy5Fs6McJR0p1ptHiEeY7tnem46lUAno43aA
         zD7+vuGSi03VkJ2d5Du1n827bjL3sPCIyGS7ZjOgnbWdwqeJRcOhiZ8DsG5r3d3kBEfb
         YdRdiaB40cZfvo/A82P6NBrESgHsbXKWMhyDK7Wxy+nD7hAOJlfWH0XG7arpuk5dKCgV
         xGvg==
X-Gm-Message-State: AFq9FYJrWWFE8VfsddQThZZs0vW+Y3Z29eIpkEXOJ6D7zKPhD8WPZvR5
	eiC5kuy+xLgSyjipR/DDUfW3r+s2XFxwl6BsArIFSOAuclxeTbBPo898hhGqsLAlvqs/hou8Qj0
	4GOWLjAA=
X-Gm-Gg: AYBFou0sbG8z2X8Td2dbuNz3kpWTXRXfEyxGotCZWa2u/vTwm/JOQXH+yzKaCkJtYKQ
	2m700e5yCxlD4spiAdDmZuGqSx9xDRO2Vok6YJT4aCFG7vaB/0r6pIXhngPfk33nyRYpo2l06HT
	hh4ZWH4LlorQIvZGuCkN+I6FotrELRcdC7Cgc3uReJg5jB6wQTORuYLFXvhGpBoMlMuk+Leau5h
	A9HsK7QHTyV3xaKfhoei7wZfnwOqWNBVEtSwC0shFrxklhYprJjHYJrq3AvzuogySlpzcTC3fN/
	0cIIcoSPGXa+apY5eyjmPQZQC2d5v2Pw/KY6JIhyYY0QT+f/fxf33/IxX1M+uCaU7HFQo1vw11y
	ZcWvzZr47Nhg7g0bP2uB7YTxJ/LPc4kbrXYXp4Ia+IeGGnVAE1ZFv7IE+0Kri0X5BoP1m23HER9
	Uzn93rDnZ3r23g+LsKGbnCcndOs5dzwg9KDSI3zb2SOh1I1vL/jDvFcQS6UEeEQq2FWjCQITvEn
	96yg9/OLamoNCP1nHjfskcRIdqjXzhisdDRVs4BDOrmq3Nwzm8URDXYYKD4bvRCqh9EJiAimpY+
	sNKfpmfswX/HoNYrAokYbp7mY739siEkZ+ATvz6yoR5EXLXeIF17ELxlmqQbnzMUehrW9vZL7d0
	Qt/YDYjISjU++vvk2R+t8PqJ3MsxMRQbXwDTrLALhv6b7DE9rog==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr87415555e9.18.1793405746282;
        Fri, 30 Oct 2026 17:15:46 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/55] util-linux: patch CVE-2026-78408
Date: Sat, 31 Oct 2026 01:14:27 +0100
Message-ID: <3893b4b5363b0c6da7506bd4282979ef5c8bfb44.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249081
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.6 release.

Regression patch as submitted to Wrynose is not needed as that code is
not yet present in 2.39.3.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: util-linux 2.41.6 release notes:
https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.6-ChangeLog ]
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2026-78408.patch           | 98 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6598a92b30f..2eb9251a704 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -57,6 +57,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-53613.patch \
            file://CVE-2026-53612.patch \
            file://CVE-2024-28085-0003.patch \
+           file://CVE-2026-78408.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
new file mode 100644
index 00000000000..36f3c91ddc5
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-78408.patch
@@ -0,0 +1,98 @@
+From 43ec8a89f6c99130727084b3496a2ffd2b4200f0 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 31 Aug 2026 17:03:32 +0200
+Subject: [PATCH] nsenter, unshare: add O_CLOEXEC to all open() calls
+ [CVE-2026-78408]
+
+Add O_CLOEXEC (and EFD_CLOEXEC for eventfd) as defense in depth to
+all file descriptor creation sites in nsenter and unshare. All these
+descriptors are already explicitly closed before exec, but O_CLOEXEC
+provides a safety net against future code changes that might
+accidentally introduce a leak path.
+
+No functional change.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2026-78408
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/43ec8a89f6c99130727084b3496a2ffd2b4200f0]
+Backport notes:
+- 2 hunks left out as that code is not yet present in 2.39.3.
+- Verified that no other "open(" calls are in this version in patched files.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sys-utils/nsenter.c | 6 +++---
+ sys-utils/unshare.c | 8 ++++----
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/sys-utils/nsenter.c b/sys-utils/nsenter.c
+index cf6c83174..9d9d90a48 100644
+--- a/sys-utils/nsenter.c
++++ b/sys-utils/nsenter.c
+@@ -134,7 +134,7 @@ static void open_target_fd(int *fd, const char *type, const char *path)
+ 	if (*fd >= 0)
+ 		close(*fd);
+ 
+-	*fd = open(path, O_RDONLY);
++	*fd = open(path, O_RDONLY | O_CLOEXEC);
+ 	if (*fd < 0)
+ 		err(EXIT_FAILURE, _("cannot open %s"), path);
+ }
+@@ -492,7 +492,7 @@ int main(int argc, char *argv[])
+ 
+ 	/* Remember the current working directory if I'm not changing it */
+ 	if (root_fd >= 0 && wd_fd < 0 && wdns == NULL) {
+-		wd_fd = open(".", O_RDONLY);
++		wd_fd = open(".", O_RDONLY | O_CLOEXEC);
+ 		if (wd_fd < 0)
+ 			err(EXIT_FAILURE,
+ 			    _("cannot open current working directory"));
+@@ -515,7 +515,7 @@ int main(int argc, char *argv[])
+ 
+ 	/* working directory specified as in-namespace path */
+ 	if (wdns) {
+-		wd_fd = open(wdns, O_RDONLY);
++		wd_fd = open(wdns, O_RDONLY | O_CLOEXEC);
+ 		if (wd_fd < 0)
+ 			err(EXIT_FAILURE,
+ 			    _("cannot open current working directory"));
+diff --git a/sys-utils/unshare.c b/sys-utils/unshare.c
+index 05db627be..c47739862 100644
+--- a/sys-utils/unshare.c
++++ b/sys-utils/unshare.c
+@@ -108,7 +108,7 @@ static void setgroups_control(int action)
+ 		return;
+ 	cmd = setgroups_strings[action];
+ 
+-	fd = open(file, O_WRONLY);
++	fd = open(file, O_WRONLY | O_CLOEXEC);
+ 	if (fd < 0) {
+ 		if (errno == ENOENT)
+ 			return;
+@@ -125,7 +125,7 @@ static void map_id(const char *file, uint32_t from, uint32_t to)
+ 	char *buf;
+ 	int fd;
+ 
+-	fd = open(file, O_WRONLY);
++	fd = open(file, O_WRONLY | O_CLOEXEC);
+ 	if (fd < 0)
+ 		 err(EXIT_FAILURE, _("cannot open %s"), file);
+ 
+@@ -219,7 +219,7 @@ static void settime(time_t offset, clockid_t clk_id)
+ 
+ 	len = snprintf(buf, sizeof(buf), "%d %" PRId64 " 0", clk_id, (int64_t) offset);
+ 
+-	fd = open("/proc/self/timens_offsets", O_WRONLY);
++	fd = open("/proc/self/timens_offsets", O_WRONLY | O_CLOEXEC);
+ 	if (fd < 0)
+ 		err(EXIT_FAILURE, _("failed to open /proc/self/timens_offsets"));
+ 
+@@ -289,7 +289,7 @@ static pid_t fork_and_wait(int *fd)
+ 	pid_t pid;
+ 	uint64_t ch;
+ 
+-	*fd = eventfd(0, 0);
++	*fd = eventfd(0, EFD_CLOEXEC);
+ 	if (*fd < 0)
+ 		err(EXIT_FAILURE, _("eventfd failed"));
+ 
