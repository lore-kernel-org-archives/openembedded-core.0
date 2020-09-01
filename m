Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.8667.1599000770194390004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JYsyd2wL;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id b12so3032538edz.11
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 15:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A9XcoglKBjte+lhdY8rd/0TcIMQbh7Ip4GWNw2CLL+Y=;
        b=JYsyd2wLcD8ZfN1P3ht61o7bc9GiYMCNF++xIdZHzq9I1afNezexqovKXOQvLjzupj
         uBWwhGz6V3WoAR1Q/Bc0x8oh6fS7nw3xntFb3fXzB5iamtrK2GYCKrc3xqv2+07fWnbg
         WqCiz6gkGm43mU7soF3X6ndttrUEHtC45yHGHUdONCrksAahTbIyxrie1j46DnxxhPOb
         rk/jBl6va+QScyYsssQ97RqjI0TK511fe4ygrMt9DsNo2ZhVw8F577B33cVPu15uwFUL
         Xx9rdxllFRYGW90Uh3HJNb0V61/qR8mtdJ2Wv2OUUo1cFa7ARp9ebpQKPkjfEOupOML4
         v1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A9XcoglKBjte+lhdY8rd/0TcIMQbh7Ip4GWNw2CLL+Y=;
        b=T8ioHWtUOovqW82/T5Pgr1CjndPOwQ7FEmbC3JFG6SZSb+1JSVpD6UWc67xjT7PxCV
         F35K4k6Uju+jIKK8r8gnsyvie5uxBaUnOoAtLT8ZwYlJWUYI74NX3F3+1kX6Ys0vGxnf
         jkZH8ZSirgXTVn64ICnYwFSmDVvpaCKRjKLqT+p/+6Ou9NYnH7KzGyXSvwfkTzSh6fPi
         JAyMfQkvolhob1+zkC7KsqI5PMg4+6apjk2Av9OhW6McsVY2FFj4nblNiHgF+O83HEV0
         OO5IA0LYxY6wzFzD1+k2bcI5eRZiBNoUWhi0MQjAiNehY4Ej+APtUSUAieRHbjjDesrp
         4idw==
X-Gm-Message-State: AOAM5327/Dg9gTW+tiWnMj88UydN7htwHULFBuAQX+0M0iR2QkBIdW0d
	16nU7XQ/IzRRzLeqoHzVIADq/XFVslo=
X-Google-Smtp-Source: ABdhPJxVGyhFNxlgGxybv0ey24uDGhm6AzOKQI8wIQlTyRcV2UIyrFw2yFT8blwyjPWIxcXhuN13cg==
X-Received: by 2002:a50:cd5d:: with SMTP id d29mr4048681edj.318.1599000768070;
        Tue, 01 Sep 2020 15:52:48 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:b114:707f:d9f1:179])
        by smtp.gmail.com with ESMTPSA id v5sm2417333ejv.114.2020.09.01.15.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:52:47 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH v2 2/3] iputils: upgrade s20190709 -> s20200821
Date: Wed,  2 Sep 2020 00:53:23 +0200
Message-Id: <20200901225324.17870-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200901225324.17870-1-changhyeok.bae@gmail.com>
References: <20200901225324.17870-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- libgcrypt is not required anymore because the md5 implementation was
  part of this project.
- ninfod patches are upstreamed and other patch is not required anymore.
- Add tftpd in PACKAGECONFIG

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-iputils-Initialize-libgcrypt.patch   | 55 -------------------
 ...riable-name-to-avoid-colliding-with-.patch | 51 -----------------
 ...-fix-systemd-Documentation-url-error.patch | 28 ----------
 ...tils_s20190709.bb => iputils_s20200821.bb} | 11 ++--
 4 files changed, 4 insertions(+), 141 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
 rename meta/recipes-extended/iputils/{iputils_s20190709.bb => iputils_s20200821.bb} (86%)

diff --git a/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch b/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
deleted file mode 100644
index b56804cebe..0000000000
--- a/meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 8576e0c218634e6f7ed1b6ff02fa164fb0c75f86 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 29 Apr 2020 03:50:32 +0000
-Subject: [PATCH] iputils_md5dig.h: Initialize libgcrypt
-
-Initialize libgcrypt on first use otherwise
-there comes below warning when check the status
-of the ninfod.service.
- # systemctl status ninfod.service
- * ninfod.service - Respond to IPv6 Node Information Queries
- Loaded: loaded (/lib/systemd/system/ninfod.service; enabled; vendor preset: enabled)
- Active: active (running) since Wed 2020-04-29 05:18:21 UTC; 36s ago
- Docs: man:ninfod(8)
- Main PID: 347 (ninfod)
- Tasks: 1 (limit: 9382)
- Memory: 1.2M
- CGroup: /system.slice/ninfod.service
- `-347 /sbin/ninfod -d
-
- Apr 29 05:18:21 intel-x86-64 systemd[1]: Started Respond to IPv6 Node Information Queries.
- Apr 29 05:18:24 intel-x86-64 ninfod[347]: Libgcrypt warning: missing initialization - please fix the application
-
-Upstream-Status: Inappropriate [the upstream avoids linking to crypto libraries in
-                   commit 214ed83 common: copy md5 implementation to iputils project]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- iputils_md5dig.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/iputils_md5dig.h b/iputils_md5dig.h
-index bfa7f02..3cc3fbf 100644
---- a/iputils_md5dig.h
-+++ b/iputils_md5dig.h
-@@ -24,8 +24,17 @@ typedef struct {
- 	gcry_md_hd_t dig;
- } iputils_md5dig_ctx;
- 
-+void maybeInit()
-+{
-+	if (!gcry_control(GCRYCTL_INITIALIZATION_FINISHED_P))
-+	{
-+		gcry_control(GCRYCTL_INITIALIZATION_FINISHED, 0);
-+	}
-+}
-+
- static void iputils_md5dig_init(iputils_md5dig_ctx *ctx)
- {
-+	maybeInit();
- 	if (gcry_md_open(&ctx->dig, GCRY_MD_MD5, 0) != GPG_ERR_NO_ERROR)
- 		abort();
- 	return;
--- 
-2.24.1
-
diff --git a/meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch b/meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
deleted file mode 100644
index e106a0cf73..0000000000
--- a/meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ab1aa2eb0097a7ef05ffccac058b06812deb2695 Mon Sep 17 00:00:00 2001
-From: Sami Kerola <kerolasa@iki.fi>
-Date: Sat, 28 Dec 2019 17:16:27 +0000
-Subject: [PATCH] ninfod: change variable name to avoid colliding with function
- name
-
-The sys/capability.h header has 'extern int cap_setuid(uid_t uid);'
-function prototype.
-
-Addresses: https://github.com/iputils/iputils/issues/246
-
-Upstream-Status: Backport [https://github.com/iputils/iputils/commit/18f9a84e0e702841d6cc4d5f593de4fbd1348e83]
-Signed-off-by: Sami Kerola <kerolasa@iki.fi>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ninfod/ninfod.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/ninfod/ninfod.c b/ninfod/ninfod.c
-index badbf80..28f03af 100644
---- a/ninfod/ninfod.c
-+++ b/ninfod/ninfod.c
-@@ -454,7 +454,7 @@ static void do_daemonize(void)
- /* --------- */
- #ifdef HAVE_LIBCAP
- static const cap_value_t cap_net_raw = CAP_NET_RAW;
--static const cap_value_t cap_setuid =  CAP_SETUID; 
-+static const cap_value_t cap_setuserid = CAP_SETUID;
- static cap_flag_value_t cap_ok;
- #else
- static uid_t euid;
-@@ -486,7 +486,7 @@ static void limit_capabilities(void)
- 
- 	cap_get_flag(cap_cur_p, CAP_SETUID, CAP_PERMITTED, &cap_ok);
- 	if (cap_ok != CAP_CLEAR)
--		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuid, CAP_SET);
-+		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuserid, CAP_SET);
- 
- 	if (cap_set_proc(cap_p) < 0) {
- 		DEBUG(LOG_ERR, "cap_set_proc: %s\n", strerror(errno));
-@@ -519,8 +519,8 @@ static void drop_capabilities(void)
- 
- 	/* setuid / setuid */
- 	if (cap_ok != CAP_CLEAR) {
--		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuid, CAP_SET);
--		cap_set_flag(cap_p, CAP_EFFECTIVE, 1, &cap_setuid, CAP_SET);
-+		cap_set_flag(cap_p, CAP_PERMITTED, 1, &cap_setuserid, CAP_SET);
-+		cap_set_flag(cap_p, CAP_EFFECTIVE, 1, &cap_setuserid, CAP_SET);
- 
- 		if (cap_set_proc(cap_p) < 0) {
- 			DEBUG(LOG_ERR, "cap_set_proc: %s\n", strerror(errno));
diff --git a/meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch b/meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
deleted file mode 100644
index 03a3f5602d..0000000000
--- a/meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c1f1527eb30d4a5feebf9a0757582bbf7fe3eae9 Mon Sep 17 00:00:00 2001
-From: Andrea Stevanato <andrea.stevanato.95@hotmail.it>
-Date: Tue, 5 Nov 2019 19:08:30 +0000
-Subject: [PATCH] ninfod: fix systemd Documentation url error
-
-systemd[1]: /usr/lib/systemd/system/ninfod.service:3: Invalid URL, ignoring: ninfod(8)
-
-Upstream-Status: Backport [https://github.com/iputils/iputils/commit/c1f1527eb30d4a5feebf9a0757582bbf7fe3eae9]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- systemd/ninfod.service.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systemd/ninfod.service.in b/systemd/ninfod.service.in
-index 5ab69ca00e96..8e79fcd9238e 100644
---- a/systemd/ninfod.service.in
-+++ b/systemd/ninfod.service.in
-@@ -1,6 +1,6 @@
- [Unit]
- Description=Respond to IPv6 Node Information Queries
--Documentation=ninfod(8)
-+Documentation=man:ninfod(8)
- Requires=network.target
- After=network.target
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20200821.bb
similarity index 86%
rename from meta/recipes-extended/iputils/iputils_s20190709.bb
rename to meta/recipes-extended/iputils/iputils_s20200821.bb
index 545f3d5e87..87891140e7 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
@@ -11,12 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=55aa8c9fcad0691cef0ecd420361e390"
 DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils \
-           file://0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch \
-           file://0001-ninfod-fix-systemd-Documentation-url-error.patch \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
-           file://0001-iputils-Initialize-libgcrypt.patch \
            "
-SRCREV = "13e00847176aa23683d68fce1d17ffb523510946"
+SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
 
 S = "${WORKDIR}/git"
 
@@ -26,16 +23,16 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
 # breaks the version order.
 CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
 
-PACKAGECONFIG ??= "libcap libgcrypt rarpd \
+PACKAGECONFIG ??= "libcap rarpd \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod traceroute6', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
-PACKAGECONFIG[libgcrypt] = "-DUSE_CRYPTO=gcrypt, -DUSE_CRYPTO=none, libgcrypt"
 PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
 PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false, gettext"
 PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
 PACKAGECONFIG[rarpd] = "-DBUILD_RARPD=true,-DBUILD_RARPD=false,"
 PACKAGECONFIG[systemd] = "-Dsystemdunitdir=${systemd_unitdir}/system,,systemd"
+PACKAGECONFIG[tftpd] = "-DBUILD_TFTPD=true, -DBUILD_TFTPD=false,"
 PACKAGECONFIG[traceroute6] = "-DBUILD_TRACEROUTE6=true,-DBUILD_TRACEROUTE6=false,"
 PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MANS=false -DBUILD_MANS=false, libxslt"
 
@@ -63,7 +60,7 @@ FILES_${PN}-arping = "${base_bindir}/arping"
 FILES_${PN}-tracepath = "${base_bindir}/tracepath"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
-FILES_${PN}-tftpd = "${base_bindir}/tftpd"
+FILES_${PN}-tftpd = "${base_bindir}/tftpd ${sysconfdir}/xinetd.d/tftp"
 FILES_${PN}-rarpd = "${base_sbindir}/rarpd  ${systemd_unitdir}/system/rarpd@.service"
 FILES_${PN}-rdisc = "${base_sbindir}/rdisc"
 FILES_${PN}-ninfod = "${base_sbindir}/ninfod ${sysconfdir}/init.d/ninfod.sh"
-- 
2.23.0

