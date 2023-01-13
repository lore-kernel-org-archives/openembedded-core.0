Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FFAC678D8
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:57:16 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.88937.1673621830287090830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Far/Ggno;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id bk16so21290406wrb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62mxDXQuWU8/0eRUfjeJxNKX+PoqeqsAGRo5ggeklfY=;
        b=Far/GgnosFki7xSAHHTq6dLt3m9PJe1dQBPinSn5l/V1EWFy+idW/EJfWuIls/X0jK
         VCvdqfEOurRNYxhiq/whVx741cheIlkAt9jVsWghcKnFnNn0N4dw1WjihqaLRWP/tfpd
         foz+hEjcMx02oPlzjgUM2YezuzbGKaLESNsooiF2S2OJGDiYvsZiV8roHXyktkyb4Om1
         1EHEuSyUo4k+3rizmYEShwbTaE5MAcdRr8hOj8FJwo8NOBNhcgZIW+WzxH6lwH6IYZwX
         oJe2G7iPsaG4x+FaJgqpSS17BiMVHA/ebe3xMi5gljqr31IuUDfvSJE/AZM/ZADjP+jz
         2dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62mxDXQuWU8/0eRUfjeJxNKX+PoqeqsAGRo5ggeklfY=;
        b=I64Ec0yFx4ITqt5MbY70Ho9gMPEKUkcnV+J0MZXXwE22OEsAqX4pAW+Qm+9yp1DEuW
         jwmawOOuCeAo/d07r60J83VNPB+4CqZa8MleVOGzxznXUMGxkjWcz0/68VTbXhc5IWPn
         G8PTJ2a8LcgQv+xHzabLwCDeouOc2JMW+Y983W8k2WuNQJQuzLNclNn8HF4BSIMAAsZD
         qMo8zKYWczvXTFWu9vOSwNg8f9O1NynC3tLhlu/6rML5DOjCRS/rEljv2THPO/bswetl
         eaCU5zOehm6hzt0z2vEk09snCV7cgODi0FbkCDcIxirvBWginonq6F18YKvOHCXhZKhf
         V9XA==
X-Gm-Message-State: AFqh2krsdzc05UK9UwhgonYJ6JWDbdX4WWDjatekgEXmaQl3jvkJIKLJ
	peoYw/5pNubm6RtzR9PGlC338coV+co=
X-Google-Smtp-Source: AMrXdXvEZrSzN4wj2+bVhwr4zwdHCNFEYMygMi72JMv803dQQ+RFORX3TyEDfJAKGYOc01UDPOxIPQ==
X-Received: by 2002:a5d:45cc:0:b0:2bd:e8a8:80bf with SMTP id b12-20020a5d45cc000000b002bde8a880bfmr451516wrs.55.1673621828741;
        Fri, 13 Jan 2023 06:57:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d20-20020adfa354000000b002bc50ba3d06sm15808417wrb.9.2023.01.13.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:57:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] python3-sphinxcontrib-applehelp: update 1.0.2 -> 1.0.3
Date: Fri, 13 Jan 2023 15:56:58 +0100
Message-Id: <20230113145700.2773771-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113145700.2773771-1-alex@linutronix.de>
References: <20230113145700.2773771-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175832

Convert to flit, adjust pypi name.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...lp_1.0.2.bb => python3-sphinxcontrib-applehelp_1.0.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.2.bb => python3-sphinxcontrib-applehelp_1.0.3.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
rename to meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb
index cde0da8265..c97d204c06 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.3.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://www.sphinx-doc.org"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7715857042d4c8c0105999ca0c072c5"
 
-SRC_URI[sha256sum] = "a072735ec80e7675e3f432fcae8610ecf509c5f1869d17e2eecff44389cdbc58"
+SRC_URI[sha256sum] = "83749f09f6ac843b8cb685277dbc818a8bf2d76cc19602699094fe9a74db529e"
 
-PYPI_PACKAGE = "sphinxcontrib-applehelp"
+PYPI_PACKAGE = "sphinxcontrib.applehelp"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


