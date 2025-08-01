Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640ADC87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.80416.1754022167228490299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5uY/2A+;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so1284204b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022166; x=1754626966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouwtue/IihJDZJSowYSsr/k2+/4nrGUx6JhwrXBwo/Q=;
        b=N5uY/2A+6PqqEIjvuOtFmpk1k97dKxyxhTDmk9AqAGA3POvYC8dJj6gpls3ZPt0L/T
         6n6/m6rxodFqTqOolatwQvmc+UvepwM7RP0+FPGVwGUk9d/pfEytiEK2N5aQiSbfPT05
         SXNI/52Ieig1M3onU+hlBGB/LfsP+y3vt2uT5BqjkNTqR0PJ2+F5bJb+Coq+0CIDk2GW
         OBvDUUrruuUpOq4slGGAVA1f7dRMmvdRTsA+ho5AKl4h984zKqb6aYngHTsaPzUg5hBh
         Dtygt95V48YIn3UNvUl/tDk4J9JCXfiJTXMOpmcE9Pe56sFeXiJ/+mu9eVpBJZZeCP3w
         8wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022166; x=1754626966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouwtue/IihJDZJSowYSsr/k2+/4nrGUx6JhwrXBwo/Q=;
        b=Lb2erCDrfOSU4aP63PdnSwIIqOIAlNoig+b8cx4paGAbU3RMZf6WBWd+tN08/QC7Iy
         Yrby9N9njHG0EyBxZ/Ws9GF+njf4wACW6LjkiSgGgRYpHiqO14LS4mL6uiGo2nOxORyo
         kuZHxtd2b3Va/nD+K5Dy8sOeXdosOgo8m+qPDL8rdYrXzRGQOjFxPD5SuFctStVjp1L1
         YfdeES0Apcin/xtacSmgZ8MQXUOYOhJvY95rWAM15ihadwykDomRx0DS2B1Tt2hHINnr
         MwVFbLGGTyj0V1yTgiPcnC2JYbQuTX59v5MYXbwQIQWQT/vydn80T6fVYTwM+OyaJpdk
         +QzA==
X-Gm-Message-State: AOJu0YytbUY0BytbV0zx9/xyV/BqflgPd8t+VQEsR/RJ+r24fIkZIh2v
	5bWuU7XZFVhtOeD60cB2kFNyvdYKWZ9FJlFNIQvuViVWyA86LH/8tou+L8AsQycwVzM=
X-Gm-Gg: ASbGncsbJXn3K5lmf1PAtsJnCokmazljmGJWwKzCxE4a8PMTC+jhBOmQmQGULhC09a3
	3DjB7zTZsbZpz6ksvzZcnvgmVrn2F5FB2ALfCTe4c6RLWxIXUSqwJgZOcusecMGzLW/8z23Mm21
	0ktpycX2P+NZyMIpQp67GsDEVzIhW4jDl6LY18FR/dZEu00UkvLyTh/c9OEl2aSMYkUvEQnSdND
	ETcS+wmEne3VbVzUmvWVBhAUcPjPyBj3QtW9JgyRs8hIi2z0/pmAJ1j/qRJwnYNGddLPKik3BTj
	GblSbv++thnV058t/B1ydYnResHtbRGIdoBbZ1C50EENRj6L+0aENNzije0GMXPMNGOxrUpFs7a
	BS6qIC1yxJD7Yl5qvc6CzmA0O
X-Google-Smtp-Source: AGHT+IGfvUFRUGRN0x0iTW3hMDISOmoKRQ2N7BS0BZdmZK0Shs1xIxPtshzvhCTe9Zf25RaO6sjUEg==
X-Received: by 2002:a05:6a20:734c:b0:220:9e54:d5cc with SMTP id adf61e73a8af0-23de81c6194mr2293728637.31.1754022166336;
        Thu, 31 Jul 2025 21:22:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/7] libxcrypt: Allow undefined symbols in version scripts with lld linker
Date: Thu, 31 Jul 2025 21:22:37 -0700
Message-ID: <20250801042242.3076232-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
References: <20250801042242.3076232-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221215

Unlike GNU ld, LLD defaults to erroring about undefined version symbols
add commandline parameter to sush lld here

Fixes
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'crypt_gensalt_r' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_gensalt' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_gensalt_r' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_r' failed: symbol not defined
| x86_64-yoesdk-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 77fec832348..10f6cd921d8 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -24,3 +24,5 @@ API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+LDFLAGS:append:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"

