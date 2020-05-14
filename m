Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.1068.1589490316367459988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O9h/aeF6;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id d7so305986ioq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=caSjj17YGHRZJMR0l2wKwda/iNBUBOuLg+WZtu+D/ls=;
        b=O9h/aeF63u7Nk6CFt8J+r3/kPuyYSp+D/OTQB4hqN92RWZbvAm+7eg4wzR+FHguI4z
         344vmZfl/+AJLnmCvv5Cze+zQexYbqAcgivKDOrUF/r4xEK6+hv+YnkvIMKXd/PkNuMx
         7vyXLSxITz+ObvVBr60yRcRGKoSY13QkdzlXALiy7iNjfakxiwe2V7ib4IUhpxBC/cdF
         KJ9oYt4DroXBxOHhJe8ZLSkGbgC35GjbGSR7k6FTChIMf6GBThSJ7/6+ig3D82QH1P4z
         M9njUUiaJd1dMwY/sp5vzqpJAdJKNFtKEGw6pt51CayNP2qxQ3NUwfRIz4m+sFwViOsG
         2mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=caSjj17YGHRZJMR0l2wKwda/iNBUBOuLg+WZtu+D/ls=;
        b=lTbl71iPWO0GPnuS0j1ABJ66RGYyVo7TjT2MWvkNIFenA8ixBw7W+tzJplt2f2J/TD
         ZwlllVAy2xU3w+wmOzDEXS3Q4csLqYQj2g+mk9G0sR4xoNZY8efTCTM4BnP0FLbXsBBI
         CduBOgAhA4RtSfHMOGLk1+Vz4n80ib9Izv3lrHqr4lAbUxLl9sRLc/Sz9u9KzRpgIBmI
         8e1ldMYfjfFYqocnAqg1lzxCWdvCV91XEF6kTvyQgO0ShT0ivuI5NV5FNU7h1JBIhecd
         ydWnHqt7YEMf1KBk1MAhOsgzchmoOwH5lqInzhbTqh6ph+SjDetV/Vzy/RPPQzO5O1v/
         wJow==
X-Gm-Message-State: AOAM532ecSY6xrpsgdtL3jjRzMpo3BaclMFcAWb6xMgQJeKw4vDhcMJx
	dvJlUAnPWbS1SfS3b71KR7RYlpJ8x34=
X-Google-Smtp-Source: ABdhPJza+zVxzNHVk1vvXcoo1q2W7gdnOESQ5U/cu37eYfYxIgBcz6wwcIQya8j7GBUOjkQwmHczwA==
X-Received: by 2002:a02:a1c8:: with SMTP id o8mr197596jah.38.1589490315620;
        Thu, 14 May 2020 14:05:15 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:1041:f567:5747:59e9])
        by smtp.gmail.com with ESMTPSA id t20sm52356iob.27.2020.05.14.14.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 14:05:15 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jdmason@kudzu.us,
	denis@denix.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 3/4] python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
Date: Thu, 14 May 2020 16:04:57 -0500
Message-Id: <20200514210458.33543-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514210458.33543-1-JPEWhacker@gmail.com>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>

Also splits apart the SRC_URI checksums to make automatic upgrades
easier

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python-pycryptodome.inc         | 3 ---
 meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb   | 2 --
 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb   | 5 +++++
 ...pycryptodomex_3.9.4.bb => python3-pycryptodomex_3.9.7.bb} | 3 +--
 4 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.9.4.bb => python3-pycryptodomex_3.9.7.bb} (58%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 63b4a4abb4..68b084eb04 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -5,9 +5,6 @@ HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
 
-SRC_URI[md5sum] = "f990716b49add7b14ea8b8a961fb3746"
-SRC_URI[sha256sum] = "a168e73879619b467072509a223282a02c8047d932a48b74fbd498f27224aa04"
-
 inherit pypi
 
 RDEPENDS_${PN} += " \
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
deleted file mode 100644
index 0c062dddf8..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.9.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
new file mode 100644
index 0000000000..8f19984bed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "f1add21b6d179179b3c177c33d18a2186a09cc0d3af41ff5ed3f377360b869f2"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
similarity index 58%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
index e41c14b142..abb03b9909 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.4.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
@@ -1,8 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[md5sum] = "46ba513d95b6e323734074d960a7d57b"
-SRC_URI[sha256sum] = "22d970cee5c096b9123415e183ae03702b2cd4d3ba3f0ced25c4e1aba3967167"
+SRC_URI[sha256sum] = "50163324834edd0c9ce3e4512ded3e221c969086e10fdd5d3fdcaadac5e24a78"
 
 FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.17.1

