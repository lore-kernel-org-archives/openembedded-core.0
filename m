Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.11625.1621204375650247463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ec+kO+mb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id q5so4466361wrs.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7jOqT70XYQmkqJMEl49rN085lMgJHYXnOW/o2EWU0RE=;
        b=ec+kO+mbQkryiByOWjUopf0DD6R+ebIa4NVFTjiVATV6vdWJORvhQ/9sYzogwA6cQE
         9PO64AzCjEUGbKcFBOpDOEP/qFUfAx/ibUvoaCCSa0U4fZOVgIZS6JLJBaOM/2KKB3+h
         ZDjNUL99z/yIlxbKJG4sys7ylJjwFoYXTy/H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jOqT70XYQmkqJMEl49rN085lMgJHYXnOW/o2EWU0RE=;
        b=AZWvucDZvydCo5D+VMjyRpOk4+fUSTBRUL33MeqAgcWuCDs/4cYatz5+umcT3Agdfa
         RmqPTKwwfkf+qdz4AfUrdaFGjCV4kiMaP975xmGNCXELpGfCRd3QunLfpyzTX7FCURhP
         wZf5pu0L3T4xNosT9KUcbTnJjmxGS9w8Pf/qAttluoQhOCKSymxJai0U0kT0bXsy73An
         K7Q7S0PZB4bjgCeCEUFiGDqIMgjsihe2R0wCVD0vO4sqe2VON9WFCZ9m/zF0WUU2RVV9
         b1ET2bGxhRFlRoUgHL5fLqDlePUlTdlMftMg1vM1shn85mgX/luyll5tzGLmRYo7CbpS
         cufQ==
X-Gm-Message-State: AOAM533hMnC39ruFw28lwZycggkDOP8Fxi1DysjxvA0CuwP43WrDhQid
	8LnH+o+CHxp1HpBOw0W3GYWtdp99BX9cRQ==
X-Google-Smtp-Source: ABdhPJwbAbjDlPbM9ktqKsk/cLcKbePfVL0U+KuLOEUh+79y7nqFcj9nHipA740d83OFKSxuGYyARw==
X-Received: by 2002:a05:6000:1286:: with SMTP id f6mr33001388wrx.226.1621204374197;
        Sun, 16 May 2021 15:32:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/27] python3-hypothesis: upgrade 6.9.1 -> 6.12.0
Date: Sun, 16 May 2021 23:32:29 +0100
Message-Id: <20210516223247.2401235-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...python3-hypothesis_6.9.1.bb => python3-hypothesis_6.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.9.1.bb => python3-hypothesis_6.12.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
index 4532998bdc3..a8a749cd16b 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.9.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.12.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5e25a0be23b1ff81ecf07e87d82e2e39a79c83c1458178af202ffe4b0183bcca"
+SRC_URI[sha256sum] = "a24b2ccb7b84860762df3fabb8faa196bf627cbee62917a5095f3de8ff71050b"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.30.2

