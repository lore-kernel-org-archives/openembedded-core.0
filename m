Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7C0C5AD5A
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 23:22:19 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19010.1786317730701303505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 16:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dxj/P5cF;
 spf=pass (domain: konsulko.com, ip: 209.85.215.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so617643a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 16:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786317730; x=1786922530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdB6fbDpc76w3WyzN9BGzqmi401GqtQR4BL67ko8JEM=;
        b=dxj/P5cFAbyZvWDAZ+1S72xhWqgbLTl3oL91dYP2JUYc4NHl5B/kxb8SDcxV3E0wGC
         Vhw/Q0G7LuC9X1XpJrZ91NV6mLPiIKjlmDdfgcT7Zp9LAsdQlQxYWWzIFCSHmhNe+vlA
         1kLZZ7v6+4wySXH8C7L9M4yye0pNBEPEtMJjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786317730; x=1786922530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdB6fbDpc76w3WyzN9BGzqmi401GqtQR4BL67ko8JEM=;
        b=nI5sF4TKu/qJcm5E7a+WOJnwBnE1zn5brl6OSiHxLt9G1s2v7Sw9bQQQycZOlzH7cZ
         +J4s+IXLyaTzfKSyluloDYKSSKUFvscxwxvLGPJEloA3lcX20pSbFhJr0FlAlPfMUIdj
         +Kub3NqPJ/9Yilg4NgDClQ/vUE0eL/oSMacUlx3Cb+QhhgdZz8ZDiJz5pVXRc7M5DXFK
         QDdz6mVehHm5OMFKzfQ8HoCORCrIKTHMI4GIBMYD+9H3wUMmLY5puf2rQWgnbps7I+P0
         +9SjBe7/fLpzs+1X96s0yfohKXLPGXS0z5eFOg2rnZjIGaE3aIK8IRZr9Dln5k+mDHbx
         k5Hw==
X-Gm-Message-State: AOJu0YxkHAUeXecW89Ba/AWZCfdrZR2CFDr7323EtB36epQj/bJyoChd
	L99EubAdcM9XxAH3pLwO0n407+WYhvZT+Lx1IaJIsZYoZqEz9macriaJihHFr8YX+oi6DKX5sH2
	ujkZP
X-Gm-Gg: AR+sD13qkULzOHLoUI1tVFH+HAhXgkpoFioILPRG1PqopiwwThBrP/WeoK98qZFXlui
	NT3kbx4la0kL+28xaR7m4IgFq+uYaPHPf1rw476nadTgfalq9rfTvjm/bO7GIwBAShtrYiQxytQ
	po9q5CRLfLFo/eah7HRYSBDw+oekdwO3AYPTKKKWDD9v5EdY9efckRM4ZLBnbpwxEjCOLGmePjN
	GPCBkZPS8bcINieeDkQgFuxAQZsUM/gDvhsrD7yvlE8PbA0LRQFSbB3Ipeb4DHXAp0/4HX+hbyO
	0qwaKn+lnlyxukkddXQAwDBHDqCccgXRG9Joil99oY1HK47E8DClijWmSLSioTy+6HE+nTYKNdt
	8wprNxprGdMKQ/mnO4qb88ovMKq/ZtAso9SgsxdGnQLn6DChekoSijP/8uW+osoE49y2r+Bylpb
	k6qwiIz83kKDeu9hYsPHemrPemWjOA2ZEIw5PPT/ZDsLlyFQShYh4j8iV31sVRlcj3vPUr1lseP
	A6XLw==
X-Received: by 2002:a05:6a20:9c15:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3cbada680bfmr31121748637.4.1786317729854;
        Sun, 09 Aug 2026 16:22:09 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6f86:9ad6:671d:ec76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af992sm2950850a12.14.2026.08.09.16.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:22:09 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/5] python3-babel: fix CVE_PRODUCT
Date: Sun,  9 Aug 2026 16:21:09 -0700
Message-ID: <20260809232107.367378-7-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260809232107.367378-3-tim.orling@konsulko.com>
References: <20260809232107.367378-3-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 23:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243085

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-babel (2.18.0)
Before -> After: python:babel -> pocoo:babel
Newly caught CVEs: CVE-2021-42771 (locale .dat deserialization RCE)
Status: patched (fixed 2.9.1)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
index b0abb2c62e..26847372bf 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c575093
 
 inherit pypi setuptools3
 
+CVE_PRODUCT = "pocoo:babel"
+
 S = "${UNPACKDIR}/babel-${PV}"
 
 CLEANBROKEN = "1"
-- 
2.47.3


