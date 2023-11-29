Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0849C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 04:12:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.23866.1701231164532752317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 20:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W6SJ+ryp;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cdd4aab5f5so79719b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 20:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701231163; x=1701835963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrI4q0/T/nEwdHWxAZ0Uc1qJzIXSZZ5Zr4P8nS5Jdb8=;
        b=W6SJ+ryp2X4XWoQR3FMbVzySW9stUCwEXA+SClxx+jwn5E2RUD9ZZa6AK/xVA7gzCw
         sci16724peQaQQAcWNoZb2ZeyFIx5TVLU4oerV034u2uUJHg/do0CHbMFEts3S8xoyH0
         irX+MRRXf39dtvXKNypcoHke1TkjnEgrTUqOvYHKWuR4Kly+8iZQm3PhoBTmJFHZTxFo
         Rs8hsj46j/wRJkFKaLqL8gf8atj/BEh6cwAyU1LS6ojtIKwMO8mNTiGoYqs/Yq5bs3O+
         wceDwZ2M6zqEk+PBPexBsp9M59pQRJ3T34eSuz5LIpItYuB/7SvjjNsW+4x0RYtg/+ac
         Do8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701231163; x=1701835963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrI4q0/T/nEwdHWxAZ0Uc1qJzIXSZZ5Zr4P8nS5Jdb8=;
        b=u3nOz/M2IzteR4akL9HlFRgmbRyvdTrEFLCgKQoGYw01Vb4XpieZ7x2aOeMmyfhDL+
         dYWnkNiXbghucrjgtVSxzatHCe8XIW2zNyXAUFlUAOKzfux3g8mK6L+G/nztZlEhrY6J
         HSYrbaHQt9ccCZh7QBlEAvinF1Wgv+WIPRkk5BSpgy1+uLc38WFmZVOylsYgiqtV+xnG
         6blzNuv7FEy7OFq2tR/OMsh7zw9E/Dljv7rrDX6Ikvur8oCDXClRzCJSWiBcCW+j3KlD
         iQqAAVhCxD4HwRjfiDij0SbvuMJTYXI73ldqw9DLrM9ROMQaOjZ4EkmIdJyXo5OICbxC
         29+A==
X-Gm-Message-State: AOJu0YzwUMVuWzJOtIe3tY4xwcOeVUu/h2cKkQ/pa2rIXwH10rp4dgzB
	4bsOKROA5gpW3hJiFCqjHSu6vNqDGm7lIg==
X-Google-Smtp-Source: AGHT+IFdlNuPmF0mRmjsUspp7iB167Aeg1FLAYEXcznSMjzPMKzkzrBvCQfB0Sbcflxf63rsmyf2XA==
X-Received: by 2002:a05:6a00:1914:b0:6c4:db03:d20f with SMTP id y20-20020a056a00191400b006c4db03d20fmr22682336pfi.17.1701231163439;
        Tue, 28 Nov 2023 20:12:43 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:cbf8:fa1a:a573:44e6])
        by smtp.gmail.com with ESMTPSA id q3-20020a056a00088300b006cb64908070sm9912716pfj.93.2023.11.28.20.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 20:12:43 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] python3-cryptography{-vectors}: 41.0.5 -> 41.0.7
Date: Tue, 28 Nov 2023 20:11:38 -0800
Message-Id: <20231129041137.2280657-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129041137.2280657-1-tim.orling@konsulko.com>
References: <20231129041137.2280657-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 04:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191425

https://github.com/pyca/cryptography/compare/41.0.5...41.0.7

https://cryptography.io/en/latest/changelog/#v41-0-7
https://cryptography.io/en/latest/changelog/#v41-0-6

41.0.7 - 2023-11-27
Fixed compilation when using LibreSSL 3.8.2.

41.0.6 - 2023-11-27
Fixed a null-pointer-dereference and segfault that could occur when loading
certificates from a PKCS#7 bundle. Credit to pkuzco for reporting the issue.

CVE: CVE-2023-49083

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-crytography on qemux86-64 (all tests pass)

 .../python/python3-cryptography-crates.inc             | 10 ++++++----
 ...1.0.5.bb => python3-cryptography-vectors_41.0.7.bb} |  2 +-
 ...graphy_41.0.5.bb => python3-cryptography_41.0.7.bb} |  2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.5.bb => python3-cryptography-vectors_41.0.7.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_41.0.5.bb => python3-cryptography_41.0.7.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index da0a3f2ee86..3a5edaa3494 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -9,6 +9,7 @@ SRC_URI += " \
     crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/base64/0.13.1 \
     crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.1 \
     crate://crates.io/cc/1.0.79 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/foreign-types/0.3.2 \
@@ -18,9 +19,9 @@ SRC_URI += " \
     crate://crates.io/lock_api/0.4.9 \
     crate://crates.io/memoffset/0.8.0 \
     crate://crates.io/once_cell/1.17.2 \
-    crate://crates.io/openssl/0.10.54 \
+    crate://crates.io/openssl/0.10.60 \
     crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-sys/0.9.88 \
+    crate://crates.io/openssl-sys/0.9.96 \
     crate://crates.io/ouroboros/0.15.6 \
     crate://crates.io/ouroboros_macro/0.15.6 \
     crate://crates.io/parking_lot/0.12.1 \
@@ -64,6 +65,7 @@ SRC_URI[asn1_derive-0.15.2.sha256sum] = "a045c3ccad89f244a86bd1e6cf1a7bf645296e7
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
 SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.4.1.sha256sum] = "327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07"
 SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
@@ -73,9 +75,9 @@ SRC_URI[libc-0.2.144.sha256sum] = "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5d
 SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
 SRC_URI[memoffset-0.8.0.sha256sum] = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
 SRC_URI[once_cell-1.17.2.sha256sum] = "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b"
-SRC_URI[openssl-0.10.54.sha256sum] = "69b3f656a17a6cbc115b5c7a40c616947d213ba182135b014d6051b73ab6f019"
+SRC_URI[openssl-0.10.60.sha256sum] = "79a4c6c3a2b158f7f8f2a2fc5a969fa3a068df6fc9dbb4a43845436e3af7c800"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-sys-0.9.88.sha256sum] = "c2ce0f250f34a308dcfdbb351f511359857d4ed2134ba715a4eadd46e1ffd617"
+SRC_URI[openssl-sys-0.9.96.sha256sum] = "3812c071ba60da8b5677cc12bcb1d42989a65553772897a7e0355545a819838f"
 SRC_URI[ouroboros-0.15.6.sha256sum] = "e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db"
 SRC_URI[ouroboros_macro-0.15.6.sha256sum] = "5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
index e304c4261a2..eda492d312a 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
+SRC_URI[sha256sum] = "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538edd8fc463dc80d5b"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
index 17b08f05cdf..45856774403 100644
--- a/meta/recipes-devtools/python/python3-cryptography_41.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "392cb88b597247177172e02da6b7a63deeff1937fa6fec3bbf902ebd75d97ec7"
+SRC_URI[sha256sum] = "13f93ce9bea8016c253b34afc6bd6a75993e5c40672ed5405a9c832f0d4a00bc"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0001-Fix-include-directory-when-cross-compiling-9129.patch \
-- 
2.34.1


