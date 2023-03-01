Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE04C7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 18:11:00 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.30588.1677694259216602420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 10:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LkC/YRLn;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id n6so13526818plf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCNqm8EED06DaAMDM25SQNKLpw53WERjhg8fhzJWoUk=;
        b=LkC/YRLno0t+y+nxmHcQf9tUTuwnEPdp0HGVALj3W+RItmGUGEZ3jDRXqX9p5cEQNQ
         XXa8PaJvupyIpHL6JJYuLKMb0DU/i2tz1x5Hoy7AKk5tGbmwEtRCK5btWHIzT6FZJlH+
         9nxHmu5moMYVgSpan0YnDu5camaGxAKUlFikpx/KHQgZX/EjYIgN5Z363Dhbpm3hqTzy
         RoJ4Octg3pTaT1pFm+6/KX807IIlw+KSqM63Pt2+rZAPaoUldQ5lAEGDO128vtJ0PaPv
         lxG1IcYkrqkw9UUElxzxtsnQXDbgHZEzyZvewDd2HEnkGRDzOfjNuVpPIeduhtOlEuNQ
         MkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCNqm8EED06DaAMDM25SQNKLpw53WERjhg8fhzJWoUk=;
        b=3+sAZ8tBCUt5rlPKMIOGkKpbtKPHT2kkGeaHWNy5ONGRHZRM96m6gvUlIZ3GRlErxE
         bXKBLZ9C/ESCiex4B0nymlk/iA2zieKC69HKcYgyssYUhY0f4ZYaygBfr+wNdkntq14G
         qD3r8YXct02sBq2yD3HN1trrCr5/YAYoGnWVR/oHHApHcXxr6YwfhzasEMtIHpbBo38O
         ttpaS/vNvPrdSeYW3cDJVC5jXEb9Htc2WFLUoin3mX1kC1dSy2clQYYpAyHAZ5RlbvqM
         qASxfb/vI/MjSJy5xczb0qk5QmrDXCBPZrWkimAG3+iypAXG4+WJpvno7mQ3urutRZrz
         wQ+Q==
X-Gm-Message-State: AO0yUKXxg25sHsSVTzxOZFNxwVwGjHDyEv6h6/Y/KUIKZx4lK1PhP4lI
	m+NjGT4qsqKRITscCi0FHg3PfqfBSZ/aIg==
X-Google-Smtp-Source: AK7set8AhqwV3RGP4dINXfk5mX280m9Km6OHi9XMwEEMJ1Izfyb+enrQiK3k1NrUHF/djUS1B0lQmA==
X-Received: by 2002:a17:902:db04:b0:19d:90f:6c50 with SMTP id m4-20020a170902db0400b0019d090f6c50mr8528160plx.58.1677694258211;
        Wed, 01 Mar 2023 10:10:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:8ecb:2eaa:9ab3:bdee])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902780500b0019928ce257dsm8715614pll.99.2023.03.01.10.10.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 10:10:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-more-itertools: upgrade 9.0.0 -> 9.1.0
Date: Wed,  1 Mar 2023 10:10:39 -0800
Message-Id: <895d4baa2de54ed384821e87918b3f8493d7c11f.1677693991.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1677693991.git.tim.orling@konsulko.com>
References: <cover.1677693991.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 18:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177947

Upstream docs currently have a typo showing the changes as 8.14.0
https://github.com/more-itertools/more-itertools/commit/89d58c2ec089f3df54ed6cc9279949b8e2bbcd29

9.1.0
-----
* New functions
  - iter_index() (from the Python itertools docs)
  - transpose() (from the Python itertools docs)
  - matmul() (from the Python itertools docs)
  - factor() (from the Python itertools docs)
  - gray_product() (thanks to haukex)
* Changes to existing functions
  - sieve() was updated to match the Python itertools docs
  - maxsplit() was updated to fix a bug (thanks to abingham)
  - sliced() had its type hint updated (thanks to ad-chaos)
* Other changes
  - The batched function is marked as deprecated and will be removed in a
    future major release. For Python 3.12 and above, use itertools.batched
    instead. (thanks to neutrinoceros)
  - The type hints now used postponed evaluation of annotations from PEP 563
    (thanks to Isira-Seneviratne)
  - Some documentation issues were fixed (thanks to Voskov and jdkandersson)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64

 ...-more-itertools_9.0.0.bb => python3-more-itertools_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_9.0.0.bb => python3-more-itertools_9.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
index fce3aea8977..7602350795f 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "5a6257e40878ef0520b1803990e3e22303a41b5714006c32a3fd8304b26ea1ab"
+SRC_URI[sha256sum] = "cabaa341ad0389ea83c17a94566a53ae4c9d07349861ecb14dc6d0345cf9ac5d"
 
 inherit pypi python_flit_core ptest
 
-- 
2.30.2


