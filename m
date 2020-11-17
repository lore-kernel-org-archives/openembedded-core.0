Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.16129.1605653671853973560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hwiW+0p7;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 62so17002755pgg.12
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZuofQhLAoA40G38bBPSYiXgqEBvYlkk8iV5vp7cF6E=;
        b=hwiW+0p7h3CI8Qo/x2oIRzBk82L3zb/Ql1Vti8bWR36HHNfrXJF7JhNrldOhbfDkBC
         a+HZLTWV1rzy7OX7kzdjF4g5QraJClNKkGV4JyoXdu88h/6G6qnlqRqLkyqZimWcI78h
         T5G1hnheZ4xhcmc6ig27/DqG7RQG87SYjN9VYRcsaWtTlfe/RLTcrKGR5BW5BVUOIqCo
         34LnIp185xk8t+UC+QhfN9EiFrFAPLAKr4OQUemQiOpRVnTpPG21mqxFQnPGwkGmzgn9
         +PLZKg+/1K6DH/tZ31YpqDlUIg5oqwcjNQF8TrhcmIXlvPYg3wNGqNocI7/hLrGfIOim
         W+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kZuofQhLAoA40G38bBPSYiXgqEBvYlkk8iV5vp7cF6E=;
        b=M8/lWH9MW4Hxr8gJYhIyKnzPmAO0B4JcoG0FuNjphtxC+6REsrVkUpcFKITQOtTvcH
         dbk7zSJizjBAOelJU51pTbaJZ2eQUeE/ebE36KLJMzSg0t2wGoMcngU0GmOOzGdSSDX/
         nmdp8emZBNd9JDZNIkuSaYb/VemBLSWQx9TDIpeA5gdMG8EK4OoZbwlSC2/9TNVBHAwH
         wgt3rTusNrHTW7Y2snimh/GgN4oN6vJqH8uaVjukhEuJJqx8w+59VELXfJq+gJqxBCmA
         5yUhNpmQ9vNyjV+WoCyiqB2U7pkFrLnOpxx2ukjQKAJYUIiCI5EzRBuAAfuor2Ntu5Ih
         U3Hw==
X-Gm-Message-State: AOAM530O0htvncG9/OrUr6WAmQQyJ28ZTYNxvXLTikbL49b6em1DRzYU
	SXrUSbwMegfZIgLd5fmlRn/HT83IrMiBsQ==
X-Google-Smtp-Source: ABdhPJwCjvMzie+4Em5bVkFGHySW6gOFLe7uuX5DckhRkX9QfiSnFNaTrcbM4TelrZ/nvrn6dstjGw==
X-Received: by 2002:a62:7c95:0:b029:18c:5002:a1ab with SMTP id x143-20020a627c950000b029018c5002a1abmr1596470pfc.40.1605653671011;
        Tue, 17 Nov 2020 14:54:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id w127sm22349579pfc.172.2020.11.17.14.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 14:54:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] python3-numpy: Upgrade to 1.19.4
Date: Tue, 17 Nov 2020 14:54:25 -0800
Message-Id: <20201117225428.877691-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify inc file into single recipe, py2 is gone

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb  | 3 ---
 .../{python-numpy.inc => python3-numpy_1.19.4.bb}           | 6 ++++--
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
 rename meta/recipes-devtools/python-numpy/{python-numpy.inc => python3-numpy_1.19.4.bb} (94%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
deleted file mode 100644
index d388e88d25..0000000000
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.3.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-inherit setuptools3
-require python-numpy.inc
-
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
similarity index 94%
rename from meta/recipes-devtools/python-numpy/python-numpy.inc
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
index 40f81046ee..7ff057b781 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
@@ -8,14 +8,16 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
-           "
-SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
+"
+SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"  
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
 DEPENDS += "python3-cython-native"
 
+inherit setuptools3
+
 S = "${WORKDIR}/numpy-${PV}"
 
 CLEANBROKEN = "1"
-- 
2.29.2

