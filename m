Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id D379E6071F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 07:58:04 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id c13so132658482lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 23:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X3QvdmN4pauRmPdjXWmBsQmw5uncQNVZeD3w+qg0o4c=;
	b=VwbMjSTBqovdFRbkjdTYAuHQ2Sk1EOrRjBhFKTBGjdTh1de+ww71JEoEH+gRBNgXPH
	lK+ebKos6ygz+TRJE+LESQGYYEA4x6M/ukUwGM0v4mm60SlWzZhxSXTqNJSKAt1Kemmn
	BacJNDss92EXgi/CQKenmn4Tdf82PuaTehD1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X3QvdmN4pauRmPdjXWmBsQmw5uncQNVZeD3w+qg0o4c=;
	b=iwJnRK2grynAYmR3OrTa7QmO7llLHTFufFUigcFpK+oT6ZPPm1kSbknNnp1t0v0ajS
	W+TxoSXgFspMOQ73xiPQXyN3UXDPXavf9x+MSrrOL5oQR1u+QjIqo98/Kp7nhxbBokf9
	N4w5uv8y+QUbNcX+RmvuKwuD2QXZEKbBgnLCuElsXksE8Hkcaibyy896DoW2vo5O7Qy/
	tL5tSyIvRVWXAMN4KFI0iAPE3AUpFpGcyl7M7vJ7gPdaSY9c+FC4Vjb4ROrHNV3ir0T6
	UH59hKUDInRERazykcGS96KTvB6LbRMnayxisXhcPU/Mh3hIp+x365NRJJEYKsuxSKLs
	Rj/w==
X-Gm-Message-State: ABUngvc1Y5BeAdzC3kc7yZhgqatwDrFn6ilCEQiG7eohdwSCXOSFqG6JCvEwetTlpXfaae1r
X-Received: by 10.25.29.8 with SMTP id d8mr5288867lfd.18.1478591884738;
	Mon, 07 Nov 2016 23:58:04 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	g38sm4423880lfi.40.2016.11.07.23.58.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Nov 2016 23:58:03 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 09:57:58 +0200
Message-Id: <20161108075758.26411-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] wayland: upgrade from 1.11.1 to 1.12.0
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
X-List-Received-Date: Tue, 08 Nov 2016 07:58:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Remove 0001-scanner-Use-unit32_t-instead-of-uint.patch applied upstream
  https://cgit.freedesktop.org/wayland/wayland/commit/?id=6750b47d9e0d30
* Update release tarball md5sum/sha256sum

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...0001-scanner-Use-unit32_t-instead-of-uint.patch | 30 ----------------------
 .../{wayland_1.11.1.bb => wayland_1.12.0.bb}       |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
 rename meta/recipes-graphics/wayland/{wayland_1.11.1.bb => wayland_1.12.0.bb} (88%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
deleted file mode 100644
index ef41b79..0000000
--- a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5516d32e694badca35b6c71b02a3f08f650308bf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Jul 2016 16:23:48 -0700
-Subject: [PATCH] scanner: Use unit32_t instead of uint
-
-uint32_t is C99 defined stdint type
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
----
- src/scanner.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/scanner.c b/src/scanner.c
-index 5f06e8e..10a4023 100644
---- a/src/scanner.c
-+++ b/src/scanner.c
-@@ -812,7 +812,7 @@ find_enumeration(struct protocol *protocol,
- 	struct interface *i;
- 	struct enumeration *e;
- 	char *enum_name;
--	uint idx = 0, j;
-+	uint32_t idx = 0, j;
- 
- 	for (j = 0; j + 1 < strlen(enum_attribute); j++) {
- 		if (enum_attribute[j] == '.') {
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/wayland/wayland_1.11.1.bb b/meta/recipes-graphics/wayland/wayland_1.12.0.bb
similarity index 88%
rename from meta/recipes-graphics/wayland/wayland_1.11.1.bb
rename to meta/recipes-graphics/wayland/wayland_1.12.0.bb
index fa674f6..de261fe 100644
--- a/meta/recipes-graphics/wayland/wayland_1.11.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.12.0.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-scanner-Use-unit32_t-instead-of-uint.patch \
            "
-SRC_URI[md5sum] = "82f227c65faec3df0335847626811303"
-SRC_URI[sha256sum] = "4c8a99d030282740e898dead98c92d92023be9c3536c7f504444d215a7e39195"
+SRC_URI[md5sum] = "ee615e2d1e205eec48b02f069327eb96"
+SRC_URI[sha256sum] = "d6b4135cba0188abcb7275513c72dede751d6194f6edc5b82183a3ba8b821ab1"
 
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
-- 
2.10.2


