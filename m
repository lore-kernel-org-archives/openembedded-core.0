Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.8778.1618733801887863473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 01:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i+zFdWcS;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so18653328pjb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 01:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUKeYmxAeMsz/7VD5vP1dk6GvMyw4Hwv42MB+SznWjI=;
        b=i+zFdWcSqJDpsOxhp2SLPFcwcZqNyE95GsJ553lZykQy0iEDzCQyohiumiDhe0mhxQ
         4ZkPZHD9MJcc9sClMOUVX9VgrigcFM773uHKAGg/azhBCv7G/lwjBeuXDuQDTkATKo0P
         12N7xrAhlQfCQ1q9y1FZTwaYj+ddf93omWPOFX7j1Q0/tqw3mTHaevz9xjM63TnIm1r8
         psfsEsWXBdgXvb8gsJFgR6fRBmZtvKOz0rHkzqi8UV5VJMqKEL0xGrlXsJsEHAtXsuSg
         tx2m7iHc04AOQoTfsVg4ITbMV+9rbVmupdHWawKznfzEqzSyyhrcrDlqEXRn/nmpK3m8
         RFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUKeYmxAeMsz/7VD5vP1dk6GvMyw4Hwv42MB+SznWjI=;
        b=fi/k3aTZVdsPXXyCESBYzefjwoMNm/PUGFgj/8TDXPz7Q9Z3Fz6fkL2bfJji/54dQL
         /cj/hdMyo9I2exqlF0YaLAfXUsXyahkkWsATJpB6DkkigEf9+DlRYCmG1PhzqSb/i5HZ
         FLf4SqDggwkspC6Xu3q9FsHPs/28JNw7M0S5gecfaZlRrIXUJhvtGneEHsdpPU2Ykfd2
         23lGGP0q/ZoLATxS0OZUiLhXbEECn7KSkd3IuYn907pm4ZdVE6wam6Vr0tQiQMgdkVqk
         atnYQuRKn8ArC/T0rH2eAoRScr42ynM3r5aci1gzEnaYqjWZ0HCEj+vG/kaUcvv7RJo8
         cd6Q==
X-Gm-Message-State: AOAM530/dfREGNcu+b8ZzF72pNpZSYE9NZOhMihmzrdrcR7ZvgS73rf5
	ndVVcYSZxphd77gcJY/c/qMCuV/j4mUo9A==
X-Google-Smtp-Source: ABdhPJzCkSbeJgTkR2tkfLlzUDYwe4F9NdSkYBq8IfSttgLl2VWHT1aDUJHALan4mNvS1pd94Rc5vQ==
X-Received: by 2002:a17:902:8688:b029:ea:f782:5eae with SMTP id g8-20020a1709028688b02900eaf7825eaemr17316737plo.15.1618733801280;
        Sun, 18 Apr 2021 01:16:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id g2sm2339211pju.18.2021.04.18.01.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 01:16:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/6] libpsl: Add config knobs for runtime/builtin conversion choices
Date: Sun, 18 Apr 2021 01:16:34 -0700
Message-Id: <20210418081634.3169548-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418081634.3169548-1-raj.khem@gmail.com>
References: <20210418081634.3169548-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use libicu by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libpsl/libpsl_0.21.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.1.bb b/meta/recipes-support/libpsl/libpsl_0.21.1.bb
index db4b3a5991..4fc0ad8acb 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.1.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.1.bb
@@ -16,11 +16,10 @@ SRC_URI[sha256sum] = "ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896
 
 UPSTREAM_CHECK_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-DEPENDS = "libidn2"
-
 inherit autotools gettext gtk-doc manpages pkgconfig lib_package
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ?= "icu"
 PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
-
+PACKAGECONFIG[icu] = "--enable-runtime=libicu --enable-builtin=libicu,,icu"
+PACKAGECONFIG[idn2] = "--enable-runtime=libidn2 --enable-builtin=libidn2,,libidn2 libunistring"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

