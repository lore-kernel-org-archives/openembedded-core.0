Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.25192.1591602529183817449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GfJmNSbp;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id c35so12606668edf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZqYj9XxDdBs9M1PCrKX5S7ofdxUEb0d4vsRVhxPbBQ=;
        b=GfJmNSbpOePN6/TgRI7U34Oezde3X+LjmIXoaYvnaYROlvhl5sjg7m8zwxfuZPtEyY
         mKh5grJ/VJ7DJ+cvr3//0ImbJWY1GHll7ayswKsPSUYgmJqyCw0xQCsavdrUI6qddMhi
         eo/lboCbtuVeEPpHiBI6yg6iFcg7mkdi/p07FRAvm6J40F0NvGPxElup9NfS1SGBZ3nq
         x3wbvBiwgxyLEXqLGAykgUkMrYIohdHaIfu7NEh6ghZTHbwlfwe91F2P1pKd9VrhL0MG
         f+PDo/aG+3TQBG+74ZKdXJmta+w6Tup1QXcQRQCjU6NXya5bTykYz1py6ECw8ckxg2ZB
         A8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZqYj9XxDdBs9M1PCrKX5S7ofdxUEb0d4vsRVhxPbBQ=;
        b=rpKmglf8F9XXgiIZbwtJWBPfli/B7Ld0tSSSZz6CXApUEGe6Oak+BAeqPC5xWOU3xJ
         T2ZLWrFuM+qi27VXWyqN5JntMuKn88WuDXA4Mud074HclICDO1XouQPkM/NjK/GiuSPX
         ZvKB7an487RFzSVIA2HU0zbUbX0Lrg0BPTO6Awj4bdKZjtkIg97rCkKDbqJg1PgrvpB/
         N5PdpUc046uHCV/hh0YicqTTUU3T94SXCNnEtCZM1ipMBhnSHrTp1koboekSgawXRW74
         MuFDiiK6TXRch8UtmBCSAVcLhhxVMNgmIHT67ntm01Y+3kjomxk0y2iKXlD1Es/3IzRP
         MRrA==
X-Gm-Message-State: AOAM532HdGIIslbaLsu+bCGBmsYr8SWVBkzZYDUrlCSleRGN+Yx/eRmU
	8j8zIQNKRBq/L5DKV5yb04xNm2kjt2A=
X-Google-Smtp-Source: ABdhPJwjjDjyEdrX49/bchWXMh8vg73Q5eMS+oAweyyamWyLUkD0CuogGAg9B7a+ESOnHfCDTSlvHA==
X-Received: by 2002:a50:8465:: with SMTP id 92mr19980091edp.388.1591602527391;
        Mon, 08 Jun 2020 00:48:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 38/42] subversion: upgrade 1.13.0 -> 1.14.0
Date: Mon,  8 Jun 2020 09:46:55 +0200
Message-Id: <20200608074659.7051-38-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add python3native, as configure probes into python configuration.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{subversion_1.13.0.bb => subversion_1.14.0.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/subversion/{subversion_1.13.0.bb => subversion_1.14.0.bb} (95%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.13.0.bb b/meta/recipes-devtools/subversion/subversion_1.14.0.bb
similarity index 95%
rename from meta/recipes-devtools/subversion/subversion_1.13.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.0.bb
index 6879f1249f..b9884151cf 100644
--- a/meta/recipes-devtools/subversion/subversion_1.13.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.0.bb
@@ -13,10 +13,9 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[md5sum] = "3004b4dae18bf45a0b6ea4ef8820064d"
-SRC_URI[sha256sum] = "bc50ce2c3faa7b1ae9103c432017df98dfd989c4239f9f8270bb3a314ed9e5bd"
+SRC_URI[sha256sum] = "6ba8e218f9f97a83a799e58a3c6da1221d034b18d9d8cbbcb6ec52ab11722102"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext python3native
 
 CVE_PRODUCT = "apache:subversion"
 
-- 
2.26.2

