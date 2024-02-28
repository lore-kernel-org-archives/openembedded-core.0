Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C42CC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 16:25:56 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.1045.1709137546413982302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 08:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OoRH+Qlz;
 spf=pass (domain: konsulko.com, ip: 209.85.167.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c1a1e1e539so3770911b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 08:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1709137545; x=1709742345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqt3g88WBiJoVdb7AxV+C981j02sz1UKtYUip21BJtI=;
        b=OoRH+QlzX9Y2T+pQIHQ4b9udycV+HHWaiPVdYU8vWnGilfwo0xdN7MVfXUUH7xXl/u
         LLcWqGe6l4mhN6ghkt0eIzLwhFBlZAtDE0DCyvddAwdI4Bak1GN1Gq/cpO9+Eu8vrt8Y
         ARIzBBT6lbzfMAEiQoRGFZXIO0x1kYSu/s6OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137545; x=1709742345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqt3g88WBiJoVdb7AxV+C981j02sz1UKtYUip21BJtI=;
        b=govRPEguI/lIvrsT2oUxGznW/ry2C1tD0dNHzQTNQYz6QoTpsKZx+VUo99gfU7zyrd
         I2wzf5eeTk9xfx7FwV37SxgFHK0AOEfEPfb3peMRJtockEji+PFerz02taPv6VFMus84
         w+LD5aInRf6K20P35tP6Jl5Idet362GL7NVYt3TFii9PV0aas6nCxYZF30oKFOQPoVIk
         xhKR53+gAutW8/89YnLoaMvnAzXca0axWwmgpt2YVOMYttmQ2Narw4++RGGlt4cZQLk7
         ljQNdcKHpc0Cievqx8JdaV91UN003r8RmgcAfbNwYT/dW40729lhnmUaig0fEA5mjwg9
         E5FQ==
X-Gm-Message-State: AOJu0Ywd9OZKzgg0+fy2rmk0HGxgXNNIqdxEpw8R1DJzxgT12bapZtzD
	saLvP/8j1a+ZN2ipX+L9ejD7/YEx6OVbSKndJGVUYNQC+iX0b/3y3N5e0O7src6R54VJe0hPbW+
	AFoQ=
X-Google-Smtp-Source: AGHT+IFzFktcUQqEhMUJFAKnsa4ATcUq9846Gfccg4fnBByRq8op5kYBb7hnsNM7e1Fge+iL7Qf2Yw==
X-Received: by 2002:a05:6808:1201:b0:3c1:5f09:b16f with SMTP id a1-20020a056808120100b003c15f09b16fmr6803206oil.26.1709137545281;
        Wed, 28 Feb 2024 08:25:45 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0:66d:9357:18f1:1e88])
        by smtp.gmail.com with ESMTPSA id d18-20020a639752000000b005d8e30897e4sm6722176pgo.69.2024.02.28.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 08:25:44 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/1] python3-cryptography{-vectors}: upgrade to 42.0.5
Date: Wed, 28 Feb 2024 08:25:31 -0800
Message-Id: <20240228162531.543971-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228162531.543971-1-tim.orling@konsulko.com>
References: <20240228162531.543971-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196396

* Includes an upgrade to pyo3 from 0.20.0 to 0.20.3 which fixes ppc64
* Refresh -crates.inc

https://cryptography.io/en/latest/changelog/#v42-0-5
https://cryptography.io/en/latest/changelog/#v42-0-4
https://cryptography.io/en/latest/changelog/#v42-0-3

42.0.5 - 2024-02-23
* Limit the number of name constraint checks that will be performed in
  X.509 path validation to protect against denial of service attacks.
* Upgrade pyo3 version, which fixes building on PowerPC.

42.0.4 - 2024-02-20
* Fixed a null-pointer-dereference and segfault that could occur when
  creating a PKCS#12 bundle. Credit to Alexander-Programming for
  reporting the issue. CVE-2024-26130
* Fixed ASN.1 encoding for PKCS7/SMIME signed messages. The fields
  SMIMECapabilities and SignatureAlgorithmIdentifier should now be
  correctly encoded according to the definitions in RFC 2633 RFC 3370.

42.0.3 - 2024-02-15
* Fixed an initialization issue that caused key loading failures for
  some users.

CVE: CVE-2024-26130
https://nvd.nist.gov/vuln/detail/CVE-2024-26130

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-cryptography-crates.inc    | 22 ++++++++++---------
 ...=> python3-cryptography-vectors_42.0.5.bb} |  2 +-
 ....0.2.bb => python3-cryptography_42.0.5.bb} |  2 +-
 3 files changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_42.0.2.bb => python3-cryptography-vectors_42.0.5.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.2.bb => python3-cryptography_42.0.5.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 4714c76bd2b..b26e22b70c3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -25,12 +25,13 @@ SRC_URI += " \
     crate://crates.io/parking_lot_core/0.9.9 \
     crate://crates.io/pem/3.0.3 \
     crate://crates.io/pkg-config/0.3.29 \
+    crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.78 \
-    crate://crates.io/pyo3/0.20.2 \
-    crate://crates.io/pyo3-build-config/0.20.2 \
-    crate://crates.io/pyo3-ffi/0.20.2 \
-    crate://crates.io/pyo3-macros/0.20.2 \
-    crate://crates.io/pyo3-macros-backend/0.20.2 \
+    crate://crates.io/pyo3/0.20.3 \
+    crate://crates.io/pyo3-build-config/0.20.3 \
+    crate://crates.io/pyo3-ffi/0.20.3 \
+    crate://crates.io/pyo3-macros/0.20.3 \
+    crate://crates.io/pyo3-macros-backend/0.20.3 \
     crate://crates.io/quote/1.0.35 \
     crate://crates.io/redox_syscall/0.4.1 \
     crate://crates.io/scopeguard/1.2.0 \
@@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851be
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
 SRC_URI[pem-3.0.3.sha256sum] = "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
 SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
-SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
-SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
-SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
-SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
-SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
+SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
 SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb
index 94fbc94c555..ee522af08e6 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce79835994e208bab0e16"
+SRC_URI[sha256sum] = "505cd5e3b0cb32da1526f07042b7fc38a4b6c356710cb73d2b5f76b037a38ed1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index c21c4d1a03b..2bcb5717e42 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
+SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da607bfe1"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.34.1


