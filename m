Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248EFC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:37 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.6492.1646731955977075432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pgkp3jsF;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id yy13so28965958ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMT8pHuaxyzV6ZKk6vikJ0eKPUg3UFNtc6q377RwbUg=;
        b=pgkp3jsFZyTPzwHD05CAJAGYati/RjOWi0cdDVtN2f5IwFwrCYP1zj1nr1Ebbpy5+z
         8xAPAAljL8RpMuqicpZPMps1CfygbRewAUtyesHl3BJvOV3VNxu0CWRw3AYW8QjTKmlW
         Xnsz1XuMagbihJ2iINXsBwMCAqNwjPUDpR5pDCs4sUcEhP4sKI5q8UHkxGvI3rsydt7a
         Ty3DwglKdzAtAk5nlptS6daERpi30dkH2CCRWoi+76Wninp57ukhzukBW/xeyvZ6aU38
         81t3lC/Xxliu99nm9dKHx7+e4O4dG/59SZOAWovb+vpUrqSIaO/tKAj21Kg02gso8dyj
         3OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMT8pHuaxyzV6ZKk6vikJ0eKPUg3UFNtc6q377RwbUg=;
        b=Mg586qr1nC+BaFKtZIQm9Gf06eQYnqMCwNkU3O526IdDEYbYkuDgYtVHneS2IkvyNT
         cu5GfX95x7Q7fJV5VCjKQYGB0XdaLpavbxnngVs3bWDaH9Ex6OqqDoTG95dRGm5gGZJ4
         WtY3lrRVZ+2GlxA3FExFtnmvBdIzoYPqwmaJ0ZlvVk+imNrdxsPWlZqmjO4p7WQuLcC3
         uVqtcpAwFALnIhjocZaUf0dxuGlwnRLSL/eK8Qd9kvU3nn2OVS52wIXKplLOKG8erjmR
         O0K+CxvK731vrIa9+c483HteS2tnjgrhxbDpuYx0R6MgEdiOmpK1QeXbIejVIywM11pW
         o/AQ==
X-Gm-Message-State: AOAM530bw7XcfhyV/K0tlJwGzm3BC31QAnBMC2DGonRuzMIA6nRsTZoN
	YxcRL9OLwHxGSsqUA19LH8C+lGBMX3Q=
X-Google-Smtp-Source: 
 ABdhPJyFdEZCo2j1VS9W54+wn2x1VYFNBmAS0EStvj4vGV98hRaYnoBJR9Mgqyoe3dRm7hemG+TETw==
X-Received: by 2002:a17:906:c282:b0:6ce:369d:3d5 with SMTP id
 r2-20020a170906c28200b006ce369d03d5mr12490393ejz.425.1646731954525;
        Tue, 08 Mar 2022 01:32:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/16] python3-cython: upgrade 0.29.27 -> 0.29.28
Date: Tue,  8 Mar 2022 10:32:17 +0100
Message-Id: <20220308093224.3436483-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162886

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.27.bb => python3-cython_0.29.28.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.27.bb => python3-cython_0.29.28.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index aeff3e77ef..5050dfd427 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "c6a442504db906dfc13a480e96850cced994ecdc076bcf492c43515b78f70da2"
+SRC_URI[sha256sum] = "d6fac2342802c30e51426828fe084ff4deb1b3387367cf98976bb2e64b6f8e45"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.27.bb b/meta/recipes-devtools/python/python3-cython_0.29.28.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.27.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.28.bb
-- 
2.30.2


