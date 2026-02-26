Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A526FCE065
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:19:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68801.1772108332970614995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwN4S2g1;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so9445545e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108330; x=1772713130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYopNC7JPLPLD0gOn/aPQ+qdFNxRLBUeuT1b+eDTt1o=;
        b=mwN4S2g1CHFvlC3ZPMuGMGBCEXXGg8Wuw2zkcEjamcaicLjkrZBcoD32kZ08wXmTBS
         h/+b5+D6Qqa2JQ3ZoNlA289XfQuNuiJQS+2TAb43zgyb3hfdxkzoTbkN0/UoU0jt9KAa
         E8fuSpGvP3jn3UpWsd1Ft1ICjlZM9aUR72S7p1j+dv9xSP6zCxAbDu16ZiR85wNwT/cH
         HCVrg3QxCgSgqvaXspoUk7vSA6VqvKlbZHah3LiFS1FHAyyhKA6o0VoSEdA1L+hgT1pY
         jwC00efQy1oYS1ui+CXOtUnsTB3RZBO/WUfF7qNJDREjsJjPc0krMRSOkj/B9r6Rwty4
         TM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108330; x=1772713130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYopNC7JPLPLD0gOn/aPQ+qdFNxRLBUeuT1b+eDTt1o=;
        b=fJB9Xa9rTgt6BxoEHa+XjkKmu9GeUQb4dvRDaogzko16nypxqONGEGqdZLGtzq/v3g
         MaCPT32vHhTyp/9ulk1Vv59sOfzVQrmy0pMFr7LZBQhF7YkcbfQYEMBr+GynAsEDFJ2P
         yRCRC+ZQ4QaAoNesmcMz2s0ZrvlQ2vC+chNUW9/e6fme7GFqwARjmTgDcSTWq/9d3gP8
         ie53GFTj1pvmB9a/VUhYTm1felXd5NTf0dU2dU3RtwA0ZXsy1nVv0ihjvxrN352jsZ2d
         I/slK3F+6JY5MlYr+aOyDdJKOZk78Gy1LuEDXo2RIwsX5FNH71c/UyLD/El7LKJrG30j
         13XQ==
X-Gm-Message-State: AOJu0YzSpsW7hyzJgukgoaohG+NjB/qVtaVZjx3JCir2G7Hl+HGBwFT5
	GtGt464zWleOt3fpgsOwU1/eEn41nJ5aRsI8MC87mAc08aUP27o+1BWaKH0JsQ==
X-Gm-Gg: ATEYQzxgVkzmZJeEMJwXLraEXqysHrJODKHRwz3CliHop6jGvfkzGT3mv2K64zGB71m
	l/sXlnECbGp6sPfKCp1CZfRPujACGdzp/Lqv80jOsZQBPfQlCTd0QHno2xyGKIUI+9jRSzZumLw
	oGvkcZonQPXRewskfe71hs2Rqu4akGBQc0ZRu6EW4vIySJKmeqc6fqT3hCG63lsoRqf7sJZ9V7h
	bLz1OaFUl2sCiB2eWZrcQjsrqqAewsP/XJUWA+IGgpoJGDvzNI52OhS3g1JrHfPCsgE2uMZnKeb
	BH1uBBBVEVRiRb4aIqIQhayg6x0oqiuxv41lHoPUZQeZT4VfIxviVJGTLF9sjuyw8B0L+E+yyX0
	npwfpBH/iP8JgQDdwnBkf7kZ9QFX8men9/JSddpZCZSiMsDPt1wiCwrabMxcV0tjoPi7A3xuNCA
	rODxzl1A==
X-Received: by 2002:a05:600c:1991:b0:483:54cc:cd89 with SMTP id 5b1f17b1804b1-483c3dbaeeemr27127485e9.9.1772108330469;
        Thu, 26 Feb 2026 04:18:50 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:47 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 07/11] spdx30: Include recipe base PURL in package external identifiers
Date: Thu, 26 Feb 2026 13:18:19 +0100
Message-ID: <20260226121823.149327-8-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232012

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Include the recipe's base PURL (from oe.purl.get_base_purl) in the
external identifiers for built packages alongside any PURLs from
SPDX_PACKAGE_URLS.

This ensures that every built package has a pkg:yocto PURL (e.g.,
pkg:yocto/core/zlib@1.3.1) in its external identifiers, improving
tool interoperability and supply chain tracking.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 8e1492ef20..9e8cdb4fa8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -855,6 +855,7 @@ def create_spdx(d):
         [oe.sbom30.get_element_link_id(recipe_spdx_license)],
     )
 
+
     dep_sources = {}
     if oe.spdx_common.process_sources(d) and include_sources:
         bb.debug(1, "Adding source files to SPDX")
@@ -888,6 +889,8 @@ def create_spdx(d):
     debug_source_ids = set()
     source_hash_cache = {}
 
+    recipe_purl = oe.purl.get_base_purl(d)
+
     # Write out the package SPDX data now. It is not complete as we cannot
     # write the runtime data, so write it to a staging area and a later task
     # will write out the final collection
@@ -949,7 +952,12 @@ def create_spdx(d):
             if purls:
                 spdx_package.software_packageUrl = purls[0]
 
-            for p in sorted(set(purls)):
+            # Combine SPDX_PACKAGE_URLS with recipe base PURL
+            all_purls = set(purls)
+            if recipe_purl:
+                all_purls.add(recipe_purl)
+
+            for p in sorted(all_purls):
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
                         externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-- 
2.53.0


