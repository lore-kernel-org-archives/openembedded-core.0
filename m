Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD05BC7EE23
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:22:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.44661.1684311746721312649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=coxTJOkj;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30771c68a9eso426251f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684311745; x=1686903745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCxIWVB9n1FozS1YVi2/oWKZWZtmX1OJOpRycyrRlqk=;
        b=coxTJOkjOz2ByJ1YGb8SaPG8mre6YWQ59zp4yggcg/dvwnITtPhi1g21nhgmSf8liE
         Sc7lCIz0L+1irUMBKH5nwqZFJhEOaFtSYZ9YOvuXqXKDBPrRDE1rgN+vVeS40ZJZUvAM
         ETO8cI93CgoUg63ndh0C3+T5MuUkLDlXlvKKY3t81MKQ8kPiwVKYH0Lvyrr7ZCYh/Taz
         7aKZHFRTc4z+nzTr7H5i92EHfUiU5Rq2YSLtVJcqmCT7lrsS6Y0TyeFPccSRfR3lVVXj
         4cr5C4MHR1JJIUJNolRGTHirImZe1aIQ0fEg86B4eU3741qrXdrmXa/eA9WNqJDDyNIf
         QpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684311745; x=1686903745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCxIWVB9n1FozS1YVi2/oWKZWZtmX1OJOpRycyrRlqk=;
        b=UhUt9q9vExZcvKlZuSQZS3EmlEzeBEsSOMqVui1IR1V07l9AlZVkNX6/nmxiMoR6Mp
         KMQEGov9pVpxTT3txPPZ/lX308PUOSYBBEiGoIlITfK+gST26YUOcHOX4kAcESrU4W4m
         VmWfqLgzMazKigXaK9I31ZtUp0nOPPPcJPGSz751qejuliV71ucUyrt1FneuubWSe6Zb
         /phnYUZls2QN7MN+BMKtzNhKgnYsxkRm0M4WNU5kL98N/K0bWhi82ypXBS3xI64AZGYi
         oh+bauaEGt0PBZzNfqkClfaH6ZvVpI0QcT209aYDxl55s/xV1DiLVnX7AZK4NKHtcCbK
         Xy5Q==
X-Gm-Message-State: AC+VfDyluNvQ7ba1O3fzd9mgtddm/jNbHkaqRwjSEPZOW4z8MA2EXG8i
	P6GozkPp/hX4q8I5DDF26UFx51vbfnXRVg==
X-Google-Smtp-Source: ACHHUZ41zsgcG5mZIq4Jej6uJICRtk9Lie9/rt8bcYLoZ7/dpQcglJ0ypHrX88NWCzlUFEm8oef75A==
X-Received: by 2002:a5d:4251:0:b0:2f2:7a0e:5cc9 with SMTP id s17-20020a5d4251000000b002f27a0e5cc9mr1883wrr.19.1684311744594;
        Wed, 17 May 2023 01:22:24 -0700 (PDT)
Received: from FDIACONESCU-KS0.lenovo.com ([92.87.113.28])
        by smtp.gmail.com with ESMTPSA id u6-20020a7bcb06000000b003f423f5b659sm1472008wmj.10.2023.05.17.01.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:22:24 -0700 (PDT)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [PATCH] ncurses: Update 6.4 -> 6.4+20230514
Date: Wed, 17 May 2023 11:21:47 +0300
Message-Id: <20230517082146.578-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181473

Latest patch in ncurses GitHub mirror
Includes the fix for CVE-2023-29491, done in 6.4+20230408

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 .../ncurses/{ncurses_6.4.bb => ncurses_6.4+20230514.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.4.bb => ncurses_6.4+20230514.bb} (78%)

diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4+20230514.bb
similarity index 78%
rename from meta/recipes-core/ncurses/ncurses_6.4.bb
rename to meta/recipes-core/ncurses/ncurses_6.4+20230514.bb
index 166e30713c..44aaac3613 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4+20230514.bb
@@ -6,10 +6,10 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            "
 # commit id corresponds to the revision in package version
-SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"
+SRCREV = "b9f9d6304f6abd71a5fdbfd500a645e521edf8b6"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-#CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
+CVE_VERSION = "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").split('+')[1]}"
-- 
2.25.1


