Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.9600.1629636706524627076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=laRQKv92;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id z9so21724976wrh.10
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OSA6Z4XfawJ2GMEL32GWl1JMTVJQ/BoZNEdZu41AhA=;
        b=laRQKv92r1hSgYi+JPNGFwtxTD0BvJECIGkYHpMX59VU3JFyjwbSIrVjcPO02ANq1L
         gp2FpKM/XZzWI2yTxoGiDAOiSbKlIq11718wRsICJmdduLPcdnHT9LdrXr8tvPYX25nX
         FKa9MEuNPS7KsBPVQhyv4NwXCavXIQ5iWLoxcwND9vrp4vG9GfcmwQcpnxS7usibs2eo
         tf/5DuWweI/TmVG60T1IOK3b93s+mHaIGRGLjwPXmENv0eMtyRU/EH2bPReIajY60eSd
         RaEfDH92zqKN2rvMB9mlppfb8fOGT3vgim/NhQjY0Bzo/BQUIZWBSPfqyrlhScW6sL3Y
         sXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OSA6Z4XfawJ2GMEL32GWl1JMTVJQ/BoZNEdZu41AhA=;
        b=OnAkmmGeefx373yjYWOwRCBV9xyyydgR3KjAYAagFPKwT9RetO3RYxz+8dmnVk0nZv
         g4NT2v8ooWDCDpCRsZjcu5UCCvaBzK25OSO5GneZe/O7/hQmm9/NZAhXi27P81df2mBL
         FJ6dLoRVVfNRRiYg/XXHHlitLQdDD3u70nU8Wf6eJIFaBQQhwDtZOaUS2Q3PE9b2RtES
         8Sg2tGWNyuCBWxxcycTebQRLY3R+9pacCqfjxQq80XGg8zbvf+RUGWRSqaK3leHgvZH0
         kNkFYw15+HYLxPSetz4vGCmYcEbPrzU0S92WPelalO23k3fYJnxJ0oCjuwGdDcJcHm9t
         RhbA==
X-Gm-Message-State: AOAM532bAWUDK/aSsCCETxJAEMJb13q7caUCTPkJn+2AcUoM8+ZrOChq
	y/rRr2bzMsCxPmbiXLiVa/KIuFpFMOfwjg==
X-Google-Smtp-Source: ABdhPJyNkFBwXxkUQ894PnNVzZWQuY4M6h13FXOBdAKiC4FCAMK8mkJKQ2r+HHlVCadfvZh2LI/zHQ==
X-Received: by 2002:a5d:5305:: with SMTP id e5mr8655956wrv.243.1629636705201;
        Sun, 22 Aug 2021 05:51:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 50/55] boost: upgrade 1.76.0 -> 1.77.0
Date: Sun, 22 Aug 2021 14:50:58 +0200
Message-Id: <20210822125103.310416-50-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{boost-1.76.0.inc => boost-1.77.0.inc}    |  2 +-
 ...xes-wrong-type-for-mutex-in-regex-v5.patch | 54 -------------------
 .../{boost_1.76.0.bb => boost_1.77.0.bb}      |  4 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 rename meta/recipes-support/boost/{boost-1.76.0.inc => boost-1.77.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch
 rename meta/recipes-support/boost/{boost_1.76.0.bb => boost_1.77.0.bb} (72%)

diff --git a/meta/recipes-support/boost/boost-1.76.0.inc b/meta/recipes-support/boost/boost-1.77.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.76.0.inc
rename to meta/recipes-support/boost/boost-1.77.0.inc
index c02f38b047..6df06e76c7 100644
--- a/meta/recipes-support/boost/boost-1.76.0.inc
+++ b/meta/recipes-support/boost/boost-1.77.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "f0397ba6e982c4450f27bf32a2a83292aba035b827a5623a14636ea583318c41"
+SRC_URI[sha256sum] = "fc9f85fc030e233142908241af7a846e60630aa7388de9a5fafb1f3a26840854"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch b/meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch
deleted file mode 100644
index a8305ff2e0..0000000000
--- a/meta/recipes-support/boost/boost/0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 6064875bff2e52ba63f01911eb4deb79259c5e3b Mon Sep 17 00:00:00 2001
-From: Carlos Miguel Ferreira <carlosmf.pt@gmail.com>
-Date: Thu, 3 Jun 2021 23:10:37 +0100
-Subject: [PATCH] Fixes wrong type for mutex in regex v5
-
-With the Boost.Regex to ehader-only library, the declaration
-of a mutex that should have been changed from boost::static_mutex
-to std::mutex was left behind. This was preventing regex from
-being built for older arm platforms [1]
-
-[1]: https://github.com/openwrt/packages/issues/15725
-
-Upstream-Status: Submitted [https://github.com/boostorg/regex/pull/132]
-
-Signed-off-by: Carlos Miguel Ferreira <carlosmf.pt@gmail.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- boost/regex/v5/mem_block_cache.hpp | 12 ++++--------
- 1 file changed, 4 insertions(+), 8 deletions(-)
-
-diff --git a/boost/regex/v5/mem_block_cache.hpp b/boost/regex/v5/mem_block_cache.hpp
-index 0af4eae1..eb3ec776 100644
---- a/boost/regex/v5/mem_block_cache.hpp
-+++ b/boost/regex/v5/mem_block_cache.hpp
-@@ -85,10 +85,10 @@ struct mem_block_node
- struct mem_block_cache
- {
-    // this member has to be statically initialsed:
--   mem_block_node* next;
--   unsigned cached_blocks;
-+   mem_block_node* next { nullptr };
-+   unsigned cached_blocks { 0 };
- #ifdef BOOST_HAS_THREADS
--   boost::static_mutex mut;
-+   std::mutex mut;
- #endif
- 
-    ~mem_block_cache()
-@@ -133,11 +133,7 @@ struct mem_block_cache
-    }
-    static mem_block_cache& instance()
-    {
--#ifdef BOOST_HAS_THREADS
--      static mem_block_cache block_cache = { 0, 0, BOOST_STATIC_MUTEX_INIT, };
--#else
--      static mem_block_cache block_cache = { 0, 0, };
--#endif
-+      static mem_block_cache block_cache;
-       return block_cache;
-    }
- };
--- 
-2.29.2
-
diff --git a/meta/recipes-support/boost/boost_1.76.0.bb b/meta/recipes-support/boost/boost_1.77.0.bb
similarity index 72%
rename from meta/recipes-support/boost/boost_1.76.0.bb
rename to meta/recipes-support/boost/boost_1.77.0.bb
index ae91b1c875..df8e08ad76 100644
--- a/meta/recipes-support/boost/boost_1.76.0.bb
+++ b/meta/recipes-support/boost/boost_1.77.0.bb
@@ -1,11 +1,9 @@
 require boost-${PV}.inc
 require boost.inc
 
-SRC_URI += " \
-           file://boost-CVE-2012-2677.patch \
+SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
-           file://0001-Fixes-wrong-type-for-mutex-in-regex-v5.patch \
            "
-- 
2.31.1

