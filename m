Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7715BC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.6557.1635842600496371519
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q4iKYd/+;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so1473916wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xv5YcbIeesFaJR/Vam9ufIZKwKm7I6j80kFBe91Z0d8=;
        b=q4iKYd/+v+PxEVsIqmgdnzAORWscmx0BZSWPJLSdGiniC5Rg0QV9t4l1ZFDw9paMhK
         Z7CFwgKrGhhHTT+MK1ptoaMK/8XRiEX07A1hMiqAUHSWjf9p7hGusF6yz6TAbk4fhCOy
         3EtnTppkgVcfwBEU07TtO9N4lfraOZOk7kK2YKWyUMUruOov/nYp0vy0G98jfCmQMqkn
         tddpWr6wQToXCZSMdjkX/IsLuT8hsczsEkee7FYkaCn0s2KSzAmj/7qkY/f29ynNyqrq
         UvWwSW4Or020hhfcziGCj+NUpN/AKUtZtgRlVfE0kgqB3qV/ULxG1UlJnaJg+qRZzx5x
         0JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv5YcbIeesFaJR/Vam9ufIZKwKm7I6j80kFBe91Z0d8=;
        b=XeaDVX2+Rn93LKRrM+l7fxmmBqS2+tkH99v5gM5QxfPid8M5vAqRCadL1IG2UgpDfG
         SmqquRIjzJIfivRWlHIoisQQsCsRu88UfZLfne3S3accIJfB6TO56WThL6PzUwfmWZqb
         WRsn1re6z4o4xfzxq6Hhv7M0Psy2oyEwQjDgQncOQ3srctRPLEfEFiok5qC+0Wfwjcwh
         572pRh8pSzu4o3z3A6ck/8N762kOOT131n/2NN7CdMbJqKHXA/cjgg+BBuFyjlVbMkZw
         W5mLZhAYkKy0jkl0W50HaFJ/v8gdCwOEDA/0joKg2cYnAS87u/DIOvj1u6BCaJT1O4DZ
         /YlQ==
X-Gm-Message-State: AOAM533gWfglj+RjcCbv9Sggz72eSj942qaYtw9/vg4m0sZHg4qO+Fyj
	ImL3d1SMAF9TBAtEC3f0jU9Mmy8HocE=
X-Google-Smtp-Source: 
 ABdhPJzNkSwxRI7800rgDHmGPAE3amOtH30QA4rLnccJrpxh6cGzngzYIKUz50OlyIEgp8ctna5DKw==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr5253180wmq.62.1635842599085;
        Tue, 02 Nov 2021 01:43:19 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/33] diffoscope: upgrade 188 -> 189
Date: Tue,  2 Nov 2021 09:42:52 +0100
Message-Id: <20211102084303.2974802-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157760

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_188.bb => diffoscope_189.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_188.bb => diffoscope_189.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_188.bb b/meta/recipes-support/diffoscope/diffoscope_189.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_188.bb
rename to meta/recipes-support/diffoscope/diffoscope_189.bb
index d4fd112e37..d3c70b47c5 100644
--- a/meta/recipes-support/diffoscope/diffoscope_188.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_189.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cdbc401c78d59779ad8ebbb8e2008166f912e77c7ed3be8dc788d36948712ff5"
+SRC_URI[sha256sum] = "2ec8d94af13e905ec1a905ebfb2654971cf977b149d296f8bf2aeff6bcab3d8a"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


