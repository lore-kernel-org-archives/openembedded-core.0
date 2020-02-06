Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7CD60BB1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 20:57:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id l24so3362090pgk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 12:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=VNu5ZXo8ZxCmerNVSBNfJD6Xk68XXtmDzu/OHGc2zSA=;
	b=ICwF1KC/RnnoRw7knf7TqXbxaO6SofUS0ZpYa7nzjCbqZNg8SlwfswbO33V4HvPAKU
	zRjqvzUBVgSSU7YP/DQqIK8ngiu43pNtHG0/3lxx7psb4P/BU/vxl/8SZpB8r+Dt9VMP
	qMYIhL5XdBMGe6uKAQXaiYXKR5H72+nMu54LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VNu5ZXo8ZxCmerNVSBNfJD6Xk68XXtmDzu/OHGc2zSA=;
	b=jDLQUruK4teh2LJHf9KzMyYjnZf/mvTvuimKE42pVskRnEdtQp+ihLpf2wgIwYR0NB
	85OpuD8ZpUcioje7vZsJaRDfkjs8oTS4zJbLVch/AjRsvaXbRsenCXQT6Tkfi1UYbqqd
	U1DD7duG2IBf1W7a3fzKgFA0/QbtyFNVyCpnOIaATJPpdGFIgxwE2eqjCDTkoNFMnR33
	mAl2T3xHxLpbp5RIBfpdLTcCjqSdtDRyi6rsTgEX/N7ZGeSygscc0D3DfvCoFvYrbfXr
	YNXETFSSe+I/Rra7tbyrwssrnm922ElaSHPv8pwrGckbCvuX6+swZC+f5kJvmvwdo3tg
	VNCA==
X-Gm-Message-State: APjAAAUE1CjFniVi0nrbb9ps1pl7oKe8zYsAg6OODYQY0Kuv9VcKkL+m
	o/sKUF0EHHZYCxDZ6ofWKv9gcoC+T0sRJ1khbg5nGLXThiqMrTHhAorCuXr/b1AR9Obd/jHnw2v
	HvDddtDE8bXutwNSxLEezQGo1X0L8Yf8esr9GNeAPb112CaWZnLr9Ron8S4MYwh/d/9p+Bg//eh
	JksYLb7DHxO5AOSWjyy+6/prwk
X-Google-Smtp-Source: APXvYqxclw9xxZj0nFOLigIPLhzDlnDnjJVE/yx0c6tJhWEljo4bEIUvTsO/xmkFoKjv3UZn17IgGw==
X-Received: by 2002:aa7:8191:: with SMTP id g17mr6139160pfi.25.1581022669917; 
	Thu, 06 Feb 2020 12:57:49 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id d22sm292548pgg.52.2020.02.06.12.57.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 12:57:49 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2020 12:57:43 -0800
Message-Id: <20200206205743.5388-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cryptodev: update to Jan.23, 2020
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
X-List-Received-Date: Thu, 06 Feb 2020 20:57:49 -0000

* Remove backported patches:
  0001-Fix-module-loading-with-Linux-v5.0-rc5.patch

Update to latest cryptodev dated Jan.23, 2020.
Fixes build on kernel v5.5+

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc   |  3 +-
 ...x-module-loading-with-Linux-v5.0-rc5.patch | 59 -------------------
 2 files changed, 1 insertion(+), 61 deletions(-)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 9d8ba44058..f99f8bc9f0 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -4,9 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
-           file://0001-Fix-module-loading-with-Linux-v5.0-rc5.patch \
            "
-SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
+SRCREV = "a87053bee5680878c295b7d23cf0d7065576ac2b"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
deleted file mode 100644
index 34ec87272f..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/f971e0c]
-
-Backport patch from upstream to fix module cryptodev loading error.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From f971e0cd4a0ebe59fb2e8e17240399bf6901b09b Mon Sep 17 00:00:00 2001
-From: "Derald D. Woods" <woods.technical@gmail.com>
-Date: Sun, 10 Feb 2019 13:22:19 -0600
-Subject: [PATCH] Fix module loading with Linux v5.0-rc5
-
-This commit fixes this module load error:
-[...]
-[   29.112091] cryptodev: loading out-of-tree module taints kernel.
-[   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
-[   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
-modprobe: can't load module cryptodev (extra/cryptodev.ko): unknown symbol in module, or unknown parameter
-[...]
-
-Upstream Linux support for unused GIVCIPHER, and others, was dropped here:
-
-c79b411eaa72 (crypto: skcipher - remove remnants of internal IV generators)
-
-Signed-off-by: Derald D. Woods <woods.technical@gmail.com>
----
- cryptlib.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/cryptlib.c b/cryptlib.c
-index 6e66698..4a87037 100644
---- a/cryptlib.c
-+++ b/cryptlib.c
-@@ -38,7 +38,9 @@
- #include "cryptodev_int.h"
- #include "cipherapi.h"
- 
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
- extern const struct crypto_type crypto_givcipher_type;
-+#endif
- 
- static void cryptodev_complete(struct crypto_async_request *req, int err)
- {
-@@ -157,8 +159,11 @@ int cryptodev_cipher_init(struct cipher_data *out, const char *alg_name,
- 
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
- 		tfm = crypto_skcipher_tfm(out->async.s);
--		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type) ||
--		    (tfm->__crt_alg->cra_type == &crypto_givcipher_type)) {
-+		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type)
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
-+		    || (tfm->__crt_alg->cra_type == &crypto_givcipher_type)
-+#endif
-+							) {
- 			struct ablkcipher_alg *alg;
- 
- 			alg = &tfm->__crt_alg->cra_ablkcipher;
--- 
-2.20.0
-
-- 
2.17.1


