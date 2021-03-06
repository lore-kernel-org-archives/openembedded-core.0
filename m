Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.8754.1615044251585220533
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 07:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=q0IoO37i;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.172, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f172.google.com with SMTP id m11so8385190lji.10
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4nrB5t9IvstpDF0YV4+kCVcBBCCYbnmexVyovdEne3c=;
        b=q0IoO37iJVpxK+j+jJTwcmETk5lXhMhSH7v5XLffAyTARo5BnKz8W3PhhIFhiGwhHF
         xLp07ObJHOvTIqxXFTEPAQufuh2WUzfK+8OLHBJGv30ydFCZaVgJ87p9449+1/vP42Iy
         u+nGeLMaALT+n7OGVx95vO1//h+COgF6nvSLeKHCxev4k3bIC9memuZ37DBiNJ9Uiurf
         ks6r5A55Ub3zoQQczqIedKumSJwv0h6a7gU9KGgZN10IgnM8zVormm/SQj6NavBKUmQk
         R9+rmW9K/k+NXNKNPBodBgW4X+TkwsTArmlo04E9BrlwxYxuqq7FBtDGkdWdO4REqMjm
         0Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4nrB5t9IvstpDF0YV4+kCVcBBCCYbnmexVyovdEne3c=;
        b=CZOCrDccZug3bpghhp6by0P7BP6DAE33uYNSNsmXfKOapsptu4tnNmw74wloJfT6zY
         H40NR/VOwXCVu3k2jfYDMER3w3Hq8xIsS8+utpGfb414sm4HCLrjcQ62jmA/CDTE89UQ
         ARPci2pVnDnnZlZrcBVXZnfp6SQk3ZcFPkBMCKqv3IuePGlxM1SQ3QD4m1pLvYtp4MTM
         v+SvwxHDzTj4+56V0U9p8fA2HqhDWQmfHDfX/taPba7TE4sOB8p7DNY/LLrEXSuFPpKg
         gEQUeA04AbfIKRHIRgUXFi8F7n7cfJ1nqjVtxipJ5YjbOl5xHv48JkGSa7NoYdFvdc/1
         UqBg==
X-Gm-Message-State: AOAM5306LfbbcR3URsUubjN3sFl3slvRgnRfftAtzJWfdWrxt0TNogRu
	bhARravrCP82SUCbOitMNrTKr/sdcwFvHbSo
X-Google-Smtp-Source: ABdhPJwqw61dX9FsJfXCXU0nbL9jieY77vL/Ijbe/QU6IyoNcUW+s8adkRfXg9kL0SlNBdPjgHn99A==
X-Received: by 2002:a2e:818e:: with SMTP id e14mr8816532ljg.41.1615044249473;
        Sat, 06 Mar 2021 07:24:09 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z129sm694422lfa.127.2021.03.06.07.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 07:24:08 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-setuptools: update to 54.1.0
Date: Sat,  6 Mar 2021 16:24:06 +0100
Message-Id: <20210306152406.804047-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-setuptools_53.0.0.bb => python3-setuptools_54.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_53.0.0.bb => python3-setuptools_54.1.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_54.1.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_54.1.0.bb
index 811c8a5900..153258d3ec 100644
--- a/meta/recipes-devtools/python/python3-setuptools_53.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_54.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "1b18ef17d74ba97ac9c0e4b4265f123f07a8ae85d9cd093949fa056d3eeeead5"
+SRC_URI[sha256sum] = "36bc07925c77dd6e30c64c91c2d080212a46910aa79073990c11d4c48a006240"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

