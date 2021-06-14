Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.24512.1623633498135557649
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 18:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nayIX65G;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id i34so7334422pgl.9
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rBXiG3jM4cZrOBAe7pWqXtfwA2vXIPJPmX6VrXICY2Y=;
        b=nayIX65GyWWJmxVM/VYCz1sSEy/S2qv4f7g9Y1QPIkqapmbY6GaOXxlLXChmapm53t
         5N9bSZJwl0xZcBOJ0r7/CqDOqO20IUVVmThiWIZm3z+rkfIOXgW7t7vS/AAPONGIf/l5
         dBvDyAvW/zPvKt1s7DKfeYyc9UhS3PQKFip2f/NBsWKxZJXMX3UL0eBIbqkOdVVEvOFp
         WOd/RloPeVlpQYSkMMPXRKBiut9cOkI1WeHoMolP2UvsyT4DEAhe3YECrC7tGTHg5+S7
         E68HguDvT0cdiFXNAzr4rtp+Sj4ykn1jwX+zhb4mRJHf8xeMacqK2eBcEsIzzVqarKZv
         BmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rBXiG3jM4cZrOBAe7pWqXtfwA2vXIPJPmX6VrXICY2Y=;
        b=fBDPUAPWqk3eKDFTO6/HsFQIf8H5hyWgf9fFAobNgY5bcgwM05HeWlZdbkzIzdfcWe
         9pt1z7POlXBI7pW8UHSzWRS64gnDuhjgiqb54dPiE7NwbNQjDoYirJXlu9poiWt+4XJR
         CS5MJAARy8Mzv9sOIjamt2/dG8gg7jgULjxGa2CFnU7Z81gNp/wWf1AV9UW1amtyf5i5
         H5tMeuM5wx6d6vYmWzjoTL90IZajX/lIx6Zeti4An71vSYhR1ZWL92ggjukbh886lkgE
         rI07uvTnqo2tY5bjVQ9fUGzSVXtl6gVp1YExUY9Mqr8L8EpJVBfldey1zQeAOEXg5FfO
         LJwQ==
X-Gm-Message-State: AOAM530yJPhtNOvAXAeKHOXetpiDyrMb5C3dCvmwOBojjY8ihVen/3A2
	mRnpjUQUs8pv+Djg6V2tYkFFEpyHyDeCjg==
X-Google-Smtp-Source: ABdhPJwQqc48lTdBCy1oHcQpvfe2M6jfwq0O3wT9wK2sn3x3MZLSZASaBTBr0yyDMpOU8LWrVTcZDw==
X-Received: by 2002:a63:3d8f:: with SMTP id k137mr14831417pga.161.1623633497374;
        Sun, 13 Jun 2021 18:18:17 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:fceb:f044:c379:f400])
        by smtp.gmail.com with ESMTPSA id cq24sm15909706pjb.18.2021.06.13.18.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 18:18:17 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 2/2] python3-hypothesis: upgrade 6.13.14 -> 6.14.0
Date: Sun, 13 Jun 2021 18:18:07 -0700
Message-Id: <2e762b2c77c41b8453bdd009ec3faa233ad52d2b.1623633335.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1623633335.git.timothy.t.orling@intel.com>
References: <cover.1623633335.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add runtime dependency on:
  - python3-compression
  - python3-json
  - python3-statistics

Upstream release notes:

6.14.0 - 2021-06-09
The explain phase now requires shrinking to be enabled, and will be
automatically skipped for deadline-exceeded errors.

https://hypothesis.readthedocs.io/en/latest/changes.html#v6-14-0

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...hesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.13.14.bb => python3-hypothesis_6.14.0.bb} (54%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb b/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
similarity index 54%
rename from meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
index 150dc8a5d6b..89071b2a974 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.13.14.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.14.0.bb
@@ -7,8 +7,16 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "36ef2d58f600be2973f694f45a55a5502de705d7594f9cf841276aec9082c414"
+SRC_URI[sha256sum] = "9bdee01ae260329b16117e9b0229a839b4a77747a985922653f595bd2a6a541a"
 
-RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers python3-unittest"
+RDEPENDS_${PN} += " \
+    python3-attrs \
+    python3-compression \
+    python3-core \
+    python3-json \
+    python3-sortedcontainers \
+    python3-statistics \
+    python3-unittest \
+    "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

