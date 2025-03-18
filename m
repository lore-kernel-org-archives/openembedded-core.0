Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5038CC36002
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.2939.1742323137077817053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MuNdsGit;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso5160155a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323136; x=1742927936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=MuNdsGitRuk9Qw7FH7tnqEoGeuo2ych+qKbNLMyrXq4sUxKnouc4rwKruYbiKXP/JW
         K+8YXJHGhPqFgUwZ8ROXvqFpS26oKeEAPK7A0siRw0st3xW4uM/BxwoAImjzAg+eSGl+
         F4B4JUEJaLLB9gSkTbQik0GHCNJkSvytHI+JNUMWk2sHVbbxPIbRqf2T+wgGY0l6NRCv
         R4sjFOIYH+hy+wvFEj1YZItWDwrIwzZuSwtouDeFvLq0ly921MYNPAge5FBCdluofKj4
         aSVg78szoRa5NpyjtuHjbly+vctI5mRya3darYXgubdiP7zGXyD688QPqlLQkHiZQ9V5
         Yc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323136; x=1742927936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Not2OL6jS1+oGzZ+d3jIQHLqET8KaVvwVrxHBriJkpg=;
        b=OCKs1TYB3oMWt1z8bAvNzM4SrPpd4NdVGzxs+vBpssdpcVN81f9nW+DquVxKfHowIA
         W8PnzZP/FmhtF+JYKG1N027lZ3PxemYvtsqn58KhvLp+Y1vzrRoz3mA7TZalvxLH+tXR
         og5EXA1PK4yM66p3bo2FsMxALka4EINx02NUN+NK+hVhPkSh+yzslaeqyEVjMFO3Cb+L
         ZMnXAiYna4pk8p1j2lGyjx79AUeLCuwF5Kxgw3mwz3tb2SMjfP0WXHPR0TpoI/nSJgKR
         zrkavINfFmyQAU/p8qDMNC2Nm1WRRMe17w4XDImjDg2U8TcqVtFENQUnoSkavlk17cGg
         FlMQ==
X-Gm-Message-State: AOJu0YzS17tCxZJLb91vv2x2BxSCyLiVZIQ37EHez1sFlX30tmJlQAaK
	CNJIv0jnHjDp969hjisK5TJI8m1NjP36tl0cwgEVzNZtVCcpdEuqvPIzIbPk
X-Gm-Gg: ASbGncvtlux1tApipkTmWSVWP/4nO6qXK/lKDPzmcOD2THgvXpFeRoF4hf72kR0vahF
	cJLNrTimZSmruB8ChK+AmEw24tZEeUzzKxD7umAKcFLwsWx4zc9TGoVlaUPXNXXtkfvMdb1EM3k
	l7bF6YmL4eLss8hqtN5pugT2gejvfv7H46bw0mKTST/4g/2zt+tgpKY4yTqeQBLzx5zJLoY5Uvc
	xhD/+OCc8CqD4oOlBPcKYfTJKqXH+KKc3eZXHnU83Ykpz8GWQzieN3yC4DoUl1RB+6+M9IT8ryV
	3Lx1hfMgHDONJAN8zdt9xduDsXE401GA9mOz
X-Google-Smtp-Source: AGHT+IGOqYv1tY/vBMQXM12tkhYliN1rP6ci9YyM82ev6q+6r6zdnesZgD4Ovj4LeZqDCaEi8YiDWA==
X-Received: by 2002:a17:90b:38cd:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-301a5b12eeamr4774763a91.11.1742323136269;
        Tue, 18 Mar 2025 11:38:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 14/25] libmatchbox: Fix build with gcc-15
Date: Tue, 18 Mar 2025 11:38:29 -0700
Message-ID: <20250318183842.2256284-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213240

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index bf3f5c005d9..e99b66855e1 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -15,10 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-#SRCREV for 1.12
-SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
+PV .= "+git"
+#SRCREV for 1.12 + 1 patch for gcc15
+SRCREV = "312c04b6ba60dca0d6c4a7d1393f0ec816a265e3"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
-
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig features_check

