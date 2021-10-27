Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5CCC4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:43 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9292.1635325662972435534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M8J+m8Eq;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i9so2900163wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KWVPFsABOZh+NNb7GDGpXx6mLDrWKj7uR5oopOLpkU4=;
        b=M8J+m8EqesjO4K+Jy7ZL7gcTTzHb5P49iRfBtS7QMlAKjjhYHe9YrZlPy2xNkFYGno
         UUophQ8X5QQRJ8QeHEHSMU+5fzyl+VLu3n/NR6cgCJAynOBTXQTZBPCp1yMyOKnE8qbV
         THodyRJRsJnZSKRp+fAsEohXge9Bj0PMGRQoo33WIu0qWudmk389z3nChSmMwsVJFePN
         E3JaHCN7pv2csjvgWUOp1wgogSZcJzJf9+ePBa/PdUQu2gisF0MDKPzWXfL7gQ4xYxcz
         jnnUPbmcDjrO0LSw+XTVfb43ezwlleGXLmlSjh+eVQJC4Oe1d+QVt4LhApcy/rtNUyVK
         Fkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KWVPFsABOZh+NNb7GDGpXx6mLDrWKj7uR5oopOLpkU4=;
        b=cf3XKSjo4AuVp/coFBSBOcauZku+bxHOGY3fsdnfjnQAAId84jCACHtuMskav2Zv4r
         TAqBSbUauxF18CCHn/TI5llwXOvBLRyjhnRVFCxi1e+a6Bg9bLYn4nxwZRa9v2I9X8/b
         UJKvF9N92D5sFd/CNrN8RJ7zjbYy6Iol+W+rPGivltVaFfKiaYxrAc7JaAWnDtrlzuFg
         vs4fDjnh7RrozbrFHLbag4BQxW6mDNEQcXAJD1AQhXcrA27xf3zyLXFRA0/zc4hXgQys
         KhN5g4OY0dNRh998dgH9Wj3bskNev6mThtvOIfU/vjmaBv+HrX+de/j/FuD/nzX9iZ2z
         Dslg==
X-Gm-Message-State: AOAM532uXfHGffj/PBtnPIkYFaus8U9KxWFhcDjCeXol3AcH2+ki40As
	NAb8NBn2xGWTrRMfghoYhU1Nm3LcCQ4=
X-Google-Smtp-Source: 
 ABdhPJwGEpvTIIMQpbtyNyJeSK0vHQGzqWmd11S0xaptTfWZw4n7XC94WKJ1ZgJ1LDkYt6bCzgKdIg==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr39307137wrs.190.1635325661586;
        Wed, 27 Oct 2021 02:07:41 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/30] python3-numpy: upgrade 1.21.2 -> 1.21.3
Date: Wed, 27 Oct 2021 11:07:11 +0200
Message-Id: <20211027090736.2546759-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157481

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-numpy_1.21.2.bb => python3-numpy_1.21.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.21.2.bb => python3-numpy_1.21.3.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.3.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.21.3.bb
index 8e09585712..4a289c2c7b 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "76af194fbc117934ec5bbe2ff15177adbd05aeed23f18ee209ed88edcd777e05"
+SRC_URI[sha256sum] = "d0bba24083c01ae43457514d875f10d9ce4c1125d55b1e2573277b2410f2d068"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.20.1


