Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web09.8187.1630503936349584146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FVlrVkOF;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso3583223otu.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qHoyTQHyfyJ6RTPKur1ZN2o6p/sZECktnQ11gtIm9Hg=;
        b=FVlrVkOFVUAmIgMoG++2Bo8feR19OWzBZX8RLO7ofIb9Nkzh+WjcFnexbym7aphd8l
         zEDN2YDC8p3Gfuz9/bV2cdDKuWkEYRxmQ8WikwzV7VPwJhIYutZ7otZ2n15KPFSKmaE1
         pGwo+hAwrUiyEHtAKK3KbfV4e0onZFjHZNDschJla1x+8UwOfctNO0QSgk2cpHVg56GJ
         hJyRyOoVgF2UeiMPalbg8ilLneGtRscWmS82bTjRGvCKdifbgiDK4qf3h8Z8Wu3F6wyR
         WH0KsBByTp9yPEUoBY5TUY+Orxulp72OUDJhQliemuMk0W+r4k/V0ExTyUdcGulqr9rJ
         0qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qHoyTQHyfyJ6RTPKur1ZN2o6p/sZECktnQ11gtIm9Hg=;
        b=Ge24YqQtQUopyZYNj0Dz7WL3GXZ8eyzcFhlzoeVhUcnN0YibBJPHSD1R8NryL5VyJ5
         ke0+CyJ02rw2ZoqfAm13yV1aS+ha6qJIGMkhgdj4/LHowqO0ruOFmkfd+QFEWEfQoKPi
         HJr/xRB4GZztjzYrLp5a0IC5Mh6vc2TBLE/ck+E9iYxiMVEl9RQoPozn0T6Feu3hzEG+
         9XD61SWqnUGKLRnXrdXPzYEw0LYxNWEydXaByPZbsFf4qeG0sCMSevDjqfNjo8p8o3iY
         ghbvSBfFqgYovM8oflO7R6EJ8S0cXQpQA0AQn+EJnpzS4fYPLg/MpDNpON/Nswrl3C4U
         rlEQ==
X-Gm-Message-State: AOAM531jxgFw81ABv6rM53Sd5BNKPnoc7CbJ0TbsFc7DpoAOExkW4qZa
	1bqbvQ39gd0RhQt0tWCuK0ec6rsJywI=
X-Google-Smtp-Source: ABdhPJyFOvNExFDA+Y0idiX1lSRa7b6661k6gIH+6c2zgEl2dPEGN0G4O6fSOnXsnb4xUo4eqykg4g==
X-Received: by 2002:a05:6830:237c:: with SMTP id r28mr30354777oth.267.1630503935455;
        Wed, 01 Sep 2021 06:45:35 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:34 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 17/31] classes/create-spdx: Comment out placeholder license warning
Date: Wed,  1 Sep 2021 08:44:56 -0500
Message-Id: <20210901134510.29561-18-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We don't want this warning causing problems on the AB, so leave it
comment out for now

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index 6af4181087..a590ab596a 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -88,7 +88,8 @@ def convert_license_to_spdx(lic, document, d):
         if l == "PD":
             add_extracted_license(spdx_license, l, "Software released to the public domain")
         elif add_extracted_license(spdx_license, l, "This software is licensed under the %s license" % l):
-            bb.warn("No SPDX License found for %s. Creating a place holder" % l)
+            pass
+            #bb.warn("No SPDX License found for %s. Creating a place holder" % l)
 
         return spdx_license
 
-- 
2.32.0

