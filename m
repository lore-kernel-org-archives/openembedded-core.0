Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.107.1618505014016678128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 09:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B193CvDd;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u15so3843729plf.10
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H1kCSXV7Sn7GrJ5B2Q4eFC7myChXOQn+SjX2VbLjfj8=;
        b=B193CvDdTw6mNm6TAxP1G/A+ftb0GMghRVw9aG2m2WP05pW3GOAnwbnWfk7pFlE1gZ
         Y4XdgR4MJFil6CYHv5Vp23luLE9Yivk6dsfcA8tvmRZLWpanfxudJ7I+uvpMqhZErbNt
         qA+eStyJp1z3f8C2n3GYH3wiufMfP1kM5MI5StfDbJrR7hN9SWVGV48y/52tyChhXFSK
         IH6xS4RwQ/0gHVoEidQETPhCFtwGaKKTOLdnjMB3sBdbHm8PeTEWdd6rpU76NfUzsf6w
         zyqT6AsBcZCEU38wS17fYuazUUQMSGSZRBy55T+20pi4C+bu1irPTfBjUlHv9/Qt/TB3
         xJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H1kCSXV7Sn7GrJ5B2Q4eFC7myChXOQn+SjX2VbLjfj8=;
        b=chXdFm0l81vJU2PpxM7anxawpJdqPLpQXKR8KGjq7XLp9jkVuhPuBfqVdMyJjRy2bN
         OX5GnKd79jaFkAT5DkTmB78AuHq2NP40K7BGaa3ubpnX5FTjKzIapp4i+uIIxNJw+FYg
         8UJbIcdr6VxiAC8+HtqMRizkFAxmpd8dG6z9O+8DCcu1pbw/kvyUU73UmyP4tHHMIIa+
         88CbLJNa0PeXNfZGeKrHYFo+lhfyhcTB5rwPwt10G0gzZoSFRF2o85EuCyDywwLFCpv/
         iy95Cm0fO/Y1rP9mf16a/T5p1AMvV12cDs9/+vy28L3ONM4+nB1/mBrOnxiYL3wv+3Kl
         P4GA==
X-Gm-Message-State: AOAM530bsDx+v+ydjwbH4PdbPG77WP3oixmUTr1hDkkzDoaYXZBnkRh6
	qVVT2BptORcCswzrNNoubYq2jHFDG7bnRA==
X-Google-Smtp-Source: ABdhPJx8oN3Oa/4pNImvIdsvidCdem545+gmj53SQ77cS+Z0mbaVZkiersmJ4ZVgi+Uyuw9ObTRZxA==
X-Received: by 2002:a17:90a:4e5:: with SMTP id g92mr4723641pjg.165.1618505013234;
        Thu, 15 Apr 2021 09:43:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id y204sm2834752pfc.198.2021.04.15.09.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:43:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: update SRC_URI to use https protocol
Date: Thu, 15 Apr 2021 09:43:30 -0700
Message-Id: <20210415164330.1367260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index f18d928c70..39a681a712 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
-- 
2.31.1

