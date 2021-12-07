Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C1FC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.66653.1638882438998448645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G3Llwm+k;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u1so29290772wru.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ZLRoYn1wrDVRRNGz6101oItSIDudOUCf662VaNVkRs=;
        b=G3Llwm+kTqVUGFHJ3tx/HUT1Uv61I5gS6uxLKw3K1QeDlRoukhT3iNHF+NLG4Iabpl
         NBUGBMZzQT7yeIDfRYtVA7qJFbVHxKOOOIXV02czwIkBgst7mb5FsyLD/31ky8RwMOv4
         EMCc6OdRIlT4rPh9UBc7d8sdoSTBUxaGlSwKQ8QmSIXwW23yZko644HvfGalzPRc9/Hs
         QHcOee6rlPHS1m05qBzAWR3MuS17NvJzUKyyAp5JIkZF/u1suGs3t0+HTVkhpTkcBxvi
         MF03d/ABBaoTYIW2ZPeH1TeY6Hk4TQZF5jCR/JZ6HohGrRVD9cNi2TK3UZHi6v2ztWRP
         E04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ZLRoYn1wrDVRRNGz6101oItSIDudOUCf662VaNVkRs=;
        b=5VTio4o1wJGKZ9Dg7AxJjG+gW6l1/3US9bFsHIb1EIC7e4dHXIrRMy470Ln+KRgIfL
         uqcy2JLGQpGWWmtkAtKqw03bXcQY+mhELgjzzYssmaomwoTN9edWmAqzwniFFJJYu5rE
         pj2GNEWx9MPs98NHp/V1qJLu7figpalMdY/RjvUNOU6nSVZgEaTiujpqfJI03RmFzS9P
         CW5qjbo/p44C6Xgkn+vVoDR530IwS1xB0dFDPlmCkXudlNN14jU30QAHWdvAh5NDqvhT
         /WQv9htKNkDTTZLSErOYEWDQNrOAP5O4XJO+y1CDErkaWIXCxNdKrD0f0xrAlP7bJRJu
         6Vxw==
X-Gm-Message-State: AOAM532KZusDiPnmraH+IbfVykbsVOEJJNpuVY4y4OhnQFp9uPoPb/FB
	xGfPxUQAAGj/YdP05C3PL74dSGyH+pA7Uw==
X-Google-Smtp-Source: 
 ABdhPJwlHu4TdU9kv+sUx3K99qdXWb2fW6JgKmrKzYHvcq3h5RykPtgTgoFMyqGWt1RuNoeMwvDJBw==
X-Received: by 2002:a5d:5445:: with SMTP id w5mr52542618wrv.163.1638882437624;
        Tue, 07 Dec 2021 05:07:17 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/16] git: upgrade 2.34.0 -> 2.34.1
Date: Tue,  7 Dec 2021 14:07:00 +0100
Message-Id: <20211207130703.3196805-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159298

The issue with COMPUTE_HEADER_DEPENDENCIES
has been reported upstream, as it causes build races:
https://lore.kernel.org/git/20211207113101.69686-1-alex.kanavin@gmail.com/T/#u

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/git/git.inc                          | 1 +
 meta/recipes-devtools/git/{git_2.34.0.bb => git_2.34.1.bb} | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/git/{git_2.34.0.bb => git_2.34.1.bb} (51%)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 9dd2cf4549..1d74270fdd 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -33,6 +33,7 @@ inherit autotools-brokensep perlnative bash-completion
 
 EXTRA_OEMAKE = "NO_PYTHON=1 CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
 EXTRA_OEMAKE += "'PERL_PATH=/usr/bin/env perl'"
+EXTRA_OEMAKE += "COMPUTE_HEADER_DEPENDENCIES=no"
 EXTRA_OEMAKE:append:class-native = " NO_CROSS_DIRECTORY_HARDLINKS=1"
 
 do_compile:prepend () {
diff --git a/meta/recipes-devtools/git/git_2.34.0.bb b/meta/recipes-devtools/git/git_2.34.1.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.34.0.bb
rename to meta/recipes-devtools/git/git_2.34.1.bb
index fa9299b494..24081764a2 100644
--- a/meta/recipes-devtools/git/git_2.34.0.bb
+++ b/meta/recipes-devtools/git/git_2.34.1.bb
@@ -5,6 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "0ce6222bfd31938b29360150286b51c77c643fa97740b1d35b6d1ceef8b0ecd7"
-SRC_URI[manpages.sha256sum] = "fe66a69244def488306c3e05c1362ea53d8626d2a7e57cd7311df2dab1ef8356"
-
+SRC_URI[tarball.sha256sum] = "fc4eb5ecb9299db91cdd156c06cdeb41833f53adc5631ddf8c0cb13eaa2911c1"
+SRC_URI[manpages.sha256sum] = "220f1ed68582caeddf79c4db15e4eaa4808ec01fd11889e19232f0a74d7f31b0"
-- 
2.20.1


