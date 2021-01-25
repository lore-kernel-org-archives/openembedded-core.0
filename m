Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.365.1611586390952712957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fpuhL8hA;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id kx7so8557408pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mie517cJWR3ML0MhHICqoHV2ewme4vGPOr3xTZvTM+g=;
        b=fpuhL8hAM6G2sSoMxxjBknf1Gi26zn+hTtX6Kakmx6G1iWk4V7FXoLWRubqdG9kgRF
         1JGNgZwJRK+ybCZn9pQ5riDznnuifQBRLiJpbfwVpI78+9Gq7i5FzLIFvK5xi8g/qK7e
         2ski0Tit4kCAqJoE62HUEdbZPPJYKj1buFr33q0ZA1iumh7dUaZRJZM5a+ef1HU9CznO
         Gv5JKJN0koOKhjMFkPks1M8pHKRUzmx9Krx3XPEHVe9RjfBnsbqOaF2AdrPnTyhBHRsQ
         5mCEBOKJXQFvn6eLMHiOZ/Io8LBm7KTxxlGb+moNtdSsO7p/KWT4/4htu2bWA0WpvsVD
         WD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mie517cJWR3ML0MhHICqoHV2ewme4vGPOr3xTZvTM+g=;
        b=k5o1EGT1Am1Av7W0hB8laqnBZ3ewP7gq25W/ijRQvTZpp9M9ENGGRlNHsbot2+Dn+s
         2gVKGzbnSwuaVQHXsN547A3GkKg7a5giGRZOweDLS3uj/hUjasq1VDAFesXL9CzUZqte
         Sx8U4SsljbuKFg8y+LCBC4tlpiAq10h+iGrIepC4vzoML/sRyJnMOkSXuYrJpCpPw+i3
         epzEoK1qVXktak1H26LHloZ4TLWBkffxZ3HuEuMt/QXPW6jodfpclilPkpVSpqA9Nlrv
         thHSg70W/+wgNZ7OKxAR9DDtdpmtZUEkHGPjlD1+VOXJR8hIpm+KR6j1rGOJFyVLlh+E
         3P/w==
X-Gm-Message-State: AOAM531T8mo2wtY5WhW6LP1E6lgVz+pjbNAuAOUoJJ/524Sm/qmJ6H6x
	99kY1VUffamGgqjOKZ2PXoZosr8E45YSS58j9Xk=
X-Google-Smtp-Source: ABdhPJxHf62APNl46L/tPvp2gMRDNtfZJkt35KaObWUx0oTY9tSXZ1m6/kIcVywPq0n307VIgI9vyg==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr572584pjw.202.1611586389894;
        Mon, 25 Jan 2021 06:53:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/47] pseudo: Drop patches merged into upstream branch
Date: Mon, 25 Jan 2021 04:51:03 -1000
Message-Id: <102896d67d00cb4bf67bd0035e0cc76d4f4d415c.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
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

