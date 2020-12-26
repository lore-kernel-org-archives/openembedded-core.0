Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.19123.1608974879782735732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gog15Lje;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id cm17so5579223edb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nf/QbiRGXGvlkr9kMpc2gWDFpwSfgyCm4Aun+AC+KZU=;
        b=gog15Ljee5bwfdTm/rr76WGxppiJoZc6YS+M0NrVvl5+mm/0W/uXOJDhs6zmMatx7N
         eIGaWrRwreyWGeXgW9FBKQ6A79ZReecMEAdtcN1UL4aLE1rzfmM3TnfTrdthohZdnhdc
         bez038tSZRKz3UwyWfWgai9xsqR1elrk6sii281ijT6Ee4Jv1FrC+tI+X/PgVaqdcG5D
         34KtZV5KS+Tx0i3PDfhzNJ9KzJ6QMkVBfAR7k5OUIqlReXoWUKXupXSOOSlKwWoiczUU
         UBKAIj1Os7dMdwKg5YnPbx5DeEl7c3GibQ+lGymbaFErSlmi5G5bozo8Ma4tbHTCL3/R
         Bttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nf/QbiRGXGvlkr9kMpc2gWDFpwSfgyCm4Aun+AC+KZU=;
        b=T3uGf3y38SA4Eld63bgp+Rz9+9409tr88jCaNPYWyFbd4vuEhTjYfAXVgo7PHvLXpJ
         bGZd0FU4SMkvPb0NUcNjExT+cLMgpq5Y4bjAMj2SJxq5mXu4QKf7dZNPPV2gVlenxn/V
         NgFcgrmNd6lMpW+DTm+JKgnTmU/N8frDRMRa71cGslTWsbOzTML4uoyOn13D7yxp5lIt
         dYLIM9qc+E2JX8VsILQksFQ+VDOlxJ69nKypezTk/up1uMDFGVtOFA860f8LCW/2gaT6
         S6t1ii7AyhDjV9tFMAX5zxwVJSDXv4xSThFibE8/QXSuRECfX0+7k2x+yr6m1UnEJ0IQ
         M8cg==
X-Gm-Message-State: AOAM530Jrb6jEK46loF8Gkbmi1vrLC/Uzka4Jdapbw3NMgl+PCQMtnG+
	+OgHb+1TGfe8eJ3MBWQ0acu4VfL1a6g=
X-Google-Smtp-Source: ABdhPJz7H1Y2fgTb2mzbrhCM9XdkzYAZxiBKNnV/wqrmjC6SNejmvwquUMWFhZWvs2XAsY9s21iDtQ==
X-Received: by 2002:a05:6402:d08:: with SMTP id eb8mr35364861edb.271.1608974878206;
        Sat, 26 Dec 2020 01:27:58 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/48] ninja: upgrade 1.10.1 -> 1.10.2
Date: Sat, 26 Dec 2020 10:27:04 +0100
Message-Id: <20201226092732.52323-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/ninja/{ninja_1.10.1.bb => ninja_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.10.1.bb => ninja_1.10.2.bb} (92%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.1.bb b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
similarity index 92%
rename from meta/recipes-devtools/ninja/ninja_1.10.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.10.2.bb
index ecb0566f37..88ff843409 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "a1f879b29c9aafe6a2bc0ba885701f8f4f19f772"
+SRCREV = "e72d1d581c945c158ed68d9bc48911063022a2c6"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.29.2

