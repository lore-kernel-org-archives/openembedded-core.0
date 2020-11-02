Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web08.1152.1604335774406228524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yu+2FCNL;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id a71so9658829edf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNFhlNW2zJqPj4j4Vb1MEzrbnXPAG43ZxAAb6JphyPI=;
        b=Yu+2FCNLOVQpchgH0ounO5zHmQNYwS5VkIycq9YHRHG5nUPJkUm9rrIi6JwItStGAU
         gf90kLwHA8YMpL7B4FeCpPU5iWP//I4q8mGru2+eQbNxK0PmkEkoph/jJQqb+N5T4aoC
         RTyaO+iRaOgzzRT0genZ5Zs8LfHQ5UryrfjxA8jtIgEcRNsdf7NPG6MB4DYLXXxQsYQ4
         nG87La5ZoASPDR2uGc1U6JAx5Nag1nNowaC0J2NvvRKoWXeM06Yck2smr0+fGTyewIRS
         RFHzAbi9ylGnwt9ry8r4rx2E0Yrb0fFlr2N1ttVJAECqqnOIx6RUzaDFWJqaORUkK2ws
         /q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNFhlNW2zJqPj4j4Vb1MEzrbnXPAG43ZxAAb6JphyPI=;
        b=EhGQCPuHVoJmwNl1RmLI7FtJyxtNvJGtzyMaBn7OWyzr+LsvNRLTMZ6JDRGoM8g3y0
         vgjvaS5eiV53LHzySmFALKFg9YmTtGbQA6wCCkfFxOeGm1OlPTOy9vkRNZh7DORoEpnF
         Y3b1GVvNj3Aea7zn+m9kv3ekF/zxOLi45R9k0E1D70ABlsddbqbjKv/mMIkQpzgV53ud
         CrjJlxPh2hXarUA9xR97qlsirnjUX4ra27csbj3TdgjGAsbVDdrCLbcDHZUe2yRKke7B
         PW4BBMXNnXa4qMYWYb/uZaM1/+8zp6KKX0VNtamXnqbdWUfKNlZ4/O3sVNmvbDLO86z6
         G6Og==
X-Gm-Message-State: AOAM533+nq7CSPPmfI5SPWZksGPvTzz+KdpFbNoAdVeZXNXu0j9TnZH1
	R8BJ8zWjQ2x9OzW67dWPzAV9v5nEa3q/1w==
X-Google-Smtp-Source: ABdhPJxEJgc0ePIvMv+9FNXi1mqaLFYwWd/EPZf1ivbhTfI087guR38wMHiD+7fZXuc5XCL+OG4pgg==
X-Received: by 2002:a05:6402:150:: with SMTP id s16mr16824701edu.304.1604335772745;
        Mon, 02 Nov 2020 08:49:32 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:32 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/80] debianutils: upgrade 4.11.1 -> 4.11.2
Date: Mon,  2 Nov 2020 17:48:04 +0100
Message-Id: <20201102164907.27572-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{debianutils_4.11.1.bb => debianutils_4.11.2.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_4.11.1.bb => debianutils_4.11.2.bb} (94%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.1.bb b/meta/recipes-support/debianutils/debianutils_4.11.2.bb
similarity index 94%
rename from meta/recipes-support/debianutils/debianutils_4.11.1.bb
rename to meta/recipes-support/debianutils/debianutils_4.11.2.bb
index 3b1767e5ed..0eeb2954f7 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.2.bb
@@ -8,10 +8,11 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20200929T025235Z/pool/main/
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[sha256sum] = "8be869f19c55c18d53d9f0414b68bb966a068b2154e9fbbfc6193827d6af983c"
+SRC_URI[sha256sum] = "3b680e81709b740387335fac8f8806d71611dcf60874e1a792e862e48a1650de"
 
 inherit autotools update-alternatives
 
+S = "${WORKDIR}/debianutils"
 do_configure_prepend() {
     sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
 }
-- 
2.29.0

