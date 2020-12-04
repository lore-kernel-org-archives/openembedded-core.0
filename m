Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.20177.1607112485865071992
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:08:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GoQTcWNe;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id n26so10441055eju.6
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V0RGpcqQ4t9t7u+dbbMXudsR95qJkw1zrAvYxeLjUSc=;
        b=GoQTcWNe54YW2EogEML3+HPUiK6+qKSmajNmjVCV2jKZODB5P5kyugazSXWvvqzan2
         I6RnSGw5rCy/NY6ZtXAHBsF/OSRz5bDCn2pj4qsFPCX1+qns26KlgMWZNo2L8tgPCd6H
         /eBtneLfnxdKZMHc8PKii3ry3gLax9pji/aFMBd8SPrLSW/KHi39dW+x8J8xe97/wwQS
         qYotzntj3DlozHp9376B1acv8Uj6FV1gmWW3+ScZ1efNpxy9krAAwvqwa94NmhSB4DkI
         zqTikwXbNvRy1hazvjn0JBWxBu0/pB56a7Zr4PbxHkAPJDO/P1oou5krEhqjLTMmkD+E
         atPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V0RGpcqQ4t9t7u+dbbMXudsR95qJkw1zrAvYxeLjUSc=;
        b=E4gAsrhInbpr2UXFiP8/B3NLfUgpKFNCoRlLvhf6tq5v60Ci2pB6WqHjGdHndQO5aw
         YuRWpMSP39HN6X6kSnh/5g0z4plrC3jIUjOtRwFC67gbbLjxeYZqAArpl0S+MsWEfTrq
         i663Xo4NwF8hwtYx49X3w4sV9nXSV39UrQAnsFMyGLo78ng59CjZKzL3pq2gOaiSg66G
         UjJIloZiVlFGmM5FG4KBQa+c13vR2hRkGIev5D37yuB7kgLNMO2yDFPbweYOIuz5z2aE
         OU1uqc8iyEcBhu6YlMyba7ZZdJgP6WfZuPMih2x2pSdXlsFHPeuwNYoDL6TBa93jqjGZ
         fcAw==
X-Gm-Message-State: AOAM5303NbOVXqwxDmlVWxPCvbdB5PA3wp4qfiykn/GqKFQAGI9qvfij
	hxdtCZRc4+jQcslVcGSxQSjhkPGBDNS6EQ==
X-Google-Smtp-Source: ABdhPJwR/LKzDd5oiStDKhLmAAKM62mzNP3i1CBGcnEPU64Qw5UrscddPhGQlmyF/TtQDkk2SMb7bA==
X-Received: by 2002:a17:907:d8b:: with SMTP id go11mr8671051ejc.247.1607112484262;
        Fri, 04 Dec 2020 12:08:04 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:08:03 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/23] python3-setuptools-scm: fix upstream version check
Date: Fri,  4 Dec 2020 21:07:34 +0100
Message-Id: <20201204200737.7072-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
index 4ebbac6b65..48bad2b99f 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
@@ -8,6 +8,8 @@ SRC_URI[sha256sum] = "a8994582e716ec690f33fec70cca0f85bd23ec974e3f783233e4879090
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi setuptools3
 
+UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
+
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-debugger \
     ${PYTHON_PN}-json \
-- 
2.29.2

