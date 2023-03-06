Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB70BC678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:33:03 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.30942.1678102374645446678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d6eSZm8e;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id ce8-20020a17090aff0800b0023a61cff2c6so7376988pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 03:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678102373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EzD1k49KcEBlA0cnkkW0fmmLzYyEKDYQVuvVu1YYu/A=;
        b=d6eSZm8eeB3Eb2OQUCkYIG7Zuno9gLfqH+Ley3Q0/7XHyvYDVTNHhl7gyDCYkr8ieZ
         rB1t4mPmxmVmy5ocjwLRm5lbHHljMRdbf0V5JMc0v2qpy08T4LIiYZX9UKWOZNwijQKK
         sWm7rIeubkCn+CCEnakKYs8mdEox+3g0/wvlmR1hSfxq2wBEi5V87mQMH7tL0zRVafoZ
         DoOdnzIvBo3X078e7D4X6NFh4aZDwhE63EfPdCalggs1is/KqJ9FMbBEzUjbxYq2t/sY
         4cu3WjF5b+uG9o71keECeauy1PEnbnwmIaMXGc3wexsXoeUUzuw7iu5VI/qz1plL0Ojn
         zsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678102373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzD1k49KcEBlA0cnkkW0fmmLzYyEKDYQVuvVu1YYu/A=;
        b=pb+2MSzV1QXAXuVJjMRFxxoDMQOXUR2CQneYAiCnNdOhk+Ca2/E3qRgUSdqYSfCzpA
         kNqQnYxFz4wKKeklef3EW7WnciZmzYvak89U2JkTPUmgLmhypFzz8/KXtaSe9fyPKAKn
         mVRdROnDh8XMToBzjOZhF1IzMduFAiMhGGCNo+jBtiOIg/3waYYVSYoXouMnVJSFM8bD
         fHdh8O/HME5ZZ5/gWOmvVvvIzCsPGwFzAB/Kt6TYTmObsbXv4NGthH3xbVeCoGf5G6HM
         9N+h/6cYcsT9deWPl0oqmJT39jKfY2om/hBPamWlwIv6C3wdZUzmuU7SrEtqBmwwapka
         2W8A==
X-Gm-Message-State: AO0yUKXESOxym7F6r2P62DvERTsrN+IIxX2thObmAMkU1T4ax2OOIasy
	VjFcSJyOM50sUDvn3/nxlOqFwaWqDNUM21r7
X-Google-Smtp-Source: AK7set/M3F26DmbxWy+opMKLDXnOCV5mSvZmXm3zzwhOnV1oAd6L0dY45/McG5+apLaXWzVCP//jWg==
X-Received: by 2002:a17:903:228b:b0:19c:bae2:681a with SMTP id b11-20020a170903228b00b0019cbae2681amr10959470plh.66.1678102373404;
        Mon, 06 Mar 2023 03:32:53 -0800 (PST)
Received: from localhost.localdomain ([103.197.224.128])
        by smtp.gmail.com with ESMTPSA id bh9-20020a170902a98900b0019b0937003esm6481771plb.150.2023.03.06.03.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:32:53 -0800 (PST)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Poonam <Poonam.Jadhav@kpit.com>,
	Poonam Jadhav <ppjadhav456@gmail.com>
Subject: [OE-core][kirkstone][PATCH] python3-setuptools-rust-native: Add direct dependency of native python3 modules
Date: Mon,  6 Mar 2023 17:02:24 +0530
Message-Id: <20230306113224.3473209-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 11:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178070

From: Poonam <Poonam.Jadhav@kpit.com>

Add direct dependency of below native python3 modules
to fix the compile issue 

python3-semantic-version-native
python3-setuptools-native
python3-setuptools-scm-native
python3-toml-native
python3-typing-extensions-native
python3-wheel-native

This issue is not seen in the upstream yocto but in the project,
where the python modules are not built by any other dependency.
They have to be explicitly pulled.

This fixes below error:

  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config.py", line 422, in _parse_attr
    module = importlib.import_module(module_name)
  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/recipe-sysroot-native/usr/lib/python3.10/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/setuptools-rust-1.1.2/setuptools_rust/__init__.py", line 1, in <module>
    from .build import build_rust
  File "<path to file>/python3-setuptools-rust-native/1.1.2-r0/setuptools-rust-1.1.2/setuptools_rust/build.py", line 23, in <module>
    from typing_extensions import Literal
ModuleNotFoundError: No module named 'typing_extensions'

Signed-off-by: Poonam Jadhav <Poonam.Jadhav@kpit.com>
Signed-off-by: Poonam Jadhav <ppjadhav456@gmail.com>
---
 .../python/python3-setuptools-rust-native_1.1.2.bb            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
index 8ec9a86f00..c11116a1f4 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -14,9 +14,7 @@ SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a
 
 inherit cargo pypi python_setuptools_build_meta native
 
-DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
-
-RDEPENDS:${PN}:class-native += " \
+DEPENDS += " \
     python3-semantic-version-native \
     python3-setuptools-native \
     python3-setuptools-scm-native \
-- 
2.25.1


