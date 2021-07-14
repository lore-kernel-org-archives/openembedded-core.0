Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.6053.1626265582307624704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hmf3MQ7+;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso1290954wmj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sdhmS/jRuM0wtct5y1HCnKQcv2UBgIvuq8K0747MPYw=;
        b=Hmf3MQ7+l/RSJFt6+PUfQB+AbNJK8NyqIC6TcaEieHMbpOGxDiekVF/iWLqkwhbwBF
         vU0IP9m6knV1sdwaHWFX6R1Wscz38TVhk2ePdxnjtMmlAyTBb3sfjkNKiZcfk5MDMMOO
         JdHcMq2j5c3dZ9vrp7FaDoqlnpFOuNwNVoFBVy8KVSONTg6CJRO9A6LKcpNW23RAPS07
         M3ucC8EE7NbwpYNtS8jhYPqlEA3wyHNsOGSlrUppb8hla12w3WYrKAxQEkp4BA3fpqWJ
         bs1o25YOhnytCnSOaB9Ldd8a9NwG4ugNZ/q4/nnSQvnPAIDBAz3fGB9LjR2SjyfPbjWA
         xWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sdhmS/jRuM0wtct5y1HCnKQcv2UBgIvuq8K0747MPYw=;
        b=tw/mqOLDY1uIFd6oBWXBYQOgM1OA1E5xyc3w3XgEMLMXBNvGhfrPH9cnATk+mLfKj2
         9uHdF5kFqc9s29DfUIBTiDFE9fhjcojUVPaers1zuwyMt0gABHCyennCW0KumZF2E+x4
         S3mS4e+t84PGJwPrg8MNEo3WWfBCjZG9RsJrGNCBYueZ+PLPP3SBGUSyFfGlF7sk3C7j
         pHFNUY2XgOd1iETHq8FalShC1UCt8As0HrUfw2KdEZAxoScjFqwTxBeyTO5qBPXhMTWA
         qLsSJ4e59qnUrSU2aiuIlwwNVruSkoGCk6KfqoFcpg25458X5l5xwNMir3hcjzz3gwTr
         K4Sw==
X-Gm-Message-State: AOAM533Y2D6ImT+proH5Nj8DTTXDWK08mY7e0Ct3GQYgQ7j/i4P8kfgV
	6JNZWxME7Xfdx8bkOwu6PS+pkOmKauM=
X-Google-Smtp-Source: ABdhPJwI5M1zFRZUSgyXsKRyOgMIv+iaOxSf5BE0+jb6ri5R6UK+TWwlGou1FAE/ukcboElp3qloFw==
X-Received: by 2002:a1c:2584:: with SMTP id l126mr3689791wml.83.1626265580775;
        Wed, 14 Jul 2021 05:26:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/21] harfbuzz: upgrade 2.8.1 -> 2.8.2
Date: Wed, 14 Jul 2021 14:25:57 +0200
Message-Id: <20210714122606.605142-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ariable-supp_size-from-plan_subset_e.patch | 44 -------------------
 .../{harfbuzz_2.8.1.bb => harfbuzz_2.8.2.bb}  | 11 +++--
 2 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.8.1.bb => harfbuzz_2.8.2.bb} (84%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch
deleted file mode 100644
index c1d4df42a9..0000000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f96b2b653c605679b83a820b38f49a0a0f4baf42 Mon Sep 17 00:00:00 2001
-From: Andi-Bogdan Postelnicu <abpostelnicu@me.com>
-Date: Wed, 2 Jun 2021 14:08:11 +0300
-Subject: [PATCH] Removed unused variable `supp_size` from
- plan_subset_encoding(...).
-
-Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/243d056ff1c2af583ceb67e5dfbfaac51dc96e63]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/hb-subset-cff1.cc | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/src/hb-subset-cff1.cc b/src/hb-subset-cff1.cc
-index df322f8..35dae7b 100644
---- a/src/hb-subset-cff1.cc
-+++ b/src/hb-subset-cff1.cc
-@@ -402,7 +402,7 @@ struct cff_subset_plan {
-   void plan_subset_encoding (const OT::cff1::accelerator_subset_t &acc, hb_subset_plan_t *plan)
-   {
-     const Encoding *encoding = acc.encoding;
--    unsigned int  size0, size1, supp_size;
-+    unsigned int  size0, size1;
-     hb_codepoint_t  code, last_code = CFF_UNDEF_CODE;
-     hb_vector_t<hb_codepoint_t> supp_codes;
- 
-@@ -412,7 +412,6 @@ struct cff_subset_plan {
-       return;
-     }
- 
--    supp_size = 0;
-     supp_codes.init ();
- 
-     subset_enc_num_codes = plan->num_output_glyphs () - 1;
-@@ -448,7 +447,6 @@ struct cff_subset_plan {
- 	  code_pair_t pair = { supp_codes[i], sid };
- 	  subset_enc_supp_codes.push (pair);
- 	}
--	supp_size += SuppEncoding::static_size * supp_codes.length;
-       }
-     }
-     supp_codes.fini ();
--- 
-2.31.1
-
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb
similarity index 84%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb
index 1a0e651f6e..6da76ad0a3 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.2.bb
@@ -4,16 +4,15 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f787620b7d3866d9552fd1924c07572 \
-                    file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
+                    file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc \
+                    "
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
-           file://0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch \
-           "
-SRC_URI[sha256sum] = "4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.31.1

