Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.4878.1622787444729073655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 23:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oS/o5UAW;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso4616204pjx.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 23:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oURukj8xLkK8Uw1hGnq3IfWjoBCBc9oKDsaF/ewUQw=;
        b=oS/o5UAWOU40OcjcABz3NJUXH061+PbZ22Lp0NAfl3LRWYNt9pXmQWtIU1je2PEEU3
         V1G4xSSCBf00w5ByxdpK19C+dlQbOykHlzRx7OoSKRvfWa780OB26Rq8Evols0Wc6vDL
         JUgubI+qBozr6G3iMAGThJlSMtOM8VHVkab2x0FwpLLJfxjsheqR0YnPbbC4LjOyaCy3
         5jPyGDFwnVU+XeTcW2PeZ5BLTSF4WAHfdu7tbqFnU9rOWK79XlthMGfLmFFY9nHcQ+3D
         utXqaFKf6xnrco/vUc0nCQAhiEAE2jOLb/K2S4S0IqWKCwWZju5j5UV5kxKkUnY6rTp+
         O15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0oURukj8xLkK8Uw1hGnq3IfWjoBCBc9oKDsaF/ewUQw=;
        b=M55IpSc6SJU5vwGUHnX5xlIIywE9YgqHDhfVxroX9l+dM/vbGfUsDG097B1EpltOOE
         979EpBGOSBz3+7GIsrnNZTDpgdxVn2g5B8dVIg/tgd0vkWf4emNdp82kdkDsgr6v0c5g
         /tqe/+hstlYwe+zOeEdQGBz6S9Gb2vIL2kyxb5dCa5Kzkvwegshv4d+4BpjsuCp7TIBg
         Lr6mxqD4HPuwG4kGtksgi2KavBAPOa9BsV0VjB5VHcnSKFFQooAljBHdc3b7OqJiwVR3
         xp1BFaPFzuLoIbZVHRsKE4p5jt6MlwFWiD9OWKC1a+8NwJI2ikniUNTMW91oVJOziV0o
         6Mag==
X-Gm-Message-State: AOAM532rnaNotMkQmW7nS2UfjHoe/HEObgqaWS/gzcaRJ+OSq+OLppZW
	FZfMeKhDGNnEz9Ho/w+BPyRVEGHxAsOfzg==
X-Google-Smtp-Source: ABdhPJwuOkfjw7qNFCERRjMHzxqVorfLVkdLqeJJG7UjcY3cYDTL+OQWvn45lBov9PSMV6kyAFHmiw==
X-Received: by 2002:a17:902:7c94:b029:fc:5e8b:e645 with SMTP id y20-20020a1709027c94b02900fc5e8be645mr2794028pll.18.1622787443809;
        Thu, 03 Jun 2021 23:17:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id l20sm3710525pjq.38.2021.06.03.23.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 23:17:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] harfbuzz: Fix unused-variable warning
Date: Thu,  3 Jun 2021 23:17:19 -0700
Message-Id: <20210604061719.3721660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch to fix the issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ariable-supp_size-from-plan_subset_e.patch | 44 +++++++++++++++++++
 .../harfbuzz/harfbuzz_2.8.1.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch
new file mode 100644
index 0000000000..c1d4df42a9
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch
@@ -0,0 +1,44 @@
+From f96b2b653c605679b83a820b38f49a0a0f4baf42 Mon Sep 17 00:00:00 2001
+From: Andi-Bogdan Postelnicu <abpostelnicu@me.com>
+Date: Wed, 2 Jun 2021 14:08:11 +0300
+Subject: [PATCH] Removed unused variable `supp_size` from
+ plan_subset_encoding(...).
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/243d056ff1c2af583ceb67e5dfbfaac51dc96e63]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/hb-subset-cff1.cc | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/hb-subset-cff1.cc b/src/hb-subset-cff1.cc
+index df322f8..35dae7b 100644
+--- a/src/hb-subset-cff1.cc
++++ b/src/hb-subset-cff1.cc
+@@ -402,7 +402,7 @@ struct cff_subset_plan {
+   void plan_subset_encoding (const OT::cff1::accelerator_subset_t &acc, hb_subset_plan_t *plan)
+   {
+     const Encoding *encoding = acc.encoding;
+-    unsigned int  size0, size1, supp_size;
++    unsigned int  size0, size1;
+     hb_codepoint_t  code, last_code = CFF_UNDEF_CODE;
+     hb_vector_t<hb_codepoint_t> supp_codes;
+ 
+@@ -412,7 +412,6 @@ struct cff_subset_plan {
+       return;
+     }
+ 
+-    supp_size = 0;
+     supp_codes.init ();
+ 
+     subset_enc_num_codes = plan->num_output_glyphs () - 1;
+@@ -448,7 +447,6 @@ struct cff_subset_plan {
+ 	  code_pair_t pair = { supp_codes[i], sid };
+ 	  subset_enc_supp_codes.push (pair);
+ 	}
+-	supp_size += SuppEncoding::static_size * supp_codes.length;
+       }
+     }
+     supp_codes.fini ();
+-- 
+2.31.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
index 2353633071..1a0e651f6e 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb
@@ -11,6 +11,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-Removed-unused-variable-supp_size-from-plan_subset_e.patch \
            "
 SRC_URI[sha256sum] = "4124f663ec4bf4e294d9cf230668370b4249a48ff34deaf0f06e8fc82d891300"
 
-- 
2.31.1

