Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.1223.1604335810044247477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kASLB71U;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id v4so15067117edi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IdeiNtAUbhQivOtNkUe8gdSw/+yrTrJE0HdUQWaEswA=;
        b=kASLB71UIG+ToUOl3bURVjCOubtDetcGvJmG1PT69qM8gI0QxEdkmRST9A9J5N0EyO
         lrAbmlxDKaKr2KOfjCpN35N1bx40Ey1QJquGMyTFmlRix29Dy7EI0B292X2fI5nBwpNy
         OKqpCpDOEazjcJ8rcAGOxqBvFMQaO1AZaGUhE34QBRBBguHnRXGRnYlXnjdry2fe0AQX
         W3F9Jyk77muWPF9bfs9WY9TZJLo85R8JpdZXazytqjj0sbX2FEQ+n3YABYbGm6E31JCf
         cj5QvCO3hZ7EdNu88wV9xGsEJOSsn/wzKPydZ0P1nBxV8u/fcPsI/Q+5wSjQyPKhBj4+
         8Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IdeiNtAUbhQivOtNkUe8gdSw/+yrTrJE0HdUQWaEswA=;
        b=kHveLfqCFrgScs8E7rO5reRqtNA8/UMf2pqXNVs9CiP2UUg5es6BsiHTujoQEfWOmO
         /dVZC5NcZh5rTrliUAaqv+2lm6RNMdw6mHRIbOIadJKkUn/ZsVgsgsvvSdlR+bWWRBx0
         3wHr25ypGvHcB2ncuT8GbtWIL871PVrxTUl6666Y5BbnziSKjR+HG+JlYg9bzOgrSdWg
         Cf38CH/GfyuLM2WtrSzeI49B4YqGuxCT5ILnQm61t0fbWX+wevawH9A7FOVIHAxMKfR3
         DDZ2iz1oqtzFHw66DqmDB7TcE/5/czO/OA85AJiX5fLSqCgtsTrb6HNbsUjYmNcZpMlJ
         LslA==
X-Gm-Message-State: AOAM5309msXS3FR+LROWhlm+pcJqouyBQiG6+AP9AYHaQv32ew9v1eeM
	Vql3Va4pwq3/ueIiV8bkzJjF46G9gVoB6A==
X-Google-Smtp-Source: ABdhPJy89sKMJmLhwMmxNSf4kvzl+FSNudEtqJgjOh7AGU85FbUZJdDhxbKneHxdTHjhMcvCooK95Q==
X-Received: by 2002:a05:6402:150:: with SMTP id s16mr16826828edu.304.1604335808385;
        Mon, 02 Nov 2020 08:50:08 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:07 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 57/80] python3-pyelftools: upgrade 0.26 -> 0.27
Date: Mon,  2 Nov 2020 17:48:44 +0100
Message-Id: <20201102164907.27572-57-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pyelftools_0.26.bb => python3-pyelftools_0.27.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.26.bb => python3-pyelftools_0.27.bb} (72%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.26.bb b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
similarity index 72%
rename from meta/recipes-devtools/python/python3-pyelftools_0.26.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.27.bb
index 575dfc4dc9..0cfd99504b 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.26.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[md5sum] = "0ba0de4b47127249c4d632ae299cb0e8"
-SRC_URI[sha256sum] = "86ac6cee19f6c945e8dedf78c6ee74f1112bd14da5a658d8c9d4103aed5756a2"
+SRC_URI[sha256sum] = "cde854e662774c5457d688ca41615f6594187ba7067af101232df889a6b7a66b"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.29.0

