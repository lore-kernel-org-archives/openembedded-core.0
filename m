Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.19468.1608974883431680969
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SrZLsxSu;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id cw27so5573616edb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qpOu0SAb+LZGPk+R1B2ljvh2OdO1BpPao+xF3zGDEzA=;
        b=SrZLsxSulzvNOQIb8G8YofMhej6V6ydMmIGTtQYnZPOAYZ4rkaqAsLSvPsvyuvnFE0
         +ojf6+ag4HTEIEX0GERiPzNbuAHshMeV3XGImIaZ5AhEz8lUi3kTa835uWK9OxFpZn/F
         OTyNu+5tNXYGp0xTOR9VtcIGcWfKvvs/ZrVEJTk2GCLSlJ+WrKY65dVPZvN+7H4Qb5n3
         Zu/+7QiAtzra15uli7LmyHnGbP+aLxk8PmKgXToHnNHUpS1A9xy63dfSPaQ6Bovnn4D8
         rJZaY6+xH+e/prk+d9UZXeQszvLK+H0ERpqswHQe1H/vOYnIAPSYOej1/atupN5o4OXy
         He1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qpOu0SAb+LZGPk+R1B2ljvh2OdO1BpPao+xF3zGDEzA=;
        b=Nsm8elEF7jnmPu09kPnQA80Jip6CuW1d7uT8Mng7+KlYpGI24UtwDApylRmZfzoIy4
         hyx0ktn6esJuoqNZq6TtvjKlrvQO5ZVHocw2FpA3RbSMGvzc+msRjV7owkMWbQZGBdKH
         JOgtOv0fzoYX2vCb8qz8nZDiZMx7xpgdovd0ikcGe8nq5kocuBeawig1D5nako7IwaBC
         jDRRY8V5ugShHdS/vvkUB29bEzA57yZg6JAxhshvmbliLx9uCQXjejvbe/siLpJh89/+
         bl6zI0GfCQErByqpITQeg7gMcdAAMnlDoj0nkQQstUaeKjaR69Va0IIM0xICOjb992tG
         Hx/Q==
X-Gm-Message-State: AOAM530VTXCtOwDMg/0oKi4R7sv0c/1l8qif2TADwevMrK9TlxtThSCw
	/SS9SxQTAchaA+Kve6oNJjBHX9K5wJQ=
X-Google-Smtp-Source: ABdhPJzx6+5ySsKF3SZB7+BkQsJ395eN4FQO/zVBoxC9LC2RF3xw2hcDgAy9Myxi0OTwJtVe4xTIJA==
X-Received: by 2002:a50:8741:: with SMTP id 1mr35195361edv.349.1608974882099;
        Sat, 26 Dec 2020 01:28:02 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:01 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/48] sqlite3: upgrade 3.33.0 -> 3.34.0
Date: Sat, 26 Dec 2020 10:27:09 +0100
Message-Id: <20201226092732.52323-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../sqlite/{sqlite3_3.33.0.bb => sqlite3_3.34.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.33.0.bb => sqlite3_3.34.0.bb} (83%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb b/meta/recipes-support/sqlite/sqlite3_3.34.0.bb
similarity index 83%
rename from meta/recipes-support/sqlite/sqlite3_3.33.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.34.0.bb
index 33f041a161..19996fc064 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.33.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.34.0.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2020/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d6956bbb15"
+SRC_URI[sha256sum] = "bf6db7fae37d51754737747aaaf413b4d6b3b5fbacd52bdb2d0d6e5b2edd9aee"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.29.2

