Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.17656.1590940458593121377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bMoV8t+O;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s19so5391305edt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CWz6g7jnfc3IyDORmZSMGHjlsTbLhBE/nYCsmuoi8I=;
        b=bMoV8t+OgMViNTkPE1HzDUifQDfCySeXXCvQ1e9a7HqFxInK0jst4EpPGryasrwfEN
         +4i16jwcy2/gDXL237QGIE6tuaFZzNOkT8fDv2iFTO8OqPIxITT3klu1/Yi1f5WbNAgm
         o9QV6MmDyri7epe8SUnM2l42np2sUvlPgzEE5dWVh8bo+tGusYJ78Wfu8MxkKOyPX4EQ
         8ckqPzZLxZjX2IEOxK2CUiIUlIjnxS1DeK7sCY+IX6rwIQSGyIhqP32SYkVqA4wkIuPY
         gdOjym4cuHjWuuk2K9detvGJ1Bt4Qs1mkwbSLx++ofkEYA17/axUQJO6GGPdOk4nI/nX
         UZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CWz6g7jnfc3IyDORmZSMGHjlsTbLhBE/nYCsmuoi8I=;
        b=JLsj0VRC7HMA8hyO25y3nW3I52XrEuMd+lrcmxOLVbBBTIN5OyS+bm7V9yfqwWvvnC
         QfwY/UHnmslmCHaLA7sxcJoo1MaJ25kX/A7FrIh7wwHdY3ZIaWOiGwUnUOP4oTm6otiY
         O1trv2DhY3czAw+yzS3W0xL6Ky5bjFbM3GslvIJ2dsjptv8lf5OlMwKim0r0zbCcgEuC
         O8F9C8tWT8F5qJz/+76k3hH77wfAvXDWGka08dfOs50eq8i7nBs2LDTga14fXNhpPtzw
         TFzpsZ43+/XZQ1p9Au4byv8n3v49QwJxA1Zom4LEWNxdoebFxEgPyZJjo084xb14OeG8
         3zAw==
X-Gm-Message-State: AOAM531EzoaIr3LLXuZAX58/aI3QPnr20nBJPXA0kUKIh9w4N7pgpMOH
	4AxjvEgaioc9wwZjBFqj2ifSZ72K
X-Google-Smtp-Source: ABdhPJwlDmcFekjHd6dNJyvwLTtqGLvsBIEHJA3kR29mJUt3nSKdJONGT8zzY2csqzlFRGjLughExA==
X-Received: by 2002:a05:6402:70b:: with SMTP id w11mr17090344edx.251.1590940456945;
        Sun, 31 May 2020 08:54:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 56/70] jquery: update to 3.5.1
Date: Sun, 31 May 2020 17:52:40 +0200
Message-Id: <20200531155254.10283-56-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../jquery/{jquery_3.5.0.bb => jquery_3.5.1.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.5.0.bb => jquery_3.5.1.bb} (67%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.5.0.bb b/meta/recipes-devtools/jquery/jquery_3.5.1.bb
similarity index 67%
rename from meta/recipes-devtools/jquery/jquery_3.5.0.bb
rename to meta/recipes-devtools/jquery/jquery_3.5.1.bb
index 5c6f9cddbe..b4d7e80afe 100644
--- a/meta/recipes-devtools/jquery/jquery_3.5.0.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "jQuery is a fast, small, and feature-rich JavaScript library"
 HOMEPAGE = "https://jquery.com/"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;startline=8;endline=10;md5=b1e67ece919e852643f1541a54492d65"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;beginline=8;endline=10;md5=ebd7bc5d23ab165188e526a0c65d24bb"
 
 SRC_URI = "\
     https://code.jquery.com/${BP}.js;name=js \
@@ -10,9 +10,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map \
     "
 
-SRC_URI[js.sha256sum] = "aff01a147aeccc9b70a5efad1f2362fd709f3316296ec460d94aa7d31decdb37"
-SRC_URI[min.sha256sum] = "c4dccdd9ae25b64078e0c73f273de94f8894d5c99e4741645ece29aeefc9c5a4"
-SRC_URI[map.sha256sum] = "3149351c8cbc3fb230bbf6188617c7ffda77d9e14333f4f5f0aa1aae379df892"
+SRC_URI[js.sha256sum] = "416a3b2c3bf16d64f6b5b6d0f7b079df2267614dd6847fc2f3271b4409233c37"
+SRC_URI[min.sha256sum] = "f7f6a5894f1d19ddad6fa392b2ece2c5e578cbf7da4ea805b6885eb6985b6e3d"
+SRC_URI[map.sha256sum] = "511d6f6d3e7acec78cd2505f04282b6e01329b4c24931f39d91739d0d1ddeef8"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.26.2

