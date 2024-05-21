Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290CBC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 16:25:27 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.182.1716308721208616484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 09:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=auKjxt7M;
 spf=pass (domain: konsulko.com, ip: 209.85.215.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso374916a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 09:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1716308720; x=1716913520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IymP7FWowDIuWRDvEmecKtIRyiTb3eYHXmE1NG9YlWo=;
        b=auKjxt7MMhkU9mZozHlD3+MTVCQqeegGwuy165Xcn8VrAD26L1ZsVK0aPY4pWVFpde
         IZf/AUL7ZxcgZm12TBnux7TWOjFtMSJ0RPoEIrGKOr8DKoeEolVYpgZyxipImCzPGhwc
         X0Lbg4DtvoXgsSwnsD3jgxeJQ18vjpv+aTHhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716308720; x=1716913520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IymP7FWowDIuWRDvEmecKtIRyiTb3eYHXmE1NG9YlWo=;
        b=Iwf/lZ0PsCSU9JdohymuNjrBlXrmPGRsSe3ilVWauMuHVhMD3/126pPKNJoL1+Iel5
         xCNTrghBpT9NTJxboon061Mr0UICnqB66u8+KtC5kh5FzXLBRyGcM8uEcrdqlbrakaSN
         h8SZdLpmW9Oa2b9BSBKyg/RSUDf02nU+NIeGWby3hsgGxP7OtPCpW03I6Mv9eIrP9F0Y
         R6E/jTK0geCAuZsDJowiT4IvWm43j2C0sjC/qDW2SiF1E3I///EbPj5RagKiPqhjluIJ
         pSC8npKcgRFSDcT09fN7drOHkHtqBoSO/p1r1NyQuBo3Y5th4PWoTvzkHFEOVHBKILH3
         BZyw==
X-Gm-Message-State: AOJu0YxCT66jM1yeZj7NzEayKaS/Tf8tIuwF7VVbqsTPK/NuLQHe2AVj
	eToZZ6nCUdALhRSCIsqnUA/Y/2t8VjZS1GiKHM55Piw3NRRIoK4aZ8RJQOkFf8SOWXco0o3mDVO
	NCLE=
X-Google-Smtp-Source: AGHT+IFVXh4/vm7lMoHOQ/h90JoF4IzyzNqf9xEugq3MXdclFUrJNHpknxuKMVB07BNlTfwBJm+lhQ==
X-Received: by 2002:a17:90b:707:b0:2b4:fcfd:741a with SMTP id 98e67ed59e1d1-2b6cc7591aamr25650006a91.17.1716308720028;
        Tue, 21 May 2024 09:25:20 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:7982:f99:55d2:c9c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62863a1c9sm24143760a91.1.2024.05.21.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 09:25:19 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] python3-cryptography: upgrade 42.0.5 -> 42.0.7
Date: Tue, 21 May 2024 09:24:17 -0700
Message-ID: <20240521162416.1657031-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517195937.1146471-2-tim.orling@konsulko.com>
References: <20240517195937.1146471-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 16:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199656

From: Tim Orling <tim.orling@konsulko.com>

Also upgrade python3-cryptography-vectors
Refresh python3-cryptography-crates.inc

42.0.7 - 2024-05-06
Restored Windows 7 compatibility for our pre-built wheels. Note that we
do not test on Windows 7 and wheels for our next release will not support
it. Microsoft no longer provides support for Windows 7 and users are
encouraged to upgrade.

42.0.6 - 2024-05-04
Fixed compilation when using LibreSSL 3.9.1.

https://cryptography.io/en/latest/changelog/#v42-0-7
https://cryptography.io/en/latest/changelog/#v42-0-6
https://github.com/pyca/cryptography/compare/42.0.5...42.0.7

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
 Rebased on top of current master (with WORKDIR -> UNPACKDIR change)

Tested with core-image-ptest-python3-cryptography on qemux86-64

 .../python/python3-cryptography-crates.inc                | 8 ++++----
 ...s_42.0.5.bb => python3-cryptography-vectors_42.0.7.bb} | 2 +-
 ...1-pyproject.toml-remove-benchmark-disable-option.patch | 7 ++-----
 ...ptography_42.0.5.bb => python3-cryptography_42.0.7.bb} | 2 +-
 4 files changed, 8 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_42.0.5.bb => python3-cryptography-vectors_42.0.7.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.5.bb => python3-cryptography_42.0.7.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index b26e22b70c3..dbeda05dc45 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -18,9 +18,9 @@ SRC_URI += " \
     crate://crates.io/lock_api/0.4.11 \
     crate://crates.io/memoffset/0.9.0 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/openssl/0.10.63 \
+    crate://crates.io/openssl/0.10.64 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.99 \
+    crate://crates.io/openssl-sys/0.9.102 \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.9 \
     crate://crates.io/pem/3.0.3 \
@@ -68,9 +68,9 @@ SRC_URI[libc-0.2.152.sha256sum] = "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb0
 SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
 SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.63.sha256sum] = "15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8"
+SRC_URI[openssl-0.10.64.sha256sum] = "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.99.sha256sum] = "22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae"
+SRC_URI[openssl-sys-0.9.102.sha256sum] = "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
 SRC_URI[pem-3.0.3.sha256sum] = "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_42.0.7.bb
index ee522af08e6..9a025a530ce 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "505cd5e3b0cb32da1526f07042b7fc38a4b6c356710cb73d2b5f76b037a38ed1"
+SRC_URI[sha256sum] = "8294c632dbe2cb14c7b7e24219560e674bc2224dfc4bed577ab077dbb82bfa3c"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index f9c8d1393d2..ec4bfcc98bd 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From b7dd3ce1d75d1e6255e1aca82aa7f401d4246a75 Mon Sep 17 00:00:00 2001
+From 18d78736f5c39784d5151b08fdfdd21c61225686 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index c9a7979bd..dec4b7157 100644
+index 4f0fa36..0d54ea6 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
@@ -38,6 +38,3 @@ index c9a7979bd..dec4b7157 100644
  console_output_style = "progress-even-when-capture-no"
  markers = [
      "skip_fips: this test is not executed in FIPS mode",
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
index 0300330c603..5964400a04b 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da607bfe1"
+SRC_URI[sha256sum] = "ecbfbc00bf55888edda9868a4cf927205de8499e7fabe6c050322298382953f2"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.45.1


