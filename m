Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.352.1611586381920554716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=073yQQqI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id l18so2743741pji.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2uaThd8TASlgo7qT2wJU4QLaYD1DIpuf5LNY5FHCOuA=;
        b=073yQQqIiPSsa900HyutpZKDvYy4hraPDdbb2iXIKyg2XwZU+zeno5Wu0rsRFI9z+/
         Bs19J1oMqYKaniv1pDM9Dro6dtHBv5OWMP1jI1j7KvDRyj8iJtj3eyvxg9M7guTsKYvc
         c+bM9CfbRpQwzCDsoz9zpYRSu24Hdm2Vsy78QD+b6T4hyEZzE5DVqmqv6tNLQXHo0jJv
         gL/QlkOXWNf79e7byVQfwvwLtjSJiuTLS2jHEsX5Ny3lKWNBUG431zK6d+oulL70sPWX
         SPF3bDyBKvMLnni9Js+/O9p0wGIchmowzXGDRaph77s488RftEp3ReYeTdQqsjdDb4p9
         r28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2uaThd8TASlgo7qT2wJU4QLaYD1DIpuf5LNY5FHCOuA=;
        b=lmAHEFgzQo2kKoAF1Jrf+sP5NN79ASHcZuX4VwfuJOHoCUwzHGSZtntiuiZqBfgVbm
         E6CWZkaLNEY7Viny2XUkLAE54+SVe4fMTGPM+vUOeX0dsKh9VKbHQKBZ8e+TstfS7ngY
         sREk58zeV/U24H9MgLbFGOdSUo+tGiitQmLS4H+jKl3qo/sM8L8B80FWbjLEyL8/t56O
         J6ZLiZjyrtu6RJkzI58ZKPeAoh4uQU18a7djbVQj0zWZAWNhbIAviU0YP1d9lCOQ5ZAk
         HNo4sUdB0JUZACeFn0Vq58Rt61h2Nko6F/nir/1QMZdGf9gLZuu6ZxIWjLinQtqSM5yH
         5vFA==
X-Gm-Message-State: AOAM531LYhXjd7rySZydSdsPvk95CqFn5BwaPXj9MfRsvXViDfdqcLI+
	PsHThxdScQiqw7Wti22tux8Tf1CwHvzS5aPYvmA=
X-Google-Smtp-Source: ABdhPJxVvPf8jQCkUfuuXw/7yvfKPTAFNwPAE8q/2QZwUh6XlI8AgUZdMqLzEkc/1m+s9yHSqjuAIg==
X-Received: by 2002:a17:902:44d:b029:de:c063:85c9 with SMTP id 71-20020a170902044db02900dec06385c9mr786539ple.35.1611586380990;
        Mon, 25 Jan 2021 06:53:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/47] pseudo: Simplify pseudo_client_ignore_path_chroot()
Date: Mon, 25 Jan 2021 04:51:00 -1000
Message-Id: <07efc77586dc455c53f2d3f3f182000d32066a56.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This also plugs a memory leak in pseudo_client_ignore_path_chroot().

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8dddd5054a1c4e20a3e32fa9ab31f5859d6fbb6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 +++++++++++++++++++
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +
 3 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

diff --git a/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch b/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
new file mode 100644
index 0000000000..e4a5356f5c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
@@ -0,0 +1,69 @@
+From 28c760542eecd7c5b35ea88aa2b14d62afbda961 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sat, 21 Nov 2020 17:22:38 +0100
+Subject: [PATCH] pseudo_client: Lessen indentation of
+ pseudo_client_ignore_path_chroot()
+
+Change-Id: I739b18efb7a95ce2d2d907d0faf7df539ab9af1c
+---
+ pseudo_client.c | 45 +++++++++++++++++++++++++--------------------
+ 1 file changed, 25 insertions(+), 20 deletions(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index 116d926..a8bc3dc 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1527,28 +1527,33 @@ int pseudo_client_ignore_fd(int fd) {
+ 
+ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
+ 	char *env;
+-	if (path) {
+-		if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
+-			return 0;
+-		env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
+-		if (env) {
+-			char *p = env;
+-        	        while (*p) {
+-				char *next = strchr(p, ',');
+-				if (!next)
+-				    next = strchr(p, '\0');
+-				if ((next - p) && !strncmp(path, p, next - p)) {
+-		 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
+-					return 1;
+-				}
+-				if (next && *next != '\0')
+-					p = next+1;
+-				else
+-					break;
+-			}
+-			free(env);
++
++	if (!path)
++		return 0;
++
++	if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
++		return 0;
++
++	env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
++	if (!env)
++		return 0;
++
++	char *p = env;
++	while (*p) {
++		char *next = strchr(p, ',');
++		if (!next)
++			next = strchr(p, '\0');
++		if ((next - p) && !strncmp(path, p, next - p)) {
++ 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
++			return 1;
+ 		}
++		if (next && *next != '\0')
++			p = next+1;
++		else
++			break;
+ 	}
++	free(env);
++
+ 	return 0;
+ }
+ 
diff --git a/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch b/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch
new file mode 100644
index 0000000000..a657a27f28
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch
@@ -0,0 +1,50 @@
+From a1d61d68777373a50ae23b9dd83b428abe2f748d Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Sat, 21 Nov 2020 17:30:33 +0100
+Subject: [PATCH] pseudo_client: Simplify pseudo_client_ignore_path_chroot()
+
+This also plugs a memory leak by making sure env is freed.
+
+Change-Id: Ia8635fd2c6b1e85919e4743713a85e0b52c28fac
+---
+ pseudo_client.c | 21 ++++++++++-----------
+ 1 file changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/pseudo_client.c b/pseudo_client.c
+index a8bc3dc..7dc0345 100644
+--- a/pseudo_client.c
++++ b/pseudo_client.c
+@@ -1538,23 +1538,22 @@ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
+ 	if (!env)
+ 		return 0;
+ 
++	int ret = 0;
+ 	char *p = env;
+-	while (*p) {
++	while (p) {
+ 		char *next = strchr(p, ',');
+-		if (!next)
+-			next = strchr(p, '\0');
+-		if ((next - p) && !strncmp(path, p, next - p)) {
+- 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
+-			return 1;
+-		}
+-		if (next && *next != '\0')
+-			p = next+1;
+-		else
++		if (next)
++			*next++ = '\0';
++		if (*p && !strncmp(path, p, strlen(p))) {
++			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
++			ret = 1;
+ 			break;
++		}
++		p = next;
+ 	}
+ 	free(env);
+ 
+-	return 0;
++	return ret;
+ }
+ 
+ int pseudo_client_ignore_path(const char *path) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2e13fec540..50933c4bc1 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,6 +4,8 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
+           file://0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch \
+           file://0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch \
            "
 
 SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
-- 
2.25.1

