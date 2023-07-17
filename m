Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D036C001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 11:05:06 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.5509.1689591899341799139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 04:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WkrPPNT8;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-55ae2075990so2445657a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 04:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689591898; x=1692183898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iFlHAQgB+lsy3uNvZgE1JFJszFtj29TDodRlWxufbe4=;
        b=WkrPPNT8nzm0veSs5iLaplgCNy7IonqSGo9ngx0db/Av6NkrCh2CWKStaJWQCkZrfz
         Ivt/6vB9y5BPW79+wyobWcqnUqDnb/X7h0DDsMYU8YIYQqgfJtIWe/S5DYTTqUyaBugH
         KrCeWk5sXHvbA2+U4NtuBRi2PpDJZIlohDsxhgRVPGOeidDvQwKgNZ7gPJnRTgBuRE7p
         5WRkIs1od3at9c2h/UEu+k595fyqcGk5tpd/nFxxQhvrejtyk5LlBDLS9Z2F/3E6ukxu
         /B7OuHl49syMM5bEl7uaUNJbPRh9FwjvKjqxKQCS7guDc4AdoMUvA+6jgVB4YQXtxo80
         3V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689591898; x=1692183898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFlHAQgB+lsy3uNvZgE1JFJszFtj29TDodRlWxufbe4=;
        b=IyQSBFFvpg2IdB5vg/GIHEe3XobYdZuAI2ulCgdcm8gwv1zr6347v+AkHRWCDeKGH2
         QXIh7LaVmTW393UcGTzI9Ir1agemqg+hDOY0ifom36fyh8kKAoROrLh9fmG+P4uBOaiO
         29CgAXlrokDkeL1iiSZdLbl+VlgJ5ys+FZ+6jsSLnbtoyfNFXtVlx1TL+bh9rLsfL7GL
         0pa66SLYngqcqfIhyIN+fg9lk396q+WheKrw0xK5YY3QIRMA21xwyPsaiC/SoU0qM6a5
         vumq3F3BtoxveDIO5Io2aCeY/KxzLrBxdzDcPKkIA0MOUKRIGqKlJnSbal1h54pmhHic
         XdVg==
X-Gm-Message-State: ABy/qLbqrNKunE83Ch4aYp+fy+rw2rkOrrKvMP1u7Zte0xQ14JOANS/y
	SoUayx1rktsQHBMnZ6+/Xfddq9tP8mXw7bH4
X-Google-Smtp-Source: APBJJlGhKF5y05wOOW8I44ms7e0NupPJXPXAiuF/P7etQWpB1FlYMZW95se7kiwlOqc8BFkxrS8YhQ==
X-Received: by 2002:a17:90a:db12:b0:262:f273:4a20 with SMTP id g18-20020a17090adb1200b00262f2734a20mr8755831pjv.42.1689591898061;
        Mon, 17 Jul 2023 04:04:58 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:148a:d9eb:c4a2:7201])
        by smtp.gmail.com with ESMTPSA id c12-20020a17090a674c00b00265b0268382sm4656853pjm.37.2023.07.17.04.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 04:04:57 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography{-vectors}: upgrade 41.0.1 -> 41.0.2
Date: Mon, 17 Jul 2023 04:03:53 -0700
Message-Id: <20230717110352.1245728-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 11:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184461

https://cryptography.io/en/latest/changelog/#v41-0-2

41.0.2 - 2023-07-10
* Fixed bugs in creating and parsing SSH certificates where critical
  options with values were handled incorrectly. Certificates are now
  created correctly and parsing accepts correct values as well as the
  previously generated invalid forms with a warning. In the next release,
  support for parsing these invalid forms will be removed.

Refresh python3-cryptography-crates.inc:
-    crate://crates.io/proc-macro2/1.0.59 \
+    crate://crates.io/proc-macro2/1.0.64 \

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests (except 44 that are skipped) passed on qemux86-64 (with qemuparams='-smp 4 -m 8192')

 meta/recipes-devtools/python/python3-cryptography-crates.inc  | 4 ++--
 ...ctors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} | 2 +-
 ...-cryptography_41.0.1.bb => python3-cryptography_41.0.2.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.1.bb => python3-cryptography-vectors_41.0.2.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.1.bb => python3-cryptography_41.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 3b16e32399..da0a3f2ee8 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -29,7 +29,7 @@ SRC_URI += " \
     crate://crates.io/pkg-config/0.3.27 \
     crate://crates.io/proc-macro-error/1.0.4 \
     crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.59 \
+    crate://crates.io/proc-macro2/1.0.64 \
     crate://crates.io/pyo3/0.18.3 \
     crate://crates.io/pyo3-build-config/0.18.3 \
     crate://crates.io/pyo3-ffi/0.18.3 \
@@ -84,7 +84,7 @@ SRC_URI[pem-1.1.1.sha256sum] = "a8835c273a76a90455d7344889b0964598e3316e2a79ede8
 SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
 SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
 SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro2-1.0.59.sha256sum] = "6aeca18b86b413c660b781aa319e4e2648a3e6f9eadc9b47e9038e6fe9f3451b"
+SRC_URI[proc-macro2-1.0.64.sha256sum] = "78803b62cbf1f46fde80d7c0e803111524b9877184cfe7c3033659490ac7a7da"
 SRC_URI[pyo3-0.18.3.sha256sum] = "e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109"
 SRC_URI[pyo3-build-config-0.18.3.sha256sum] = "9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3"
 SRC_URI[pyo3-ffi-0.18.3.sha256sum] = "fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
index 016620e710..52f2c35315 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "23b08c39777ec7b2774a11f945d1746301b1e88ecff2e5326d7f50ea0f42d580"
+SRC_URI[sha256sum] = "028dff94a8522ca818b11295ff12df55f348f33a193c0597ddfe8239e53d1582"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
index 494ca233f0..20d6c97f36 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "d34579085401d3f49762d2f7d6634d6b6c2ae1242202e860f4d26b046e3a1006"
+SRC_URI[sha256sum] = "7d230bf856164de164ecb615ccc14c7fc6de6906ddd5b491f3af90d3514c925c"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.34.1


