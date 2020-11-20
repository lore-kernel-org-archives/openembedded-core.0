Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.598.1605893268522408762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cn1B4j6o;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id y7so8483031pfq.11
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67ukrktebSLodjsYZNQKijmgx+mwHkjafFSS6oSlFFQ=;
        b=Cn1B4j6oryI/2d5uTDjZnPt1LpimkRQZfUBgXt7UCHf51K0PTeE/38yagOd8KVOyBg
         PUsEGoq7SRZLxPo9I+dZi1PWKO7H/bgPoi3P4zAV5GqKL+0GSkr4m2uJw0XEn3z1MEHY
         yawZf6+DYg1f1KF0t1lVMYD/1DSaEWPzaifg32pGXDOsYd50GV55b0WJeldtPaxfW7i4
         fe+glXAgNbmaUIUVQl0WqEVJrSV5aM3YdO9rq4UslOXwqFPboUQXGOJ9XQWRieeF05TV
         U+SjlhIDLdoDwjC0fiCN/QOkSUP07miLI76QRn+Sb7QFAqziVGY+3S1J5H4+xNGzH4b+
         zULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67ukrktebSLodjsYZNQKijmgx+mwHkjafFSS6oSlFFQ=;
        b=EXO3JCn7nwJf55SUG/5QH93VfKD9e+DE6hvgqocSSJ9EklLFMl2l9dvSzkWmhSD/OG
         /uQsSoBvsWja1veBakcpkGrtRslnMFGaCroKY3qiYQ1gmIsj1c4k2d6g9Z+nYBtpLG5h
         DmI3rtE7Xkw0e4qjTBxDuevTMEqdhvhNVte9bAdgMZdq3XNrMVryMS/Wa6Mi4RjhFWip
         AsPxGQbdaxSCkcvjOyz2F3lnw/Yplmw5tkOSgw7XePjXwkrzVjbtWJx57UYBDeasrkpg
         rdkTV4djiA+XOOWzkORxQQ2JjMAfe+ZZTiwFwKK78pAjuE01PQQqPVKEsEwMUHW14N0X
         bcPA==
X-Gm-Message-State: AOAM530aIqYMZ0+P7eWQCLDenaOt67nH6VhQ73AdPBsBXgdNIDutoQCl
	Xj8hlD+4dY/nT0JBDh3Emj9PMTjq1q7t3A==
X-Google-Smtp-Source: ABdhPJwUHBDlPMrhN8VYSy3L0XxxAmg7vGtlE4l0MU/g1r6ly2p012gpGT9KnphKEKh2okEpQLkp1A==
X-Received: by 2002:a62:cec5:0:b029:197:baa5:f13f with SMTP id y188-20020a62cec50000b0290197baa5f13fmr7554772pfg.40.1605893267501;
        Fri, 20 Nov 2020 09:27:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:46 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/7] python3-hypothesis: Add recipe
Date: Fri, 20 Nov 2020 09:27:37 -0800
Message-Id: <20201120172742.1594854-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172742.1594854-1-raj.khem@gmail.com>
References: <20201120172742.1594854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its used in many python packages for testing eg. numpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-hypothesis_5.41.2.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb b/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb
new file mode 100644
index 0000000000..d6b85089d2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.41.2.bb
@@ -0,0 +1,14 @@
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
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

