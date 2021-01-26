Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.12891.1611672215573743881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OsxoBeqc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id j12so10516494pfj.12
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mie517cJWR3ML0MhHICqoHV2ewme4vGPOr3xTZvTM+g=;
        b=OsxoBeqc+573ot+Wu3xz8f5bCmfFQzIALRdgDisdH7LZziihwkVZNopJHur7wG9xwL
         qqTtDf1VOR7dkdXbfsQGc6dUberXtjY55+JIlSz3NhL1DAbiAFs3hu6cqai1RzaKM4KV
         uDV30HjAsY21Tj0nbNs7rVtwDyQkPtF0aCWrp+4qVWvZVGZUrkj0yiFvWhd+gd4mrEho
         eSBa33B++soinj/nhxZID9REy4rkxCLb+5eclpjw6WPOI+d2xUX5oiSvO6k65AY/AXNn
         FLuNN0SWFImlIkJludU4d5IAd299Au/bxjtPOPYNIK2ylnj4ZZ/QGIifsdMX/4lt88hj
         VDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mie517cJWR3ML0MhHICqoHV2ewme4vGPOr3xTZvTM+g=;
        b=NFHzKuRBUEzPX01VfoQrQMLf+IYlSMXk2X1x3Jg4sQjO545zuNNUzvLy1164sebx88
         KaULr0kSnB40y2o43ZJ5iwBmUgLK+h7AY5szLDFpr8xaQjykXoYZfIQmjKW0I1ul1PmX
         evbLfgchAYA6OziUtSprEXk94Tq81o2UOyyd57IzT94EN0JpLNmcumnEM+4MFTuNx8tA
         uFYYvU+QMt7OG9esKGERMNKsYA3reWkWmSNKxTDbYQxk0ZR02hGMqdMt2gQSouENKbE4
         oe65vElmzBRZnRdDHwXO+lNadp1jmYJ6bZ/QE6gSaiPgSA70rDQ9bftolstvHPzZw2sL
         y6Sw==
X-Gm-Message-State: AOAM531gQvttnGlURDQ1HcATrEzOBD0Uo96PikPHCYNFbK66DXhbmxEV
	jhgtN4iHaJC77e/IOAyCkIJo0N5RBHOrByhQMAg=
X-Google-Smtp-Source: ABdhPJzp9X3rM5G0HW78gGzckSWTzx6MhL92Q1VlgJsREkDTEmbEX5W3Yxihm+UNMtJp4GeOrMNA4A==
X-Received: by 2002:a63:7051:: with SMTP id a17mr5932346pgn.26.1611672214659;
        Tue, 26 Jan 2021 06:43:34 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 30/46] pseudo: Drop patches merged into upstream branch
Date: Tue, 26 Jan 2021 04:41:41 -1000
Message-Id: <db280bb06297709403b217bdaa2ca05a65b19082.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7386a116222979e6de60c39d2c094d5f216fb101)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 -------------------
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 --------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  4 +-
 3 files changed, 1 insertion(+), 122 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

diff --git a/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch b/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
deleted file mode 100644
index e4a5356f5c..0000000000
--- a/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 28c760542eecd7c5b35ea88aa2b14d62afbda961 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sat, 21 Nov 2020 17:22:38 +0100
-Subject: [PATCH] pseudo_client: Lessen indentation of
- pseudo_client_ignore_path_chroot()
-
-Change-Id: I739b18efb7a95ce2d2d907d0faf7df539ab9af1c
----
- pseudo_client.c | 45 +++++++++++++++++++++++++--------------------
- 1 file changed, 25 insertions(+), 20 deletions(-)
-
-diff --git a/pseudo_client.c b/pseudo_client.c
-index 116d926..a8bc3dc 100644
---- a/pseudo_client.c
-+++ b/pseudo_client.c
-@@ -1527,28 +1527,33 @@ int pseudo_client_ignore_fd(int fd) {
- 
- int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
- 	char *env;
--	if (path) {
--		if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
--			return 0;
--		env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
--		if (env) {
--			char *p = env;
--        	        while (*p) {
--				char *next = strchr(p, ',');
--				if (!next)
--				    next = strchr(p, '\0');
--				if ((next - p) && !strncmp(path, p, next - p)) {
--		 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
--					return 1;
--				}
--				if (next && *next != '\0')
--					p = next+1;
--				else
--					break;
--			}
--			free(env);
-+
-+	if (!path)
-+		return 0;
-+
-+	if (ignore_chroot && pseudo_chroot && strncmp(path, pseudo_chroot, pseudo_chroot_len) == 0)
-+		return 0;
-+
-+	env = pseudo_get_value("PSEUDO_IGNORE_PATHS");
-+	if (!env)
-+		return 0;
-+
-+	char *p = env;
-+	while (*p) {
-+		char *next = strchr(p, ',');
-+		if (!next)
-+			next = strchr(p, '\0');
-+		if ((next - p) && !strncmp(path, p, next - p)) {
-+ 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
-+			return 1;
- 		}
-+		if (next && *next != '\0')
-+			p = next+1;
-+		else
-+			break;
- 	}
-+	free(env);
-+
- 	return 0;
- }
- 
diff --git a/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch b/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch
deleted file mode 100644
index a657a27f28..0000000000
--- a/meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a1d61d68777373a50ae23b9dd83b428abe2f748d Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sat, 21 Nov 2020 17:30:33 +0100
-Subject: [PATCH] pseudo_client: Simplify pseudo_client_ignore_path_chroot()
-
-This also plugs a memory leak by making sure env is freed.
-
-Change-Id: Ia8635fd2c6b1e85919e4743713a85e0b52c28fac
----
- pseudo_client.c | 21 ++++++++++-----------
- 1 file changed, 10 insertions(+), 11 deletions(-)
-
-diff --git a/pseudo_client.c b/pseudo_client.c
-index a8bc3dc..7dc0345 100644
---- a/pseudo_client.c
-+++ b/pseudo_client.c
-@@ -1538,23 +1538,22 @@ int pseudo_client_ignore_path_chroot(const char *path, int ignore_chroot) {
- 	if (!env)
- 		return 0;
- 
-+	int ret = 0;
- 	char *p = env;
--	while (*p) {
-+	while (p) {
- 		char *next = strchr(p, ',');
--		if (!next)
--			next = strchr(p, '\0');
--		if ((next - p) && !strncmp(path, p, next - p)) {
-- 			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
--			return 1;
--		}
--		if (next && *next != '\0')
--			p = next+1;
--		else
-+		if (next)
-+			*next++ = '\0';
-+		if (*p && !strncmp(path, p, strlen(p))) {
-+			pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n", path);
-+			ret = 1;
- 			break;
-+		}
-+		p = next;
- 	}
- 	free(env);
- 
--	return 0;
-+	return ret;
- }
- 
- int pseudo_client_ignore_path(const char *path) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a9f7aa966a..78c6b01f09 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,11 +4,9 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
-           file://0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch \
-           file://0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch \
            "
 
-SRCREV = "69f205c41902e17933b81b1450636848e8da2126"
+SRCREV = "6fd57da7b1de1a2b6cf530e336d58bb5f8bdd015"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

