Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.16131.1605653672705999730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eMoiibxL;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id q34so816498pgb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yzjsK62DbigIfFpUNTZzXHwOmDfsPkVUNcusHs4/bCI=;
        b=eMoiibxL7KjtoDZjkQuQnMQWjqrzqb3AWwbiSz5SmS3Xug2kKsV45cmPKUxdSAblOV
         HUmIfJQBIh3bN+3SyGITGx+3sy99Lq9l100gH+sLh5GXgCtlB4FUzSvESAUGgJIt/HI2
         Q0EZXtqagxhsz+uQRUrcWisdFTG+BT1Gojd1nR/7BltQwJbcVDOLcItVfu4FCJBekwbX
         gge781+33PQL3l+iTyvOwzqjju7oOh/fjI+4udJWQjwlJV7ivSPPIMSkPuZ5CgNRQ/Sj
         jFdsNh5ivcrXb0uBKqY3x1G6GyaNZMeAEY5Pv1J8IylOFp5zb5wvj/tMss+nCZ2CPOKQ
         WIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yzjsK62DbigIfFpUNTZzXHwOmDfsPkVUNcusHs4/bCI=;
        b=Va4RBWzgua9tPMWH/233XAmfp/lQe7+jzFKNGJDdP940LG/e6tO/pwiaRT1LPH5eQj
         Me+c0AvNvXUZGB9el9C320VC8k5nJDCkLbE3pOiJyL0Yrco6Ve1LjuMB3Ku6H+BCBKUz
         5nQ6AuP7TQ+RUnXQwW58jY2PxH4tQ0Mrs9ftd+iDv0WAyrIlpZhCpAH8VCKTpo8D82h+
         gZgeA+qM3lgA2mdYqCoteIoXzBpmWqLmGa5g66ZNOQompS9tq0h4961W/GIpKVwvKpT5
         TyqVl2r1uv6x22TtVHg2ulXabvSKlNoJbSo7Gpi/9la0Z+W9ntNkdHXIUzsv2rzWM/cO
         +wow==
X-Gm-Message-State: AOAM5307fSUWwCnm7WuMUGoZBPt9VYgXlAjYz7GGrBQGTH646B44y4Ea
	dqpwQ9Ysjhze/PCACB8W3sveAy5G8qQ23A==
X-Google-Smtp-Source: ABdhPJxVHALA/felWSHAGf5+fCLt2yYEpGIwGMTapuYTGEjaZtFnTKa1UZ0l2naHOCmYLlxDNjnIbA==
X-Received: by 2002:a62:3385:0:b029:196:79f9:6ac8 with SMTP id z127-20020a6233850000b029019679f96ac8mr1550691pfz.6.1605653672013;
        Tue, 17 Nov 2020 14:54:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id w127sm22349579pfc.172.2020.11.17.14.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 14:54:31 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] python3-hypothesis: Add recipe
Date: Tue, 17 Nov 2020 14:54:26 -0800
Message-Id: <20201117225428.877691-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117225428.877691-1-raj.khem@gmail.com>
References: <20201117225428.877691-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its used in many python packages for testing eg. numpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-hypothesis_5.41.2.bb              | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb b/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb
new file mode 100644
index 0000000000..a2bf2af33f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A library for property-based testing"
+HOMEPAGE = "https://github.com/HypothesisWorks/hypothesis/tree/master/hypothesis-python"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4ee62c16ebd0f4f99d906f36b7de8c3c"
+
+PYPI_PACKAGE = "hypothesis"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "f8c281355aaba1da696e40f1488c2bb47c42660424f5750daea45a85e2d047b3"
+
+RDEPENDS_${PN} += "python3-core"
-- 
2.29.2

