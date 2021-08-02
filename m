Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.15910.1627879045110633899
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 21:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cmM0vd0w;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id k2so742023plk.13
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 21:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XUJ5Xt4dGffSXwf1rd0zsL04RaQfirKerkhOUfEfeNo=;
        b=cmM0vd0wrSn2Yr822LL9ZqkgBLW13jRxQ5QsiUrKBzTTaORNd6tjTUaAT263Arb4q3
         5bMQZlQDtnivKJBEkHSDNuGU18lDXqzOvEHtxWkGZfbiCkbAIqI9Pkft6wB1tO/+b3Ux
         hOHwj8HY1duA7QC3DqtxF/uZ/Y0hu8Mm2Rxzrdl4OtihIVkG+Se1pPy8QAZAegemJxWj
         +PaGAK0mRrs5yCMsQdzVf7z4rbItJsX71ZKFG1qmT7nfOzUHwIZaJTl6lp7Hq0B7zYAn
         4YKcwJEUdvPSxjiKK9/pNM1HCc5z5cuFptvPa1bNGN8cWEqejDtFIXXy8RE7mpW+84O5
         fyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XUJ5Xt4dGffSXwf1rd0zsL04RaQfirKerkhOUfEfeNo=;
        b=Jn2YX4pJDMnN/KrF/ny9gjKloivVTqGTv/5CTL0VdccWsKW2v2RWqX5AxoO2UdUyVB
         LLp0ZcHO66WpMPbCkizY6HKh4muWgMBrlSzqZ55eVR8GhZ9KnYdKhgKlEsz9ijL+q9D0
         s0+5X19b4vTf8uX1H18zTxPiecoJg/NHGM1o3XnDkOsF7MYCBwobHD9fupeHf3MiPI3O
         JjlQCzO9GEWJ9Jn55WBGHpbbsorRnzj9W2EB1E+VDwXV9IiyLTg4Lf5Gr02bnW9nTMJX
         b34Dyv2cbHMOlu7nJTVKoT6vxySxUeitjl2mWDuumozrKMfOxXhxbPoeJ9qEFpRlk3D+
         3wdg==
X-Gm-Message-State: AOAM5323+gw8XDwwZjHavUFfINJwTpUsGFJfO5SP4UDY9UxXgPv6b47E
	BjsSLojL5fxqTsInKCEUqPciN1ULR1vw9w==
X-Google-Smtp-Source: ABdhPJxjjRr0IpR7OhzymHxUbsNX5Fyh/nodAXtdDfgbyC4nKR3XMZpfDL5meCypBQBTiEY54aqdGA==
X-Received: by 2002:a17:90b:4a81:: with SMTP id lp1mr6792707pjb.191.1627879044342;
        Sun, 01 Aug 2021 21:37:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id c23sm10060073pfn.140.2021.08.01.21.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 21:37:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] glibc: Remove obsolete --enable-stackguard-randomization
Date: Sun,  1 Aug 2021 21:37:19 -0700
Message-Id: <20210802043721.3458646-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802043721.3458646-1-raj.khem@gmail.com>
References: <20210802043721.3458646-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this has been removed in 2.34 onwards

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index b396cd1d59..c713faaff2 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -80,7 +80,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-tunables \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
-                --enable-stackguard-randomization \
                 --disable-crypt \
                 --with-default-link \
                 ${@bb.utils.contains_any('SELECTED_OPTIMIZATION', '-O0 -Og', '--disable-werror', '', d)} \
-- 
2.32.0

