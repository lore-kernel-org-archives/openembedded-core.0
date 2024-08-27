Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18699C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.70876.1724736246482639378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EOhm6m4M;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a86a0b5513aso410826966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736245; x=1725341045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecruwfOp8jQJ8aFM2uAPgRPNRd1xcQmt2/bFI5WyiFg=;
        b=EOhm6m4MnB2OPdOI6pJPcujic4zJqpc0TCmq0Bauj5ynZ9t19nTZlZ+i3CKzouNF0Y
         FYsqa0c3K1AW1wtTDG9a2Qr3JA2jZLl0y0TRfolMelHgQAcWa2igxQt5rSD2JSqXv7sU
         TnSzibvaf9cnnOOgJZQ8VboGitAiZR6s2Y+iHQZEuKAJWS7lo/OqIVNRPINdxNdFHbFh
         V5DKKALFUbY+D8KSjn/XoyExt0HdquxfTMm+h60UV5kFIyUrjYDCx6qmPb0c/QuUzFn6
         wJUBMjjMSEWJrNYHBBpcHco/F/+8FL1fGNCLYXBTTWKamubfcH+NbQbhAZVs53RjOcsd
         VbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736245; x=1725341045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecruwfOp8jQJ8aFM2uAPgRPNRd1xcQmt2/bFI5WyiFg=;
        b=YgWzKTwpQIPvYu7+XTtzEwgD5m85Dh7VzOmhzdqIP0Fh6sAH4F3/sphBXn8vHPhR0d
         Vp+2X9J0HcqVDv8DYGCNUFb3DKEKCavgBhPXlO4BccT+dr2vH3PCDnyEd+NOGaeMg1z3
         oAb9TI7K9cCgWOixvDjN0OfEx6SCplrPPTqwEHENXDYchFRBwS5DvAPuFG9+zQjgGw7V
         v/qxtcR4QC2gVK175Oobd8OXhs3fC4U5/LPeODn+n765BApi0FLChB+irAwaoGXe+ASx
         f/NjP7VPEujXiz163npIBuws48PB2nawXSS+9HGxISD1LhgPChTxXrNUVCc4egvH9/oS
         a6TQ==
X-Gm-Message-State: AOJu0Yx4w+7V8CtHXuNUhYZ8ZH7eDij/uN0u9dIOovrJ7clummywZYGm
	Z49tjiFw7+e9PutwNw5LzMdD3OWXCXOJcom5miLjotQSc/8+myPm+m2SAg==
X-Google-Smtp-Source: AGHT+IG9PNgDg2RlKHSKtoWXeqbkE5Wf6FQ6QaLpDH+qp+YDAFy5G3GJFqJP7QOB6tP5l/H6hDnKaQ==
X-Received: by 2002:a17:907:f7a8:b0:a77:e2e3:354d with SMTP id a640c23a62f3a-a86a52b66e9mr903533066b.23.1724736244564;
        Mon, 26 Aug 2024 22:24:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/34] python3-license-expression: update 30.3.0 -> 30.3.1
Date: Tue, 27 Aug 2024 07:23:32 +0200
Message-Id: <20240827052354.1319810-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203788

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pression_30.3.0.bb => python3-license-expression_30.3.1.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-license-expression_30.3.0.bb => python3-license-expression_30.3.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb b/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
rename to meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
index f36336b592e..edf7ead2e42 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.3.0.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.3.1.bb
@@ -4,9 +4,10 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "1295406f736b4f395ff069aec1cebfad53c0fcb3cf57df0f5ec58fc7b905aea5"
+SRC_URI[sha256sum] = "60d5bec1f3364c256a92b9a08583d7ea933c7aa272c8d36d04144a89a3858c01"
 
 inherit pypi ptest python_setuptools_build_meta
+PYPI_PACKAGE = "license_expression"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.39.2


