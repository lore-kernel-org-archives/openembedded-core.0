Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.19492.1608974896102302554
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OfxLcN+r;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n26so8304380eju.6
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yXC4hQBu5e8HmfHbXpA4yFMUPCkVMhNquxIgPrgFo80=;
        b=OfxLcN+r7xaeKLHHgsjkZ135gl+dTpdystID1DFAJ0i/qixyzVNfKbi9WEQ8au3UNT
         rPujnWZxeAX9vyNTvvZUJ84YCxib/zpVBz4dE0mKMfQduh9mPL0oFCudL4AOoGB7OZUK
         P7ghNPAplMfSrsRjV2EUSAJlohYCGXcPcdxr3i65vkNjq+fdwHB3REZ+okDu7p03bYYU
         vJkM3Bk6yx4HiY8so4DJ4+viB/2lDBlYpY5StxGYiawOZDR2yJsOMcdf6FxHl/UuTAxw
         hnwlkESdxz5Kls/BaKX9q4VPVqCSjPZlhN3UXTfUnQsFHMD87FVLCDHG2w5/k9hDHIQD
         2KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yXC4hQBu5e8HmfHbXpA4yFMUPCkVMhNquxIgPrgFo80=;
        b=ul14XeYh7iqFy4k7h2Y+pTOWgAjQLESDApW5158xJtoU9egdckJxBCfq9SBjTfNNhx
         pJNLQdIPSBvMBB9isXUIeFN7c+3iJjuxeiZ+HP8/hXTMvF/mNnoVTLaQiTYWtv14u1Bq
         4gC41gnXrw19j8r1YWhksMSBv0g7lMJNB2Ijv1AQxTkbE0w4QaWG+4mavSnoGRiYuTHX
         Z3Ed3tFKE7zjcoeYwYxW3xESnPamSRiNVXXYJbjwU9CGtQ22O4dPz3hPteDMum59MX+W
         aUyq1Anx46QGnPGQy7xYBtWjaVsIgk3apEzTE4k9E1RLkpt6xlddGgsa1rKp9+wN5a0m
         qOUg==
X-Gm-Message-State: AOAM5317B2abp/mwxkGGi6Zk7KwXjCQ2qnvohvbG9iwL1MT7QN1NqQ/8
	MHQyXK8+0/O2tNdLCmaqR8CjsBbPhds=
X-Google-Smtp-Source: ABdhPJxO8uqvMVHpFpfctKxz7A1Z92DFgppmusdhB6GmW1acn01N1lzJAHLyjFchNCfYYcEPsKlf2A==
X-Received: by 2002:a17:906:6d0b:: with SMTP id m11mr17228005ejr.230.1608974894774;
        Sat, 26 Dec 2020 01:28:14 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:14 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 41/48] libva-utils: update 2.9.1 -> 2.10.0
Date: Sat, 26 Dec 2020 10:27:25 +0100
Message-Id: <20201226092732.52323-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libva/{libva-utils_2.9.1.bb => libva-utils_2.10.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.9.1.bb => libva-utils_2.10.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.9.1.bb b/meta/recipes-graphics/libva/libva-utils_2.10.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.9.1.bb
rename to meta/recipes-graphics/libva/libva-utils_2.10.0.bb
index feb9ce1662..828f4fb317 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.9.1.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.10.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.9-branch"
-SRCREV = "50c7f19d65e2535940e31c6711352b36d6d64fd7"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.10-branch"
+SRCREV = "f112ee75fcd1472131b20f901b93f6ac1d293fad"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.29.2

