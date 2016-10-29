Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C18E671AC0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 14:57:50 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id m193so1217430lfm.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Oct 2016 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=XCHrNnQg4PN6Xord+KQoLDobdCNTDFqHnxWqssl2fNI=;
	b=SiOjWWW57/NfLevfOBzkIRcQ06LAg9FykkZLX8zx2bp3Q0GVDJApE9PMkfRSEQc3gM
	pqepNvDLnMtLbZjHp7AZ+ryvntn/Rm/XCfFhHUrutA7DFWD8A4p8of/jNL00GS2SAXnb
	PotmRvY4Rm3yGCjtWJU0uJ1RKpvIAfUGItHcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XCHrNnQg4PN6Xord+KQoLDobdCNTDFqHnxWqssl2fNI=;
	b=N4n1muc0raIlo5PPW3BAPvO7/RNgxMkOdG2KH/lRaa3UWBXrkb4yNw1+xpbCFrqQG2
	rOol3VnJBgj1xGAzL1VzvcQfyBjRXcVZeqYw32BX+igQMj2gVR1h58o9d4RGS1UCFJLz
	JJQdqRNTc5OcpX/SR+ZXLuM0KCAW70IAZrT2uUP9EeCj79onhe8quXrDEnP5egGbb1fJ
	tpjWB7dtZO05jJ+ZOPCyvEqT8P8hS/4Mfue0RzgxBp5AspFm3b2o24idnhh7iAycYHlw
	WM6GQ2IEAj9GE+8HKQy/79JyPDByeAjwzK81IrTPpxGCPbUqaxjaEzmf03Mjwdsubkeu
	9bnA==
X-Gm-Message-State: ABUngvesaXvAxHZhFTxZaZrFHepz6bQDmPcs7mEouztlT9/Ii95ccHp4kHzs3o0bWAJhXcok
X-Received: by 10.25.18.72 with SMTP id h69mr13859567lfi.106.1477753070766;
	Sat, 29 Oct 2016 07:57:50 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id 87sm2887535lfs.0.2016.10.29.07.57.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 29 Oct 2016 07:57:49 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Oct 2016 17:57:47 +0300
Message-Id: <20161029145747.32390-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.10.1
Subject: [oe-core PATCH] wayland: upgrade from 1.11.0 to 1.11.1
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
X-List-Received-Date: Sat, 29 Oct 2016 14:57:51 -0000

Update release tarball md5sum/sha256sum

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch   | 2 +-
 .../recipes-graphics/wayland/{wayland_1.11.0.bb => wayland_1.11.1.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.11.0.bb => wayland_1.11.1.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
index dece95c..ef41b79 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
@@ -16,7 +16,7 @@ diff --git a/src/scanner.c b/src/scanner.c
 index 5f06e8e..10a4023 100644
 --- a/src/scanner.c
 +++ b/src/scanner.c
-@@ -808,7 +808,7 @@ find_enumeration(struct protocol *protocol,
+@@ -812,7 +812,7 @@ find_enumeration(struct protocol *protocol,
  	struct interface *i;
  	struct enumeration *e;
  	char *enum_name;
diff --git a/meta/recipes-graphics/wayland/wayland_1.11.0.bb b/meta/recipes-graphics/wayland/wayland_1.11.1.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.11.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.11.1.bb
index 3413406..fa674f6 100644
--- a/meta/recipes-graphics/wayland/wayland_1.11.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.11.1.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-scanner-Use-unit32_t-instead-of-uint.patch \
            "
-SRC_URI[md5sum] = "fccf680be066e234729d5b69e0bd0fa9"
-SRC_URI[sha256sum] = "9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0"
+SRC_URI[md5sum] = "82f227c65faec3df0335847626811303"
+SRC_URI[sha256sum] = "4c8a99d030282740e898dead98c92d92023be9c3536c7f504444d215a7e39195"
 
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
-- 
2.10.1


