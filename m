Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2D4C4828C
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 16:06:28 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.17679.1706717181120621055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 08:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DRLfthBt;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: bbara93@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55f496d60e4so2582384a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 08:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706717179; x=1707321979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+q+zCb6nE6GwTLm8JeoUAIXbwyGbRLw8NOQqiazT1U=;
        b=DRLfthBt1zowuDvcimIn6OX2CBy09cbJP0HFHteSjAmCF3JKR+/kR5G4tn9m1ZQBXr
         meg6Nd8+JbrqV48pkpEVBsP9Wwr6SIxD2D22cRCJVP5EtjAzbX/ncMJZFy1AZf7in/VT
         tHzaLSZDHLhRbWlf6IF1Dwlfb6KmGdRUBJPIJS+hz2FqQf4VIyBrpafXMuNU6u/SWyGJ
         r8C4dz+S8378H/PGzFqvuNeJVflHzWrD7W3C4mjIK1LNq8Wv/0BJWehnkBkdysmF4qkA
         mxf71CuDMNb0z2m0Hr968Q12BvHbvcKSBegFlvNmFOSpgXLjCW00t+yofPXxXwfeVDze
         jDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706717179; x=1707321979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+q+zCb6nE6GwTLm8JeoUAIXbwyGbRLw8NOQqiazT1U=;
        b=lz07kTs3IBWXs0DwR9BgV5bGpoS+1r0n68ipLcRokGB7GRCCdnfwbGgbOsohgBGQA2
         HF+59Gn1z3HbapitsVUUCkKNnMx0kRcHrfYyYduhN577niuvJFxYfAEjItVgnIBem4u2
         tpwoW6BdTZb+0m7uMsvZwkZ8PpEgP38KWv6YbYaGhVSYkVo0lcg1QDWCMeUKIg9Rsp1H
         0X91LPoEDIyfAefyV7rYZqxlVwT4mmniUua0RVjIXVFftU8Zdm2vfoTIsQQa+85Ffs5s
         NSfMjFcxeca6wIlt+C71ylbU0E5O/Jg78y+izzWgCPw3PxWsFIjuRfiabfCZArZSridn
         akHw==
X-Gm-Message-State: AOJu0YzQ3ibEqg2el2moKjbM5rnJpeIerWjQSRsE9W4vSwfgvxwRUy0h
	e5SH03qXSKUOugYi2n6u+xRAPWCmU77gJVrP0iKFl6R7a3dki6fDG54py+BWzCI=
X-Google-Smtp-Source: AGHT+IGl4KiB+8sxWlUDmTEzSfmDJHJcTNVhN06cm2Jxu0D34e//yTuNv4Fse2b6awXp4R893ynLKg==
X-Received: by 2002:a05:6402:2682:b0:55f:a432:5c19 with SMTP id w2-20020a056402268200b0055fa4325c19mr256899edd.7.1706717178997;
        Wed, 31 Jan 2024 08:06:18 -0800 (PST)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id bo12-20020a0564020b2c00b0055f63ed667esm941651edb.57.2024.01.31.08.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:06:18 -0800 (PST)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [nanbield][PATCH] glibc: stable 2.38 branch updates
Date: Wed, 31 Jan 2024 17:06:01 +0100
Message-Id: <20240131160601.1336291-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 16:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194527

From: Benjamin Bara <benjamin.bara@skidata.com>

Pull in fixes for CVE-2023-6246, CVE-2023-6779 and CVE-2023-6780.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0ef4289557..83c28ae0b5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "44f757a6364a546359809d48c76b3debd26e77d4"
+SRCREV_glibc ?= "d37c2b20a4787463d192b32041c3406c2bd91de0"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
@@ -11,3 +11,6 @@ CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-6246] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-6779] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-6780] = "fixed-version: Fixed in stable branch updates"
-- 
2.34.1


