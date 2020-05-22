Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13958.1590157590763945565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 07:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HBQ6qs0u;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id v2so189433pfv.7
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PlmiWkLysb4r+D6yjQ0ZeFIVpfZiZ5nnjkaDY6DCpAs=;
        b=HBQ6qs0uTBMMqja+U71BrtijVkqRHmB3Su5+kwCC9dW//E0Zt5WNdNY0hB/YRfbn/o
         YSAu+w916LP0t3NAGgNoNTvsCwWAPIDtJQ4ep0f+hTkdKXRexeI9dKc/1O6SfefEuefg
         SRip0dUTjL5uLgidjsayQkJ9kO8EWaHhouXLVzoK22GQg3wZo7yVBy3tasZugAm+FCdC
         Y/nbhFTMkG0M3RnoPRy9CzgO6PSENwGm6ZPUjSyC5ESxRqb+jtzgGObkvMJYNFLv6Q1h
         FD5gE9qBbBSrk+ceh0r3FOzGlqDpcYI87V3C+0PK5urU99KtSQo0vs9c6xLZD7JW7SeA
         RF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PlmiWkLysb4r+D6yjQ0ZeFIVpfZiZ5nnjkaDY6DCpAs=;
        b=sW+vkn1I0HvMCY15oQIqfRJTZAIus2QLud0pl7XTTLNsNkCTNb7V/k6M2Bq9tIoL5F
         qGeHwgg7ppspfTChNMccfmWfKIoN1B2iDqo3ONLbISoGHCAG57UlKLgmueByMg1k0l/5
         uvU1VrKeG8f4wNHb4H8w/aMDKoLieWITTx8YQjIeP/dYFhPD5vNgKUlzKQqunkK9a7CV
         +xyw43ksAHcQAkCuVkvlJMIxwjW9KL78f/xwlSHrwJoOf0fOfZBp6Cfxulmz7NCKwWK7
         e0g9ui19h4Ltd/CfuRZFFnapV6EldROe5NKP6gxXEus3wYjwv4YT8HANpbrm8biHq1fL
         oIdw==
X-Gm-Message-State: AOAM530A9a05crFc+7UjpI5oyCmryxtb+UNbOVgOBLdKU0rXR0HLHp9z
	80vU0N8K121f6FTFZ2VW7nexuc9R
X-Google-Smtp-Source: ABdhPJzysncWCMbFa0BgTnOAPk7MWEdoON+oQHeuVD1EEG6Rdg0y2UeXMTUakhVXDWYe8UWYC1Vu9A==
X-Received: by 2002:a65:6799:: with SMTP id e25mr14472449pgr.9.1590157589672;
        Fri, 22 May 2020 07:26:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id v75sm7347763pjb.35.2020.05.22.07.26.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 07:26:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 7/8] openssl: upgrade 1.1.1f -> 1.1.1g
Date: Fri, 22 May 2020 07:26:16 -0700
Message-Id: <620d69e7ad0d0c40ecd135e48f96aaf368c7f242.1590157490.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590157490.git.akuster808@gmail.com>
References: <cover.1590157490.git.akuster808@gmail.com>

From: Jan Luebbe <jlu@pengutronix.de>

This also fixes CVE-2020-1967.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1f.bb => openssl_1.1.1g.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 204dc7c6fe..a57e09c802 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
+SRC_URI[sha256sum] = "ddb04774f1e32f0c49751e21b67216ac87852ceb056b75209af2443400636d46"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1

