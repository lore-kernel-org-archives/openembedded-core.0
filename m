Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web08.1039.1607474164643533458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 16:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+6WgCe3;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id g18so53558pgk.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 16:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6eEfbNv1DTIhBXH6ZcIohOV7qbfXjpQ0lU/HuLSF6+4=;
        b=c+6WgCe3fj23SuRj7tUC4mHPTgawTQm/6dtQXBH7JtAvnzN2vzSbfULfBbOdtZYmLe
         37Q6FdwuhBlF6M3vNjaPmUfSG3kkF8vf/bwHNtS4PqocaqJUFgdM+58THdedAFhF5dmo
         /UqEPuJeZ0J82+ksz/L5L0qiBmKGEnuDtDiY3J23kRw4ivTXy6wIXcMvtRJ3J4aiafGI
         jN/yavHtMRlc4d6clCy2+uO3Qm186ppVbRGYywmiNeGdHGStGVMs2UFAAASv9mdTVqZ/
         aZ0oOt2ikXRHqy3KV1ePthadrpNU8O8vZmVLmky7v3J06XOm/HIYb8cNa/DUDCqvgHf7
         SHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6eEfbNv1DTIhBXH6ZcIohOV7qbfXjpQ0lU/HuLSF6+4=;
        b=hfH92FsFtv9h8y/4Np2Nz8jvQIrfpFWabqumbXxohAVD2I05LNvR5Kh7PJ8QRqD9zQ
         xeKxjNd7Kgb43Ymu8mkg9Ez2WvCMDC65O7FCj/7wxKwuUwi0Rk1y4xcehRR3rfxAIdKE
         TxPsszQNXgVBhJ4tEeEXqMxSBBVJqIffQoXpK4trhKheG8/D+kop8ozIO+pJPNQITaCG
         g3yQK91ayu8snD/uR/1O8wu8hKJ3o0WbfIGbQ7FxXNTRf4If5U7ROpbPCu9dRcV+gvn6
         YTKQZGgjyFEp9hzBFTmur2s+rQFHLK0qqZYX1qyBb933QU7nc0P3OyC2CBM4RbV/MJLq
         s/YA==
X-Gm-Message-State: AOAM532EAlpzRkFBHd1ZHz/ewF28hHmEkEwA1B3OF8d2mybrYSjOEEh4
	4B/vtA52AJkQU7V9kNY3aQ4t5yA0YoHKcg==
X-Google-Smtp-Source: ABdhPJzp8ZtALiP8Rxu/2nROrz2EBwGgnk3890IBnIcR16sz3pycGT6VzSMnxaKscw7YeqNzqlyJoQ==
X-Received: by 2002:a62:1409:0:b029:19e:14d1:efb0 with SMTP id 9-20020a6214090000b029019e14d1efb0mr48143pfu.14.1607474164005;
        Tue, 08 Dec 2020 16:36:04 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:183:c5f6:e3c0:185c])
        by smtp.gmail.com with ESMTPSA id v1sm58181pjs.16.2020.12.08.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:36:03 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 3/5] python3-pygments: upgrade v2.7.2 -> v2.7.3
Date: Tue,  8 Dec 2020 16:35:45 -0800
Message-Id: <727588d22d05bc6f95b5fb7409c69ff55432d1ed.1607473952.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
References: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream release notes:
"""
 * Updated lexers:
   - Ada (#1581)
   - HTML (#1615, #1614)
   - Java (#1594, #1586)
   - JavaScript (#1605, #1589, #1588)
   - JSON (#1569 -- this is a complete rewrite)
   - Lean (#1601)
   - LLVM (#1612)
   - Mason (#1592)
   - MySQL (#1555, #1551)
   - Rust (#1608)
   - Turtle (#1590, #1553)

 * Deprecated JsonBareObjectLexer, which is now identical to JsonLexer
   (#1600)
 * The ImgFormatter now calculates the exact character width, which
   fixes some issues with overlapping text (#1213, #1611)
 * Documentation fixes (#1609, #1599, #1598)
 * Fixed duplicated Juttle language alias (#1604, #1606)
 * Added support for Kotlin scripts (#1587)
 * Removed CSS rule which forced margin to 0
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{python3-pygments_2.7.2.bb => python3-pygments_2.7.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.2.bb => python3-pygments_2.7.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.7.2.bb b/meta/recipes-devtools/python/python3-pygments_2.7.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.7.2.bb
rename to meta/recipes-devtools/python/python3-pygments_2.7.3.bb
index 00e5dc6e301..379d85dbd7c 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.7.2.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.7.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1f5d0c4cf38dfc8122c00d6f1a97a0cc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "381985fcc551eb9d37c52088a32914e00517e57f4a21609f48141ba08e193fa0"
+SRC_URI[sha256sum] = "ccf3acacf3782cbed4a989426012f1c535c9a90d3a7fc3f16d231b9372d2b716"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.25.0

