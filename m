Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FCECD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 10:52:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89053.1781347928022733160
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 03:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RArEc7LF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso1546963a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781347927; x=1781952727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGROsBkmAegcD8It85yfaDykjGY791qWEz3HIVZwa1c=;
        b=RArEc7LFCoP0hUezqjLQ+2YA2m5Xnh0m66dMFN/w6TF0mNdPa93IUl7gvtWX0UxC3x
         +gonTEUv8dzR6klUB+JOXobLzK9FuSCwUYLHPitXpK6FGnkFH23V+d3ICkoJyREVKwGY
         rTyg90n1O91OdaaHBhqnEzjasbIDHcyzZzGX+Z4hRddfdggOCQlK7fQlPizbrv1XJj3t
         bcmFW/HsNMWtQjQnuCw7X9dZqyuEZBarWtg3oAfHaoXqpMA8p/VH1DOg8wxyHIjbydl0
         ExDg3fEb05PY5Rd0m65pCXhkaeTReIYER+jVC1u91lrM6mIiWkQim0EZJVMsWzlMso0f
         0DsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781347927; x=1781952727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AGROsBkmAegcD8It85yfaDykjGY791qWEz3HIVZwa1c=;
        b=gAU6wLf0gNdK231hOasCDQfhjFu1h6TuTHxI8tNhs331+hHEYD5canW0Os9RFbLRrm
         10FI+SGce/6yWu1IJ9S1y6aVsZ8U7dVA1+rY54umeWBEthOyUDeQGrRvcubFK7xDaRp8
         PgPm+zcpiZ4L7EFwbYMISGgfhMJPyLndZ7mVXtvRMpYEHMv8eRUPN1Si25ZjUbxP+NV5
         zgStLdGpzafIR8aDemHVC/McatB5VhdqrW+Y6d5IlnSmN8vK9nCvzov0iPhYyVqSIVwv
         LMd8dd0IMceBXHcnhYBz+ZLNtUREhcZrE48DQTyF/eQeWIvV7vVUM0DeDoZ+mL2V1IBb
         LdqA==
X-Gm-Message-State: AOJu0YwN3Hib6K/k31Y61mT7/3DbbnGPqOm06koSTnRoDYqKhpVG/2FD
	uyVrZtz8PvlMrwKmQODc2NjuFswhjz0/44GghTVtXyFjzApQp8K8V5GFjLlvleeM
X-Gm-Gg: Acq92OEK/uqTmnaZg7+e9Fibcwakwq6HObxEIDk1bjcT6z6Gfq0qAoBzGbWhg0I/AgL
	5o9SFMOQQ427MKL6qWXtf2jw7eruQ/P/PFXdkK4PfZkNvtW2KVcmA8/C56zNTWDtiuzEbijSCNs
	S3brGTq6fccx0pGpYvLPvOxxsJ7igueHsIFoUxkLIGDprX+11s+n2Qz61eN+jO34UHgQPixJPml
	rV7yV8cAhOFs3ZpP9rsVRlOnY4jsYgbCKhVa48k1mYmq0Uc4ByMgvJOtUvKgQLaFik16SULvnI9
	yYbcV7W7Uv1WiLaZaAzRHxmN7PsWVFkGlS28y5pYzWQEAv95ChEjhlB4n3JFaXEgl0JlOL6g03U
	x2VfzRc/eTLHDI/n0y3a38ZMuh3/F1OPVcoBzh66CxXahzCziLZJyDqEqZMWm1pPxPOFflSiZIO
	fdr/iKvWr8ww8Bw4rd5FPwBXUjeiMoagreJHwA
X-Received: by 2002:a17:90b:2f8b:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-37c2bc96446mr2954768a91.10.1781347927327;
        Sat, 13 Jun 2026 03:52:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm3222322a91.2.2026.06.13.03.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 03:52:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta][PATCH 3/3] mpg123: upgrade 1.33.5 -> 1.33.6
Date: Sat, 13 Jun 2026 22:51:53 +1200
Message-ID: <20260613105153.3895524-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613105153.3895524-1-ankur.tyagi85@gmail.com>
References: <20260613105153.3895524-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 10:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238675

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
http://mpg123.de/#2026-06-06

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mpg123/{mpg123_1.33.5.bb => mpg123_1.33.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.5.bb => mpg123_1.33.6.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
index f8c08ad1f8..f07e6dbcd3 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.5.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "0d7ebc8da0aff3ca383c8c6b5a6adbe402ee5bb256685b8c5499f3a739f9d6dd"
+SRC_URI[sha256sum] = "929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 

