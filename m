Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.11303.1608137684617452076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 08:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQs1/58L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 3so3109314wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 08:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGAvJfn5x2W5E9M267GG3FqrsppTWV2oC1Zpt7zU86s=;
        b=fQs1/58LkcLhKmpDOU+YBCpNf8Zzn+Vga+TI81GmVPojyK+NJBVs0KNqxwYrOaSvac
         KZqZiLoZM/qETBiH8UELy5HhZgXMXzi4jLgBYLkz7PkWWzdeola6MXxG5YRSIc3wPZM+
         L/TQCPGYtQZtqbLNe5guaJBLUYvLO6TA4Pldo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGAvJfn5x2W5E9M267GG3FqrsppTWV2oC1Zpt7zU86s=;
        b=pklcTbGqaxnZETPkY+kINjspToWXFNBNThTKE60H3UFyW90WTlWdkqqSi4ZszRHecD
         mBCYwPbH0vm55VmvBVpDllXLb0YNBrqiVjwnfyitzKS7dJbZ1LxEl/aDRwIO/KnUwuOW
         vy/bhLX/HmTCm4XdYfgKjFN838aqzDbuZh9R4HXuKEgKD0O+q4raxpFYxIx+ZN8Wu+Xj
         O0yKUTDRMSIBvMuReb2eseEwm5hnzfrUcLN0eSwSiWdpuzSvbyhtztv/AkTZsBGNZOah
         Hjdx3rIxIAu6OKhZ5SZfyQ6XjnXiZGnGuuRgueW2XE6/ndmbKldfrXt7zUNB49zqbUkF
         C4PQ==
X-Gm-Message-State: AOAM5339Y2emvA9jOocHiPel4QpoOTpnGBj3K/4ExZ7Kq8AFh6OJAH1V
	4QkAjaP3KxrTUJwDulEsPmR9SdtZiKBrWw==
X-Google-Smtp-Source: ABdhPJxd2M2cupvFWDB4X23lW+vEaaXiPe/sZr5lSwNtvhHZT8cEBC6XHGgj5c71DjNWiLjE8eDjHA==
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr4389079wmb.98.1608137682761;
        Wed, 16 Dec 2020 08:54:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id s20sm3352698wmj.46.2020.12.16.08.54.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 08:54:42 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Drop patches merged into upstream branch
Date: Wed, 16 Dec 2020 16:54:41 +0000
Message-Id: <20201216165441.3898345-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ssen-indentation-of-pseudo_client_ig.patch | 69 -------------------
 ...mplify-pseudo_client_ignore_path_chr.patch | 50 --------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  4 +-
 3 files changed, 1 insertion(+), 122 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0003-pseudo_client-Simplify-pseudo_client_ignore_path_chr.patch

diff --git a/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch b/meta/recipes-devtools/pseudo/files/0002-pseudo_client-Lessen-indentation-of-pseudo_client_ig.patch
deleted file mode 100644
index e4a5356f5c7..00000000000
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
index a657a27f285..00000000000
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
index a9f7aa966a9..78c6b01f094 100644
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

