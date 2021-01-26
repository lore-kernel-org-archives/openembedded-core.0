Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.12889.1611672208065321425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HX+YOR2O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id i63so10524116pfg.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2uaThd8TASlgo7qT2wJU4QLaYD1DIpuf5LNY5FHCOuA=;
        b=HX+YOR2OGsrf4nsT+8CHQI8epgIqbOCpg3ijg/jTZG/l5CvOfgwu8xYarCDr5LigYf
         R/5wYLWGK/q7V1jk3VMlSuPVwxKInRm37+gNwinPG4mCj1S0xP1Eq/revXamk/ZzfqAB
         T0q1hRnHHDZuoXzFBSDiOsLuheTHuM+v5gbNHZgpaz8yWH/wG618n4MJzEbFHiJpOFOh
         SHR/A+slA360Uf7LwjAnJQwDdYXiayQnj4PRQfbgUbDntrpY4ozJAlQW/STD6bYI1G4F
         6t58R7RfnipC0eEn4tilj749nkiixjJs9lU8DT1PVcyuWnABX1VRyC9vTI/TgJhDDZjq
         QKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2uaThd8TASlgo7qT2wJU4QLaYD1DIpuf5LNY5FHCOuA=;
        b=t6QsPorNLz9KRWFhmryyWM0y3OMgTydKQR3EdHWQAaGOq0f4ZZUWVDGWECwQpt6DXQ
         /5/iXYcxVPFWHXBmQdl7w740KSQsRSbymbccmfYFCSXRTuyyoaWp4g78nQK32LorEbRk
         CKamEZMZPkLVF2C8I1O3pLdfGNKkxGXLB94SEBG/d3M+qf+iiASqkX55hpevCOhJnOsI
         wscs8q6kXlRyIlzDvs1COY1aFOHRbza43fpjzANEWjeLtR2skGzig2DXnTemPwx8LFHb
         /CMYDQxYUX4gXWMmBCJlCTWLm3sJhSSjULgcs7zp5wK+AmpovL5OcAJR47A/ZSulPZCJ
         V+zQ==
X-Gm-Message-State: AOAM530q5rp3++CzImy63E5G2+yi98NToSYeXmA3Cq4L84Xvx8/9Sntg
	sgQghWj3z8wh0UQ4r99yCtd0UYxukL/DkWkIjOc=
X-Google-Smtp-Source: ABdhPJzeTQ/XVQu4CrdT/ZD5O3yaO144NmLOkUopcLy8aFak4AbQSKIqDTb8pZWM4+E/A0ld2UjB9A==
X-Received: by 2002:a63:4861:: with SMTP id x33mr6094317pgk.301.1611672207104;
        Tue, 26 Jan 2021 06:43:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 27/46] pseudo: Simplify pseudo_client_ignore_path_chroot()
Date: Tue, 26 Jan 2021 04:41:38 -1000
Message-Id: <1109c9946268b6178c298ee2b50adc3da93bec3b.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

