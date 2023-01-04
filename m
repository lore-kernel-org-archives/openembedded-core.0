Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6244EC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9355.1672830361153102525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PJo2hF4b;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso15935273wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O372yazS3Qk2r9rACCptQ+wyMaCGAZKcXz/U288C+bk=;
        b=PJo2hF4bO1wkeUt815WXamCT1sPlOXuZ50itqRzZcdXh3gSuQBUiz6T8fByZZZ6EJV
         z7Hvz55o23BkkV1EYSPgO21GW1d8kMnCtHwNo6I27MPe4TrXit9CePoqCB/CrdnPvms1
         M44NUmlnhuCg6gm8Af30bRM8K1rGc/ZYJJ0R8LzVN1e5y94/hdh1cDb817a/z/R8InOU
         zuDcj+6RIAfW02Ywx64YvF8i+Wg67Oc2wcis5Q9Z9fYhmoLXQZyGJjcQOBPLDGrs3Asc
         WnXxrrGHPcvgsMpjceHc3qDluXOPNxzXkpAHSimFdQ3CNjw3W70xafOuJTQvQ1e0e4nR
         t1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O372yazS3Qk2r9rACCptQ+wyMaCGAZKcXz/U288C+bk=;
        b=digiqc1Tmf9EOKmPcK1iaTk1Y9s2fFB13AOgCola3oyIvthNSc1zyUBslgCqCDRxyy
         lzr8wRva2fm3uHAt+Ep+q4btMmQZXNwZ6jaYlEXKmdfAFTiCVNiO+s6VWGE+kQaoBWFT
         JgOnFki1WV7qSlXmtqYDSfBsWYXkcg9b8CAW1C959fPGxvEM4pFFg5z2lCPDB23dur+V
         cYwDMrN88hzrJjVAvn3bYVXG1AkNtUSQGTU27TuACWIFfMpWsCnTkhZWcAXZh9xaUj5c
         Cv20FJTRdAjhhY94ZwAvY88w+E5doH4L5jWLAB80pkii1UL1i5/uISIaMWZQoGwcvpyb
         eZTA==
X-Gm-Message-State: AFqh2kqqF7FIXvZQ9k9p3xiOgS+bx50EcmGMEpFW83/iATKajGBp5gja
	+R+DYr5Ns68a5nm16+xAm1bc+tf5N6Y=
X-Google-Smtp-Source: AMrXdXuRvMBBjby5Wvwu8zIVUTr4lfdZxAtx2F98l/r/Ebwrt1MmNp83Ufe+wC7A/LWi49OTkafy1w==
X-Received: by 2002:a05:600c:358f:b0:3d9:7847:96e2 with SMTP id p15-20020a05600c358f00b003d9784796e2mr24200513wmq.2.1672830358471;
        Wed, 04 Jan 2023 03:05:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/77] libva-utils: update 2.16.0 -> 2.17.0
Date: Wed,  4 Jan 2023 12:04:38 +0100
Message-Id: <20230104110548.2537259-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175393

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libva/{libva-utils_2.16.0.bb => libva-utils_2.17.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.16.0.bb => libva-utils_2.17.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.16.0.bb b/meta/recipes-graphics/libva/libva-utils_2.17.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.16.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.17.0.bb
index cdf4d79dc1..c5a563b853 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.16.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.17.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.16-branch;protocol=https"
-SRCREV = "cdf39e1e3da85a91ef53438c3b6a97e77dda96aa"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.17-branch;protocol=https"
+SRCREV = "42c02a6a37b1bfce91a7f15c898750f2ee9e3d6a"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.30.2


