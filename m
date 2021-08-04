Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.303.1628110666609350689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 13:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BOWTcuxL;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id j3so4437797plx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 13:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eQKERkRv4whGwATcYN+wjUiRtoF5StOEIbEQO2J6Skw=;
        b=BOWTcuxLTG7G9yttACEP/1ki5y5BgzX++K2/kRXyh2A7USbG12bTsn8eSV+r9sg0Yw
         kLwrTyaOB7uOBrYm4g3gBZxZUscosk65+il11ivUAmuJOWPg5qdLrbTlri+whG5+BD0K
         eZvll3HzOLBWki2HF95b9G2s6yNpGcA8i2IjBv7FqgTO1ZOCFwHhkWweJYx/T72Pb/53
         +O3lp520RnWYV84PO52vUiSQi6966dbogSN2Y5HVH3GA4dUVoYkKUqDyljDxunFBdWJ1
         s98J5KodKCtwMzDg3buZ/xLt91jNjddv7MqcVy2GkTEzwakNGmEderLX0IFz7bia5VJ6
         F+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eQKERkRv4whGwATcYN+wjUiRtoF5StOEIbEQO2J6Skw=;
        b=oGJf1co5DOIWItIbqVJ5vLnxBpvl4A135rVWBqN4WnfG04Dn15MNUqeU4Sbsw9lPxQ
         d+vx6fq8TDammM0EdxeWtqwLGkSvdxPiSGZDbrheA+4K7uR1Mi+xxh/LBPm95qWOo3KS
         vUUtcofigneE53qz9Jb/p/lSDOA7gh6DLxSPceY2IzanT4jHffkCndiDA3nmtLvLWrr+
         gj40wYRBdClxaPsqblgGgrvqIhELxHGiCZRRn2cJrQafEh3q2bdy0HabJ8ueo5YKkUhq
         2HFgl6QdbtMKEGpuAcAyI99kK/I5WKkRFodQCYKEFyn2NkF56DOEbQBtxbf+WJdgDG+s
         XT1A==
X-Gm-Message-State: AOAM5316+DdAnEc+Nltl//0P8dYG3hicc1eclFagKIvkLvd9+Xidgqg6
	rc+yMp/plqPU8bFdSvC6MEaU3PlgsKlrwA==
X-Google-Smtp-Source: ABdhPJxHdpbvl5H99eMD7iMYYqZLzzDrRXn4h11VVLoOYzFlEikaAQGEwdgBJqNViSZHju4edgTGXw==
X-Received: by 2002:a17:90a:a103:: with SMTP id s3mr985161pjp.121.1628110665919;
        Wed, 04 Aug 2021 13:57:45 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::6173])
        by smtp.gmail.com with ESMTPSA id v7sm3338761pjk.37.2021.08.04.13.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 13:57:45 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/2] python3-importlib-metadata: upgrade 4.6.1 -> 4.6.3
Date: Wed,  4 Aug 2021 20:57:22 +0000
Message-Id: <20210804205722.1206598-2-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804205722.1206598-1-timothy.t.orling@intel.com>
References: <20210804205722.1206598-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4.6.3
Moved workaround for #327 to _compat module.

v4.6.2
bpo-44784: Avoid errors in test suite when DeprecationWarnings are
treated as errors.

References:
https://github.com/python/importlib_metadata/issues/327
https://bugs.python.org/issue44784

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...ib-metadata_4.6.1.bb => python3-importlib-metadata_4.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.6.1.bb => python3-importlib-metadata_4.6.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.6.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.3.bb
index 9fa4754881..198138af7b 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.6.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.3.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "079ada16b7fc30dfbb5d13399a5113110dab1aa7c2bc62f66af75f0b717c8cac"
+SRC_URI[sha256sum] = "0645585859e9a6689c523927a5032f2ba5919f1f7d0e84bd4533312320de1ff9"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.30.2

