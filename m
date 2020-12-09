Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.1016.1607474153990839638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 16:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=olV7y9uD;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id o5so17127pgm.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 16:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8BALhiFRq3lWDSmymo8RfwK2JttbriKmYdZ4WMGVwY=;
        b=olV7y9uDqLSZ6GLbb09mirMrb661Mr33osVA5AKRLuDD+xD1bqjbr2QgqwiZ44H5FS
         Wyv12aBsZdosDZOeIjm+wN48lrdS1Bk8XebiukEOnZw/8hNkHvXvGP4E/hB9jhc8x919
         vZkIMzUU4SDeShI/iDQIHv8dap1LRn5TYGPjat6Lr21UXUJlcYaDiEGN/9V5HUy+jrLt
         suRTn6vrFt1JgEomvkv79pGEuJdt8id3yzsQD0N/WnzIwcD6PZqU6kevSLN+mRVi+l3O
         QkNt9LHHecF8QWElJ2BuFMTMSO97lVjG9F/m1rVTGX5Y1gr5em8T686nCFRPBfB61QAf
         +96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8BALhiFRq3lWDSmymo8RfwK2JttbriKmYdZ4WMGVwY=;
        b=pnNpKcCdME8tOy3HVPeGkhqcvOKQ/HJNQnwUmAX/z9c4p7oXQJ8X0bKVW3of3pU6DX
         5Y36yYgg0OTIfjq7giTTDvTygFzADXBecz7tN+DAdBaC4VoNh4SCpK+VjYQkwzUpaAL8
         rDn5xOoHiaCxG0e/Xosb0ARv+WAQjVz0G7VsmYTVqrGYcxuZ07aqMNfiPqavtVorjGqf
         MwP/xvD50wgG3krOdyy6+1fQNp9E/lvHZw7aLQn2j/ndKKTO0tj3IJi7Kg4g8qO+aIKM
         K5XC3bb/YDZpzTDBoNUOyptEz7HOyFKsPKBNm7CgDpqrDeTBRLL9jrbFop8HDCGCDyRr
         YL/g==
X-Gm-Message-State: AOAM5312F2Ufa0nuAYfTqHKZqtW7thckbYqEy4XKIbXvmMsrKmWto3Gc
	4+kz3pBktvV6oB3jaGQhIv9QbcAuWEsJ7g==
X-Google-Smtp-Source: ABdhPJwzjnK0N9E0g0+B+f8ZYqAGaUSyqaSQ2nB4caJDrz2vLCmDQ8Cu+mPVw22xuqh7cF2b9GpVhg==
X-Received: by 2002:a62:1749:0:b029:19d:960c:1bb8 with SMTP id 70-20020a6217490000b029019d960c1bb8mr439163pfx.63.1607474153326;
        Tue, 08 Dec 2020 16:35:53 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:183:c5f6:e3c0:185c])
        by smtp.gmail.com with ESMTPSA id v1sm58181pjs.16.2020.12.08.16.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 16:35:52 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 1/5] python3-hypothesis: upgrade 5.41.4 -> 5.41.5
Date: Tue,  8 Dec 2020 16:35:43 -0800
Message-Id: <5e4a312e7239b150ec32366cfd5f4f5f0d4b75b4.1607473952.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
References: <cover.1607473952.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Add missing RDEPENDS:
  - python3-attrs
  - python3-sortedcontainers

Upstream release notes:
"""
5.41.5 - 2020-12-05

This patch adds a performance optimisation to avoid saving redundant
seeds when using the .fuzz_one_input hook.
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...hon3-hypothesis_5.41.4.bb => python3-hypothesis_5.41.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.41.4.bb => python3-hypothesis_5.41.5.bb} (67%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.4.bb b/meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
similarity index 67%
rename from meta/recipes-devtools/python/python3-hypothesis_5.41.4.bb
rename to meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
index 416acc8d72f..7ad975b62a3 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_5.41.4.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.41.5.bb
@@ -7,8 +7,8 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7ef22dd2ae4a906ef1e237dcd6806aa7f97e30c37f924a0e6d595f4639350b53"
+SRC_URI[sha256sum] = "a74e127a865fde12b853cc00f5f52a3a1601d2a1c311b3ffc8de92a4c06778f7"
 
-RDEPENDS_${PN} += "python3-core"
+RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

