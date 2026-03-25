Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936AA103A9B1
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20283.1774438307564485381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JD0UbWGW;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso44113295e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438306; x=1775043106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5Y1p7srwo+71qGz3Nyhw7q1HGs3oCvnEbgY6Hry1PA=;
        b=JD0UbWGW3rQ/VGheVsos3Fnq6qdIhOq54XRZAnbCUaKZCROXXlo5UgxLS3yxZm7Xij
         6DaBuYmSM/o7UsXBbIh693AEmL0oV7ziUtT59N+lx4a8Hd/tf+6WcnOU0+aJTsRUS84y
         LEKP/h2VkSoieGFd1X01CRyfD0OqctYM4kHKFYu2hSfwwcMJt3b4mi8ww7z7erl0qxR7
         JoXipCR/Pew5KKOn0EHxf09SzlY3GvMNnFK8Cua9zaF/+M5bJbdOa9UrnnRWTxXlsuKK
         NchLcxW/rYD921kdBL2t4CbZfFOnJ3GacvoYm0mmzi7NAPUbOkFNob1p87zoapUt3Kwf
         5Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438306; x=1775043106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5Y1p7srwo+71qGz3Nyhw7q1HGs3oCvnEbgY6Hry1PA=;
        b=SLyfOY7mAPerD1LDTypC6gvoE1Uel3a51p75IMvS12SE8Pqztmts8PLev/XpvGqaPU
         qkFsm0Z2f2zHHO7xmaix8gIRmLUv6XvJMGRlP6rijy1LOeEV8VOOIMAcrksc13YqQyMu
         n85mU6tTANvcYoSGGGc1rsLIJHxGmO24D/eCSjCd9rZZWEARzI7bYzZPfxH/b31Df9gK
         O/Di+AW5EDddFn0bdfMc3nIeR50t2IS4ty3fqnL8Yz4vQNbPIfXxcrVvURMfY6uDJJlj
         5OytgPK1MmmeVwMHeqQnLkX9vEBOPCmI0H2ZUbxGJUEYmzUUOUN66+MaPyt7EBtFkUno
         4Kvw==
X-Gm-Message-State: AOJu0Yyj+e8nb4Nfcc0BbF7ZYRYnI6P/JmdbfGwUcmCwyptubUmOt/ow
	KTa2po0Ue+NhKGtllm8pNTydEuzyp1UzrNv2ypGIt9S55XeCmXhUT1f57GfJKw==
X-Gm-Gg: ATEYQzztGaJ7WYFr2QUyV0DvdUMEYhG2PIBP5fCple0ErOLKPRqoxV3P6+IJ/DXEBJD
	UewLgOnMVw/i8QxqNTzr8BPzy6VnIBPJsebC5VB9t16Yu34qXX3LgA8P1x8oQp0XKglj1hKM8w7
	UTewaN4++f5jeaVXnE0ShrFCQqKbxwrXeR8o0vQZAHEUI/I+xL02RScm2M6xiJBYEckXEgPGrr0
	TPvUGNr1JOFh4rnXCNy3BVpy/LhA7wK0qOGVcjY8tm6EBb2Qdc0TpKevzB/AJbpiB6KpxJbzZvi
	BLmfHTDmPvHD/2hZbZ12EiKfa4PY0AlKh8jfHZk1ob7IZDPnXRVDLutstj2BpXIVtjqKlYJDucI
	d2jl4Tw2aJDx83lVh9gDdnnhwZyoL8j3sTsrbT1yPDM4QA0qdrperSWK/pEK8jzE15sk9JcUPJe
	W+eefwWc/IEnEzrg==
X-Received: by 2002:a05:600c:1550:b0:487:1e7:8e7 with SMTP id 5b1f17b1804b1-4871606caadmr42555505e9.33.1774438305597;
        Wed, 25 Mar 2026 04:31:45 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:44 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 10/14] libcap-ng-python: Use PYTHON_DIR for FILES
Date: Wed, 25 Mar 2026 12:24:20 +0100
Message-ID: <20260325113112.1163632-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233884

PYTHON_DIR now contains PYTHON_ABI, use it for consistency.

Move the installed site-packages directory to the correct
location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
index f702056f02..4e01c320fd 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
@@ -12,6 +12,9 @@ EXTRA_OECONF += "--with-python3"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install -C ${B}/bindings/python3
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
 }
 
-FILES:${PN} = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN} = "${libdir}/${PYTHON_DIR}"
-- 
2.53.0


