Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.28959.1613957321077459545
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 17:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gWVcmg6n;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id ba1so6752507plb.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m9nxQ2oEX/FLWsOdzsBnabpvSHO5P7MVsuBd+F5Ta9c=;
        b=gWVcmg6nXF5KKmKaNBh5iVDdXQ+A9/HXI8t8UBfcuIaAR08alzN4IODp+f9lySwvs2
         BrmR49m0JgWxuv6koUoFSPBbvdqZYN/eUHUDNfgVuejIMBZpl9wLWQK4MvrMSHhkYaJC
         2ZrXnyW9Hyjkg6WUM8Zp/B2jaFSoQGasuztK2EpEcd8NOLqGPIbb/QD8ZEFWD6K1mWZF
         kGWA+eF48P8Mb1aTc/13WqEad9D8oLHzgHqkJYfH6JDWLGlOLsKa7+xO5Ms0i1KlioQZ
         LrKFFllsnSjADi04Z7H6VkoIFB0lgfWs61MtItTHGhEoKhpAZuHfT7W4H0KFXgOlX+Aj
         7f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m9nxQ2oEX/FLWsOdzsBnabpvSHO5P7MVsuBd+F5Ta9c=;
        b=sBq6AFP8jRfofQZbgWZKf5KwM7/WBbnnAjXGQ20dpHDRjdGCEjv27BiV+1vnf5okfb
         qa1ckbnXbj4C3vvVH+wwP1aB7q2Hkahq3wNX8hElZRGD6qOGWPLijsj/4rH32nnAUQeR
         YFQOO1l/KSe+GZsaXgBSp/r9d44EC9vkWvtcgfVZcuoKBJSNHXTnOtntg9HJ6b4NBxmK
         giJvZlnVjv6IajYLgssY0BguArrMB8gf1umwgjopCenqhRqHT+PliyVVvqUYJwOPmH0Z
         XIUPpmzwXmXG4GsDmYUQDdpFh+W+p9ZfQovZBaLATPsHjuxBqFlyTQAbHdofCHb5wmqQ
         GrYQ==
X-Gm-Message-State: AOAM5318EaIdbIXrMpmtENXTTNsIbLXJjP5qoZ7koFPShDz4KR9Fq9sk
	NMqIbFHUHOsNKUoFwGsxGtdG9iSSQGnB5Q==
X-Google-Smtp-Source: ABdhPJwMQmzfFPwZz7aZv9vGmz0R6WmdjH9ZVJ+S2z+lDmb2202YkhyhoxsifHmFBMnxUxnsY+71Vw==
X-Received: by 2002:a17:90a:5ae6:: with SMTP id n93mr21118116pji.146.1613957320397;
        Sun, 21 Feb 2021 17:28:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id i18sm1338439pfo.16.2021.02.21.17.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 17:28:40 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] nettle: Upgrade to 3.7.1
Date: Sun, 21 Feb 2021 17:28:36 -0800
Message-Id: <20210222012836.1521120-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222012836.1521120-1-raj.khem@gmail.com>
References: <20210222012836.1521120-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bugfix release [1]

[1] https://lists.gnu.org/archive/html/info-gnu/2021-02/msg00011.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../Add-target-to-only-build-tests-not-run-them.patch           | 0
 .../check-header-files-of-openssl-only-if-enable_.patch         | 0
 .../nettle/{nettle-3.7 => nettle}/dlopen-test.patch             | 0
 meta/recipes-support/nettle/{nettle-3.7 => nettle}/run-ptest    | 0
 meta/recipes-support/nettle/{nettle_3.7.bb => nettle_3.7.1.bb}  | 2 +-
 5 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle-3.7 => nettle}/Add-target-to-only-build-tests-not-run-them.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.7 => nettle}/check-header-files-of-openssl-only-if-enable_.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.7 => nettle}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{nettle-3.7 => nettle}/run-ptest (100%)
 rename meta/recipes-support/nettle/{nettle_3.7.bb => nettle_3.7.1.bb} (95%)

diff --git a/meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.7/Add-target-to-only-build-tests-not-run-them.patch
rename to meta/recipes-support/nettle/nettle/Add-target-to-only-build-tests-not-run-them.patch
diff --git a/meta/recipes-support/nettle/nettle-3.7/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.7/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle/check-header-files-of-openssl-only-if-enable_.patch
diff --git a/meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch b/meta/recipes-support/nettle/nettle/dlopen-test.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.7/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle/dlopen-test.patch
diff --git a/meta/recipes-support/nettle/nettle-3.7/run-ptest b/meta/recipes-support/nettle/nettle/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.7/run-ptest
rename to meta/recipes-support/nettle/nettle/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.7.bb b/meta/recipes-support/nettle/nettle_3.7.1.bb
similarity index 95%
rename from meta/recipes-support/nettle/nettle_3.7.bb
rename to meta/recipes-support/nettle/nettle_3.7.1.bb
index 2c219c2a12..d6bb1c84c6 100644
--- a/meta/recipes-support/nettle/nettle_3.7.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.1.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "f001f64eb444bf13dd91bceccbc20acbc60c4311d6e2b20878452eb9a9cec75a"
+SRC_URI[sha256sum] = "156621427c7b00a75ff9b34b770b95d34f80ef7a55c3407de94b16cbf436c42e"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.1

