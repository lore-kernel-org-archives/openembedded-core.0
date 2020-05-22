Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.19273.1590172944256208559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 11:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B0hTR0QK;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id a5so5294612pjh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yYZ1dRMVwPqnRFAgv0lQ2rIXRkubCzD1C445PtVt86s=;
        b=B0hTR0QKvFWv2FbQ2o9D4rAjl3ubgThWIFNFoBn2uVE2HPVxa9JKv40/lNezgORT2a
         gefu2FQwEbPG+G8cK1QKG7/Gkeh+qBSxdyF5kct2nX5dGt8/7fSLD5pwKolINyjg0sG8
         KbiHL9dJzbBQlNgwqY4lqjTBpWuZ7CjjO3B3QVFdr88n0X0VPaGERmgneghLJaMWfJJX
         2WV2G1kKohTLfuePnEhWbZje2PHRxY5nZWcAfD8y9qzxXqChcq7nQI71MPpIEeWvw8a3
         OrH+RwScM0hd9JB3aRyDYKOlclbSF++qUBmTOsN2/yXET40OKIV6NJQ9DM/+1fUR9Br5
         H9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yYZ1dRMVwPqnRFAgv0lQ2rIXRkubCzD1C445PtVt86s=;
        b=iCcBUPs5huvcNPA8zl9+sWB3GV6gsd46OtlW2wtTEnuW6Zl/U5lj54D/BUJDJrO+Al
         DMSj3yVsc8bOMBgQ8Cdbv0D4rCSdRkogOJ/5ZGY252MpMDM8nk0JWFiBrbzQ9CqappJK
         waNoiQ5v0zm55hWrK6sL0gmMQ5sfcaZODtTaIFjXbZjVW4F8AStYeI6KNMVBzH70V9mg
         c+eNWkBDxw6ElgazsdmSyJC2gUUK+QzDbjydgA0Y2Q86oDrZUH35bHRahQXsVgHnV4ti
         Ibs/4ZE6KKVNxjWUqRoMpkTTJpT2Wnxy+A2fZC+d8R6D8K0aj7s1pp3iEuRh9JmSVJmJ
         wXKg==
X-Gm-Message-State: AOAM5336JLOp4XT2/5jjpXBQoxnv2EUtlcP682T4x+p1NNkHtH9EviEq
	2uca9WCI74XvkS1deYjzLMLcA6fnnkc=
X-Google-Smtp-Source: ABdhPJz+EhX2eYgH985xuMsu9XSHjNq2F94DeXzpGuu1kvTd90kWS+tsgd23hdVPf7ZoBToj03jrGg==
X-Received: by 2002:a17:902:d913:: with SMTP id c19mr15284498plz.229.1590172943374;
        Fri, 22 May 2020 11:42:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id q5sm7491981pfl.199.2020.05.22.11.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 11:42:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go-1.14: Update to 1.14.3 minor release
Date: Fri, 22 May 2020 11:42:20 -0700
Message-Id: <20200522184220.4093683-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index c52593db6b..d729b65267 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".1"
+GO_MINOR = ".3"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -18,5 +18,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-
-SRC_URI[main.sha256sum] = "2ad2572115b0d1b4cb4c138e6b3a31cee6294cb48af75ee86bec3dca04507676"
+SRC_URI[main.sha256sum] = "93023778d4d1797b7bc6a53e86c3a9b150c923953225f8a48a2d5fabc971af56"
-- 
2.26.2

