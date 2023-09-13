Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E4EDEC45
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 11:33:15 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.9634.1694604788386906483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 04:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BX5cXCjW;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: sanjanasanju1608@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68faf930054so3334065b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 04:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694604787; x=1695209587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+xaRGJDpECJqiagZYnpBfK3dzhF/G7CtPyy+SLaM6U=;
        b=BX5cXCjWKC+PX7rWkXHBFbRvJJrblhur99NZ3ASgT/ZNIGvmfsfSJAA4F+lvfOaA03
         jBP0W92mRifsKJBDqQMeFWs7bPBDKiCHBYDhxC0gvqrhnvBOIGzGKzt7rJWdjmtPSw1q
         hp31kVrRfKfizE7U7PbJ/15oommQ+VlhjH8Nkt6qoDSIcbrhQnl8zLyuC7vnHI0RzNNW
         ZLtD1/v8JAbxNh+d0TolZ8rXhm6zKexzb09OIjrpRdeuBYj7jSjkru2YyY1Jx3ChN2Z0
         8sLhINRfI6cbw1BTZN7pDRyRCxz84UaNeSbd2FwUyJS90ZhfuGBlKeJFaRX/dV0lF7mU
         HAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694604787; x=1695209587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+xaRGJDpECJqiagZYnpBfK3dzhF/G7CtPyy+SLaM6U=;
        b=ArJ3y01VlXvTOCaI5PIhOpap5eBmur6Zkob2ldvfiJI4+poBln66brjPULGMeIhy1+
         0jurSVLalBlo0G388t4SPt9KEOPQJXJolgfuqHkJ6e7+ciECfRLtNswoHrCy/G3M7ylV
         i0b/dD6DDHaF8iTyg7g4o54M5qFmI04pPJfqJmAPDCOtyFeyOA/G/kjfwm6x7obIQvqR
         bUROYHlydRqaR5YbnDNJB51uBQKtyC3obBEbBLC9/KFXO713tyh2I4g1HY6BH645yxIm
         Dtt56ui2o7SoKw0YKpsnvskeFA0WpPyCna5GPpTjDSU1UC46EzXLEoP5f+VI142FibPx
         n+HQ==
X-Gm-Message-State: AOJu0YxLBOJzANrLunzZWuMi6o1IpkZZDoCzkdkgoGb3A7aN1szlydTk
	oG5FgU35SvtdWOoFyOZ4CeJY5XrUl6iG6w==
X-Google-Smtp-Source: AGHT+IHJTgYTfqPFQzfTGId1bqGTrgUFbxIzV6Yg8c3YWNvfFf4CuxPcX4NTfcQXbK06cJ4X5hpjcQ==
X-Received: by 2002:a05:6a21:7748:b0:14c:6438:eece with SMTP id bc8-20020a056a21774800b0014c6438eecemr2068100pzc.62.1694604787308;
        Wed, 13 Sep 2023 04:33:07 -0700 (PDT)
Received: from bft01.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id jh2-20020a170903328200b001bc35b14c99sm10304911plb.212.2023.09.13.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 04:33:06 -0700 (PDT)
From: Sanjana <sanjanasanju1608@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com,
	Sanjana <sanjanasanju1608@gmail.com>
Subject: [kirkstone][PATCH] binutils: stable 2.38 branch updates
Date: Wed, 13 Sep 2023 17:02:56 +0530
Message-Id: <20230913113256.585535-1-sanjanasanju1608@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 11:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187585

Below commits on binutils-2.38 stable branch are updated.

ea5fe5d01e5 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS

Signed-off-by: Sanjana <sanjanasanju1608@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..b0e3864378 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "dc2474e7d204c124ab5a21b4490aa46eb7e1d4c3"
+SRCREV ?= "ea5fe5d01e5a182ee7a0eddb54a702109a9f5931"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.34.1


