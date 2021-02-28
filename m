Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.7710.1614526635143842848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B2X+mF4k;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w21so17340720edc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ir6aadJFtKtm0+xlJEYUWJzM/+GdpAV4T2tGuYjkBoc=;
        b=B2X+mF4kz+1YGxndVO4NJ2kaTLPaVyM1VBwrSXFDatmKL/OjoPQk6qv/tVy71ALbwN
         X5jymUfjqQbSAlC+dk+ueJy9L3VJneWZWt5QStMkMoZSyVGBzH5Y6lMvFLxYxORS4UjK
         gm9LK5KybzSGCQwpXv0ZhAtm9Sx81BoYvq9wsKhwsW4uEEGgE7rHtXtkw3P/Aj7iU2Q7
         swguwa3XOEI+U/LEUIq7jPGafzm4emRoQSjR4blCQ7KS1UNtqwb387HemBRvnAMB6DIO
         rcp1DH40Thv4cL0bxSdm+NpxMLwHjFJ3JLYrynaAq7Gdq2KOkNnDEC66fZtcVPr01J/Z
         w9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ir6aadJFtKtm0+xlJEYUWJzM/+GdpAV4T2tGuYjkBoc=;
        b=t+Adyfokor/Jqn9z57yy4QT/WQzXKc2lRonTf95jbLQhowFxLYi8SYHMUcsEjdu3PM
         JMdjsK9FScO0c09E1/4n95sdbu7AkvqtaRgcW+VsZoL24b7zHZ85CzbbQV2yWSaNCX4f
         DP+Gtfc8HR/it3E1XQ44on0iIf+89khuuRLfNtMWgIMViWEIYYh1aWle8XOoMfO+Rp//
         f7VaIw1N4VhbKJqLiP/tajRLAyAMEdKpD16GdhOsqDiAa1OM899A6QhBHgyqx2/6iW4V
         x7JbpR0E2G9dBUTJG1GoTs/3btemWzvWMd0kQq6f3BWPPwDMqDG93vpFWFR2vTXy5YLa
         7pQA==
X-Gm-Message-State: AOAM532+wc7hZN6JBIusA7P5OPNVrBtBaCYK/TsbquY9f2pvSlo7MgZt
	q7r5H73f2wfYssd2CMiep+WBCh+ZXV8MLA==
X-Google-Smtp-Source: ABdhPJw1b9HqrAhm5a3oWEewhL3mR4BO42Ug1/ij0CXJRHY/n3gubMEJR+tPOsp2fJx+3i4IPkMvCg==
X-Received: by 2002:aa7:c044:: with SMTP id k4mr12509942edo.47.1614526633463;
        Sun, 28 Feb 2021 07:37:13 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:13 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/24] bmap-tools: upgrade 3.5 -> 3.6
Date: Sun, 28 Feb 2021 16:36:40 +0100
Message-Id: <20210228153702.498275-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../bmap-tools/{bmap-tools_3.5.bb => bmap-tools_3.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/bmap-tools/{bmap-tools_3.5.bb => bmap-tools_3.6.bb} (89%)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
similarity index 89%
rename from meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
rename to meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
index fd57f8f7f0..95cf00804d 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.5.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.6.bb
@@ -11,13 +11,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/intel/${BPN}"
 
-SRCREV = "a17f0e3ff8669dd3b1c44a741ae4f8162155faed"
+SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
 S = "${WORKDIR}/git"
 PV .= "+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
+RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six coreutils"
 
 inherit python3native
 inherit setuptools3
-- 
2.29.2

