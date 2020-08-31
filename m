Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.50294.1598867890799556825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 02:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YZ2+CbPy;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id w1so1207327edr.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iZKbo3omVzkwBQYyNOZr7/rQUbOKF/nb93jdmW/L9YM=;
        b=YZ2+CbPymtE7bBkAByTjWUXoDu+ce8ITc2E4LQcU0xiJ/8YKm5AOKeR/vHzpfZQQHw
         ygdmt0qGANJbksIcf0hvmotBFTnKuYXXQi3oj2NHQ7AxvSVDPuEHVk+HII6oK9ALS7KK
         mREzkXouIkEprD/nExGqVh1hNe4+plCC83OZJmoYL/tymTBegzTlPW5787U1u/T6RJr9
         DKSoGc1Cj+deWRkw1hVu3tXuvPk9axJZ6evmybgblhJnKLAywT0pv3H6KYtJMHGjgQKM
         kZ05ni/AsjflcoG5iCgR31bfc9aZmwz4J8PmyR7IW6E963eQMOQ+Ekf4TXlhvBD6oirn
         ft+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iZKbo3omVzkwBQYyNOZr7/rQUbOKF/nb93jdmW/L9YM=;
        b=JMRI3fmmcwJzFWGIq81UQuhIVBf5cDyUWaUiNvdQryLEsG33Z0OcmCYM7K71quVfcF
         z7x9fDXzGPVGXK80iIj9HjuZNyd1wOzOnVJYkWwy6MqjlWw0u2ZfSS4bW96yRolOcaqB
         WBjcEsMnKdy8mriDFMKzPr/Ms27+oj0388g/zfojq5AF3kJXK9+1vrOk/FYVLE+4mhQ3
         FklTBTsvfPW/OjOrfLaw5oQxsFp1HRWJc4lIojJHaA0nSirffRoRdO2WYiEevackCEOc
         OHjhgDRA7KXH/2nGUn6NqgP4TEJMyR1Ctsbl51YAxP/e6WQLZm+vBA/Za5nS4nPv3YHd
         /XWw==
X-Gm-Message-State: AOAM5317jJ493Dr7ZVqYnbD29B+0hdYHkvIwOfLhLlx9x39fpbDWYj75
	RuKqnN7S9pW3gSUr7dvOuTHX3JCp+vg=
X-Google-Smtp-Source: ABdhPJzpKkkBoTZcdfqeolQHOWvjwGvN4zcy703LM79lTxwBYaSbOfG9jpqFwxbKZCer9c5/btK1Gg==
X-Received: by 2002:a50:9e6b:: with SMTP id z98mr403676ede.365.1598867888692;
        Mon, 31 Aug 2020 02:58:08 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:b114:707f:d9f1:179])
        by smtp.gmail.com with ESMTPSA id n15sm7233241eja.26.2020.08.31.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 02:58:08 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH 2/2] iputils: upgrade s20190709 -> s20200821
Date: Mon, 31 Aug 2020 11:59:48 +0200
Message-Id: <20200831095948.15750-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200831095948.15750-1-changhyeok.bae@gmail.com>
References: <20200831095948.15750-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- libgcrypt is not required anymore because the md5 implementation was
  part of this project.
- ninfod patches are upstreamed and other patch is not required anymore.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-iputils-Initialize-libgcrypt.patch   | 55 -------------------
 ...riable-name-to-avoid-colliding-with-.patch | 51 -----------------
 ...-fix-systemd-Documentation-url-error.patch | 28 ----------
 ...tils_s20190709.bb => iputils_s20200821.bb} |  8 +--
 4 files changed, 2 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-iputils-Initialize-libgcrypt.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-change-variable-name-to-avoid-colliding-with-.patch
 delete mode 100644 meta/recipes-extended/iputils/iputils/0001-ninfod-fix-systemd-Documentation-url-error.patch
 rename meta/recipes-extended/iputils/{iputils_s20190709.bb => iputils_s20200821.bb} (87%)

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
similarity index 87%
rename from meta/recipes-extended/iputils/iputils_s20190709.bb
rename to meta/recipes-extended/iputils/iputils_s20200821.bb
index 545f3d5e87..62d6a3c209 100644
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
 
@@ -26,11 +23,10 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>s\d+)"
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
-- 
2.23.0

