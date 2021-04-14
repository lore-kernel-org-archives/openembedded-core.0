Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.15115.1618415296277495803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 08:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N3BqC5J7;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so12739157pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S6z0oiMRBl/5mSV1NC4Ej7ih/W0vHaipvWOg4YRsb9E=;
        b=N3BqC5J7s7JVEOC3j5L3nGvKJ0D8pU3wfh7gvfCffdvXD0fJwcD+ETmvzYeCOWZIWP
         MumvVsyM3g5JgOwxy1WXEA7dXr0Bp/DtdHPBdJyU8wdBDk9WzjpdY3ajdPYxDMyXu1nW
         5cWsy+i2e7xRqE3eAvP7mMH9wJ/PQu1OG5U/RMxTeOXEIOqEH+HpVXEfwSotJ1JNutba
         AoUQKQKGjVuq7+WuOjV+4i3GkNzfj0z2ectuJVBvhKAbpPIuwCVhDBMoyJ1pNNyYqOv0
         rpf6V0BUcDVSH2nBucGOr169wchp2rpDGIePgKplr4XIV6+/YIkPSZNst72r6Yq9bsug
         120g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S6z0oiMRBl/5mSV1NC4Ej7ih/W0vHaipvWOg4YRsb9E=;
        b=cT3qJqknMpZy8ZRc3TqycF6XYX1r0/9h340tulMD5qxC5nVjK6gWovsdKIndliO24j
         xkggI8pEHtaK/Dxn5xtzzeds12lmOyoiHGYHav+HPZUE8jK8sQkCbJj9QmAMgZzo+DiV
         UVX/UBF7zQW1O+0qUatyeLwS+kwMaEd9fRlCuTcDowbbmRA/5H4WTpT4Rf8i/d8OKu4l
         vB/aa/ggBVmKZwAfUeZIa73RwQZ+nIpi/SheI25IW5ZmsuJk/v/IWeskcMDHizdfanUd
         kb3TmkMOmMAHL0EjvV2/tLuFdlzYMlcfvDIEiwhYK+yX65DTGdt4OEKNuZDK1zyS6+JQ
         YcNg==
X-Gm-Message-State: AOAM531WuMRspv5jWAtuegFAIm16oLdW+znathlbLnljKfjlcGmy+c3/
	w9MUkeOM67GO8J6M5dEZQ5kZD2JzbQA1yw==
X-Google-Smtp-Source: ABdhPJyeiwWs7P5+Vq8OhyVL3pS7vkTJCZ23FQ3ZoKwckrwjUdTgkFqnXJ8j81JG9Xhlp5XuEKSm4A==
X-Received: by 2002:a17:902:c981:b029:eb:3b3c:541c with SMTP id g1-20020a170902c981b02900eb3b3c541cmr7919980plc.6.1618415295389;
        Wed, 14 Apr 2021 08:48:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id o3sm5358176pjm.30.2021.04.14.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 08:48:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] valgrind: Add glibc-src to ptest rdeps
Date: Wed, 14 Apr 2021 08:48:10 -0700
Message-Id: <20210414154810.2010487-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414154810.2010487-1-raj.khem@gmail.com>
References: <20210414154810.2010487-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gdbserver tests look for glibc sources ( rtld.c )
or else they are flagged as differences and tests marked as failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index eb7b9d2383..f3d08bc1c7 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -137,7 +137,7 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src"
-RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-src"
 
 # One of the tests contains a bogus interpreter path on purpose.
 # Skip file dependency check
-- 
2.31.1

