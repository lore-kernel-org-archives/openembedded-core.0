Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3D0C44527
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6025.1784381121320951972
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NgxvYvHr;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso21558875e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381119; x=1784985919; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T6GiYAjchL09AVrcE0l8FsvmtUl2THbzg0fs6+klk8=;
        b=NgxvYvHrB6k5qQyMfqsgr0CxLEQQibRFqP/Ba0FzcIfI0x41GcFBdJyO5yU0qHqja6
         1lifd5+puerokQ8ZgAlmYwK9KR3KHlJMUxeEde0z37f6EhI3K+ieppejUWlOVyO3wJ1Q
         OBFK7LfDjl23OKPvnHkX/ARcyjECDnQiivNDEk2E1HSagswTa4fapiqhjrnSY1fPsNFX
         Gh8si6QRbED0L3GtVUFb8j3KEy+SGZaa9ETuHk9xbj4dV2Tu5WCiDFlL8b+acwlArRKW
         ieo9nwDhkIp4ZPN3sATOizmohFzODL9+Hvm3U5bBAE5Ln6jtV1hzo7jscOqaSs2cwBEa
         ZcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381119; x=1784985919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/T6GiYAjchL09AVrcE0l8FsvmtUl2THbzg0fs6+klk8=;
        b=C0peUh5rdh657yzwqFKYsIPVeDquNC2WR4dIHUSbIZW4VdGCC0aEEA0wMsM4RiaAsX
         V03YtuIaKPAH+aBRhmiM+QJWsLoTbcFTFQXThXjZitdyCz35o42hEXKGpndOs/egVzfF
         0DcwHVjuDELZ+0FgXWxisbdF5Zv1ESScMIR6DPOkugS7tKHro5X53Mjc9TbfBHKd7JvR
         puKiA7NfeBR+6Ttzp2dtRmRSBORPM5fVqA2xrgWFCiK7LlmGLhmfktgK1aZK+ePGO2/K
         JokjbqWIm5Aw8vQznUmm7mVU5Zu+aZSUYtKWBbDwO0917U0vbhGMwKqBtVCRuVvq+dd+
         e3zA==
X-Gm-Message-State: AOJu0YyosWeNgXFN0G8q+VvcW2gCONGT70v1l+AxKdPTP5lSOYGEqXsO
	mrkBGnJX2k6yZmQAu1kF4Z8YVPhE7JkWi+VrGm7A+Q1LL6taqL+uyLz0MRzhmA==
X-Gm-Gg: AfdE7cl4X6m28u9LDcL9xQ4Rsc1Ib/hkQ02r3rYHE+xjXs484GWmDkWtWopJzDmVp8O
	CK6moZe4UekmQVTQRIMcAF8fT9xXOeX65UNI5kEfAXzAn8Iz/XZDhhgtBTyL3BPOcdpMkQqvdY6
	SPiomPlpffVlhuKrgaayZqvqNVPqHNTUplU2hHBn64jWLV1QZT3EJBYqi8PAHedBF7UxfimI5S8
	xB1X8T6cb4Cy95hy6KyPb4V6Ul8+3jhG8066fBxU1fbZ35UI/v/kVwC51Et39EJY0BJg15hi5fl
	7EquDTTcub8KKyUfOuFZNpn8U2pEBbz4luJomV1V5s6BB2K9FbK4Q2ppz6cp3CG+ykdOB/qilfI
	iHsThYRvwt1CckIb+UpfJqAMOjjolHRE2bLsAd1Y6fcGDCqcH+/X6/CXBEeU47seNhK1wt6RX0N
	31VIpmPATu
X-Received: by 2002:a05:600c:1554:b0:495:3de8:33a6 with SMTP id 5b1f17b1804b1-4954a3dc7bcmr80193345e9.16.1784381119342;
        Sat, 18 Jul 2026 06:25:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:18 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Jul 2026 15:25:08 +0200
Subject: [PATCH v2 2/6] cross: add 'extend_recipe_sysroot' to
 'vardepsexclude'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-extend_recipe_sysroot-v2-2-b7cbf35d00ec@gmail.com>
References: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
In-Reply-To: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=812;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=bpQb3JfGSpwIKrfaXdK4Styo3jq8H0fbkgrK1KhhSwU=;
 b=5UTpxkgMDxeMbG11W9SCMyIP/UZZAg3X/bCKUbPE9PjdCdAx7xYsPsE+VcL83m8TGUYGBDb8F
 8WpVLPEiKGRBBKNBTAQMxpRQZiGNhzq14IogWkJxs+kZrx9Nie8UXuS
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241260

'do_addto_recipe_sysroot' did not declare this explicitly,
but made use of the fact, that 'extend_recipe_sysroot' is
ignored on the base hash level.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-recipe/cross.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 82a49dc8f5..bceee5d6e6 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -98,6 +98,7 @@ python do_addto_recipe_sysroot () {
 }
 addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
+do_addto_recipe_sysroot[vardepsexclude] += "extend_recipe_sysroot"
 
 PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
 

-- 
2.43.0


