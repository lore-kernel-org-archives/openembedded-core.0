Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B712EC071FD
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.19247.1713529198203137340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=StxPXvgq;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d717603aa5so24004511fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529196; x=1714133996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWLQtJPk9SIrfIhVoGYy2yf28noZsdWps1iyfgyGjtA=;
        b=StxPXvgqiGih/5OFVUZixZsjWBu6YdPldOujsL0up6QgZCrvd3xspmPM1UolxQ7PIp
         usvZLFSxFMhEOWWvP6dnB5oca7r4giRugJKRly1/pxaTLsiqODcKJPztcBVfEUaG3mSQ
         s3nBmDAWeY8a+crnR1xfitHy4ho2fNCfnW31I3p2VN1mfA9+Vs+cEUOU8ZsrYzMhn/UK
         T2d/uirfJ3p1+0Ir+DdXUJKEEuF6y4vxm3TNRnaQugVDeuXdnUaRlbx3P4+mWuAcrQ+J
         hYUcWtBhRi8GIJI6MpcY/HtOplYbTU/zU1dPV1peyoA/yoqnEhr4oFoZ18xcR9i9OxWO
         sAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529196; x=1714133996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWLQtJPk9SIrfIhVoGYy2yf28noZsdWps1iyfgyGjtA=;
        b=fCG3Q3Ld0wvM64SsPzABoeYIfaUqMS53wF5jvC1ohEde1dO/q0pS3oXNd3vrKHfQn3
         MDbTPAi9tfFJCaMB/olYaTOzTHAKbjZeL0pD0MRyr+oizoBtDZj2XFCjV8880pRz6eT0
         XphNoiGynpPwL2zkf/GlZQJpJ9aUbC6cwMUbrILSPVo5GHtq4uglmnzwRNRhxIFex92N
         2tPffSbXPevCftKAqSMiw2/pf9hCdkOAN1N7V+8Fqkcu9FuhxCyYjQtmmMW+l8hKVC70
         ysWQ3g8p+KG8igNCKMfIwPuX2q61WLC8PuGTc4DZNFxoaRU8srGNZxGuUi534miTN6Sv
         T2xA==
X-Gm-Message-State: AOJu0YxZrNk5cPlbPnL3jiIxaAn6iDvifRxgm9GEekJCs0f0ngjwbgzi
	TJflvkXwzNfxjAVBwAv+Y3i0xdaYmF2n3DI1LSLhfk+uRJ9jSVUq88YXlQ==
X-Google-Smtp-Source: AGHT+IHLagcdTwMOW0S2iAxqTzLq4ebJFuBnKQR23lqd7S8dDtWd/1YKY0sB5tacR+mawfpQxL23YQ==
X-Received: by 2002:a05:6512:128b:b0:519:569b:361b with SMTP id u11-20020a056512128b00b00519569b361bmr1934065lfs.63.1713529196072;
        Fri, 19 Apr 2024 05:19:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/19] icu: add upstream submission links for fix-install-manx.patch
Date: Fri, 19 Apr 2024 14:19:37 +0200
Message-Id: <20240419121945.1920944-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198539

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/icu/icu/fix-install-manx.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 7526bde3702..16cabc82643 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -11,7 +11,9 @@ and one process tries to chown a file that the other process has just deleted.
 Also install-manx should be a phony target, and for clarity use $^ instead of $?
 in the install command.
 
-Upstream-Status: Pending
+Upstream ticket: https://unicode-org.atlassian.net/jira/software/c/projects/ICU/issues/ICU-21172
+
+Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/2966]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
  Makefile.in | 8 ++++----
-- 
2.39.2


