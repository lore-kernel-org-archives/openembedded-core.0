Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web08.8317.1630503942953192541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RXCDab/l;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso3583779otu.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JsWXHgz8dMMn4qLSnpLYlm89Yrs3I4ZjTqwzhznhTfg=;
        b=RXCDab/lGuT4Xbec3rSGsGhaIphKds+k3nWqgJPjZI281rhPsQam+se6pYWPtsMXDm
         igv0W5BygOwZ5yuOBUz3mYvDavtc1znZwe3LZTvxXay5jDuyzIF92v2V5BoSfJ5cK2mf
         qbsPpaGwYqAxby4CAlPdZEUU35UVX0KfMo2ElWJ6FJlfSSzNINSIpklU8t/eELBi30oQ
         /5f5yFYEvqiBwlmhy/tvrM9iYDZCt/pr9Qh8Ke4tCiYt27sZfkSJGHcr0tgcOSenQj4y
         t2mNUCRWrAQrwElrniAzaLa3XCrbVJTgf3Ml0LuNWuCS5bBxUDv5JKIZl0spoTAWmzt6
         Ygng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsWXHgz8dMMn4qLSnpLYlm89Yrs3I4ZjTqwzhznhTfg=;
        b=igAGFHgvhxqNhFpSn21PRfnO1WrdpmVTy7PGUe3d1Aav2SG5PHUPKucbMHff3/D/Un
         tgnxrI6qWvP45o5duLzlRX6U7lFdnA5p7FU5GepYQfT+31AHEAksq2mgnq96wNnqlpO8
         JDs0sFTlR+LURf2vq+9QgA4shOCFoidX86mISys2sqW0deLj7Ig+ocvu3msXe7xHawLY
         H89OcKDsbqR1wV5eKZKUCSqOvaGbu4flaXdjZZnTXNIRF2ab/ZIgc9aB/2H0hnVtBM9i
         5YSJ1+SFFeg9u+HEGmh/06m/sXZj+grYTpOzdhwnuwLS3GvFcDAGVNTTW27cVOebCiye
         hulA==
X-Gm-Message-State: AOAM530IOQQkHiM9tKIdtzfPDXeu4lPh92XL48j7LvBrLFIOkrsISYDM
	DZTt1UPvywx7dq1LFp+yCfs8dpkWz54=
X-Google-Smtp-Source: ABdhPJxe8gL/3axyFDdzcC+ptWOyUbrxgyhqS0PbjzX/JjVFn/COBNXoRyjKvHgSCkDrd3zI5Cyzfg==
X-Received: by 2002:a05:6830:25d3:: with SMTP id d19mr28605777otu.357.1630503942039;
        Wed, 01 Sep 2021 06:45:42 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:41 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 24/31] libcap: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:03 -0500
Message-Id: <20210901134510.29561-25-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.51.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.51.bb b/meta/recipes-support/libcap/libcap_2.51.bb
index 3e653e371e..c9c30fb05f 100644
--- a/meta/recipes-support/libcap/libcap_2.51.bb
+++ b/meta/recipes-support/libcap/libcap_2.51.bb
@@ -4,7 +4,7 @@ These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
-LICENSE = "BSD | GPLv2"
+LICENSE = "BSD-3-Clause | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=e2370ba375efe9e1a095c26d37e483b8"
 
 DEPENDS = "hostperl-runtime-native gperf-native"
-- 
2.32.0

