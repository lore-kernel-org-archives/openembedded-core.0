Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.8136.1630503946070203838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R3/XlrPS;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so832175ood.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3CJ6ijbCvm7oC1al7EOrYvN9T1CRP0te8vyPh10ER/I=;
        b=R3/XlrPSPqduiANxrRiTQEcR865THdcgRwXs/lfOIsA5l7bSqCxNqQXodm0TuIXY2n
         mn/TE5igryKz6ljpK+OCMEA8y/QCJKEI7eUYYbmZP6IcpIKppzw6EueCn0l7/sUDAX3+
         8L84SEJLdiw5RkNpel9SFOsg8hvb37YQLi9X45HX4QEhr5R7zFnG40UY0ytD+W6/5E/y
         6P98Xj3zEwrwTYT0sef8WdbMwoSyoEm6KqCWaIrYo6iIDjCWt/G/SlfCxXCCxACgcQ/O
         9a2EhBg7JE8WSv3oAS7P6FKOU+jgKecm5z+nljP3r+Gq08vQNHUTMNwHdVFE8l/UQJYU
         rltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3CJ6ijbCvm7oC1al7EOrYvN9T1CRP0te8vyPh10ER/I=;
        b=TGTfZ6Xqekwl7qpIJs0IQa5ySmnTDs4szXEU08hcmXlOdKY0QmMZdiPH9dSHkra1Wa
         svmui+jise5Z18XGaEq2Tiz+kkaHDzkFoFvctFeUdr4yilT3VDx5OiLTeeibRzAWHp9Y
         DohdDrwlKi1/fCoVbGXGWvz/mTpJIwm/CZKOyNvXP5sLxPwpRaUFKh4IRybdffLPcXF8
         OPNCbsaSxGftNDH/AtrUWEOPZhgAWzQ2bTjJpijZiqXDqr0ffHCQtq1sq1dQANiDN7pY
         5NO0tlSj0T2B/HYkU/3ywB3HSOhvUKxC6cTXYu4umxT2Mji/AfOis+0n3zLEiUfJpfv6
         68uw==
X-Gm-Message-State: AOAM533qpSzzV125+ojdwnv9Fb6ex1oLDcfPb5A5OYsVMjFo8ov8LFrF
	kXqEDkjSID0nytEmz+Bs8h4MacaP7iE=
X-Google-Smtp-Source: ABdhPJzgy96pi+2PmfKjtMMBtQArn5Wgq4f1oOOygBRPrVkDc/MqOGZfaEz8QHZyNZ9teHJiimxqQQ==
X-Received: by 2002:a4a:a40c:: with SMTP id v12mr19070464ool.72.1630503945162;
        Wed, 01 Sep 2021 06:45:45 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:44 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 27/31] libjitterentropy: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:06 -0500
Message-Id: <20210901134510.29561-28-JPEWhacker@gmail.com>
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
 meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
index f703c089a0..d9fbb5e9d6 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.1.0.bb
@@ -4,7 +4,7 @@ It does not depend on any system resource other than a high-resolution time \
 stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
-LICENSE = "GPLv2+ | BSD"
+LICENSE = "GPLv2+ | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c94a9d191202a5552f381a023551396 \
                     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
-- 
2.32.0

