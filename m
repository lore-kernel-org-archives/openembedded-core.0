Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF913C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:10 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.1724.1645114210319326397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mP4F41FK;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id lw4so8392499ejb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/yNwzNgUI9q7WkupLYdhg2+ej2Z6eC0xOWv07WDw2oQ=;
        b=mP4F41FKaTjn01G4CXa2NCrOLOTrGWxyeKqjqoFLQ8brCoY6TFIrPcY9wd4Yn+WRUX
         WGrQff3Xha1ULINWa1upJ+D1EjT+wRymASyelzh+7DHhMsCS1isZhvp6ZcvzBGvCt211
         9fgVKSF8ib3LfoooafTO66OYQvRd8575DOXCOmmCstfss1Xv9jSqyhcNLSugwFZKYDC7
         c0+n+azTprVI2f1q0tbsgkIU2WwoiuD+3mwu32ARZjK7poBRb205rgsnv8rMp1IS+87W
         0StWIs7HS+cG5qfqp1RBFHEPoNm8q+fGg6kh6YGG5LfZPle5yZ7A34urx4rJN3bO9Kmg
         n1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/yNwzNgUI9q7WkupLYdhg2+ej2Z6eC0xOWv07WDw2oQ=;
        b=UfOD3vWuD7gD1xZw5+szHtez9itcxnSzSQo4KHWhSv8LCSz7L59wiOT7E/OSM1FPRa
         oWKIBP0eXvCjRcZJGcRpjmWiQcbWZmsZbC9yCojukWmGTcAELxZfR49K8fPDZWoJVqME
         yCrncgF9t12LtghyEaOQcEyZwPBXGB/bsnMKAi6pgfhBX2o0PiUurLSBn77vsx7v8nx0
         QicxxPBxmM23LRcwaEEeHiG4OSXgKSoOohKvt9uUCaOtUI7PIgRyGkvoIGgE1MBWjr59
         OCkTyBNloOFLTmjFboZhNWNviw7MDja4mlbnTtfiTzw6xsHuAfq8YBr2C8j6fdSnkwNU
         +1wQ==
X-Gm-Message-State: AOAM530DvCNsAuJy3B6uwIsdRwhqAvw216rZnmeVg8P/V/2BtP2inAit
	06UchuAWqK5pUbMFiDX/vXxw6/duVa0=
X-Google-Smtp-Source: 
 ABdhPJyB8KMnsndxW+80fVqCAr/Yjc05Oyg6+iTiLSFKF17a1azIb9OsAgPWbK0+uA4TeEkDCptRJg==
X-Received: by 2002:a17:906:4116:b0:6cd:1980:5ad0 with SMTP id
 j22-20020a170906411600b006cd19805ad0mr3051875ejk.595.1645114208882;
        Thu, 17 Feb 2022 08:10:08 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/28] vala: upgrade 0.54.6 -> 0.54.7
Date: Thu, 17 Feb 2022 17:09:32 +0100
Message-Id: <20220217160939.1424397-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161838

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/vala_0.54.6.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.54.7.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.54.6.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.54.7.bb

diff --git a/meta/recipes-devtools/vala/vala_0.54.6.bb b/meta/recipes-devtools/vala/vala_0.54.6.bb
deleted file mode 100644
index d1202b83fd..0000000000
--- a/meta/recipes-devtools/vala/vala_0.54.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "49d60d96a3fdf6c4287397442bc6d6d95bf40aa7df678ee49128c4b11ba6e469"
diff --git a/meta/recipes-devtools/vala/vala_0.54.7.bb b/meta/recipes-devtools/vala/vala_0.54.7.bb
new file mode 100644
index 0000000000..bb38252cf5
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.54.7.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "62079ca1ff02e5d17ae72aa9a5adc61ae6afdcfebb0d9f06063a36efbeaca0c7"
-- 
2.20.1


