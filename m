Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77F7C41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 17:53:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.743.1718128381652209280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 10:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SjgazL+p;
 spf=pass (domain: konsulko.com, ip: 209.85.214.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f6fabe9da3so26233625ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718128381; x=1718733181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Whyp193BxBY0gGqmEClBhzbX2eEaaKYWHp/kJNarpd4=;
        b=SjgazL+pJRNwB5U9q/4lym8TQtgAZR8NC92XibHuW3f5kqTOhqq2ei1XH2I+vkEEpj
         +7OJOCFlmYMe0xTwhvjj7/3hEsOD1r3m7Q7iOigG+hxpGSeUf3kAKX7SBy8CvI5DuWHZ
         cF61fEAOuUSIjXMmKXY8vvF4Z+54PpjmM244Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718128381; x=1718733181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Whyp193BxBY0gGqmEClBhzbX2eEaaKYWHp/kJNarpd4=;
        b=ex8WYoHmmWrhOnQ4zIbZx1HdA4gdjhgpZ203x1NjTGzwfczd0BxS37Ukh2kmZOcw1q
         4aYn+XsZuyZjpP5mMf9cxhJU5qwaMrwCv9PIJsBPGzl4Sp1Vc3r4dVYRUhNIhf3Dh7/G
         4I5kUuoe1Soo0519uD/5Xa+b5uFKaOzafP+CsD74kuObx7xAYiMmi9lQyyo8qM6mWiRI
         e+gKMaTC2mZ2i95MYNVBasW/Th0WCtt2LB4JQCTkrOr9aTIl/nBLHQpqzN8qBNTjFCHB
         xPkt/KmMcdNg+Ixt0SOZEjnUyVDnN6J5OS+b/qDt7TO7L04QLSJ3koHouayySbZRmN9G
         6l+Q==
X-Gm-Message-State: AOJu0Yz3YPr9djuotK6l3HRUWq4g2ltgggCsop7PmwpWrdOsISTrolr7
	hRcc+6PKiDcpMETbDhgTfmH5t6v18JFEYkTMpvkKxm5DBrWnU4AyXsOSN1zNy4Jm6dl+pLi/Hyi
	zxPE=
X-Google-Smtp-Source: AGHT+IEQi8D2qbkQdkrsa/CKabGvoZGu21F7ZMvH3DEDom7kEc8/TMbD7SKJDuQxQsZCAHtT/nQdNg==
X-Received: by 2002:a17:902:e842:b0:1f7:1d78:db3f with SMTP id d9443c01a7336-1f71d78e31emr48922805ad.33.1718128380608;
        Tue, 11 Jun 2024 10:53:00 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6eccc0bd0sm71955115ad.105.2024.06.11.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 10:53:00 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography: upgrade 42.0.7 -> 42.0.8
Date: Tue, 11 Jun 2024 10:52:07 -0700
Message-ID: <20240611175206.2847194-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 17:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200544

From: Tim Orling <tim.orling@konsulko.com>

* Refresh 0001-pyproject.toml-remove-benchmark-disable-option.patch
* Also upgrade python3-cryptography-vectors

42.0.8 - 2024-06-04
  * Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.2.2.

https://cryptography.io/en/latest/changelog/#v42-0-8
https://github.com/pyca/cryptography/compare/42.0.7...42.0.8

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-cryptography on qemux86-64

 ...ctors_42.0.7.bb => python3-cryptography-vectors_42.0.8.bb} | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch | 4 ++--
 ...-cryptography_42.0.7.bb => python3-cryptography_42.0.8.bb} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_42.0.7.bb => python3-cryptography-vectors_42.0.8.bb} (91%)
 rename meta/recipes-devtools/python/{python3-cryptography_42.0.7.bb => python3-cryptography_42.0.8.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.7.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_42.0.7.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb
index 9a025a530ce..1256e75c474 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.7.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "8294c632dbe2cb14c7b7e24219560e674bc2224dfc4bed577ab077dbb82bfa3c"
+SRC_URI[sha256sum] = "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index ec4bfcc98bd..3eed171ffee 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From 18d78736f5c39784d5151b08fdfdd21c61225686 Mon Sep 17 00:00:00 2001
+From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -26,7 +26,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 4f0fa36..0d54ea6 100644
+index d2e304f..10aabcf 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -92,7 +92,7 @@ rust-version = ">=1.63.0"
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
rename to meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
index 5964400a04b..3f70f910d4d 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.7.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "ecbfbc00bf55888edda9868a4cf927205de8499e7fabe6c050322298382953f2"
+SRC_URI[sha256sum] = "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://check-memfree.py \
-- 
2.45.2


