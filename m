Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.21780.1627919206523632093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 08:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hZ+4A4As;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id e21so20095273pla.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jpQIbRBHd3xhJr/M+wgd9uhK+kwAUXR0BMc4xSUAn3k=;
        b=hZ+4A4AsQ50y1KcXeYtHsA0NKoNusI8EdZxbC4OYUtjHcAzz/7dzx5MpeVJt5oiAJ0
         twuP5lNMt3vItjYd1nNxYA9CkwhlMbO9yG+HZCv7m3/UaO2r9TBU+VmN2Z35xD9a3MU0
         gBcWCEZcjViqDgMTSaPlKUXCJuqxUEUV3Ge670IzT2ub9b84M3HK77xSkYmnvc4qJBl6
         wzs42F2o4gS6/fSdQtOGQZGjhEbkiwTle+uVXOBeDzrnVc5wGTmxbnFXrHhlgGUyJClr
         O0wu/0PFyDCjefBnRWXlhV7XhotUhozsBK35LK+ZNY2dulpgBqUP5FIYDxe5lU/28Qu0
         vocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jpQIbRBHd3xhJr/M+wgd9uhK+kwAUXR0BMc4xSUAn3k=;
        b=Z4jiU9PyZ857HkBD8oEPGzFmhhpAjkVANg0sopwGU8OsP9yUEwp9oNFIjktFncbXX1
         ZltbSIVSNKWRjgdn7Ae6D9a38ANCO3JPO6oYtnfExt3rBqheVm+92+32NFmi/m5LS0C+
         h9d/T5Y9cFli8eqPsUhH7wbeElmRla2CGSjORqG9Hxyhw3U30PdAYzIOKv2nmQWhi7k1
         dL8Xn9tcbsKqtIcv51lE5SOI9nzRYoCgjJ0Ji7s9vB/BNlWe3KhW/srEjNEmCg/bMLwK
         nAGY7+ZyLKqZDnRYrEapDCDRO6kxpwkFVfM40OcJNWjMTJN//MpV/pdwjSQ3OGu05Ufd
         OIbg==
X-Gm-Message-State: AOAM532uss6Njc6Z1VoVC743vja/bDUiN+P5JiGeKXUHy57J9BL1u/km
	F/96Yna1iNPXHEwyu87YED4buuAO0JEhpw==
X-Google-Smtp-Source: ABdhPJwYkWyKfSSpijQqzgv9RXhX8EbUxbO9SR2hlS83PhTLAP622UceeODl1T8KBFypGSczyPQSEw==
X-Received: by 2002:a17:90a:e513:: with SMTP id t19mr3564476pjy.144.1627919205992;
        Mon, 02 Aug 2021 08:46:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id q5sm11048085pjo.7.2021.08.02.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:46:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 4/4] glibc: Add missing symlinks for libpthread and librt dev files
Date: Mon,  2 Aug 2021 08:46:39 -0700
Message-Id: <20210802154639.4181923-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802154639.4181923-1-raj.khem@gmail.com>
References: <20210802154639.4181923-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 53c615ff06..3026aec9b6 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -119,6 +119,8 @@ do_install() {
 		ln -s ${@oe.path.relative('${root_prefix}/lib', '${base_libdir}')}/${ARCH_DYNAMIC_LOADER} \
 				${D}${root_prefix}/lib/${ARCH_DYNAMIC_LOADER}
 	fi
+        lnr ${D}${base_libdir}/libpthread.so.0 ${D}${libdir}/libpthread.so
+        lnr ${D}${base_libdir}/librt.so.1 ${D}${libdir}/librt.so
 }

 def get_libc_fpu_setting(bb, d):
--
2.32.0
