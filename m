Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F209CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 06:56:47 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.33007.1725260200699530549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 23:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Llq+HOsu;
 spf=pass (domain: mvista.com, ip: 209.85.161.53, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5dca9cc71b2so2360559eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 23:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1725260199; x=1725864999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y8fnKYe35kFBGXu3sntviwekmWhiPWrVeZf65OfAso=;
        b=Llq+HOsuaCbbo5o+4NSwkhCgNPPOShjvGPgLpxX/wAZSR2AMhLHeotykE3EwMgF6M6
         xugESRZC+ylgYzOT0Snj8+MoG6Dy6KMlVzCwPc0mTvRxMiXHmVibR2gmb4+VST2+2GNf
         zV8XVwNus20/XiNZ0KPMU4L7j+kjG0Wv0Nq24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725260199; x=1725864999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y8fnKYe35kFBGXu3sntviwekmWhiPWrVeZf65OfAso=;
        b=Yjsc6ZJFYFI0tlIJGMR7b4R8jq2U1+QZpTbE2S5+ILDpandRFhXsdJ23tIZmIVRmjr
         7pw9mtbEmA20vRkvmlz0NiP6dg1Naye1UM5JuypZWdxJZLYzpd7HvcdUHTlynY2HxFyi
         MlxYunzp/1qmEMY5g78h9WIqf4iGsH4Dpb/ycdWy2yCQFhLDOaHIgGuQWxfgwbY47MyZ
         GWCrNF9wlVmalyKBRY9wujNW60v5d4QIFDWm3Lu5tWJ6xRGbfyvC0dDllSV/1UcD16vM
         iCHUDddSyyufQfvqxJz+71KC9h/2CJdMzK8/eHxcAuurnBVtn4DvG4XBnm0TDrAVoIx/
         L+Bw==
X-Gm-Message-State: AOJu0YxBOPxSKskj4cNigLpxRKXNvl3MezfagQO5CGN8Z7W6gmK2qr/6
	ORwxg6Ou9XY5y1wzlc4U7qBSNvBBw2fQWyaXi7SwOokKUsJwen902qrOSImFj2DoYRzHf/uv//L
	Akdk=
X-Google-Smtp-Source: AGHT+IEeRKD8UPXMafRrQUa7riOW1sytLodr4O839p/tsLGQNj3GcLQMjB+51yX5JaZezXdGfCJpZw==
X-Received: by 2002:a05:6358:29b:b0:1aa:b266:2a67 with SMTP id e5c5f4694b2df-1b603cce482mr1233172155d.30.1725260198963;
        Sun, 01 Sep 2024 23:56:38 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:951d:85a:45e0:7195:8525])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a6ff1sm6247137b3a.86.2024.09.01.23.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:56:38 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] apr: upgrade 1.7.2 -> 1.7.5
Date: Mon,  2 Sep 2024 12:26:23 +0530
Message-Id: <20240902065623.829359-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 06:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204059

From: Vijay Anusuri <vanusuri@mvista.com>

Refreshed patch 0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch

Includes security fix
CVE-2023-49582

changelog:
https://downloads.apache.org/apr/CHANGES-APR-1.7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...1-configure-Remove-runtime-test-for-mmap-that-can-map-.patch | 2 +-
 meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.5.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.5.bb} (98%)

diff --git a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
index a78b16284f..3480deaa4d 100644
--- a/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
+++ b/meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
@@ -34,7 +34,7 @@ index 3663220..dce9789 100644
 -#ifdef HAVE_SYS_MMAN_H
 -#include <sys/mman.h>
 -#endif
--    int main()
+-    int main(int argc, const char *argv[])
 -    {
 -        int fd;
 -        void *m;
diff --git a/meta/recipes-support/apr/apr_1.7.2.bb b/meta/recipes-support/apr/apr_1.7.5.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.2.bb
rename to meta/recipes-support/apr/apr_1.7.5.bb
index c9059c9921..c58204063c 100644
--- a/meta/recipes-support/apr/apr_1.7.2.bb
+++ b/meta/recipes-support/apr/apr_1.7.5.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            "
 
-SRC_URI[sha256sum] = "75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e"
+SRC_URI[sha256sum] = "cd0f5d52b9ab1704c72160c5ee3ed5d3d4ca2df4a7f8ab564e3cb352b67232f2"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.25.1


