Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F019C25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.22248.1659940977695670407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ou05oOOu;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gk3so14781768ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1H45Dj+ZI6xKoW3+pLZ7nkbBIIZjn06xLFKGSZzRITg=;
        b=Ou05oOOutnf5y5gNGp+jZtomYmMChQbStMMKsdUxuPfFceFrgjhIbVgK6Mxm2qau2n
         yCNSN4+4o7RrgOpkLYsiwZnu1gVAtepE7hAZYhJPJHYfYZLDY8b/UFBanfvPhCnDmpm0
         JimZ51ADlQFvepHd1JPLtpIRPHXhn55DikoUhILox210zlBAgxKqKPyLU8ADFpl+qSXG
         qxlUSQZl1pt9gdf0kq4jsjnhi/ZJcJHzyVsCepkjPKcZ3LU4kLAvcaHh7WqjHdHHTrst
         863TzOER87ARSutKSXXhH06wE04U4odFyduBIeaF0xvBvY1b5OBuQQnttwstTkpBqTjY
         uAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1H45Dj+ZI6xKoW3+pLZ7nkbBIIZjn06xLFKGSZzRITg=;
        b=D88FOEbOOGbIE4WtP/JE7J3bXDi4dMiHzSlQTzV1CZxmiU8qgGf9Pp8nWU46YdgVoQ
         D3dVZF6HfuunvA4g3k1dTFyLFvp7dfsnzpK0tL5YOceG0OVGGrsDhsJ69I/YN57Yy+NU
         uC5qTZWxqn0ZbVYjx5fSjH8qrr9O3E2g8LrheQAwuXO8ZQ23AMO1FnHj8Nga61G8iix/
         O9YxXJYxvmL8Klzcgou1hV1To+RdZLsg9DAnG2MddP7BjPbE16nhNHmEHr073hDbwOMy
         fbchkEPx/ad/5Yy5sr5NGqUp5DFy3gbCAEw2y0y+unzKOX2Jjpd1kqZkDZBkmaRNCOrx
         0a8A==
X-Gm-Message-State: ACgBeo21TFoevA7VG2R6A1FPHmIE1Os2t7fCZhS4tcNit1Cft4r29oDU
	mtZ5MHjTqh5LS7hybC78xnvcuXJ+GCc=
X-Google-Smtp-Source: 
 AA6agR7157jy+/qcAtPiF2dhwIfvXXmnWkffgawyr7SIbPX7xfNFlUI2WHTTmY1MuCvtFjcW41nBVQ==
X-Received: by 2002:a17:907:2bf9:b0:730:7a66:71a3 with SMTP id
 gv57-20020a1709072bf900b007307a6671a3mr12138965ejc.623.1659940995323;
        Sun, 07 Aug 2022 23:43:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 39/44] python3-urllib3: upgrade 1.26.10 -> 1.26.11
Date: Mon,  8 Aug 2022 08:42:32 +0200
Message-Id: <20220808064237.3975347-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169063

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-urllib3_1.26.10.bb => python3-urllib3_1.26.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.10.bb => python3-urllib3_1.26.11.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
index a8e2073d71..a8d47de0f4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.10.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.11.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "879ba4d1e89654d9769ce13121e0f94310ea32e8d2f8cf587b77c08bbcdb30d6"
+SRC_URI[sha256sum] = "ea6e8fb210b19d950fab93b60c9009226c63a28808bc8386e05301e25883ac0a"
 
 inherit pypi setuptools3
 
-- 
2.30.2


