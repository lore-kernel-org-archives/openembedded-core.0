Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.16619.1591198494715087757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 08:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y8cPmNM5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id n23so1962812pgb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 08:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CYybDt3vegAy48ffO1DE5ndcf3YPjgG9FdADYo+4iyo=;
        b=Y8cPmNM5AIULZMn267WtGlVjfe67GTxV5gsau+tkWdZumRHp4OSjUbxADJya22eNwO
         nk9u0aGderdWqhFpYZPUFPKAxdSVWqOKekFnu8cqWk1jymzsYbxY0w88+bXmC+j50VCv
         4xMDcIdwziT0/2qmIzdeBcjNcBiWYqmWy/X+MoQV2yumS1iVNQNL1KKaHeHqkBklWir/
         9O/hVVGJ9tBgLZ0Z8QmxClG7j1KhwxH4OqcwsPykAiXabRza0JyqxsKgYoaqJy7qu5/C
         vQwRgp3qX/gK+vxmCmSuq+INgVklloxvG3v1AvMV5P/+5E4aEH/9QqdDPWFYzVcDreJW
         6sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CYybDt3vegAy48ffO1DE5ndcf3YPjgG9FdADYo+4iyo=;
        b=joHyrqgDtaBCYoPkHTjiKiQG6oPWVX7rr1Gj+4toJ/BV7zRBrSnBPtDqrblsJS9Wo7
         eKY43YSiCbJchOpqStivDTik8PAzoO6eQKZR1JP2hWNp2fE9+sw11nSvePo+NCig2Hlp
         r/POhdS6yTJP/Y19LBMB97exfJuU7/T7aheXILyGukzNiwlL1hI55ayOLmJyS6QCBB7b
         wNA/U6Ap6f7OWSnUlSlRB/HVRK0BSKALwGmCJJHbXosAhOwAz7puh44TtdFrYRCHZoEj
         DoKNFIzXhqdC6/U8BYWfM6trHdRObW5Ue/5x6I3sXLj+0PZ3UX8GKbPGCrcfE9NdatOx
         7dMQ==
X-Gm-Message-State: AOAM5339bSr41aLtTZmO8Tz2nDoE+9o+tgPGg1SNRwrdDy774Zji/X37
	Cz3rs2ZdKjanvKtUfMi1nQNKHWm3PZo=
X-Google-Smtp-Source: ABdhPJyBJxb/tne7hiyfZhuyg+DqMyQB407CmA5T2K9ZO1DM7bQ9ZP9qF70LwgI2ZECIltN+SJYieA==
X-Received: by 2002:a62:6487:: with SMTP id y129mr32806213pfb.198.1591198493703;
        Wed, 03 Jun 2020 08:34:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id np5sm3187660pjb.43.2020.06.03.08.34.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 08:34:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/5] python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
Date: Wed,  3 Jun 2020 05:34:00 -1000
Message-Id: <03b27d56272a4815ead04da08cfaa738b450ae59.1591197295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591197295.git.steve@sakoman.com>
References: <cover.1591197295.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Also splits apart the SRC_URI checksums to make automatic upgrades
easier

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae1f210546396b761ea86d9e32bf90c0867ff845)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

