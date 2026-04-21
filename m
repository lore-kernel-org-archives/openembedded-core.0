Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE028F89256
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:41:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22301.1776768112569851182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QIj1WqTI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso12840985e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776768110; x=1777372910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcrfMoNG5qMWeu4LuMbvRUNKlPt4IDS2YnmJCSss3jg=;
        b=QIj1WqTICiHshOJyg1mPt7heEvGpd43wo5W3Ldc1H3rrxt3UV+zvptamgn8itEEm07
         XuG/2MYc/bUBzTfkuKxMJjY6r3oPbtNG/k1yCL3PJFdR7iO2t3oCQK4rxeoHBQ9imXIp
         x3HwHGhwSzG8Jor5aqLYMOLm9IXx4+BrTAw70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768110; x=1777372910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NcrfMoNG5qMWeu4LuMbvRUNKlPt4IDS2YnmJCSss3jg=;
        b=oY965w63zAiiCIAKEC59GFxdxHCK2bMJkb8wJF6jmyXJNMaob9KK8Deg/h/0BYBfOu
         +QLKsLvrcQfAiTNUA5bUM23ooq9xdMl8KbkdhI0S4EC+S/yQ8d9fW9XWoOazpzVj7qJn
         +nKanbS3bwdIYXc0tImq8ck0tuPDy52eL/HG2XMhhzHd9hSzglYEe7nawCJpphjebmt1
         /PXBPS21TjKHG33mfoVneMfrbS3ufHqaPLnoWruPPSm4oE0fEXDp/5EyeH33l6+BJwQ/
         RrR7UpW0lZTMZvAZWlevPSRRbnvAijlQtPzIphfwaFTpTKW/YTaI46Ft3VDktzAbGPv1
         vw4A==
X-Gm-Message-State: AOJu0Yz+qXOCHIu/6BMZEPco3jRSW3MKjTaqqjHH1WkYdh70bnr151q/
	CF2e6vRflAcocmN65NMHJkHOfCev7LJD54dCcTMco3XAE/Y/ns5vntuFolfaoBUdc0ezroOX3lc
	beNWjofM=
X-Gm-Gg: AeBDieuw4b5Ruy0uCx7PYKg95hEUHi/kkZCulNnCZniHaT40XpEJTJ+FiPEZCEF7sh9
	UjsOoK9NMJkyANdBNPDxLFMQuLRrGfOTuS2fj2tEgs1zqkqEdLyaMscryDz7BdnmKAoIH/kKThB
	KEsQzw6YNztnGJmga857QP1FQzy/mWAoD4aKw6XTzq2nk67k+fKjNu9rK0bOQ4wOQ9hz0i9XI5Z
	s16TU6MzTUZv78rhlei6d86E08Mvyycoh4MfpgvvUQoySqL9FnJAOgh163+ctFZwJN/2aciUy4E
	uxBG4aAJEkj3VVOXhKNNwRKlEIAbCToVzmjjU5nQnFCxWA128gAmdGwOENbu4f6iUG+GJk3nxKP
	Enb7ze3MvlZXZr7ZB6tdqnmBwb8yloLie6CeAEFDS/YNwXhq+E34XWDO7U4qGUE8evuYLUKXnzq
	gMoqSXGjWcMkfxNo48ActPladoLPuQnIiFtDnkixK5yEvsCnxuKnKiE0x87v/Cikg=
X-Received: by 2002:a05:600c:628c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48a52d48985mr73954165e9.3.1776768110136;
        Tue, 21 Apr 2026 03:41:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aba4:e0e8:1cef:1732])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm163759995e9.3.2026.04.21.03.41.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:41:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] shadow: Disable tallylog execution
Date: Tue, 21 Apr 2026 11:41:46 +0100
Message-ID: <20260421104147.1994119-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
References: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235664

We don't want to be calling tallylog from our native tools, disable it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../shadow/files/notallylog.patch             | 19 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.19.4.bb |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/notallylog.patch

diff --git a/meta/recipes-extended/shadow/files/notallylog.patch b/meta/recipes-extended/shadow/files/notallylog.patch
new file mode 100644
index 00000000000..94773ace2ba
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/notallylog.patch
@@ -0,0 +1,19 @@
+We don't want to call /sbin/pam_tally2 in the native tools case so
+disable this function.
+
+Upstream-Status: Inappropriate [OE cross configuration specific]
+
+Index: shadow-4.19.4/src/useradd.c
+===================================================================
+--- shadow-4.19.4.orig/src/useradd.c
++++ shadow-4.19.4/src/useradd.c
+@@ -2046,6 +2046,9 @@ static void tallylog_reset (const char *
+ 	int failed;
+ 	int status;
+ 
++	/* Don't call /sbin/pam_tally2 in native builds */
++	return;
++
+ 	if (access(pam_tally2, X_OK) == -1)
+ 		return;
+ 
diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-extended/shadow/shadow_4.19.4.bb
index 9fe6a27e411..3ab9ae9c287 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -25,6 +25,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://disable_syslog.patch \
+           file://notallylog.patch \
            "
 SRC_URI[sha256sum] = "ba7e9aed1c5420203ac549583d6e6f485a819ac7505af9c7cd8c13b2013210b8"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

