Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.179.1631554521013559855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nuZmgX0k;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id v2so2406195plp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3xn1owRhCG1PvfXQ1NJmpG2oy/aPdOc+nxT4yhe+3I=;
        b=nuZmgX0khiFk5DwOYbQjRxmD+Sh1QDrFfrPSqRfcWh3xaXrlP2JZdqXKfdzRF9xO16
         xoeBA5g2/Yq9NtBY10uVf55tiuiu3SSQ4TUWm0av1B4EKRwEe32RbWX/tVHVX7O0s2Gy
         i+AR9Kocta1NgkS/qtRSYzE5Ay84x93iexJXvaHRxmWFF/aBDtkzM+n/tlhXDEoavb8w
         dPFXFUNVciyPk5YkH64am7djvrBfBG9Ks4dC7Bpfo6uUHQMPkUxJW5CRgDP8e3BiMvnD
         lJlO2xn6kZ4LpxqQa9JBKTdPxaSeaYtKuKqo0+9IeUYIQgx/pjPRVKd+NM1ptGXqzKNo
         DI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3xn1owRhCG1PvfXQ1NJmpG2oy/aPdOc+nxT4yhe+3I=;
        b=KCMNF28y8ESHBQnXcYc7wXVuMtwaJ7HvC4aGSLaMGGdPutOBH+Vbehh7Qq5BQZrhh2
         H26b3U882h+nrLLit2Wg64WozXRebHGfH0bsdgm5EKlPJyBf0S2b7OBP87jGwSq67Wjs
         9no/UlWG1bKLiSOgVHYgQwS8lu2Dha7Dc9IGvwuB/YkfjUPgsOJB1XBwe/F4wGY9/nkl
         vx8DZT/dP02vpUURHrk9GU3YcujvX9az4SkhdB4kY/98OJcoZApu8gM62kPmrpFqbFjZ
         wG0WNSDy7ji0ssH895Qq+oQDMQSdnME5f50+K5FBn1SVJeE5mzGu/Z4sAeAOCXU+wNH9
         BMqg==
X-Gm-Message-State: AOAM532mJFV/BCTwstOXFTLYADWxE02tcP4SdcFvPKZJIZPe4ZTNOJUp
	wGvHiuoat8atPhPW4GK82ktr6Bbn5IqLHw==
X-Google-Smtp-Source: ABdhPJyiRoEec+cNm7sRhd2WYLWsu8R+6ldJACiOfY77nMh6VfpXCmWE+bgb0smNUbvnDKVLiNnE5A==
X-Received: by 2002:a17:90b:23d1:: with SMTP id md17mr724333pjb.105.1631554520395;
        Mon, 13 Sep 2021 10:35:20 -0700 (PDT)
Return-Path: <pgowda.cve@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id t68sm8988337pgc.59.2021.09.13.10.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 10:35:20 -0700 (PDT)
From: "Pgowda" <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com,
	alex.kanavin@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH 3/4] Rust oe-selftest file
Date: Mon, 13 Sep 2021 10:35:12 -0700
Message-Id: <20210913173513.176653-3-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913173513.176653-1-pgowda.cve@gmail.com>
References: <20210913173513.176653-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add file for rust oe-selftest

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb

diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
new file mode 100644
index 0000000000..ad758b71f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
@@ -0,0 +1,3 @@
+require rust-testsuite.inc
+require rust-source-${PV}.inc
+require rust-snapshot-${PV}.inc
-- 
2.31.1

